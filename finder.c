#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "context.h"
#include "drawingAPI.h"
#include "message.h"
#include "bitmap.h"
#include "finder.h"
#include "windowStyle.h"
#include "clickable.h"
#include "fcntl.h"

#define WINDOW_WIDTH 600
#define WINDOW_HEIGHT 450

#define BUTTON_WIDTH 32
#define BUTTON_HEIGHT 32

#define TOOLSBAR_COLOR 0xc618
#define TOOLSBAR_HEIGHT 50

#define ICON_STYLE 1
#define LIST_STYLE 2

#define ICON_ITEM_WIDTH 100
#define ICON_ITEM_HEIGHT 95
#define ICON_ITEM_GAP_X 30
#define ICON_ITEM_GAP_Y 20
#define ICON_ITEM_OFFSET_X 25
#define ICON_ITEM_OFFSET_Y 10

#define LIST_ITEM_HEIGHT 30
#define LIST_ITEM_GAP 1
#define LIST_ITEM_OFFSET_X 8
#define LIST_ITEM_OFFSET_Y 3
#define LIST_ITEM_FILENAME 40
#define LIST_ITEM_SIZE 200

#define TAGBAR_HEIGHT 28
#define TAGBAR_COLOR 0xa514

#define ICON_WIDTH_BIG 50
#define ICON_HEIGHT_BIG 50

#define ICON_WIDTH_SMALL 20
#define ICON_HEIGHT_SMALL 20

#define SCROLL_UNIT 30
#define MAX_COPY_SIZE 8
#define MAX_NAME_LEN 256
#define MAX_KEYLENGTH 20
#define SEARCHBOX_WIDTH 100 

struct Context context;
ClickableManager cm;
int isRun = 1;
int scrollOffset = 0;
int copyOrCut = 0; //0 = copy, 1 = cut;

struct keyContent {
	char content[MAX_KEYLENGTH];
	int length;
}keyContent;

// 文件项
struct fileItem {
	struct stat st;
	char *name;
	Rect pos;
	int chosen;
	struct fileItem *next;
};
// 待复制文件列表
char filesWaited[MAX_COPY_SIZE][MAX_NAME_LEN];
char currentPath[MAX_NAME_LEN];
int lenOfWaited;
// 文件项列表，用于保存当前目录下所有文件
struct fileItem *fileItemList = 0;
void addFileItem(struct stat type, char *name, Rect pos);
void freeFileItemList();

// 根据文件目录获取当前目录下所有文件项信息的函数
char* fmtname(char *path);
void list(char *path);

// 绘图函数
void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen);
void drawFinderWnd(Context context);
void drawFinderContent(Context context);
Rect getPos(Context context, int n); //根据文件序号，计算文件所在位置。
int style = LIST_STYLE; //绘制风格
int itemCounter = 0; // 第几个文件

// 事件处理函数
void addItemEvent(ClickableManager *cm, struct fileItem item);
void addListEvent(ClickableManager *cm);
struct fileItem * getFileItem(Point p); //跟据点击位置，获取文件信息

// Handlers
void h_enterDir(Point p);
void h_newFile(Point p);
void h_newFolder(Point p);
void h_deleteFile(Point p);
void h_chooseFile(Point p);
void h_closeWnd(Point p);
void h_empty(Point p);
void h_chvm2(Point p);
void h_chvm1(Point p);
void h_goUp(Point p);
void h_scrollDown(Point p);
void h_scrollUp(Point p);
void h_copyFile(Point p);
void h_pasteFile(Point p);
void h_cutFile(Point p);
void h_searchbox(Point p);

char * sizeFormat(uint size);

//测试相关函数
void printItemList();
void testHandlers();

char* strstr(const char *s1, const char *s2)  
{  
    int n;  
    if (*s2)  
    {  
        while (*s1)  
        {  
            for (n=0; *(s1 + n) == *(s2 + n); n++)  
            {  
                if (!*(s2 + n + 1))  
                    return (char *)s1;  
            }  
            s1++;  
        }  
        return 0;  
    }  
    else  
        return (char *)s1;  
}  

void init_keyContent() {
	int i;
	for (i=0; i<MAX_KEYLENGTH; i++)
		keyContent.content[i] = 0;
	keyContent.length = 0;
}


// 文件项列表相关操作
void addFileItem(struct stat st, char *name, Rect pos) {
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
	temp->name = (char *) malloc(32 * sizeof(char));
	strcpy(temp->name, name);
//    for (i = 0; name[i] != 0; i++)
//    	{
//    		printf(0, "%d : %c\n", i, name[i]);
//    	}
	//printf(0, "copying name\n");
	temp->st = st;
	temp->pos = getPos(context, itemCounter);
	temp->next = fileItemList;
	temp->chosen = 0;
	fileItemList = temp;
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
}

// 文件信息相关操作
char* fmtname(char *path) {
	//static char buf[DIRSIZ+1];
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
		;
	p++;

	return p;
}

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
}

void list(char *path) {
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
	if ((fd = open(path, 0)) < 0) {
		printf(2, "ls: cannot open %s\n", path);
		return;
	}

	if (fstat(fd, &st) < 0) {
		printf(2, "ls: cannot stat %s\n", path);
		close(fd);
		return;
	}

	switch (st.type) {
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
		break;

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
			printf(1, "ls: path too long\n");
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
			if (de.inum == 0)
				continue;
			memmove(p, de.name, DIRSIZ);
			p[DIRSIZ] = 0;
			if (stat(buf, &st) < 0) {
				printf(1, "ls: cannot stat %s\n", buf);
				continue;
			}
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
	}
	close(fd);
}

// 绘图函数相关操作
struct Icon contentRes[] = { { "file_icon_big.bmp", 0, 0 }, {
		"file_icon_small.bmp", 0, 0 }, { "folder_icon_big.bmp", 0, 0 }, {
		"folder_icon_small.bmp", 0, 0 }, };
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0) 
		nameColor = 0x0;
	else 
	{
		nameColor = 0xFFFF;
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}

char *sizeFormat(uint size){
	char* result = (char *) malloc(12 * sizeof(char));
	int n = 0;
	if (size > 0x400) 
	{
		size = size / (0x400);
		do{
			result[n++] = (size % 10) + '0';
			size /= 10;
		}while (size!=0);
		result[n++] = 'K';
		result[n++] = 'b';
		result[n] = 0;
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
			size /= 10;
		}while (size!=0);
		result[n++] = 'b';
		result[n++] = 'y';
		result[n++] = 't';
		result[n++] = 'e';
		result[n] = 0;
	}
	return result;
}

struct Icon wndRes[] = { { "close.bmp", 3, 3 }, { "foldericon.bmp", WINDOW_WIDTH
		/ 2 - 22, 3 }, { "viewingmode2.bmp", WINDOW_WIDTH - (BUTTON_WIDTH + 5),
		TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - (BUTTON_HEIGHT + 3) }, {
		"viewingmode1.bmp", WINDOW_WIDTH - (2 * BUTTON_WIDTH + 6), TOPBAR_HEIGHT
				+ TOOLSBAR_HEIGHT - (BUTTON_HEIGHT + 3) }, { "createfolder.bmp",
		5, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - (BUTTON_HEIGHT + 3) }, {
		"createfile.bmp", (BUTTON_WIDTH + 6), TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "up.bmp", 2 * BUTTON_WIDTH + 50,
		TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - (BUTTON_HEIGHT + 3) }, { "trash.bmp",
		3 * BUTTON_WIDTH + 50, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "rollup.bmp",
		4 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "rolldown.bmp",
		5 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "cut.bmp",
		7 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "copy.bmp",
		8 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "paste.bmp",
		9 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "blank.bmp",
		10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) } };

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) );


}

void drawFinderContent(Context context) {
	struct fileItem *p;
	int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printf(0, "listing complete!\n");
	//printItemList();
//	p = fileItemList;
//	q = 0;
	if (keyContent.length == 0) {
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
		while (p != 0) {
			//printf(0, "draw item\n");
			drawItem(context, p->name, p->st, p->pos, p->chosen);
			p = p->next;
		}
	}
	else{
		p = fileItemList;
		while(p != 0) {
			printf(0, "now you are searching!\n");
		   	if (strstr(p->name, keyContent.content)) {
				drawItem(context, p->name, p->st, getPos(context, tempItemCounter++), p->chosen);
				printf(0, "now you are searching! printing\n");
		   	}
			p = p->next;
			
		}
	}

	if (style == LIST_STYLE)
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
		}
}

char * int2str(int i)
{
	int j;
	int n = 0;
	char *result = (char *)malloc(4*sizeof(char));
	char *temp = (char *)malloc(4*sizeof(char));
	do{
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
	free(result);
	return temp;
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}

Rect getPos(Context context, int n) {
	if (style == ICON_STYLE) {
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
		int r = n / m;
		int c = n % m;
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
				LIST_ITEM_HEIGHT);
	}
}

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
	if (style == ICON_STYLE) {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
			return;
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
			return;
	}
	switch (item.st.type) {
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
		break;
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
		break;
	default:
		printf(0, "unknown file type!");
	}
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox};

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
}

void h_searchbox(Point p) {
	isSearching = 1;
}

void scrollDown() {
	struct fileItem *q = fileItemList;
	// struct fileItem *p;
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
			if(q->pos.start.y > WINDOW_HEIGHT){
				scrollOffset -= SCROLL_UNIT;
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
			if(q->pos.start.y > WINDOW_HEIGHT){
				scrollOffset -= SCROLL_UNIT;
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
}

void h_scrollDown(Point p) {
	scrollDown();
	freeFileItemList();
	list(".");
	drawFinderContent(context);
	drawFinderWnd(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
	{
		p = q;
		q = q->next;
	}
	if (style == ICON_STYLE){
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
				scrollOffset += SCROLL_UNIT;
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
				scrollOffset += SCROLL_UNIT;
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
}

void h_scrollUp(Point p) {
	scrollUp();
	freeFileItemList();
	list(".");
	drawFinderContent(context);
	drawFinderWnd(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
}

void updatePath(char *name) {
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
            {
                if (currentPath[i] != '/')
                    currentPath[i] = '\0';
                else
                    break;
            }
        }
    }
    else
    {
        int tmpn = strlen(currentPath);
        strcpy(currentPath + tmpn, name);
        tmpn = strlen(currentPath);
        currentPath[tmpn] = '/';
        currentPath[tmpn + 1] = '\0';
    }
}

// Handlers
void enterDir(char *name) {
	scrollOffset = 0;
	printf(0, "entering : %s\n", name);
	if (chdir(name) < 0)
		printf(2, "cannot cd %s\n", name);
	else
		updatePath(name);
	printf(0, "currentPath: %s\n", currentPath);
}

void h_enterDir(Point p) {
	struct fileItem *temp = getFileItem(p);
	enterDir(temp->name);
	freeFileItemList();
	list(".");
	drawFinderContent(context);
	drawFinderWnd(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
}

void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
	{
		n = strlen(name);
		if (n == baseLen)
		{
			counter = 1;
		}
		else
		{
			counter = atoi(&name[baseLen]);
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
		printf(0, "cat: cannot open %s\n", name);
		exit();
	}
	close(fd);
}

void h_newFile(Point p) {
	char nf[32] = "file.txt";
	newFile(nf);
	freeFileItemList();
	list(".");
	drawFinderContent(context);
	drawFinderWnd(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
}

void newFolder(char *name) {
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
		n = strlen(name);
		if (n == baseLen)
		{
			counter = 1;
		}
		else
		{
			counter = atoi(&name[baseLen]);
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}

void h_newFolder(Point p) {
	char nf[32] = "newFolder";
	newFolder(nf);
	freeFileItemList();
	printf(0, "new folder!\n");
	list(".");
	printItemList();
	drawFinderContent(context);
	drawFinderWnd(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
}

void deleteFile(char *name)
{
	printf(0, "currently having sex with %s\n", name);
	if(unlink(name) < 0){
		if (chdir(name) < 0){
			printf(2, "rm: %s failed to delete\n", name);
		}
		else{
			freeFileItemList();
			list(".");
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
				deleteFile(p->name);
				freeFileItemList();
				list(".");
				p = fileItemList;
			}
			chdir("..");
			freeFileItemList();
			list(".");
			unlink(name);
		}
	}
}
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
	{
		printf(0, "hi2\n");
		if (q->chosen)
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
			p1->name = (char *)malloc(32 * sizeof(char));
			strcpy(p1->name, q->name);
			if(head == 0)
			{
				head = p1;
				p2 = p1;
			} else {
				p2->next = p1;
				p2 = p1;
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
		p2 = p1;
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
	freeFileItemList();
	list(".");
	printItemList();
	drawFinderContent(context);
	drawFinderWnd(context);
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
		addWndEvent(&cm);
		addListEvent(&cm);
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
		if (p->chosen == 1){
			if(lenOfWaited >= MAX_COPY_SIZE){
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
					strcpy(filesWaited[lenOfWaited], currentPath);
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
					lenOfWaited++;
					close(fd);
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
				}
			}
		}
		p = p->next;
	}
}

void h_copyFile(Point p){
	copyOrCut = 0;
	lenOfWaited = 0;
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
}

void h_cutFile(Point p){
	copyOrCut = 1;
	lenOfWaited = 0;
	copyFile();
}

void pasteJustFile(char *src, char *filename){
	int size = 0;
	int file_src, file_dest;
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
	file_src = open(src, O_RDONLY);
	if((file_dest = open(filename, O_RDONLY)) >= 0){
		printf(0, "File %s already exist\n", filename);
	}
	else{
		file_dest = open(filename, O_CREATE);
		while((size = read(file_src, buff, 4096)) > 0)
            write(file_dest, buff, size);
	    if(size < 0)
	    {
	    	//printf(2, "copy file error!!!\r\n");
	        printf(0, "File %s error\n", filename);
	        return;
	    }
	}
	close(file_dest);
	close(file_src);
	free(buff);
}

void pasteFile(){
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
        	if (*(filesWaited[i]+j) == '/'){
        		filename = filesWaited[i] + j + 1;
        		break;
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
        pasteJustFile(filesWaited[i], filename);
	}
}

void h_pasteFile(Point p){
	pasteFile();
	if(copyOrCut == 1)
		moveFile();
    freeFileItemList();
	list(".");
	drawFinderContent(context);
	drawFinderWnd(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
}

void h_chooseFile(Point p) {
	struct fileItem *temp = getFileItem(p);
	if (temp->chosen != 0)
	{
		printf(0, "chooseFile!\n");
		temp->chosen = 0;
	}
	else
	{
		printf(0, "unchooseFile!\n");
		temp->chosen = 1;
	}
	drawFinderContent(context);
	drawFinderWnd(context);
}

void h_closeWnd(Point p) {
	isRun = 0;
}

void h_chvm1(Point p) {
	style = ICON_STYLE;
	freeFileItemList();
		list(".");
		drawFinderContent(context);
	drawFinderWnd(context);
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
			addWndEvent(&cm);
			addListEvent(&cm);
}

void h_chvm2(Point p) {
	style = LIST_STYLE;
	freeFileItemList();
		list(".");
		drawFinderContent(context);
	drawFinderWnd(context);
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
			addWndEvent(&cm);
			addListEvent(&cm);
}

void h_goUp(Point p) {
	enterDir("..");
	freeFileItemList();
	list(".");
	drawFinderContent(context);
	drawFinderWnd(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
}

void h_empty(Point p) {

}

int main(int argc, char *argv[]) {
	int winid;
	struct Msg msg;
	char key;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
	cm = initClickManager(context);
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
	//testHandlers();
	strcpy(currentPath, "/");
	mkdir("userfolder");
	enterDir("userfolder");
	freeFileItemList();
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
		getMsg(&msg);
		switch (msg.msg_type) {
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
				updateWindow(winid, context.addr);
			}
			break;
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
			drawFinderWnd(context);
			updateWindow(winid, context.addr);
			break;
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {

				updateWindow(winid, context.addr);
			}
			break;
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
				updateWindow(winid, context.addr);
			}
			break;
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
			if (isSearching) {
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
					keyContent.content[keyContent.length++] = key;
					printf(0, "%s\n", keyContent.content);
				}
				else if (key == 8 && keyContent.length > 0) {
					keyContent.content[--keyContent.length] = 0;
				}
				drawFinderContent(context);
				drawFinderWnd(context);
				updateWindow(winid, context.addr);
			}
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
	exit();
}

void testHandlers() {

	list(".");
	printf(0, "original list:\n");
	printItemList();
	printf(0, "\n");
	printf(0, "new a folder:\n");
	newFolder("newfolder");
	freeFileItemList();
	list(".");
	printItemList();
	printf(0, "\n");
	printf(0, "enter new folder:\n");
	enterDir("newfolder");
	freeFileItemList();
	list(".");
	printItemList();
	printf(0, "\n");
	printf(0, "new a file:\n");
	newFile("newfile.txt");
	freeFileItemList();
	list(".");
	printItemList();
//	printf(0, "\n");
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}

