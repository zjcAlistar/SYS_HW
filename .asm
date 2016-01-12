
_finder:     file format elf32-i386


Disassembly of section .text:

00000000 <strstr>:
//测试相关函数
void printItemList();
void testHandlers();

char* strstr(const char *s1, const char *s2)  
{  
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 10             	sub    $0x10,%esp
    int n;  
    if (*s2)  
       6:	8b 45 0c             	mov    0xc(%ebp),%eax
       9:	0f b6 00             	movzbl (%eax),%eax
       c:	84 c0                	test   %al,%al
       e:	74 55                	je     65 <strstr+0x65>
    {  
        while (*s1)  
      10:	eb 42                	jmp    54 <strstr+0x54>
        {  
            for (n=0; *(s1 + n) == *(s2 + n); n++)  
      12:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
      19:	eb 1b                	jmp    36 <strstr+0x36>
            {  
                if (!*(s2 + n + 1))  
      1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
      1e:	8d 50 01             	lea    0x1(%eax),%edx
      21:	8b 45 0c             	mov    0xc(%ebp),%eax
      24:	01 d0                	add    %edx,%eax
      26:	0f b6 00             	movzbl (%eax),%eax
      29:	84 c0                	test   %al,%al
      2b:	75 05                	jne    32 <strstr+0x32>
                    return (char *)s1;  
      2d:	8b 45 08             	mov    0x8(%ebp),%eax
      30:	eb 36                	jmp    68 <strstr+0x68>
    int n;  
    if (*s2)  
    {  
        while (*s1)  
        {  
            for (n=0; *(s1 + n) == *(s2 + n); n++)  
      32:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
      36:	8b 55 fc             	mov    -0x4(%ebp),%edx
      39:	8b 45 08             	mov    0x8(%ebp),%eax
      3c:	01 d0                	add    %edx,%eax
      3e:	0f b6 10             	movzbl (%eax),%edx
      41:	8b 4d fc             	mov    -0x4(%ebp),%ecx
      44:	8b 45 0c             	mov    0xc(%ebp),%eax
      47:	01 c8                	add    %ecx,%eax
      49:	0f b6 00             	movzbl (%eax),%eax
      4c:	38 c2                	cmp    %al,%dl
      4e:	74 cb                	je     1b <strstr+0x1b>
            {  
                if (!*(s2 + n + 1))  
                    return (char *)s1;  
            }  
            s1++;  
      50:	83 45 08 01          	addl   $0x1,0x8(%ebp)
char* strstr(const char *s1, const char *s2)  
{  
    int n;  
    if (*s2)  
    {  
        while (*s1)  
      54:	8b 45 08             	mov    0x8(%ebp),%eax
      57:	0f b6 00             	movzbl (%eax),%eax
      5a:	84 c0                	test   %al,%al
      5c:	75 b4                	jne    12 <strstr+0x12>
                if (!*(s2 + n + 1))  
                    return (char *)s1;  
            }  
            s1++;  
        }  
        return 0;  
      5e:	b8 00 00 00 00       	mov    $0x0,%eax
      63:	eb 03                	jmp    68 <strstr+0x68>
    }  
    else  
        return (char *)s1;  
      65:	8b 45 08             	mov    0x8(%ebp),%eax
}  
      68:	c9                   	leave  
      69:	c3                   	ret    

0000006a <init_keyContent>:

void init_keyContent() {
      6a:	55                   	push   %ebp
      6b:	89 e5                	mov    %esp,%ebp
      6d:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i=0; i<MAX_KEYLENGTH; i++)
      70:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
      77:	eb 0f                	jmp    88 <init_keyContent+0x1e>
		keyContent.content[i] = 0;
      79:	8b 45 fc             	mov    -0x4(%ebp),%eax
      7c:	05 cc 39 01 00       	add    $0x139cc,%eax
      81:	c6 00 00             	movb   $0x0,(%eax)
        return (char *)s1;  
}  

void init_keyContent() {
	int i;
	for (i=0; i<MAX_KEYLENGTH; i++)
      84:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
      88:	83 7d fc 13          	cmpl   $0x13,-0x4(%ebp)
      8c:	7e eb                	jle    79 <init_keyContent+0xf>
		keyContent.content[i] = 0;
	keyContent.length = 0;
      8e:	c7 05 e0 39 01 00 00 	movl   $0x0,0x139e0
      95:	00 00 00 
}
      98:	c9                   	leave  
      99:	c3                   	ret    

0000009a <addFileItem>:


// 文件项列表相关操作
void addFileItem(struct stat st, char *name, Rect pos) {
      9a:	55                   	push   %ebp
      9b:	89 e5                	mov    %esp,%ebp
      9d:	53                   	push   %ebx
      9e:	83 ec 44             	sub    $0x44,%esp
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
      a1:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
      a8:	e8 34 52 00 00       	call   52e1 <malloc>
      ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      b0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
      b7:	e8 25 52 00 00       	call   52e1 <malloc>
      bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
      bf:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
      c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c5:	8b 40 14             	mov    0x14(%eax),%eax
      c8:	8b 55 1c             	mov    0x1c(%ebp),%edx
      cb:	89 54 24 04          	mov    %edx,0x4(%esp)
      cf:	89 04 24             	mov    %eax,(%esp)
      d2:	e8 f3 4a 00 00       	call   4bca <strcpy>
//    for (i = 0; name[i] != 0; i++)
//    	{
//    		printf(0, "%d : %c\n", i, name[i]);
//    	}
	//printf(0, "copying name\n");
	temp->st = st;
      d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
      da:	8b 55 08             	mov    0x8(%ebp),%edx
      dd:	89 10                	mov    %edx,(%eax)
      df:	8b 55 0c             	mov    0xc(%ebp),%edx
      e2:	89 50 04             	mov    %edx,0x4(%eax)
      e5:	8b 55 10             	mov    0x10(%ebp),%edx
      e8:	89 50 08             	mov    %edx,0x8(%eax)
      eb:	8b 55 14             	mov    0x14(%ebp),%edx
      ee:	89 50 0c             	mov    %edx,0xc(%eax)
      f1:	8b 55 18             	mov    0x18(%ebp),%edx
      f4:	89 50 10             	mov    %edx,0x10(%eax)
	temp->pos = getPos(context, itemCounter);
      f7:	8b 15 b0 02 01 00    	mov    0x102b0,%edx
      fd:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     100:	8d 45 d8             	lea    -0x28(%ebp),%eax
     103:	89 54 24 10          	mov    %edx,0x10(%esp)
     107:	8b 15 c0 39 01 00    	mov    0x139c0,%edx
     10d:	89 54 24 04          	mov    %edx,0x4(%esp)
     111:	8b 15 c4 39 01 00    	mov    0x139c4,%edx
     117:	89 54 24 08          	mov    %edx,0x8(%esp)
     11b:	8b 15 c8 39 01 00    	mov    0x139c8,%edx
     121:	89 54 24 0c          	mov    %edx,0xc(%esp)
     125:	89 04 24             	mov    %eax,(%esp)
     128:	e8 41 0f 00 00       	call   106e <getPos>
     12d:	83 ec 04             	sub    $0x4,%esp
     130:	8b 45 d8             	mov    -0x28(%ebp),%eax
     133:	89 43 18             	mov    %eax,0x18(%ebx)
     136:	8b 45 dc             	mov    -0x24(%ebp),%eax
     139:	89 43 1c             	mov    %eax,0x1c(%ebx)
     13c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     13f:	89 43 20             	mov    %eax,0x20(%ebx)
     142:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     145:	89 43 24             	mov    %eax,0x24(%ebx)
	temp->next = fileItemList;
     148:	8b 15 ac 02 01 00    	mov    0x102ac,%edx
     14e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     151:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     154:	8b 45 f4             	mov    -0xc(%ebp),%eax
     157:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     15e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     161:	a3 ac 02 01 00       	mov    %eax,0x102ac
}
     166:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     169:	c9                   	leave  
     16a:	c3                   	ret    

0000016b <freeFileItemList>:

void freeFileItemList() {
     16b:	55                   	push   %ebp
     16c:	89 e5                	mov    %esp,%ebp
     16e:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     171:	a1 ac 02 01 00       	mov    0x102ac,%eax
     176:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     179:	eb 28                	jmp    1a3 <freeFileItemList+0x38>
		temp = p;
     17b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     17e:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     181:	8b 45 f4             	mov    -0xc(%ebp),%eax
     184:	8b 40 2c             	mov    0x2c(%eax),%eax
     187:	89 45 f4             	mov    %eax,-0xc(%ebp)
		free(temp->name);
     18a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     18d:	8b 40 14             	mov    0x14(%eax),%eax
     190:	89 04 24             	mov    %eax,(%esp)
     193:	e8 10 50 00 00       	call   51a8 <free>
		free(temp);
     198:	8b 45 f0             	mov    -0x10(%ebp),%eax
     19b:	89 04 24             	mov    %eax,(%esp)
     19e:	e8 05 50 00 00       	call   51a8 <free>
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     1a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     1a7:	75 d2                	jne    17b <freeFileItemList+0x10>
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
     1a9:	c7 05 ac 02 01 00 00 	movl   $0x0,0x102ac
     1b0:	00 00 00 
}
     1b3:	c9                   	leave  
     1b4:	c3                   	ret    

000001b5 <fmtname>:

// 文件信息相关操作
char* fmtname(char *path) {
     1b5:	55                   	push   %ebp
     1b6:	89 e5                	mov    %esp,%ebp
     1b8:	83 ec 28             	sub    $0x28,%esp
	//static char buf[DIRSIZ+1];
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
     1bb:	8b 45 08             	mov    0x8(%ebp),%eax
     1be:	89 04 24             	mov    %eax,(%esp)
     1c1:	e8 73 4a 00 00       	call   4c39 <strlen>
     1c6:	8b 55 08             	mov    0x8(%ebp),%edx
     1c9:	01 d0                	add    %edx,%eax
     1cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
     1ce:	eb 04                	jmp    1d4 <fmtname+0x1f>
     1d0:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     1d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1d7:	3b 45 08             	cmp    0x8(%ebp),%eax
     1da:	72 0a                	jb     1e6 <fmtname+0x31>
     1dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1df:	0f b6 00             	movzbl (%eax),%eax
     1e2:	3c 2f                	cmp    $0x2f,%al
     1e4:	75 ea                	jne    1d0 <fmtname+0x1b>
		;
	p++;
     1e6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     1ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     1ed:	c9                   	leave  
     1ee:	c3                   	ret    

000001ef <isListable>:

int isListable(char *name, short type) {
     1ef:	55                   	push   %ebp
     1f0:	89 e5                	mov    %esp,%ebp
     1f2:	83 ec 14             	sub    $0x14,%esp
     1f5:	8b 45 0c             	mov    0xc(%ebp),%eax
     1f8:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	char *p = name;
     1fc:	8b 45 08             	mov    0x8(%ebp),%eax
     1ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (*p == '.') return 0;
     202:	8b 45 fc             	mov    -0x4(%ebp),%eax
     205:	0f b6 00             	movzbl (%eax),%eax
     208:	3c 2e                	cmp    $0x2e,%al
     20a:	75 07                	jne    213 <isListable+0x24>
     20c:	b8 00 00 00 00       	mov    $0x0,%eax
     211:	eb 34                	jmp    247 <isListable+0x58>
	if (type == T_DIR) return 1;
     213:	66 83 7d ec 01       	cmpw   $0x1,-0x14(%ebp)
     218:	75 07                	jne    221 <isListable+0x32>
     21a:	b8 01 00 00 00       	mov    $0x1,%eax
     21f:	eb 26                	jmp    247 <isListable+0x58>
	while (*p != 0) {
     221:	eb 15                	jmp    238 <isListable+0x49>
		if (*p == '.')
     223:	8b 45 fc             	mov    -0x4(%ebp),%eax
     226:	0f b6 00             	movzbl (%eax),%eax
     229:	3c 2e                	cmp    $0x2e,%al
     22b:	75 07                	jne    234 <isListable+0x45>
			return 1;
     22d:	b8 01 00 00 00       	mov    $0x1,%eax
     232:	eb 13                	jmp    247 <isListable+0x58>
		p++;
     234:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
     238:	8b 45 fc             	mov    -0x4(%ebp),%eax
     23b:	0f b6 00             	movzbl (%eax),%eax
     23e:	84 c0                	test   %al,%al
     240:	75 e1                	jne    223 <isListable+0x34>
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
     242:	b8 00 00 00 00       	mov    $0x0,%eax
}
     247:	c9                   	leave  
     248:	c3                   	ret    

00000249 <list>:

void list(char *path) {
     249:	55                   	push   %ebp
     24a:	89 e5                	mov    %esp,%ebp
     24c:	57                   	push   %edi
     24d:	56                   	push   %esi
     24e:	53                   	push   %ebx
     24f:	81 ec 7c 02 00 00    	sub    $0x27c,%esp
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
     255:	c7 05 b0 02 01 00 00 	movl   $0x0,0x102b0
     25c:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     25f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     266:	00 
     267:	8b 45 08             	mov    0x8(%ebp),%eax
     26a:	89 04 24             	mov    %eax,(%esp)
     26d:	e8 db 4b 00 00       	call   4e4d <open>
     272:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     275:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     279:	79 20                	jns    29b <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     27b:	8b 45 08             	mov    0x8(%ebp),%eax
     27e:	89 44 24 08          	mov    %eax,0x8(%esp)
     282:	c7 44 24 04 60 b6 00 	movl   $0xb660,0x4(%esp)
     289:	00 
     28a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     291:	e8 5f 4d 00 00       	call   4ff5 <printf>
		return;
     296:	e9 8f 02 00 00       	jmp    52a <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     29b:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     2a1:	89 44 24 04          	mov    %eax,0x4(%esp)
     2a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2a8:	89 04 24             	mov    %eax,(%esp)
     2ab:	e8 b5 4b 00 00       	call   4e65 <fstat>
     2b0:	85 c0                	test   %eax,%eax
     2b2:	79 2b                	jns    2df <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     2b4:	8b 45 08             	mov    0x8(%ebp),%eax
     2b7:	89 44 24 08          	mov    %eax,0x8(%esp)
     2bb:	c7 44 24 04 74 b6 00 	movl   $0xb674,0x4(%esp)
     2c2:	00 
     2c3:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2ca:	e8 26 4d 00 00       	call   4ff5 <printf>
		close(fd);
     2cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2d2:	89 04 24             	mov    %eax,(%esp)
     2d5:	e8 5b 4b 00 00       	call   4e35 <close>
		return;
     2da:	e9 4b 02 00 00       	jmp    52a <list+0x2e1>
	}

	switch (st.type) {
     2df:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     2e6:	98                   	cwtl   
     2e7:	83 f8 01             	cmp    $0x1,%eax
     2ea:	74 53                	je     33f <list+0xf6>
     2ec:	83 f8 02             	cmp    $0x2,%eax
     2ef:	0f 85 2a 02 00 00    	jne    51f <list+0x2d6>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     2f5:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     2fb:	8b b5 b4 fd ff ff    	mov    -0x24c(%ebp),%esi
     301:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     308:	0f bf d8             	movswl %ax,%ebx
     30b:	8b 45 08             	mov    0x8(%ebp),%eax
     30e:	89 04 24             	mov    %eax,(%esp)
     311:	e8 9f fe ff ff       	call   1b5 <fmtname>
     316:	89 7c 24 14          	mov    %edi,0x14(%esp)
     31a:	89 74 24 10          	mov    %esi,0x10(%esp)
     31e:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     322:	89 44 24 08          	mov    %eax,0x8(%esp)
     326:	c7 44 24 04 88 b6 00 	movl   $0xb688,0x4(%esp)
     32d:	00 
     32e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     335:	e8 bb 4c 00 00       	call   4ff5 <printf>
		break;
     33a:	e9 e0 01 00 00       	jmp    51f <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     33f:	8b 45 08             	mov    0x8(%ebp),%eax
     342:	89 04 24             	mov    %eax,(%esp)
     345:	e8 ef 48 00 00       	call   4c39 <strlen>
     34a:	83 c0 10             	add    $0x10,%eax
     34d:	3d 00 02 00 00       	cmp    $0x200,%eax
     352:	76 19                	jbe    36d <list+0x124>
			printf(1, "ls: path too long\n");
     354:	c7 44 24 04 95 b6 00 	movl   $0xb695,0x4(%esp)
     35b:	00 
     35c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     363:	e8 8d 4c 00 00       	call   4ff5 <printf>
			break;
     368:	e9 b2 01 00 00       	jmp    51f <list+0x2d6>
		}
		strcpy(buf, path);
     36d:	8b 45 08             	mov    0x8(%ebp),%eax
     370:	89 44 24 04          	mov    %eax,0x4(%esp)
     374:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     37a:	89 04 24             	mov    %eax,(%esp)
     37d:	e8 48 48 00 00       	call   4bca <strcpy>
		p = buf + strlen(buf);
     382:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     388:	89 04 24             	mov    %eax,(%esp)
     38b:	e8 a9 48 00 00       	call   4c39 <strlen>
     390:	8d 95 d0 fd ff ff    	lea    -0x230(%ebp),%edx
     396:	01 d0                	add    %edx,%eax
     398:	89 45 e0             	mov    %eax,-0x20(%ebp)
		*p++ = '/';
     39b:	8b 45 e0             	mov    -0x20(%ebp),%eax
     39e:	8d 50 01             	lea    0x1(%eax),%edx
     3a1:	89 55 e0             	mov    %edx,-0x20(%ebp)
     3a4:	c6 00 2f             	movb   $0x2f,(%eax)
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     3a7:	e9 4c 01 00 00       	jmp    4f8 <list+0x2af>
			if (de.inum == 0)
     3ac:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%ebp),%eax
     3b3:	66 85 c0             	test   %ax,%ax
     3b6:	75 05                	jne    3bd <list+0x174>
				continue;
     3b8:	e9 3b 01 00 00       	jmp    4f8 <list+0x2af>
			memmove(p, de.name, DIRSIZ);
     3bd:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
     3c4:	00 
     3c5:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     3cb:	83 c0 02             	add    $0x2,%eax
     3ce:	89 44 24 04          	mov    %eax,0x4(%esp)
     3d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
     3d5:	89 04 24             	mov    %eax,(%esp)
     3d8:	e8 eb 49 00 00       	call   4dc8 <memmove>
			p[DIRSIZ] = 0;
     3dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
     3e0:	83 c0 0e             	add    $0xe,%eax
     3e3:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     3e6:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     3ec:	89 44 24 04          	mov    %eax,0x4(%esp)
     3f0:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3f6:	89 04 24             	mov    %eax,(%esp)
     3f9:	e8 2f 49 00 00       	call   4d2d <stat>
     3fe:	85 c0                	test   %eax,%eax
     400:	79 23                	jns    425 <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     402:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     408:	89 44 24 08          	mov    %eax,0x8(%esp)
     40c:	c7 44 24 04 74 b6 00 	movl   $0xb674,0x4(%esp)
     413:	00 
     414:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     41b:	e8 d5 4b 00 00       	call   4ff5 <printf>
				continue;
     420:	e9 d3 00 00 00       	jmp    4f8 <list+0x2af>
			}
			if (isListable(fmtname(buf), st.type)) {
     425:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     42c:	0f bf d8             	movswl %ax,%ebx
     42f:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     435:	89 04 24             	mov    %eax,(%esp)
     438:	e8 78 fd ff ff       	call   1b5 <fmtname>
     43d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     441:	89 04 24             	mov    %eax,(%esp)
     444:	e8 a6 fd ff ff       	call   1ef <isListable>
     449:	85 c0                	test   %eax,%eax
     44b:	0f 84 a7 00 00 00    	je     4f8 <list+0x2af>
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
     451:	8b 15 b0 02 01 00    	mov    0x102b0,%edx
     457:	8d 45 d0             	lea    -0x30(%ebp),%eax
     45a:	89 54 24 10          	mov    %edx,0x10(%esp)
     45e:	8b 15 c0 39 01 00    	mov    0x139c0,%edx
     464:	89 54 24 04          	mov    %edx,0x4(%esp)
     468:	8b 15 c4 39 01 00    	mov    0x139c4,%edx
     46e:	89 54 24 08          	mov    %edx,0x8(%esp)
     472:	8b 15 c8 39 01 00    	mov    0x139c8,%edx
     478:	89 54 24 0c          	mov    %edx,0xc(%esp)
     47c:	89 04 24             	mov    %eax,(%esp)
     47f:	e8 ea 0b 00 00       	call   106e <getPos>
     484:	83 ec 04             	sub    $0x4,%esp
     487:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     48d:	89 04 24             	mov    %eax,(%esp)
     490:	e8 20 fd ff ff       	call   1b5 <fmtname>
     495:	8b 55 d0             	mov    -0x30(%ebp),%edx
     498:	89 54 24 18          	mov    %edx,0x18(%esp)
     49c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     49f:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     4a3:	8b 55 d8             	mov    -0x28(%ebp),%edx
     4a6:	89 54 24 20          	mov    %edx,0x20(%esp)
     4aa:	8b 55 dc             	mov    -0x24(%ebp),%edx
     4ad:	89 54 24 24          	mov    %edx,0x24(%esp)
     4b1:	89 44 24 14          	mov    %eax,0x14(%esp)
     4b5:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
     4bb:	89 04 24             	mov    %eax,(%esp)
     4be:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
     4c4:	89 44 24 04          	mov    %eax,0x4(%esp)
     4c8:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
     4ce:	89 44 24 08          	mov    %eax,0x8(%esp)
     4d2:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
     4d8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     4dc:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
     4e2:	89 44 24 10          	mov    %eax,0x10(%esp)
     4e6:	e8 af fb ff ff       	call   9a <addFileItem>
				itemCounter++;
     4eb:	a1 b0 02 01 00       	mov    0x102b0,%eax
     4f0:	83 c0 01             	add    $0x1,%eax
     4f3:	a3 b0 02 01 00       	mov    %eax,0x102b0
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     4f8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     4ff:	00 
     500:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     506:	89 44 24 04          	mov    %eax,0x4(%esp)
     50a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     50d:	89 04 24             	mov    %eax,(%esp)
     510:	e8 10 49 00 00       	call   4e25 <read>
     515:	83 f8 10             	cmp    $0x10,%eax
     518:	0f 84 8e fe ff ff    	je     3ac <list+0x163>
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
     51e:	90                   	nop
	}
	close(fd);
     51f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     522:	89 04 24             	mov    %eax,(%esp)
     525:	e8 0b 49 00 00       	call   4e35 <close>
}
     52a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     52d:	5b                   	pop    %ebx
     52e:	5e                   	pop    %esi
     52f:	5f                   	pop    %edi
     530:	5d                   	pop    %ebp
     531:	c3                   	ret    

00000532 <drawItem>:
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     532:	55                   	push   %ebp
     533:	89 e5                	mov    %esp,%ebp
     535:	53                   	push   %ebx
     536:	83 ec 34             	sub    $0x34,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0) 
     539:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     53d:	75 0b                	jne    54a <drawItem+0x18>
		nameColor = 0x0;
     53f:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     545:	e9 9a 00 00 00       	jmp    5e4 <drawItem+0xb2>
	else if (chosen == 1)
     54a:	83 7d 3c 01          	cmpl   $0x1,0x3c(%ebp)
     54e:	75 4b                	jne    59b <drawItem+0x69>
	{
		nameColor = 0xFFFF;
     550:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     556:	8b 45 38             	mov    0x38(%ebp),%eax
     559:	89 c3                	mov    %eax,%ebx
     55b:	8b 45 34             	mov    0x34(%ebp),%eax
     55e:	89 c1                	mov    %eax,%ecx
     560:	8b 45 30             	mov    0x30(%ebp),%eax
     563:	89 c2                	mov    %eax,%edx
     565:	8b 45 2c             	mov    0x2c(%ebp),%eax
     568:	c7 44 24 1c 10 21 00 	movl   $0x2110,0x1c(%esp)
     56f:	00 
     570:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     574:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     578:	89 54 24 10          	mov    %edx,0x10(%esp)
     57c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     580:	8b 45 08             	mov    0x8(%ebp),%eax
     583:	89 04 24             	mov    %eax,(%esp)
     586:	8b 45 0c             	mov    0xc(%ebp),%eax
     589:	89 44 24 04          	mov    %eax,0x4(%esp)
     58d:	8b 45 10             	mov    0x10(%ebp),%eax
     590:	89 44 24 08          	mov    %eax,0x8(%esp)
     594:	e8 d3 2a 00 00       	call   306c <fill_rect>
     599:	eb 49                	jmp    5e4 <drawItem+0xb2>
	} else
	{
		nameColor = 0xFFFF;
     59b:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
     5a1:	8b 45 38             	mov    0x38(%ebp),%eax
     5a4:	89 c3                	mov    %eax,%ebx
     5a6:	8b 45 34             	mov    0x34(%ebp),%eax
     5a9:	89 c1                	mov    %eax,%ecx
     5ab:	8b 45 30             	mov    0x30(%ebp),%eax
     5ae:	89 c2                	mov    %eax,%edx
     5b0:	8b 45 2c             	mov    0x2c(%ebp),%eax
     5b3:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     5ba:	00 
     5bb:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     5bf:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     5c3:	89 54 24 10          	mov    %edx,0x10(%esp)
     5c7:	89 44 24 0c          	mov    %eax,0xc(%esp)
     5cb:	8b 45 08             	mov    0x8(%ebp),%eax
     5ce:	89 04 24             	mov    %eax,(%esp)
     5d1:	8b 45 0c             	mov    0xc(%ebp),%eax
     5d4:	89 44 24 04          	mov    %eax,0x4(%esp)
     5d8:	8b 45 10             	mov    0x10(%ebp),%eax
     5db:	89 44 24 08          	mov    %eax,0x8(%esp)
     5df:	e8 88 2a 00 00       	call   306c <fill_rect>
	}
	if (style == ICON_STYLE) {
     5e4:	a1 44 f9 00 00       	mov    0xf944,%eax
     5e9:	83 f8 01             	cmp    $0x1,%eax
     5ec:	0f 85 13 01 00 00    	jne    705 <drawItem+0x1d3>
		switch (st.type) {
     5f2:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     5f6:	98                   	cwtl   
     5f7:	83 f8 01             	cmp    $0x1,%eax
     5fa:	74 53                	je     64f <drawItem+0x11d>
     5fc:	83 f8 02             	cmp    $0x2,%eax
     5ff:	0f 85 93 00 00 00    	jne    698 <drawItem+0x166>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     605:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     608:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     60b:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     60e:	83 c0 19             	add    $0x19,%eax
     611:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     615:	89 44 24 18          	mov    %eax,0x18(%esp)
     619:	a1 88 f9 00 00       	mov    0xf988,%eax
     61e:	89 44 24 0c          	mov    %eax,0xc(%esp)
     622:	a1 8c f9 00 00       	mov    0xf98c,%eax
     627:	89 44 24 10          	mov    %eax,0x10(%esp)
     62b:	a1 90 f9 00 00       	mov    0xf990,%eax
     630:	89 44 24 14          	mov    %eax,0x14(%esp)
     634:	8b 45 08             	mov    0x8(%ebp),%eax
     637:	89 04 24             	mov    %eax,(%esp)
     63a:	8b 45 0c             	mov    0xc(%ebp),%eax
     63d:	89 44 24 04          	mov    %eax,0x4(%esp)
     641:	8b 45 10             	mov    0x10(%ebp),%eax
     644:	89 44 24 08          	mov    %eax,0x8(%esp)
     648:	e8 be 30 00 00       	call   370b <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     64d:	eb 49                	jmp    698 <drawItem+0x166>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     64f:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     652:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     655:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     658:	83 c0 19             	add    $0x19,%eax
     65b:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     65f:	89 44 24 18          	mov    %eax,0x18(%esp)
     663:	a1 f0 f9 00 00       	mov    0xf9f0,%eax
     668:	89 44 24 0c          	mov    %eax,0xc(%esp)
     66c:	a1 f4 f9 00 00       	mov    0xf9f4,%eax
     671:	89 44 24 10          	mov    %eax,0x10(%esp)
     675:	a1 f8 f9 00 00       	mov    0xf9f8,%eax
     67a:	89 44 24 14          	mov    %eax,0x14(%esp)
     67e:	8b 45 08             	mov    0x8(%ebp),%eax
     681:	89 04 24             	mov    %eax,(%esp)
     684:	8b 45 0c             	mov    0xc(%ebp),%eax
     687:	89 44 24 04          	mov    %eax,0x4(%esp)
     68b:	8b 45 10             	mov    0x10(%ebp),%eax
     68e:	89 44 24 08          	mov    %eax,0x8(%esp)
     692:	e8 74 30 00 00       	call   370b <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     697:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     698:	8b 45 14             	mov    0x14(%ebp),%eax
     69b:	89 04 24             	mov    %eax,(%esp)
     69e:	e8 96 45 00 00       	call   4c39 <strlen>
     6a3:	89 c2                	mov    %eax,%edx
     6a5:	b8 00 00 00 00       	mov    $0x0,%eax
     6aa:	29 d0                	sub    %edx,%eax
     6ac:	c1 e0 02             	shl    $0x2,%eax
     6af:	83 c0 30             	add    $0x30,%eax
     6b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     6b5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     6b9:	79 07                	jns    6c2 <drawItem+0x190>
			indent = 0;
     6bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     6c2:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     6c5:	8d 48 46             	lea    0x46(%eax),%ecx
     6c8:	8b 55 2c             	mov    0x2c(%ebp),%edx
     6cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
     6ce:	01 c2                	add    %eax,%edx
     6d0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     6d4:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     6d8:	89 54 24 14          	mov    %edx,0x14(%esp)
     6dc:	89 44 24 10          	mov    %eax,0x10(%esp)
     6e0:	8b 45 14             	mov    0x14(%ebp),%eax
     6e3:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6e7:	8b 45 08             	mov    0x8(%ebp),%eax
     6ea:	89 04 24             	mov    %eax,(%esp)
     6ed:	8b 45 0c             	mov    0xc(%ebp),%eax
     6f0:	89 44 24 04          	mov    %eax,0x4(%esp)
     6f4:	8b 45 10             	mov    0x10(%ebp),%eax
     6f7:	89 44 24 08          	mov    %eax,0x8(%esp)
     6fb:	e8 4b 2f 00 00       	call   364b <puts_str>
     700:	e9 33 01 00 00       	jmp    838 <drawItem+0x306>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     705:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     709:	98                   	cwtl   
     70a:	83 f8 01             	cmp    $0x1,%eax
     70d:	0f 84 a0 00 00 00    	je     7b3 <drawItem+0x281>
     713:	83 f8 02             	cmp    $0x2,%eax
     716:	0f 85 e0 00 00 00    	jne    7fc <drawItem+0x2ca>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     71c:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     71f:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     722:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     725:	83 c0 08             	add    $0x8,%eax
     728:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     72c:	89 44 24 18          	mov    %eax,0x18(%esp)
     730:	a1 bc f9 00 00       	mov    0xf9bc,%eax
     735:	89 44 24 0c          	mov    %eax,0xc(%esp)
     739:	a1 c0 f9 00 00       	mov    0xf9c0,%eax
     73e:	89 44 24 10          	mov    %eax,0x10(%esp)
     742:	a1 c4 f9 00 00       	mov    0xf9c4,%eax
     747:	89 44 24 14          	mov    %eax,0x14(%esp)
     74b:	8b 45 08             	mov    0x8(%ebp),%eax
     74e:	89 04 24             	mov    %eax,(%esp)
     751:	8b 45 0c             	mov    0xc(%ebp),%eax
     754:	89 44 24 04          	mov    %eax,0x4(%esp)
     758:	8b 45 10             	mov    0x10(%ebp),%eax
     75b:	89 44 24 08          	mov    %eax,0x8(%esp)
     75f:	e8 a7 2f 00 00       	call   370b <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     764:	8b 45 28             	mov    0x28(%ebp),%eax
     767:	89 04 24             	mov    %eax,(%esp)
     76a:	e8 cf 00 00 00       	call   83e <sizeFormat>
     76f:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     772:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     775:	8d 48 03             	lea    0x3(%eax),%ecx
     778:	8b 45 2c             	mov    0x2c(%ebp),%eax
     77b:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     781:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     785:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     789:	89 54 24 14          	mov    %edx,0x14(%esp)
     78d:	89 44 24 10          	mov    %eax,0x10(%esp)
     791:	8b 45 ec             	mov    -0x14(%ebp),%eax
     794:	89 44 24 0c          	mov    %eax,0xc(%esp)
     798:	8b 45 08             	mov    0x8(%ebp),%eax
     79b:	89 04 24             	mov    %eax,(%esp)
     79e:	8b 45 0c             	mov    0xc(%ebp),%eax
     7a1:	89 44 24 04          	mov    %eax,0x4(%esp)
     7a5:	8b 45 10             	mov    0x10(%ebp),%eax
     7a8:	89 44 24 08          	mov    %eax,0x8(%esp)
     7ac:	e8 9a 2e 00 00       	call   364b <puts_str>
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     7b1:	eb 49                	jmp    7fc <drawItem+0x2ca>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     7b3:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     7b6:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     7b9:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     7bc:	83 c0 08             	add    $0x8,%eax
     7bf:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     7c3:	89 44 24 18          	mov    %eax,0x18(%esp)
     7c7:	a1 24 fa 00 00       	mov    0xfa24,%eax
     7cc:	89 44 24 0c          	mov    %eax,0xc(%esp)
     7d0:	a1 28 fa 00 00       	mov    0xfa28,%eax
     7d5:	89 44 24 10          	mov    %eax,0x10(%esp)
     7d9:	a1 2c fa 00 00       	mov    0xfa2c,%eax
     7de:	89 44 24 14          	mov    %eax,0x14(%esp)
     7e2:	8b 45 08             	mov    0x8(%ebp),%eax
     7e5:	89 04 24             	mov    %eax,(%esp)
     7e8:	8b 45 0c             	mov    0xc(%ebp),%eax
     7eb:	89 44 24 04          	mov    %eax,0x4(%esp)
     7ef:	8b 45 10             	mov    0x10(%ebp),%eax
     7f2:	89 44 24 08          	mov    %eax,0x8(%esp)
     7f6:	e8 10 2f 00 00       	call   370b <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     7fb:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     7fc:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     7ff:	8d 48 03             	lea    0x3(%eax),%ecx
     802:	8b 45 2c             	mov    0x2c(%ebp),%eax
     805:	8d 50 28             	lea    0x28(%eax),%edx
     808:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     80c:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     810:	89 54 24 14          	mov    %edx,0x14(%esp)
     814:	89 44 24 10          	mov    %eax,0x10(%esp)
     818:	8b 45 14             	mov    0x14(%ebp),%eax
     81b:	89 44 24 0c          	mov    %eax,0xc(%esp)
     81f:	8b 45 08             	mov    0x8(%ebp),%eax
     822:	89 04 24             	mov    %eax,(%esp)
     825:	8b 45 0c             	mov    0xc(%ebp),%eax
     828:	89 44 24 04          	mov    %eax,0x4(%esp)
     82c:	8b 45 10             	mov    0x10(%ebp),%eax
     82f:	89 44 24 08          	mov    %eax,0x8(%esp)
     833:	e8 13 2e 00 00       	call   364b <puts_str>
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     838:	83 c4 34             	add    $0x34,%esp
     83b:	5b                   	pop    %ebx
     83c:	5d                   	pop    %ebp
     83d:	c3                   	ret    

0000083e <sizeFormat>:

char *sizeFormat(uint size){
     83e:	55                   	push   %ebp
     83f:	89 e5                	mov    %esp,%ebp
     841:	53                   	push   %ebx
     842:	83 ec 24             	sub    $0x24,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     845:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     84c:	e8 90 4a 00 00       	call   52e1 <malloc>
     851:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     854:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     85b:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     862:	0f 86 8b 00 00 00    	jbe    8f3 <sizeFormat+0xb5>
	{
		size = size / (0x400);
     868:	8b 45 08             	mov    0x8(%ebp),%eax
     86b:	c1 e8 0a             	shr    $0xa,%eax
     86e:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     871:	8b 45 f4             	mov    -0xc(%ebp),%eax
     874:	8d 50 01             	lea    0x1(%eax),%edx
     877:	89 55 f4             	mov    %edx,-0xc(%ebp)
     87a:	89 c2                	mov    %eax,%edx
     87c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     87f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     882:	8b 4d 08             	mov    0x8(%ebp),%ecx
     885:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     88a:	89 c8                	mov    %ecx,%eax
     88c:	f7 e2                	mul    %edx
     88e:	c1 ea 03             	shr    $0x3,%edx
     891:	89 d0                	mov    %edx,%eax
     893:	c1 e0 02             	shl    $0x2,%eax
     896:	01 d0                	add    %edx,%eax
     898:	01 c0                	add    %eax,%eax
     89a:	29 c1                	sub    %eax,%ecx
     89c:	89 ca                	mov    %ecx,%edx
     89e:	89 d0                	mov    %edx,%eax
     8a0:	83 c0 30             	add    $0x30,%eax
     8a3:	88 03                	mov    %al,(%ebx)
			size /= 10;
     8a5:	8b 45 08             	mov    0x8(%ebp),%eax
     8a8:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     8ad:	f7 e2                	mul    %edx
     8af:	89 d0                	mov    %edx,%eax
     8b1:	c1 e8 03             	shr    $0x3,%eax
     8b4:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     8b7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     8bb:	75 b4                	jne    871 <sizeFormat+0x33>
		result[n++] = 'K';
     8bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8c0:	8d 50 01             	lea    0x1(%eax),%edx
     8c3:	89 55 f4             	mov    %edx,-0xc(%ebp)
     8c6:	89 c2                	mov    %eax,%edx
     8c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8cb:	01 d0                	add    %edx,%eax
     8cd:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     8d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8d3:	8d 50 01             	lea    0x1(%eax),%edx
     8d6:	89 55 f4             	mov    %edx,-0xc(%ebp)
     8d9:	89 c2                	mov    %eax,%edx
     8db:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8de:	01 d0                	add    %edx,%eax
     8e0:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     8e3:	8b 55 f4             	mov    -0xc(%ebp),%edx
     8e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8e9:	01 d0                	add    %edx,%eax
     8eb:	c6 00 00             	movb   $0x0,(%eax)
     8ee:	e9 a3 00 00 00       	jmp    996 <sizeFormat+0x158>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     8f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8f6:	8d 50 01             	lea    0x1(%eax),%edx
     8f9:	89 55 f4             	mov    %edx,-0xc(%ebp)
     8fc:	89 c2                	mov    %eax,%edx
     8fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     901:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     904:	8b 4d 08             	mov    0x8(%ebp),%ecx
     907:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     90c:	89 c8                	mov    %ecx,%eax
     90e:	f7 e2                	mul    %edx
     910:	c1 ea 03             	shr    $0x3,%edx
     913:	89 d0                	mov    %edx,%eax
     915:	c1 e0 02             	shl    $0x2,%eax
     918:	01 d0                	add    %edx,%eax
     91a:	01 c0                	add    %eax,%eax
     91c:	29 c1                	sub    %eax,%ecx
     91e:	89 ca                	mov    %ecx,%edx
     920:	89 d0                	mov    %edx,%eax
     922:	83 c0 30             	add    $0x30,%eax
     925:	88 03                	mov    %al,(%ebx)
			size /= 10;
     927:	8b 45 08             	mov    0x8(%ebp),%eax
     92a:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     92f:	f7 e2                	mul    %edx
     931:	89 d0                	mov    %edx,%eax
     933:	c1 e8 03             	shr    $0x3,%eax
     936:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     939:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     93d:	75 b4                	jne    8f3 <sizeFormat+0xb5>
		result[n++] = 'b';
     93f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     942:	8d 50 01             	lea    0x1(%eax),%edx
     945:	89 55 f4             	mov    %edx,-0xc(%ebp)
     948:	89 c2                	mov    %eax,%edx
     94a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     94d:	01 d0                	add    %edx,%eax
     94f:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     952:	8b 45 f4             	mov    -0xc(%ebp),%eax
     955:	8d 50 01             	lea    0x1(%eax),%edx
     958:	89 55 f4             	mov    %edx,-0xc(%ebp)
     95b:	89 c2                	mov    %eax,%edx
     95d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     960:	01 d0                	add    %edx,%eax
     962:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     965:	8b 45 f4             	mov    -0xc(%ebp),%eax
     968:	8d 50 01             	lea    0x1(%eax),%edx
     96b:	89 55 f4             	mov    %edx,-0xc(%ebp)
     96e:	89 c2                	mov    %eax,%edx
     970:	8b 45 f0             	mov    -0x10(%ebp),%eax
     973:	01 d0                	add    %edx,%eax
     975:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     978:	8b 45 f4             	mov    -0xc(%ebp),%eax
     97b:	8d 50 01             	lea    0x1(%eax),%edx
     97e:	89 55 f4             	mov    %edx,-0xc(%ebp)
     981:	89 c2                	mov    %eax,%edx
     983:	8b 45 f0             	mov    -0x10(%ebp),%eax
     986:	01 d0                	add    %edx,%eax
     988:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     98b:	8b 55 f4             	mov    -0xc(%ebp),%edx
     98e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     991:	01 d0                	add    %edx,%eax
     993:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     996:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     999:	83 c4 24             	add    $0x24,%esp
     99c:	5b                   	pop    %ebx
     99d:	5d                   	pop    %ebp
     99e:	c3                   	ret    

0000099f <drawFinderWnd>:
		10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "blank.bmp",
		2 * BUTTON_WIDTH, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }  };

void drawFinderWnd(Context context) {
     99f:	55                   	push   %ebp
     9a0:	89 e5                	mov    %esp,%ebp
     9a2:	83 ec 28             	sub    $0x28,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     9a5:	8b 45 0c             	mov    0xc(%ebp),%eax
     9a8:	83 e8 01             	sub    $0x1,%eax
     9ab:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     9b2:	00 
     9b3:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     9ba:	00 
     9bb:	89 44 24 14          	mov    %eax,0x14(%esp)
     9bf:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     9c6:	00 
     9c7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9ce:	00 
     9cf:	8b 45 08             	mov    0x8(%ebp),%eax
     9d2:	89 04 24             	mov    %eax,(%esp)
     9d5:	8b 45 0c             	mov    0xc(%ebp),%eax
     9d8:	89 44 24 04          	mov    %eax,0x4(%esp)
     9dc:	8b 45 10             	mov    0x10(%ebp),%eax
     9df:	89 44 24 08          	mov    %eax,0x8(%esp)
     9e3:	e8 f9 2d 00 00       	call   37e1 <draw_line>
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     9e8:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     9eb:	8d 48 ff             	lea    -0x1(%eax),%ecx
     9ee:	8b 45 0c             	mov    0xc(%ebp),%eax
     9f1:	8d 50 ff             	lea    -0x1(%eax),%edx
     9f4:	8b 45 0c             	mov    0xc(%ebp),%eax
     9f7:	83 e8 01             	sub    $0x1,%eax
     9fa:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     a01:	00 
     a02:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     a06:	89 54 24 14          	mov    %edx,0x14(%esp)
     a0a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     a11:	00 
     a12:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a16:	8b 45 08             	mov    0x8(%ebp),%eax
     a19:	89 04 24             	mov    %eax,(%esp)
     a1c:	8b 45 0c             	mov    0xc(%ebp),%eax
     a1f:	89 44 24 04          	mov    %eax,0x4(%esp)
     a23:	8b 45 10             	mov    0x10(%ebp),%eax
     a26:	89 44 24 08          	mov    %eax,0x8(%esp)
     a2a:	e8 b2 2d 00 00       	call   37e1 <draw_line>
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     a2f:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     a32:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     a35:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     a38:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     a3b:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     a3e:	83 e8 01             	sub    $0x1,%eax
     a41:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     a48:	00 
     a49:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     a4d:	89 54 24 14          	mov    %edx,0x14(%esp)
     a51:	89 44 24 10          	mov    %eax,0x10(%esp)
     a55:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a5c:	00 
     a5d:	8b 45 08             	mov    0x8(%ebp),%eax
     a60:	89 04 24             	mov    %eax,(%esp)
     a63:	8b 45 0c             	mov    0xc(%ebp),%eax
     a66:	89 44 24 04          	mov    %eax,0x4(%esp)
     a6a:	8b 45 10             	mov    0x10(%ebp),%eax
     a6d:	89 44 24 08          	mov    %eax,0x8(%esp)
     a71:	e8 6b 2d 00 00       	call   37e1 <draw_line>
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     a76:	8b 45 10             	mov    0x10(%ebp),%eax
     a79:	83 e8 01             	sub    $0x1,%eax
     a7c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     a83:	00 
     a84:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     a8b:	00 
     a8c:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     a93:	00 
     a94:	89 44 24 10          	mov    %eax,0x10(%esp)
     a98:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a9f:	00 
     aa0:	8b 45 08             	mov    0x8(%ebp),%eax
     aa3:	89 04 24             	mov    %eax,(%esp)
     aa6:	8b 45 0c             	mov    0xc(%ebp),%eax
     aa9:	89 44 24 04          	mov    %eax,0x4(%esp)
     aad:	8b 45 10             	mov    0x10(%ebp),%eax
     ab0:	89 44 24 08          	mov    %eax,0x8(%esp)
     ab4:	e8 28 2d 00 00       	call   37e1 <draw_line>
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     ab9:	8b 45 0c             	mov    0xc(%ebp),%eax
     abc:	83 e8 02             	sub    $0x2,%eax
     abf:	c7 44 24 1c 18 c6 00 	movl   $0xc618,0x1c(%esp)
     ac6:	00 
     ac7:	c7 44 24 18 46 00 00 	movl   $0x46,0x18(%esp)
     ace:	00 
     acf:	89 44 24 14          	mov    %eax,0x14(%esp)
     ad3:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     ada:	00 
     adb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     ae2:	00 
     ae3:	8b 45 08             	mov    0x8(%ebp),%eax
     ae6:	89 04 24             	mov    %eax,(%esp)
     ae9:	8b 45 0c             	mov    0xc(%ebp),%eax
     aec:	89 44 24 04          	mov    %eax,0x4(%esp)
     af0:	8b 45 10             	mov    0x10(%ebp),%eax
     af3:	89 44 24 08          	mov    %eax,0x8(%esp)
     af7:	e8 70 25 00 00       	call   306c <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     afc:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     b03:	00 
     b04:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     b0b:	00 
     b0c:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     b13:	00 
     b14:	c7 44 24 0c a8 b6 00 	movl   $0xb6a8,0xc(%esp)
     b1b:	00 
     b1c:	8b 45 08             	mov    0x8(%ebp),%eax
     b1f:	89 04 24             	mov    %eax,(%esp)
     b22:	8b 45 0c             	mov    0xc(%ebp),%eax
     b25:	89 44 24 04          	mov    %eax,0x4(%esp)
     b29:	8b 45 10             	mov    0x10(%ebp),%eax
     b2c:	89 44 24 08          	mov    %eax,0x8(%esp)
     b30:	e8 16 2b 00 00       	call   364b <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     b35:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
     b3c:	00 
     b3d:	c7 44 24 0c 40 fa 00 	movl   $0xfa40,0xc(%esp)
     b44:	00 
     b45:	8b 45 08             	mov    0x8(%ebp),%eax
     b48:	89 04 24             	mov    %eax,(%esp)
     b4b:	8b 45 0c             	mov    0xc(%ebp),%eax
     b4e:	89 44 24 04          	mov    %eax,0x4(%esp)
     b52:	8b 45 10             	mov    0x10(%ebp),%eax
     b55:	89 44 24 08          	mov    %eax,0x8(%esp)
     b59:	e8 5e 30 00 00       	call   3bbc <draw_iconlist>
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     b5e:	c7 44 24 18 23 00 00 	movl   $0x23,0x18(%esp)
     b65:	00 
     b66:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
     b6d:	00 
     b6e:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     b75:	00 
     b76:	c7 44 24 0c cc 39 01 	movl   $0x139cc,0xc(%esp)
     b7d:	00 
     b7e:	8b 45 08             	mov    0x8(%ebp),%eax
     b81:	89 04 24             	mov    %eax,(%esp)
     b84:	8b 45 0c             	mov    0xc(%ebp),%eax
     b87:	89 44 24 04          	mov    %eax,0x4(%esp)
     b8b:	8b 45 10             	mov    0x10(%ebp),%eax
     b8e:	89 44 24 08          	mov    %eax,0x8(%esp)
     b92:	e8 b4 2a 00 00       	call   364b <puts_str>
				- (BUTTON_HEIGHT + 3) );


}
     b97:	c9                   	leave  
     b98:	c3                   	ret    

00000b99 <drawFinderContent>:

void drawFinderContent(Context context) {
     b99:	55                   	push   %ebp
     b9a:	89 e5                	mov    %esp,%ebp
     b9c:	53                   	push   %ebx
     b9d:	83 ec 64             	sub    $0x64,%esp
	struct fileItem *p;
	int tempItemCounter = 0;
     ba0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     ba7:	c7 45 ec 46 00 00 00 	movl   $0x46,-0x14(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     bae:	a1 44 f9 00 00       	mov    0xf944,%eax
     bb3:	83 f8 02             	cmp    $0x2,%eax
     bb6:	75 04                	jne    bbc <drawFinderContent+0x23>
     bb8:	83 45 ec 1c          	addl   $0x1c,-0x14(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     bbc:	8b 45 10             	mov    0x10(%ebp),%eax
     bbf:	83 e8 48             	sub    $0x48,%eax
	int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     bc2:	89 c1                	mov    %eax,%ecx
     bc4:	8b 45 0c             	mov    0xc(%ebp),%eax
     bc7:	83 e8 02             	sub    $0x2,%eax
     bca:	89 c2                	mov    %eax,%edx
     bcc:	8b 45 ec             	mov    -0x14(%ebp),%eax
     bcf:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     bd6:	00 
     bd7:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     bdb:	89 54 24 14          	mov    %edx,0x14(%esp)
     bdf:	89 44 24 10          	mov    %eax,0x10(%esp)
     be3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     bea:	00 
     beb:	8b 45 08             	mov    0x8(%ebp),%eax
     bee:	89 04 24             	mov    %eax,(%esp)
     bf1:	8b 45 0c             	mov    0xc(%ebp),%eax
     bf4:	89 44 24 04          	mov    %eax,0x4(%esp)
     bf8:	8b 45 10             	mov    0x10(%ebp),%eax
     bfb:	89 44 24 08          	mov    %eax,0x8(%esp)
     bff:	e8 68 24 00 00       	call   306c <fill_rect>
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     c04:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     c07:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     c0a:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     c0d:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     c10:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     c13:	83 e8 01             	sub    $0x1,%eax
     c16:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     c1d:	00 
     c1e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     c22:	89 54 24 14          	mov    %edx,0x14(%esp)
     c26:	89 44 24 10          	mov    %eax,0x10(%esp)
     c2a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     c31:	00 
     c32:	8b 45 08             	mov    0x8(%ebp),%eax
     c35:	89 04 24             	mov    %eax,(%esp)
     c38:	8b 45 0c             	mov    0xc(%ebp),%eax
     c3b:	89 44 24 04          	mov    %eax,0x4(%esp)
     c3f:	8b 45 10             	mov    0x10(%ebp),%eax
     c42:	89 44 24 08          	mov    %eax,0x8(%esp)
     c46:	e8 96 2b 00 00       	call   37e1 <draw_line>

	//printf(0, "listing complete!\n");
	//printItemList();
//	p = fileItemList;
//	q = 0;
	if (keyContent.length == 0) {
     c4b:	a1 e0 39 01 00       	mov    0x139e0,%eax
     c50:	85 c0                	test   %eax,%eax
     c52:	0f 85 a3 00 00 00    	jne    cfb <drawFinderContent+0x162>
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
     c58:	c7 44 24 04 b0 b6 00 	movl   $0xb6b0,0x4(%esp)
     c5f:	00 
     c60:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c67:	e8 89 43 00 00       	call   4ff5 <printf>
//		freeFileItemList();
//		list(".");
		p = fileItemList;
     c6c:	a1 ac 02 01 00       	mov    0x102ac,%eax
     c71:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while (p != 0) {
     c74:	eb 7a                	jmp    cf0 <drawFinderContent+0x157>
			//printf(0, "draw item\n");
			drawItem(context, p->name, p->st, p->pos, p->chosen);
     c76:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c79:	8b 40 28             	mov    0x28(%eax),%eax
     c7c:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c7f:	8b 52 14             	mov    0x14(%edx),%edx
     c82:	89 44 24 34          	mov    %eax,0x34(%esp)
     c86:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c89:	8b 48 18             	mov    0x18(%eax),%ecx
     c8c:	89 4c 24 24          	mov    %ecx,0x24(%esp)
     c90:	8b 48 1c             	mov    0x1c(%eax),%ecx
     c93:	89 4c 24 28          	mov    %ecx,0x28(%esp)
     c97:	8b 48 20             	mov    0x20(%eax),%ecx
     c9a:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
     c9e:	8b 40 24             	mov    0x24(%eax),%eax
     ca1:	89 44 24 30          	mov    %eax,0x30(%esp)
     ca5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ca8:	8b 08                	mov    (%eax),%ecx
     caa:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     cae:	8b 48 04             	mov    0x4(%eax),%ecx
     cb1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     cb5:	8b 48 08             	mov    0x8(%eax),%ecx
     cb8:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     cbc:	8b 48 0c             	mov    0xc(%eax),%ecx
     cbf:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
     cc3:	8b 40 10             	mov    0x10(%eax),%eax
     cc6:	89 44 24 20          	mov    %eax,0x20(%esp)
     cca:	89 54 24 0c          	mov    %edx,0xc(%esp)
     cce:	8b 45 08             	mov    0x8(%ebp),%eax
     cd1:	89 04 24             	mov    %eax,(%esp)
     cd4:	8b 45 0c             	mov    0xc(%ebp),%eax
     cd7:	89 44 24 04          	mov    %eax,0x4(%esp)
     cdb:	8b 45 10             	mov    0x10(%ebp),%eax
     cde:	89 44 24 08          	mov    %eax,0x8(%esp)
     ce2:	e8 4b f8 ff ff       	call   532 <drawItem>
			p = p->next;
     ce7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cea:	8b 40 2c             	mov    0x2c(%eax),%eax
     ced:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (keyContent.length == 0) {
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
		while (p != 0) {
     cf0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     cf4:	75 80                	jne    c76 <drawFinderContent+0xdd>
     cf6:	e9 04 01 00 00       	jmp    dff <drawFinderContent+0x266>
			drawItem(context, p->name, p->st, p->pos, p->chosen);
			p = p->next;
		}
	}
	else{
		p = fileItemList;
     cfb:	a1 ac 02 01 00       	mov    0x102ac,%eax
     d00:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while(p != 0) {
     d03:	e9 ed 00 00 00       	jmp    df5 <drawFinderContent+0x25c>
			printf(0, "now you are searching!\n");
     d08:	c7 44 24 04 09 b7 00 	movl   $0xb709,0x4(%esp)
     d0f:	00 
     d10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d17:	e8 d9 42 00 00       	call   4ff5 <printf>
		   	if (strstr(p->name, keyContent.content)) {
     d1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d1f:	8b 40 14             	mov    0x14(%eax),%eax
     d22:	c7 44 24 04 cc 39 01 	movl   $0x139cc,0x4(%esp)
     d29:	00 
     d2a:	89 04 24             	mov    %eax,(%esp)
     d2d:	e8 ce f2 ff ff       	call   0 <strstr>
     d32:	85 c0                	test   %eax,%eax
     d34:	0f 84 b2 00 00 00    	je     dec <drawFinderContent+0x253>
				drawItem(context, p->name, p->st, getPos(context, tempItemCounter++), p->chosen);
     d3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d3d:	8b 58 28             	mov    0x28(%eax),%ebx
     d40:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d43:	8d 50 01             	lea    0x1(%eax),%edx
     d46:	89 55 f0             	mov    %edx,-0x10(%ebp)
     d49:	8d 55 dc             	lea    -0x24(%ebp),%edx
     d4c:	89 44 24 10          	mov    %eax,0x10(%esp)
     d50:	8b 45 08             	mov    0x8(%ebp),%eax
     d53:	89 44 24 04          	mov    %eax,0x4(%esp)
     d57:	8b 45 0c             	mov    0xc(%ebp),%eax
     d5a:	89 44 24 08          	mov    %eax,0x8(%esp)
     d5e:	8b 45 10             	mov    0x10(%ebp),%eax
     d61:	89 44 24 0c          	mov    %eax,0xc(%esp)
     d65:	89 14 24             	mov    %edx,(%esp)
     d68:	e8 01 03 00 00       	call   106e <getPos>
     d6d:	83 ec 04             	sub    $0x4,%esp
     d70:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d73:	8b 50 14             	mov    0x14(%eax),%edx
     d76:	89 5c 24 34          	mov    %ebx,0x34(%esp)
     d7a:	8b 45 dc             	mov    -0x24(%ebp),%eax
     d7d:	89 44 24 24          	mov    %eax,0x24(%esp)
     d81:	8b 45 e0             	mov    -0x20(%ebp),%eax
     d84:	89 44 24 28          	mov    %eax,0x28(%esp)
     d88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d8b:	89 44 24 2c          	mov    %eax,0x2c(%esp)
     d8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d92:	89 44 24 30          	mov    %eax,0x30(%esp)
     d96:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d99:	8b 08                	mov    (%eax),%ecx
     d9b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     d9f:	8b 48 04             	mov    0x4(%eax),%ecx
     da2:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     da6:	8b 48 08             	mov    0x8(%eax),%ecx
     da9:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     dad:	8b 48 0c             	mov    0xc(%eax),%ecx
     db0:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
     db4:	8b 40 10             	mov    0x10(%eax),%eax
     db7:	89 44 24 20          	mov    %eax,0x20(%esp)
     dbb:	89 54 24 0c          	mov    %edx,0xc(%esp)
     dbf:	8b 45 08             	mov    0x8(%ebp),%eax
     dc2:	89 04 24             	mov    %eax,(%esp)
     dc5:	8b 45 0c             	mov    0xc(%ebp),%eax
     dc8:	89 44 24 04          	mov    %eax,0x4(%esp)
     dcc:	8b 45 10             	mov    0x10(%ebp),%eax
     dcf:	89 44 24 08          	mov    %eax,0x8(%esp)
     dd3:	e8 5a f7 ff ff       	call   532 <drawItem>
				printf(0, "now you are searching! printing\n");
     dd8:	c7 44 24 04 24 b7 00 	movl   $0xb724,0x4(%esp)
     ddf:	00 
     de0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     de7:	e8 09 42 00 00       	call   4ff5 <printf>
		   	}
			p = p->next;
     dec:	8b 45 f4             	mov    -0xc(%ebp),%eax
     def:	8b 40 2c             	mov    0x2c(%eax),%eax
     df2:	89 45 f4             	mov    %eax,-0xc(%ebp)
			p = p->next;
		}
	}
	else{
		p = fileItemList;
		while(p != 0) {
     df5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     df9:	0f 85 09 ff ff ff    	jne    d08 <drawFinderContent+0x16f>
			p = p->next;
			
		}
	}

	if (style == LIST_STYLE)
     dff:	a1 44 f9 00 00       	mov    0xf944,%eax
     e04:	83 f8 02             	cmp    $0x2,%eax
     e07:	0f 85 39 01 00 00    	jne    f46 <drawFinderContent+0x3ad>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     e0d:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     e14:	00 
     e15:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     e1c:	00 
     e1d:	c7 44 24 14 26 00 00 	movl   $0x26,0x14(%esp)
     e24:	00 
     e25:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     e2c:	00 
     e2d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     e34:	00 
     e35:	8b 45 08             	mov    0x8(%ebp),%eax
     e38:	89 04 24             	mov    %eax,(%esp)
     e3b:	8b 45 0c             	mov    0xc(%ebp),%eax
     e3e:	89 44 24 04          	mov    %eax,0x4(%esp)
     e42:	8b 45 10             	mov    0x10(%ebp),%eax
     e45:	89 44 24 08          	mov    %eax,0x8(%esp)
     e49:	e8 1e 22 00 00       	call   306c <fill_rect>
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     e4e:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     e55:	00 
     e56:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     e5d:	00 
     e5e:	c7 44 24 14 9f 00 00 	movl   $0x9f,0x14(%esp)
     e65:	00 
     e66:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     e6d:	00 
     e6e:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
     e75:	00 
     e76:	8b 45 08             	mov    0x8(%ebp),%eax
     e79:	89 04 24             	mov    %eax,(%esp)
     e7c:	8b 45 0c             	mov    0xc(%ebp),%eax
     e7f:	89 44 24 04          	mov    %eax,0x4(%esp)
     e83:	8b 45 10             	mov    0x10(%ebp),%eax
     e86:	89 44 24 08          	mov    %eax,0x8(%esp)
     e8a:	e8 dd 21 00 00       	call   306c <fill_rect>
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     e8f:	8b 45 0c             	mov    0xc(%ebp),%eax
     e92:	2d c9 00 00 00       	sub    $0xc9,%eax
     e97:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     e9e:	00 
     e9f:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     ea6:	00 
     ea7:	89 44 24 14          	mov    %eax,0x14(%esp)
     eab:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     eb2:	00 
     eb3:	c7 44 24 0c c8 00 00 	movl   $0xc8,0xc(%esp)
     eba:	00 
     ebb:	8b 45 08             	mov    0x8(%ebp),%eax
     ebe:	89 04 24             	mov    %eax,(%esp)
     ec1:	8b 45 0c             	mov    0xc(%ebp),%eax
     ec4:	89 44 24 04          	mov    %eax,0x4(%esp)
     ec8:	8b 45 10             	mov    0x10(%ebp),%eax
     ecb:	89 44 24 08          	mov    %eax,0x8(%esp)
     ecf:	e8 98 21 00 00       	call   306c <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     ed4:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     edb:	00 
     edc:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
     ee3:	00 
     ee4:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     eeb:	00 
     eec:	c7 44 24 0c 45 b7 00 	movl   $0xb745,0xc(%esp)
     ef3:	00 
     ef4:	8b 45 08             	mov    0x8(%ebp),%eax
     ef7:	89 04 24             	mov    %eax,(%esp)
     efa:	8b 45 0c             	mov    0xc(%ebp),%eax
     efd:	89 44 24 04          	mov    %eax,0x4(%esp)
     f01:	8b 45 10             	mov    0x10(%ebp),%eax
     f04:	89 44 24 08          	mov    %eax,0x8(%esp)
     f08:	e8 3e 27 00 00       	call   364b <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     f0d:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     f14:	00 
     f15:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
     f1c:	00 
     f1d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     f24:	00 
     f25:	c7 44 24 0c 4a b7 00 	movl   $0xb74a,0xc(%esp)
     f2c:	00 
     f2d:	8b 45 08             	mov    0x8(%ebp),%eax
     f30:	89 04 24             	mov    %eax,(%esp)
     f33:	8b 45 0c             	mov    0xc(%ebp),%eax
     f36:	89 44 24 04          	mov    %eax,0x4(%esp)
     f3a:	8b 45 10             	mov    0x10(%ebp),%eax
     f3d:	89 44 24 08          	mov    %eax,0x8(%esp)
     f41:	e8 05 27 00 00       	call   364b <puts_str>
		}
}
     f46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f49:	c9                   	leave  
     f4a:	c3                   	ret    

00000f4b <int2str>:

char * int2str(int i)
{
     f4b:	55                   	push   %ebp
     f4c:	89 e5                	mov    %esp,%ebp
     f4e:	53                   	push   %ebx
     f4f:	83 ec 24             	sub    $0x24,%esp
	int j;
	int n = 0;
     f52:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     f59:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     f60:	e8 7c 43 00 00       	call   52e1 <malloc>
     f65:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     f68:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     f6f:	e8 6d 43 00 00       	call   52e1 <malloc>
     f74:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     f77:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f7a:	8d 50 01             	lea    0x1(%eax),%edx
     f7d:	89 55 f0             	mov    %edx,-0x10(%ebp)
     f80:	89 c2                	mov    %eax,%edx
     f82:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f85:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     f88:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f8b:	ba 67 66 66 66       	mov    $0x66666667,%edx
     f90:	89 c8                	mov    %ecx,%eax
     f92:	f7 ea                	imul   %edx
     f94:	c1 fa 02             	sar    $0x2,%edx
     f97:	89 c8                	mov    %ecx,%eax
     f99:	c1 f8 1f             	sar    $0x1f,%eax
     f9c:	29 c2                	sub    %eax,%edx
     f9e:	89 d0                	mov    %edx,%eax
     fa0:	c1 e0 02             	shl    $0x2,%eax
     fa3:	01 d0                	add    %edx,%eax
     fa5:	01 c0                	add    %eax,%eax
     fa7:	29 c1                	sub    %eax,%ecx
     fa9:	89 ca                	mov    %ecx,%edx
     fab:	89 d0                	mov    %edx,%eax
     fad:	83 c0 30             	add    $0x30,%eax
     fb0:	88 03                	mov    %al,(%ebx)
		i /= 10;
     fb2:	8b 4d 08             	mov    0x8(%ebp),%ecx
     fb5:	ba 67 66 66 66       	mov    $0x66666667,%edx
     fba:	89 c8                	mov    %ecx,%eax
     fbc:	f7 ea                	imul   %edx
     fbe:	c1 fa 02             	sar    $0x2,%edx
     fc1:	89 c8                	mov    %ecx,%eax
     fc3:	c1 f8 1f             	sar    $0x1f,%eax
     fc6:	29 c2                	sub    %eax,%edx
     fc8:	89 d0                	mov    %edx,%eax
     fca:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     fcd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     fd1:	75 a4                	jne    f77 <int2str+0x2c>
	result[n] = 0;
     fd3:	8b 55 f0             	mov    -0x10(%ebp),%edx
     fd6:	8b 45 ec             	mov    -0x14(%ebp),%eax
     fd9:	01 d0                	add    %edx,%eax
     fdb:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     fde:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fe5:	eb 21                	jmp    1008 <int2str+0xbd>
	{
		temp[j] = result[n-1-j];
     fe7:	8b 55 f4             	mov    -0xc(%ebp),%edx
     fea:	8b 45 e8             	mov    -0x18(%ebp),%eax
     fed:	01 c2                	add    %eax,%edx
     fef:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ff2:	83 e8 01             	sub    $0x1,%eax
     ff5:	2b 45 f4             	sub    -0xc(%ebp),%eax
     ff8:	89 c1                	mov    %eax,%ecx
     ffa:	8b 45 ec             	mov    -0x14(%ebp),%eax
     ffd:	01 c8                	add    %ecx,%eax
     fff:	0f b6 00             	movzbl (%eax),%eax
    1002:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
    1004:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1008:	8b 45 f4             	mov    -0xc(%ebp),%eax
    100b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    100e:	7c d7                	jl     fe7 <int2str+0x9c>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
    1010:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1013:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1016:	01 d0                	add    %edx,%eax
    1018:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
    101b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    101e:	89 04 24             	mov    %eax,(%esp)
    1021:	e8 82 41 00 00       	call   51a8 <free>
	return temp;
    1026:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
    1029:	83 c4 24             	add    $0x24,%esp
    102c:	5b                   	pop    %ebx
    102d:	5d                   	pop    %ebp
    102e:	c3                   	ret    

0000102f <printItemList>:

void printItemList() {
    102f:	55                   	push   %ebp
    1030:	89 e5                	mov    %esp,%ebp
    1032:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p;
	p = fileItemList;
    1035:	a1 ac 02 01 00       	mov    0x102ac,%eax
    103a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    103d:	eb 27                	jmp    1066 <printItemList+0x37>
		printf(0, "%s\n", p->name);
    103f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1042:	8b 40 14             	mov    0x14(%eax),%eax
    1045:	89 44 24 08          	mov    %eax,0x8(%esp)
    1049:	c7 44 24 04 4f b7 00 	movl   $0xb74f,0x4(%esp)
    1050:	00 
    1051:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1058:	e8 98 3f 00 00       	call   4ff5 <printf>
		p = p->next;
    105d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1060:	8b 40 2c             	mov    0x2c(%eax),%eax
    1063:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
    1066:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    106a:	75 d3                	jne    103f <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
    106c:	c9                   	leave  
    106d:	c3                   	ret    

0000106e <getPos>:

Rect getPos(Context context, int n) {
    106e:	55                   	push   %ebp
    106f:	89 e5                	mov    %esp,%ebp
    1071:	83 ec 48             	sub    $0x48,%esp
	if (style == ICON_STYLE) {
    1074:	a1 44 f9 00 00       	mov    0xf944,%eax
    1079:	83 f8 01             	cmp    $0x1,%eax
    107c:	0f 85 80 00 00 00    	jne    1102 <getPos+0x94>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    1082:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1085:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
    108a:	89 c8                	mov    %ecx,%eax
    108c:	f7 ea                	imul   %edx
    108e:	c1 fa 06             	sar    $0x6,%edx
    1091:	89 c8                	mov    %ecx,%eax
    1093:	c1 f8 1f             	sar    $0x1f,%eax
    1096:	29 c2                	sub    %eax,%edx
    1098:	89 d0                	mov    %edx,%eax
    109a:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
    109d:	8b 45 18             	mov    0x18(%ebp),%eax
    10a0:	99                   	cltd   
    10a1:	f7 7d f4             	idivl  -0xc(%ebp)
    10a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
    10a7:	8b 45 18             	mov    0x18(%ebp),%eax
    10aa:	99                   	cltd   
    10ab:	f7 7d f4             	idivl  -0xc(%ebp)
    10ae:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
    10b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10b4:	6b c0 73             	imul   $0x73,%eax,%eax
    10b7:	83 c0 5a             	add    $0x5a,%eax
    10ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    10bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10c0:	01 c0                	add    %eax,%eax
    10c2:	89 c2                	mov    %eax,%edx
    10c4:	c1 e2 06             	shl    $0x6,%edx
    10c7:	01 d0                	add    %edx,%eax
    10c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
    10cc:	8b 15 a0 02 01 00    	mov    0x102a0,%edx
    10d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10d5:	01 c2                	add    %eax,%edx
    10d7:	8b 45 08             	mov    0x8(%ebp),%eax
    10da:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
    10e1:	00 
    10e2:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
    10e9:	00 
    10ea:	89 54 24 08          	mov    %edx,0x8(%esp)
    10ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    10f1:	89 54 24 04          	mov    %edx,0x4(%esp)
    10f5:	89 04 24             	mov    %eax,(%esp)
    10f8:	e8 b9 33 00 00       	call   44b6 <initRect>
    10fd:	83 ec 04             	sub    $0x4,%esp
    1100:	eb 3d                	jmp    113f <getPos+0xd1>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
    1102:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1105:	8b 55 18             	mov    0x18(%ebp),%edx
    1108:	89 d0                	mov    %edx,%eax
    110a:	c1 e0 05             	shl    $0x5,%eax
    110d:	29 d0                	sub    %edx,%eax
    110f:	8d 50 62             	lea    0x62(%eax),%edx
    1112:	a1 a0 02 01 00       	mov    0x102a0,%eax
    1117:	01 c2                	add    %eax,%edx
    1119:	8b 45 08             	mov    0x8(%ebp),%eax
    111c:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    1123:	00 
    1124:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1128:	89 54 24 08          	mov    %edx,0x8(%esp)
    112c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1133:	00 
    1134:	89 04 24             	mov    %eax,(%esp)
    1137:	e8 7a 33 00 00       	call   44b6 <initRect>
    113c:	83 ec 04             	sub    $0x4,%esp
				LIST_ITEM_HEIGHT);
	}
}
    113f:	8b 45 08             	mov    0x8(%ebp),%eax
    1142:	c9                   	leave  
    1143:	c2 04 00             	ret    $0x4

00001146 <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
    1146:	55                   	push   %ebp
    1147:	89 e5                	mov    %esp,%ebp
    1149:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
    114c:	a1 44 f9 00 00       	mov    0xf944,%eax
    1151:	83 f8 01             	cmp    $0x1,%eax
    1154:	75 0d                	jne    1163 <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
    1156:	8b 45 28             	mov    0x28(%ebp),%eax
    1159:	83 f8 45             	cmp    $0x45,%eax
    115c:	7f 12                	jg     1170 <addItemEvent+0x2a>
			return;
    115e:	e9 e0 00 00 00       	jmp    1243 <addItemEvent+0xfd>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
    1163:	8b 45 28             	mov    0x28(%ebp),%eax
    1166:	83 f8 61             	cmp    $0x61,%eax
    1169:	7f 05                	jg     1170 <addItemEvent+0x2a>
			return;
    116b:	e9 d3 00 00 00       	jmp    1243 <addItemEvent+0xfd>
	}
	switch (item.st.type) {
    1170:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    1174:	98                   	cwtl   
    1175:	83 f8 01             	cmp    $0x1,%eax
    1178:	74 45                	je     11bf <addItemEvent+0x79>
    117a:	83 f8 02             	cmp    $0x2,%eax
    117d:	0f 85 ac 00 00 00    	jne    122f <addItemEvent+0xe9>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    1183:	c7 44 24 18 0f 25 00 	movl   $0x250f,0x18(%esp)
    118a:	00 
    118b:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    1192:	00 
    1193:	8b 45 24             	mov    0x24(%ebp),%eax
    1196:	89 44 24 04          	mov    %eax,0x4(%esp)
    119a:	8b 45 28             	mov    0x28(%ebp),%eax
    119d:	89 44 24 08          	mov    %eax,0x8(%esp)
    11a1:	8b 45 2c             	mov    0x2c(%ebp),%eax
    11a4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    11a8:	8b 45 30             	mov    0x30(%ebp),%eax
    11ab:	89 44 24 10          	mov    %eax,0x10(%esp)
    11af:	8b 45 08             	mov    0x8(%ebp),%eax
    11b2:	89 04 24             	mov    %eax,(%esp)
    11b5:	e8 e8 33 00 00       	call   45a2 <createClickable>
		break;
    11ba:	e9 84 00 00 00       	jmp    1243 <addItemEvent+0xfd>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    11bf:	c7 44 24 18 0f 25 00 	movl   $0x250f,0x18(%esp)
    11c6:	00 
    11c7:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    11ce:	00 
    11cf:	8b 45 24             	mov    0x24(%ebp),%eax
    11d2:	89 44 24 04          	mov    %eax,0x4(%esp)
    11d6:	8b 45 28             	mov    0x28(%ebp),%eax
    11d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    11dd:	8b 45 2c             	mov    0x2c(%ebp),%eax
    11e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    11e4:	8b 45 30             	mov    0x30(%ebp),%eax
    11e7:	89 44 24 10          	mov    %eax,0x10(%esp)
    11eb:	8b 45 08             	mov    0x8(%ebp),%eax
    11ee:	89 04 24             	mov    %eax,(%esp)
    11f1:	e8 ac 33 00 00       	call   45a2 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
    11f6:	c7 44 24 18 91 18 00 	movl   $0x1891,0x18(%esp)
    11fd:	00 
    11fe:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
    1205:	00 
    1206:	8b 45 24             	mov    0x24(%ebp),%eax
    1209:	89 44 24 04          	mov    %eax,0x4(%esp)
    120d:	8b 45 28             	mov    0x28(%ebp),%eax
    1210:	89 44 24 08          	mov    %eax,0x8(%esp)
    1214:	8b 45 2c             	mov    0x2c(%ebp),%eax
    1217:	89 44 24 0c          	mov    %eax,0xc(%esp)
    121b:	8b 45 30             	mov    0x30(%ebp),%eax
    121e:	89 44 24 10          	mov    %eax,0x10(%esp)
    1222:	8b 45 08             	mov    0x8(%ebp),%eax
    1225:	89 04 24             	mov    %eax,(%esp)
    1228:	e8 75 33 00 00       	call   45a2 <createClickable>
		break;
    122d:	eb 14                	jmp    1243 <addItemEvent+0xfd>
	default:
		printf(0, "unknown file type!");
    122f:	c7 44 24 04 53 b7 00 	movl   $0xb753,0x4(%esp)
    1236:	00 
    1237:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    123e:	e8 b2 3d 00 00       	call   4ff5 <printf>
	}
}
    1243:	c9                   	leave  
    1244:	c3                   	ret    

00001245 <addListEvent>:

void addListEvent(ClickableManager *cm) {
    1245:	55                   	push   %ebp
    1246:	89 e5                	mov    %esp,%ebp
    1248:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
    124b:	a1 ac 02 01 00       	mov    0x102ac,%eax
    1250:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    1253:	eb 70                	jmp    12c5 <addListEvent+0x80>
		temp = p;
    1255:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1258:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
    125b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    125e:	8b 40 2c             	mov    0x2c(%eax),%eax
    1261:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
    1264:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1267:	8b 10                	mov    (%eax),%edx
    1269:	89 54 24 04          	mov    %edx,0x4(%esp)
    126d:	8b 50 04             	mov    0x4(%eax),%edx
    1270:	89 54 24 08          	mov    %edx,0x8(%esp)
    1274:	8b 50 08             	mov    0x8(%eax),%edx
    1277:	89 54 24 0c          	mov    %edx,0xc(%esp)
    127b:	8b 50 0c             	mov    0xc(%eax),%edx
    127e:	89 54 24 10          	mov    %edx,0x10(%esp)
    1282:	8b 50 10             	mov    0x10(%eax),%edx
    1285:	89 54 24 14          	mov    %edx,0x14(%esp)
    1289:	8b 50 14             	mov    0x14(%eax),%edx
    128c:	89 54 24 18          	mov    %edx,0x18(%esp)
    1290:	8b 50 18             	mov    0x18(%eax),%edx
    1293:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1297:	8b 50 1c             	mov    0x1c(%eax),%edx
    129a:	89 54 24 20          	mov    %edx,0x20(%esp)
    129e:	8b 50 20             	mov    0x20(%eax),%edx
    12a1:	89 54 24 24          	mov    %edx,0x24(%esp)
    12a5:	8b 50 24             	mov    0x24(%eax),%edx
    12a8:	89 54 24 28          	mov    %edx,0x28(%esp)
    12ac:	8b 50 28             	mov    0x28(%eax),%edx
    12af:	89 54 24 2c          	mov    %edx,0x2c(%esp)
    12b3:	8b 40 2c             	mov    0x2c(%eax),%eax
    12b6:	89 44 24 30          	mov    %eax,0x30(%esp)
    12ba:	8b 45 08             	mov    0x8(%ebp),%eax
    12bd:	89 04 24             	mov    %eax,(%esp)
    12c0:	e8 81 fe ff ff       	call   1146 <addItemEvent>
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
    12c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12c9:	75 8a                	jne    1255 <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
    12cb:	c9                   	leave  
    12cc:	c3                   	ret    

000012cd <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
    12cd:	55                   	push   %ebp
    12ce:	89 e5                	mov    %esp,%ebp
    12d0:	57                   	push   %edi
    12d1:	56                   	push   %esi
    12d2:	53                   	push   %ebx
    12d3:	83 ec 4c             	sub    $0x4c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    12d6:	c7 45 e0 0f 00 00 00 	movl   $0xf,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    12dd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    12e4:	e9 96 00 00 00       	jmp    137f <addWndEvent+0xb2>
		createClickable(cm,
    12e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12ec:	8b 1c 85 60 fd 00 00 	mov    0xfd60(,%eax,4),%ebx
    12f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12f6:	6b c0 34             	imul   $0x34,%eax,%eax
    12f9:	05 60 fa 00 00       	add    $0xfa60,%eax
    12fe:	8b 78 10             	mov    0x10(%eax),%edi
    1301:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1304:	6b c0 34             	imul   $0x34,%eax,%eax
    1307:	05 60 fa 00 00       	add    $0xfa60,%eax
    130c:	8b 70 0c             	mov    0xc(%eax),%esi
    130f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1312:	6b c0 34             	imul   $0x34,%eax,%eax
    1315:	05 60 fa 00 00       	add    $0xfa60,%eax
    131a:	8b 48 04             	mov    0x4(%eax),%ecx
    131d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1320:	6b c0 34             	imul   $0x34,%eax,%eax
    1323:	05 60 fa 00 00       	add    $0xfa60,%eax
    1328:	8b 10                	mov    (%eax),%edx
    132a:	8d 45 d0             	lea    -0x30(%ebp),%eax
    132d:	89 7c 24 10          	mov    %edi,0x10(%esp)
    1331:	89 74 24 0c          	mov    %esi,0xc(%esp)
    1335:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1339:	89 54 24 04          	mov    %edx,0x4(%esp)
    133d:	89 04 24             	mov    %eax,(%esp)
    1340:	e8 71 31 00 00       	call   44b6 <initRect>
    1345:	83 ec 04             	sub    $0x4,%esp
    1348:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    134c:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    1353:	00 
    1354:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1357:	89 44 24 04          	mov    %eax,0x4(%esp)
    135b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    135e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1362:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1365:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1369:	8b 45 dc             	mov    -0x24(%ebp),%eax
    136c:	89 44 24 10          	mov    %eax,0x10(%esp)
    1370:	8b 45 08             	mov    0x8(%ebp),%eax
    1373:	89 04 24             	mov    %eax,(%esp)
    1376:	e8 27 32 00 00       	call   45a2 <createClickable>
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
    137b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    137f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1382:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    1385:	0f 8c 5e ff ff ff    	jl     12e9 <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
    138b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    138e:	5b                   	pop    %ebx
    138f:	5e                   	pop    %esi
    1390:	5f                   	pop    %edi
    1391:	5d                   	pop    %ebp
    1392:	c3                   	ret    

00001393 <getFileItem>:

struct fileItem * getFileItem(Point point) {
    1393:	55                   	push   %ebp
    1394:	89 e5                	mov    %esp,%ebp
    1396:	83 ec 38             	sub    $0x38,%esp
	struct fileItem *p = fileItemList;
    1399:	a1 ac 02 01 00       	mov    0x102ac,%eax
    139e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    13a1:	eb 43                	jmp    13e6 <getFileItem+0x53>
		if (isIn(point, p->pos)) {
    13a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13a6:	8b 50 18             	mov    0x18(%eax),%edx
    13a9:	89 54 24 08          	mov    %edx,0x8(%esp)
    13ad:	8b 50 1c             	mov    0x1c(%eax),%edx
    13b0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    13b4:	8b 50 20             	mov    0x20(%eax),%edx
    13b7:	89 54 24 10          	mov    %edx,0x10(%esp)
    13bb:	8b 40 24             	mov    0x24(%eax),%eax
    13be:	89 44 24 14          	mov    %eax,0x14(%esp)
    13c2:	8b 45 08             	mov    0x8(%ebp),%eax
    13c5:	8b 55 0c             	mov    0xc(%ebp),%edx
    13c8:	89 04 24             	mov    %eax,(%esp)
    13cb:	89 54 24 04          	mov    %edx,0x4(%esp)
    13cf:	e8 3d 31 00 00       	call   4511 <isIn>
    13d4:	85 c0                	test   %eax,%eax
    13d6:	74 05                	je     13dd <getFileItem+0x4a>
			return p;
    13d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13db:	eb 14                	jmp    13f1 <getFileItem+0x5e>
		}
		p = p->next;
    13dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13e0:	8b 40 2c             	mov    0x2c(%eax),%eax
    13e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
    13e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13ea:	75 b7                	jne    13a3 <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
    13ec:	b8 00 00 00 00       	mov    $0x0,%eax
}
    13f1:	c9                   	leave  
    13f2:	c3                   	ret    

000013f3 <h_searchbox>:

void h_searchbox(Point p) {
    13f3:	55                   	push   %ebp
    13f4:	89 e5                	mov    %esp,%ebp
	isSearching = 1;
    13f6:	c7 05 a0 30 01 00 01 	movl   $0x1,0x130a0
    13fd:	00 00 00 
}
    1400:	5d                   	pop    %ebp
    1401:	c3                   	ret    

00001402 <scrollDown>:

void scrollDown() {
    1402:	55                   	push   %ebp
    1403:	89 e5                	mov    %esp,%ebp
    1405:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    1408:	a1 ac 02 01 00       	mov    0x102ac,%eax
    140d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
    1410:	a1 44 f9 00 00       	mov    0xf944,%eax
    1415:	83 f8 01             	cmp    $0x1,%eax
    1418:	75 44                	jne    145e <scrollDown+0x5c>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
    141a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141d:	8b 40 1c             	mov    0x1c(%eax),%eax
    1420:	3d 63 01 00 00       	cmp    $0x163,%eax
    1425:	7e 79                	jle    14a0 <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1427:	8b 45 f4             	mov    -0xc(%ebp),%eax
    142a:	8b 40 1c             	mov    0x1c(%eax),%eax
    142d:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1432:	7e 0f                	jle    1443 <scrollDown+0x41>
				scrollOffset -= SCROLL_UNIT;
    1434:	a1 a0 02 01 00       	mov    0x102a0,%eax
    1439:	83 e8 1e             	sub    $0x1e,%eax
    143c:	a3 a0 02 01 00       	mov    %eax,0x102a0
    1441:	eb 5d                	jmp    14a0 <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
    1443:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1446:	8b 40 1c             	mov    0x1c(%eax),%eax
    1449:	ba 63 01 00 00       	mov    $0x163,%edx
    144e:	29 c2                	sub    %eax,%edx
    1450:	a1 a0 02 01 00       	mov    0x102a0,%eax
    1455:	01 d0                	add    %edx,%eax
    1457:	a3 a0 02 01 00       	mov    %eax,0x102a0
    145c:	eb 42                	jmp    14a0 <scrollDown+0x9e>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
    145e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1461:	8b 40 1c             	mov    0x1c(%eax),%eax
    1464:	3d a4 01 00 00       	cmp    $0x1a4,%eax
    1469:	7e 35                	jle    14a0 <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    146b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    146e:	8b 40 1c             	mov    0x1c(%eax),%eax
    1471:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1476:	7e 0f                	jle    1487 <scrollDown+0x85>
				scrollOffset -= SCROLL_UNIT;
    1478:	a1 a0 02 01 00       	mov    0x102a0,%eax
    147d:	83 e8 1e             	sub    $0x1e,%eax
    1480:	a3 a0 02 01 00       	mov    %eax,0x102a0
    1485:	eb 19                	jmp    14a0 <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    1487:	8b 45 f4             	mov    -0xc(%ebp),%eax
    148a:	8b 40 1c             	mov    0x1c(%eax),%eax
    148d:	ba a4 01 00 00       	mov    $0x1a4,%edx
    1492:	29 c2                	sub    %eax,%edx
    1494:	a1 a0 02 01 00       	mov    0x102a0,%eax
    1499:	01 d0                	add    %edx,%eax
    149b:	a3 a0 02 01 00       	mov    %eax,0x102a0
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    14a0:	a1 a0 02 01 00       	mov    0x102a0,%eax
    14a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    14a9:	c7 44 24 04 68 b7 00 	movl   $0xb768,0x4(%esp)
    14b0:	00 
    14b1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    14b8:	e8 38 3b 00 00       	call   4ff5 <printf>
}
    14bd:	c9                   	leave  
    14be:	c3                   	ret    

000014bf <h_scrollDown>:

void h_scrollDown(Point p) {
    14bf:	55                   	push   %ebp
    14c0:	89 e5                	mov    %esp,%ebp
    14c2:	83 ec 38             	sub    $0x38,%esp
	scrollDown();
    14c5:	e8 38 ff ff ff       	call   1402 <scrollDown>
	freeFileItemList();
    14ca:	e8 9c ec ff ff       	call   16b <freeFileItemList>
	list(".");
    14cf:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    14d6:	e8 6e ed ff ff       	call   249 <list>
	drawFinderContent(context);
    14db:	a1 c0 39 01 00       	mov    0x139c0,%eax
    14e0:	89 04 24             	mov    %eax,(%esp)
    14e3:	a1 c4 39 01 00       	mov    0x139c4,%eax
    14e8:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ec:	a1 c8 39 01 00       	mov    0x139c8,%eax
    14f1:	89 44 24 08          	mov    %eax,0x8(%esp)
    14f5:	e8 9f f6 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    14fa:	a1 c0 39 01 00       	mov    0x139c0,%eax
    14ff:	89 04 24             	mov    %eax,(%esp)
    1502:	a1 c4 39 01 00       	mov    0x139c4,%eax
    1507:	89 44 24 04          	mov    %eax,0x4(%esp)
    150b:	a1 c8 39 01 00       	mov    0x139c8,%eax
    1510:	89 44 24 08          	mov    %eax,0x8(%esp)
    1514:	e8 86 f4 ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1519:	8d 45 e8             	lea    -0x18(%ebp),%eax
    151c:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1523:	00 
    1524:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    152b:	00 
    152c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1533:	00 
    1534:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    153b:	00 
    153c:	89 04 24             	mov    %eax,(%esp)
    153f:	e8 72 2f 00 00       	call   44b6 <initRect>
    1544:	83 ec 04             	sub    $0x4,%esp
    1547:	8b 45 e8             	mov    -0x18(%ebp),%eax
    154a:	89 44 24 04          	mov    %eax,0x4(%esp)
    154e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1551:	89 44 24 08          	mov    %eax,0x8(%esp)
    1555:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1558:	89 44 24 0c          	mov    %eax,0xc(%esp)
    155c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    155f:	89 44 24 10          	mov    %eax,0x10(%esp)
    1563:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    156a:	e8 4a 31 00 00       	call   46b9 <deleteClickable>
	addWndEvent(&cm);
    156f:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1576:	e8 52 fd ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    157b:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1582:	e8 be fc ff ff       	call   1245 <addListEvent>
}
    1587:	c9                   	leave  
    1588:	c3                   	ret    

00001589 <scrollUp>:

void scrollUp() {
    1589:	55                   	push   %ebp
    158a:	89 e5                	mov    %esp,%ebp
    158c:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    158f:	a1 ac 02 01 00       	mov    0x102ac,%eax
    1594:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
    1597:	eb 0f                	jmp    15a8 <scrollUp+0x1f>
	{
		p = q;
    1599:	8b 45 f4             	mov    -0xc(%ebp),%eax
    159c:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
    159f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a2:	8b 40 2c             	mov    0x2c(%eax),%eax
    15a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
    15a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15ac:	75 eb                	jne    1599 <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	if (style == ICON_STYLE){
    15ae:	a1 44 f9 00 00       	mov    0xf944,%eax
    15b3:	83 f8 01             	cmp    $0x1,%eax
    15b6:	75 40                	jne    15f8 <scrollUp+0x6f>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
    15b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15bb:	8b 40 1c             	mov    0x1c(%eax),%eax
    15be:	83 f8 45             	cmp    $0x45,%eax
    15c1:	7f 73                	jg     1636 <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
    15c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15c6:	8b 40 1c             	mov    0x1c(%eax),%eax
    15c9:	83 f8 e7             	cmp    $0xffffffe7,%eax
    15cc:	7d 0f                	jge    15dd <scrollUp+0x54>
				scrollOffset += SCROLL_UNIT;
    15ce:	a1 a0 02 01 00       	mov    0x102a0,%eax
    15d3:	83 c0 1e             	add    $0x1e,%eax
    15d6:	a3 a0 02 01 00       	mov    %eax,0x102a0
    15db:	eb 59                	jmp    1636 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
    15dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15e0:	8b 40 1c             	mov    0x1c(%eax),%eax
    15e3:	ba 46 00 00 00       	mov    $0x46,%edx
    15e8:	29 c2                	sub    %eax,%edx
    15ea:	a1 a0 02 01 00       	mov    0x102a0,%eax
    15ef:	01 d0                	add    %edx,%eax
    15f1:	a3 a0 02 01 00       	mov    %eax,0x102a0
    15f6:	eb 3e                	jmp    1636 <scrollUp+0xad>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    15f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15fb:	8b 40 1c             	mov    0x1c(%eax),%eax
    15fe:	83 f8 61             	cmp    $0x61,%eax
    1601:	7f 33                	jg     1636 <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    1603:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1606:	8b 40 1c             	mov    0x1c(%eax),%eax
    1609:	83 f8 43             	cmp    $0x43,%eax
    160c:	7f 0f                	jg     161d <scrollUp+0x94>
				scrollOffset += SCROLL_UNIT;
    160e:	a1 a0 02 01 00       	mov    0x102a0,%eax
    1613:	83 c0 1e             	add    $0x1e,%eax
    1616:	a3 a0 02 01 00       	mov    %eax,0x102a0
    161b:	eb 19                	jmp    1636 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    161d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1620:	8b 40 1c             	mov    0x1c(%eax),%eax
    1623:	ba 62 00 00 00       	mov    $0x62,%edx
    1628:	29 c2                	sub    %eax,%edx
    162a:	a1 a0 02 01 00       	mov    0x102a0,%eax
    162f:	01 d0                	add    %edx,%eax
    1631:	a3 a0 02 01 00       	mov    %eax,0x102a0
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    1636:	a1 a0 02 01 00       	mov    0x102a0,%eax
    163b:	89 44 24 08          	mov    %eax,0x8(%esp)
    163f:	c7 44 24 04 89 b7 00 	movl   $0xb789,0x4(%esp)
    1646:	00 
    1647:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    164e:	e8 a2 39 00 00       	call   4ff5 <printf>
}
    1653:	c9                   	leave  
    1654:	c3                   	ret    

00001655 <h_scrollUp>:

void h_scrollUp(Point p) {
    1655:	55                   	push   %ebp
    1656:	89 e5                	mov    %esp,%ebp
    1658:	83 ec 38             	sub    $0x38,%esp
	scrollUp();
    165b:	e8 29 ff ff ff       	call   1589 <scrollUp>
	freeFileItemList();
    1660:	e8 06 eb ff ff       	call   16b <freeFileItemList>
	list(".");
    1665:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    166c:	e8 d8 eb ff ff       	call   249 <list>
	drawFinderContent(context);
    1671:	a1 c0 39 01 00       	mov    0x139c0,%eax
    1676:	89 04 24             	mov    %eax,(%esp)
    1679:	a1 c4 39 01 00       	mov    0x139c4,%eax
    167e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1682:	a1 c8 39 01 00       	mov    0x139c8,%eax
    1687:	89 44 24 08          	mov    %eax,0x8(%esp)
    168b:	e8 09 f5 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    1690:	a1 c0 39 01 00       	mov    0x139c0,%eax
    1695:	89 04 24             	mov    %eax,(%esp)
    1698:	a1 c4 39 01 00       	mov    0x139c4,%eax
    169d:	89 44 24 04          	mov    %eax,0x4(%esp)
    16a1:	a1 c8 39 01 00       	mov    0x139c8,%eax
    16a6:	89 44 24 08          	mov    %eax,0x8(%esp)
    16aa:	e8 f0 f2 ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    16af:	8d 45 e8             	lea    -0x18(%ebp),%eax
    16b2:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    16b9:	00 
    16ba:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    16c1:	00 
    16c2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    16c9:	00 
    16ca:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    16d1:	00 
    16d2:	89 04 24             	mov    %eax,(%esp)
    16d5:	e8 dc 2d 00 00       	call   44b6 <initRect>
    16da:	83 ec 04             	sub    $0x4,%esp
    16dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16e0:	89 44 24 04          	mov    %eax,0x4(%esp)
    16e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16e7:	89 44 24 08          	mov    %eax,0x8(%esp)
    16eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16ee:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16f5:	89 44 24 10          	mov    %eax,0x10(%esp)
    16f9:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1700:	e8 b4 2f 00 00       	call   46b9 <deleteClickable>
	addWndEvent(&cm);
    1705:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    170c:	e8 bc fb ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    1711:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1718:	e8 28 fb ff ff       	call   1245 <addListEvent>
}
    171d:	c9                   	leave  
    171e:	c3                   	ret    

0000171f <updatePath>:

void updatePath(char *name) {
    171f:	55                   	push   %ebp
    1720:	89 e5                	mov    %esp,%ebp
    1722:	83 ec 28             	sub    $0x28,%esp
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    1725:	8b 45 08             	mov    0x8(%ebp),%eax
    1728:	89 04 24             	mov    %eax,(%esp)
    172b:	e8 09 35 00 00       	call   4c39 <strlen>
    1730:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    1733:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1737:	0f 85 84 00 00 00    	jne    17c1 <updatePath+0xa2>
    173d:	8b 45 08             	mov    0x8(%ebp),%eax
    1740:	0f b6 00             	movzbl (%eax),%eax
    1743:	3c 2e                	cmp    $0x2e,%al
    1745:	75 7a                	jne    17c1 <updatePath+0xa2>
    1747:	8b 45 08             	mov    0x8(%ebp),%eax
    174a:	83 c0 01             	add    $0x1,%eax
    174d:	0f b6 00             	movzbl (%eax),%eax
    1750:	3c 2e                	cmp    $0x2e,%al
    1752:	75 6d                	jne    17c1 <updatePath+0xa2>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1754:	c7 04 24 00 3a 01 00 	movl   $0x13a00,(%esp)
    175b:	e8 d9 34 00 00       	call   4c39 <strlen>
    1760:	83 f8 01             	cmp    $0x1,%eax
    1763:	75 0b                	jne    1770 <updatePath+0x51>
    1765:	0f b6 05 00 3a 01 00 	movzbl 0x13a00,%eax
    176c:	3c 2f                	cmp    $0x2f,%al
    176e:	74 4f                	je     17bf <updatePath+0xa0>
        {
            int tmpn = strlen(currentPath);
    1770:	c7 04 24 00 3a 01 00 	movl   $0x13a00,(%esp)
    1777:	e8 bd 34 00 00       	call   4c39 <strlen>
    177c:	89 45 ec             	mov    %eax,-0x14(%ebp)
            currentPath[tmpn - 1] = '\0';
    177f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1782:	83 e8 01             	sub    $0x1,%eax
    1785:	c6 80 00 3a 01 00 00 	movb   $0x0,0x13a00(%eax)
            for (i = tmpn - 2; i > 0; i--)
    178c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    178f:	83 e8 02             	sub    $0x2,%eax
    1792:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1795:	eb 22                	jmp    17b9 <updatePath+0x9a>
            {
                if (currentPath[i] != '/')
    1797:	8b 45 f4             	mov    -0xc(%ebp),%eax
    179a:	05 00 3a 01 00       	add    $0x13a00,%eax
    179f:	0f b6 00             	movzbl (%eax),%eax
    17a2:	3c 2f                	cmp    $0x2f,%al
    17a4:	74 11                	je     17b7 <updatePath+0x98>
                    currentPath[i] = '\0';
    17a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17a9:	05 00 3a 01 00       	add    $0x13a00,%eax
    17ae:	c6 00 00             	movb   $0x0,(%eax)
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    17b1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    17b5:	eb 02                	jmp    17b9 <updatePath+0x9a>
            {
                if (currentPath[i] != '/')
                    currentPath[i] = '\0';
                else
                    break;
    17b7:	eb 06                	jmp    17bf <updatePath+0xa0>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    17b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    17bd:	7f d8                	jg     1797 <updatePath+0x78>
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    17bf:	eb 4e                	jmp    180f <updatePath+0xf0>
            }
        }
    }
    else
    {
        int tmpn = strlen(currentPath);
    17c1:	c7 04 24 00 3a 01 00 	movl   $0x13a00,(%esp)
    17c8:	e8 6c 34 00 00       	call   4c39 <strlen>
    17cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
        strcpy(currentPath + tmpn, name);
    17d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17d3:	8d 90 00 3a 01 00    	lea    0x13a00(%eax),%edx
    17d9:	8b 45 08             	mov    0x8(%ebp),%eax
    17dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    17e0:	89 14 24             	mov    %edx,(%esp)
    17e3:	e8 e2 33 00 00       	call   4bca <strcpy>
        tmpn = strlen(currentPath);
    17e8:	c7 04 24 00 3a 01 00 	movl   $0x13a00,(%esp)
    17ef:	e8 45 34 00 00       	call   4c39 <strlen>
    17f4:	89 45 e8             	mov    %eax,-0x18(%ebp)
        currentPath[tmpn] = '/';
    17f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17fa:	05 00 3a 01 00       	add    $0x13a00,%eax
    17ff:	c6 00 2f             	movb   $0x2f,(%eax)
        currentPath[tmpn + 1] = '\0';
    1802:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1805:	83 c0 01             	add    $0x1,%eax
    1808:	c6 80 00 3a 01 00 00 	movb   $0x0,0x13a00(%eax)
    }
}
    180f:	c9                   	leave  
    1810:	c3                   	ret    

00001811 <enterDir>:

// Handlers
void enterDir(char *name) {
    1811:	55                   	push   %ebp
    1812:	89 e5                	mov    %esp,%ebp
    1814:	83 ec 18             	sub    $0x18,%esp
	scrollOffset = 0;
    1817:	c7 05 a0 02 01 00 00 	movl   $0x0,0x102a0
    181e:	00 00 00 
	printf(0, "entering : %s\n", name);
    1821:	8b 45 08             	mov    0x8(%ebp),%eax
    1824:	89 44 24 08          	mov    %eax,0x8(%esp)
    1828:	c7 44 24 04 a6 b7 00 	movl   $0xb7a6,0x4(%esp)
    182f:	00 
    1830:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1837:	e8 b9 37 00 00       	call   4ff5 <printf>
	if (chdir(name) < 0)
    183c:	8b 45 08             	mov    0x8(%ebp),%eax
    183f:	89 04 24             	mov    %eax,(%esp)
    1842:	e8 36 36 00 00       	call   4e7d <chdir>
    1847:	85 c0                	test   %eax,%eax
    1849:	79 1d                	jns    1868 <enterDir+0x57>
		printf(2, "cannot cd %s\n", name);
    184b:	8b 45 08             	mov    0x8(%ebp),%eax
    184e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1852:	c7 44 24 04 b5 b7 00 	movl   $0xb7b5,0x4(%esp)
    1859:	00 
    185a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1861:	e8 8f 37 00 00       	call   4ff5 <printf>
    1866:	eb 0b                	jmp    1873 <enterDir+0x62>
	else
		updatePath(name);
    1868:	8b 45 08             	mov    0x8(%ebp),%eax
    186b:	89 04 24             	mov    %eax,(%esp)
    186e:	e8 ac fe ff ff       	call   171f <updatePath>
	printf(0, "currentPath: %s\n", currentPath);
    1873:	c7 44 24 08 00 3a 01 	movl   $0x13a00,0x8(%esp)
    187a:	00 
    187b:	c7 44 24 04 c3 b7 00 	movl   $0xb7c3,0x4(%esp)
    1882:	00 
    1883:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    188a:	e8 66 37 00 00       	call   4ff5 <printf>
}
    188f:	c9                   	leave  
    1890:	c3                   	ret    

00001891 <h_enterDir>:

void h_enterDir(Point p) {
    1891:	55                   	push   %ebp
    1892:	89 e5                	mov    %esp,%ebp
    1894:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *temp = getFileItem(p);
    1897:	8b 45 08             	mov    0x8(%ebp),%eax
    189a:	8b 55 0c             	mov    0xc(%ebp),%edx
    189d:	89 04 24             	mov    %eax,(%esp)
    18a0:	89 54 24 04          	mov    %edx,0x4(%esp)
    18a4:	e8 ea fa ff ff       	call   1393 <getFileItem>
    18a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    18ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18af:	8b 40 14             	mov    0x14(%eax),%eax
    18b2:	89 04 24             	mov    %eax,(%esp)
    18b5:	e8 57 ff ff ff       	call   1811 <enterDir>
	freeFileItemList();
    18ba:	e8 ac e8 ff ff       	call   16b <freeFileItemList>
	list(".");
    18bf:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    18c6:	e8 7e e9 ff ff       	call   249 <list>
	drawFinderContent(context);
    18cb:	a1 c0 39 01 00       	mov    0x139c0,%eax
    18d0:	89 04 24             	mov    %eax,(%esp)
    18d3:	a1 c4 39 01 00       	mov    0x139c4,%eax
    18d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    18dc:	a1 c8 39 01 00       	mov    0x139c8,%eax
    18e1:	89 44 24 08          	mov    %eax,0x8(%esp)
    18e5:	e8 af f2 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    18ea:	a1 c0 39 01 00       	mov    0x139c0,%eax
    18ef:	89 04 24             	mov    %eax,(%esp)
    18f2:	a1 c4 39 01 00       	mov    0x139c4,%eax
    18f7:	89 44 24 04          	mov    %eax,0x4(%esp)
    18fb:	a1 c8 39 01 00       	mov    0x139c8,%eax
    1900:	89 44 24 08          	mov    %eax,0x8(%esp)
    1904:	e8 96 f0 ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1909:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    190c:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1913:	00 
    1914:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    191b:	00 
    191c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1923:	00 
    1924:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    192b:	00 
    192c:	89 04 24             	mov    %eax,(%esp)
    192f:	e8 82 2b 00 00       	call   44b6 <initRect>
    1934:	83 ec 04             	sub    $0x4,%esp
    1937:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    193a:	89 44 24 04          	mov    %eax,0x4(%esp)
    193e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1941:	89 44 24 08          	mov    %eax,0x8(%esp)
    1945:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1948:	89 44 24 0c          	mov    %eax,0xc(%esp)
    194c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    194f:	89 44 24 10          	mov    %eax,0x10(%esp)
    1953:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    195a:	e8 5a 2d 00 00       	call   46b9 <deleteClickable>
	addWndEvent(&cm);
    195f:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1966:	e8 62 f9 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    196b:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1972:	e8 ce f8 ff ff       	call   1245 <addListEvent>
}
    1977:	c9                   	leave  
    1978:	c3                   	ret    

00001979 <newFile>:

void newFile(char *name) {
    1979:	55                   	push   %ebp
    197a:	89 e5                	mov    %esp,%ebp
    197c:	83 ec 28             	sub    $0x28,%esp
	int fd;
	int n = strlen(name);
    197f:	8b 45 08             	mov    0x8(%ebp),%eax
    1982:	89 04 24             	mov    %eax,(%esp)
    1985:	e8 af 32 00 00       	call   4c39 <strlen>
    198a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    198d:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    1994:	eb 60                	jmp    19f6 <newFile+0x7d>
	{
		n = strlen(name);
    1996:	8b 45 08             	mov    0x8(%ebp),%eax
    1999:	89 04 24             	mov    %eax,(%esp)
    199c:	e8 98 32 00 00       	call   4c39 <strlen>
    19a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    19a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19a7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    19aa:	75 09                	jne    19b5 <newFile+0x3c>
		{
			counter = 1;
    19ac:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    19b3:	eb 17                	jmp    19cc <newFile+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    19b5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    19b8:	8b 45 08             	mov    0x8(%ebp),%eax
    19bb:	01 d0                	add    %edx,%eax
    19bd:	89 04 24             	mov    %eax,(%esp)
    19c0:	e8 b6 33 00 00       	call   4d7b <atoi>
    19c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    19c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    19cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19cf:	89 04 24             	mov    %eax,(%esp)
    19d2:	e8 74 f5 ff ff       	call   f4b <int2str>
    19d7:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    19da:	8b 55 08             	mov    0x8(%ebp),%edx
    19dd:	01 ca                	add    %ecx,%edx
    19df:	89 44 24 04          	mov    %eax,0x4(%esp)
    19e3:	89 14 24             	mov    %edx,(%esp)
    19e6:	e8 df 31 00 00       	call   4bca <strcpy>
		close(fd);
    19eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    19ee:	89 04 24             	mov    %eax,(%esp)
    19f1:	e8 3f 34 00 00       	call   4e35 <close>
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    19f6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19fd:	00 
    19fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1a01:	89 04 24             	mov    %eax,(%esp)
    1a04:	e8 44 34 00 00       	call   4e4d <open>
    1a09:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1a0c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1a10:	7f 84                	jg     1996 <newFile+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    1a12:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1a19:	00 
    1a1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1d:	89 04 24             	mov    %eax,(%esp)
    1a20:	e8 28 34 00 00       	call   4e4d <open>
    1a25:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1a28:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1a2c:	79 20                	jns    1a4e <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    1a2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a31:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a35:	c7 44 24 04 d4 b7 00 	movl   $0xb7d4,0x4(%esp)
    1a3c:	00 
    1a3d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a44:	e8 ac 35 00 00       	call   4ff5 <printf>
		exit();
    1a49:	e8 bf 33 00 00       	call   4e0d <exit>
	}
	close(fd);
    1a4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a51:	89 04 24             	mov    %eax,(%esp)
    1a54:	e8 dc 33 00 00       	call   4e35 <close>
}
    1a59:	c9                   	leave  
    1a5a:	c3                   	ret    

00001a5b <h_newFile>:

void h_newFile(Point p) {
    1a5b:	55                   	push   %ebp
    1a5c:	89 e5                	mov    %esp,%ebp
    1a5e:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "file.txt";
    1a61:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1a68:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1a6f:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    1a76:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1a7d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1a84:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1a8b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1a92:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    1a99:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1a9c:	89 04 24             	mov    %eax,(%esp)
    1a9f:	e8 d5 fe ff ff       	call   1979 <newFile>
	freeFileItemList();
    1aa4:	e8 c2 e6 ff ff       	call   16b <freeFileItemList>
	list(".");
    1aa9:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    1ab0:	e8 94 e7 ff ff       	call   249 <list>
	drawFinderContent(context);
    1ab5:	a1 c0 39 01 00       	mov    0x139c0,%eax
    1aba:	89 04 24             	mov    %eax,(%esp)
    1abd:	a1 c4 39 01 00       	mov    0x139c4,%eax
    1ac2:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ac6:	a1 c8 39 01 00       	mov    0x139c8,%eax
    1acb:	89 44 24 08          	mov    %eax,0x8(%esp)
    1acf:	e8 c5 f0 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    1ad4:	a1 c0 39 01 00       	mov    0x139c0,%eax
    1ad9:	89 04 24             	mov    %eax,(%esp)
    1adc:	a1 c4 39 01 00       	mov    0x139c4,%eax
    1ae1:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ae5:	a1 c8 39 01 00       	mov    0x139c8,%eax
    1aea:	89 44 24 08          	mov    %eax,0x8(%esp)
    1aee:	e8 ac ee ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1af3:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1af6:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1afd:	00 
    1afe:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1b05:	00 
    1b06:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1b0d:	00 
    1b0e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b15:	00 
    1b16:	89 04 24             	mov    %eax,(%esp)
    1b19:	e8 98 29 00 00       	call   44b6 <initRect>
    1b1e:	83 ec 04             	sub    $0x4,%esp
    1b21:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1b24:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b28:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b2b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b32:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1b36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b39:	89 44 24 10          	mov    %eax,0x10(%esp)
    1b3d:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1b44:	e8 70 2b 00 00       	call   46b9 <deleteClickable>
	addWndEvent(&cm);
    1b49:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1b50:	e8 78 f7 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    1b55:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1b5c:	e8 e4 f6 ff ff       	call   1245 <addListEvent>
}
    1b61:	c9                   	leave  
    1b62:	c3                   	ret    

00001b63 <newFolder>:

void newFolder(char *name) {
    1b63:	55                   	push   %ebp
    1b64:	89 e5                	mov    %esp,%ebp
    1b66:	83 ec 28             	sub    $0x28,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1b69:	8b 45 08             	mov    0x8(%ebp),%eax
    1b6c:	89 04 24             	mov    %eax,(%esp)
    1b6f:	e8 c5 30 00 00       	call   4c39 <strlen>
    1b74:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    1b77:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1b7e:	eb 55                	jmp    1bd5 <newFolder+0x72>
		n = strlen(name);
    1b80:	8b 45 08             	mov    0x8(%ebp),%eax
    1b83:	89 04 24             	mov    %eax,(%esp)
    1b86:	e8 ae 30 00 00       	call   4c39 <strlen>
    1b8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1b8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b91:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1b94:	75 09                	jne    1b9f <newFolder+0x3c>
		{
			counter = 1;
    1b96:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1b9d:	eb 17                	jmp    1bb6 <newFolder+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1b9f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1ba2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba5:	01 d0                	add    %edx,%eax
    1ba7:	89 04 24             	mov    %eax,(%esp)
    1baa:	e8 cc 31 00 00       	call   4d7b <atoi>
    1baf:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1bb2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1bb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bb9:	89 04 24             	mov    %eax,(%esp)
    1bbc:	e8 8a f3 ff ff       	call   f4b <int2str>
    1bc1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1bc4:	8b 55 08             	mov    0x8(%ebp),%edx
    1bc7:	01 ca                	add    %ecx,%edx
    1bc9:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bcd:	89 14 24             	mov    %edx,(%esp)
    1bd0:	e8 f5 2f 00 00       	call   4bca <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    1bd5:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd8:	89 04 24             	mov    %eax,(%esp)
    1bdb:	e8 95 32 00 00       	call   4e75 <mkdir>
    1be0:	85 c0                	test   %eax,%eax
    1be2:	78 9c                	js     1b80 <newFolder+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    1be4:	c9                   	leave  
    1be5:	c3                   	ret    

00001be6 <h_newFolder>:

void h_newFolder(Point p) {
    1be6:	55                   	push   %ebp
    1be7:	89 e5                	mov    %esp,%ebp
    1be9:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "newFolder";
    1bec:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    1bf3:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    1bfa:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    1c01:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1c08:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1c0f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1c16:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1c1d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    1c24:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1c27:	89 04 24             	mov    %eax,(%esp)
    1c2a:	e8 34 ff ff ff       	call   1b63 <newFolder>
	freeFileItemList();
    1c2f:	e8 37 e5 ff ff       	call   16b <freeFileItemList>
	printf(0, "new folder!\n");
    1c34:	c7 44 24 04 e9 b7 00 	movl   $0xb7e9,0x4(%esp)
    1c3b:	00 
    1c3c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c43:	e8 ad 33 00 00       	call   4ff5 <printf>
	list(".");
    1c48:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    1c4f:	e8 f5 e5 ff ff       	call   249 <list>
	printItemList();
    1c54:	e8 d6 f3 ff ff       	call   102f <printItemList>
	drawFinderContent(context);
    1c59:	a1 c0 39 01 00       	mov    0x139c0,%eax
    1c5e:	89 04 24             	mov    %eax,(%esp)
    1c61:	a1 c4 39 01 00       	mov    0x139c4,%eax
    1c66:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c6a:	a1 c8 39 01 00       	mov    0x139c8,%eax
    1c6f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c73:	e8 21 ef ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    1c78:	a1 c0 39 01 00       	mov    0x139c0,%eax
    1c7d:	89 04 24             	mov    %eax,(%esp)
    1c80:	a1 c4 39 01 00       	mov    0x139c4,%eax
    1c85:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c89:	a1 c8 39 01 00       	mov    0x139c8,%eax
    1c8e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c92:	e8 08 ed ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1c97:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1c9a:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1ca1:	00 
    1ca2:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1ca9:	00 
    1caa:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1cb1:	00 
    1cb2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1cb9:	00 
    1cba:	89 04 24             	mov    %eax,(%esp)
    1cbd:	e8 f4 27 00 00       	call   44b6 <initRect>
    1cc2:	83 ec 04             	sub    $0x4,%esp
    1cc5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1cc8:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ccc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ccf:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cd6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1cda:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cdd:	89 44 24 10          	mov    %eax,0x10(%esp)
    1ce1:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1ce8:	e8 cc 29 00 00       	call   46b9 <deleteClickable>
	addWndEvent(&cm);
    1ced:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1cf4:	e8 d4 f5 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    1cf9:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    1d00:	e8 40 f5 ff ff       	call   1245 <addListEvent>
}
    1d05:	c9                   	leave  
    1d06:	c3                   	ret    

00001d07 <deleteFile>:

void deleteFile(char *name)
{
    1d07:	55                   	push   %ebp
    1d08:	89 e5                	mov    %esp,%ebp
    1d0a:	83 ec 28             	sub    $0x28,%esp
	printf(0, "currently having sex with %s\n", name);
    1d0d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d10:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d14:	c7 44 24 04 f6 b7 00 	movl   $0xb7f6,0x4(%esp)
    1d1b:	00 
    1d1c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d23:	e8 cd 32 00 00       	call   4ff5 <printf>
	if(unlink(name) < 0){
    1d28:	8b 45 08             	mov    0x8(%ebp),%eax
    1d2b:	89 04 24             	mov    %eax,(%esp)
    1d2e:	e8 2a 31 00 00       	call   4e5d <unlink>
    1d33:	85 c0                	test   %eax,%eax
    1d35:	0f 89 9c 00 00 00    	jns    1dd7 <deleteFile+0xd0>
		if (chdir(name) < 0){
    1d3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3e:	89 04 24             	mov    %eax,(%esp)
    1d41:	e8 37 31 00 00       	call   4e7d <chdir>
    1d46:	85 c0                	test   %eax,%eax
    1d48:	79 1d                	jns    1d67 <deleteFile+0x60>
			printf(2, "rm: %s failed to delete\n", name);
    1d4a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d4d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d51:	c7 44 24 04 14 b8 00 	movl   $0xb814,0x4(%esp)
    1d58:	00 
    1d59:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1d60:	e8 90 32 00 00       	call   4ff5 <printf>
    1d65:	eb 70                	jmp    1dd7 <deleteFile+0xd0>
		}
		else{
			freeFileItemList();
    1d67:	e8 ff e3 ff ff       	call   16b <freeFileItemList>
			list(".");
    1d6c:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    1d73:	e8 d1 e4 ff ff       	call   249 <list>
			struct fileItem *p;
			p = fileItemList;
    1d78:	a1 ac 02 01 00       	mov    0x102ac,%eax
    1d7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    1d80:	eb 27                	jmp    1da9 <deleteFile+0xa2>
				deleteFile(p->name);
    1d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d85:	8b 40 14             	mov    0x14(%eax),%eax
    1d88:	89 04 24             	mov    %eax,(%esp)
    1d8b:	e8 77 ff ff ff       	call   1d07 <deleteFile>
				freeFileItemList();
    1d90:	e8 d6 e3 ff ff       	call   16b <freeFileItemList>
				list(".");
    1d95:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    1d9c:	e8 a8 e4 ff ff       	call   249 <list>
				p = fileItemList;
    1da1:	a1 ac 02 01 00       	mov    0x102ac,%eax
    1da6:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else{
			freeFileItemList();
			list(".");
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    1da9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1dad:	75 d3                	jne    1d82 <deleteFile+0x7b>
				deleteFile(p->name);
				freeFileItemList();
				list(".");
				p = fileItemList;
			}
			chdir("..");
    1daf:	c7 04 24 2d b8 00 00 	movl   $0xb82d,(%esp)
    1db6:	e8 c2 30 00 00       	call   4e7d <chdir>
			freeFileItemList();
    1dbb:	e8 ab e3 ff ff       	call   16b <freeFileItemList>
			list(".");
    1dc0:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    1dc7:	e8 7d e4 ff ff       	call   249 <list>
			unlink(name);
    1dcc:	8b 45 08             	mov    0x8(%ebp),%eax
    1dcf:	89 04 24             	mov    %eax,(%esp)
    1dd2:	e8 86 30 00 00       	call   4e5d <unlink>
		}
	}
}
    1dd7:	c9                   	leave  
    1dd8:	c3                   	ret    

00001dd9 <h_deleteFile>:
void h_deleteFile(Point p) {
    1dd9:	55                   	push   %ebp
    1dda:	89 e5                	mov    %esp,%ebp
    1ddc:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *q = fileItemList;
    1ddf:	a1 ac 02 01 00       	mov    0x102ac,%eax
    1de4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    1de7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1dee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1df1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1df4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1df7:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    1dfa:	c7 44 24 04 30 b8 00 	movl   $0xb830,0x4(%esp)
    1e01:	00 
    1e02:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e09:	e8 e7 31 00 00       	call   4ff5 <printf>
	while (q != 0)
    1e0e:	e9 8d 00 00 00       	jmp    1ea0 <h_deleteFile+0xc7>
	{
		printf(0, "hi2\n");
    1e13:	c7 44 24 04 35 b8 00 	movl   $0xb835,0x4(%esp)
    1e1a:	00 
    1e1b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e22:	e8 ce 31 00 00       	call   4ff5 <printf>
		if (q->chosen)
    1e27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e2a:	8b 40 28             	mov    0x28(%eax),%eax
    1e2d:	85 c0                	test   %eax,%eax
    1e2f:	74 66                	je     1e97 <h_deleteFile+0xbe>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    1e31:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    1e38:	e8 a4 34 00 00       	call   52e1 <malloc>
    1e3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    1e40:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    1e47:	e8 95 34 00 00       	call   52e1 <malloc>
    1e4c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1e4f:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, q->name);
    1e52:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e55:	8b 50 14             	mov    0x14(%eax),%edx
    1e58:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e5b:	8b 40 14             	mov    0x14(%eax),%eax
    1e5e:	89 54 24 04          	mov    %edx,0x4(%esp)
    1e62:	89 04 24             	mov    %eax,(%esp)
    1e65:	e8 60 2d 00 00       	call   4bca <strcpy>
			if(head == 0)
    1e6a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1e6e:	75 0e                	jne    1e7e <h_deleteFile+0xa5>
			{
				head = p1;
    1e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e73:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    1e76:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e79:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1e7c:	eb 0f                	jmp    1e8d <h_deleteFile+0xb4>
			} else {
				p2->next = p1;
    1e7e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e81:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1e84:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    1e87:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e8a:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    1e8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e90:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    1e97:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e9a:	8b 40 2c             	mov    0x2c(%eax),%eax
    1e9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    1ea0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ea4:	0f 85 69 ff ff ff    	jne    1e13 <h_deleteFile+0x3a>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    1eaa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ead:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    1eb0:	c7 44 24 04 3c b8 00 	movl   $0xb83c,0x4(%esp)
    1eb7:	00 
    1eb8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ebf:	e8 31 31 00 00       	call   4ff5 <printf>
	while (p1 != 0)
    1ec4:	eb 17                	jmp    1edd <h_deleteFile+0x104>
	{
		deleteFile(p1->name);
    1ec6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ec9:	8b 40 14             	mov    0x14(%eax),%eax
    1ecc:	89 04 24             	mov    %eax,(%esp)
    1ecf:	e8 33 fe ff ff       	call   1d07 <deleteFile>
		p1 = p1->next;
    1ed4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ed7:	8b 40 2c             	mov    0x2c(%eax),%eax
    1eda:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    1edd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1ee1:	75 e3                	jne    1ec6 <h_deleteFile+0xed>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    1ee3:	c7 44 24 04 a4 b8 00 	movl   $0xb8a4,0x4(%esp)
    1eea:	00 
    1eeb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ef2:	e8 fe 30 00 00       	call   4ff5 <printf>
	p1 = head;
    1ef7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1efa:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    1efd:	eb 46                	jmp    1f45 <h_deleteFile+0x16c>
		p2 = p1;
    1eff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f02:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    1f05:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f08:	8b 40 14             	mov    0x14(%eax),%eax
    1f0b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f0f:	c7 44 24 04 ba b8 00 	movl   $0xb8ba,0x4(%esp)
    1f16:	00 
    1f17:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f1e:	e8 d2 30 00 00       	call   4ff5 <printf>
		p1 = p1->next;
    1f23:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f26:	8b 40 2c             	mov    0x2c(%eax),%eax
    1f29:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    1f2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f2f:	8b 40 14             	mov    0x14(%eax),%eax
    1f32:	89 04 24             	mov    %eax,(%esp)
    1f35:	e8 6e 32 00 00       	call   51a8 <free>
		free(p2);
    1f3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f3d:	89 04 24             	mov    %eax,(%esp)
    1f40:	e8 63 32 00 00       	call   51a8 <free>
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    1f45:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1f49:	75 b4                	jne    1eff <h_deleteFile+0x126>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    1f4b:	c7 44 24 04 c6 b8 00 	movl   $0xb8c6,0x4(%esp)
    1f52:	00 
    1f53:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f5a:	e8 96 30 00 00       	call   4ff5 <printf>
	freeFileItemList();
    1f5f:	e8 07 e2 ff ff       	call   16b <freeFileItemList>
	list(".");
    1f64:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    1f6b:	e8 d9 e2 ff ff       	call   249 <list>
	printItemList();
    1f70:	e8 ba f0 ff ff       	call   102f <printItemList>
	drawFinderContent(context);
    1f75:	a1 c0 39 01 00       	mov    0x139c0,%eax
    1f7a:	89 04 24             	mov    %eax,(%esp)
    1f7d:	a1 c4 39 01 00       	mov    0x139c4,%eax
    1f82:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f86:	a1 c8 39 01 00       	mov    0x139c8,%eax
    1f8b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f8f:	e8 05 ec ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    1f94:	a1 c0 39 01 00       	mov    0x139c0,%eax
    1f99:	89 04 24             	mov    %eax,(%esp)
    1f9c:	a1 c4 39 01 00       	mov    0x139c4,%eax
    1fa1:	89 44 24 04          	mov    %eax,0x4(%esp)
    1fa5:	a1 c8 39 01 00       	mov    0x139c8,%eax
    1faa:	89 44 24 08          	mov    %eax,0x8(%esp)
    1fae:	e8 ec e9 ff ff       	call   99f <drawFinderWnd>
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1fb3:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1fb6:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1fbd:	00 
    1fbe:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1fc5:	00 
    1fc6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1fcd:	00 
    1fce:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1fd5:	00 
    1fd6:	89 04 24             	mov    %eax,(%esp)
    1fd9:	e8 d8 24 00 00       	call   44b6 <initRect>
    1fde:	83 ec 04             	sub    $0x4,%esp
    1fe1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1fe4:	89 44 24 04          	mov    %eax,0x4(%esp)
    1fe8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1feb:	89 44 24 08          	mov    %eax,0x8(%esp)
    1fef:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ff2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1ff6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ff9:	89 44 24 10          	mov    %eax,0x10(%esp)
    1ffd:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2004:	e8 b0 26 00 00       	call   46b9 <deleteClickable>
		addWndEvent(&cm);
    2009:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2010:	e8 b8 f2 ff ff       	call   12cd <addWndEvent>
		addListEvent(&cm);
    2015:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    201c:	e8 24 f2 ff ff       	call   1245 <addListEvent>
}
    2021:	c9                   	leave  
    2022:	c3                   	ret    

00002023 <unrename>:

void unrename(){
    2023:	55                   	push   %ebp
    2024:	89 e5                	mov    %esp,%ebp
    2026:	83 ec 18             	sub    $0x18,%esp
	currentlyRenaming->chosen = 1;
    2029:	a1 a8 02 01 00       	mov    0x102a8,%eax
    202e:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	currentlyRenaming = 0;
    2035:	c7 05 a8 02 01 00 00 	movl   $0x0,0x102a8
    203c:	00 00 00 
	drawFinderContent(context);
    203f:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2044:	89 04 24             	mov    %eax,(%esp)
    2047:	a1 c4 39 01 00       	mov    0x139c4,%eax
    204c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2050:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2055:	89 44 24 08          	mov    %eax,0x8(%esp)
    2059:	e8 3b eb ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    205e:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2063:	89 04 24             	mov    %eax,(%esp)
    2066:	a1 c4 39 01 00       	mov    0x139c4,%eax
    206b:	89 44 24 04          	mov    %eax,0x4(%esp)
    206f:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2074:	89 44 24 08          	mov    %eax,0x8(%esp)
    2078:	e8 22 e9 ff ff       	call   99f <drawFinderWnd>
}
    207d:	c9                   	leave  
    207e:	c3                   	ret    

0000207f <copyFile>:

void copyFile(){
    207f:	55                   	push   %ebp
    2080:	89 e5                	mov    %esp,%ebp
    2082:	56                   	push   %esi
    2083:	53                   	push   %ebx
    2084:	83 ec 20             	sub    $0x20,%esp
	int fd;
	struct fileItem *p = fileItemList;
    2087:	a1 ac 02 01 00       	mov    0x102ac,%eax
    208c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    208f:	e9 0f 01 00 00       	jmp    21a3 <copyFile+0x124>
		if (p->chosen == 1){
    2094:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2097:	8b 40 28             	mov    0x28(%eax),%eax
    209a:	83 f8 01             	cmp    $0x1,%eax
    209d:	0f 85 f7 00 00 00    	jne    219a <copyFile+0x11b>
			if(lenOfWaited >= MAX_COPY_SIZE){
    20a3:	a1 18 3b 01 00       	mov    0x13b18,%eax
    20a8:	83 f8 07             	cmp    $0x7,%eax
    20ab:	7e 22                	jle    20cf <copyFile+0x50>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    20ad:	a1 18 3b 01 00       	mov    0x13b18,%eax
    20b2:	89 44 24 08          	mov    %eax,0x8(%esp)
    20b6:	c7 44 24 04 d8 b8 00 	movl   $0xb8d8,0x4(%esp)
    20bd:	00 
    20be:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    20c5:	e8 2b 2f 00 00       	call   4ff5 <printf>
    20ca:	e9 cb 00 00 00       	jmp    219a <copyFile+0x11b>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    20cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20d2:	8b 40 14             	mov    0x14(%eax),%eax
    20d5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    20dc:	00 
    20dd:	89 04 24             	mov    %eax,(%esp)
    20e0:	e8 68 2d 00 00       	call   4e4d <open>
    20e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    20e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    20ec:	0f 88 8a 00 00 00    	js     217c <copyFile+0xfd>
					strcpy(filesWaited[lenOfWaited], currentPath);
    20f2:	a1 18 3b 01 00       	mov    0x13b18,%eax
    20f7:	c1 e0 08             	shl    $0x8,%eax
    20fa:	05 c0 30 01 00       	add    $0x130c0,%eax
    20ff:	c7 44 24 04 00 3a 01 	movl   $0x13a00,0x4(%esp)
    2106:	00 
    2107:	89 04 24             	mov    %eax,(%esp)
    210a:	e8 bb 2a 00 00       	call   4bca <strcpy>
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    210f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2112:	8b 58 14             	mov    0x14(%eax),%ebx
    2115:	a1 18 3b 01 00       	mov    0x13b18,%eax
    211a:	c1 e0 08             	shl    $0x8,%eax
    211d:	8d b0 c0 30 01 00    	lea    0x130c0(%eax),%esi
    2123:	c7 04 24 00 3a 01 00 	movl   $0x13a00,(%esp)
    212a:	e8 0a 2b 00 00       	call   4c39 <strlen>
    212f:	01 f0                	add    %esi,%eax
    2131:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    2135:	89 04 24             	mov    %eax,(%esp)
    2138:	e8 8d 2a 00 00       	call   4bca <strcpy>
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    213d:	a1 18 3b 01 00       	mov    0x13b18,%eax
    2142:	c1 e0 08             	shl    $0x8,%eax
    2145:	05 c0 30 01 00       	add    $0x130c0,%eax
    214a:	89 44 24 08          	mov    %eax,0x8(%esp)
    214e:	c7 44 24 04 f3 b8 00 	movl   $0xb8f3,0x4(%esp)
    2155:	00 
    2156:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    215d:	e8 93 2e 00 00       	call   4ff5 <printf>
					lenOfWaited++;
    2162:	a1 18 3b 01 00       	mov    0x13b18,%eax
    2167:	83 c0 01             	add    $0x1,%eax
    216a:	a3 18 3b 01 00       	mov    %eax,0x13b18
					close(fd);
    216f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2172:	89 04 24             	mov    %eax,(%esp)
    2175:	e8 bb 2c 00 00       	call   4e35 <close>
    217a:	eb 1e                	jmp    219a <copyFile+0x11b>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    217c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    217f:	8b 40 14             	mov    0x14(%eax),%eax
    2182:	89 44 24 08          	mov    %eax,0x8(%esp)
    2186:	c7 44 24 04 09 b9 00 	movl   $0xb909,0x4(%esp)
    218d:	00 
    218e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2195:	e8 5b 2e 00 00       	call   4ff5 <printf>
				}
			}
		}
		p = p->next;
    219a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    219d:	8b 40 2c             	mov    0x2c(%eax),%eax
    21a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    21a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    21a7:	0f 85 e7 fe ff ff    	jne    2094 <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    21ad:	83 c4 20             	add    $0x20,%esp
    21b0:	5b                   	pop    %ebx
    21b1:	5e                   	pop    %esi
    21b2:	5d                   	pop    %ebp
    21b3:	c3                   	ret    

000021b4 <h_copyFile>:

void h_copyFile(Point p){
    21b4:	55                   	push   %ebp
    21b5:	89 e5                	mov    %esp,%ebp
    21b7:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    21ba:	c7 05 a4 02 01 00 00 	movl   $0x0,0x102a4
    21c1:	00 00 00 
	lenOfWaited = 0;
    21c4:	c7 05 18 3b 01 00 00 	movl   $0x0,0x13b18
    21cb:	00 00 00 
	copyFile();
    21ce:	e8 ac fe ff ff       	call   207f <copyFile>
}
    21d3:	c9                   	leave  
    21d4:	c3                   	ret    

000021d5 <moveFile>:

void moveFile(){
    21d5:	55                   	push   %ebp
    21d6:	89 e5                	mov    %esp,%ebp
    21d8:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    21db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    21e2:	eb 17                	jmp    21fb <moveFile+0x26>
		deleteFile(filesWaited[i]);
    21e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21e7:	c1 e0 08             	shl    $0x8,%eax
    21ea:	05 c0 30 01 00       	add    $0x130c0,%eax
    21ef:	89 04 24             	mov    %eax,(%esp)
    21f2:	e8 10 fb ff ff       	call   1d07 <deleteFile>
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    21f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    21fb:	a1 18 3b 01 00       	mov    0x13b18,%eax
    2200:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2203:	7c df                	jl     21e4 <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    2205:	c7 05 18 3b 01 00 00 	movl   $0x0,0x13b18
    220c:	00 00 00 
}
    220f:	c9                   	leave  
    2210:	c3                   	ret    

00002211 <h_cutFile>:

void h_cutFile(Point p){
    2211:	55                   	push   %ebp
    2212:	89 e5                	mov    %esp,%ebp
    2214:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    2217:	c7 05 a4 02 01 00 01 	movl   $0x1,0x102a4
    221e:	00 00 00 
	lenOfWaited = 0;
    2221:	c7 05 18 3b 01 00 00 	movl   $0x0,0x13b18
    2228:	00 00 00 
	copyFile();
    222b:	e8 4f fe ff ff       	call   207f <copyFile>
}
    2230:	c9                   	leave  
    2231:	c3                   	ret    

00002232 <pasteFile>:

void pasteFile(){
    2232:	55                   	push   %ebp
    2233:	89 e5                	mov    %esp,%ebp
    2235:	83 ec 38             	sub    $0x38,%esp
	int file_src, file_dest;
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
    2238:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    223f:	e8 9d 30 00 00       	call   52e1 <malloc>
    2244:	89 45 e8             	mov    %eax,-0x18(%ebp)
	memset(buff, 0, 4096);
    2247:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    224e:	00 
    224f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2256:	00 
    2257:	8b 45 e8             	mov    -0x18(%ebp),%eax
    225a:	89 04 24             	mov    %eax,(%esp)
    225d:	e8 fe 29 00 00       	call   4c60 <memset>
    int size = 0;
    2262:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i = 0; i < lenOfWaited; i++){
    2269:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2270:	e9 a6 01 00 00       	jmp    241b <pasteFile+0x1e9>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    2275:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2278:	c1 e0 08             	shl    $0x8,%eax
    227b:	05 c0 30 01 00       	add    $0x130c0,%eax
    2280:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2284:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2287:	89 44 24 08          	mov    %eax,0x8(%esp)
    228b:	c7 44 24 04 1e b9 00 	movl   $0xb91e,0x4(%esp)
    2292:	00 
    2293:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    229a:	e8 56 2d 00 00       	call   4ff5 <printf>
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    229f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22a2:	c1 e0 08             	shl    $0x8,%eax
    22a5:	05 c0 30 01 00       	add    $0x130c0,%eax
    22aa:	89 04 24             	mov    %eax,(%esp)
    22ad:	e8 87 29 00 00       	call   4c39 <strlen>
    22b2:	83 e8 01             	sub    $0x1,%eax
    22b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22b8:	eb 35                	jmp    22ef <pasteFile+0xbd>
        	if (*(filesWaited[i]+j) == '/'){
    22ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22bd:	c1 e0 08             	shl    $0x8,%eax
    22c0:	8d 90 c0 30 01 00    	lea    0x130c0(%eax),%edx
    22c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22c9:	01 d0                	add    %edx,%eax
    22cb:	0f b6 00             	movzbl (%eax),%eax
    22ce:	3c 2f                	cmp    $0x2f,%al
    22d0:	75 19                	jne    22eb <pasteFile+0xb9>
        		filename = filesWaited[i] + j + 1;
    22d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22d5:	c1 e0 08             	shl    $0x8,%eax
    22d8:	8d 90 c0 30 01 00    	lea    0x130c0(%eax),%edx
    22de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22e1:	83 c0 01             	add    $0x1,%eax
    22e4:	01 d0                	add    %edx,%eax
    22e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
        		break;
    22e9:	eb 0a                	jmp    22f5 <pasteFile+0xc3>
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    22eb:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    22ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    22f3:	79 c5                	jns    22ba <pasteFile+0x88>
        	if (*(filesWaited[i]+j) == '/'){
        		filename = filesWaited[i] + j + 1;
        		break;
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
    22f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    22f8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    22fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22ff:	89 44 24 08          	mov    %eax,0x8(%esp)
    2303:	c7 44 24 04 3b b9 00 	movl   $0xb93b,0x4(%esp)
    230a:	00 
    230b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2312:	e8 de 2c 00 00       	call   4ff5 <printf>
        file_src = open(filesWaited[i], O_RDONLY);
    2317:	8b 45 f4             	mov    -0xc(%ebp),%eax
    231a:	c1 e0 08             	shl    $0x8,%eax
    231d:	05 c0 30 01 00       	add    $0x130c0,%eax
    2322:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2329:	00 
    232a:	89 04 24             	mov    %eax,(%esp)
    232d:	e8 1b 2b 00 00       	call   4e4d <open>
    2332:	89 45 e0             	mov    %eax,-0x20(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    2335:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    233c:	00 
    233d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2340:	89 04 24             	mov    %eax,(%esp)
    2343:	e8 05 2b 00 00       	call   4e4d <open>
    2348:	89 45 dc             	mov    %eax,-0x24(%ebp)
    234b:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    234f:	78 32                	js     2383 <pasteFile+0x151>
			printf(0, "NO.%d file %s already exist\n", i, filename);
    2351:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2354:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2358:	8b 45 f4             	mov    -0xc(%ebp),%eax
    235b:	89 44 24 08          	mov    %eax,0x8(%esp)
    235f:	c7 44 24 04 53 b9 00 	movl   $0xb953,0x4(%esp)
    2366:	00 
    2367:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    236e:	e8 82 2c 00 00       	call   4ff5 <printf>
			close(file_dest);
    2373:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2376:	89 04 24             	mov    %eax,(%esp)
    2379:	e8 b7 2a 00 00       	call   4e35 <close>
    237e:	e9 89 00 00 00       	jmp    240c <pasteFile+0x1da>
		}
		else{
			file_dest = open(filename, O_CREATE);
    2383:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    238a:	00 
    238b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    238e:	89 04 24             	mov    %eax,(%esp)
    2391:	e8 b7 2a 00 00       	call   4e4d <open>
    2396:	89 45 dc             	mov    %eax,-0x24(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    2399:	eb 19                	jmp    23b4 <pasteFile+0x182>
                write(file_dest, buff, size);
    239b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    239e:	89 44 24 08          	mov    %eax,0x8(%esp)
    23a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    23a5:	89 44 24 04          	mov    %eax,0x4(%esp)
    23a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    23ac:	89 04 24             	mov    %eax,(%esp)
    23af:	e8 79 2a 00 00       	call   4e2d <write>
			printf(0, "NO.%d file %s already exist\n", i, filename);
			close(file_dest);
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    23b4:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    23bb:	00 
    23bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    23bf:	89 44 24 04          	mov    %eax,0x4(%esp)
    23c3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    23c6:	89 04 24             	mov    %eax,(%esp)
    23c9:	e8 57 2a 00 00       	call   4e25 <read>
    23ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    23d1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    23d5:	7f c4                	jg     239b <pasteFile+0x169>
                write(file_dest, buff, size);
	        if(size < 0)
    23d7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    23db:	79 24                	jns    2401 <pasteFile+0x1cf>
	        {
	            //printf(2, "copy file error!!!\r\n");
	            printf(0, "NO.%d file %s error\n", i, filename);
    23dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    23e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    23e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23e7:	89 44 24 08          	mov    %eax,0x8(%esp)
    23eb:	c7 44 24 04 70 b9 00 	movl   $0xb970,0x4(%esp)
    23f2:	00 
    23f3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23fa:	e8 f6 2b 00 00       	call   4ff5 <printf>
	            return;
    23ff:	eb 33                	jmp    2434 <pasteFile+0x202>
	        }
	        close(file_dest);
    2401:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2404:	89 04 24             	mov    %eax,(%esp)
    2407:	e8 29 2a 00 00       	call   4e35 <close>
		}
		close(file_src);
    240c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    240f:	89 04 24             	mov    %eax,(%esp)
    2412:	e8 1e 2a 00 00       	call   4e35 <close>
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
    2417:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    241b:	a1 18 3b 01 00       	mov    0x13b18,%eax
    2420:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2423:	0f 8c 4c fe ff ff    	jl     2275 <pasteFile+0x43>
	        }
	        close(file_dest);
		}
		close(file_src);
	}
    free(buff);
    2429:	8b 45 e8             	mov    -0x18(%ebp),%eax
    242c:	89 04 24             	mov    %eax,(%esp)
    242f:	e8 74 2d 00 00       	call   51a8 <free>
}
    2434:	c9                   	leave  
    2435:	c3                   	ret    

00002436 <h_pasteFile>:

void h_pasteFile(Point p){
    2436:	55                   	push   %ebp
    2437:	89 e5                	mov    %esp,%ebp
    2439:	83 ec 38             	sub    $0x38,%esp
	pasteFile();
    243c:	e8 f1 fd ff ff       	call   2232 <pasteFile>
	if(copyOrCut == 1)
    2441:	a1 a4 02 01 00       	mov    0x102a4,%eax
    2446:	83 f8 01             	cmp    $0x1,%eax
    2449:	75 05                	jne    2450 <h_pasteFile+0x1a>
		moveFile();
    244b:	e8 85 fd ff ff       	call   21d5 <moveFile>
    freeFileItemList();
    2450:	e8 16 dd ff ff       	call   16b <freeFileItemList>
	list(".");
    2455:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    245c:	e8 e8 dd ff ff       	call   249 <list>
	drawFinderContent(context);
    2461:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2466:	89 04 24             	mov    %eax,(%esp)
    2469:	a1 c4 39 01 00       	mov    0x139c4,%eax
    246e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2472:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2477:	89 44 24 08          	mov    %eax,0x8(%esp)
    247b:	e8 19 e7 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    2480:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2485:	89 04 24             	mov    %eax,(%esp)
    2488:	a1 c4 39 01 00       	mov    0x139c4,%eax
    248d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2491:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2496:	89 44 24 08          	mov    %eax,0x8(%esp)
    249a:	e8 00 e5 ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    249f:	8d 45 e8             	lea    -0x18(%ebp),%eax
    24a2:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    24a9:	00 
    24aa:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    24b1:	00 
    24b2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    24b9:	00 
    24ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    24c1:	00 
    24c2:	89 04 24             	mov    %eax,(%esp)
    24c5:	e8 ec 1f 00 00       	call   44b6 <initRect>
    24ca:	83 ec 04             	sub    $0x4,%esp
    24cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24d0:	89 44 24 04          	mov    %eax,0x4(%esp)
    24d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24d7:	89 44 24 08          	mov    %eax,0x8(%esp)
    24db:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24de:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24e5:	89 44 24 10          	mov    %eax,0x10(%esp)
    24e9:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    24f0:	e8 c4 21 00 00       	call   46b9 <deleteClickable>
	addWndEvent(&cm);
    24f5:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    24fc:	e8 cc ed ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    2501:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2508:	e8 38 ed ff ff       	call   1245 <addListEvent>
}
    250d:	c9                   	leave  
    250e:	c3                   	ret    

0000250f <h_chooseFile>:

void h_chooseFile(Point p) {
    250f:	55                   	push   %ebp
    2510:	89 e5                	mov    %esp,%ebp
    2512:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    2515:	8b 45 08             	mov    0x8(%ebp),%eax
    2518:	8b 55 0c             	mov    0xc(%ebp),%edx
    251b:	89 04 24             	mov    %eax,(%esp)
    251e:	89 54 24 04          	mov    %edx,0x4(%esp)
    2522:	e8 6c ee ff ff       	call   1393 <getFileItem>
    2527:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    252a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    252d:	8b 40 28             	mov    0x28(%eax),%eax
    2530:	85 c0                	test   %eax,%eax
    2532:	74 20                	je     2554 <h_chooseFile+0x45>
	{
		printf(0, "chooseFile!\n");
    2534:	c7 44 24 04 85 b9 00 	movl   $0xb985,0x4(%esp)
    253b:	00 
    253c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2543:	e8 ad 2a 00 00       	call   4ff5 <printf>
		temp->chosen = 0;
    2548:	8b 45 f4             	mov    -0xc(%ebp),%eax
    254b:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    2552:	eb 1e                	jmp    2572 <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    2554:	c7 44 24 04 92 b9 00 	movl   $0xb992,0x4(%esp)
    255b:	00 
    255c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2563:	e8 8d 2a 00 00       	call   4ff5 <printf>
		temp->chosen = 1;
    2568:	8b 45 f4             	mov    -0xc(%ebp),%eax
    256b:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    2572:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2577:	89 04 24             	mov    %eax,(%esp)
    257a:	a1 c4 39 01 00       	mov    0x139c4,%eax
    257f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2583:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2588:	89 44 24 08          	mov    %eax,0x8(%esp)
    258c:	e8 08 e6 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    2591:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2596:	89 04 24             	mov    %eax,(%esp)
    2599:	a1 c4 39 01 00       	mov    0x139c4,%eax
    259e:	89 44 24 04          	mov    %eax,0x4(%esp)
    25a2:	a1 c8 39 01 00       	mov    0x139c8,%eax
    25a7:	89 44 24 08          	mov    %eax,0x8(%esp)
    25ab:	e8 ef e3 ff ff       	call   99f <drawFinderWnd>
}
    25b0:	c9                   	leave  
    25b1:	c3                   	ret    

000025b2 <h_closeWnd>:

void h_closeWnd(Point p) {
    25b2:	55                   	push   %ebp
    25b3:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    25b5:	c7 05 40 f9 00 00 00 	movl   $0x0,0xf940
    25bc:	00 00 00 
}
    25bf:	5d                   	pop    %ebp
    25c0:	c3                   	ret    

000025c1 <h_chvm1>:

void h_chvm1(Point p) {
    25c1:	55                   	push   %ebp
    25c2:	89 e5                	mov    %esp,%ebp
    25c4:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    25c7:	c7 05 44 f9 00 00 01 	movl   $0x1,0xf944
    25ce:	00 00 00 
	freeFileItemList();
    25d1:	e8 95 db ff ff       	call   16b <freeFileItemList>
		list(".");
    25d6:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    25dd:	e8 67 dc ff ff       	call   249 <list>
		drawFinderContent(context);
    25e2:	a1 c0 39 01 00       	mov    0x139c0,%eax
    25e7:	89 04 24             	mov    %eax,(%esp)
    25ea:	a1 c4 39 01 00       	mov    0x139c4,%eax
    25ef:	89 44 24 04          	mov    %eax,0x4(%esp)
    25f3:	a1 c8 39 01 00       	mov    0x139c8,%eax
    25f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    25fc:	e8 98 e5 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    2601:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2606:	89 04 24             	mov    %eax,(%esp)
    2609:	a1 c4 39 01 00       	mov    0x139c4,%eax
    260e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2612:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2617:	89 44 24 08          	mov    %eax,0x8(%esp)
    261b:	e8 7f e3 ff ff       	call   99f <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2620:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2623:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    262a:	00 
    262b:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2632:	00 
    2633:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    263a:	00 
    263b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2642:	00 
    2643:	89 04 24             	mov    %eax,(%esp)
    2646:	e8 6b 1e 00 00       	call   44b6 <initRect>
    264b:	83 ec 04             	sub    $0x4,%esp
    264e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2651:	89 44 24 04          	mov    %eax,0x4(%esp)
    2655:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2658:	89 44 24 08          	mov    %eax,0x8(%esp)
    265c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    265f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2663:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2666:	89 44 24 10          	mov    %eax,0x10(%esp)
    266a:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2671:	e8 43 20 00 00       	call   46b9 <deleteClickable>
			addWndEvent(&cm);
    2676:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    267d:	e8 4b ec ff ff       	call   12cd <addWndEvent>
			addListEvent(&cm);
    2682:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2689:	e8 b7 eb ff ff       	call   1245 <addListEvent>
}
    268e:	c9                   	leave  
    268f:	c3                   	ret    

00002690 <h_chvm2>:

void h_chvm2(Point p) {
    2690:	55                   	push   %ebp
    2691:	89 e5                	mov    %esp,%ebp
    2693:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    2696:	c7 05 44 f9 00 00 02 	movl   $0x2,0xf944
    269d:	00 00 00 
	freeFileItemList();
    26a0:	e8 c6 da ff ff       	call   16b <freeFileItemList>
		list(".");
    26a5:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    26ac:	e8 98 db ff ff       	call   249 <list>
		drawFinderContent(context);
    26b1:	a1 c0 39 01 00       	mov    0x139c0,%eax
    26b6:	89 04 24             	mov    %eax,(%esp)
    26b9:	a1 c4 39 01 00       	mov    0x139c4,%eax
    26be:	89 44 24 04          	mov    %eax,0x4(%esp)
    26c2:	a1 c8 39 01 00       	mov    0x139c8,%eax
    26c7:	89 44 24 08          	mov    %eax,0x8(%esp)
    26cb:	e8 c9 e4 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    26d0:	a1 c0 39 01 00       	mov    0x139c0,%eax
    26d5:	89 04 24             	mov    %eax,(%esp)
    26d8:	a1 c4 39 01 00       	mov    0x139c4,%eax
    26dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    26e1:	a1 c8 39 01 00       	mov    0x139c8,%eax
    26e6:	89 44 24 08          	mov    %eax,0x8(%esp)
    26ea:	e8 b0 e2 ff ff       	call   99f <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    26ef:	8d 45 e8             	lea    -0x18(%ebp),%eax
    26f2:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    26f9:	00 
    26fa:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2701:	00 
    2702:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2709:	00 
    270a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2711:	00 
    2712:	89 04 24             	mov    %eax,(%esp)
    2715:	e8 9c 1d 00 00       	call   44b6 <initRect>
    271a:	83 ec 04             	sub    $0x4,%esp
    271d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2720:	89 44 24 04          	mov    %eax,0x4(%esp)
    2724:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2727:	89 44 24 08          	mov    %eax,0x8(%esp)
    272b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    272e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2732:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2735:	89 44 24 10          	mov    %eax,0x10(%esp)
    2739:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2740:	e8 74 1f 00 00       	call   46b9 <deleteClickable>
			addWndEvent(&cm);
    2745:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    274c:	e8 7c eb ff ff       	call   12cd <addWndEvent>
			addListEvent(&cm);
    2751:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2758:	e8 e8 ea ff ff       	call   1245 <addListEvent>
}
    275d:	c9                   	leave  
    275e:	c3                   	ret    

0000275f <h_goUp>:

void h_goUp(Point p) {
    275f:	55                   	push   %ebp
    2760:	89 e5                	mov    %esp,%ebp
    2762:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    2765:	c7 04 24 2d b8 00 00 	movl   $0xb82d,(%esp)
    276c:	e8 a0 f0 ff ff       	call   1811 <enterDir>
	freeFileItemList();
    2771:	e8 f5 d9 ff ff       	call   16b <freeFileItemList>
	list(".");
    2776:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    277d:	e8 c7 da ff ff       	call   249 <list>
	drawFinderContent(context);
    2782:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2787:	89 04 24             	mov    %eax,(%esp)
    278a:	a1 c4 39 01 00       	mov    0x139c4,%eax
    278f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2793:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2798:	89 44 24 08          	mov    %eax,0x8(%esp)
    279c:	e8 f8 e3 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    27a1:	a1 c0 39 01 00       	mov    0x139c0,%eax
    27a6:	89 04 24             	mov    %eax,(%esp)
    27a9:	a1 c4 39 01 00       	mov    0x139c4,%eax
    27ae:	89 44 24 04          	mov    %eax,0x4(%esp)
    27b2:	a1 c8 39 01 00       	mov    0x139c8,%eax
    27b7:	89 44 24 08          	mov    %eax,0x8(%esp)
    27bb:	e8 df e1 ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    27c0:	8d 45 e8             	lea    -0x18(%ebp),%eax
    27c3:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    27ca:	00 
    27cb:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    27d2:	00 
    27d3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    27da:	00 
    27db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    27e2:	00 
    27e3:	89 04 24             	mov    %eax,(%esp)
    27e6:	e8 cb 1c 00 00       	call   44b6 <initRect>
    27eb:	83 ec 04             	sub    $0x4,%esp
    27ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    27f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    27fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27ff:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2803:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2806:	89 44 24 10          	mov    %eax,0x10(%esp)
    280a:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2811:	e8 a3 1e 00 00       	call   46b9 <deleteClickable>
	addWndEvent(&cm);
    2816:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    281d:	e8 ab ea ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    2822:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2829:	e8 17 ea ff ff       	call   1245 <addListEvent>
}
    282e:	c9                   	leave  
    282f:	c3                   	ret    

00002830 <h_empty>:

void h_empty(Point p) {
    2830:	55                   	push   %ebp
    2831:	89 e5                	mov    %esp,%ebp

}
    2833:	5d                   	pop    %ebp
    2834:	c3                   	ret    

00002835 <rename>:

void rename() {
    2835:	55                   	push   %ebp
    2836:	89 e5                	mov    %esp,%ebp
    2838:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = fileItemList;
    283b:	a1 ac 02 01 00       	mov    0x102ac,%eax
    2840:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (temp != 0){
    2843:	eb 28                	jmp    286d <rename+0x38>
		if (temp->chosen == 1){
    2845:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2848:	8b 40 28             	mov    0x28(%eax),%eax
    284b:	83 f8 01             	cmp    $0x1,%eax
    284e:	75 14                	jne    2864 <rename+0x2f>
			currentlyRenaming = temp;
    2850:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2853:	a3 a8 02 01 00       	mov    %eax,0x102a8
			temp->chosen = 2;
    2858:	8b 45 f4             	mov    -0xc(%ebp),%eax
    285b:	c7 40 28 02 00 00 00 	movl   $0x2,0x28(%eax)
			break;
    2862:	eb 0f                	jmp    2873 <rename+0x3e>
		}
		else
			temp = temp->next;
    2864:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2867:	8b 40 2c             	mov    0x2c(%eax),%eax
    286a:	89 45 f4             	mov    %eax,-0xc(%ebp)

}

void rename() {
	struct fileItem *temp = fileItemList;
	while (temp != 0){
    286d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2871:	75 d2                	jne    2845 <rename+0x10>
			break;
		}
		else
			temp = temp->next;
	}
	strcpy(renameFrom, temp->name);
    2873:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2876:	8b 40 14             	mov    0x14(%eax),%eax
    2879:	89 44 24 04          	mov    %eax,0x4(%esp)
    287d:	c7 04 24 c0 38 01 00 	movl   $0x138c0,(%esp)
    2884:	e8 41 23 00 00       	call   4bca <strcpy>
	renaming = 1;
    2889:	c7 05 14 3b 01 00 01 	movl   $0x1,0x13b14
    2890:	00 00 00 
}
    2893:	c9                   	leave  
    2894:	c3                   	ret    

00002895 <h_rename>:

void h_rename(Point p) {
    2895:	55                   	push   %ebp
    2896:	89 e5                	mov    %esp,%ebp
    2898:	83 ec 18             	sub    $0x18,%esp
	rename();
    289b:	e8 95 ff ff ff       	call   2835 <rename>
	drawFinderContent(context);
    28a0:	a1 c0 39 01 00       	mov    0x139c0,%eax
    28a5:	89 04 24             	mov    %eax,(%esp)
    28a8:	a1 c4 39 01 00       	mov    0x139c4,%eax
    28ad:	89 44 24 04          	mov    %eax,0x4(%esp)
    28b1:	a1 c8 39 01 00       	mov    0x139c8,%eax
    28b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    28ba:	e8 da e2 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    28bf:	a1 c0 39 01 00       	mov    0x139c0,%eax
    28c4:	89 04 24             	mov    %eax,(%esp)
    28c7:	a1 c4 39 01 00       	mov    0x139c4,%eax
    28cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    28d0:	a1 c8 39 01 00       	mov    0x139c8,%eax
    28d5:	89 44 24 08          	mov    %eax,0x8(%esp)
    28d9:	e8 c1 e0 ff ff       	call   99f <drawFinderWnd>
}
    28de:	c9                   	leave  
    28df:	c3                   	ret    

000028e0 <main>:

int main(int argc, char *argv[]) {
    28e0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    28e4:	83 e4 f0             	and    $0xfffffff0,%esp
    28e7:	ff 71 fc             	pushl  -0x4(%ecx)
    28ea:	55                   	push   %ebp
    28eb:	89 e5                	mov    %esp,%ebp
    28ed:	56                   	push   %esi
    28ee:	53                   	push   %ebx
    28ef:	51                   	push   %ecx
    28f0:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
	struct Msg msg;
	char key;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    28f6:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    28fd:	00 
    28fe:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    2905:	00 
    2906:	c7 04 24 c0 39 01 00 	movl   $0x139c0,(%esp)
    290d:	e8 6e 06 00 00       	call   2f80 <init_context>
    2912:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    2915:	8d 45 88             	lea    -0x78(%ebp),%eax
    2918:	8b 15 c0 39 01 00    	mov    0x139c0,%edx
    291e:	89 54 24 04          	mov    %edx,0x4(%esp)
    2922:	8b 15 c4 39 01 00    	mov    0x139c4,%edx
    2928:	89 54 24 08          	mov    %edx,0x8(%esp)
    292c:	8b 15 c8 39 01 00    	mov    0x139c8,%edx
    2932:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2936:	89 04 24             	mov    %eax,(%esp)
    2939:	e8 16 1c 00 00       	call   4554 <initClickManager>
    293e:	83 ec 04             	sub    $0x4,%esp
    2941:	8b 45 88             	mov    -0x78(%ebp),%eax
    2944:	a3 00 3b 01 00       	mov    %eax,0x13b00
    2949:	8b 45 8c             	mov    -0x74(%ebp),%eax
    294c:	a3 04 3b 01 00       	mov    %eax,0x13b04
    2951:	8b 45 90             	mov    -0x70(%ebp),%eax
    2954:	a3 08 3b 01 00       	mov    %eax,0x13b08
    2959:	8b 45 94             	mov    -0x6c(%ebp),%eax
    295c:	a3 0c 3b 01 00       	mov    %eax,0x13b0c
    2961:	8b 45 98             	mov    -0x68(%ebp),%eax
    2964:	a3 10 3b 01 00       	mov    %eax,0x13b10
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    2969:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
    2970:	00 
    2971:	c7 04 24 40 fa 00 00 	movl   $0xfa40,(%esp)
    2978:	e8 fd 11 00 00       	call   3b7a <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    297d:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    2984:	00 
    2985:	c7 04 24 60 f9 00 00 	movl   $0xf960,(%esp)
    298c:	e8 e9 11 00 00       	call   3b7a <load_iconlist>
	//testHandlers();
	strcpy(currentPath, "/");
    2991:	c7 44 24 04 a1 b9 00 	movl   $0xb9a1,0x4(%esp)
    2998:	00 
    2999:	c7 04 24 00 3a 01 00 	movl   $0x13a00,(%esp)
    29a0:	e8 25 22 00 00       	call   4bca <strcpy>
	mkdir("userfolder");
    29a5:	c7 04 24 a3 b9 00 00 	movl   $0xb9a3,(%esp)
    29ac:	e8 c4 24 00 00       	call   4e75 <mkdir>
	enterDir("userfolder");
    29b1:	c7 04 24 a3 b9 00 00 	movl   $0xb9a3,(%esp)
    29b8:	e8 54 ee ff ff       	call   1811 <enterDir>
	freeFileItemList();
    29bd:	e8 a9 d7 ff ff       	call   16b <freeFileItemList>
	list(".");
    29c2:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    29c9:	e8 7b d8 ff ff       	call   249 <list>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    29ce:	8d 45 d0             	lea    -0x30(%ebp),%eax
    29d1:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    29d8:	00 
    29d9:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    29e0:	00 
    29e1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    29e8:	00 
    29e9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    29f0:	00 
    29f1:	89 04 24             	mov    %eax,(%esp)
    29f4:	e8 bd 1a 00 00       	call   44b6 <initRect>
    29f9:	83 ec 04             	sub    $0x4,%esp
    29fc:	8b 45 d0             	mov    -0x30(%ebp),%eax
    29ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a03:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2a06:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a0a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2a0d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2a11:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2a14:	89 44 24 10          	mov    %eax,0x10(%esp)
    2a18:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2a1f:	e8 95 1c 00 00       	call   46b9 <deleteClickable>
	addWndEvent(&cm);
    2a24:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2a2b:	e8 9d e8 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    2a30:	c7 04 24 00 3b 01 00 	movl   $0x13b00,(%esp)
    2a37:	e8 09 e8 ff ff       	call   1245 <addListEvent>
	lenOfWaited = 0;
    2a3c:	c7 05 18 3b 01 00 00 	movl   $0x0,0x13b18
    2a43:	00 00 00 
	while (isRun) {
    2a46:	e9 05 04 00 00       	jmp    2e50 <main+0x570>
		getMsg(&msg);
    2a4b:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2a4e:	89 04 24             	mov    %eax,(%esp)
    2a51:	e8 57 24 00 00       	call   4ead <getMsg>
		switch (msg.msg_type) {
    2a56:	8b 45 b8             	mov    -0x48(%ebp),%eax
    2a59:	83 f8 08             	cmp    $0x8,%eax
    2a5c:	0f 87 ed 03 00 00    	ja     2e4f <main+0x56f>
    2a62:	8b 04 85 b0 b9 00 00 	mov    0xb9b0(,%eax,4),%eax
    2a69:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2a6b:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2a6e:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2a71:	8d 45 b0             	lea    -0x50(%ebp),%eax
    2a74:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2a78:	89 54 24 04          	mov    %edx,0x4(%esp)
    2a7c:	89 04 24             	mov    %eax,(%esp)
    2a7f:	e8 0b 1a 00 00       	call   448f <initPoint>
    2a84:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    2a87:	8b 0d 04 3b 01 00    	mov    0x13b04,%ecx
    2a8d:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2a90:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    2a93:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a97:	89 54 24 08          	mov    %edx,0x8(%esp)
    2a9b:	89 0c 24             	mov    %ecx,(%esp)
    2a9e:	e8 f6 1c 00 00       	call   4799 <executeHandler>
    2aa3:	85 c0                	test   %eax,%eax
    2aa5:	74 19                	je     2ac0 <main+0x1e0>
				updateWindow(winid, context.addr);
    2aa7:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2aac:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ab0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ab3:	89 04 24             	mov    %eax,(%esp)
    2ab6:	e8 0a 24 00 00       	call   4ec5 <updateWindow>
			}
			break;
    2abb:	e9 90 03 00 00       	jmp    2e50 <main+0x570>
    2ac0:	e9 8b 03 00 00       	jmp    2e50 <main+0x570>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    2ac5:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2aca:	89 04 24             	mov    %eax,(%esp)
    2acd:	a1 c4 39 01 00       	mov    0x139c4,%eax
    2ad2:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ad6:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2adb:	89 44 24 08          	mov    %eax,0x8(%esp)
    2adf:	e8 b5 e0 ff ff       	call   b99 <drawFinderContent>
			drawFinderWnd(context);
    2ae4:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2ae9:	89 04 24             	mov    %eax,(%esp)
    2aec:	a1 c4 39 01 00       	mov    0x139c4,%eax
    2af1:	89 44 24 04          	mov    %eax,0x4(%esp)
    2af5:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2afa:	89 44 24 08          	mov    %eax,0x8(%esp)
    2afe:	e8 9c de ff ff       	call   99f <drawFinderWnd>
			updateWindow(winid, context.addr);
    2b03:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2b08:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b0c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b0f:	89 04 24             	mov    %eax,(%esp)
    2b12:	e8 ae 23 00 00       	call   4ec5 <updateWindow>
			break;
    2b17:	e9 34 03 00 00       	jmp    2e50 <main+0x570>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    2b1c:	8b 75 c8             	mov    -0x38(%ebp),%esi
    2b1f:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
    2b22:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2b25:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2b28:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2b2d:	89 74 24 14          	mov    %esi,0x14(%esp)
    2b31:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    2b35:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    2b39:	89 54 24 08          	mov    %edx,0x8(%esp)
    2b3d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b44:	89 04 24             	mov    %eax,(%esp)
    2b47:	e8 81 23 00 00       	call   4ecd <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    2b4c:	e9 ff 02 00 00       	jmp    2e50 <main+0x570>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2b51:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2b54:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2b57:	8d 45 80             	lea    -0x80(%ebp),%eax
    2b5a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2b5e:	89 54 24 04          	mov    %edx,0x4(%esp)
    2b62:	89 04 24             	mov    %eax,(%esp)
    2b65:	e8 25 19 00 00       	call   448f <initPoint>
    2b6a:	83 ec 04             	sub    $0x4,%esp
    2b6d:	8b 45 80             	mov    -0x80(%ebp),%eax
    2b70:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2b73:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2b76:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if(renaming == 1)
    2b79:	a1 14 3b 01 00       	mov    0x13b14,%eax
    2b7e:	83 f8 01             	cmp    $0x1,%eax
    2b81:	75 05                	jne    2b88 <main+0x2a8>
				unrename();
    2b83:	e8 9b f4 ff ff       	call   2023 <unrename>
			if (executeHandler(cm.left_click, p)) {
    2b88:	8b 0d 00 3b 01 00    	mov    0x13b00,%ecx
    2b8e:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2b91:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    2b94:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b98:	89 54 24 08          	mov    %edx,0x8(%esp)
    2b9c:	89 0c 24             	mov    %ecx,(%esp)
    2b9f:	e8 f5 1b 00 00       	call   4799 <executeHandler>
    2ba4:	85 c0                	test   %eax,%eax
    2ba6:	74 19                	je     2bc1 <main+0x2e1>
				updateWindow(winid, context.addr);
    2ba8:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2bad:	89 44 24 04          	mov    %eax,0x4(%esp)
    2bb1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bb4:	89 04 24             	mov    %eax,(%esp)
    2bb7:	e8 09 23 00 00       	call   4ec5 <updateWindow>
			}
			break;
    2bbc:	e9 8f 02 00 00       	jmp    2e50 <main+0x570>
    2bc1:	e9 8a 02 00 00       	jmp    2e50 <main+0x570>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2bc6:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2bc9:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2bcc:	8d 45 80             	lea    -0x80(%ebp),%eax
    2bcf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2bd3:	89 54 24 04          	mov    %edx,0x4(%esp)
    2bd7:	89 04 24             	mov    %eax,(%esp)
    2bda:	e8 b0 18 00 00       	call   448f <initPoint>
    2bdf:	83 ec 04             	sub    $0x4,%esp
    2be2:	8b 45 80             	mov    -0x80(%ebp),%eax
    2be5:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2be8:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2beb:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    2bee:	8b 0d 08 3b 01 00    	mov    0x13b08,%ecx
    2bf4:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2bf7:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    2bfa:	89 44 24 04          	mov    %eax,0x4(%esp)
    2bfe:	89 54 24 08          	mov    %edx,0x8(%esp)
    2c02:	89 0c 24             	mov    %ecx,(%esp)
    2c05:	e8 8f 1b 00 00       	call   4799 <executeHandler>
    2c0a:	85 c0                	test   %eax,%eax
    2c0c:	74 19                	je     2c27 <main+0x347>
				updateWindow(winid, context.addr);
    2c0e:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2c13:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c17:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2c1a:	89 04 24             	mov    %eax,(%esp)
    2c1d:	e8 a3 22 00 00       	call   4ec5 <updateWindow>
			}
			break;
    2c22:	e9 29 02 00 00       	jmp    2e50 <main+0x570>
    2c27:	e9 24 02 00 00       	jmp    2e50 <main+0x570>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    2c2c:	0f b6 45 bc          	movzbl -0x44(%ebp),%eax
    2c30:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    2c33:	a1 a0 30 01 00       	mov    0x130a0,%eax
    2c38:	85 c0                	test   %eax,%eax
    2c3a:	0f 84 ea 00 00 00    	je     2d2a <main+0x44a>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    2c40:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    2c44:	74 2a                	je     2c70 <main+0x390>
    2c46:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    2c4a:	74 24                	je     2c70 <main+0x390>
    2c4c:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    2c50:	7e 06                	jle    2c58 <main+0x378>
    2c52:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    2c56:	7e 18                	jle    2c70 <main+0x390>
    2c58:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    2c5c:	7e 06                	jle    2c64 <main+0x384>
    2c5e:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    2c62:	7e 0c                	jle    2c70 <main+0x390>
    2c64:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    2c68:	7e 46                	jle    2cb0 <main+0x3d0>
    2c6a:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    2c6e:	7f 40                	jg     2cb0 <main+0x3d0>
    2c70:	a1 e0 39 01 00       	mov    0x139e0,%eax
    2c75:	83 f8 13             	cmp    $0x13,%eax
    2c78:	7f 36                	jg     2cb0 <main+0x3d0>
					keyContent.content[keyContent.length++] = key;
    2c7a:	a1 e0 39 01 00       	mov    0x139e0,%eax
    2c7f:	8d 50 01             	lea    0x1(%eax),%edx
    2c82:	89 15 e0 39 01 00    	mov    %edx,0x139e0
    2c88:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    2c8c:	88 90 cc 39 01 00    	mov    %dl,0x139cc(%eax)
					printf(0, "%s\n", keyContent.content);
    2c92:	c7 44 24 08 cc 39 01 	movl   $0x139cc,0x8(%esp)
    2c99:	00 
    2c9a:	c7 44 24 04 4f b7 00 	movl   $0xb74f,0x4(%esp)
    2ca1:	00 
    2ca2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ca9:	e8 47 23 00 00       	call   4ff5 <printf>
    2cae:	eb 28                	jmp    2cd8 <main+0x3f8>
				}
				else if (key == 8 && keyContent.length > 0) {
    2cb0:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    2cb4:	75 22                	jne    2cd8 <main+0x3f8>
    2cb6:	a1 e0 39 01 00       	mov    0x139e0,%eax
    2cbb:	85 c0                	test   %eax,%eax
    2cbd:	7e 19                	jle    2cd8 <main+0x3f8>
					keyContent.content[--keyContent.length] = 0;
    2cbf:	a1 e0 39 01 00       	mov    0x139e0,%eax
    2cc4:	83 e8 01             	sub    $0x1,%eax
    2cc7:	a3 e0 39 01 00       	mov    %eax,0x139e0
    2ccc:	a1 e0 39 01 00       	mov    0x139e0,%eax
    2cd1:	c6 80 cc 39 01 00 00 	movb   $0x0,0x139cc(%eax)
				}
				drawFinderContent(context);
    2cd8:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2cdd:	89 04 24             	mov    %eax,(%esp)
    2ce0:	a1 c4 39 01 00       	mov    0x139c4,%eax
    2ce5:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ce9:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2cee:	89 44 24 08          	mov    %eax,0x8(%esp)
    2cf2:	e8 a2 de ff ff       	call   b99 <drawFinderContent>
				drawFinderWnd(context);
    2cf7:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2cfc:	89 04 24             	mov    %eax,(%esp)
    2cff:	a1 c4 39 01 00       	mov    0x139c4,%eax
    2d04:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d08:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2d0d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d11:	e8 89 dc ff ff       	call   99f <drawFinderWnd>
				updateWindow(winid, context.addr);
    2d16:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2d1b:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d1f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d22:	89 04 24             	mov    %eax,(%esp)
    2d25:	e8 9b 21 00 00       	call   4ec5 <updateWindow>
			}
			if (renaming) {
    2d2a:	a1 14 3b 01 00       	mov    0x13b14,%eax
    2d2f:	85 c0                	test   %eax,%eax
    2d31:	0f 84 16 01 00 00    	je     2e4d <main+0x56d>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (strlen(currentlyRenaming->name)<30)) {
    2d37:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    2d3b:	74 2a                	je     2d67 <main+0x487>
    2d3d:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    2d41:	74 24                	je     2d67 <main+0x487>
    2d43:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    2d47:	7e 06                	jle    2d4f <main+0x46f>
    2d49:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    2d4d:	7e 18                	jle    2d67 <main+0x487>
    2d4f:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    2d53:	7e 06                	jle    2d5b <main+0x47b>
    2d55:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    2d59:	7e 0c                	jle    2d67 <main+0x487>
    2d5b:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    2d5f:	7e 5e                	jle    2dbf <main+0x4df>
    2d61:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    2d65:	7f 58                	jg     2dbf <main+0x4df>
    2d67:	a1 a8 02 01 00       	mov    0x102a8,%eax
    2d6c:	8b 40 14             	mov    0x14(%eax),%eax
    2d6f:	89 04 24             	mov    %eax,(%esp)
    2d72:	e8 c2 1e 00 00       	call   4c39 <strlen>
    2d77:	83 f8 1d             	cmp    $0x1d,%eax
    2d7a:	77 43                	ja     2dbf <main+0x4df>
					currentlyRenaming->name[strlen(currentlyRenaming->name) + 1] = 0;
    2d7c:	a1 a8 02 01 00       	mov    0x102a8,%eax
    2d81:	8b 58 14             	mov    0x14(%eax),%ebx
    2d84:	a1 a8 02 01 00       	mov    0x102a8,%eax
    2d89:	8b 40 14             	mov    0x14(%eax),%eax
    2d8c:	89 04 24             	mov    %eax,(%esp)
    2d8f:	e8 a5 1e 00 00       	call   4c39 <strlen>
    2d94:	83 c0 01             	add    $0x1,%eax
    2d97:	01 d8                	add    %ebx,%eax
    2d99:	c6 00 00             	movb   $0x0,(%eax)
					currentlyRenaming->name[strlen(currentlyRenaming->name)] = key;
    2d9c:	a1 a8 02 01 00       	mov    0x102a8,%eax
    2da1:	8b 58 14             	mov    0x14(%eax),%ebx
    2da4:	a1 a8 02 01 00       	mov    0x102a8,%eax
    2da9:	8b 40 14             	mov    0x14(%eax),%eax
    2dac:	89 04 24             	mov    %eax,(%esp)
    2daf:	e8 85 1e 00 00       	call   4c39 <strlen>
    2db4:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    2db7:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
    2dbb:	88 02                	mov    %al,(%edx)
    2dbd:	eb 3a                	jmp    2df9 <main+0x519>
				}
				else if (key == 8 && (strlen(currentlyRenaming->name)>0)) {
    2dbf:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    2dc3:	75 34                	jne    2df9 <main+0x519>
    2dc5:	a1 a8 02 01 00       	mov    0x102a8,%eax
    2dca:	8b 40 14             	mov    0x14(%eax),%eax
    2dcd:	89 04 24             	mov    %eax,(%esp)
    2dd0:	e8 64 1e 00 00       	call   4c39 <strlen>
    2dd5:	85 c0                	test   %eax,%eax
    2dd7:	74 20                	je     2df9 <main+0x519>
					currentlyRenaming->name[strlen(currentlyRenaming->name) - 1] = 0;
    2dd9:	a1 a8 02 01 00       	mov    0x102a8,%eax
    2dde:	8b 58 14             	mov    0x14(%eax),%ebx
    2de1:	a1 a8 02 01 00       	mov    0x102a8,%eax
    2de6:	8b 40 14             	mov    0x14(%eax),%eax
    2de9:	89 04 24             	mov    %eax,(%esp)
    2dec:	e8 48 1e 00 00       	call   4c39 <strlen>
    2df1:	83 e8 01             	sub    $0x1,%eax
    2df4:	01 d8                	add    %ebx,%eax
    2df6:	c6 00 00             	movb   $0x0,(%eax)
				}
				drawFinderContent(context);
    2df9:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2dfe:	89 04 24             	mov    %eax,(%esp)
    2e01:	a1 c4 39 01 00       	mov    0x139c4,%eax
    2e06:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e0a:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2e0f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e13:	e8 81 dd ff ff       	call   b99 <drawFinderContent>
				drawFinderWnd(context);
    2e18:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2e1d:	89 04 24             	mov    %eax,(%esp)
    2e20:	a1 c4 39 01 00       	mov    0x139c4,%eax
    2e25:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e29:	a1 c8 39 01 00       	mov    0x139c8,%eax
    2e2e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e32:	e8 68 db ff ff       	call   99f <drawFinderWnd>
				updateWindow(winid, context.addr);
    2e37:	a1 c0 39 01 00       	mov    0x139c0,%eax
    2e3c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e43:	89 04 24             	mov    %eax,(%esp)
    2e46:	e8 7a 20 00 00       	call   4ec5 <updateWindow>
			}
			break;
    2e4b:	eb 03                	jmp    2e50 <main+0x570>
    2e4d:	eb 01                	jmp    2e50 <main+0x570>
		default:
			break;
    2e4f:	90                   	nop
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    2e50:	a1 40 f9 00 00       	mov    0xf940,%eax
    2e55:	85 c0                	test   %eax,%eax
    2e57:	0f 85 ee fb ff ff    	jne    2a4b <main+0x16b>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    2e5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e60:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e64:	c7 04 24 c0 39 01 00 	movl   $0x139c0,(%esp)
    2e6b:	e8 93 01 00 00       	call   3003 <free_context>
	exit();
    2e70:	e8 98 1f 00 00       	call   4e0d <exit>

00002e75 <testHandlers>:
}

void testHandlers() {
    2e75:	55                   	push   %ebp
    2e76:	89 e5                	mov    %esp,%ebp
    2e78:	83 ec 18             	sub    $0x18,%esp

	list(".");
    2e7b:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    2e82:	e8 c2 d3 ff ff       	call   249 <list>
	printf(0, "original list:\n");
    2e87:	c7 44 24 04 d4 b9 00 	movl   $0xb9d4,0x4(%esp)
    2e8e:	00 
    2e8f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e96:	e8 5a 21 00 00       	call   4ff5 <printf>
	printItemList();
    2e9b:	e8 8f e1 ff ff       	call   102f <printItemList>
	printf(0, "\n");
    2ea0:	c7 44 24 04 e4 b9 00 	movl   $0xb9e4,0x4(%esp)
    2ea7:	00 
    2ea8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2eaf:	e8 41 21 00 00       	call   4ff5 <printf>
	printf(0, "new a folder:\n");
    2eb4:	c7 44 24 04 e6 b9 00 	movl   $0xb9e6,0x4(%esp)
    2ebb:	00 
    2ebc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ec3:	e8 2d 21 00 00       	call   4ff5 <printf>
	newFolder("newfolder");
    2ec8:	c7 04 24 f5 b9 00 00 	movl   $0xb9f5,(%esp)
    2ecf:	e8 8f ec ff ff       	call   1b63 <newFolder>
	freeFileItemList();
    2ed4:	e8 92 d2 ff ff       	call   16b <freeFileItemList>
	list(".");
    2ed9:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    2ee0:	e8 64 d3 ff ff       	call   249 <list>
	printItemList();
    2ee5:	e8 45 e1 ff ff       	call   102f <printItemList>
	printf(0, "\n");
    2eea:	c7 44 24 04 e4 b9 00 	movl   $0xb9e4,0x4(%esp)
    2ef1:	00 
    2ef2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ef9:	e8 f7 20 00 00       	call   4ff5 <printf>
	printf(0, "enter new folder:\n");
    2efe:	c7 44 24 04 ff b9 00 	movl   $0xb9ff,0x4(%esp)
    2f05:	00 
    2f06:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f0d:	e8 e3 20 00 00       	call   4ff5 <printf>
	enterDir("newfolder");
    2f12:	c7 04 24 f5 b9 00 00 	movl   $0xb9f5,(%esp)
    2f19:	e8 f3 e8 ff ff       	call   1811 <enterDir>
	freeFileItemList();
    2f1e:	e8 48 d2 ff ff       	call   16b <freeFileItemList>
	list(".");
    2f23:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    2f2a:	e8 1a d3 ff ff       	call   249 <list>
	printItemList();
    2f2f:	e8 fb e0 ff ff       	call   102f <printItemList>
	printf(0, "\n");
    2f34:	c7 44 24 04 e4 b9 00 	movl   $0xb9e4,0x4(%esp)
    2f3b:	00 
    2f3c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f43:	e8 ad 20 00 00       	call   4ff5 <printf>
	printf(0, "new a file:\n");
    2f48:	c7 44 24 04 12 ba 00 	movl   $0xba12,0x4(%esp)
    2f4f:	00 
    2f50:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f57:	e8 99 20 00 00       	call   4ff5 <printf>
	newFile("newfile.txt");
    2f5c:	c7 04 24 1f ba 00 00 	movl   $0xba1f,(%esp)
    2f63:	e8 11 ea ff ff       	call   1979 <newFile>
	freeFileItemList();
    2f68:	e8 fe d1 ff ff       	call   16b <freeFileItemList>
	list(".");
    2f6d:	c7 04 24 87 b7 00 00 	movl   $0xb787,(%esp)
    2f74:	e8 d0 d2 ff ff       	call   249 <list>
	printItemList();
    2f79:	e8 b1 e0 ff ff       	call   102f <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    2f7e:	c9                   	leave  
    2f7f:	c3                   	ret    

00002f80 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    2f80:	55                   	push   %ebp
    2f81:	89 e5                	mov    %esp,%ebp
    2f83:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    2f86:	8b 45 08             	mov    0x8(%ebp),%eax
    2f89:	8b 55 0c             	mov    0xc(%ebp),%edx
    2f8c:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    2f8f:	8b 45 08             	mov    0x8(%ebp),%eax
    2f92:	8b 55 10             	mov    0x10(%ebp),%edx
    2f95:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    2f98:	8b 55 0c             	mov    0xc(%ebp),%edx
    2f9b:	8b 45 10             	mov    0x10(%ebp),%eax
    2f9e:	0f af c2             	imul   %edx,%eax
    2fa1:	01 c0                	add    %eax,%eax
    2fa3:	89 04 24             	mov    %eax,(%esp)
    2fa6:	e8 36 23 00 00       	call   52e1 <malloc>
    2fab:	8b 55 08             	mov    0x8(%ebp),%edx
    2fae:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    2fb0:	8b 55 0c             	mov    0xc(%ebp),%edx
    2fb3:	8b 45 10             	mov    0x10(%ebp),%eax
    2fb6:	0f af c2             	imul   %edx,%eax
    2fb9:	8d 14 00             	lea    (%eax,%eax,1),%edx
    2fbc:	8b 45 08             	mov    0x8(%ebp),%eax
    2fbf:	8b 00                	mov    (%eax),%eax
    2fc1:	89 54 24 08          	mov    %edx,0x8(%esp)
    2fc5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2fcc:	00 
    2fcd:	89 04 24             	mov    %eax,(%esp)
    2fd0:	e8 8b 1c 00 00       	call   4c60 <memset>
    initializeASCII();
    2fd5:	e8 93 01 00 00       	call   316d <initializeASCII>
    initializeGBK();
    2fda:	e8 17 03 00 00       	call   32f6 <initializeGBK>
    return createWindow(0, 0, width, height);
    2fdf:	8b 45 10             	mov    0x10(%ebp),%eax
    2fe2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2fe6:	8b 45 0c             	mov    0xc(%ebp),%eax
    2fe9:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fed:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ff4:	00 
    2ff5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ffc:	e8 b4 1e 00 00       	call   4eb5 <createWindow>
}
    3001:	c9                   	leave  
    3002:	c3                   	ret    

00003003 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    3003:	55                   	push   %ebp
    3004:	89 e5                	mov    %esp,%ebp
    3006:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    3009:	8b 45 08             	mov    0x8(%ebp),%eax
    300c:	8b 00                	mov    (%eax),%eax
    300e:	89 04 24             	mov    %eax,(%esp)
    3011:	e8 92 21 00 00       	call   51a8 <free>
    freeASCII();
    3016:	e8 c6 02 00 00       	call   32e1 <freeASCII>
    freeGBK();
    301b:	e8 7e 03 00 00       	call   339e <freeGBK>
    destroyWindow(winid);
    3020:	8b 45 0c             	mov    0xc(%ebp),%eax
    3023:	89 04 24             	mov    %eax,(%esp)
    3026:	e8 92 1e 00 00       	call   4ebd <destroyWindow>
}
    302b:	c9                   	leave  
    302c:	c3                   	ret    

0000302d <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    302d:	55                   	push   %ebp
    302e:	89 e5                	mov    %esp,%ebp
    3030:	83 ec 04             	sub    $0x4,%esp
    3033:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3036:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    303a:	8b 45 0c             	mov    0xc(%ebp),%eax
    303d:	3b 45 14             	cmp    0x14(%ebp),%eax
    3040:	77 02                	ja     3044 <draw_point+0x17>
    return;
    3042:	eb 26                	jmp    306a <draw_point+0x3d>
  if(y >= c.height)
    3044:	8b 45 10             	mov    0x10(%ebp),%eax
    3047:	3b 45 18             	cmp    0x18(%ebp),%eax
    304a:	77 02                	ja     304e <draw_point+0x21>
    return;
    304c:	eb 1c                	jmp    306a <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    304e:	8b 55 08             	mov    0x8(%ebp),%edx
    3051:	8b 45 0c             	mov    0xc(%ebp),%eax
    3054:	0f af 45 18          	imul   0x18(%ebp),%eax
    3058:	89 c1                	mov    %eax,%ecx
    305a:	8b 45 14             	mov    0x14(%ebp),%eax
    305d:	01 c8                	add    %ecx,%eax
    305f:	01 c0                	add    %eax,%eax
    3061:	01 c2                	add    %eax,%edx
    3063:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    3067:	66 89 02             	mov    %ax,(%edx)
}
    306a:	c9                   	leave  
    306b:	c3                   	ret    

0000306c <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    306c:	55                   	push   %ebp
    306d:	89 e5                	mov    %esp,%ebp
    306f:	83 ec 2c             	sub    $0x2c,%esp
    3072:	8b 45 24             	mov    0x24(%ebp),%eax
    3075:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    3079:	8b 45 1c             	mov    0x1c(%ebp),%eax
    307c:	8b 55 14             	mov    0x14(%ebp),%edx
    307f:	01 c2                	add    %eax,%edx
    3081:	8b 45 0c             	mov    0xc(%ebp),%eax
    3084:	39 c2                	cmp    %eax,%edx
    3086:	0f 46 c2             	cmovbe %edx,%eax
    3089:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    308c:	8b 45 20             	mov    0x20(%ebp),%eax
    308f:	8b 55 18             	mov    0x18(%ebp),%edx
    3092:	01 c2                	add    %eax,%edx
    3094:	8b 45 10             	mov    0x10(%ebp),%eax
    3097:	39 c2                	cmp    %eax,%edx
    3099:	0f 46 c2             	cmovbe %edx,%eax
    309c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    309f:	8b 45 18             	mov    0x18(%ebp),%eax
    30a2:	89 45 f8             	mov    %eax,-0x8(%ebp)
    30a5:	eb 47                	jmp    30ee <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    30a7:	8b 45 14             	mov    0x14(%ebp),%eax
    30aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
    30ad:	eb 33                	jmp    30e2 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    30af:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    30b3:	8b 55 f8             	mov    -0x8(%ebp),%edx
    30b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    30b9:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    30bd:	89 54 24 10          	mov    %edx,0x10(%esp)
    30c1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    30c5:	8b 45 08             	mov    0x8(%ebp),%eax
    30c8:	89 04 24             	mov    %eax,(%esp)
    30cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    30ce:	89 44 24 04          	mov    %eax,0x4(%esp)
    30d2:	8b 45 10             	mov    0x10(%ebp),%eax
    30d5:	89 44 24 08          	mov    %eax,0x8(%esp)
    30d9:	e8 4f ff ff ff       	call   302d <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    30de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    30e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    30e5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    30e8:	7c c5                	jl     30af <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    30ea:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    30ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
    30f1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    30f4:	7c b1                	jl     30a7 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    30f6:	c9                   	leave  
    30f7:	c3                   	ret    

000030f8 <printBinary>:

void printBinary(char c)
{
    30f8:	55                   	push   %ebp
    30f9:	89 e5                	mov    %esp,%ebp
    30fb:	83 ec 28             	sub    $0x28,%esp
    30fe:	8b 45 08             	mov    0x8(%ebp),%eax
    3101:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    3104:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    310b:	eb 44                	jmp    3151 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    310d:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    3111:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3114:	89 c1                	mov    %eax,%ecx
    3116:	d3 e2                	shl    %cl,%edx
    3118:	89 d0                	mov    %edx,%eax
    311a:	25 80 00 00 00       	and    $0x80,%eax
    311f:	85 c0                	test   %eax,%eax
    3121:	74 16                	je     3139 <printBinary+0x41>
		{
			printf(0, "1");
    3123:	c7 44 24 04 2b ba 00 	movl   $0xba2b,0x4(%esp)
    312a:	00 
    312b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3132:	e8 be 1e 00 00       	call   4ff5 <printf>
    3137:	eb 14                	jmp    314d <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    3139:	c7 44 24 04 2d ba 00 	movl   $0xba2d,0x4(%esp)
    3140:	00 
    3141:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3148:	e8 a8 1e 00 00       	call   4ff5 <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    314d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3151:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3155:	7e b6                	jle    310d <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    3157:	c7 44 24 04 2f ba 00 	movl   $0xba2f,0x4(%esp)
    315e:	00 
    315f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3166:	e8 8a 1e 00 00       	call   4ff5 <printf>
}
    316b:	c9                   	leave  
    316c:	c3                   	ret    

0000316d <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    316d:	55                   	push   %ebp
    316e:	89 e5                	mov    %esp,%ebp
    3170:	56                   	push   %esi
    3171:	53                   	push   %ebx
    3172:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    3175:	c7 44 24 04 31 ba 00 	movl   $0xba31,0x4(%esp)
    317c:	00 
    317d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3184:	e8 6c 1e 00 00       	call   4ff5 <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    3189:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3190:	00 
    3191:	c7 04 24 44 ba 00 00 	movl   $0xba44,(%esp)
    3198:	e8 b0 1c 00 00       	call   4e4d <open>
    319d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    31a0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    31a4:	79 21                	jns    31c7 <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    31a6:	c7 44 24 08 44 ba 00 	movl   $0xba44,0x8(%esp)
    31ad:	00 
    31ae:	c7 44 24 04 50 ba 00 	movl   $0xba50,0x4(%esp)
    31b5:	00 
    31b6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31bd:	e8 33 1e 00 00       	call   4ff5 <printf>
	  return;
    31c2:	e9 13 01 00 00       	jmp    32da <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    31c7:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    31ce:	e8 0e 21 00 00       	call   52e1 <malloc>
    31d3:	a3 20 3b 01 00       	mov    %eax,0x13b20
	for (i = 0; i < ASCII_NUM; i++)
    31d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    31df:	eb 12                	jmp    31f3 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    31e1:	8b 15 20 3b 01 00    	mov    0x13b20,%edx
    31e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31ea:	01 d0                	add    %edx,%eax
    31ec:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    31ef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    31f3:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    31fa:	7e e5                	jle    31e1 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    31fc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    3203:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    320a:	e9 84 00 00 00       	jmp    3293 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    320f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3216:	eb 73                	jmp    328b <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    3218:	8b 45 f4             	mov    -0xc(%ebp),%eax
    321b:	05 40 3b 01 00       	add    $0x13b40,%eax
    3220:	0f b6 00             	movzbl (%eax),%eax
    3223:	3c 2a                	cmp    $0x2a,%al
    3225:	74 0f                	je     3236 <initializeASCII+0xc9>
    3227:	8b 45 f4             	mov    -0xc(%ebp),%eax
    322a:	05 40 3b 01 00       	add    $0x13b40,%eax
    322f:	0f b6 00             	movzbl (%eax),%eax
    3232:	3c 2e                	cmp    $0x2e,%al
    3234:	75 51                	jne    3287 <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    3236:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3239:	05 40 3b 01 00       	add    $0x13b40,%eax
    323e:	0f b6 00             	movzbl (%eax),%eax
    3241:	3c 2a                	cmp    $0x2a,%al
    3243:	75 2d                	jne    3272 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    3245:	8b 15 20 3b 01 00    	mov    0x13b20,%edx
    324b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    324e:	01 c2                	add    %eax,%edx
    3250:	8b 0d 20 3b 01 00    	mov    0x13b20,%ecx
    3256:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3259:	01 c8                	add    %ecx,%eax
    325b:	0f b6 00             	movzbl (%eax),%eax
    325e:	89 c3                	mov    %eax,%ebx
    3260:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3263:	be 80 00 00 00       	mov    $0x80,%esi
    3268:	89 c1                	mov    %eax,%ecx
    326a:	d3 fe                	sar    %cl,%esi
    326c:	89 f0                	mov    %esi,%eax
    326e:	09 d8                	or     %ebx,%eax
    3270:	88 02                	mov    %al,(%edx)
				}
				x ++;
    3272:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    3276:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    327a:	7e 0b                	jle    3287 <initializeASCII+0x11a>
				{
					x = 0;
    327c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    3283:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    3287:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    328b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    328e:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    3291:	7c 85                	jl     3218 <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    3293:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    329a:	00 
    329b:	c7 44 24 04 40 3b 01 	movl   $0x13b40,0x4(%esp)
    32a2:	00 
    32a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    32a6:	89 04 24             	mov    %eax,(%esp)
    32a9:	e8 77 1b 00 00       	call   4e25 <read>
    32ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    32b1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    32b5:	0f 8f 54 ff ff ff    	jg     320f <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    32bb:	c7 44 24 04 60 ba 00 	movl   $0xba60,0x4(%esp)
    32c2:	00 
    32c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32ca:	e8 26 1d 00 00       	call   4ff5 <printf>
	close(fd);
    32cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    32d2:	89 04 24             	mov    %eax,(%esp)
    32d5:	e8 5b 1b 00 00       	call   4e35 <close>
}
    32da:	83 c4 30             	add    $0x30,%esp
    32dd:	5b                   	pop    %ebx
    32de:	5e                   	pop    %esi
    32df:	5d                   	pop    %ebp
    32e0:	c3                   	ret    

000032e1 <freeASCII>:

void freeASCII(){
    32e1:	55                   	push   %ebp
    32e2:	89 e5                	mov    %esp,%ebp
    32e4:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    32e7:	a1 20 3b 01 00       	mov    0x13b20,%eax
    32ec:	89 04 24             	mov    %eax,(%esp)
    32ef:	e8 b4 1e 00 00       	call   51a8 <free>
}
    32f4:	c9                   	leave  
    32f5:	c3                   	ret    

000032f6 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    32f6:	55                   	push   %ebp
    32f7:	89 e5                	mov    %esp,%ebp
    32f9:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    32fc:	c7 44 24 04 7d ba 00 	movl   $0xba7d,0x4(%esp)
    3303:	00 
    3304:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    330b:	e8 e5 1c 00 00       	call   4ff5 <printf>
	if((fd = open(HZK16, 0)) < 0){
    3310:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3317:	00 
    3318:	c7 04 24 8e ba 00 00 	movl   $0xba8e,(%esp)
    331f:	e8 29 1b 00 00       	call   4e4d <open>
    3324:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3327:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    332b:	79 1e                	jns    334b <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    332d:	c7 44 24 08 8e ba 00 	movl   $0xba8e,0x8(%esp)
    3334:	00 
    3335:	c7 44 24 04 50 ba 00 	movl   $0xba50,0x4(%esp)
    333c:	00 
    333d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3344:	e8 ac 1c 00 00       	call   4ff5 <printf>
		return;
    3349:	eb 51                	jmp    339c <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    334b:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    3352:	e8 8a 1f 00 00       	call   52e1 <malloc>
    3357:	a3 24 3b 01 00       	mov    %eax,0x13b24
	fontFile.size = read(fd, fontFile.buf, 27000);
    335c:	a1 24 3b 01 00       	mov    0x13b24,%eax
    3361:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    3368:	00 
    3369:	89 44 24 04          	mov    %eax,0x4(%esp)
    336d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3370:	89 04 24             	mov    %eax,(%esp)
    3373:	e8 ad 1a 00 00       	call   4e25 <read>
    3378:	a3 28 3b 01 00       	mov    %eax,0x13b28
	printf(0,"initialzing gbk complete!\n");
    337d:	c7 44 24 04 98 ba 00 	movl   $0xba98,0x4(%esp)
    3384:	00 
    3385:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    338c:	e8 64 1c 00 00       	call   4ff5 <printf>
	close(fd);
    3391:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3394:	89 04 24             	mov    %eax,(%esp)
    3397:	e8 99 1a 00 00       	call   4e35 <close>
}
    339c:	c9                   	leave  
    339d:	c3                   	ret    

0000339e <freeGBK>:

void freeGBK(){
    339e:	55                   	push   %ebp
    339f:	89 e5                	mov    %esp,%ebp
    33a1:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    33a4:	a1 24 3b 01 00       	mov    0x13b24,%eax
    33a9:	89 04 24             	mov    %eax,(%esp)
    33ac:	e8 f7 1d 00 00       	call   51a8 <free>
}
    33b1:	c9                   	leave  
    33b2:	c3                   	ret    

000033b3 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    33b3:	55                   	push   %ebp
    33b4:	89 e5                	mov    %esp,%ebp
    33b6:	53                   	push   %ebx
    33b7:	83 ec 30             	sub    $0x30,%esp
    33ba:	8b 55 14             	mov    0x14(%ebp),%edx
    33bd:	8b 45 18             	mov    0x18(%ebp),%eax
    33c0:	88 55 e8             	mov    %dl,-0x18(%ebp)
    33c3:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    33c7:	8b 45 20             	mov    0x20(%ebp),%eax
    33ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
    33cd:	eb 7f                	jmp    344e <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    33cf:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    33d6:	eb 6c                	jmp    3444 <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    33d8:	a1 20 3b 01 00       	mov    0x13b20,%eax
    33dd:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    33e1:	c1 e2 04             	shl    $0x4,%edx
    33e4:	89 d1                	mov    %edx,%ecx
    33e6:	8b 55 20             	mov    0x20(%ebp),%edx
    33e9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    33ec:	29 d3                	sub    %edx,%ebx
    33ee:	89 da                	mov    %ebx,%edx
    33f0:	01 ca                	add    %ecx,%edx
    33f2:	01 d0                	add    %edx,%eax
    33f4:	0f b6 00             	movzbl (%eax),%eax
    33f7:	0f b6 d0             	movzbl %al,%edx
    33fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    33fd:	89 c1                	mov    %eax,%ecx
    33ff:	d3 e2                	shl    %cl,%edx
    3401:	89 d0                	mov    %edx,%eax
    3403:	25 80 00 00 00       	and    $0x80,%eax
    3408:	85 c0                	test   %eax,%eax
    340a:	74 34                	je     3440 <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    340c:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    3410:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3413:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3416:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3419:	01 d8                	add    %ebx,%eax
    341b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    341f:	89 54 24 10          	mov    %edx,0x10(%esp)
    3423:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3427:	8b 45 08             	mov    0x8(%ebp),%eax
    342a:	89 04 24             	mov    %eax,(%esp)
    342d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3430:	89 44 24 04          	mov    %eax,0x4(%esp)
    3434:	8b 45 10             	mov    0x10(%ebp),%eax
    3437:	89 44 24 08          	mov    %eax,0x8(%esp)
    343b:	e8 ed fb ff ff       	call   302d <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    3440:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3444:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    3448:	7e 8e                	jle    33d8 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    344a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    344e:	8b 45 20             	mov    0x20(%ebp),%eax
    3451:	83 c0 10             	add    $0x10,%eax
    3454:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3457:	0f 8f 72 ff ff ff    	jg     33cf <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    345d:	83 c4 30             	add    $0x30,%esp
    3460:	5b                   	pop    %ebx
    3461:	5d                   	pop    %ebp
    3462:	c3                   	ret    

00003463 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    3463:	55                   	push   %ebp
    3464:	89 e5                	mov    %esp,%ebp
    3466:	53                   	push   %ebx
    3467:	83 ec 34             	sub    $0x34,%esp
    346a:	8b 55 14             	mov    0x14(%ebp),%edx
    346d:	8b 45 18             	mov    0x18(%ebp),%eax
    3470:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    3474:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    3478:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    347c:	0f b6 c0             	movzbl %al,%eax
    347f:	3d a0 00 00 00       	cmp    $0xa0,%eax
    3484:	0f 8e 40 01 00 00    	jle    35ca <put_gbk+0x167>
    348a:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    348e:	66 c1 f8 08          	sar    $0x8,%ax
    3492:	98                   	cwtl   
    3493:	0f b6 c0             	movzbl %al,%eax
    3496:	3d a0 00 00 00       	cmp    $0xa0,%eax
    349b:	0f 8e 29 01 00 00    	jle    35ca <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    34a1:	a1 24 3b 01 00       	mov    0x13b24,%eax
    34a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    34a9:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    34ad:	0f b6 c0             	movzbl %al,%eax
    34b0:	2d a1 00 00 00       	sub    $0xa1,%eax
    34b5:	6b c0 5e             	imul   $0x5e,%eax,%eax
    34b8:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    34bc:	66 c1 fa 08          	sar    $0x8,%dx
    34c0:	0f bf d2             	movswl %dx,%edx
    34c3:	0f b6 d2             	movzbl %dl,%edx
    34c6:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    34cc:	01 d0                	add    %edx,%eax
    34ce:	c1 e0 05             	shl    $0x5,%eax
    34d1:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    34d4:	8b 45 20             	mov    0x20(%ebp),%eax
    34d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    34da:	e9 da 00 00 00       	jmp    35b9 <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    34df:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    34e6:	eb 58                	jmp    3540 <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    34e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34eb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    34ee:	01 d0                	add    %edx,%eax
    34f0:	0f b6 00             	movzbl (%eax),%eax
    34f3:	0f b6 d0             	movzbl %al,%edx
    34f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    34f9:	89 c1                	mov    %eax,%ecx
    34fb:	d3 e2                	shl    %cl,%edx
    34fd:	89 d0                	mov    %edx,%eax
    34ff:	25 80 00 00 00       	and    $0x80,%eax
    3504:	85 c0                	test   %eax,%eax
    3506:	74 34                	je     353c <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3508:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    350c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    350f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3512:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3515:	01 d8                	add    %ebx,%eax
    3517:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    351b:	89 54 24 10          	mov    %edx,0x10(%esp)
    351f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3523:	8b 45 08             	mov    0x8(%ebp),%eax
    3526:	89 04 24             	mov    %eax,(%esp)
    3529:	8b 45 0c             	mov    0xc(%ebp),%eax
    352c:	89 44 24 04          	mov    %eax,0x4(%esp)
    3530:	8b 45 10             	mov    0x10(%ebp),%eax
    3533:	89 44 24 08          	mov    %eax,0x8(%esp)
    3537:	e8 f1 fa ff ff       	call   302d <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    353c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3540:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    3544:	7e a2                	jle    34e8 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    3546:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    354a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3551:	eb 58                	jmp    35ab <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    3553:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3556:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3559:	01 d0                	add    %edx,%eax
    355b:	0f b6 00             	movzbl (%eax),%eax
    355e:	0f b6 d0             	movzbl %al,%edx
    3561:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3564:	89 c1                	mov    %eax,%ecx
    3566:	d3 e2                	shl    %cl,%edx
    3568:	89 d0                	mov    %edx,%eax
    356a:	25 80 00 00 00       	and    $0x80,%eax
    356f:	85 c0                	test   %eax,%eax
    3571:	74 34                	je     35a7 <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3573:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    3577:	8b 55 f4             	mov    -0xc(%ebp),%edx
    357a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    357d:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3580:	01 d8                	add    %ebx,%eax
    3582:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3586:	89 54 24 10          	mov    %edx,0x10(%esp)
    358a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    358e:	8b 45 08             	mov    0x8(%ebp),%eax
    3591:	89 04 24             	mov    %eax,(%esp)
    3594:	8b 45 0c             	mov    0xc(%ebp),%eax
    3597:	89 44 24 04          	mov    %eax,0x4(%esp)
    359b:	8b 45 10             	mov    0x10(%ebp),%eax
    359e:	89 44 24 08          	mov    %eax,0x8(%esp)
    35a2:	e8 86 fa ff ff       	call   302d <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    35a7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    35ab:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    35af:	7e a2                	jle    3553 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    35b1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    35b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    35b9:	8b 45 20             	mov    0x20(%ebp),%eax
    35bc:	83 c0 10             	add    $0x10,%eax
    35bf:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    35c2:	0f 8f 17 ff ff ff    	jg     34df <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    35c8:	eb 7b                	jmp    3645 <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    35ca:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    35ce:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    35d2:	0f b6 c0             	movzbl %al,%eax
    35d5:	8b 4d 20             	mov    0x20(%ebp),%ecx
    35d8:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    35dc:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    35df:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    35e3:	89 54 24 10          	mov    %edx,0x10(%esp)
    35e7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    35eb:	8b 45 08             	mov    0x8(%ebp),%eax
    35ee:	89 04 24             	mov    %eax,(%esp)
    35f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    35f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    35f8:	8b 45 10             	mov    0x10(%ebp),%eax
    35fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    35ff:	e8 af fd ff ff       	call   33b3 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    3604:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3607:	8d 58 08             	lea    0x8(%eax),%ebx
    360a:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    360e:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3612:	66 c1 f8 08          	sar    $0x8,%ax
    3616:	0f b6 c0             	movzbl %al,%eax
    3619:	8b 4d 20             	mov    0x20(%ebp),%ecx
    361c:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3620:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    3624:	89 54 24 10          	mov    %edx,0x10(%esp)
    3628:	89 44 24 0c          	mov    %eax,0xc(%esp)
    362c:	8b 45 08             	mov    0x8(%ebp),%eax
    362f:	89 04 24             	mov    %eax,(%esp)
    3632:	8b 45 0c             	mov    0xc(%ebp),%eax
    3635:	89 44 24 04          	mov    %eax,0x4(%esp)
    3639:	8b 45 10             	mov    0x10(%ebp),%eax
    363c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3640:	e8 6e fd ff ff       	call   33b3 <put_ascii>
	}
}
    3645:	83 c4 34             	add    $0x34,%esp
    3648:	5b                   	pop    %ebx
    3649:	5d                   	pop    %ebp
    364a:	c3                   	ret    

0000364b <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    364b:	55                   	push   %ebp
    364c:	89 e5                	mov    %esp,%ebp
    364e:	83 ec 38             	sub    $0x38,%esp
    3651:	8b 45 18             	mov    0x18(%ebp),%eax
    3654:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    3658:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    365f:	8b 45 14             	mov    0x14(%ebp),%eax
    3662:	89 04 24             	mov    %eax,(%esp)
    3665:	e8 cf 15 00 00       	call   4c39 <strlen>
    366a:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    366d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3674:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3677:	89 45 f0             	mov    %eax,-0x10(%ebp)
    367a:	eb 49                	jmp    36c5 <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    367c:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3680:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3683:	8b 45 14             	mov    0x14(%ebp),%eax
    3686:	01 c8                	add    %ecx,%eax
    3688:	0f b6 00             	movzbl (%eax),%eax
    368b:	0f b6 c0             	movzbl %al,%eax
    368e:	8b 4d 20             	mov    0x20(%ebp),%ecx
    3691:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3695:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    3698:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    369c:	89 54 24 10          	mov    %edx,0x10(%esp)
    36a0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    36a4:	8b 45 08             	mov    0x8(%ebp),%eax
    36a7:	89 04 24             	mov    %eax,(%esp)
    36aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    36ad:	89 44 24 04          	mov    %eax,0x4(%esp)
    36b1:	8b 45 10             	mov    0x10(%ebp),%eax
    36b4:	89 44 24 08          	mov    %eax,0x8(%esp)
    36b8:	e8 f6 fc ff ff       	call   33b3 <put_ascii>
			xTmp += 8;
    36bd:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    36c1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    36c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36c8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    36cb:	72 af                	jb     367c <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    36cd:	c9                   	leave  
    36ce:	c3                   	ret    

000036cf <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    36cf:	55                   	push   %ebp
    36d0:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    36d2:	8b 45 10             	mov    0x10(%ebp),%eax
    36d5:	8d 50 07             	lea    0x7(%eax),%edx
    36d8:	85 c0                	test   %eax,%eax
    36da:	0f 48 c2             	cmovs  %edx,%eax
    36dd:	c1 f8 03             	sar    $0x3,%eax
    36e0:	89 c2                	mov    %eax,%edx
    36e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    36e5:	8d 48 03             	lea    0x3(%eax),%ecx
    36e8:	85 c0                	test   %eax,%eax
    36ea:	0f 48 c1             	cmovs  %ecx,%eax
    36ed:	c1 f8 02             	sar    $0x2,%eax
    36f0:	c1 e0 05             	shl    $0x5,%eax
    36f3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    36f6:	8b 45 08             	mov    0x8(%ebp),%eax
    36f9:	8d 50 07             	lea    0x7(%eax),%edx
    36fc:	85 c0                	test   %eax,%eax
    36fe:	0f 48 c2             	cmovs  %edx,%eax
    3701:	c1 f8 03             	sar    $0x3,%eax
    3704:	c1 e0 0b             	shl    $0xb,%eax
    3707:	01 c8                	add    %ecx,%eax
}
    3709:	5d                   	pop    %ebp
    370a:	c3                   	ret    

0000370b <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    370b:	55                   	push   %ebp
    370c:	89 e5                	mov    %esp,%ebp
    370e:	53                   	push   %ebx
    370f:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    3712:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3719:	e9 b1 00 00 00       	jmp    37cf <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    371e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3725:	e9 95 00 00 00       	jmp    37bf <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    372a:	8b 55 14             	mov    0x14(%ebp),%edx
    372d:	8b 45 18             	mov    0x18(%ebp),%eax
    3730:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    3734:	89 c1                	mov    %eax,%ecx
    3736:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3739:	01 c8                	add    %ecx,%eax
    373b:	c1 e0 02             	shl    $0x2,%eax
    373e:	01 d0                	add    %edx,%eax
    3740:	8b 00                	mov    (%eax),%eax
    3742:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    3745:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    3749:	3c 01                	cmp    $0x1,%al
    374b:	75 02                	jne    374f <draw_picture+0x44>
    374d:	eb 6c                	jmp    37bb <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    374f:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    3753:	0f b6 c8             	movzbl %al,%ecx
    3756:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    375a:	0f b6 d0             	movzbl %al,%edx
    375d:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    3761:	0f b6 c0             	movzbl %al,%eax
    3764:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3768:	89 54 24 04          	mov    %edx,0x4(%esp)
    376c:	89 04 24             	mov    %eax,(%esp)
    376f:	e8 5b ff ff ff       	call   36cf <_RGB16BIT565>
    3774:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    3778:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    377c:	8b 45 1c             	mov    0x1c(%ebp),%eax
    377f:	83 e8 01             	sub    $0x1,%eax
    3782:	2b 45 f8             	sub    -0x8(%ebp),%eax
    3785:	89 c2                	mov    %eax,%edx
    3787:	8b 45 24             	mov    0x24(%ebp),%eax
    378a:	01 d0                	add    %edx,%eax
    378c:	89 c2                	mov    %eax,%edx
    378e:	8b 45 20             	mov    0x20(%ebp),%eax
    3791:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3794:	01 d8                	add    %ebx,%eax
    3796:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    379a:	89 54 24 10          	mov    %edx,0x10(%esp)
    379e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    37a2:	8b 45 08             	mov    0x8(%ebp),%eax
    37a5:	89 04 24             	mov    %eax,(%esp)
    37a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    37ab:	89 44 24 04          	mov    %eax,0x4(%esp)
    37af:	8b 45 10             	mov    0x10(%ebp),%eax
    37b2:	89 44 24 08          	mov    %eax,0x8(%esp)
    37b6:	e8 72 f8 ff ff       	call   302d <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    37bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    37bf:	8b 45 18             	mov    0x18(%ebp),%eax
    37c2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    37c5:	0f 8f 5f ff ff ff    	jg     372a <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    37cb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    37cf:	8b 45 1c             	mov    0x1c(%ebp),%eax
    37d2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    37d5:	0f 8f 43 ff ff ff    	jg     371e <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    37db:	83 c4 28             	add    $0x28,%esp
    37de:	5b                   	pop    %ebx
    37df:	5d                   	pop    %ebp
    37e0:	c3                   	ret    

000037e1 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    37e1:	55                   	push   %ebp
    37e2:	89 e5                	mov    %esp,%ebp
    37e4:	83 ec 3c             	sub    $0x3c,%esp
    37e7:	8b 45 24             	mov    0x24(%ebp),%eax
    37ea:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    37ee:	8b 45 14             	mov    0x14(%ebp),%eax
    37f1:	8b 55 1c             	mov    0x1c(%ebp),%edx
    37f4:	29 c2                	sub    %eax,%edx
    37f6:	89 d0                	mov    %edx,%eax
    37f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    37fb:	8b 45 18             	mov    0x18(%ebp),%eax
    37fe:	8b 55 20             	mov    0x20(%ebp),%edx
    3801:	29 c2                	sub    %eax,%edx
    3803:	89 d0                	mov    %edx,%eax
    3805:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    3808:	8b 45 14             	mov    0x14(%ebp),%eax
    380b:	c1 e0 0a             	shl    $0xa,%eax
    380e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    3811:	8b 45 18             	mov    0x18(%ebp),%eax
    3814:	c1 e0 0a             	shl    $0xa,%eax
    3817:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    381a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    381d:	c1 f8 1f             	sar    $0x1f,%eax
    3820:	31 45 fc             	xor    %eax,-0x4(%ebp)
    3823:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    3826:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3829:	c1 f8 1f             	sar    $0x1f,%eax
    382c:	31 45 f8             	xor    %eax,-0x8(%ebp)
    382f:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    3832:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3835:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3838:	7c 57                	jl     3891 <draw_line+0xb0>
		len = dx + 1;
    383a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    383d:	83 c0 01             	add    $0x1,%eax
    3840:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    3843:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3846:	3b 45 14             	cmp    0x14(%ebp),%eax
    3849:	7e 07                	jle    3852 <draw_line+0x71>
    384b:	b8 00 04 00 00       	mov    $0x400,%eax
    3850:	eb 05                	jmp    3857 <draw_line+0x76>
    3852:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3857:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    385a:	8b 45 20             	mov    0x20(%ebp),%eax
    385d:	3b 45 18             	cmp    0x18(%ebp),%eax
    3860:	7c 16                	jl     3878 <draw_line+0x97>
    3862:	8b 45 18             	mov    0x18(%ebp),%eax
    3865:	8b 55 20             	mov    0x20(%ebp),%edx
    3868:	29 c2                	sub    %eax,%edx
    386a:	89 d0                	mov    %edx,%eax
    386c:	83 c0 01             	add    $0x1,%eax
    386f:	c1 e0 0a             	shl    $0xa,%eax
    3872:	99                   	cltd   
    3873:	f7 7d ec             	idivl  -0x14(%ebp)
    3876:	eb 14                	jmp    388c <draw_line+0xab>
    3878:	8b 45 18             	mov    0x18(%ebp),%eax
    387b:	8b 55 20             	mov    0x20(%ebp),%edx
    387e:	29 c2                	sub    %eax,%edx
    3880:	89 d0                	mov    %edx,%eax
    3882:	83 e8 01             	sub    $0x1,%eax
    3885:	c1 e0 0a             	shl    $0xa,%eax
    3888:	99                   	cltd   
    3889:	f7 7d ec             	idivl  -0x14(%ebp)
    388c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    388f:	eb 55                	jmp    38e6 <draw_line+0x105>
	}
	else {
		len = dy + 1;
    3891:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3894:	83 c0 01             	add    $0x1,%eax
    3897:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    389a:	8b 45 20             	mov    0x20(%ebp),%eax
    389d:	3b 45 18             	cmp    0x18(%ebp),%eax
    38a0:	7e 07                	jle    38a9 <draw_line+0xc8>
    38a2:	b8 00 04 00 00       	mov    $0x400,%eax
    38a7:	eb 05                	jmp    38ae <draw_line+0xcd>
    38a9:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    38ae:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    38b1:	8b 45 1c             	mov    0x1c(%ebp),%eax
    38b4:	3b 45 14             	cmp    0x14(%ebp),%eax
    38b7:	7c 16                	jl     38cf <draw_line+0xee>
    38b9:	8b 45 14             	mov    0x14(%ebp),%eax
    38bc:	8b 55 1c             	mov    0x1c(%ebp),%edx
    38bf:	29 c2                	sub    %eax,%edx
    38c1:	89 d0                	mov    %edx,%eax
    38c3:	83 c0 01             	add    $0x1,%eax
    38c6:	c1 e0 0a             	shl    $0xa,%eax
    38c9:	99                   	cltd   
    38ca:	f7 7d ec             	idivl  -0x14(%ebp)
    38cd:	eb 14                	jmp    38e3 <draw_line+0x102>
    38cf:	8b 45 14             	mov    0x14(%ebp),%eax
    38d2:	8b 55 1c             	mov    0x1c(%ebp),%edx
    38d5:	29 c2                	sub    %eax,%edx
    38d7:	89 d0                	mov    %edx,%eax
    38d9:	83 e8 01             	sub    $0x1,%eax
    38dc:	c1 e0 0a             	shl    $0xa,%eax
    38df:	99                   	cltd   
    38e0:	f7 7d ec             	idivl  -0x14(%ebp)
    38e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    38e6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    38ed:	eb 47                	jmp    3936 <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    38ef:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    38f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    38f6:	c1 f8 0a             	sar    $0xa,%eax
    38f9:	89 c2                	mov    %eax,%edx
    38fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38fe:	c1 f8 0a             	sar    $0xa,%eax
    3901:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3905:	89 54 24 10          	mov    %edx,0x10(%esp)
    3909:	89 44 24 0c          	mov    %eax,0xc(%esp)
    390d:	8b 45 08             	mov    0x8(%ebp),%eax
    3910:	89 04 24             	mov    %eax,(%esp)
    3913:	8b 45 0c             	mov    0xc(%ebp),%eax
    3916:	89 44 24 04          	mov    %eax,0x4(%esp)
    391a:	8b 45 10             	mov    0x10(%ebp),%eax
    391d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3921:	e8 07 f7 ff ff       	call   302d <draw_point>
		y += dy;
    3926:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3929:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    392c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    392f:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    3932:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3936:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3939:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    393c:	7c b1                	jl     38ef <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    393e:	c9                   	leave  
    393f:	c3                   	ret    

00003940 <draw_window>:

void
draw_window(Context c, char *title)
{
    3940:	55                   	push   %ebp
    3941:	89 e5                	mov    %esp,%ebp
    3943:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    3946:	8b 45 0c             	mov    0xc(%ebp),%eax
    3949:	83 e8 01             	sub    $0x1,%eax
    394c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3953:	00 
    3954:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    395b:	00 
    395c:	89 44 24 14          	mov    %eax,0x14(%esp)
    3960:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    3967:	00 
    3968:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    396f:	00 
    3970:	8b 45 08             	mov    0x8(%ebp),%eax
    3973:	89 04 24             	mov    %eax,(%esp)
    3976:	8b 45 0c             	mov    0xc(%ebp),%eax
    3979:	89 44 24 04          	mov    %eax,0x4(%esp)
    397d:	8b 45 10             	mov    0x10(%ebp),%eax
    3980:	89 44 24 08          	mov    %eax,0x8(%esp)
    3984:	e8 58 fe ff ff       	call   37e1 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    3989:	8b 45 10             	mov    0x10(%ebp),%eax
    398c:	8d 48 ff             	lea    -0x1(%eax),%ecx
    398f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3992:	8d 50 ff             	lea    -0x1(%eax),%edx
    3995:	8b 45 0c             	mov    0xc(%ebp),%eax
    3998:	83 e8 01             	sub    $0x1,%eax
    399b:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    39a2:	00 
    39a3:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    39a7:	89 54 24 14          	mov    %edx,0x14(%esp)
    39ab:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    39b2:	00 
    39b3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    39b7:	8b 45 08             	mov    0x8(%ebp),%eax
    39ba:	89 04 24             	mov    %eax,(%esp)
    39bd:	8b 45 0c             	mov    0xc(%ebp),%eax
    39c0:	89 44 24 04          	mov    %eax,0x4(%esp)
    39c4:	8b 45 10             	mov    0x10(%ebp),%eax
    39c7:	89 44 24 08          	mov    %eax,0x8(%esp)
    39cb:	e8 11 fe ff ff       	call   37e1 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    39d0:	8b 45 10             	mov    0x10(%ebp),%eax
    39d3:	8d 48 ff             	lea    -0x1(%eax),%ecx
    39d6:	8b 45 10             	mov    0x10(%ebp),%eax
    39d9:	8d 50 ff             	lea    -0x1(%eax),%edx
    39dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    39df:	83 e8 01             	sub    $0x1,%eax
    39e2:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    39e9:	00 
    39ea:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    39ee:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    39f5:	00 
    39f6:	89 54 24 10          	mov    %edx,0x10(%esp)
    39fa:	89 44 24 0c          	mov    %eax,0xc(%esp)
    39fe:	8b 45 08             	mov    0x8(%ebp),%eax
    3a01:	89 04 24             	mov    %eax,(%esp)
    3a04:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a07:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a0b:	8b 45 10             	mov    0x10(%ebp),%eax
    3a0e:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a12:	e8 ca fd ff ff       	call   37e1 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    3a17:	8b 45 10             	mov    0x10(%ebp),%eax
    3a1a:	83 e8 01             	sub    $0x1,%eax
    3a1d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3a24:	00 
    3a25:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    3a2c:	00 
    3a2d:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3a34:	00 
    3a35:	89 44 24 10          	mov    %eax,0x10(%esp)
    3a39:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3a40:	00 
    3a41:	8b 45 08             	mov    0x8(%ebp),%eax
    3a44:	89 04 24             	mov    %eax,(%esp)
    3a47:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a4a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a4e:	8b 45 10             	mov    0x10(%ebp),%eax
    3a51:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a55:	e8 87 fd ff ff       	call   37e1 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    3a5a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a5d:	83 e8 02             	sub    $0x2,%eax
    3a60:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    3a67:	00 
    3a68:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    3a6f:	00 
    3a70:	89 44 24 14          	mov    %eax,0x14(%esp)
    3a74:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    3a7b:	00 
    3a7c:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3a83:	00 
    3a84:	8b 45 08             	mov    0x8(%ebp),%eax
    3a87:	89 04 24             	mov    %eax,(%esp)
    3a8a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a8d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a91:	8b 45 10             	mov    0x10(%ebp),%eax
    3a94:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a98:	e8 cf f5 ff ff       	call   306c <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    3a9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3aa0:	83 e8 02             	sub    $0x2,%eax
    3aa3:	89 c2                	mov    %eax,%edx
    3aa5:	8b 45 10             	mov    0x10(%ebp),%eax
    3aa8:	83 e8 15             	sub    $0x15,%eax
    3aab:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    3ab2:	00 
    3ab3:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    3aba:	00 
    3abb:	89 54 24 14          	mov    %edx,0x14(%esp)
    3abf:	89 44 24 10          	mov    %eax,0x10(%esp)
    3ac3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3aca:	00 
    3acb:	8b 45 08             	mov    0x8(%ebp),%eax
    3ace:	89 04 24             	mov    %eax,(%esp)
    3ad1:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ad4:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ad8:	8b 45 10             	mov    0x10(%ebp),%eax
    3adb:	89 44 24 08          	mov    %eax,0x8(%esp)
    3adf:	e8 88 f5 ff ff       	call   306c <fill_rect>

  loadBitmap(&pic, "close.bmp");
    3ae4:	c7 44 24 04 b3 ba 00 	movl   $0xbab3,0x4(%esp)
    3aeb:	00 
    3aec:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3aef:	89 04 24             	mov    %eax,(%esp)
    3af2:	e8 44 01 00 00       	call   3c3b <loadBitmap>
  draw_picture(c, pic, 3, 3);
    3af7:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    3afe:	00 
    3aff:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    3b06:	00 
    3b07:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3b0a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3b11:	89 44 24 10          	mov    %eax,0x10(%esp)
    3b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b18:	89 44 24 14          	mov    %eax,0x14(%esp)
    3b1c:	8b 45 08             	mov    0x8(%ebp),%eax
    3b1f:	89 04 24             	mov    %eax,(%esp)
    3b22:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b25:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b29:	8b 45 10             	mov    0x10(%ebp),%eax
    3b2c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b30:	e8 d6 fb ff ff       	call   370b <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    3b35:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    3b3c:	00 
    3b3d:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    3b44:	00 
    3b45:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    3b4c:	00 
    3b4d:	8b 45 14             	mov    0x14(%ebp),%eax
    3b50:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b54:	8b 45 08             	mov    0x8(%ebp),%eax
    3b57:	89 04 24             	mov    %eax,(%esp)
    3b5a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b5d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b61:	8b 45 10             	mov    0x10(%ebp),%eax
    3b64:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b68:	e8 de fa ff ff       	call   364b <puts_str>
  freepic(&pic);
    3b6d:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3b70:	89 04 24             	mov    %eax,(%esp)
    3b73:	e8 6f 06 00 00       	call   41e7 <freepic>
}
    3b78:	c9                   	leave  
    3b79:	c3                   	ret    

00003b7a <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    3b7a:	55                   	push   %ebp
    3b7b:	89 e5                	mov    %esp,%ebp
    3b7d:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    3b80:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3b87:	eb 29                	jmp    3bb2 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    3b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b8c:	6b d0 34             	imul   $0x34,%eax,%edx
    3b8f:	8b 45 08             	mov    0x8(%ebp),%eax
    3b92:	01 d0                	add    %edx,%eax
    3b94:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3b97:	6b ca 34             	imul   $0x34,%edx,%ecx
    3b9a:	8b 55 08             	mov    0x8(%ebp),%edx
    3b9d:	01 ca                	add    %ecx,%edx
    3b9f:	83 c2 28             	add    $0x28,%edx
    3ba2:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ba6:	89 14 24             	mov    %edx,(%esp)
    3ba9:	e8 8d 00 00 00       	call   3c3b <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    3bae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3bb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bb5:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3bb8:	7c cf                	jl     3b89 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    3bba:	c9                   	leave  
    3bbb:	c3                   	ret    

00003bbc <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    3bbc:	55                   	push   %ebp
    3bbd:	89 e5                	mov    %esp,%ebp
    3bbf:	53                   	push   %ebx
    3bc0:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    3bc3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3bca:	eb 61                	jmp    3c2d <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    3bcc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3bcf:	6b d0 34             	imul   $0x34,%eax,%edx
    3bd2:	8b 45 14             	mov    0x14(%ebp),%eax
    3bd5:	01 d0                	add    %edx,%eax
    3bd7:	8b 48 24             	mov    0x24(%eax),%ecx
    3bda:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3bdd:	6b d0 34             	imul   $0x34,%eax,%edx
    3be0:	8b 45 14             	mov    0x14(%ebp),%eax
    3be3:	01 d0                	add    %edx,%eax
    3be5:	8b 50 20             	mov    0x20(%eax),%edx
    3be8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3beb:	6b d8 34             	imul   $0x34,%eax,%ebx
    3bee:	8b 45 14             	mov    0x14(%ebp),%eax
    3bf1:	01 d8                	add    %ebx,%eax
    3bf3:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    3bf7:	89 54 24 18          	mov    %edx,0x18(%esp)
    3bfb:	8b 50 28             	mov    0x28(%eax),%edx
    3bfe:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3c02:	8b 50 2c             	mov    0x2c(%eax),%edx
    3c05:	89 54 24 10          	mov    %edx,0x10(%esp)
    3c09:	8b 40 30             	mov    0x30(%eax),%eax
    3c0c:	89 44 24 14          	mov    %eax,0x14(%esp)
    3c10:	8b 45 08             	mov    0x8(%ebp),%eax
    3c13:	89 04 24             	mov    %eax,(%esp)
    3c16:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c19:	89 44 24 04          	mov    %eax,0x4(%esp)
    3c1d:	8b 45 10             	mov    0x10(%ebp),%eax
    3c20:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c24:	e8 e2 fa ff ff       	call   370b <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    3c29:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3c2d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3c30:	3b 45 18             	cmp    0x18(%ebp),%eax
    3c33:	7c 97                	jl     3bcc <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    3c35:	83 c4 30             	add    $0x30,%esp
    3c38:	5b                   	pop    %ebx
    3c39:	5d                   	pop    %ebp
    3c3a:	c3                   	ret    

00003c3b <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    3c3b:	55                   	push   %ebp
    3c3c:	89 e5                	mov    %esp,%ebp
    3c3e:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    3c44:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    3c4b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3c52:	00 
    3c53:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c56:	89 04 24             	mov    %eax,(%esp)
    3c59:	e8 ef 11 00 00       	call   4e4d <open>
    3c5e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3c61:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3c65:	79 20                	jns    3c87 <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    3c67:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c6a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c6e:	c7 44 24 04 c0 ba 00 	movl   $0xbac0,0x4(%esp)
    3c75:	00 
    3c76:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c7d:	e8 73 13 00 00       	call   4ff5 <printf>
		return;
    3c82:	e9 ef 02 00 00       	jmp    3f76 <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    3c87:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c8a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c8e:	c7 44 24 04 d0 ba 00 	movl   $0xbad0,0x4(%esp)
    3c95:	00 
    3c96:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c9d:	e8 53 13 00 00       	call   4ff5 <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    3ca2:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    3ca9:	e8 33 16 00 00       	call   52e1 <malloc>
    3cae:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    3cb1:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    3cb8:	00 
    3cb9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3cbc:	89 44 24 04          	mov    %eax,0x4(%esp)
    3cc0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3cc3:	89 04 24             	mov    %eax,(%esp)
    3cc6:	e8 5a 11 00 00       	call   4e25 <read>
    3ccb:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    3cce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3cd1:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    3cd4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3cd7:	0f b7 00             	movzwl (%eax),%eax
    3cda:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    3cde:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    3ce2:	66 3d 42 4d          	cmp    $0x4d42,%ax
    3ce6:	74 19                	je     3d01 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    3ce8:	c7 44 24 04 e4 ba 00 	movl   $0xbae4,0x4(%esp)
    3cef:	00 
    3cf0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3cf7:	e8 f9 12 00 00       	call   4ff5 <printf>
		return;
    3cfc:	e9 75 02 00 00       	jmp    3f76 <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    3d01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3d04:	83 c0 02             	add    $0x2,%eax
    3d07:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    3d0a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3d0d:	8b 00                	mov    (%eax),%eax
    3d0f:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3d12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3d15:	83 c0 06             	add    $0x6,%eax
    3d18:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    3d1b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3d1e:	0f b7 00             	movzwl (%eax),%eax
    3d21:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3d25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3d28:	83 c0 08             	add    $0x8,%eax
    3d2b:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    3d2e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3d31:	0f b7 00             	movzwl (%eax),%eax
    3d34:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3d38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3d3b:	83 c0 0a             	add    $0xa,%eax
    3d3e:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    3d41:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3d44:	8b 00                	mov    (%eax),%eax
    3d46:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    3d49:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    3d50:	00 
    3d51:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3d54:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d58:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3d5b:	89 04 24             	mov    %eax,(%esp)
    3d5e:	e8 c2 10 00 00       	call   4e25 <read>
	width = bitInfoHead.biWidth;
    3d63:	8b 45 88             	mov    -0x78(%ebp),%eax
    3d66:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    3d69:	8b 45 8c             	mov    -0x74(%ebp),%eax
    3d6c:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    3d6f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3d72:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    3d76:	c1 e0 02             	shl    $0x2,%eax
    3d79:	89 44 24 10          	mov    %eax,0x10(%esp)
    3d7d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3d80:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3d84:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3d87:	89 44 24 08          	mov    %eax,0x8(%esp)
    3d8b:	c7 44 24 04 fc ba 00 	movl   $0xbafc,0x4(%esp)
    3d92:	00 
    3d93:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d9a:	e8 56 12 00 00       	call   4ff5 <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    3d9f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3da3:	75 14                	jne    3db9 <loadBitmap+0x17e>
		printf(0, "0");
    3da5:	c7 44 24 04 21 bb 00 	movl   $0xbb21,0x4(%esp)
    3dac:	00 
    3dad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3db4:	e8 3c 12 00 00       	call   4ff5 <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    3db9:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3dbd:	0f b7 c0             	movzwl %ax,%eax
    3dc0:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    3dc4:	83 c0 1f             	add    $0x1f,%eax
    3dc7:	8d 50 1f             	lea    0x1f(%eax),%edx
    3dca:	85 c0                	test   %eax,%eax
    3dcc:	0f 48 c2             	cmovs  %edx,%eax
    3dcf:	c1 f8 05             	sar    $0x5,%eax
    3dd2:	c1 e0 02             	shl    $0x2,%eax
    3dd5:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    3dd8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3ddb:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3ddf:	89 04 24             	mov    %eax,(%esp)
    3de2:	e8 fa 14 00 00       	call   52e1 <malloc>
    3de7:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    3dea:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3ded:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3df0:	0f af c2             	imul   %edx,%eax
    3df3:	89 44 24 08          	mov    %eax,0x8(%esp)
    3df7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3dfe:	00 
    3dff:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3e02:	89 04 24             	mov    %eax,(%esp)
    3e05:	e8 56 0e 00 00       	call   4c60 <memset>
	long nData = height * l_width;
    3e0a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3e0d:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3e11:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    3e14:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3e17:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e1b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3e1e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e22:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e25:	89 04 24             	mov    %eax,(%esp)
    3e28:	e8 f8 0f 00 00       	call   4e25 <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    3e2d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3e30:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    3e34:	c1 e0 02             	shl    $0x2,%eax
    3e37:	89 04 24             	mov    %eax,(%esp)
    3e3a:	e8 a2 14 00 00       	call   52e1 <malloc>
    3e3f:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    3e42:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3e45:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3e48:	0f af c2             	imul   %edx,%eax
    3e4b:	c1 e0 02             	shl    $0x2,%eax
    3e4e:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e52:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3e59:	00 
    3e5a:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3e5d:	89 04 24             	mov    %eax,(%esp)
    3e60:	e8 fb 0d 00 00       	call   4c60 <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    3e65:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3e69:	66 83 f8 17          	cmp    $0x17,%ax
    3e6d:	77 19                	ja     3e88 <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    3e6f:	c7 44 24 04 24 bb 00 	movl   $0xbb24,0x4(%esp)
    3e76:	00 
    3e77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e7e:	e8 72 11 00 00       	call   4ff5 <printf>
		return;
    3e83:	e9 ee 00 00 00       	jmp    3f76 <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    3e88:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    3e8f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3e96:	e9 94 00 00 00       	jmp    3f2f <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    3e9b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3ea2:	eb 7b                	jmp    3f1f <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    3ea4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ea7:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3eab:	89 c1                	mov    %eax,%ecx
    3ead:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3eb0:	89 d0                	mov    %edx,%eax
    3eb2:	01 c0                	add    %eax,%eax
    3eb4:	01 d0                	add    %edx,%eax
    3eb6:	01 c8                	add    %ecx,%eax
    3eb8:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    3ebb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ebe:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3ec5:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3ec8:	01 c2                	add    %eax,%edx
    3eca:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3ecd:	8d 48 02             	lea    0x2(%eax),%ecx
    3ed0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3ed3:	01 c8                	add    %ecx,%eax
    3ed5:	0f b6 00             	movzbl (%eax),%eax
    3ed8:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    3edb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ede:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3ee5:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3ee8:	01 c2                	add    %eax,%edx
    3eea:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3eed:	8d 48 01             	lea    0x1(%eax),%ecx
    3ef0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3ef3:	01 c8                	add    %ecx,%eax
    3ef5:	0f b6 00             	movzbl (%eax),%eax
    3ef8:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    3efb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3efe:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3f05:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3f08:	01 c2                	add    %eax,%edx
    3f0a:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    3f0d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3f10:	01 c8                	add    %ecx,%eax
    3f12:	0f b6 00             	movzbl (%eax),%eax
    3f15:	88 02                	mov    %al,(%edx)
				index++;
    3f17:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    3f1b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3f1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3f22:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    3f25:	0f 8c 79 ff ff ff    	jl     3ea4 <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    3f2b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f32:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    3f35:	0f 8c 60 ff ff ff    	jl     3e9b <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    3f3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f3e:	89 04 24             	mov    %eax,(%esp)
    3f41:	e8 ef 0e 00 00       	call   4e35 <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    3f46:	8b 45 08             	mov    0x8(%ebp),%eax
    3f49:	8b 55 c0             	mov    -0x40(%ebp),%edx
    3f4c:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    3f4e:	8b 45 08             	mov    0x8(%ebp),%eax
    3f51:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3f54:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    3f57:	8b 45 08             	mov    0x8(%ebp),%eax
    3f5a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3f5d:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    3f60:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3f63:	89 04 24             	mov    %eax,(%esp)
    3f66:	e8 3d 12 00 00       	call   51a8 <free>
	free(BmpFileHeader);
    3f6b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f6e:	89 04 24             	mov    %eax,(%esp)
    3f71:	e8 32 12 00 00       	call   51a8 <free>
	//printf("\n");
}
    3f76:	c9                   	leave  
    3f77:	c3                   	ret    

00003f78 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    3f78:	55                   	push   %ebp
    3f79:	89 e5                	mov    %esp,%ebp
    3f7b:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    3f7e:	c7 44 24 04 44 bb 00 	movl   $0xbb44,0x4(%esp)
    3f85:	00 
    3f86:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f8d:	e8 63 10 00 00       	call   4ff5 <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    3f92:	8b 45 08             	mov    0x8(%ebp),%eax
    3f95:	0f b7 00             	movzwl (%eax),%eax
    3f98:	0f b7 c0             	movzwl %ax,%eax
    3f9b:	89 44 24 08          	mov    %eax,0x8(%esp)
    3f9f:	c7 44 24 04 56 bb 00 	movl   $0xbb56,0x4(%esp)
    3fa6:	00 
    3fa7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3fae:	e8 42 10 00 00       	call   4ff5 <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    3fb3:	8b 45 08             	mov    0x8(%ebp),%eax
    3fb6:	8b 40 04             	mov    0x4(%eax),%eax
    3fb9:	89 44 24 08          	mov    %eax,0x8(%esp)
    3fbd:	c7 44 24 04 74 bb 00 	movl   $0xbb74,0x4(%esp)
    3fc4:	00 
    3fc5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3fcc:	e8 24 10 00 00       	call   4ff5 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    3fd1:	8b 45 08             	mov    0x8(%ebp),%eax
    3fd4:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    3fd8:	0f b7 c0             	movzwl %ax,%eax
    3fdb:	89 44 24 08          	mov    %eax,0x8(%esp)
    3fdf:	c7 44 24 04 85 bb 00 	movl   $0xbb85,0x4(%esp)
    3fe6:	00 
    3fe7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3fee:	e8 02 10 00 00       	call   4ff5 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    3ff3:	8b 45 08             	mov    0x8(%ebp),%eax
    3ff6:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    3ffa:	0f b7 c0             	movzwl %ax,%eax
    3ffd:	89 44 24 08          	mov    %eax,0x8(%esp)
    4001:	c7 44 24 04 85 bb 00 	movl   $0xbb85,0x4(%esp)
    4008:	00 
    4009:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4010:	e8 e0 0f 00 00       	call   4ff5 <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    4015:	8b 45 08             	mov    0x8(%ebp),%eax
    4018:	8b 40 0c             	mov    0xc(%eax),%eax
    401b:	89 44 24 08          	mov    %eax,0x8(%esp)
    401f:	c7 44 24 04 94 bb 00 	movl   $0xbb94,0x4(%esp)
    4026:	00 
    4027:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    402e:	e8 c2 0f 00 00       	call   4ff5 <printf>
}
    4033:	c9                   	leave  
    4034:	c3                   	ret    

00004035 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    4035:	55                   	push   %ebp
    4036:	89 e5                	mov    %esp,%ebp
    4038:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    403b:	c7 44 24 04 bd bb 00 	movl   $0xbbbd,0x4(%esp)
    4042:	00 
    4043:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    404a:	e8 a6 0f 00 00       	call   4ff5 <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    404f:	8b 45 08             	mov    0x8(%ebp),%eax
    4052:	8b 00                	mov    (%eax),%eax
    4054:	89 44 24 08          	mov    %eax,0x8(%esp)
    4058:	c7 44 24 04 cf bb 00 	movl   $0xbbcf,0x4(%esp)
    405f:	00 
    4060:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4067:	e8 89 0f 00 00       	call   4ff5 <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    406c:	8b 45 08             	mov    0x8(%ebp),%eax
    406f:	8b 40 04             	mov    0x4(%eax),%eax
    4072:	89 44 24 08          	mov    %eax,0x8(%esp)
    4076:	c7 44 24 04 e6 bb 00 	movl   $0xbbe6,0x4(%esp)
    407d:	00 
    407e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4085:	e8 6b 0f 00 00       	call   4ff5 <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    408a:	8b 45 08             	mov    0x8(%ebp),%eax
    408d:	8b 40 08             	mov    0x8(%eax),%eax
    4090:	89 44 24 08          	mov    %eax,0x8(%esp)
    4094:	c7 44 24 04 f4 bb 00 	movl   $0xbbf4,0x4(%esp)
    409b:	00 
    409c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    40a3:	e8 4d 0f 00 00       	call   4ff5 <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    40a8:	8b 45 08             	mov    0x8(%ebp),%eax
    40ab:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    40af:	0f b7 c0             	movzwl %ax,%eax
    40b2:	89 44 24 08          	mov    %eax,0x8(%esp)
    40b6:	c7 44 24 04 02 bc 00 	movl   $0xbc02,0x4(%esp)
    40bd:	00 
    40be:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    40c5:	e8 2b 0f 00 00       	call   4ff5 <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    40ca:	8b 45 08             	mov    0x8(%ebp),%eax
    40cd:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    40d1:	0f b7 c0             	movzwl %ax,%eax
    40d4:	89 44 24 08          	mov    %eax,0x8(%esp)
    40d8:	c7 44 24 04 18 bc 00 	movl   $0xbc18,0x4(%esp)
    40df:	00 
    40e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    40e7:	e8 09 0f 00 00       	call   4ff5 <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    40ec:	8b 45 08             	mov    0x8(%ebp),%eax
    40ef:	8b 40 10             	mov    0x10(%eax),%eax
    40f2:	89 44 24 08          	mov    %eax,0x8(%esp)
    40f6:	c7 44 24 04 39 bc 00 	movl   $0xbc39,0x4(%esp)
    40fd:	00 
    40fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4105:	e8 eb 0e 00 00       	call   4ff5 <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    410a:	8b 45 08             	mov    0x8(%ebp),%eax
    410d:	8b 40 14             	mov    0x14(%eax),%eax
    4110:	89 44 24 08          	mov    %eax,0x8(%esp)
    4114:	c7 44 24 04 4c bc 00 	movl   $0xbc4c,0x4(%esp)
    411b:	00 
    411c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4123:	e8 cd 0e 00 00       	call   4ff5 <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    4128:	8b 45 08             	mov    0x8(%ebp),%eax
    412b:	8b 40 18             	mov    0x18(%eax),%eax
    412e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4132:	c7 44 24 04 80 bc 00 	movl   $0xbc80,0x4(%esp)
    4139:	00 
    413a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4141:	e8 af 0e 00 00       	call   4ff5 <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    4146:	8b 45 08             	mov    0x8(%ebp),%eax
    4149:	8b 40 1c             	mov    0x1c(%eax),%eax
    414c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4150:	c7 44 24 04 95 bc 00 	movl   $0xbc95,0x4(%esp)
    4157:	00 
    4158:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    415f:	e8 91 0e 00 00       	call   4ff5 <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    4164:	8b 45 08             	mov    0x8(%ebp),%eax
    4167:	8b 40 20             	mov    0x20(%eax),%eax
    416a:	89 44 24 08          	mov    %eax,0x8(%esp)
    416e:	c7 44 24 04 aa bc 00 	movl   $0xbcaa,0x4(%esp)
    4175:	00 
    4176:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    417d:	e8 73 0e 00 00       	call   4ff5 <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    4182:	8b 45 08             	mov    0x8(%ebp),%eax
    4185:	8b 40 24             	mov    0x24(%eax),%eax
    4188:	89 44 24 08          	mov    %eax,0x8(%esp)
    418c:	c7 44 24 04 c1 bc 00 	movl   $0xbcc1,0x4(%esp)
    4193:	00 
    4194:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    419b:	e8 55 0e 00 00       	call   4ff5 <printf>
}
    41a0:	c9                   	leave  
    41a1:	c3                   	ret    

000041a2 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    41a2:	55                   	push   %ebp
    41a3:	89 e5                	mov    %esp,%ebp
    41a5:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    41a8:	8b 45 08             	mov    0x8(%ebp),%eax
    41ab:	0f b6 00             	movzbl (%eax),%eax
    41ae:	0f b6 c8             	movzbl %al,%ecx
    41b1:	8b 45 08             	mov    0x8(%ebp),%eax
    41b4:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    41b8:	0f b6 d0             	movzbl %al,%edx
    41bb:	8b 45 08             	mov    0x8(%ebp),%eax
    41be:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    41c2:	0f b6 c0             	movzbl %al,%eax
    41c5:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    41c9:	89 54 24 0c          	mov    %edx,0xc(%esp)
    41cd:	89 44 24 08          	mov    %eax,0x8(%esp)
    41d1:	c7 44 24 04 d5 bc 00 	movl   $0xbcd5,0x4(%esp)
    41d8:	00 
    41d9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41e0:	e8 10 0e 00 00       	call   4ff5 <printf>
}
    41e5:	c9                   	leave  
    41e6:	c3                   	ret    

000041e7 <freepic>:

void freepic(PICNODE *pic) {
    41e7:	55                   	push   %ebp
    41e8:	89 e5                	mov    %esp,%ebp
    41ea:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    41ed:	8b 45 08             	mov    0x8(%ebp),%eax
    41f0:	8b 00                	mov    (%eax),%eax
    41f2:	89 04 24             	mov    %eax,(%esp)
    41f5:	e8 ae 0f 00 00       	call   51a8 <free>
}
    41fa:	c9                   	leave  
    41fb:	c3                   	ret    

000041fc <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    41fc:	55                   	push   %ebp
    41fd:	89 e5                	mov    %esp,%ebp
    41ff:	53                   	push   %ebx
    4200:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    4206:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    420d:	8d 45 dc             	lea    -0x24(%ebp),%eax
    4210:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4213:	89 54 24 10          	mov    %edx,0x10(%esp)
    4217:	8b 55 ec             	mov    -0x14(%ebp),%edx
    421a:	89 54 24 0c          	mov    %edx,0xc(%esp)
    421e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    4225:	00 
    4226:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    422d:	00 
    422e:	89 04 24             	mov    %eax,(%esp)
    4231:	e8 80 02 00 00       	call   44b6 <initRect>
    4236:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    4239:	8b 45 08             	mov    0x8(%ebp),%eax
    423c:	8b 40 04             	mov    0x4(%eax),%eax
    423f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4242:	89 c2                	mov    %eax,%edx
    4244:	8d 45 cc             	lea    -0x34(%ebp),%eax
    4247:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    424a:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    424e:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4251:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4255:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    425c:	00 
    425d:	89 54 24 04          	mov    %edx,0x4(%esp)
    4261:	89 04 24             	mov    %eax,(%esp)
    4264:	e8 4d 02 00 00       	call   44b6 <initRect>
    4269:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    426c:	8b 45 08             	mov    0x8(%ebp),%eax
    426f:	8b 40 08             	mov    0x8(%eax),%eax
    4272:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4275:	89 c1                	mov    %eax,%ecx
    4277:	8b 45 08             	mov    0x8(%ebp),%eax
    427a:	8b 40 04             	mov    0x4(%eax),%eax
    427d:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4280:	89 c2                	mov    %eax,%edx
    4282:	8d 45 bc             	lea    -0x44(%ebp),%eax
    4285:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    4288:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    428c:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    428f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    4293:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4297:	89 54 24 04          	mov    %edx,0x4(%esp)
    429b:	89 04 24             	mov    %eax,(%esp)
    429e:	e8 13 02 00 00       	call   44b6 <initRect>
    42a3:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    42a6:	8b 45 08             	mov    0x8(%ebp),%eax
    42a9:	8b 40 08             	mov    0x8(%eax),%eax
    42ac:	2b 45 ec             	sub    -0x14(%ebp),%eax
    42af:	89 c2                	mov    %eax,%edx
    42b1:	8d 45 ac             	lea    -0x54(%ebp),%eax
    42b4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    42b7:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    42bb:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    42be:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    42c2:	89 54 24 08          	mov    %edx,0x8(%esp)
    42c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    42cd:	00 
    42ce:	89 04 24             	mov    %eax,(%esp)
    42d1:	e8 e0 01 00 00       	call   44b6 <initRect>
    42d6:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    42d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    42e0:	e9 96 01 00 00       	jmp    447b <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    42e5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    42ec:	e9 77 01 00 00       	jmp    4468 <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    42f1:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    42f4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    42f7:	89 54 24 08          	mov    %edx,0x8(%esp)
    42fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    42fe:	89 54 24 04          	mov    %edx,0x4(%esp)
    4302:	89 04 24             	mov    %eax,(%esp)
    4305:	e8 85 01 00 00       	call   448f <initPoint>
    430a:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    430d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4310:	89 44 24 08          	mov    %eax,0x8(%esp)
    4314:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4317:	89 44 24 0c          	mov    %eax,0xc(%esp)
    431b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    431e:	89 44 24 10          	mov    %eax,0x10(%esp)
    4322:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4325:	89 44 24 14          	mov    %eax,0x14(%esp)
    4329:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    432c:	8b 55 a8             	mov    -0x58(%ebp),%edx
    432f:	89 04 24             	mov    %eax,(%esp)
    4332:	89 54 24 04          	mov    %edx,0x4(%esp)
    4336:	e8 d6 01 00 00       	call   4511 <isIn>
    433b:	85 c0                	test   %eax,%eax
    433d:	0f 85 9a 00 00 00    	jne    43dd <set_icon_alpha+0x1e1>
    4343:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4346:	89 44 24 08          	mov    %eax,0x8(%esp)
    434a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    434d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4351:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4354:	89 44 24 10          	mov    %eax,0x10(%esp)
    4358:	8b 45 d8             	mov    -0x28(%ebp),%eax
    435b:	89 44 24 14          	mov    %eax,0x14(%esp)
    435f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4362:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4365:	89 04 24             	mov    %eax,(%esp)
    4368:	89 54 24 04          	mov    %edx,0x4(%esp)
    436c:	e8 a0 01 00 00       	call   4511 <isIn>
    4371:	85 c0                	test   %eax,%eax
    4373:	75 68                	jne    43dd <set_icon_alpha+0x1e1>
    4375:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4378:	89 44 24 08          	mov    %eax,0x8(%esp)
    437c:	8b 45 c0             	mov    -0x40(%ebp),%eax
    437f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4383:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4386:	89 44 24 10          	mov    %eax,0x10(%esp)
    438a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    438d:	89 44 24 14          	mov    %eax,0x14(%esp)
    4391:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4394:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4397:	89 04 24             	mov    %eax,(%esp)
    439a:	89 54 24 04          	mov    %edx,0x4(%esp)
    439e:	e8 6e 01 00 00       	call   4511 <isIn>
    43a3:	85 c0                	test   %eax,%eax
    43a5:	75 36                	jne    43dd <set_icon_alpha+0x1e1>
    43a7:	8b 45 ac             	mov    -0x54(%ebp),%eax
    43aa:	89 44 24 08          	mov    %eax,0x8(%esp)
    43ae:	8b 45 b0             	mov    -0x50(%ebp),%eax
    43b1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    43b5:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    43b8:	89 44 24 10          	mov    %eax,0x10(%esp)
    43bc:	8b 45 b8             	mov    -0x48(%ebp),%eax
    43bf:	89 44 24 14          	mov    %eax,0x14(%esp)
    43c3:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    43c6:	8b 55 a8             	mov    -0x58(%ebp),%edx
    43c9:	89 04 24             	mov    %eax,(%esp)
    43cc:	89 54 24 04          	mov    %edx,0x4(%esp)
    43d0:	e8 3c 01 00 00       	call   4511 <isIn>
    43d5:	85 c0                	test   %eax,%eax
    43d7:	0f 84 87 00 00 00    	je     4464 <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    43dd:	8b 45 08             	mov    0x8(%ebp),%eax
    43e0:	8b 10                	mov    (%eax),%edx
    43e2:	8b 45 08             	mov    0x8(%ebp),%eax
    43e5:	8b 40 04             	mov    0x4(%eax),%eax
    43e8:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    43ec:	89 c1                	mov    %eax,%ecx
    43ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43f1:	01 c8                	add    %ecx,%eax
    43f3:	c1 e0 02             	shl    $0x2,%eax
    43f6:	01 d0                	add    %edx,%eax
    43f8:	0f b6 00             	movzbl (%eax),%eax
    43fb:	3c ff                	cmp    $0xff,%al
    43fd:	75 65                	jne    4464 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    43ff:	8b 45 08             	mov    0x8(%ebp),%eax
    4402:	8b 10                	mov    (%eax),%edx
    4404:	8b 45 08             	mov    0x8(%ebp),%eax
    4407:	8b 40 04             	mov    0x4(%eax),%eax
    440a:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    440e:	89 c1                	mov    %eax,%ecx
    4410:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4413:	01 c8                	add    %ecx,%eax
    4415:	c1 e0 02             	shl    $0x2,%eax
    4418:	01 d0                	add    %edx,%eax
    441a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    441e:	3c ff                	cmp    $0xff,%al
    4420:	75 42                	jne    4464 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    4422:	8b 45 08             	mov    0x8(%ebp),%eax
    4425:	8b 10                	mov    (%eax),%edx
    4427:	8b 45 08             	mov    0x8(%ebp),%eax
    442a:	8b 40 04             	mov    0x4(%eax),%eax
    442d:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4431:	89 c1                	mov    %eax,%ecx
    4433:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4436:	01 c8                	add    %ecx,%eax
    4438:	c1 e0 02             	shl    $0x2,%eax
    443b:	01 d0                	add    %edx,%eax
    443d:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    4441:	3c ff                	cmp    $0xff,%al
    4443:	75 1f                	jne    4464 <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    4445:	8b 45 08             	mov    0x8(%ebp),%eax
    4448:	8b 10                	mov    (%eax),%edx
    444a:	8b 45 08             	mov    0x8(%ebp),%eax
    444d:	8b 40 04             	mov    0x4(%eax),%eax
    4450:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4454:	89 c1                	mov    %eax,%ecx
    4456:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4459:	01 c8                	add    %ecx,%eax
    445b:	c1 e0 02             	shl    $0x2,%eax
    445e:	01 d0                	add    %edx,%eax
    4460:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    4464:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4468:	8b 45 08             	mov    0x8(%ebp),%eax
    446b:	8b 40 08             	mov    0x8(%eax),%eax
    446e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4471:	0f 8f 7a fe ff ff    	jg     42f1 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    4477:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    447b:	8b 45 08             	mov    0x8(%ebp),%eax
    447e:	8b 40 04             	mov    0x4(%eax),%eax
    4481:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4484:	0f 8f 5b fe ff ff    	jg     42e5 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    448a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    448d:	c9                   	leave  
    448e:	c3                   	ret    

0000448f <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    448f:	55                   	push   %ebp
    4490:	89 e5                	mov    %esp,%ebp
    4492:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    4495:	8b 45 0c             	mov    0xc(%ebp),%eax
    4498:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    449b:	8b 45 10             	mov    0x10(%ebp),%eax
    449e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    44a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    44a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44a7:	8b 55 fc             	mov    -0x4(%ebp),%edx
    44aa:	89 01                	mov    %eax,(%ecx)
    44ac:	89 51 04             	mov    %edx,0x4(%ecx)
}
    44af:	8b 45 08             	mov    0x8(%ebp),%eax
    44b2:	c9                   	leave  
    44b3:	c2 04 00             	ret    $0x4

000044b6 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    44b6:	55                   	push   %ebp
    44b7:	89 e5                	mov    %esp,%ebp
    44b9:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    44bc:	8d 45 e8             	lea    -0x18(%ebp),%eax
    44bf:	8b 55 10             	mov    0x10(%ebp),%edx
    44c2:	89 54 24 08          	mov    %edx,0x8(%esp)
    44c6:	8b 55 0c             	mov    0xc(%ebp),%edx
    44c9:	89 54 24 04          	mov    %edx,0x4(%esp)
    44cd:	89 04 24             	mov    %eax,(%esp)
    44d0:	e8 ba ff ff ff       	call   448f <initPoint>
    44d5:	83 ec 04             	sub    $0x4,%esp
    44d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    44db:	8b 55 ec             	mov    -0x14(%ebp),%edx
    44de:	89 45 f0             	mov    %eax,-0x10(%ebp)
    44e1:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    44e4:	8b 45 14             	mov    0x14(%ebp),%eax
    44e7:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    44ea:	8b 45 18             	mov    0x18(%ebp),%eax
    44ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    44f0:	8b 45 08             	mov    0x8(%ebp),%eax
    44f3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    44f6:	89 10                	mov    %edx,(%eax)
    44f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    44fb:	89 50 04             	mov    %edx,0x4(%eax)
    44fe:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4501:	89 50 08             	mov    %edx,0x8(%eax)
    4504:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4507:	89 50 0c             	mov    %edx,0xc(%eax)
}
    450a:	8b 45 08             	mov    0x8(%ebp),%eax
    450d:	c9                   	leave  
    450e:	c2 04 00             	ret    $0x4

00004511 <isIn>:

int isIn(Point p, Rect r)
{
    4511:	55                   	push   %ebp
    4512:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    4514:	8b 55 08             	mov    0x8(%ebp),%edx
    4517:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    451a:	39 c2                	cmp    %eax,%edx
    451c:	7c 2f                	jl     454d <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    451e:	8b 45 08             	mov    0x8(%ebp),%eax
    4521:	8b 4d 10             	mov    0x10(%ebp),%ecx
    4524:	8b 55 18             	mov    0x18(%ebp),%edx
    4527:	01 ca                	add    %ecx,%edx
    4529:	39 d0                	cmp    %edx,%eax
    452b:	7d 20                	jge    454d <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    452d:	8b 55 0c             	mov    0xc(%ebp),%edx
    4530:	8b 45 14             	mov    0x14(%ebp),%eax
    4533:	39 c2                	cmp    %eax,%edx
    4535:	7c 16                	jl     454d <isIn+0x3c>
    4537:	8b 45 0c             	mov    0xc(%ebp),%eax
    453a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    453d:	8b 55 1c             	mov    0x1c(%ebp),%edx
    4540:	01 ca                	add    %ecx,%edx
    4542:	39 d0                	cmp    %edx,%eax
    4544:	7d 07                	jge    454d <isIn+0x3c>
    4546:	b8 01 00 00 00       	mov    $0x1,%eax
    454b:	eb 05                	jmp    4552 <isIn+0x41>
    454d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4552:	5d                   	pop    %ebp
    4553:	c3                   	ret    

00004554 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    4554:	55                   	push   %ebp
    4555:	89 e5                	mov    %esp,%ebp
    4557:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    455a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    4561:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    4568:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    456f:	8b 45 10             	mov    0x10(%ebp),%eax
    4572:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    4575:	8b 45 14             	mov    0x14(%ebp),%eax
    4578:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    457b:	8b 45 08             	mov    0x8(%ebp),%eax
    457e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4581:	89 10                	mov    %edx,(%eax)
    4583:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4586:	89 50 04             	mov    %edx,0x4(%eax)
    4589:	8b 55 f4             	mov    -0xc(%ebp),%edx
    458c:	89 50 08             	mov    %edx,0x8(%eax)
    458f:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4592:	89 50 0c             	mov    %edx,0xc(%eax)
    4595:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4598:	89 50 10             	mov    %edx,0x10(%eax)
}
    459b:	8b 45 08             	mov    0x8(%ebp),%eax
    459e:	c9                   	leave  
    459f:	c2 04 00             	ret    $0x4

000045a2 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    45a2:	55                   	push   %ebp
    45a3:	89 e5                	mov    %esp,%ebp
    45a5:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    45a8:	8b 45 1c             	mov    0x1c(%ebp),%eax
    45ab:	83 f8 03             	cmp    $0x3,%eax
    45ae:	74 72                	je     4622 <createClickable+0x80>
    45b0:	83 f8 04             	cmp    $0x4,%eax
    45b3:	74 0a                	je     45bf <createClickable+0x1d>
    45b5:	83 f8 02             	cmp    $0x2,%eax
    45b8:	74 38                	je     45f2 <createClickable+0x50>
    45ba:	e9 96 00 00 00       	jmp    4655 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    45bf:	8b 45 08             	mov    0x8(%ebp),%eax
    45c2:	8d 50 04             	lea    0x4(%eax),%edx
    45c5:	8b 45 20             	mov    0x20(%ebp),%eax
    45c8:	89 44 24 14          	mov    %eax,0x14(%esp)
    45cc:	8b 45 0c             	mov    0xc(%ebp),%eax
    45cf:	89 44 24 04          	mov    %eax,0x4(%esp)
    45d3:	8b 45 10             	mov    0x10(%ebp),%eax
    45d6:	89 44 24 08          	mov    %eax,0x8(%esp)
    45da:	8b 45 14             	mov    0x14(%ebp),%eax
    45dd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    45e1:	8b 45 18             	mov    0x18(%ebp),%eax
    45e4:	89 44 24 10          	mov    %eax,0x10(%esp)
    45e8:	89 14 24             	mov    %edx,(%esp)
    45eb:	e8 7c 00 00 00       	call   466c <addClickable>
	        break;
    45f0:	eb 78                	jmp    466a <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    45f2:	8b 45 08             	mov    0x8(%ebp),%eax
    45f5:	8b 55 20             	mov    0x20(%ebp),%edx
    45f8:	89 54 24 14          	mov    %edx,0x14(%esp)
    45fc:	8b 55 0c             	mov    0xc(%ebp),%edx
    45ff:	89 54 24 04          	mov    %edx,0x4(%esp)
    4603:	8b 55 10             	mov    0x10(%ebp),%edx
    4606:	89 54 24 08          	mov    %edx,0x8(%esp)
    460a:	8b 55 14             	mov    0x14(%ebp),%edx
    460d:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4611:	8b 55 18             	mov    0x18(%ebp),%edx
    4614:	89 54 24 10          	mov    %edx,0x10(%esp)
    4618:	89 04 24             	mov    %eax,(%esp)
    461b:	e8 4c 00 00 00       	call   466c <addClickable>
	    	break;
    4620:	eb 48                	jmp    466a <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    4622:	8b 45 08             	mov    0x8(%ebp),%eax
    4625:	8d 50 08             	lea    0x8(%eax),%edx
    4628:	8b 45 20             	mov    0x20(%ebp),%eax
    462b:	89 44 24 14          	mov    %eax,0x14(%esp)
    462f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4632:	89 44 24 04          	mov    %eax,0x4(%esp)
    4636:	8b 45 10             	mov    0x10(%ebp),%eax
    4639:	89 44 24 08          	mov    %eax,0x8(%esp)
    463d:	8b 45 14             	mov    0x14(%ebp),%eax
    4640:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4644:	8b 45 18             	mov    0x18(%ebp),%eax
    4647:	89 44 24 10          	mov    %eax,0x10(%esp)
    464b:	89 14 24             	mov    %edx,(%esp)
    464e:	e8 19 00 00 00       	call   466c <addClickable>
	    	break;
    4653:	eb 15                	jmp    466a <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    4655:	c7 44 24 04 e4 bc 00 	movl   $0xbce4,0x4(%esp)
    465c:	00 
    465d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4664:	e8 8c 09 00 00       	call   4ff5 <printf>
	    	break;
    4669:	90                   	nop
	}
}
    466a:	c9                   	leave  
    466b:	c3                   	ret    

0000466c <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    466c:	55                   	push   %ebp
    466d:	89 e5                	mov    %esp,%ebp
    466f:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    4672:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    4679:	e8 63 0c 00 00       	call   52e1 <malloc>
    467e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    4681:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4684:	8b 55 0c             	mov    0xc(%ebp),%edx
    4687:	89 10                	mov    %edx,(%eax)
    4689:	8b 55 10             	mov    0x10(%ebp),%edx
    468c:	89 50 04             	mov    %edx,0x4(%eax)
    468f:	8b 55 14             	mov    0x14(%ebp),%edx
    4692:	89 50 08             	mov    %edx,0x8(%eax)
    4695:	8b 55 18             	mov    0x18(%ebp),%edx
    4698:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    469b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    469e:	8b 55 1c             	mov    0x1c(%ebp),%edx
    46a1:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    46a4:	8b 45 08             	mov    0x8(%ebp),%eax
    46a7:	8b 10                	mov    (%eax),%edx
    46a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46ac:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    46af:	8b 45 08             	mov    0x8(%ebp),%eax
    46b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    46b5:	89 10                	mov    %edx,(%eax)
}
    46b7:	c9                   	leave  
    46b8:	c3                   	ret    

000046b9 <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    46b9:	55                   	push   %ebp
    46ba:	89 e5                	mov    %esp,%ebp
    46bc:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    46bf:	8b 45 08             	mov    0x8(%ebp),%eax
    46c2:	8b 00                	mov    (%eax),%eax
    46c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    46c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    46cd:	e9 bb 00 00 00       	jmp    478d <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    46d2:	8b 45 0c             	mov    0xc(%ebp),%eax
    46d5:	89 44 24 08          	mov    %eax,0x8(%esp)
    46d9:	8b 45 10             	mov    0x10(%ebp),%eax
    46dc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    46e0:	8b 45 14             	mov    0x14(%ebp),%eax
    46e3:	89 44 24 10          	mov    %eax,0x10(%esp)
    46e7:	8b 45 18             	mov    0x18(%ebp),%eax
    46ea:	89 44 24 14          	mov    %eax,0x14(%esp)
    46ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46f1:	8b 50 04             	mov    0x4(%eax),%edx
    46f4:	8b 00                	mov    (%eax),%eax
    46f6:	89 04 24             	mov    %eax,(%esp)
    46f9:	89 54 24 04          	mov    %edx,0x4(%esp)
    46fd:	e8 0f fe ff ff       	call   4511 <isIn>
    4702:	85 c0                	test   %eax,%eax
    4704:	74 60                	je     4766 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    4706:	8b 45 08             	mov    0x8(%ebp),%eax
    4709:	8b 00                	mov    (%eax),%eax
    470b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    470e:	75 2e                	jne    473e <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    4710:	8b 45 08             	mov    0x8(%ebp),%eax
    4713:	8b 00                	mov    (%eax),%eax
    4715:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    4718:	8b 45 f0             	mov    -0x10(%ebp),%eax
    471b:	8b 50 14             	mov    0x14(%eax),%edx
    471e:	8b 45 08             	mov    0x8(%ebp),%eax
    4721:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    4723:	8b 45 08             	mov    0x8(%ebp),%eax
    4726:	8b 00                	mov    (%eax),%eax
    4728:	89 45 f4             	mov    %eax,-0xc(%ebp)
    472b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    472e:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    4731:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4734:	89 04 24             	mov    %eax,(%esp)
    4737:	e8 6c 0a 00 00       	call   51a8 <free>
    473c:	eb 4f                	jmp    478d <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    473e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4741:	8b 50 14             	mov    0x14(%eax),%edx
    4744:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4747:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    474a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    474d:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    4750:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4753:	8b 40 14             	mov    0x14(%eax),%eax
    4756:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    4759:	8b 45 ec             	mov    -0x14(%ebp),%eax
    475c:	89 04 24             	mov    %eax,(%esp)
    475f:	e8 44 0a 00 00       	call   51a8 <free>
    4764:	eb 27                	jmp    478d <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    4766:	8b 45 08             	mov    0x8(%ebp),%eax
    4769:	8b 00                	mov    (%eax),%eax
    476b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    476e:	75 0b                	jne    477b <deleteClickable+0xc2>
			{
				cur = cur->next;
    4770:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4773:	8b 40 14             	mov    0x14(%eax),%eax
    4776:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4779:	eb 12                	jmp    478d <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    477b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    477e:	8b 40 14             	mov    0x14(%eax),%eax
    4781:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    4784:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4787:	8b 40 14             	mov    0x14(%eax),%eax
    478a:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    478d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4791:	0f 85 3b ff ff ff    	jne    46d2 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    4797:	c9                   	leave  
    4798:	c3                   	ret    

00004799 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    4799:	55                   	push   %ebp
    479a:	89 e5                	mov    %esp,%ebp
    479c:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    479f:	8b 45 08             	mov    0x8(%ebp),%eax
    47a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    47a5:	eb 6d                	jmp    4814 <executeHandler+0x7b>
	{
		if (isIn(click, cur->area))
    47a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    47aa:	8b 10                	mov    (%eax),%edx
    47ac:	89 54 24 08          	mov    %edx,0x8(%esp)
    47b0:	8b 50 04             	mov    0x4(%eax),%edx
    47b3:	89 54 24 0c          	mov    %edx,0xc(%esp)
    47b7:	8b 50 08             	mov    0x8(%eax),%edx
    47ba:	89 54 24 10          	mov    %edx,0x10(%esp)
    47be:	8b 40 0c             	mov    0xc(%eax),%eax
    47c1:	89 44 24 14          	mov    %eax,0x14(%esp)
    47c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    47c8:	8b 55 10             	mov    0x10(%ebp),%edx
    47cb:	89 04 24             	mov    %eax,(%esp)
    47ce:	89 54 24 04          	mov    %edx,0x4(%esp)
    47d2:	e8 3a fd ff ff       	call   4511 <isIn>
    47d7:	85 c0                	test   %eax,%eax
    47d9:	74 30                	je     480b <executeHandler+0x72>
		{
			renaming = 0;
    47db:	c7 05 14 3b 01 00 00 	movl   $0x0,0x13b14
    47e2:	00 00 00 
			isSearching = 0;
    47e5:	c7 05 a0 30 01 00 00 	movl   $0x0,0x130a0
    47ec:	00 00 00 
			cur->handler(click);
    47ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    47f2:	8b 48 10             	mov    0x10(%eax),%ecx
    47f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    47f8:	8b 55 10             	mov    0x10(%ebp),%edx
    47fb:	89 04 24             	mov    %eax,(%esp)
    47fe:	89 54 24 04          	mov    %edx,0x4(%esp)
    4802:	ff d1                	call   *%ecx
			return 1;
    4804:	b8 01 00 00 00       	mov    $0x1,%eax
    4809:	eb 4d                	jmp    4858 <executeHandler+0xbf>
		}
		cur = cur->next;
    480b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    480e:	8b 40 14             	mov    0x14(%eax),%eax
    4811:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    4814:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4818:	75 8d                	jne    47a7 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    481a:	c7 05 a0 30 01 00 00 	movl   $0x0,0x130a0
    4821:	00 00 00 
	if (renaming == 1){
    4824:	a1 14 3b 01 00       	mov    0x13b14,%eax
    4829:	83 f8 01             	cmp    $0x1,%eax
    482c:	75 11                	jne    483f <executeHandler+0xa6>
		renaming = 0;
    482e:	c7 05 14 3b 01 00 00 	movl   $0x0,0x13b14
    4835:	00 00 00 
		return 1;
    4838:	b8 01 00 00 00       	mov    $0x1,%eax
    483d:	eb 19                	jmp    4858 <executeHandler+0xbf>
	}
	printf(0, "execute: none!\n");
    483f:	c7 44 24 04 12 bd 00 	movl   $0xbd12,0x4(%esp)
    4846:	00 
    4847:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    484e:	e8 a2 07 00 00       	call   4ff5 <printf>
	return 0;
    4853:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4858:	c9                   	leave  
    4859:	c3                   	ret    

0000485a <printClickable>:

void printClickable(Clickable *c)
{
    485a:	55                   	push   %ebp
    485b:	89 e5                	mov    %esp,%ebp
    485d:	53                   	push   %ebx
    485e:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    4861:	8b 45 08             	mov    0x8(%ebp),%eax
    4864:	8b 58 0c             	mov    0xc(%eax),%ebx
    4867:	8b 45 08             	mov    0x8(%ebp),%eax
    486a:	8b 48 08             	mov    0x8(%eax),%ecx
    486d:	8b 45 08             	mov    0x8(%ebp),%eax
    4870:	8b 50 04             	mov    0x4(%eax),%edx
    4873:	8b 45 08             	mov    0x8(%ebp),%eax
    4876:	8b 00                	mov    (%eax),%eax
    4878:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    487c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4880:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4884:	89 44 24 08          	mov    %eax,0x8(%esp)
    4888:	c7 44 24 04 22 bd 00 	movl   $0xbd22,0x4(%esp)
    488f:	00 
    4890:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4897:	e8 59 07 00 00       	call   4ff5 <printf>
}
    489c:	83 c4 24             	add    $0x24,%esp
    489f:	5b                   	pop    %ebx
    48a0:	5d                   	pop    %ebp
    48a1:	c3                   	ret    

000048a2 <printClickableList>:

void printClickableList(Clickable *head)
{
    48a2:	55                   	push   %ebp
    48a3:	89 e5                	mov    %esp,%ebp
    48a5:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    48a8:	8b 45 08             	mov    0x8(%ebp),%eax
    48ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    48ae:	c7 44 24 04 34 bd 00 	movl   $0xbd34,0x4(%esp)
    48b5:	00 
    48b6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    48bd:	e8 33 07 00 00       	call   4ff5 <printf>
	while(cur != 0)
    48c2:	eb 14                	jmp    48d8 <printClickableList+0x36>
	{
		printClickable(cur);
    48c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    48c7:	89 04 24             	mov    %eax,(%esp)
    48ca:	e8 8b ff ff ff       	call   485a <printClickable>
		cur = cur->next;
    48cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    48d2:	8b 40 14             	mov    0x14(%eax),%eax
    48d5:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    48d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    48dc:	75 e6                	jne    48c4 <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    48de:	c7 44 24 04 45 bd 00 	movl   $0xbd45,0x4(%esp)
    48e5:	00 
    48e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    48ed:	e8 03 07 00 00       	call   4ff5 <printf>
}
    48f2:	c9                   	leave  
    48f3:	c3                   	ret    

000048f4 <testHanler>:

void testHanler(struct Point p)
{
    48f4:	55                   	push   %ebp
    48f5:	89 e5                	mov    %esp,%ebp
    48f7:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    48fa:	8b 55 0c             	mov    0xc(%ebp),%edx
    48fd:	8b 45 08             	mov    0x8(%ebp),%eax
    4900:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4904:	89 44 24 08          	mov    %eax,0x8(%esp)
    4908:	c7 44 24 04 47 bd 00 	movl   $0xbd47,0x4(%esp)
    490f:	00 
    4910:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4917:	e8 d9 06 00 00       	call   4ff5 <printf>
}
    491c:	c9                   	leave  
    491d:	c3                   	ret    

0000491e <testClickable>:
void testClickable(struct Context c)
{
    491e:	55                   	push   %ebp
    491f:	89 e5                	mov    %esp,%ebp
    4921:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    4927:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    492a:	8b 55 08             	mov    0x8(%ebp),%edx
    492d:	89 54 24 04          	mov    %edx,0x4(%esp)
    4931:	8b 55 0c             	mov    0xc(%ebp),%edx
    4934:	89 54 24 08          	mov    %edx,0x8(%esp)
    4938:	8b 55 10             	mov    0x10(%ebp),%edx
    493b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    493f:	89 04 24             	mov    %eax,(%esp)
    4942:	e8 0d fc ff ff       	call   4554 <initClickManager>
    4947:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    494a:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    494d:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    4954:	00 
    4955:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    495c:	00 
    495d:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    4964:	00 
    4965:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    496c:	00 
    496d:	89 04 24             	mov    %eax,(%esp)
    4970:	e8 41 fb ff ff       	call   44b6 <initRect>
    4975:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    4978:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    497b:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    4982:	00 
    4983:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    498a:	00 
    498b:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    4992:	00 
    4993:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    499a:	00 
    499b:	89 04 24             	mov    %eax,(%esp)
    499e:	e8 13 fb ff ff       	call   44b6 <initRect>
    49a3:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    49a6:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    49a9:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    49b0:	00 
    49b1:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    49b8:	00 
    49b9:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    49c0:	00 
    49c1:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    49c8:	00 
    49c9:	89 04 24             	mov    %eax,(%esp)
    49cc:	e8 e5 fa ff ff       	call   44b6 <initRect>
    49d1:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    49d4:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    49d7:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    49de:	00 
    49df:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    49e6:	00 
    49e7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    49ee:	00 
    49ef:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    49f6:	00 
    49f7:	89 04 24             	mov    %eax,(%esp)
    49fa:	e8 b7 fa ff ff       	call   44b6 <initRect>
    49ff:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    4a02:	8d 45 9c             	lea    -0x64(%ebp),%eax
    4a05:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    4a0c:	00 
    4a0d:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    4a14:	00 
    4a15:	89 04 24             	mov    %eax,(%esp)
    4a18:	e8 72 fa ff ff       	call   448f <initPoint>
    4a1d:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    4a20:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4a23:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    4a2a:	00 
    4a2b:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    4a32:	00 
    4a33:	89 04 24             	mov    %eax,(%esp)
    4a36:	e8 54 fa ff ff       	call   448f <initPoint>
    4a3b:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    4a3e:	c7 44 24 18 f4 48 00 	movl   $0x48f4,0x18(%esp)
    4a45:	00 
    4a46:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4a4d:	00 
    4a4e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4a51:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a55:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4a58:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4a5f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4a63:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4a66:	89 44 24 10          	mov    %eax,0x10(%esp)
    4a6a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4a6d:	89 04 24             	mov    %eax,(%esp)
    4a70:	e8 2d fb ff ff       	call   45a2 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4a75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4a78:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a7c:	c7 44 24 04 5b bd 00 	movl   $0xbd5b,0x4(%esp)
    4a83:	00 
    4a84:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a8b:	e8 65 05 00 00       	call   4ff5 <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    4a90:	c7 44 24 18 f4 48 00 	movl   $0x48f4,0x18(%esp)
    4a97:	00 
    4a98:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4a9f:	00 
    4aa0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4aa3:	89 44 24 04          	mov    %eax,0x4(%esp)
    4aa7:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4aaa:	89 44 24 08          	mov    %eax,0x8(%esp)
    4aae:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4ab1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4ab5:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4ab8:	89 44 24 10          	mov    %eax,0x10(%esp)
    4abc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4abf:	89 04 24             	mov    %eax,(%esp)
    4ac2:	e8 db fa ff ff       	call   45a2 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4ac7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4aca:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ace:	c7 44 24 04 5b bd 00 	movl   $0xbd5b,0x4(%esp)
    4ad5:	00 
    4ad6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4add:	e8 13 05 00 00       	call   4ff5 <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    4ae2:	c7 44 24 18 f4 48 00 	movl   $0x48f4,0x18(%esp)
    4ae9:	00 
    4aea:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4af1:	00 
    4af2:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4af5:	89 44 24 04          	mov    %eax,0x4(%esp)
    4af9:	8b 45 b8             	mov    -0x48(%ebp),%eax
    4afc:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b00:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4b03:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4b07:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4b0a:	89 44 24 10          	mov    %eax,0x10(%esp)
    4b0e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4b11:	89 04 24             	mov    %eax,(%esp)
    4b14:	e8 89 fa ff ff       	call   45a2 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4b19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b1c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b20:	c7 44 24 04 5b bd 00 	movl   $0xbd5b,0x4(%esp)
    4b27:	00 
    4b28:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b2f:	e8 c1 04 00 00       	call   4ff5 <printf>
	printClickableList(cm.left_click);
    4b34:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b37:	89 04 24             	mov    %eax,(%esp)
    4b3a:	e8 63 fd ff ff       	call   48a2 <printClickableList>
	executeHandler(cm.left_click, p1);
    4b3f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4b42:	8b 45 9c             	mov    -0x64(%ebp),%eax
    4b45:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4b48:	89 44 24 04          	mov    %eax,0x4(%esp)
    4b4c:	89 54 24 08          	mov    %edx,0x8(%esp)
    4b50:	89 0c 24             	mov    %ecx,(%esp)
    4b53:	e8 41 fc ff ff       	call   4799 <executeHandler>
	executeHandler(cm.left_click, p2);
    4b58:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4b5b:	8b 45 94             	mov    -0x6c(%ebp),%eax
    4b5e:	8b 55 98             	mov    -0x68(%ebp),%edx
    4b61:	89 44 24 04          	mov    %eax,0x4(%esp)
    4b65:	89 54 24 08          	mov    %edx,0x8(%esp)
    4b69:	89 0c 24             	mov    %ecx,(%esp)
    4b6c:	e8 28 fc ff ff       	call   4799 <executeHandler>
	deleteClickable(&cm.left_click, r4);
    4b71:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4b74:	89 44 24 04          	mov    %eax,0x4(%esp)
    4b78:	8b 45 a8             	mov    -0x58(%ebp),%eax
    4b7b:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b7f:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4b82:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4b86:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4b89:	89 44 24 10          	mov    %eax,0x10(%esp)
    4b8d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4b90:	89 04 24             	mov    %eax,(%esp)
    4b93:	e8 21 fb ff ff       	call   46b9 <deleteClickable>
	printClickableList(cm.left_click);
    4b98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b9b:	89 04 24             	mov    %eax,(%esp)
    4b9e:	e8 ff fc ff ff       	call   48a2 <printClickableList>
}
    4ba3:	c9                   	leave  
    4ba4:	c3                   	ret    

00004ba5 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    4ba5:	55                   	push   %ebp
    4ba6:	89 e5                	mov    %esp,%ebp
    4ba8:	57                   	push   %edi
    4ba9:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    4baa:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4bad:	8b 55 10             	mov    0x10(%ebp),%edx
    4bb0:	8b 45 0c             	mov    0xc(%ebp),%eax
    4bb3:	89 cb                	mov    %ecx,%ebx
    4bb5:	89 df                	mov    %ebx,%edi
    4bb7:	89 d1                	mov    %edx,%ecx
    4bb9:	fc                   	cld    
    4bba:	f3 aa                	rep stos %al,%es:(%edi)
    4bbc:	89 ca                	mov    %ecx,%edx
    4bbe:	89 fb                	mov    %edi,%ebx
    4bc0:	89 5d 08             	mov    %ebx,0x8(%ebp)
    4bc3:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    4bc6:	5b                   	pop    %ebx
    4bc7:	5f                   	pop    %edi
    4bc8:	5d                   	pop    %ebp
    4bc9:	c3                   	ret    

00004bca <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    4bca:	55                   	push   %ebp
    4bcb:	89 e5                	mov    %esp,%ebp
    4bcd:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    4bd0:	8b 45 08             	mov    0x8(%ebp),%eax
    4bd3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    4bd6:	90                   	nop
    4bd7:	8b 45 08             	mov    0x8(%ebp),%eax
    4bda:	8d 50 01             	lea    0x1(%eax),%edx
    4bdd:	89 55 08             	mov    %edx,0x8(%ebp)
    4be0:	8b 55 0c             	mov    0xc(%ebp),%edx
    4be3:	8d 4a 01             	lea    0x1(%edx),%ecx
    4be6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    4be9:	0f b6 12             	movzbl (%edx),%edx
    4bec:	88 10                	mov    %dl,(%eax)
    4bee:	0f b6 00             	movzbl (%eax),%eax
    4bf1:	84 c0                	test   %al,%al
    4bf3:	75 e2                	jne    4bd7 <strcpy+0xd>
    ;
  return os;
    4bf5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4bf8:	c9                   	leave  
    4bf9:	c3                   	ret    

00004bfa <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4bfa:	55                   	push   %ebp
    4bfb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    4bfd:	eb 08                	jmp    4c07 <strcmp+0xd>
    p++, q++;
    4bff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4c03:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    4c07:	8b 45 08             	mov    0x8(%ebp),%eax
    4c0a:	0f b6 00             	movzbl (%eax),%eax
    4c0d:	84 c0                	test   %al,%al
    4c0f:	74 10                	je     4c21 <strcmp+0x27>
    4c11:	8b 45 08             	mov    0x8(%ebp),%eax
    4c14:	0f b6 10             	movzbl (%eax),%edx
    4c17:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c1a:	0f b6 00             	movzbl (%eax),%eax
    4c1d:	38 c2                	cmp    %al,%dl
    4c1f:	74 de                	je     4bff <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    4c21:	8b 45 08             	mov    0x8(%ebp),%eax
    4c24:	0f b6 00             	movzbl (%eax),%eax
    4c27:	0f b6 d0             	movzbl %al,%edx
    4c2a:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c2d:	0f b6 00             	movzbl (%eax),%eax
    4c30:	0f b6 c0             	movzbl %al,%eax
    4c33:	29 c2                	sub    %eax,%edx
    4c35:	89 d0                	mov    %edx,%eax
}
    4c37:	5d                   	pop    %ebp
    4c38:	c3                   	ret    

00004c39 <strlen>:

uint
strlen(char *s)
{
    4c39:	55                   	push   %ebp
    4c3a:	89 e5                	mov    %esp,%ebp
    4c3c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    4c3f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    4c46:	eb 04                	jmp    4c4c <strlen+0x13>
    4c48:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    4c4c:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4c4f:	8b 45 08             	mov    0x8(%ebp),%eax
    4c52:	01 d0                	add    %edx,%eax
    4c54:	0f b6 00             	movzbl (%eax),%eax
    4c57:	84 c0                	test   %al,%al
    4c59:	75 ed                	jne    4c48 <strlen+0xf>
    ;
  return n;
    4c5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4c5e:	c9                   	leave  
    4c5f:	c3                   	ret    

00004c60 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4c60:	55                   	push   %ebp
    4c61:	89 e5                	mov    %esp,%ebp
    4c63:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    4c66:	8b 45 10             	mov    0x10(%ebp),%eax
    4c69:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c70:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c74:	8b 45 08             	mov    0x8(%ebp),%eax
    4c77:	89 04 24             	mov    %eax,(%esp)
    4c7a:	e8 26 ff ff ff       	call   4ba5 <stosb>
  return dst;
    4c7f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4c82:	c9                   	leave  
    4c83:	c3                   	ret    

00004c84 <strchr>:

char*
strchr(const char *s, char c)
{
    4c84:	55                   	push   %ebp
    4c85:	89 e5                	mov    %esp,%ebp
    4c87:	83 ec 04             	sub    $0x4,%esp
    4c8a:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c8d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    4c90:	eb 14                	jmp    4ca6 <strchr+0x22>
    if(*s == c)
    4c92:	8b 45 08             	mov    0x8(%ebp),%eax
    4c95:	0f b6 00             	movzbl (%eax),%eax
    4c98:	3a 45 fc             	cmp    -0x4(%ebp),%al
    4c9b:	75 05                	jne    4ca2 <strchr+0x1e>
      return (char*)s;
    4c9d:	8b 45 08             	mov    0x8(%ebp),%eax
    4ca0:	eb 13                	jmp    4cb5 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    4ca2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4ca6:	8b 45 08             	mov    0x8(%ebp),%eax
    4ca9:	0f b6 00             	movzbl (%eax),%eax
    4cac:	84 c0                	test   %al,%al
    4cae:	75 e2                	jne    4c92 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    4cb0:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4cb5:	c9                   	leave  
    4cb6:	c3                   	ret    

00004cb7 <gets>:

char*
gets(char *buf, int max)
{
    4cb7:	55                   	push   %ebp
    4cb8:	89 e5                	mov    %esp,%ebp
    4cba:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4cbd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4cc4:	eb 4c                	jmp    4d12 <gets+0x5b>
    cc = read(0, &c, 1);
    4cc6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4ccd:	00 
    4cce:	8d 45 ef             	lea    -0x11(%ebp),%eax
    4cd1:	89 44 24 04          	mov    %eax,0x4(%esp)
    4cd5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4cdc:	e8 44 01 00 00       	call   4e25 <read>
    4ce1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    4ce4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4ce8:	7f 02                	jg     4cec <gets+0x35>
      break;
    4cea:	eb 31                	jmp    4d1d <gets+0x66>
    buf[i++] = c;
    4cec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4cef:	8d 50 01             	lea    0x1(%eax),%edx
    4cf2:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4cf5:	89 c2                	mov    %eax,%edx
    4cf7:	8b 45 08             	mov    0x8(%ebp),%eax
    4cfa:	01 c2                	add    %eax,%edx
    4cfc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4d00:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    4d02:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4d06:	3c 0a                	cmp    $0xa,%al
    4d08:	74 13                	je     4d1d <gets+0x66>
    4d0a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4d0e:	3c 0d                	cmp    $0xd,%al
    4d10:	74 0b                	je     4d1d <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4d12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d15:	83 c0 01             	add    $0x1,%eax
    4d18:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4d1b:	7c a9                	jl     4cc6 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    4d1d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4d20:	8b 45 08             	mov    0x8(%ebp),%eax
    4d23:	01 d0                	add    %edx,%eax
    4d25:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    4d28:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4d2b:	c9                   	leave  
    4d2c:	c3                   	ret    

00004d2d <stat>:

int
stat(char *n, struct stat *st)
{
    4d2d:	55                   	push   %ebp
    4d2e:	89 e5                	mov    %esp,%ebp
    4d30:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4d33:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4d3a:	00 
    4d3b:	8b 45 08             	mov    0x8(%ebp),%eax
    4d3e:	89 04 24             	mov    %eax,(%esp)
    4d41:	e8 07 01 00 00       	call   4e4d <open>
    4d46:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    4d49:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4d4d:	79 07                	jns    4d56 <stat+0x29>
    return -1;
    4d4f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4d54:	eb 23                	jmp    4d79 <stat+0x4c>
  r = fstat(fd, st);
    4d56:	8b 45 0c             	mov    0xc(%ebp),%eax
    4d59:	89 44 24 04          	mov    %eax,0x4(%esp)
    4d5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d60:	89 04 24             	mov    %eax,(%esp)
    4d63:	e8 fd 00 00 00       	call   4e65 <fstat>
    4d68:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    4d6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d6e:	89 04 24             	mov    %eax,(%esp)
    4d71:	e8 bf 00 00 00       	call   4e35 <close>
  return r;
    4d76:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    4d79:	c9                   	leave  
    4d7a:	c3                   	ret    

00004d7b <atoi>:

int
atoi(const char *s)
{
    4d7b:	55                   	push   %ebp
    4d7c:	89 e5                	mov    %esp,%ebp
    4d7e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    4d81:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    4d88:	eb 25                	jmp    4daf <atoi+0x34>
    n = n*10 + *s++ - '0';
    4d8a:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4d8d:	89 d0                	mov    %edx,%eax
    4d8f:	c1 e0 02             	shl    $0x2,%eax
    4d92:	01 d0                	add    %edx,%eax
    4d94:	01 c0                	add    %eax,%eax
    4d96:	89 c1                	mov    %eax,%ecx
    4d98:	8b 45 08             	mov    0x8(%ebp),%eax
    4d9b:	8d 50 01             	lea    0x1(%eax),%edx
    4d9e:	89 55 08             	mov    %edx,0x8(%ebp)
    4da1:	0f b6 00             	movzbl (%eax),%eax
    4da4:	0f be c0             	movsbl %al,%eax
    4da7:	01 c8                	add    %ecx,%eax
    4da9:	83 e8 30             	sub    $0x30,%eax
    4dac:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4daf:	8b 45 08             	mov    0x8(%ebp),%eax
    4db2:	0f b6 00             	movzbl (%eax),%eax
    4db5:	3c 2f                	cmp    $0x2f,%al
    4db7:	7e 0a                	jle    4dc3 <atoi+0x48>
    4db9:	8b 45 08             	mov    0x8(%ebp),%eax
    4dbc:	0f b6 00             	movzbl (%eax),%eax
    4dbf:	3c 39                	cmp    $0x39,%al
    4dc1:	7e c7                	jle    4d8a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    4dc3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4dc6:	c9                   	leave  
    4dc7:	c3                   	ret    

00004dc8 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4dc8:	55                   	push   %ebp
    4dc9:	89 e5                	mov    %esp,%ebp
    4dcb:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    4dce:	8b 45 08             	mov    0x8(%ebp),%eax
    4dd1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    4dd4:	8b 45 0c             	mov    0xc(%ebp),%eax
    4dd7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    4dda:	eb 17                	jmp    4df3 <memmove+0x2b>
    *dst++ = *src++;
    4ddc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4ddf:	8d 50 01             	lea    0x1(%eax),%edx
    4de2:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4de5:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4de8:	8d 4a 01             	lea    0x1(%edx),%ecx
    4deb:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    4dee:	0f b6 12             	movzbl (%edx),%edx
    4df1:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4df3:	8b 45 10             	mov    0x10(%ebp),%eax
    4df6:	8d 50 ff             	lea    -0x1(%eax),%edx
    4df9:	89 55 10             	mov    %edx,0x10(%ebp)
    4dfc:	85 c0                	test   %eax,%eax
    4dfe:	7f dc                	jg     4ddc <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    4e00:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4e03:	c9                   	leave  
    4e04:	c3                   	ret    

00004e05 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4e05:	b8 01 00 00 00       	mov    $0x1,%eax
    4e0a:	cd 40                	int    $0x40
    4e0c:	c3                   	ret    

00004e0d <exit>:
SYSCALL(exit)
    4e0d:	b8 02 00 00 00       	mov    $0x2,%eax
    4e12:	cd 40                	int    $0x40
    4e14:	c3                   	ret    

00004e15 <wait>:
SYSCALL(wait)
    4e15:	b8 03 00 00 00       	mov    $0x3,%eax
    4e1a:	cd 40                	int    $0x40
    4e1c:	c3                   	ret    

00004e1d <pipe>:
SYSCALL(pipe)
    4e1d:	b8 04 00 00 00       	mov    $0x4,%eax
    4e22:	cd 40                	int    $0x40
    4e24:	c3                   	ret    

00004e25 <read>:
SYSCALL(read)
    4e25:	b8 05 00 00 00       	mov    $0x5,%eax
    4e2a:	cd 40                	int    $0x40
    4e2c:	c3                   	ret    

00004e2d <write>:
SYSCALL(write)
    4e2d:	b8 10 00 00 00       	mov    $0x10,%eax
    4e32:	cd 40                	int    $0x40
    4e34:	c3                   	ret    

00004e35 <close>:
SYSCALL(close)
    4e35:	b8 15 00 00 00       	mov    $0x15,%eax
    4e3a:	cd 40                	int    $0x40
    4e3c:	c3                   	ret    

00004e3d <kill>:
SYSCALL(kill)
    4e3d:	b8 06 00 00 00       	mov    $0x6,%eax
    4e42:	cd 40                	int    $0x40
    4e44:	c3                   	ret    

00004e45 <exec>:
SYSCALL(exec)
    4e45:	b8 07 00 00 00       	mov    $0x7,%eax
    4e4a:	cd 40                	int    $0x40
    4e4c:	c3                   	ret    

00004e4d <open>:
SYSCALL(open)
    4e4d:	b8 0f 00 00 00       	mov    $0xf,%eax
    4e52:	cd 40                	int    $0x40
    4e54:	c3                   	ret    

00004e55 <mknod>:
SYSCALL(mknod)
    4e55:	b8 11 00 00 00       	mov    $0x11,%eax
    4e5a:	cd 40                	int    $0x40
    4e5c:	c3                   	ret    

00004e5d <unlink>:
SYSCALL(unlink)
    4e5d:	b8 12 00 00 00       	mov    $0x12,%eax
    4e62:	cd 40                	int    $0x40
    4e64:	c3                   	ret    

00004e65 <fstat>:
SYSCALL(fstat)
    4e65:	b8 08 00 00 00       	mov    $0x8,%eax
    4e6a:	cd 40                	int    $0x40
    4e6c:	c3                   	ret    

00004e6d <link>:
SYSCALL(link)
    4e6d:	b8 13 00 00 00       	mov    $0x13,%eax
    4e72:	cd 40                	int    $0x40
    4e74:	c3                   	ret    

00004e75 <mkdir>:
SYSCALL(mkdir)
    4e75:	b8 14 00 00 00       	mov    $0x14,%eax
    4e7a:	cd 40                	int    $0x40
    4e7c:	c3                   	ret    

00004e7d <chdir>:
SYSCALL(chdir)
    4e7d:	b8 09 00 00 00       	mov    $0x9,%eax
    4e82:	cd 40                	int    $0x40
    4e84:	c3                   	ret    

00004e85 <dup>:
SYSCALL(dup)
    4e85:	b8 0a 00 00 00       	mov    $0xa,%eax
    4e8a:	cd 40                	int    $0x40
    4e8c:	c3                   	ret    

00004e8d <getpid>:
SYSCALL(getpid)
    4e8d:	b8 0b 00 00 00       	mov    $0xb,%eax
    4e92:	cd 40                	int    $0x40
    4e94:	c3                   	ret    

00004e95 <sbrk>:
SYSCALL(sbrk)
    4e95:	b8 0c 00 00 00       	mov    $0xc,%eax
    4e9a:	cd 40                	int    $0x40
    4e9c:	c3                   	ret    

00004e9d <sleep>:
SYSCALL(sleep)
    4e9d:	b8 0d 00 00 00       	mov    $0xd,%eax
    4ea2:	cd 40                	int    $0x40
    4ea4:	c3                   	ret    

00004ea5 <uptime>:
SYSCALL(uptime)
    4ea5:	b8 0e 00 00 00       	mov    $0xe,%eax
    4eaa:	cd 40                	int    $0x40
    4eac:	c3                   	ret    

00004ead <getMsg>:
SYSCALL(getMsg)
    4ead:	b8 16 00 00 00       	mov    $0x16,%eax
    4eb2:	cd 40                	int    $0x40
    4eb4:	c3                   	ret    

00004eb5 <createWindow>:
SYSCALL(createWindow)
    4eb5:	b8 17 00 00 00       	mov    $0x17,%eax
    4eba:	cd 40                	int    $0x40
    4ebc:	c3                   	ret    

00004ebd <destroyWindow>:
SYSCALL(destroyWindow)
    4ebd:	b8 18 00 00 00       	mov    $0x18,%eax
    4ec2:	cd 40                	int    $0x40
    4ec4:	c3                   	ret    

00004ec5 <updateWindow>:
SYSCALL(updateWindow)
    4ec5:	b8 19 00 00 00       	mov    $0x19,%eax
    4eca:	cd 40                	int    $0x40
    4ecc:	c3                   	ret    

00004ecd <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    4ecd:	b8 1a 00 00 00       	mov    $0x1a,%eax
    4ed2:	cd 40                	int    $0x40
    4ed4:	c3                   	ret    

00004ed5 <kwrite>:
SYSCALL(kwrite)
    4ed5:	b8 1c 00 00 00       	mov    $0x1c,%eax
    4eda:	cd 40                	int    $0x40
    4edc:	c3                   	ret    

00004edd <setSampleRate>:
SYSCALL(setSampleRate)
    4edd:	b8 1b 00 00 00       	mov    $0x1b,%eax
    4ee2:	cd 40                	int    $0x40
    4ee4:	c3                   	ret    

00004ee5 <pause>:
SYSCALL(pause)
    4ee5:	b8 1d 00 00 00       	mov    $0x1d,%eax
    4eea:	cd 40                	int    $0x40
    4eec:	c3                   	ret    

00004eed <wavdecode>:
SYSCALL(wavdecode)
    4eed:	b8 1e 00 00 00       	mov    $0x1e,%eax
    4ef2:	cd 40                	int    $0x40
    4ef4:	c3                   	ret    

00004ef5 <beginDecode>:
SYSCALL(beginDecode)
    4ef5:	b8 1f 00 00 00       	mov    $0x1f,%eax
    4efa:	cd 40                	int    $0x40
    4efc:	c3                   	ret    

00004efd <waitForDecode>:
SYSCALL(waitForDecode)
    4efd:	b8 20 00 00 00       	mov    $0x20,%eax
    4f02:	cd 40                	int    $0x40
    4f04:	c3                   	ret    

00004f05 <endDecode>:
SYSCALL(endDecode)
    4f05:	b8 21 00 00 00       	mov    $0x21,%eax
    4f0a:	cd 40                	int    $0x40
    4f0c:	c3                   	ret    

00004f0d <getCoreBuf>:
    4f0d:	b8 22 00 00 00       	mov    $0x22,%eax
    4f12:	cd 40                	int    $0x40
    4f14:	c3                   	ret    

00004f15 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4f15:	55                   	push   %ebp
    4f16:	89 e5                	mov    %esp,%ebp
    4f18:	83 ec 18             	sub    $0x18,%esp
    4f1b:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f1e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    4f21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4f28:	00 
    4f29:	8d 45 f4             	lea    -0xc(%ebp),%eax
    4f2c:	89 44 24 04          	mov    %eax,0x4(%esp)
    4f30:	8b 45 08             	mov    0x8(%ebp),%eax
    4f33:	89 04 24             	mov    %eax,(%esp)
    4f36:	e8 f2 fe ff ff       	call   4e2d <write>
}
    4f3b:	c9                   	leave  
    4f3c:	c3                   	ret    

00004f3d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4f3d:	55                   	push   %ebp
    4f3e:	89 e5                	mov    %esp,%ebp
    4f40:	56                   	push   %esi
    4f41:	53                   	push   %ebx
    4f42:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    4f45:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    4f4c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    4f50:	74 17                	je     4f69 <printint+0x2c>
    4f52:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4f56:	79 11                	jns    4f69 <printint+0x2c>
    neg = 1;
    4f58:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    4f5f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f62:	f7 d8                	neg    %eax
    4f64:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4f67:	eb 06                	jmp    4f6f <printint+0x32>
  } else {
    x = xx;
    4f69:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    4f6f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    4f76:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    4f79:	8d 41 01             	lea    0x1(%ecx),%eax
    4f7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4f7f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4f82:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4f85:	ba 00 00 00 00       	mov    $0x0,%edx
    4f8a:	f7 f3                	div    %ebx
    4f8c:	89 d0                	mov    %edx,%eax
    4f8e:	0f b6 80 9c fd 00 00 	movzbl 0xfd9c(%eax),%eax
    4f95:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    4f99:	8b 75 10             	mov    0x10(%ebp),%esi
    4f9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4f9f:	ba 00 00 00 00       	mov    $0x0,%edx
    4fa4:	f7 f6                	div    %esi
    4fa6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4fa9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4fad:	75 c7                	jne    4f76 <printint+0x39>
  if(neg)
    4faf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4fb3:	74 10                	je     4fc5 <printint+0x88>
    buf[i++] = '-';
    4fb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4fb8:	8d 50 01             	lea    0x1(%eax),%edx
    4fbb:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4fbe:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    4fc3:	eb 1f                	jmp    4fe4 <printint+0xa7>
    4fc5:	eb 1d                	jmp    4fe4 <printint+0xa7>
    putc(fd, buf[i]);
    4fc7:	8d 55 dc             	lea    -0x24(%ebp),%edx
    4fca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4fcd:	01 d0                	add    %edx,%eax
    4fcf:	0f b6 00             	movzbl (%eax),%eax
    4fd2:	0f be c0             	movsbl %al,%eax
    4fd5:	89 44 24 04          	mov    %eax,0x4(%esp)
    4fd9:	8b 45 08             	mov    0x8(%ebp),%eax
    4fdc:	89 04 24             	mov    %eax,(%esp)
    4fdf:	e8 31 ff ff ff       	call   4f15 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    4fe4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    4fe8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4fec:	79 d9                	jns    4fc7 <printint+0x8a>
    putc(fd, buf[i]);
}
    4fee:	83 c4 30             	add    $0x30,%esp
    4ff1:	5b                   	pop    %ebx
    4ff2:	5e                   	pop    %esi
    4ff3:	5d                   	pop    %ebp
    4ff4:	c3                   	ret    

00004ff5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4ff5:	55                   	push   %ebp
    4ff6:	89 e5                	mov    %esp,%ebp
    4ff8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    4ffb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    5002:	8d 45 0c             	lea    0xc(%ebp),%eax
    5005:	83 c0 04             	add    $0x4,%eax
    5008:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    500b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5012:	e9 7c 01 00 00       	jmp    5193 <printf+0x19e>
    c = fmt[i] & 0xff;
    5017:	8b 55 0c             	mov    0xc(%ebp),%edx
    501a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    501d:	01 d0                	add    %edx,%eax
    501f:	0f b6 00             	movzbl (%eax),%eax
    5022:	0f be c0             	movsbl %al,%eax
    5025:	25 ff 00 00 00       	and    $0xff,%eax
    502a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    502d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5031:	75 2c                	jne    505f <printf+0x6a>
      if(c == '%'){
    5033:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    5037:	75 0c                	jne    5045 <printf+0x50>
        state = '%';
    5039:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    5040:	e9 4a 01 00 00       	jmp    518f <printf+0x19a>
      } else {
        putc(fd, c);
    5045:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5048:	0f be c0             	movsbl %al,%eax
    504b:	89 44 24 04          	mov    %eax,0x4(%esp)
    504f:	8b 45 08             	mov    0x8(%ebp),%eax
    5052:	89 04 24             	mov    %eax,(%esp)
    5055:	e8 bb fe ff ff       	call   4f15 <putc>
    505a:	e9 30 01 00 00       	jmp    518f <printf+0x19a>
      }
    } else if(state == '%'){
    505f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    5063:	0f 85 26 01 00 00    	jne    518f <printf+0x19a>
      if(c == 'd'){
    5069:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    506d:	75 2d                	jne    509c <printf+0xa7>
        printint(fd, *ap, 10, 1);
    506f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5072:	8b 00                	mov    (%eax),%eax
    5074:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    507b:	00 
    507c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    5083:	00 
    5084:	89 44 24 04          	mov    %eax,0x4(%esp)
    5088:	8b 45 08             	mov    0x8(%ebp),%eax
    508b:	89 04 24             	mov    %eax,(%esp)
    508e:	e8 aa fe ff ff       	call   4f3d <printint>
        ap++;
    5093:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5097:	e9 ec 00 00 00       	jmp    5188 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    509c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    50a0:	74 06                	je     50a8 <printf+0xb3>
    50a2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    50a6:	75 2d                	jne    50d5 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    50a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    50ab:	8b 00                	mov    (%eax),%eax
    50ad:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    50b4:	00 
    50b5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    50bc:	00 
    50bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    50c1:	8b 45 08             	mov    0x8(%ebp),%eax
    50c4:	89 04 24             	mov    %eax,(%esp)
    50c7:	e8 71 fe ff ff       	call   4f3d <printint>
        ap++;
    50cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    50d0:	e9 b3 00 00 00       	jmp    5188 <printf+0x193>
      } else if(c == 's'){
    50d5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    50d9:	75 45                	jne    5120 <printf+0x12b>
        s = (char*)*ap;
    50db:	8b 45 e8             	mov    -0x18(%ebp),%eax
    50de:	8b 00                	mov    (%eax),%eax
    50e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    50e3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    50e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    50eb:	75 09                	jne    50f6 <printf+0x101>
          s = "(null)";
    50ed:	c7 45 f4 6b bd 00 00 	movl   $0xbd6b,-0xc(%ebp)
        while(*s != 0){
    50f4:	eb 1e                	jmp    5114 <printf+0x11f>
    50f6:	eb 1c                	jmp    5114 <printf+0x11f>
          putc(fd, *s);
    50f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50fb:	0f b6 00             	movzbl (%eax),%eax
    50fe:	0f be c0             	movsbl %al,%eax
    5101:	89 44 24 04          	mov    %eax,0x4(%esp)
    5105:	8b 45 08             	mov    0x8(%ebp),%eax
    5108:	89 04 24             	mov    %eax,(%esp)
    510b:	e8 05 fe ff ff       	call   4f15 <putc>
          s++;
    5110:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    5114:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5117:	0f b6 00             	movzbl (%eax),%eax
    511a:	84 c0                	test   %al,%al
    511c:	75 da                	jne    50f8 <printf+0x103>
    511e:	eb 68                	jmp    5188 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    5120:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    5124:	75 1d                	jne    5143 <printf+0x14e>
        putc(fd, *ap);
    5126:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5129:	8b 00                	mov    (%eax),%eax
    512b:	0f be c0             	movsbl %al,%eax
    512e:	89 44 24 04          	mov    %eax,0x4(%esp)
    5132:	8b 45 08             	mov    0x8(%ebp),%eax
    5135:	89 04 24             	mov    %eax,(%esp)
    5138:	e8 d8 fd ff ff       	call   4f15 <putc>
        ap++;
    513d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5141:	eb 45                	jmp    5188 <printf+0x193>
      } else if(c == '%'){
    5143:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    5147:	75 17                	jne    5160 <printf+0x16b>
        putc(fd, c);
    5149:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    514c:	0f be c0             	movsbl %al,%eax
    514f:	89 44 24 04          	mov    %eax,0x4(%esp)
    5153:	8b 45 08             	mov    0x8(%ebp),%eax
    5156:	89 04 24             	mov    %eax,(%esp)
    5159:	e8 b7 fd ff ff       	call   4f15 <putc>
    515e:	eb 28                	jmp    5188 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    5160:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    5167:	00 
    5168:	8b 45 08             	mov    0x8(%ebp),%eax
    516b:	89 04 24             	mov    %eax,(%esp)
    516e:	e8 a2 fd ff ff       	call   4f15 <putc>
        putc(fd, c);
    5173:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5176:	0f be c0             	movsbl %al,%eax
    5179:	89 44 24 04          	mov    %eax,0x4(%esp)
    517d:	8b 45 08             	mov    0x8(%ebp),%eax
    5180:	89 04 24             	mov    %eax,(%esp)
    5183:	e8 8d fd ff ff       	call   4f15 <putc>
      }
      state = 0;
    5188:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    518f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5193:	8b 55 0c             	mov    0xc(%ebp),%edx
    5196:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5199:	01 d0                	add    %edx,%eax
    519b:	0f b6 00             	movzbl (%eax),%eax
    519e:	84 c0                	test   %al,%al
    51a0:	0f 85 71 fe ff ff    	jne    5017 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    51a6:	c9                   	leave  
    51a7:	c3                   	ret    

000051a8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    51a8:	55                   	push   %ebp
    51a9:	89 e5                	mov    %esp,%ebp
    51ab:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    51ae:	8b 45 08             	mov    0x8(%ebp),%eax
    51b1:	83 e8 08             	sub    $0x8,%eax
    51b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    51b7:	a1 bc 02 01 00       	mov    0x102bc,%eax
    51bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
    51bf:	eb 24                	jmp    51e5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    51c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    51c4:	8b 00                	mov    (%eax),%eax
    51c6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    51c9:	77 12                	ja     51dd <free+0x35>
    51cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    51ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    51d1:	77 24                	ja     51f7 <free+0x4f>
    51d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    51d6:	8b 00                	mov    (%eax),%eax
    51d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    51db:	77 1a                	ja     51f7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    51dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    51e0:	8b 00                	mov    (%eax),%eax
    51e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    51e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    51e8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    51eb:	76 d4                	jbe    51c1 <free+0x19>
    51ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
    51f0:	8b 00                	mov    (%eax),%eax
    51f2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    51f5:	76 ca                	jbe    51c1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    51f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    51fa:	8b 40 04             	mov    0x4(%eax),%eax
    51fd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    5204:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5207:	01 c2                	add    %eax,%edx
    5209:	8b 45 fc             	mov    -0x4(%ebp),%eax
    520c:	8b 00                	mov    (%eax),%eax
    520e:	39 c2                	cmp    %eax,%edx
    5210:	75 24                	jne    5236 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    5212:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5215:	8b 50 04             	mov    0x4(%eax),%edx
    5218:	8b 45 fc             	mov    -0x4(%ebp),%eax
    521b:	8b 00                	mov    (%eax),%eax
    521d:	8b 40 04             	mov    0x4(%eax),%eax
    5220:	01 c2                	add    %eax,%edx
    5222:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5225:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    5228:	8b 45 fc             	mov    -0x4(%ebp),%eax
    522b:	8b 00                	mov    (%eax),%eax
    522d:	8b 10                	mov    (%eax),%edx
    522f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5232:	89 10                	mov    %edx,(%eax)
    5234:	eb 0a                	jmp    5240 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    5236:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5239:	8b 10                	mov    (%eax),%edx
    523b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    523e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    5240:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5243:	8b 40 04             	mov    0x4(%eax),%eax
    5246:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    524d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5250:	01 d0                	add    %edx,%eax
    5252:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5255:	75 20                	jne    5277 <free+0xcf>
    p->s.size += bp->s.size;
    5257:	8b 45 fc             	mov    -0x4(%ebp),%eax
    525a:	8b 50 04             	mov    0x4(%eax),%edx
    525d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5260:	8b 40 04             	mov    0x4(%eax),%eax
    5263:	01 c2                	add    %eax,%edx
    5265:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5268:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    526b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    526e:	8b 10                	mov    (%eax),%edx
    5270:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5273:	89 10                	mov    %edx,(%eax)
    5275:	eb 08                	jmp    527f <free+0xd7>
  } else
    p->s.ptr = bp;
    5277:	8b 45 fc             	mov    -0x4(%ebp),%eax
    527a:	8b 55 f8             	mov    -0x8(%ebp),%edx
    527d:	89 10                	mov    %edx,(%eax)
  freep = p;
    527f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5282:	a3 bc 02 01 00       	mov    %eax,0x102bc
}
    5287:	c9                   	leave  
    5288:	c3                   	ret    

00005289 <morecore>:

static Header*
morecore(uint nu)
{
    5289:	55                   	push   %ebp
    528a:	89 e5                	mov    %esp,%ebp
    528c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    528f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    5296:	77 07                	ja     529f <morecore+0x16>
    nu = 4096;
    5298:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    529f:	8b 45 08             	mov    0x8(%ebp),%eax
    52a2:	c1 e0 03             	shl    $0x3,%eax
    52a5:	89 04 24             	mov    %eax,(%esp)
    52a8:	e8 e8 fb ff ff       	call   4e95 <sbrk>
    52ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    52b0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    52b4:	75 07                	jne    52bd <morecore+0x34>
    return 0;
    52b6:	b8 00 00 00 00       	mov    $0x0,%eax
    52bb:	eb 22                	jmp    52df <morecore+0x56>
  hp = (Header*)p;
    52bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    52c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    52c6:	8b 55 08             	mov    0x8(%ebp),%edx
    52c9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    52cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    52cf:	83 c0 08             	add    $0x8,%eax
    52d2:	89 04 24             	mov    %eax,(%esp)
    52d5:	e8 ce fe ff ff       	call   51a8 <free>
  return freep;
    52da:	a1 bc 02 01 00       	mov    0x102bc,%eax
}
    52df:	c9                   	leave  
    52e0:	c3                   	ret    

000052e1 <malloc>:

void*
malloc(uint nbytes)
{
    52e1:	55                   	push   %ebp
    52e2:	89 e5                	mov    %esp,%ebp
    52e4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    52e7:	8b 45 08             	mov    0x8(%ebp),%eax
    52ea:	83 c0 07             	add    $0x7,%eax
    52ed:	c1 e8 03             	shr    $0x3,%eax
    52f0:	83 c0 01             	add    $0x1,%eax
    52f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    52f6:	a1 bc 02 01 00       	mov    0x102bc,%eax
    52fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    52fe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5302:	75 23                	jne    5327 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    5304:	c7 45 f0 b4 02 01 00 	movl   $0x102b4,-0x10(%ebp)
    530b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    530e:	a3 bc 02 01 00       	mov    %eax,0x102bc
    5313:	a1 bc 02 01 00       	mov    0x102bc,%eax
    5318:	a3 b4 02 01 00       	mov    %eax,0x102b4
    base.s.size = 0;
    531d:	c7 05 b8 02 01 00 00 	movl   $0x0,0x102b8
    5324:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5327:	8b 45 f0             	mov    -0x10(%ebp),%eax
    532a:	8b 00                	mov    (%eax),%eax
    532c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    532f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5332:	8b 40 04             	mov    0x4(%eax),%eax
    5335:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    5338:	72 4d                	jb     5387 <malloc+0xa6>
      if(p->s.size == nunits)
    533a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    533d:	8b 40 04             	mov    0x4(%eax),%eax
    5340:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    5343:	75 0c                	jne    5351 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    5345:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5348:	8b 10                	mov    (%eax),%edx
    534a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    534d:	89 10                	mov    %edx,(%eax)
    534f:	eb 26                	jmp    5377 <malloc+0x96>
      else {
        p->s.size -= nunits;
    5351:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5354:	8b 40 04             	mov    0x4(%eax),%eax
    5357:	2b 45 ec             	sub    -0x14(%ebp),%eax
    535a:	89 c2                	mov    %eax,%edx
    535c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    535f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    5362:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5365:	8b 40 04             	mov    0x4(%eax),%eax
    5368:	c1 e0 03             	shl    $0x3,%eax
    536b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    536e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5371:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5374:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    5377:	8b 45 f0             	mov    -0x10(%ebp),%eax
    537a:	a3 bc 02 01 00       	mov    %eax,0x102bc
      return (void*)(p + 1);
    537f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5382:	83 c0 08             	add    $0x8,%eax
    5385:	eb 38                	jmp    53bf <malloc+0xde>
    }
    if(p == freep)
    5387:	a1 bc 02 01 00       	mov    0x102bc,%eax
    538c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    538f:	75 1b                	jne    53ac <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    5391:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5394:	89 04 24             	mov    %eax,(%esp)
    5397:	e8 ed fe ff ff       	call   5289 <morecore>
    539c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    539f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    53a3:	75 07                	jne    53ac <malloc+0xcb>
        return 0;
    53a5:	b8 00 00 00 00       	mov    $0x0,%eax
    53aa:	eb 13                	jmp    53bf <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    53ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    53af:	89 45 f0             	mov    %eax,-0x10(%ebp)
    53b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    53b5:	8b 00                	mov    (%eax),%eax
    53b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    53ba:	e9 70 ff ff ff       	jmp    532f <malloc+0x4e>
}
    53bf:	c9                   	leave  
    53c0:	c3                   	ret    

000053c1 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    53c1:	55                   	push   %ebp
    53c2:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    53c4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    53c8:	79 07                	jns    53d1 <abs+0x10>
		return x * -1;
    53ca:	8b 45 08             	mov    0x8(%ebp),%eax
    53cd:	f7 d8                	neg    %eax
    53cf:	eb 03                	jmp    53d4 <abs+0x13>
	else
		return x;
    53d1:	8b 45 08             	mov    0x8(%ebp),%eax
}
    53d4:	5d                   	pop    %ebp
    53d5:	c3                   	ret    

000053d6 <sin>:
double sin(double x)  
{  
    53d6:	55                   	push   %ebp
    53d7:	89 e5                	mov    %esp,%ebp
    53d9:	83 ec 3c             	sub    $0x3c,%esp
    53dc:	8b 45 08             	mov    0x8(%ebp),%eax
    53df:	89 45 c8             	mov    %eax,-0x38(%ebp)
    53e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    53e5:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    53e8:	dd 45 c8             	fldl   -0x38(%ebp)
    53eb:	dd 5d f8             	fstpl  -0x8(%ebp)
    53ee:	d9 e8                	fld1   
    53f0:	dd 5d f0             	fstpl  -0x10(%ebp)
    53f3:	dd 45 c8             	fldl   -0x38(%ebp)
    53f6:	dd 5d e8             	fstpl  -0x18(%ebp)
    53f9:	dd 45 c8             	fldl   -0x38(%ebp)
    53fc:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    53ff:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    5406:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    540d:	eb 50                	jmp    545f <sin+0x89>
	{  
		n = n+1;  
    540f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    5413:	db 45 dc             	fildl  -0x24(%ebp)
    5416:	dc 4d f0             	fmull  -0x10(%ebp)
    5419:	8b 45 dc             	mov    -0x24(%ebp),%eax
    541c:	83 c0 01             	add    $0x1,%eax
    541f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    5422:	db 45 c4             	fildl  -0x3c(%ebp)
    5425:	de c9                	fmulp  %st,%st(1)
    5427:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    542a:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    542e:	dd 45 c8             	fldl   -0x38(%ebp)
    5431:	dc 4d c8             	fmull  -0x38(%ebp)
    5434:	dd 45 e8             	fldl   -0x18(%ebp)
    5437:	de c9                	fmulp  %st,%st(1)
    5439:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    543c:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    543f:	dd 45 e8             	fldl   -0x18(%ebp)
    5442:	dc 75 f0             	fdivl  -0x10(%ebp)
    5445:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    5448:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    544c:	7e 08                	jle    5456 <sin+0x80>
    544e:	dd 45 f8             	fldl   -0x8(%ebp)
    5451:	dc 45 e0             	faddl  -0x20(%ebp)
    5454:	eb 06                	jmp    545c <sin+0x86>
    5456:	dd 45 f8             	fldl   -0x8(%ebp)
    5459:	dc 65 e0             	fsubl  -0x20(%ebp)
    545c:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    545f:	dd 45 e0             	fldl   -0x20(%ebp)
    5462:	dd 05 78 bd 00 00    	fldl   0xbd78
    5468:	d9 c9                	fxch   %st(1)
    546a:	df e9                	fucomip %st(1),%st
    546c:	dd d8                	fstp   %st(0)
    546e:	77 9f                	ja     540f <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    5470:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    5473:	c9                   	leave  
    5474:	c3                   	ret    

00005475 <cos>:
double cos(double x)  
{  
    5475:	55                   	push   %ebp
    5476:	89 e5                	mov    %esp,%ebp
    5478:	83 ec 10             	sub    $0x10,%esp
    547b:	8b 45 08             	mov    0x8(%ebp),%eax
    547e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5481:	8b 45 0c             	mov    0xc(%ebp),%eax
    5484:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    5487:	dd 05 80 bd 00 00    	fldl   0xbd80
    548d:	dc 65 f8             	fsubl  -0x8(%ebp)
    5490:	dd 1c 24             	fstpl  (%esp)
    5493:	e8 3e ff ff ff       	call   53d6 <sin>
}  
    5498:	c9                   	leave  
    5499:	c3                   	ret    

0000549a <tan>:
double tan(double x)  
{  
    549a:	55                   	push   %ebp
    549b:	89 e5                	mov    %esp,%ebp
    549d:	83 ec 18             	sub    $0x18,%esp
    54a0:	8b 45 08             	mov    0x8(%ebp),%eax
    54a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
    54a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    54a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    54ac:	dd 45 f8             	fldl   -0x8(%ebp)
    54af:	dd 1c 24             	fstpl  (%esp)
    54b2:	e8 1f ff ff ff       	call   53d6 <sin>
    54b7:	dd 5d f0             	fstpl  -0x10(%ebp)
    54ba:	dd 45 f8             	fldl   -0x8(%ebp)
    54bd:	dd 1c 24             	fstpl  (%esp)
    54c0:	e8 b0 ff ff ff       	call   5475 <cos>
    54c5:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    54c8:	c9                   	leave  
    54c9:	c3                   	ret    

000054ca <pow>:

double pow(double x, double y)
{
    54ca:	55                   	push   %ebp
    54cb:	89 e5                	mov    %esp,%ebp
    54cd:	83 ec 48             	sub    $0x48,%esp
    54d0:	8b 45 08             	mov    0x8(%ebp),%eax
    54d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    54d6:	8b 45 0c             	mov    0xc(%ebp),%eax
    54d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    54dc:	8b 45 10             	mov    0x10(%ebp),%eax
    54df:	89 45 d8             	mov    %eax,-0x28(%ebp)
    54e2:	8b 45 14             	mov    0x14(%ebp),%eax
    54e5:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    54e8:	dd 45 e0             	fldl   -0x20(%ebp)
    54eb:	d9 ee                	fldz   
    54ed:	df e9                	fucomip %st(1),%st
    54ef:	dd d8                	fstp   %st(0)
    54f1:	7a 28                	jp     551b <pow+0x51>
    54f3:	dd 45 e0             	fldl   -0x20(%ebp)
    54f6:	d9 ee                	fldz   
    54f8:	df e9                	fucomip %st(1),%st
    54fa:	dd d8                	fstp   %st(0)
    54fc:	75 1d                	jne    551b <pow+0x51>
    54fe:	dd 45 d8             	fldl   -0x28(%ebp)
    5501:	d9 ee                	fldz   
    5503:	df e9                	fucomip %st(1),%st
    5505:	dd d8                	fstp   %st(0)
    5507:	7a 0b                	jp     5514 <pow+0x4a>
    5509:	dd 45 d8             	fldl   -0x28(%ebp)
    550c:	d9 ee                	fldz   
    550e:	df e9                	fucomip %st(1),%st
    5510:	dd d8                	fstp   %st(0)
    5512:	74 07                	je     551b <pow+0x51>
    5514:	d9 ee                	fldz   
    5516:	e9 30 01 00 00       	jmp    564b <pow+0x181>
	else if(x==0 && y==0) return 1;
    551b:	dd 45 e0             	fldl   -0x20(%ebp)
    551e:	d9 ee                	fldz   
    5520:	df e9                	fucomip %st(1),%st
    5522:	dd d8                	fstp   %st(0)
    5524:	7a 28                	jp     554e <pow+0x84>
    5526:	dd 45 e0             	fldl   -0x20(%ebp)
    5529:	d9 ee                	fldz   
    552b:	df e9                	fucomip %st(1),%st
    552d:	dd d8                	fstp   %st(0)
    552f:	75 1d                	jne    554e <pow+0x84>
    5531:	dd 45 d8             	fldl   -0x28(%ebp)
    5534:	d9 ee                	fldz   
    5536:	df e9                	fucomip %st(1),%st
    5538:	dd d8                	fstp   %st(0)
    553a:	7a 12                	jp     554e <pow+0x84>
    553c:	dd 45 d8             	fldl   -0x28(%ebp)
    553f:	d9 ee                	fldz   
    5541:	df e9                	fucomip %st(1),%st
    5543:	dd d8                	fstp   %st(0)
    5545:	75 07                	jne    554e <pow+0x84>
    5547:	d9 e8                	fld1   
    5549:	e9 fd 00 00 00       	jmp    564b <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    554e:	d9 ee                	fldz   
    5550:	dd 45 d8             	fldl   -0x28(%ebp)
    5553:	d9 c9                	fxch   %st(1)
    5555:	df e9                	fucomip %st(1),%st
    5557:	dd d8                	fstp   %st(0)
    5559:	76 1d                	jbe    5578 <pow+0xae>
    555b:	dd 45 d8             	fldl   -0x28(%ebp)
    555e:	d9 e0                	fchs   
    5560:	dd 5c 24 08          	fstpl  0x8(%esp)
    5564:	dd 45 e0             	fldl   -0x20(%ebp)
    5567:	dd 1c 24             	fstpl  (%esp)
    556a:	e8 5b ff ff ff       	call   54ca <pow>
    556f:	d9 e8                	fld1   
    5571:	de f1                	fdivp  %st,%st(1)
    5573:	e9 d3 00 00 00       	jmp    564b <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    5578:	d9 ee                	fldz   
    557a:	dd 45 e0             	fldl   -0x20(%ebp)
    557d:	d9 c9                	fxch   %st(1)
    557f:	df e9                	fucomip %st(1),%st
    5581:	dd d8                	fstp   %st(0)
    5583:	76 40                	jbe    55c5 <pow+0xfb>
    5585:	dd 45 d8             	fldl   -0x28(%ebp)
    5588:	d9 7d d6             	fnstcw -0x2a(%ebp)
    558b:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    558f:	b4 0c                	mov    $0xc,%ah
    5591:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    5595:	d9 6d d4             	fldcw  -0x2c(%ebp)
    5598:	db 5d d0             	fistpl -0x30(%ebp)
    559b:	d9 6d d6             	fldcw  -0x2a(%ebp)
    559e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    55a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    55a4:	db 45 d0             	fildl  -0x30(%ebp)
    55a7:	dd 45 d8             	fldl   -0x28(%ebp)
    55aa:	de e1                	fsubp  %st,%st(1)
    55ac:	d9 ee                	fldz   
    55ae:	df e9                	fucomip %st(1),%st
    55b0:	7a 0a                	jp     55bc <pow+0xf2>
    55b2:	d9 ee                	fldz   
    55b4:	df e9                	fucomip %st(1),%st
    55b6:	dd d8                	fstp   %st(0)
    55b8:	74 0b                	je     55c5 <pow+0xfb>
    55ba:	eb 02                	jmp    55be <pow+0xf4>
    55bc:	dd d8                	fstp   %st(0)
    55be:	d9 ee                	fldz   
    55c0:	e9 86 00 00 00       	jmp    564b <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    55c5:	d9 ee                	fldz   
    55c7:	dd 45 e0             	fldl   -0x20(%ebp)
    55ca:	d9 c9                	fxch   %st(1)
    55cc:	df e9                	fucomip %st(1),%st
    55ce:	dd d8                	fstp   %st(0)
    55d0:	76 63                	jbe    5635 <pow+0x16b>
    55d2:	dd 45 d8             	fldl   -0x28(%ebp)
    55d5:	d9 7d d6             	fnstcw -0x2a(%ebp)
    55d8:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    55dc:	b4 0c                	mov    $0xc,%ah
    55de:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    55e2:	d9 6d d4             	fldcw  -0x2c(%ebp)
    55e5:	db 5d d0             	fistpl -0x30(%ebp)
    55e8:	d9 6d d6             	fldcw  -0x2a(%ebp)
    55eb:	8b 45 d0             	mov    -0x30(%ebp),%eax
    55ee:	89 45 d0             	mov    %eax,-0x30(%ebp)
    55f1:	db 45 d0             	fildl  -0x30(%ebp)
    55f4:	dd 45 d8             	fldl   -0x28(%ebp)
    55f7:	de e1                	fsubp  %st,%st(1)
    55f9:	d9 ee                	fldz   
    55fb:	df e9                	fucomip %st(1),%st
    55fd:	7a 34                	jp     5633 <pow+0x169>
    55ff:	d9 ee                	fldz   
    5601:	df e9                	fucomip %st(1),%st
    5603:	dd d8                	fstp   %st(0)
    5605:	75 2e                	jne    5635 <pow+0x16b>
	{
		double powint=1;
    5607:	d9 e8                	fld1   
    5609:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    560c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    5613:	eb 0d                	jmp    5622 <pow+0x158>
    5615:	dd 45 f0             	fldl   -0x10(%ebp)
    5618:	dc 4d e0             	fmull  -0x20(%ebp)
    561b:	dd 5d f0             	fstpl  -0x10(%ebp)
    561e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5622:	db 45 ec             	fildl  -0x14(%ebp)
    5625:	dd 45 d8             	fldl   -0x28(%ebp)
    5628:	df e9                	fucomip %st(1),%st
    562a:	dd d8                	fstp   %st(0)
    562c:	73 e7                	jae    5615 <pow+0x14b>
		return powint;
    562e:	dd 45 f0             	fldl   -0x10(%ebp)
    5631:	eb 18                	jmp    564b <pow+0x181>
    5633:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    5635:	dd 45 e0             	fldl   -0x20(%ebp)
    5638:	dd 1c 24             	fstpl  (%esp)
    563b:	e8 36 00 00 00       	call   5676 <ln>
    5640:	dc 4d d8             	fmull  -0x28(%ebp)
    5643:	dd 1c 24             	fstpl  (%esp)
    5646:	e8 0e 02 00 00       	call   5859 <exp>
}
    564b:	c9                   	leave  
    564c:	c3                   	ret    

0000564d <sqrt>:
// 求根
double sqrt(double x)
{
    564d:	55                   	push   %ebp
    564e:	89 e5                	mov    %esp,%ebp
    5650:	83 ec 28             	sub    $0x28,%esp
    5653:	8b 45 08             	mov    0x8(%ebp),%eax
    5656:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5659:	8b 45 0c             	mov    0xc(%ebp),%eax
    565c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    565f:	dd 05 88 bd 00 00    	fldl   0xbd88
    5665:	dd 5c 24 08          	fstpl  0x8(%esp)
    5669:	dd 45 f0             	fldl   -0x10(%ebp)
    566c:	dd 1c 24             	fstpl  (%esp)
    566f:	e8 56 fe ff ff       	call   54ca <pow>
}
    5674:	c9                   	leave  
    5675:	c3                   	ret    

00005676 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    5676:	55                   	push   %ebp
    5677:	89 e5                	mov    %esp,%ebp
    5679:	81 ec 88 00 00 00    	sub    $0x88,%esp
    567f:	8b 45 08             	mov    0x8(%ebp),%eax
    5682:	89 45 90             	mov    %eax,-0x70(%ebp)
    5685:	8b 45 0c             	mov    0xc(%ebp),%eax
    5688:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    568b:	dd 45 90             	fldl   -0x70(%ebp)
    568e:	d9 e8                	fld1   
    5690:	de e9                	fsubrp %st,%st(1)
    5692:	dd 5d c0             	fstpl  -0x40(%ebp)
    5695:	d9 ee                	fldz   
    5697:	dd 5d f0             	fstpl  -0x10(%ebp)
    569a:	d9 ee                	fldz   
    569c:	dd 5d b8             	fstpl  -0x48(%ebp)
    569f:	d9 ee                	fldz   
    56a1:	dd 5d b0             	fstpl  -0x50(%ebp)
    56a4:	d9 ee                	fldz   
    56a6:	dd 5d e8             	fstpl  -0x18(%ebp)
    56a9:	d9 e8                	fld1   
    56ab:	dd 5d e0             	fstpl  -0x20(%ebp)
    56ae:	d9 e8                	fld1   
    56b0:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    56b3:	dd 45 90             	fldl   -0x70(%ebp)
    56b6:	d9 e8                	fld1   
    56b8:	df e9                	fucomip %st(1),%st
    56ba:	dd d8                	fstp   %st(0)
    56bc:	7a 12                	jp     56d0 <ln+0x5a>
    56be:	dd 45 90             	fldl   -0x70(%ebp)
    56c1:	d9 e8                	fld1   
    56c3:	df e9                	fucomip %st(1),%st
    56c5:	dd d8                	fstp   %st(0)
    56c7:	75 07                	jne    56d0 <ln+0x5a>
    56c9:	d9 ee                	fldz   
    56cb:	e9 87 01 00 00       	jmp    5857 <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    56d0:	dd 45 90             	fldl   -0x70(%ebp)
    56d3:	dd 05 90 bd 00 00    	fldl   0xbd90
    56d9:	d9 c9                	fxch   %st(1)
    56db:	df e9                	fucomip %st(1),%st
    56dd:	dd d8                	fstp   %st(0)
    56df:	76 14                	jbe    56f5 <ln+0x7f>
    56e1:	d9 e8                	fld1   
    56e3:	dc 75 90             	fdivl  -0x70(%ebp)
    56e6:	dd 1c 24             	fstpl  (%esp)
    56e9:	e8 88 ff ff ff       	call   5676 <ln>
    56ee:	d9 e0                	fchs   
    56f0:	e9 62 01 00 00       	jmp    5857 <ln+0x1e1>
	else if(x<.1)
    56f5:	dd 05 98 bd 00 00    	fldl   0xbd98
    56fb:	dd 45 90             	fldl   -0x70(%ebp)
    56fe:	d9 c9                	fxch   %st(1)
    5700:	df e9                	fucomip %st(1),%st
    5702:	dd d8                	fstp   %st(0)
    5704:	76 59                	jbe    575f <ln+0xe9>
	{
		double n=-1;
    5706:	d9 e8                	fld1   
    5708:	d9 e0                	fchs   
    570a:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    570d:	dd 45 c8             	fldl   -0x38(%ebp)
    5710:	dd 05 a0 bd 00 00    	fldl   0xbda0
    5716:	de e9                	fsubrp %st,%st(1)
    5718:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    571b:	dd 45 c8             	fldl   -0x38(%ebp)
    571e:	dd 1c 24             	fstpl  (%esp)
    5721:	e8 33 01 00 00       	call   5859 <exp>
    5726:	dd 45 90             	fldl   -0x70(%ebp)
    5729:	de f1                	fdivp  %st,%st(1)
    572b:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    572e:	dd 45 a0             	fldl   -0x60(%ebp)
    5731:	dd 05 90 bd 00 00    	fldl   0xbd90
    5737:	d9 c9                	fxch   %st(1)
    5739:	df e9                	fucomip %st(1),%st
    573b:	dd d8                	fstp   %st(0)
    573d:	77 ce                	ja     570d <ln+0x97>
    573f:	d9 e8                	fld1   
    5741:	dd 45 a0             	fldl   -0x60(%ebp)
    5744:	d9 c9                	fxch   %st(1)
    5746:	df e9                	fucomip %st(1),%st
    5748:	dd d8                	fstp   %st(0)
    574a:	77 c1                	ja     570d <ln+0x97>
		return ln(a)+n;
    574c:	dd 45 a0             	fldl   -0x60(%ebp)
    574f:	dd 1c 24             	fstpl  (%esp)
    5752:	e8 1f ff ff ff       	call   5676 <ln>
    5757:	dc 45 c8             	faddl  -0x38(%ebp)
    575a:	e9 f8 00 00 00       	jmp    5857 <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    575f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    5766:	d9 e8                	fld1   
    5768:	dd 5d d8             	fstpl  -0x28(%ebp)
    576b:	e9 b6 00 00 00       	jmp    5826 <ln+0x1b0>
	{
		ln_tmp=ln_px;
    5770:	dd 45 e8             	fldl   -0x18(%ebp)
    5773:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    5776:	dd 45 d8             	fldl   -0x28(%ebp)
    5779:	dc 4d c0             	fmull  -0x40(%ebp)
    577c:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    577f:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    5783:	75 0d                	jne    5792 <ln+0x11c>
    5785:	db 45 d4             	fildl  -0x2c(%ebp)
    5788:	dd 45 d8             	fldl   -0x28(%ebp)
    578b:	de f1                	fdivp  %st,%st(1)
    578d:	dd 5d d8             	fstpl  -0x28(%ebp)
    5790:	eb 13                	jmp    57a5 <ln+0x12f>
		else tmp=tmp/-l;
    5792:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5795:	f7 d8                	neg    %eax
    5797:	89 45 8c             	mov    %eax,-0x74(%ebp)
    579a:	db 45 8c             	fildl  -0x74(%ebp)
    579d:	dd 45 d8             	fldl   -0x28(%ebp)
    57a0:	de f1                	fdivp  %st,%st(1)
    57a2:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    57a5:	dd 45 f0             	fldl   -0x10(%ebp)
    57a8:	dc 45 d8             	faddl  -0x28(%ebp)
    57ab:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    57ae:	dd 45 d8             	fldl   -0x28(%ebp)
    57b1:	d9 e0                	fchs   
    57b3:	dc 4d c0             	fmull  -0x40(%ebp)
    57b6:	db 45 d4             	fildl  -0x2c(%ebp)
    57b9:	de c9                	fmulp  %st,%st(1)
    57bb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    57be:	83 c0 01             	add    $0x1,%eax
    57c1:	89 45 8c             	mov    %eax,-0x74(%ebp)
    57c4:	db 45 8c             	fildl  -0x74(%ebp)
    57c7:	de f9                	fdivrp %st,%st(1)
    57c9:	dc 45 f0             	faddl  -0x10(%ebp)
    57cc:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    57cf:	dd 45 d8             	fldl   -0x28(%ebp)
    57d2:	dc 4d c0             	fmull  -0x40(%ebp)
    57d5:	dc 4d c0             	fmull  -0x40(%ebp)
    57d8:	db 45 d4             	fildl  -0x2c(%ebp)
    57db:	de c9                	fmulp  %st,%st(1)
    57dd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    57e0:	83 c0 02             	add    $0x2,%eax
    57e3:	89 45 8c             	mov    %eax,-0x74(%ebp)
    57e6:	db 45 8c             	fildl  -0x74(%ebp)
    57e9:	de f9                	fdivrp %st,%st(1)
    57eb:	dc 45 b8             	faddl  -0x48(%ebp)
    57ee:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    57f1:	dd 45 b0             	fldl   -0x50(%ebp)
    57f4:	dc 65 b8             	fsubl  -0x48(%ebp)
    57f7:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    57fa:	dd 45 a8             	fldl   -0x58(%ebp)
    57fd:	dc 4d a8             	fmull  -0x58(%ebp)
    5800:	dd 45 b8             	fldl   -0x48(%ebp)
    5803:	d8 c0                	fadd   %st(0),%st
    5805:	dd 45 b0             	fldl   -0x50(%ebp)
    5808:	de e1                	fsubp  %st,%st(1)
    580a:	dc 45 f0             	faddl  -0x10(%ebp)
    580d:	de f9                	fdivrp %st,%st(1)
    580f:	dd 45 b0             	fldl   -0x50(%ebp)
    5812:	de e1                	fsubp  %st,%st(1)
    5814:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    5817:	db 45 d4             	fildl  -0x2c(%ebp)
    581a:	dd 45 d8             	fldl   -0x28(%ebp)
    581d:	de c9                	fmulp  %st,%st(1)
    581f:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    5822:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    5826:	dd 45 e8             	fldl   -0x18(%ebp)
    5829:	dc 65 e0             	fsubl  -0x20(%ebp)
    582c:	dd 05 a8 bd 00 00    	fldl   0xbda8
    5832:	d9 c9                	fxch   %st(1)
    5834:	df e9                	fucomip %st(1),%st
    5836:	dd d8                	fstp   %st(0)
    5838:	0f 87 32 ff ff ff    	ja     5770 <ln+0xfa>
    583e:	dd 45 e8             	fldl   -0x18(%ebp)
    5841:	dc 65 e0             	fsubl  -0x20(%ebp)
    5844:	dd 05 b0 bd 00 00    	fldl   0xbdb0
    584a:	df e9                	fucomip %st(1),%st
    584c:	dd d8                	fstp   %st(0)
    584e:	0f 87 1c ff ff ff    	ja     5770 <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    5854:	dd 45 e8             	fldl   -0x18(%ebp)
}
    5857:	c9                   	leave  
    5858:	c3                   	ret    

00005859 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    5859:	55                   	push   %ebp
    585a:	89 e5                	mov    %esp,%ebp
    585c:	83 ec 78             	sub    $0x78,%esp
    585f:	8b 45 08             	mov    0x8(%ebp),%eax
    5862:	89 45 a0             	mov    %eax,-0x60(%ebp)
    5865:	8b 45 0c             	mov    0xc(%ebp),%eax
    5868:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    586b:	dd 45 a0             	fldl   -0x60(%ebp)
    586e:	dd 5d c0             	fstpl  -0x40(%ebp)
    5871:	d9 ee                	fldz   
    5873:	dd 5d f0             	fstpl  -0x10(%ebp)
    5876:	d9 ee                	fldz   
    5878:	dd 5d b8             	fstpl  -0x48(%ebp)
    587b:	d9 ee                	fldz   
    587d:	dd 5d b0             	fstpl  -0x50(%ebp)
    5880:	d9 ee                	fldz   
    5882:	dd 5d e8             	fstpl  -0x18(%ebp)
    5885:	d9 e8                	fld1   
    5887:	dd 5d e0             	fstpl  -0x20(%ebp)
    588a:	d9 e8                	fld1   
    588c:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    588f:	dd 45 a0             	fldl   -0x60(%ebp)
    5892:	d9 ee                	fldz   
    5894:	df e9                	fucomip %st(1),%st
    5896:	dd d8                	fstp   %st(0)
    5898:	7a 12                	jp     58ac <exp+0x53>
    589a:	dd 45 a0             	fldl   -0x60(%ebp)
    589d:	d9 ee                	fldz   
    589f:	df e9                	fucomip %st(1),%st
    58a1:	dd d8                	fstp   %st(0)
    58a3:	75 07                	jne    58ac <exp+0x53>
    58a5:	d9 e8                	fld1   
    58a7:	e9 08 01 00 00       	jmp    59b4 <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    58ac:	d9 ee                	fldz   
    58ae:	dd 45 a0             	fldl   -0x60(%ebp)
    58b1:	d9 c9                	fxch   %st(1)
    58b3:	df e9                	fucomip %st(1),%st
    58b5:	dd d8                	fstp   %st(0)
    58b7:	76 16                	jbe    58cf <exp+0x76>
    58b9:	dd 45 a0             	fldl   -0x60(%ebp)
    58bc:	d9 e0                	fchs   
    58be:	dd 1c 24             	fstpl  (%esp)
    58c1:	e8 93 ff ff ff       	call   5859 <exp>
    58c6:	d9 e8                	fld1   
    58c8:	de f1                	fdivp  %st,%st(1)
    58ca:	e9 e5 00 00 00       	jmp    59b4 <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    58cf:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    58d6:	d9 e8                	fld1   
    58d8:	dd 5d d0             	fstpl  -0x30(%ebp)
    58db:	e9 92 00 00 00       	jmp    5972 <exp+0x119>
	{
		ex_tmp=ex_px;
    58e0:	dd 45 e8             	fldl   -0x18(%ebp)
    58e3:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    58e6:	dd 45 d0             	fldl   -0x30(%ebp)
    58e9:	dc 4d c0             	fmull  -0x40(%ebp)
    58ec:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    58ef:	db 45 cc             	fildl  -0x34(%ebp)
    58f2:	dd 45 d0             	fldl   -0x30(%ebp)
    58f5:	de f1                	fdivp  %st,%st(1)
    58f7:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    58fa:	dd 45 f0             	fldl   -0x10(%ebp)
    58fd:	dc 45 d0             	faddl  -0x30(%ebp)
    5900:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    5903:	dd 45 d0             	fldl   -0x30(%ebp)
    5906:	dc 4d c0             	fmull  -0x40(%ebp)
    5909:	8b 45 cc             	mov    -0x34(%ebp),%eax
    590c:	83 c0 01             	add    $0x1,%eax
    590f:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5912:	db 45 9c             	fildl  -0x64(%ebp)
    5915:	de f9                	fdivrp %st,%st(1)
    5917:	dc 45 f0             	faddl  -0x10(%ebp)
    591a:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    591d:	dd 45 d0             	fldl   -0x30(%ebp)
    5920:	dc 4d c0             	fmull  -0x40(%ebp)
    5923:	dc 4d c0             	fmull  -0x40(%ebp)
    5926:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5929:	83 c0 01             	add    $0x1,%eax
    592c:	89 45 9c             	mov    %eax,-0x64(%ebp)
    592f:	db 45 9c             	fildl  -0x64(%ebp)
    5932:	de f9                	fdivrp %st,%st(1)
    5934:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5937:	83 c0 02             	add    $0x2,%eax
    593a:	89 45 9c             	mov    %eax,-0x64(%ebp)
    593d:	db 45 9c             	fildl  -0x64(%ebp)
    5940:	de f9                	fdivrp %st,%st(1)
    5942:	dc 45 b8             	faddl  -0x48(%ebp)
    5945:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    5948:	dd 45 b0             	fldl   -0x50(%ebp)
    594b:	dc 65 b8             	fsubl  -0x48(%ebp)
    594e:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    5951:	dd 45 d8             	fldl   -0x28(%ebp)
    5954:	dc 4d d8             	fmull  -0x28(%ebp)
    5957:	dd 45 b8             	fldl   -0x48(%ebp)
    595a:	d8 c0                	fadd   %st(0),%st
    595c:	dd 45 b0             	fldl   -0x50(%ebp)
    595f:	de e1                	fsubp  %st,%st(1)
    5961:	dc 45 f0             	faddl  -0x10(%ebp)
    5964:	de f9                	fdivrp %st,%st(1)
    5966:	dd 45 b0             	fldl   -0x50(%ebp)
    5969:	de e1                	fsubp  %st,%st(1)
    596b:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    596e:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    5972:	dd 45 e8             	fldl   -0x18(%ebp)
    5975:	dc 65 e0             	fsubl  -0x20(%ebp)
    5978:	dd 05 b8 bd 00 00    	fldl   0xbdb8
    597e:	d9 c9                	fxch   %st(1)
    5980:	df e9                	fucomip %st(1),%st
    5982:	dd d8                	fstp   %st(0)
    5984:	77 12                	ja     5998 <exp+0x13f>
    5986:	dd 45 e8             	fldl   -0x18(%ebp)
    5989:	dc 65 e0             	fsubl  -0x20(%ebp)
    598c:	dd 05 c0 bd 00 00    	fldl   0xbdc0
    5992:	df e9                	fucomip %st(1),%st
    5994:	dd d8                	fstp   %st(0)
    5996:	76 15                	jbe    59ad <exp+0x154>
    5998:	dd 45 d8             	fldl   -0x28(%ebp)
    599b:	dd 05 b8 bd 00 00    	fldl   0xbdb8
    59a1:	d9 c9                	fxch   %st(1)
    59a3:	df e9                	fucomip %st(1),%st
    59a5:	dd d8                	fstp   %st(0)
    59a7:	0f 87 33 ff ff ff    	ja     58e0 <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    59ad:	dd 45 e8             	fldl   -0x18(%ebp)
    59b0:	d9 e8                	fld1   
    59b2:	de c1                	faddp  %st,%st(1)
    59b4:	c9                   	leave  
    59b5:	c3                   	ret    

000059b6 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    59b6:	55                   	push   %ebp
    59b7:	89 e5                	mov    %esp,%ebp
    59b9:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    59bc:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    59c0:	8b 45 08             	mov    0x8(%ebp),%eax
    59c3:	89 44 24 04          	mov    %eax,0x4(%esp)
    59c7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    59ca:	89 04 24             	mov    %eax,(%esp)
    59cd:	e8 f8 f1 ff ff       	call   4bca <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    59d2:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    59d9:	00 
    59da:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    59dd:	89 04 24             	mov    %eax,(%esp)
    59e0:	e8 68 f4 ff ff       	call   4e4d <open>
    59e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    59e8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    59ec:	75 1b                	jne    5a09 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    59ee:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    59f1:	89 44 24 08          	mov    %eax,0x8(%esp)
    59f5:	c7 44 24 04 f4 bd 00 	movl   $0xbdf4,0x4(%esp)
    59fc:	00 
    59fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5a04:	e8 ec f5 ff ff       	call   4ff5 <printf>
    }
    return f;
    5a09:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5a0c:	c9                   	leave  
    5a0d:	c3                   	ret    

00005a0e <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    5a0e:	55                   	push   %ebp
    5a0f:	89 e5                	mov    %esp,%ebp
    5a11:	57                   	push   %edi
    5a12:	56                   	push   %esi
    5a13:	53                   	push   %ebx
    5a14:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    5a17:	8b 45 08             	mov    0x8(%ebp),%eax
    5a1a:	8b 00                	mov    (%eax),%eax
    5a1c:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5a1f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a22:	8b 78 14             	mov    0x14(%eax),%edi
    5a25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a28:	8b 70 10             	mov    0x10(%eax),%esi
    5a2b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a2e:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    5a31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a34:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5a37:	85 c0                	test   %eax,%eax
    5a39:	0f 94 c0             	sete   %al
    5a3c:	0f b6 c8             	movzbl %al,%ecx
    5a3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a42:	8b 50 04             	mov    0x4(%eax),%edx
    5a45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a48:	8b 00                	mov    (%eax),%eax
    5a4a:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    5a4e:	89 74 24 18          	mov    %esi,0x18(%esp)
    5a52:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    5a56:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5a5a:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5a5e:	89 44 24 08          	mov    %eax,0x8(%esp)
    5a62:	c7 44 24 04 14 be 00 	movl   $0xbe14,0x4(%esp)
    5a69:	00 
    5a6a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5a71:	e8 7f f5 ff ff       	call   4ff5 <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    5a76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a79:	8b 78 2c             	mov    0x2c(%eax),%edi
    5a7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a7f:	8b 70 28             	mov    0x28(%eax),%esi
    5a82:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a85:	8b 58 24             	mov    0x24(%eax),%ebx
    5a88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a8b:	8b 48 20             	mov    0x20(%eax),%ecx
    5a8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a91:	8b 50 1c             	mov    0x1c(%eax),%edx
    5a94:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a97:	8b 40 18             	mov    0x18(%eax),%eax
    5a9a:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    5a9e:	89 74 24 18          	mov    %esi,0x18(%esp)
    5aa2:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    5aa6:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5aaa:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5aae:	89 44 24 08          	mov    %eax,0x8(%esp)
    5ab2:	c7 44 24 04 54 be 00 	movl   $0xbe54,0x4(%esp)
    5ab9:	00 
    5aba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5ac1:	e8 2f f5 ff ff       	call   4ff5 <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5ac6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5ac9:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5acc:	8b 0c 85 c0 fe 00 00 	mov    0xfec0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5ad3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5ad6:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5ad9:	dd 04 c5 a0 fe 00 00 	fldl   0xfea0(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5ae0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5ae3:	8b 40 04             	mov    0x4(%eax),%eax
    5ae6:	8d 50 ff             	lea    -0x1(%eax),%edx
    5ae9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5aec:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5aef:	89 d0                	mov    %edx,%eax
    5af1:	c1 e0 04             	shl    $0x4,%eax
    5af4:	29 d0                	sub    %edx,%eax
    5af6:	01 d8                	add    %ebx,%eax
    5af8:	8b 14 85 e0 fd 00 00 	mov    0xfde0(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5aff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5b02:	8b 40 04             	mov    0x4(%eax),%eax
    5b05:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5b08:	8b 04 85 c0 fd 00 00 	mov    0xfdc0(,%eax,4),%eax
    5b0f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    5b13:	dd 5c 24 10          	fstpl  0x10(%esp)
    5b17:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5b1b:	89 44 24 08          	mov    %eax,0x8(%esp)
    5b1f:	c7 44 24 04 7c be 00 	movl   $0xbe7c,0x4(%esp)
    5b26:	00 
    5b27:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5b2e:	e8 c2 f4 ff ff       	call   4ff5 <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    5b33:	8b 45 08             	mov    0x8(%ebp),%eax
    5b36:	8b 48 08             	mov    0x8(%eax),%ecx
    5b39:	8b 45 08             	mov    0x8(%ebp),%eax
    5b3c:	8b 50 0c             	mov    0xc(%eax),%edx
    5b3f:	8b 45 08             	mov    0x8(%ebp),%eax
    5b42:	8b 40 10             	mov    0x10(%eax),%eax
    5b45:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5b49:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5b4d:	89 44 24 08          	mov    %eax,0x8(%esp)
    5b51:	c7 44 24 04 ab be 00 	movl   $0xbeab,0x4(%esp)
    5b58:	00 
    5b59:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5b60:	e8 90 f4 ff ff       	call   4ff5 <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    5b65:	83 c4 3c             	add    $0x3c,%esp
    5b68:	5b                   	pop    %ebx
    5b69:	5e                   	pop    %esi
    5b6a:	5f                   	pop    %edi
    5b6b:	5d                   	pop    %ebp
    5b6c:	c3                   	ret    

00005b6d <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    5b6d:	55                   	push   %ebp
    5b6e:	89 e5                	mov    %esp,%ebp
    5b70:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    5b73:	8b 45 08             	mov    0x8(%ebp),%eax
    5b76:	89 04 24             	mov    %eax,(%esp)
    5b79:	e8 63 f7 ff ff       	call   52e1 <malloc>
    5b7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    5b81:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5b85:	74 1c                	je     5ba3 <mem_alloc+0x36>
		memset(ptr, 0, block);
    5b87:	8b 45 08             	mov    0x8(%ebp),%eax
    5b8a:	89 44 24 08          	mov    %eax,0x8(%esp)
    5b8e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    5b95:	00 
    5b96:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b99:	89 04 24             	mov    %eax,(%esp)
    5b9c:	e8 bf f0 ff ff       	call   4c60 <memset>
    5ba1:	eb 20                	jmp    5bc3 <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    5ba3:	8b 45 0c             	mov    0xc(%ebp),%eax
    5ba6:	89 44 24 08          	mov    %eax,0x8(%esp)
    5baa:	c7 44 24 04 c5 be 00 	movl   $0xbec5,0x4(%esp)
    5bb1:	00 
    5bb2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5bb9:	e8 37 f4 ff ff       	call   4ff5 <printf>
		exit();
    5bbe:	e8 4a f2 ff ff       	call   4e0d <exit>
	}
	return ptr;
    5bc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5bc6:	c9                   	leave  
    5bc7:	c3                   	ret    

00005bc8 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    5bc8:	55                   	push   %ebp
    5bc9:	89 e5                	mov    %esp,%ebp
    5bcb:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    5bce:	8b 45 0c             	mov    0xc(%ebp),%eax
    5bd1:	c7 44 24 04 dc be 00 	movl   $0xbedc,0x4(%esp)
    5bd8:	00 
    5bd9:	89 04 24             	mov    %eax,(%esp)
    5bdc:	e8 8c ff ff ff       	call   5b6d <mem_alloc>
    5be1:	8b 55 08             	mov    0x8(%ebp),%edx
    5be4:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    5be7:	8b 45 08             	mov    0x8(%ebp),%eax
    5bea:	8b 55 0c             	mov    0xc(%ebp),%edx
    5bed:	89 50 08             	mov    %edx,0x8(%eax)
}
    5bf0:	c9                   	leave  
    5bf1:	c3                   	ret    

00005bf2 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    5bf2:	55                   	push   %ebp
    5bf3:	89 e5                	mov    %esp,%ebp
    5bf5:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    5bf8:	8b 45 08             	mov    0x8(%ebp),%eax
    5bfb:	8b 40 04             	mov    0x4(%eax),%eax
    5bfe:	89 04 24             	mov    %eax,(%esp)
    5c01:	e8 a2 f5 ff ff       	call   51a8 <free>
}
    5c06:	c9                   	leave  
    5c07:	c3                   	ret    

00005c08 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    5c08:	55                   	push   %ebp
    5c09:	89 e5                	mov    %esp,%ebp
    5c0b:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    5c0e:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5c15:	00 
    5c16:	8b 45 0c             	mov    0xc(%ebp),%eax
    5c19:	89 04 24             	mov    %eax,(%esp)
    5c1c:	e8 2c f2 ff ff       	call   4e4d <open>
    5c21:	8b 55 08             	mov    0x8(%ebp),%edx
    5c24:	89 02                	mov    %eax,(%edx)
    5c26:	8b 45 08             	mov    0x8(%ebp),%eax
    5c29:	8b 00                	mov    (%eax),%eax
    5c2b:	83 f8 ff             	cmp    $0xffffffff,%eax
    5c2e:	75 20                	jne    5c50 <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    5c30:	8b 45 0c             	mov    0xc(%ebp),%eax
    5c33:	89 44 24 08          	mov    %eax,0x8(%esp)
    5c37:	c7 44 24 04 e3 be 00 	movl   $0xbee3,0x4(%esp)
    5c3e:	00 
    5c3f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5c46:	e8 aa f3 ff ff       	call   4ff5 <printf>
		exit();
    5c4b:	e8 bd f1 ff ff       	call   4e0d <exit>
	}

	bs->format = BINARY;
    5c50:	8b 45 08             	mov    0x8(%ebp),%eax
    5c53:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    5c57:	8b 45 10             	mov    0x10(%ebp),%eax
    5c5a:	89 44 24 04          	mov    %eax,0x4(%esp)
    5c5e:	8b 45 08             	mov    0x8(%ebp),%eax
    5c61:	89 04 24             	mov    %eax,(%esp)
    5c64:	e8 5f ff ff ff       	call   5bc8 <alloc_buffer>
	bs->buf_byte_idx=0;
    5c69:	8b 45 08             	mov    0x8(%ebp),%eax
    5c6c:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    5c73:	8b 45 08             	mov    0x8(%ebp),%eax
    5c76:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    5c7d:	8b 45 08             	mov    0x8(%ebp),%eax
    5c80:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    5c87:	8b 45 08             	mov    0x8(%ebp),%eax
    5c8a:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    5c91:	8b 45 08             	mov    0x8(%ebp),%eax
    5c94:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    5c9b:	8b 45 08             	mov    0x8(%ebp),%eax
    5c9e:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    5ca5:	c9                   	leave  
    5ca6:	c3                   	ret    

00005ca7 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    5ca7:	55                   	push   %ebp
    5ca8:	89 e5                	mov    %esp,%ebp
    5caa:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    5cad:	8b 45 08             	mov    0x8(%ebp),%eax
    5cb0:	8b 00                	mov    (%eax),%eax
    5cb2:	89 04 24             	mov    %eax,(%esp)
    5cb5:	e8 7b f1 ff ff       	call   4e35 <close>
	desalloc_buffer(bs);
    5cba:	8b 45 08             	mov    0x8(%ebp),%eax
    5cbd:	89 04 24             	mov    %eax,(%esp)
    5cc0:	e8 2d ff ff ff       	call   5bf2 <desalloc_buffer>
}
    5cc5:	c9                   	leave  
    5cc6:	c3                   	ret    

00005cc7 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    5cc7:	55                   	push   %ebp
    5cc8:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    5cca:	8b 45 08             	mov    0x8(%ebp),%eax
    5ccd:	8b 40 20             	mov    0x20(%eax),%eax
}
    5cd0:	5d                   	pop    %ebp
    5cd1:	c3                   	ret    

00005cd2 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    5cd2:	55                   	push   %ebp
    5cd3:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    5cd5:	8b 45 08             	mov    0x8(%ebp),%eax
    5cd8:	8b 40 0c             	mov    0xc(%eax),%eax
}
    5cdb:	5d                   	pop    %ebp
    5cdc:	c3                   	ret    

00005cdd <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    5cdd:	55                   	push   %ebp
    5cde:	89 e5                	mov    %esp,%ebp
    5ce0:	56                   	push   %esi
    5ce1:	53                   	push   %ebx
    5ce2:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    5ce5:	8b 45 08             	mov    0x8(%ebp),%eax
    5ce8:	8b 40 08             	mov    0x8(%eax),%eax
    5ceb:	8d 50 fe             	lea    -0x2(%eax),%edx
    5cee:	8b 45 08             	mov    0x8(%ebp),%eax
    5cf1:	8b 40 10             	mov    0x10(%eax),%eax
    5cf4:	89 d3                	mov    %edx,%ebx
    5cf6:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    5cf8:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    5cfd:	eb 35                	jmp    5d34 <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    5cff:	8b 45 08             	mov    0x8(%ebp),%eax
    5d02:	8b 50 04             	mov    0x4(%eax),%edx
    5d05:	89 d8                	mov    %ebx,%eax
    5d07:	8d 58 ff             	lea    -0x1(%eax),%ebx
    5d0a:	01 c2                	add    %eax,%edx
    5d0c:	8b 45 08             	mov    0x8(%ebp),%eax
    5d0f:	8b 00                	mov    (%eax),%eax
    5d11:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5d18:	00 
    5d19:	89 54 24 04          	mov    %edx,0x4(%esp)
    5d1d:	89 04 24             	mov    %eax,(%esp)
    5d20:	e8 00 f1 ff ff       	call   4e25 <read>
    5d25:	89 c6                	mov    %eax,%esi
		if (!n)
    5d27:	85 f6                	test   %esi,%esi
    5d29:	75 09                	jne    5d34 <refill_buffer+0x57>
		bs->eob= i+1;
    5d2b:	8d 53 01             	lea    0x1(%ebx),%edx
    5d2e:	8b 45 08             	mov    0x8(%ebp),%eax
    5d31:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    5d34:	85 db                	test   %ebx,%ebx
    5d36:	78 0a                	js     5d42 <refill_buffer+0x65>
    5d38:	8b 45 08             	mov    0x8(%ebp),%eax
    5d3b:	8b 40 1c             	mov    0x1c(%eax),%eax
    5d3e:	85 c0                	test   %eax,%eax
    5d40:	74 bd                	je     5cff <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    5d42:	83 c4 10             	add    $0x10,%esp
    5d45:	5b                   	pop    %ebx
    5d46:	5e                   	pop    %esi
    5d47:	5d                   	pop    %ebp
    5d48:	c3                   	ret    

00005d49 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    5d49:	55                   	push   %ebp
    5d4a:	89 e5                	mov    %esp,%ebp
    5d4c:	53                   	push   %ebx
    5d4d:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    5d50:	8b 45 08             	mov    0x8(%ebp),%eax
    5d53:	8b 40 0c             	mov    0xc(%eax),%eax
    5d56:	8d 50 01             	lea    0x1(%eax),%edx
    5d59:	8b 45 08             	mov    0x8(%ebp),%eax
    5d5c:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    5d5f:	8b 45 08             	mov    0x8(%ebp),%eax
    5d62:	8b 40 14             	mov    0x14(%eax),%eax
    5d65:	85 c0                	test   %eax,%eax
    5d67:	0f 85 9f 00 00 00    	jne    5e0c <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    5d6d:	8b 45 08             	mov    0x8(%ebp),%eax
    5d70:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    5d77:	8b 45 08             	mov    0x8(%ebp),%eax
    5d7a:	8b 40 10             	mov    0x10(%eax),%eax
    5d7d:	8d 50 ff             	lea    -0x1(%eax),%edx
    5d80:	8b 45 08             	mov    0x8(%ebp),%eax
    5d83:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    5d86:	8b 45 08             	mov    0x8(%ebp),%eax
    5d89:	8b 40 10             	mov    0x10(%eax),%eax
    5d8c:	83 f8 03             	cmp    $0x3,%eax
    5d8f:	7e 10                	jle    5da1 <get1bit+0x58>
    5d91:	8b 45 08             	mov    0x8(%ebp),%eax
    5d94:	8b 50 10             	mov    0x10(%eax),%edx
    5d97:	8b 45 08             	mov    0x8(%ebp),%eax
    5d9a:	8b 40 1c             	mov    0x1c(%eax),%eax
    5d9d:	39 c2                	cmp    %eax,%edx
    5d9f:	7d 6b                	jge    5e0c <get1bit+0xc3>
             if (bs->eob)
    5da1:	8b 45 08             	mov    0x8(%ebp),%eax
    5da4:	8b 40 1c             	mov    0x1c(%eax),%eax
    5da7:	85 c0                	test   %eax,%eax
    5da9:	74 0c                	je     5db7 <get1bit+0x6e>
                bs->eobs = TRUE;
    5dab:	8b 45 08             	mov    0x8(%ebp),%eax
    5dae:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5db5:	eb 55                	jmp    5e0c <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5db7:	8b 45 08             	mov    0x8(%ebp),%eax
    5dba:	8b 58 10             	mov    0x10(%eax),%ebx
    5dbd:	eb 2f                	jmp    5dee <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5dbf:	8b 45 08             	mov    0x8(%ebp),%eax
    5dc2:	8b 50 04             	mov    0x4(%eax),%edx
    5dc5:	8b 45 08             	mov    0x8(%ebp),%eax
    5dc8:	8b 40 08             	mov    0x8(%eax),%eax
    5dcb:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5dce:	8b 45 08             	mov    0x8(%ebp),%eax
    5dd1:	8b 40 10             	mov    0x10(%eax),%eax
    5dd4:	29 c1                	sub    %eax,%ecx
    5dd6:	89 c8                	mov    %ecx,%eax
    5dd8:	01 d8                	add    %ebx,%eax
    5dda:	01 c2                	add    %eax,%edx
    5ddc:	8b 45 08             	mov    0x8(%ebp),%eax
    5ddf:	8b 48 04             	mov    0x4(%eax),%ecx
    5de2:	89 d8                	mov    %ebx,%eax
    5de4:	01 c8                	add    %ecx,%eax
    5de6:	0f b6 00             	movzbl (%eax),%eax
    5de9:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5deb:	83 eb 01             	sub    $0x1,%ebx
    5dee:	85 db                	test   %ebx,%ebx
    5df0:	79 cd                	jns    5dbf <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    5df2:	8b 45 08             	mov    0x8(%ebp),%eax
    5df5:	89 04 24             	mov    %eax,(%esp)
    5df8:	e8 e0 fe ff ff       	call   5cdd <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    5dfd:	8b 45 08             	mov    0x8(%ebp),%eax
    5e00:	8b 40 08             	mov    0x8(%eax),%eax
    5e03:	8d 50 ff             	lea    -0x1(%eax),%edx
    5e06:	8b 45 08             	mov    0x8(%ebp),%eax
    5e09:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    5e0c:	8b 45 08             	mov    0x8(%ebp),%eax
    5e0f:	8b 50 04             	mov    0x4(%eax),%edx
    5e12:	8b 45 08             	mov    0x8(%ebp),%eax
    5e15:	8b 40 10             	mov    0x10(%eax),%eax
    5e18:	01 d0                	add    %edx,%eax
    5e1a:	0f b6 00             	movzbl (%eax),%eax
    5e1d:	0f b6 d0             	movzbl %al,%edx
    5e20:	8b 45 08             	mov    0x8(%ebp),%eax
    5e23:	8b 40 14             	mov    0x14(%eax),%eax
    5e26:	83 e8 01             	sub    $0x1,%eax
    5e29:	8b 04 85 e0 fe 00 00 	mov    0xfee0(,%eax,4),%eax
    5e30:	21 d0                	and    %edx,%eax
    5e32:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    5e35:	8b 45 08             	mov    0x8(%ebp),%eax
    5e38:	8b 40 14             	mov    0x14(%eax),%eax
    5e3b:	83 e8 01             	sub    $0x1,%eax
    5e3e:	89 c1                	mov    %eax,%ecx
    5e40:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    5e43:	8b 45 08             	mov    0x8(%ebp),%eax
    5e46:	8b 40 14             	mov    0x14(%eax),%eax
    5e49:	8d 50 ff             	lea    -0x1(%eax),%edx
    5e4c:	8b 45 08             	mov    0x8(%ebp),%eax
    5e4f:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    5e52:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5e55:	83 c4 24             	add    $0x24,%esp
    5e58:	5b                   	pop    %ebx
    5e59:	5d                   	pop    %ebp
    5e5a:	c3                   	ret    

00005e5b <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    5e5b:	55                   	push   %ebp
    5e5c:	89 e5                	mov    %esp,%ebp
    5e5e:	57                   	push   %edi
    5e5f:	56                   	push   %esi
    5e60:	53                   	push   %ebx
    5e61:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    5e64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    5e6b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    5e6e:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    5e72:	7e 1c                	jle    5e90 <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    5e74:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    5e7b:	00 
    5e7c:	c7 44 24 04 fc be 00 	movl   $0xbefc,0x4(%esp)
    5e83:	00 
    5e84:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5e8b:	e8 65 f1 ff ff       	call   4ff5 <printf>

	bs->totbit += N;
    5e90:	8b 45 08             	mov    0x8(%ebp),%eax
    5e93:	8b 50 0c             	mov    0xc(%eax),%edx
    5e96:	8b 45 0c             	mov    0xc(%ebp),%eax
    5e99:	01 c2                	add    %eax,%edx
    5e9b:	8b 45 08             	mov    0x8(%ebp),%eax
    5e9e:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    5ea1:	e9 0a 01 00 00       	jmp    5fb0 <getbits+0x155>
		if (!bs->buf_bit_idx) {
    5ea6:	8b 45 08             	mov    0x8(%ebp),%eax
    5ea9:	8b 40 14             	mov    0x14(%eax),%eax
    5eac:	85 c0                	test   %eax,%eax
    5eae:	0f 85 9f 00 00 00    	jne    5f53 <getbits+0xf8>
			bs->buf_bit_idx = 8;
    5eb4:	8b 45 08             	mov    0x8(%ebp),%eax
    5eb7:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    5ebe:	8b 45 08             	mov    0x8(%ebp),%eax
    5ec1:	8b 40 10             	mov    0x10(%eax),%eax
    5ec4:	8d 50 ff             	lea    -0x1(%eax),%edx
    5ec7:	8b 45 08             	mov    0x8(%ebp),%eax
    5eca:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    5ecd:	8b 45 08             	mov    0x8(%ebp),%eax
    5ed0:	8b 40 10             	mov    0x10(%eax),%eax
    5ed3:	83 f8 03             	cmp    $0x3,%eax
    5ed6:	7e 10                	jle    5ee8 <getbits+0x8d>
    5ed8:	8b 45 08             	mov    0x8(%ebp),%eax
    5edb:	8b 50 10             	mov    0x10(%eax),%edx
    5ede:	8b 45 08             	mov    0x8(%ebp),%eax
    5ee1:	8b 40 1c             	mov    0x1c(%eax),%eax
    5ee4:	39 c2                	cmp    %eax,%edx
    5ee6:	7d 6b                	jge    5f53 <getbits+0xf8>
				if (bs->eob)
    5ee8:	8b 45 08             	mov    0x8(%ebp),%eax
    5eeb:	8b 40 1c             	mov    0x1c(%eax),%eax
    5eee:	85 c0                	test   %eax,%eax
    5ef0:	74 0c                	je     5efe <getbits+0xa3>
					bs->eobs = TRUE;
    5ef2:	8b 45 08             	mov    0x8(%ebp),%eax
    5ef5:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5efc:	eb 55                	jmp    5f53 <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    5efe:	8b 45 08             	mov    0x8(%ebp),%eax
    5f01:	8b 70 10             	mov    0x10(%eax),%esi
    5f04:	eb 2f                	jmp    5f35 <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5f06:	8b 45 08             	mov    0x8(%ebp),%eax
    5f09:	8b 50 04             	mov    0x4(%eax),%edx
    5f0c:	8b 45 08             	mov    0x8(%ebp),%eax
    5f0f:	8b 40 08             	mov    0x8(%eax),%eax
    5f12:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5f15:	8b 45 08             	mov    0x8(%ebp),%eax
    5f18:	8b 40 10             	mov    0x10(%eax),%eax
    5f1b:	29 c1                	sub    %eax,%ecx
    5f1d:	89 c8                	mov    %ecx,%eax
    5f1f:	01 f0                	add    %esi,%eax
    5f21:	01 c2                	add    %eax,%edx
    5f23:	8b 45 08             	mov    0x8(%ebp),%eax
    5f26:	8b 48 04             	mov    0x4(%eax),%ecx
    5f29:	89 f0                	mov    %esi,%eax
    5f2b:	01 c8                	add    %ecx,%eax
    5f2d:	0f b6 00             	movzbl (%eax),%eax
    5f30:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    5f32:	83 ee 01             	sub    $0x1,%esi
    5f35:	85 f6                	test   %esi,%esi
    5f37:	79 cd                	jns    5f06 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    5f39:	8b 45 08             	mov    0x8(%ebp),%eax
    5f3c:	89 04 24             	mov    %eax,(%esp)
    5f3f:	e8 99 fd ff ff       	call   5cdd <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    5f44:	8b 45 08             	mov    0x8(%ebp),%eax
    5f47:	8b 40 08             	mov    0x8(%eax),%eax
    5f4a:	8d 50 ff             	lea    -0x1(%eax),%edx
    5f4d:	8b 45 08             	mov    0x8(%ebp),%eax
    5f50:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    5f53:	8b 45 08             	mov    0x8(%ebp),%eax
    5f56:	8b 40 14             	mov    0x14(%eax),%eax
    5f59:	39 d8                	cmp    %ebx,%eax
    5f5b:	0f 4f c3             	cmovg  %ebx,%eax
    5f5e:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    5f60:	8b 45 08             	mov    0x8(%ebp),%eax
    5f63:	8b 50 04             	mov    0x4(%eax),%edx
    5f66:	8b 45 08             	mov    0x8(%ebp),%eax
    5f69:	8b 40 10             	mov    0x10(%eax),%eax
    5f6c:	01 d0                	add    %edx,%eax
    5f6e:	0f b6 00             	movzbl (%eax),%eax
    5f71:	0f b6 d0             	movzbl %al,%edx
    5f74:	8b 45 08             	mov    0x8(%ebp),%eax
    5f77:	8b 40 14             	mov    0x14(%eax),%eax
    5f7a:	8b 04 85 00 ff 00 00 	mov    0xff00(,%eax,4),%eax
    5f81:	89 d7                	mov    %edx,%edi
    5f83:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    5f85:	8b 45 08             	mov    0x8(%ebp),%eax
    5f88:	8b 40 14             	mov    0x14(%eax),%eax
    5f8b:	29 f0                	sub    %esi,%eax
    5f8d:	89 c1                	mov    %eax,%ecx
    5f8f:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    5f91:	89 d8                	mov    %ebx,%eax
    5f93:	29 f0                	sub    %esi,%eax
    5f95:	89 c1                	mov    %eax,%ecx
    5f97:	d3 e7                	shl    %cl,%edi
    5f99:	89 f8                	mov    %edi,%eax
    5f9b:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    5f9e:	8b 45 08             	mov    0x8(%ebp),%eax
    5fa1:	8b 40 14             	mov    0x14(%eax),%eax
    5fa4:	29 f0                	sub    %esi,%eax
    5fa6:	89 c2                	mov    %eax,%edx
    5fa8:	8b 45 08             	mov    0x8(%ebp),%eax
    5fab:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    5fae:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    5fb0:	85 db                	test   %ebx,%ebx
    5fb2:	0f 8f ee fe ff ff    	jg     5ea6 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    5fb8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    5fbb:	83 c4 2c             	add    $0x2c,%esp
    5fbe:	5b                   	pop    %ebx
    5fbf:	5e                   	pop    %esi
    5fc0:	5f                   	pop    %edi
    5fc1:	5d                   	pop    %ebp
    5fc2:	c3                   	ret    

00005fc3 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    5fc3:	55                   	push   %ebp
    5fc4:	89 e5                	mov    %esp,%ebp
    5fc6:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    5fc9:	db 45 10             	fildl  0x10(%ebp)
    5fcc:	dd 5c 24 08          	fstpl  0x8(%esp)
    5fd0:	dd 05 68 bf 00 00    	fldl   0xbf68
    5fd6:	dd 1c 24             	fstpl  (%esp)
    5fd9:	e8 ec f4 ff ff       	call   54ca <pow>
    5fde:	d9 7d e6             	fnstcw -0x1a(%ebp)
    5fe1:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    5fe5:	b4 0c                	mov    $0xc,%ah
    5fe7:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    5feb:	d9 6d e4             	fldcw  -0x1c(%ebp)
    5fee:	db 5d e0             	fistpl -0x20(%ebp)
    5ff1:	d9 6d e6             	fldcw  -0x1a(%ebp)
    5ff4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5ff7:	83 e8 01             	sub    $0x1,%eax
    5ffa:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    5ffd:	8b 45 08             	mov    0x8(%ebp),%eax
    6000:	89 04 24             	mov    %eax,(%esp)
    6003:	e8 ca fc ff ff       	call   5cd2 <sstell>
    6008:	83 e0 07             	and    $0x7,%eax
    600b:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    600e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6012:	74 17                	je     602b <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    6014:	b8 08 00 00 00       	mov    $0x8,%eax
    6019:	2b 45 ec             	sub    -0x14(%ebp),%eax
    601c:	89 44 24 04          	mov    %eax,0x4(%esp)
    6020:	8b 45 08             	mov    0x8(%ebp),%eax
    6023:	89 04 24             	mov    %eax,(%esp)
    6026:	e8 30 fe ff ff       	call   5e5b <getbits>

	val = getbits(bs, N);
    602b:	8b 45 10             	mov    0x10(%ebp),%eax
    602e:	89 44 24 04          	mov    %eax,0x4(%esp)
    6032:	8b 45 08             	mov    0x8(%ebp),%eax
    6035:	89 04 24             	mov    %eax,(%esp)
    6038:	e8 1e fe ff ff       	call   5e5b <getbits>
    603d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    6040:	eb 1a                	jmp    605c <seek_sync+0x99>
		val <<= ALIGNING;
    6042:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    6046:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    604d:	00 
    604e:	8b 45 08             	mov    0x8(%ebp),%eax
    6051:	89 04 24             	mov    %eax,(%esp)
    6054:	e8 02 fe ff ff       	call   5e5b <getbits>
    6059:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    605c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    605f:	23 45 f4             	and    -0xc(%ebp),%eax
    6062:	3b 45 0c             	cmp    0xc(%ebp),%eax
    6065:	74 0f                	je     6076 <seek_sync+0xb3>
    6067:	8b 45 08             	mov    0x8(%ebp),%eax
    606a:	89 04 24             	mov    %eax,(%esp)
    606d:	e8 55 fc ff ff       	call   5cc7 <end_bs>
    6072:	85 c0                	test   %eax,%eax
    6074:	74 cc                	je     6042 <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    6076:	8b 45 08             	mov    0x8(%ebp),%eax
    6079:	89 04 24             	mov    %eax,(%esp)
    607c:	e8 46 fc ff ff       	call   5cc7 <end_bs>
    6081:	85 c0                	test   %eax,%eax
    6083:	74 07                	je     608c <seek_sync+0xc9>
		return(0);
    6085:	b8 00 00 00 00       	mov    $0x0,%eax
    608a:	eb 05                	jmp    6091 <seek_sync+0xce>
	else
		return(1);
    608c:	b8 01 00 00 00       	mov    $0x1,%eax
}
    6091:	c9                   	leave  
    6092:	c3                   	ret    

00006093 <js_bound>:

int js_bound(int lay, int m_ext)
{
    6093:	55                   	push   %ebp
    6094:	89 e5                	mov    %esp,%ebp
    6096:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    6099:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    609d:	7e 12                	jle    60b1 <js_bound+0x1e>
    609f:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    60a3:	7f 0c                	jg     60b1 <js_bound+0x1e>
    60a5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    60a9:	78 06                	js     60b1 <js_bound+0x1e>
    60ab:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    60af:	7e 27                	jle    60d8 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    60b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    60b4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    60b8:	8b 45 08             	mov    0x8(%ebp),%eax
    60bb:	89 44 24 08          	mov    %eax,0x8(%esp)
    60bf:	c7 44 24 04 30 bf 00 	movl   $0xbf30,0x4(%esp)
    60c6:	00 
    60c7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    60ce:	e8 22 ef ff ff       	call   4ff5 <printf>
        exit();
    60d3:	e8 35 ed ff ff       	call   4e0d <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    60d8:	8b 45 08             	mov    0x8(%ebp),%eax
    60db:	83 e8 01             	sub    $0x1,%eax
    60de:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    60e5:	8b 45 0c             	mov    0xc(%ebp),%eax
    60e8:	01 d0                	add    %edx,%eax
    60ea:	8b 04 85 40 ff 00 00 	mov    0xff40(,%eax,4),%eax
}
    60f1:	c9                   	leave  
    60f2:	c3                   	ret    

000060f3 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    60f3:	55                   	push   %ebp
    60f4:	89 e5                	mov    %esp,%ebp
    60f6:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    60f9:	8b 45 08             	mov    0x8(%ebp),%eax
    60fc:	8b 00                	mov    (%eax),%eax
    60fe:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    6101:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6104:	8b 50 1c             	mov    0x1c(%eax),%edx
    6107:	8b 45 08             	mov    0x8(%ebp),%eax
    610a:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    610d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6110:	8b 40 1c             	mov    0x1c(%eax),%eax
    6113:	83 f8 03             	cmp    $0x3,%eax
    6116:	75 07                	jne    611f <hdr_to_frps+0x2c>
    6118:	b8 01 00 00 00       	mov    $0x1,%eax
    611d:	eb 05                	jmp    6124 <hdr_to_frps+0x31>
    611f:	b8 02 00 00 00       	mov    $0x2,%eax
    6124:	8b 55 08             	mov    0x8(%ebp),%edx
    6127:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    612a:	8b 45 08             	mov    0x8(%ebp),%eax
    612d:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    6134:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6137:	8b 40 1c             	mov    0x1c(%eax),%eax
    613a:	83 f8 01             	cmp    $0x1,%eax
    613d:	75 20                	jne    615f <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    613f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6142:	8b 50 20             	mov    0x20(%eax),%edx
    6145:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6148:	8b 40 04             	mov    0x4(%eax),%eax
    614b:	89 54 24 04          	mov    %edx,0x4(%esp)
    614f:	89 04 24             	mov    %eax,(%esp)
    6152:	e8 3c ff ff ff       	call   6093 <js_bound>
    6157:	8b 55 08             	mov    0x8(%ebp),%edx
    615a:	89 42 0c             	mov    %eax,0xc(%edx)
    615d:	eb 0c                	jmp    616b <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    615f:	8b 45 08             	mov    0x8(%ebp),%eax
    6162:	8b 50 10             	mov    0x10(%eax),%edx
    6165:	8b 45 08             	mov    0x8(%ebp),%eax
    6168:	89 50 0c             	mov    %edx,0xc(%eax)
}
    616b:	c9                   	leave  
    616c:	c3                   	ret    

0000616d <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    616d:	55                   	push   %ebp
    616e:	89 e5                	mov    %esp,%ebp
    6170:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    6173:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    6177:	74 19                	je     6192 <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    6179:	c7 44 24 04 53 bf 00 	movl   $0xbf53,0x4(%esp)
    6180:	00 
    6181:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6188:	e8 68 ee ff ff       	call   4ff5 <printf>
		exit();
    618d:	e8 7b ec ff ff       	call   4e0d <exit>
	}
	getCoreBuf(1, val);
    6192:	8b 45 08             	mov    0x8(%ebp),%eax
    6195:	89 44 24 04          	mov    %eax,0x4(%esp)
    6199:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    61a0:	e8 68 ed ff ff       	call   4f0d <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    61a5:	c9                   	leave  
    61a6:	c3                   	ret    

000061a7 <hsstell>:

unsigned long hsstell()
{
    61a7:	55                   	push   %ebp
    61a8:	89 e5                	mov    %esp,%ebp
    61aa:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    61ad:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    61b4:	00 
    61b5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    61bc:	e8 4c ed ff ff       	call   4f0d <getCoreBuf>
//	return(totbit);
}
    61c1:	c9                   	leave  
    61c2:	c3                   	ret    

000061c3 <hgetbits>:

unsigned long hgetbits(int N)
{
    61c3:	55                   	push   %ebp
    61c4:	89 e5                	mov    %esp,%ebp
    61c6:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    61c9:	8b 45 08             	mov    0x8(%ebp),%eax
    61cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    61d0:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    61d7:	e8 31 ed ff ff       	call   4f0d <getCoreBuf>
}
    61dc:	c9                   	leave  
    61dd:	c3                   	ret    

000061de <hget1bit>:


unsigned int hget1bit()
{
    61de:	55                   	push   %ebp
    61df:	89 e5                	mov    %esp,%ebp
    61e1:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    61e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    61eb:	e8 d3 ff ff ff       	call   61c3 <hgetbits>
}
    61f0:	c9                   	leave  
    61f1:	c3                   	ret    

000061f2 <rewindNbits>:


void rewindNbits(int N)
{
    61f2:	55                   	push   %ebp
    61f3:	89 e5                	mov    %esp,%ebp
    61f5:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    61f8:	8b 45 08             	mov    0x8(%ebp),%eax
    61fb:	89 44 24 04          	mov    %eax,0x4(%esp)
    61ff:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    6206:	e8 02 ed ff ff       	call   4f0d <getCoreBuf>
}
    620b:	c9                   	leave  
    620c:	c3                   	ret    

0000620d <rewindNbytes>:


void rewindNbytes(int N)
{
    620d:	55                   	push   %ebp
    620e:	89 e5                	mov    %esp,%ebp
    6210:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    6213:	8b 45 08             	mov    0x8(%ebp),%eax
    6216:	89 44 24 04          	mov    %eax,0x4(%esp)
    621a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    6221:	e8 e7 ec ff ff       	call   4f0d <getCoreBuf>
}
    6226:	c9                   	leave  
    6227:	c3                   	ret    

00006228 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    6228:	55                   	push   %ebp
    6229:	89 e5                	mov    %esp,%ebp
    622b:	57                   	push   %edi
    622c:	56                   	push   %esi
    622d:	53                   	push   %ebx
    622e:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    6234:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    6238:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    623c:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    6240:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    6244:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    6248:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    624c:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    6250:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    6254:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    6258:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    625c:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    6260:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    6264:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    6268:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    626c:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    6270:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    6274:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    6278:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    627c:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    6280:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    6284:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    6288:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    628c:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    6290:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    6294:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    6298:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    629c:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    62a0:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    62a4:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    62a8:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    62ac:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    62b0:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    62b4:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    62b8:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    62bc:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    62c0:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    62c4:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    62c8:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    62cc:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    62d0:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    62d4:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    62d8:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    62dc:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    62e0:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    62e4:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    62e8:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    62ec:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    62f0:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    62f4:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    62f8:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    62fc:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    6300:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    6304:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    6308:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    630c:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    6310:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    6314:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    6318:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    631c:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    6320:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    6324:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    6328:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    632c:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    6330:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    6334:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    6338:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    633c:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    6340:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    6344:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    6348:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    634c:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    6350:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    6354:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    6358:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    635c:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    6360:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    6364:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    6368:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    636c:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    6370:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    6374:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    6378:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    637c:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    6383:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    638a:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    6391:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    6398:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    639f:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    63a6:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    63ad:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    63b4:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    63bb:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    63c2:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    63c9:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    63d0:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    63d7:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    63de:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    63e5:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    63ec:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    63f3:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    63fa:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    6401:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    6408:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    640f:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    6416:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    641d:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    6424:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    642b:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    6432:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    6439:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    6440:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    6444:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    6448:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    644c:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    6450:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    6454:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    6458:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    645c:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    6460:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    6464:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    6468:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    646c:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    6470:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    6474:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    6478:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    647c:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    6480:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    6484:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    6488:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    648c:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    6490:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    6494:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    6498:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    649c:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    64a0:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    64a4:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    64a8:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    64ac:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    64b0:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    64b4:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    64b8:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    64bc:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    64c0:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    64c4:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    64c8:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    64cf:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    64d6:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    64dd:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    64e4:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    64eb:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    64f2:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    64f9:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    6500:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    6507:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    650e:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    6515:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    651c:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    6523:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    652a:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    6531:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    6538:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    653f:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    6546:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    654d:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    6554:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    655b:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    6562:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    6569:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    6570:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    6577:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    657e:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    6585:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    658c:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    6593:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    659a:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    65a1:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    65a8:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    65af:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    65b6:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    65bd:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    65c4:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    65cb:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    65d2:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    65d9:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    65e0:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    65e7:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    65ee:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    65f5:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    65fc:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    6603:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    660a:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    6611:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    6618:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    661f:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    6626:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    662d:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    6634:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    663b:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    6642:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    6649:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    6650:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    6657:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    665e:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    6665:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    666c:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    6673:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    667a:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    6680:	b8 80 bf 00 00       	mov    $0xbf80,%eax
    6685:	b9 23 00 00 00       	mov    $0x23,%ecx
    668a:	89 d7                	mov    %edx,%edi
    668c:	89 c6                	mov    %eax,%esi
    668e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6690:	89 f0                	mov    %esi,%eax
    6692:	89 fa                	mov    %edi,%edx
    6694:	0f b7 08             	movzwl (%eax),%ecx
    6697:	66 89 0a             	mov    %cx,(%edx)
    669a:	83 c2 02             	add    $0x2,%edx
    669d:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    66a0:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    66a6:	ba 20 c0 00 00       	mov    $0xc020,%edx
    66ab:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    66b0:	89 c1                	mov    %eax,%ecx
    66b2:	83 e1 02             	and    $0x2,%ecx
    66b5:	85 c9                	test   %ecx,%ecx
    66b7:	74 0f                	je     66c8 <read_decoder_table+0x4a0>
    66b9:	0f b7 0a             	movzwl (%edx),%ecx
    66bc:	66 89 08             	mov    %cx,(%eax)
    66bf:	83 c0 02             	add    $0x2,%eax
    66c2:	83 c2 02             	add    $0x2,%edx
    66c5:	83 eb 02             	sub    $0x2,%ebx
    66c8:	89 d9                	mov    %ebx,%ecx
    66ca:	c1 e9 02             	shr    $0x2,%ecx
    66cd:	89 c7                	mov    %eax,%edi
    66cf:	89 d6                	mov    %edx,%esi
    66d1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    66d3:	89 f2                	mov    %esi,%edx
    66d5:	89 f8                	mov    %edi,%eax
    66d7:	b9 00 00 00 00       	mov    $0x0,%ecx
    66dc:	89 de                	mov    %ebx,%esi
    66de:	83 e6 02             	and    $0x2,%esi
    66e1:	85 f6                	test   %esi,%esi
    66e3:	74 0b                	je     66f0 <read_decoder_table+0x4c8>
    66e5:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    66e9:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    66ed:	83 c1 02             	add    $0x2,%ecx
    66f0:	83 e3 01             	and    $0x1,%ebx
    66f3:	85 db                	test   %ebx,%ebx
    66f5:	74 07                	je     66fe <read_decoder_table+0x4d6>
    66f7:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    66fb:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    66fe:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    6704:	b8 c0 c0 00 00       	mov    $0xc0c0,%eax
    6709:	b9 23 00 00 00       	mov    $0x23,%ecx
    670e:	89 d7                	mov    %edx,%edi
    6710:	89 c6                	mov    %eax,%esi
    6712:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6714:	89 f0                	mov    %esi,%eax
    6716:	89 fa                	mov    %edi,%edx
    6718:	0f b7 08             	movzwl (%eax),%ecx
    671b:	66 89 0a             	mov    %cx,(%edx)
    671e:	83 c2 02             	add    $0x2,%edx
    6721:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    6724:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    672a:	ba 60 c1 00 00       	mov    $0xc160,%edx
    672f:	bb fe 00 00 00       	mov    $0xfe,%ebx
    6734:	89 c1                	mov    %eax,%ecx
    6736:	83 e1 02             	and    $0x2,%ecx
    6739:	85 c9                	test   %ecx,%ecx
    673b:	74 0f                	je     674c <read_decoder_table+0x524>
    673d:	0f b7 0a             	movzwl (%edx),%ecx
    6740:	66 89 08             	mov    %cx,(%eax)
    6743:	83 c0 02             	add    $0x2,%eax
    6746:	83 c2 02             	add    $0x2,%edx
    6749:	83 eb 02             	sub    $0x2,%ebx
    674c:	89 d9                	mov    %ebx,%ecx
    674e:	c1 e9 02             	shr    $0x2,%ecx
    6751:	89 c7                	mov    %eax,%edi
    6753:	89 d6                	mov    %edx,%esi
    6755:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6757:	89 f2                	mov    %esi,%edx
    6759:	89 f8                	mov    %edi,%eax
    675b:	b9 00 00 00 00       	mov    $0x0,%ecx
    6760:	89 de                	mov    %ebx,%esi
    6762:	83 e6 02             	and    $0x2,%esi
    6765:	85 f6                	test   %esi,%esi
    6767:	74 0b                	je     6774 <read_decoder_table+0x54c>
    6769:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    676d:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6771:	83 c1 02             	add    $0x2,%ecx
    6774:	83 e3 01             	and    $0x1,%ebx
    6777:	85 db                	test   %ebx,%ebx
    6779:	74 07                	je     6782 <read_decoder_table+0x55a>
    677b:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    677f:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    6782:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    6788:	b8 60 c2 00 00       	mov    $0xc260,%eax
    678d:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    6792:	89 d7                	mov    %edx,%edi
    6794:	89 c6                	mov    %eax,%esi
    6796:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6798:	89 f0                	mov    %esi,%eax
    679a:	89 fa                	mov    %edi,%edx
    679c:	0f b7 08             	movzwl (%eax),%ecx
    679f:	66 89 0a             	mov    %cx,(%edx)
    67a2:	83 c2 02             	add    $0x2,%edx
    67a5:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    67a8:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    67ae:	ba 60 c3 00 00       	mov    $0xc360,%edx
    67b3:	bb fe 00 00 00       	mov    $0xfe,%ebx
    67b8:	89 c1                	mov    %eax,%ecx
    67ba:	83 e1 02             	and    $0x2,%ecx
    67bd:	85 c9                	test   %ecx,%ecx
    67bf:	74 0f                	je     67d0 <read_decoder_table+0x5a8>
    67c1:	0f b7 0a             	movzwl (%edx),%ecx
    67c4:	66 89 08             	mov    %cx,(%eax)
    67c7:	83 c0 02             	add    $0x2,%eax
    67ca:	83 c2 02             	add    $0x2,%edx
    67cd:	83 eb 02             	sub    $0x2,%ebx
    67d0:	89 d9                	mov    %ebx,%ecx
    67d2:	c1 e9 02             	shr    $0x2,%ecx
    67d5:	89 c7                	mov    %eax,%edi
    67d7:	89 d6                	mov    %edx,%esi
    67d9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    67db:	89 f2                	mov    %esi,%edx
    67dd:	89 f8                	mov    %edi,%eax
    67df:	b9 00 00 00 00       	mov    $0x0,%ecx
    67e4:	89 de                	mov    %ebx,%esi
    67e6:	83 e6 02             	and    $0x2,%esi
    67e9:	85 f6                	test   %esi,%esi
    67eb:	74 0b                	je     67f8 <read_decoder_table+0x5d0>
    67ed:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    67f1:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    67f5:	83 c1 02             	add    $0x2,%ecx
    67f8:	83 e3 01             	and    $0x1,%ebx
    67fb:	85 db                	test   %ebx,%ebx
    67fd:	74 07                	je     6806 <read_decoder_table+0x5de>
    67ff:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6803:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    6806:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    680c:	b8 60 c4 00 00       	mov    $0xc460,%eax
    6811:	b9 ff 00 00 00       	mov    $0xff,%ecx
    6816:	89 d7                	mov    %edx,%edi
    6818:	89 c6                	mov    %eax,%esi
    681a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    681c:	89 f0                	mov    %esi,%eax
    681e:	89 fa                	mov    %edi,%edx
    6820:	0f b7 08             	movzwl (%eax),%ecx
    6823:	66 89 0a             	mov    %cx,(%edx)
    6826:	83 c2 02             	add    $0x2,%edx
    6829:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    682c:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    6832:	ba 60 c8 00 00       	mov    $0xc860,%edx
    6837:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    683c:	89 c1                	mov    %eax,%ecx
    683e:	83 e1 02             	and    $0x2,%ecx
    6841:	85 c9                	test   %ecx,%ecx
    6843:	74 0f                	je     6854 <read_decoder_table+0x62c>
    6845:	0f b7 0a             	movzwl (%edx),%ecx
    6848:	66 89 08             	mov    %cx,(%eax)
    684b:	83 c0 02             	add    $0x2,%eax
    684e:	83 c2 02             	add    $0x2,%edx
    6851:	83 eb 02             	sub    $0x2,%ebx
    6854:	89 d9                	mov    %ebx,%ecx
    6856:	c1 e9 02             	shr    $0x2,%ecx
    6859:	89 c7                	mov    %eax,%edi
    685b:	89 d6                	mov    %edx,%esi
    685d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    685f:	89 f2                	mov    %esi,%edx
    6861:	89 f8                	mov    %edi,%eax
    6863:	b9 00 00 00 00       	mov    $0x0,%ecx
    6868:	89 de                	mov    %ebx,%esi
    686a:	83 e6 02             	and    $0x2,%esi
    686d:	85 f6                	test   %esi,%esi
    686f:	74 0b                	je     687c <read_decoder_table+0x654>
    6871:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    6875:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6879:	83 c1 02             	add    $0x2,%ecx
    687c:	83 e3 01             	and    $0x1,%ebx
    687f:	85 db                	test   %ebx,%ebx
    6881:	74 07                	je     688a <read_decoder_table+0x662>
    6883:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6887:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    688a:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    6890:	b8 60 cc 00 00       	mov    $0xcc60,%eax
    6895:	b9 ff 00 00 00       	mov    $0xff,%ecx
    689a:	89 d7                	mov    %edx,%edi
    689c:	89 c6                	mov    %eax,%esi
    689e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    68a0:	89 f0                	mov    %esi,%eax
    68a2:	89 fa                	mov    %edi,%edx
    68a4:	0f b7 08             	movzwl (%eax),%ecx
    68a7:	66 89 0a             	mov    %cx,(%edx)
    68aa:	83 c2 02             	add    $0x2,%edx
    68ad:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    68b0:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    68b6:	bb 60 d0 00 00       	mov    $0xd060,%ebx
    68bb:	b8 00 01 00 00       	mov    $0x100,%eax
    68c0:	89 d7                	mov    %edx,%edi
    68c2:	89 de                	mov    %ebx,%esi
    68c4:	89 c1                	mov    %eax,%ecx
    68c6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    68c8:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    68cf:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    68d6:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    68dd:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    68e4:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    68eb:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    68f2:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    68f9:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    6900:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    6907:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    690e:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    6915:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    691c:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    6923:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    692a:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    6931:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    6938:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    693f:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    6946:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    694d:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    6954:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    695b:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    6962:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    6969:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    6970:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    6977:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    697e:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    6985:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    698c:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    6993:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    699a:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    69a1:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    69a8:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    69af:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    69b6:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    69bd:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    69c4:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    69cb:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    69d2:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    69d9:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    69e0:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    69e7:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    69ee:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    69f5:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    69fc:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    6a03:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    6a0a:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    6a11:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    6a18:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    6a1f:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    6a26:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    6a2d:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    6a34:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    6a3b:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    6a42:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    6a49:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    6a50:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    6a57:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    6a5e:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    6a65:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    6a6c:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    6a73:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    6a7a:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    6a81:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    6a88:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    6a8f:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    6a96:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    6a9d:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    6aa4:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    6aab:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    6ab2:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    6ab9:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    6ac0:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    6ac7:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    6ace:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    6ad5:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    6adc:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    6ae3:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    6aea:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    6af1:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    6af8:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    6aff:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    6b06:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    6b0d:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    6b14:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    6b1b:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    6b22:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    6b29:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    6b30:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    6b37:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    6b3e:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    6b45:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    6b4c:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    6b53:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    6b5a:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    6b61:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    6b68:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    6b6f:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    6b76:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    6b7d:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    6b84:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    6b8b:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    6b92:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    6b99:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    6ba0:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    6ba7:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    6bae:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    6bb5:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    6bbc:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    6bc3:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    6bca:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    6bd1:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    6bd8:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    6bdf:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    6be6:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    6bed:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    6bf4:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    6bfb:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    6c02:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    6c09:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    6c10:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    6c17:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    6c1e:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    6c25:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    6c2c:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    6c33:	30 00 
    6c35:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    6c3c:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    6c43:	00 00 00 
    6c46:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    6c4d:	00 00 00 
    6c50:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    6c57:	00 00 00 
    6c5a:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    6c61:	00 00 00 
    6c64:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    6c6b:	ff ff ff 
    6c6e:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    6c75:	00 00 00 
    6c78:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    6c7f:	00 00 00 
    6c82:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    6c89:	00 00 00 
    6c8c:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    6c93:	00 00 00 
    6c96:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    6c9d:	31 00 
    6c9f:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    6ca6:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    6cad:	00 00 00 
    6cb0:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    6cb7:	00 00 00 
    6cba:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    6cc1:	00 00 00 
    6cc4:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    6ccb:	00 00 00 
    6cce:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    6cd5:	ff ff ff 
    6cd8:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    6cdf:	00 00 00 
    6ce2:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    6ce9:	00 00 00 
    6cec:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    6cef:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    6cf5:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    6cfc:	00 00 00 
    6cff:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    6d06:	32 00 
    6d08:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    6d0f:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    6d16:	00 00 00 
    6d19:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    6d20:	00 00 00 
    6d23:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    6d2a:	00 00 00 
    6d2d:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    6d34:	00 00 00 
    6d37:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    6d3e:	ff ff ff 
    6d41:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    6d48:	00 00 00 
    6d4b:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    6d52:	00 00 00 
    6d55:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    6d58:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    6d5e:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    6d65:	00 00 00 
    6d68:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    6d6f:	33 00 
    6d71:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    6d78:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    6d7f:	00 00 00 
    6d82:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    6d89:	00 00 00 
    6d8c:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    6d93:	00 00 00 
    6d96:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    6d9d:	00 00 00 
    6da0:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    6da7:	ff ff ff 
    6daa:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    6db1:	00 00 00 
    6db4:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    6dbb:	00 00 00 
    6dbe:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    6dc1:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    6dc7:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    6dce:	00 00 00 
    6dd1:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    6dd8:	34 00 
    6dda:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    6de1:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    6de8:	00 00 00 
    6deb:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    6df2:	00 00 00 
    6df5:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    6dfc:	00 00 00 
    6dff:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    6e06:	00 00 00 
    6e09:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    6e10:	ff ff ff 
    6e13:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    6e1a:	00 00 00 
    6e1d:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    6e24:	00 00 00 
    6e27:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    6e2e:	00 00 00 
    6e31:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    6e38:	00 00 00 
    6e3b:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    6e42:	35 00 
    6e44:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    6e4b:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    6e52:	00 00 00 
    6e55:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    6e5c:	00 00 00 
    6e5f:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    6e66:	00 00 00 
    6e69:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    6e70:	00 00 00 
    6e73:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    6e7a:	ff ff ff 
    6e7d:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    6e84:	00 00 00 
    6e87:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    6e8e:	00 00 00 
    6e91:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    6e97:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    6e9d:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    6ea4:	00 00 00 
    6ea7:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    6eae:	36 00 
    6eb0:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    6eb7:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    6ebe:	00 00 00 
    6ec1:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    6ec8:	00 00 00 
    6ecb:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    6ed2:	00 00 00 
    6ed5:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    6edc:	00 00 00 
    6edf:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    6ee6:	ff ff ff 
    6ee9:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    6ef0:	00 00 00 
    6ef3:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    6efa:	00 00 00 
    6efd:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    6f03:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    6f09:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    6f10:	00 00 00 
    6f13:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    6f1a:	37 00 
    6f1c:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    6f23:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    6f2a:	00 00 00 
    6f2d:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    6f34:	00 00 00 
    6f37:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    6f3e:	00 00 00 
    6f41:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    6f48:	00 00 00 
    6f4b:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    6f52:	ff ff ff 
    6f55:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    6f5c:	00 00 00 
    6f5f:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    6f66:	00 00 00 
    6f69:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    6f6f:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    6f75:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    6f7c:	00 00 00 
    6f7f:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    6f86:	38 00 
    6f88:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    6f8f:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    6f96:	00 00 00 
    6f99:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    6fa0:	00 00 00 
    6fa3:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    6faa:	00 00 00 
    6fad:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    6fb4:	00 00 00 
    6fb7:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    6fbe:	ff ff ff 
    6fc1:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    6fc8:	00 00 00 
    6fcb:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    6fd2:	00 00 00 
    6fd5:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    6fdb:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    6fe1:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    6fe8:	00 00 00 
    6feb:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    6ff2:	39 00 
    6ff4:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    6ffb:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    7002:	00 00 00 
    7005:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    700c:	00 00 00 
    700f:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    7016:	00 00 00 
    7019:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    7020:	00 00 00 
    7023:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    702a:	ff ff ff 
    702d:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    7034:	00 00 00 
    7037:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    703e:	00 00 00 
    7041:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    7047:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    704d:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    7054:	00 00 00 
    7057:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    705e:	31 30 
    7060:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    7067:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    706e:	00 00 00 
    7071:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    7078:	00 00 00 
    707b:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    7082:	00 00 00 
    7085:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    708c:	00 00 00 
    708f:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    7096:	ff ff ff 
    7099:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    70a0:	00 00 00 
    70a3:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    70aa:	00 00 00 
    70ad:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    70b3:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    70b9:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    70c0:	00 00 00 
    70c3:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    70ca:	31 31 
    70cc:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    70d3:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    70da:	00 00 00 
    70dd:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    70e4:	00 00 00 
    70e7:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    70ee:	00 00 00 
    70f1:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    70f8:	00 00 00 
    70fb:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    7102:	ff ff ff 
    7105:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    710c:	00 00 00 
    710f:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    7116:	00 00 00 
    7119:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    711f:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    7125:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    712c:	00 00 00 
    712f:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    7136:	31 32 
    7138:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    713f:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    7146:	00 00 00 
    7149:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    7150:	00 00 00 
    7153:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    715a:	00 00 00 
    715d:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    7164:	00 00 00 
    7167:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    716e:	ff ff ff 
    7171:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    7178:	00 00 00 
    717b:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    7182:	00 00 00 
    7185:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    718b:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    7191:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    7198:	00 00 00 
    719b:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    71a2:	31 33 
    71a4:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    71ab:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    71b2:	00 00 00 
    71b5:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    71bc:	00 00 00 
    71bf:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    71c6:	00 00 00 
    71c9:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    71d0:	00 00 00 
    71d3:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    71da:	ff ff ff 
    71dd:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    71e4:	00 00 00 
    71e7:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    71ee:	00 00 00 
    71f1:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    71f7:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    71fd:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    7204:	01 00 00 
    7207:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    720e:	31 34 
    7210:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    7217:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    721e:	00 00 00 
    7221:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    7228:	00 00 00 
    722b:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    7232:	00 00 00 
    7235:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    723c:	00 00 00 
    723f:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    7246:	ff ff ff 
    7249:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    7250:	00 00 00 
    7253:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    725a:	00 00 00 
    725d:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    7264:	00 00 00 
    7267:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    726e:	00 00 00 
    7271:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    7278:	31 35 
    727a:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    7281:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    7288:	00 00 00 
    728b:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    7292:	00 00 00 
    7295:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    729c:	00 00 00 
    729f:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    72a6:	00 00 00 
    72a9:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    72b0:	ff ff ff 
    72b3:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    72ba:	00 00 00 
    72bd:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    72c4:	00 00 00 
    72c7:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    72cd:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    72d3:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    72da:	01 00 00 
    72dd:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    72e4:	31 36 
    72e6:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    72ed:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    72f4:	00 00 00 
    72f7:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    72fe:	00 00 00 
    7301:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    7308:	00 00 00 
    730b:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    7312:	00 00 00 
    7315:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    731c:	ff ff ff 
    731f:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    7326:	00 00 00 
    7329:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    7330:	00 00 00 
    7333:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7339:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    733f:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    7346:	01 00 00 
    7349:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    7350:	31 37 
    7352:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    7359:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    7360:	00 00 00 
    7363:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    736a:	00 00 00 
    736d:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    7374:	00 00 00 
    7377:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    737e:	00 00 00 
    7381:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    7388:	00 00 00 
    738b:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    7392:	00 00 00 
    7395:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    739c:	00 00 00 
    739f:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    73a5:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    73ab:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    73b2:	01 00 00 
    73b5:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    73bc:	31 38 
    73be:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    73c5:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    73cc:	00 00 00 
    73cf:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    73d6:	00 00 00 
    73d9:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    73e0:	00 00 00 
    73e3:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    73ea:	00 00 00 
    73ed:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    73f4:	00 00 00 
    73f7:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    73fe:	00 00 00 
    7401:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    7408:	00 00 00 
    740b:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7411:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    7417:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    741e:	01 00 00 
    7421:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    7428:	31 39 
    742a:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    7431:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    7438:	00 00 00 
    743b:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    7442:	00 00 00 
    7445:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    744c:	00 00 00 
    744f:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    7456:	00 00 00 
    7459:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    7460:	00 00 00 
    7463:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    746a:	00 00 00 
    746d:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    7474:	00 00 00 
    7477:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    747d:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    7483:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    748a:	01 00 00 
    748d:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    7494:	32 30 
    7496:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    749d:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    74a4:	00 00 00 
    74a7:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    74ae:	00 00 00 
    74b1:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    74b8:	00 00 00 
    74bb:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    74c2:	00 00 00 
    74c5:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    74cc:	00 00 00 
    74cf:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    74d6:	00 00 00 
    74d9:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    74e0:	00 00 00 
    74e3:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    74e9:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    74ef:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    74f6:	01 00 00 
    74f9:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    7500:	32 31 
    7502:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    7509:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    7510:	00 00 00 
    7513:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    751a:	00 00 00 
    751d:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    7524:	00 00 00 
    7527:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    752e:	00 00 00 
    7531:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    7538:	00 00 00 
    753b:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    7542:	00 00 00 
    7545:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    754c:	00 00 00 
    754f:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7555:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    755b:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    7562:	01 00 00 
    7565:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    756c:	32 32 
    756e:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    7575:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    757c:	00 00 00 
    757f:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    7586:	00 00 00 
    7589:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    7590:	00 00 00 
    7593:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    759a:	03 00 00 
    759d:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    75a4:	00 00 00 
    75a7:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    75ae:	00 00 00 
    75b1:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    75b8:	00 00 00 
    75bb:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    75c1:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    75c7:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    75ce:	01 00 00 
    75d1:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    75d8:	32 33 
    75da:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    75e1:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    75e8:	00 00 00 
    75eb:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    75f2:	00 00 00 
    75f5:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    75fc:	00 00 00 
    75ff:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    7606:	1f 00 00 
    7609:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    7610:	00 00 00 
    7613:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    761a:	00 00 00 
    761d:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    7624:	00 00 00 
    7627:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    762d:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    7633:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    763a:	01 00 00 
    763d:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    7644:	32 34 
    7646:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    764d:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    7654:	00 00 00 
    7657:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    765e:	00 00 00 
    7661:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    7668:	00 00 00 
    766b:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    7672:	00 00 00 
    7675:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    767c:	ff ff ff 
    767f:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    7686:	00 00 00 
    7689:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    7690:	00 00 00 
    7693:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7699:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    769f:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    76a6:	02 00 00 
    76a9:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    76b0:	32 35 
    76b2:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    76b9:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    76c0:	00 00 00 
    76c3:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    76ca:	00 00 00 
    76cd:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    76d4:	00 00 00 
    76d7:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    76de:	00 00 00 
    76e1:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    76e8:	00 00 00 
    76eb:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    76f2:	00 00 00 
    76f5:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    76fc:	00 00 00 
    76ff:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7705:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    770b:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    7712:	02 00 00 
    7715:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    771c:	32 36 
    771e:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    7725:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    772c:	00 00 00 
    772f:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    7736:	00 00 00 
    7739:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    7740:	00 00 00 
    7743:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    774a:	00 00 00 
    774d:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    7754:	00 00 00 
    7757:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    775e:	00 00 00 
    7761:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    7768:	00 00 00 
    776b:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7771:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    7777:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    777e:	02 00 00 
    7781:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    7788:	32 37 
    778a:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    7791:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    7798:	00 00 00 
    779b:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    77a2:	00 00 00 
    77a5:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    77ac:	00 00 00 
    77af:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    77b6:	00 00 00 
    77b9:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    77c0:	00 00 00 
    77c3:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    77ca:	00 00 00 
    77cd:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    77d4:	00 00 00 
    77d7:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    77dd:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    77e3:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    77ea:	02 00 00 
    77ed:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    77f4:	32 38 
    77f6:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    77fd:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    7804:	00 00 00 
    7807:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    780e:	00 00 00 
    7811:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    7818:	00 00 00 
    781b:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    7822:	00 00 00 
    7825:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    782c:	00 00 00 
    782f:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    7836:	00 00 00 
    7839:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    7840:	00 00 00 
    7843:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7849:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    784f:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    7856:	02 00 00 
    7859:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    7860:	32 39 
    7862:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    7869:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    7870:	00 00 00 
    7873:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    787a:	00 00 00 
    787d:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    7884:	00 00 00 
    7887:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    788e:	01 00 00 
    7891:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    7898:	00 00 00 
    789b:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    78a2:	00 00 00 
    78a5:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    78ac:	00 00 00 
    78af:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    78b5:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    78bb:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    78c2:	02 00 00 
    78c5:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    78cc:	33 30 
    78ce:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    78d5:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    78dc:	00 00 00 
    78df:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    78e6:	00 00 00 
    78e9:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    78f0:	00 00 00 
    78f3:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    78fa:	07 00 00 
    78fd:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    7904:	00 00 00 
    7907:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    790e:	00 00 00 
    7911:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    7918:	00 00 00 
    791b:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7921:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    7927:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    792e:	02 00 00 
    7931:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    7938:	33 31 
    793a:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    7941:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    7948:	00 00 00 
    794b:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    7952:	00 00 00 
    7955:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    795c:	00 00 00 
    795f:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    7966:	1f 00 00 
    7969:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    7970:	00 00 00 
    7973:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    797a:	00 00 00 
    797d:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    7984:	00 00 00 
    7987:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    798d:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    7993:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    799a:	02 00 00 
    799d:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    79a4:	33 32 
    79a6:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    79ad:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    79b4:	00 00 00 
    79b7:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    79be:	00 00 00 
    79c1:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    79c8:	00 00 00 
    79cb:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    79d2:	00 00 00 
    79d5:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    79dc:	ff ff ff 
    79df:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    79e6:	00 00 00 
    79e9:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    79f0:	00 00 00 
    79f3:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    79f9:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    79ff:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    7a06:	00 00 00 
    7a09:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    7a10:	33 33 
    7a12:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    7a19:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    7a20:	00 00 00 
    7a23:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    7a2a:	00 00 00 
    7a2d:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    7a34:	00 00 00 
    7a37:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    7a3e:	00 00 00 
    7a41:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    7a48:	ff ff ff 
    7a4b:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    7a52:	00 00 00 
    7a55:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    7a5c:	00 00 00 
    7a5f:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    7a65:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    7a6b:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    7a72:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    7a75:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    7a7b:	5b                   	pop    %ebx
    7a7c:	5e                   	pop    %esi
    7a7d:	5f                   	pop    %edi
    7a7e:	5d                   	pop    %ebp
    7a7f:	c3                   	ret    

00007a80 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    7a80:	55                   	push   %ebp
    7a81:	89 e5                	mov    %esp,%ebp
    7a83:	53                   	push   %ebx
    7a84:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    7a87:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    7a8e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    7a95:	a1 70 ff 00 00       	mov    0xff70,%eax
    7a9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    7a9d:	8b 45 08             	mov    0x8(%ebp),%eax
    7aa0:	8b 40 20             	mov    0x20(%eax),%eax
    7aa3:	85 c0                	test   %eax,%eax
    7aa5:	75 0a                	jne    7ab1 <huffman_decoder+0x31>
    7aa7:	b8 02 00 00 00       	mov    $0x2,%eax
    7aac:	e9 0d 03 00 00       	jmp    7dbe <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    7ab1:	8b 45 08             	mov    0x8(%ebp),%eax
    7ab4:	8b 40 24             	mov    0x24(%eax),%eax
    7ab7:	85 c0                	test   %eax,%eax
    7ab9:	75 1d                	jne    7ad8 <huffman_decoder+0x58>
  {  *x = *y = 0;
    7abb:	8b 45 10             	mov    0x10(%ebp),%eax
    7abe:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    7ac4:	8b 45 10             	mov    0x10(%ebp),%eax
    7ac7:	8b 10                	mov    (%eax),%edx
    7ac9:	8b 45 0c             	mov    0xc(%ebp),%eax
    7acc:	89 10                	mov    %edx,(%eax)
     return 0;
    7ace:	b8 00 00 00 00       	mov    $0x0,%eax
    7ad3:	e9 e6 02 00 00       	jmp    7dbe <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    7ad8:	8b 45 08             	mov    0x8(%ebp),%eax
    7adb:	8b 40 20             	mov    0x20(%eax),%eax
    7ade:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ae1:	01 d2                	add    %edx,%edx
    7ae3:	01 d0                	add    %edx,%eax
    7ae5:	0f b6 00             	movzbl (%eax),%eax
    7ae8:	84 c0                	test   %al,%al
    7aea:	75 46                	jne    7b32 <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    7aec:	8b 45 08             	mov    0x8(%ebp),%eax
    7aef:	8b 40 20             	mov    0x20(%eax),%eax
    7af2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7af5:	01 d2                	add    %edx,%edx
    7af7:	01 d0                	add    %edx,%eax
    7af9:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7afd:	c0 e8 04             	shr    $0x4,%al
    7b00:	0f b6 d0             	movzbl %al,%edx
    7b03:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b06:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    7b08:	8b 45 08             	mov    0x8(%ebp),%eax
    7b0b:	8b 40 20             	mov    0x20(%eax),%eax
    7b0e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b11:	01 d2                	add    %edx,%edx
    7b13:	01 d0                	add    %edx,%eax
    7b15:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7b19:	0f b6 c0             	movzbl %al,%eax
    7b1c:	83 e0 0f             	and    $0xf,%eax
    7b1f:	89 c2                	mov    %eax,%edx
    7b21:	8b 45 10             	mov    0x10(%ebp),%eax
    7b24:	89 10                	mov    %edx,(%eax)

      error = 0;
    7b26:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    7b2d:	e9 af 00 00 00       	jmp    7be1 <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    7b32:	e8 a7 e6 ff ff       	call   61de <hget1bit>
    7b37:	85 c0                	test   %eax,%eax
    7b39:	74 47                	je     7b82 <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    7b3b:	eb 17                	jmp    7b54 <huffman_decoder+0xd4>
    7b3d:	8b 45 08             	mov    0x8(%ebp),%eax
    7b40:	8b 40 20             	mov    0x20(%eax),%eax
    7b43:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b46:	01 d2                	add    %edx,%edx
    7b48:	01 d0                	add    %edx,%eax
    7b4a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7b4e:	0f b6 c0             	movzbl %al,%eax
    7b51:	01 45 f0             	add    %eax,-0x10(%ebp)
    7b54:	8b 45 08             	mov    0x8(%ebp),%eax
    7b57:	8b 40 20             	mov    0x20(%eax),%eax
    7b5a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b5d:	01 d2                	add    %edx,%edx
    7b5f:	01 d0                	add    %edx,%eax
    7b61:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7b65:	3c f9                	cmp    $0xf9,%al
    7b67:	77 d4                	ja     7b3d <huffman_decoder+0xbd>
      point += h->val[point][1];
    7b69:	8b 45 08             	mov    0x8(%ebp),%eax
    7b6c:	8b 40 20             	mov    0x20(%eax),%eax
    7b6f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b72:	01 d2                	add    %edx,%edx
    7b74:	01 d0                	add    %edx,%eax
    7b76:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7b7a:	0f b6 c0             	movzbl %al,%eax
    7b7d:	01 45 f0             	add    %eax,-0x10(%ebp)
    7b80:	eb 42                	jmp    7bc4 <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    7b82:	eb 16                	jmp    7b9a <huffman_decoder+0x11a>
    7b84:	8b 45 08             	mov    0x8(%ebp),%eax
    7b87:	8b 40 20             	mov    0x20(%eax),%eax
    7b8a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b8d:	01 d2                	add    %edx,%edx
    7b8f:	01 d0                	add    %edx,%eax
    7b91:	0f b6 00             	movzbl (%eax),%eax
    7b94:	0f b6 c0             	movzbl %al,%eax
    7b97:	01 45 f0             	add    %eax,-0x10(%ebp)
    7b9a:	8b 45 08             	mov    0x8(%ebp),%eax
    7b9d:	8b 40 20             	mov    0x20(%eax),%eax
    7ba0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ba3:	01 d2                	add    %edx,%edx
    7ba5:	01 d0                	add    %edx,%eax
    7ba7:	0f b6 00             	movzbl (%eax),%eax
    7baa:	3c f9                	cmp    $0xf9,%al
    7bac:	77 d6                	ja     7b84 <huffman_decoder+0x104>
      point += h->val[point][0];
    7bae:	8b 45 08             	mov    0x8(%ebp),%eax
    7bb1:	8b 40 20             	mov    0x20(%eax),%eax
    7bb4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7bb7:	01 d2                	add    %edx,%edx
    7bb9:	01 d0                	add    %edx,%eax
    7bbb:	0f b6 00             	movzbl (%eax),%eax
    7bbe:	0f b6 c0             	movzbl %al,%eax
    7bc1:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    7bc4:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    7bc7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7bcb:	0f 85 07 ff ff ff    	jne    7ad8 <huffman_decoder+0x58>
    7bd1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7bd4:	a1 64 3d 01 00       	mov    0x13d64,%eax
    7bd9:	39 c2                	cmp    %eax,%edx
    7bdb:	0f 82 f7 fe ff ff    	jb     7ad8 <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    7be1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    7be5:	74 24                	je     7c0b <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    7be7:	8b 45 08             	mov    0x8(%ebp),%eax
    7bea:	8b 40 04             	mov    0x4(%eax),%eax
    7bed:	83 e8 01             	sub    $0x1,%eax
    7bf0:	01 c0                	add    %eax,%eax
    7bf2:	89 c2                	mov    %eax,%edx
    7bf4:	8b 45 0c             	mov    0xc(%ebp),%eax
    7bf7:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    7bf9:	8b 45 08             	mov    0x8(%ebp),%eax
    7bfc:	8b 40 08             	mov    0x8(%eax),%eax
    7bff:	83 e8 01             	sub    $0x1,%eax
    7c02:	01 c0                	add    %eax,%eax
    7c04:	89 c2                	mov    %eax,%edx
    7c06:	8b 45 10             	mov    0x10(%ebp),%eax
    7c09:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    7c0b:	8b 45 08             	mov    0x8(%ebp),%eax
    7c0e:	0f b6 00             	movzbl (%eax),%eax
    7c11:	3c 33                	cmp    $0x33,%al
    7c13:	0f 85 ec 00 00 00    	jne    7d05 <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    7c19:	8b 45 08             	mov    0x8(%ebp),%eax
    7c1c:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7c20:	3c 32                	cmp    $0x32,%al
    7c22:	74 0f                	je     7c33 <huffman_decoder+0x1b3>
    7c24:	8b 45 08             	mov    0x8(%ebp),%eax
    7c27:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7c2b:	3c 33                	cmp    $0x33,%al
    7c2d:	0f 85 d2 00 00 00    	jne    7d05 <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    7c33:	8b 45 10             	mov    0x10(%ebp),%eax
    7c36:	8b 00                	mov    (%eax),%eax
    7c38:	c1 f8 03             	sar    $0x3,%eax
    7c3b:	83 e0 01             	and    $0x1,%eax
    7c3e:	89 c2                	mov    %eax,%edx
    7c40:	8b 45 14             	mov    0x14(%ebp),%eax
    7c43:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    7c45:	8b 45 10             	mov    0x10(%ebp),%eax
    7c48:	8b 00                	mov    (%eax),%eax
    7c4a:	c1 f8 02             	sar    $0x2,%eax
    7c4d:	83 e0 01             	and    $0x1,%eax
    7c50:	89 c2                	mov    %eax,%edx
    7c52:	8b 45 18             	mov    0x18(%ebp),%eax
    7c55:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    7c57:	8b 45 10             	mov    0x10(%ebp),%eax
    7c5a:	8b 00                	mov    (%eax),%eax
    7c5c:	d1 f8                	sar    %eax
    7c5e:	83 e0 01             	and    $0x1,%eax
    7c61:	89 c2                	mov    %eax,%edx
    7c63:	8b 45 0c             	mov    0xc(%ebp),%eax
    7c66:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    7c68:	8b 45 10             	mov    0x10(%ebp),%eax
    7c6b:	8b 00                	mov    (%eax),%eax
    7c6d:	83 e0 01             	and    $0x1,%eax
    7c70:	89 c2                	mov    %eax,%edx
    7c72:	8b 45 10             	mov    0x10(%ebp),%eax
    7c75:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    7c77:	8b 45 14             	mov    0x14(%ebp),%eax
    7c7a:	8b 00                	mov    (%eax),%eax
    7c7c:	85 c0                	test   %eax,%eax
    7c7e:	74 18                	je     7c98 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    7c80:	e8 59 e5 ff ff       	call   61de <hget1bit>
    7c85:	83 f8 01             	cmp    $0x1,%eax
    7c88:	75 0e                	jne    7c98 <huffman_decoder+0x218>
    7c8a:	8b 45 14             	mov    0x14(%ebp),%eax
    7c8d:	8b 00                	mov    (%eax),%eax
    7c8f:	f7 d8                	neg    %eax
    7c91:	89 c2                	mov    %eax,%edx
    7c93:	8b 45 14             	mov    0x14(%ebp),%eax
    7c96:	89 10                	mov    %edx,(%eax)
     if (*w)
    7c98:	8b 45 18             	mov    0x18(%ebp),%eax
    7c9b:	8b 00                	mov    (%eax),%eax
    7c9d:	85 c0                	test   %eax,%eax
    7c9f:	74 18                	je     7cb9 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    7ca1:	e8 38 e5 ff ff       	call   61de <hget1bit>
    7ca6:	83 f8 01             	cmp    $0x1,%eax
    7ca9:	75 0e                	jne    7cb9 <huffman_decoder+0x239>
    7cab:	8b 45 18             	mov    0x18(%ebp),%eax
    7cae:	8b 00                	mov    (%eax),%eax
    7cb0:	f7 d8                	neg    %eax
    7cb2:	89 c2                	mov    %eax,%edx
    7cb4:	8b 45 18             	mov    0x18(%ebp),%eax
    7cb7:	89 10                	mov    %edx,(%eax)
     if (*x)
    7cb9:	8b 45 0c             	mov    0xc(%ebp),%eax
    7cbc:	8b 00                	mov    (%eax),%eax
    7cbe:	85 c0                	test   %eax,%eax
    7cc0:	74 18                	je     7cda <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    7cc2:	e8 17 e5 ff ff       	call   61de <hget1bit>
    7cc7:	83 f8 01             	cmp    $0x1,%eax
    7cca:	75 0e                	jne    7cda <huffman_decoder+0x25a>
    7ccc:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ccf:	8b 00                	mov    (%eax),%eax
    7cd1:	f7 d8                	neg    %eax
    7cd3:	89 c2                	mov    %eax,%edx
    7cd5:	8b 45 0c             	mov    0xc(%ebp),%eax
    7cd8:	89 10                	mov    %edx,(%eax)
     if (*y)
    7cda:	8b 45 10             	mov    0x10(%ebp),%eax
    7cdd:	8b 00                	mov    (%eax),%eax
    7cdf:	85 c0                	test   %eax,%eax
    7ce1:	74 1d                	je     7d00 <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    7ce3:	e8 f6 e4 ff ff       	call   61de <hget1bit>
    7ce8:	83 f8 01             	cmp    $0x1,%eax
    7ceb:	75 13                	jne    7d00 <huffman_decoder+0x280>
    7ced:	8b 45 10             	mov    0x10(%ebp),%eax
    7cf0:	8b 00                	mov    (%eax),%eax
    7cf2:	f7 d8                	neg    %eax
    7cf4:	89 c2                	mov    %eax,%edx
    7cf6:	8b 45 10             	mov    0x10(%ebp),%eax
    7cf9:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    7cfb:	e9 bb 00 00 00       	jmp    7dbb <huffman_decoder+0x33b>
    7d00:	e9 b6 00 00 00       	jmp    7dbb <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    7d05:	8b 45 08             	mov    0x8(%ebp),%eax
    7d08:	8b 40 0c             	mov    0xc(%eax),%eax
    7d0b:	85 c0                	test   %eax,%eax
    7d0d:	74 30                	je     7d3f <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    7d0f:	8b 45 08             	mov    0x8(%ebp),%eax
    7d12:	8b 40 04             	mov    0x4(%eax),%eax
    7d15:	8d 50 ff             	lea    -0x1(%eax),%edx
    7d18:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d1b:	8b 00                	mov    (%eax),%eax
    7d1d:	39 c2                	cmp    %eax,%edx
    7d1f:	75 1e                	jne    7d3f <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    7d21:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d24:	8b 00                	mov    (%eax),%eax
    7d26:	89 c3                	mov    %eax,%ebx
    7d28:	8b 45 08             	mov    0x8(%ebp),%eax
    7d2b:	8b 40 0c             	mov    0xc(%eax),%eax
    7d2e:	89 04 24             	mov    %eax,(%esp)
    7d31:	e8 8d e4 ff ff       	call   61c3 <hgetbits>
    7d36:	01 d8                	add    %ebx,%eax
    7d38:	89 c2                	mov    %eax,%edx
    7d3a:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d3d:	89 10                	mov    %edx,(%eax)
     if (*x)
    7d3f:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d42:	8b 00                	mov    (%eax),%eax
    7d44:	85 c0                	test   %eax,%eax
    7d46:	74 18                	je     7d60 <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    7d48:	e8 91 e4 ff ff       	call   61de <hget1bit>
    7d4d:	83 f8 01             	cmp    $0x1,%eax
    7d50:	75 0e                	jne    7d60 <huffman_decoder+0x2e0>
    7d52:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d55:	8b 00                	mov    (%eax),%eax
    7d57:	f7 d8                	neg    %eax
    7d59:	89 c2                	mov    %eax,%edx
    7d5b:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d5e:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    7d60:	8b 45 08             	mov    0x8(%ebp),%eax
    7d63:	8b 40 0c             	mov    0xc(%eax),%eax
    7d66:	85 c0                	test   %eax,%eax
    7d68:	74 30                	je     7d9a <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    7d6a:	8b 45 08             	mov    0x8(%ebp),%eax
    7d6d:	8b 40 08             	mov    0x8(%eax),%eax
    7d70:	8d 50 ff             	lea    -0x1(%eax),%edx
    7d73:	8b 45 10             	mov    0x10(%ebp),%eax
    7d76:	8b 00                	mov    (%eax),%eax
    7d78:	39 c2                	cmp    %eax,%edx
    7d7a:	75 1e                	jne    7d9a <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    7d7c:	8b 45 10             	mov    0x10(%ebp),%eax
    7d7f:	8b 00                	mov    (%eax),%eax
    7d81:	89 c3                	mov    %eax,%ebx
    7d83:	8b 45 08             	mov    0x8(%ebp),%eax
    7d86:	8b 40 0c             	mov    0xc(%eax),%eax
    7d89:	89 04 24             	mov    %eax,(%esp)
    7d8c:	e8 32 e4 ff ff       	call   61c3 <hgetbits>
    7d91:	01 d8                	add    %ebx,%eax
    7d93:	89 c2                	mov    %eax,%edx
    7d95:	8b 45 10             	mov    0x10(%ebp),%eax
    7d98:	89 10                	mov    %edx,(%eax)
     if (*y)
    7d9a:	8b 45 10             	mov    0x10(%ebp),%eax
    7d9d:	8b 00                	mov    (%eax),%eax
    7d9f:	85 c0                	test   %eax,%eax
    7da1:	74 18                	je     7dbb <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    7da3:	e8 36 e4 ff ff       	call   61de <hget1bit>
    7da8:	83 f8 01             	cmp    $0x1,%eax
    7dab:	75 0e                	jne    7dbb <huffman_decoder+0x33b>
    7dad:	8b 45 10             	mov    0x10(%ebp),%eax
    7db0:	8b 00                	mov    (%eax),%eax
    7db2:	f7 d8                	neg    %eax
    7db4:	89 c2                	mov    %eax,%edx
    7db6:	8b 45 10             	mov    0x10(%ebp),%eax
    7db9:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    7dbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    7dbe:	83 c4 24             	add    $0x24,%esp
    7dc1:	5b                   	pop    %ebx
    7dc2:	5d                   	pop    %ebp
    7dc3:	c3                   	ret    

00007dc4 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    7dc4:	55                   	push   %ebp
    7dc5:	89 e5                	mov    %esp,%ebp
    7dc7:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    7dca:	8b 45 0c             	mov    0xc(%ebp),%eax
    7dcd:	8b 00                	mov    (%eax),%eax
    7dcf:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    7dd2:	8b 45 08             	mov    0x8(%ebp),%eax
    7dd5:	89 04 24             	mov    %eax,(%esp)
    7dd8:	e8 6c df ff ff       	call   5d49 <get1bit>
    7ddd:	89 c2                	mov    %eax,%edx
    7ddf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7de2:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    7de4:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7deb:	00 
    7dec:	8b 45 08             	mov    0x8(%ebp),%eax
    7def:	89 04 24             	mov    %eax,(%esp)
    7df2:	e8 64 e0 ff ff       	call   5e5b <getbits>
    7df7:	ba 04 00 00 00       	mov    $0x4,%edx
    7dfc:	29 c2                	sub    %eax,%edx
    7dfe:	89 d0                	mov    %edx,%eax
    7e00:	89 c2                	mov    %eax,%edx
    7e02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e05:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    7e08:	8b 45 08             	mov    0x8(%ebp),%eax
    7e0b:	89 04 24             	mov    %eax,(%esp)
    7e0e:	e8 36 df ff ff       	call   5d49 <get1bit>
    7e13:	85 c0                	test   %eax,%eax
    7e15:	0f 94 c0             	sete   %al
    7e18:	0f b6 d0             	movzbl %al,%edx
    7e1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e1e:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    7e21:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    7e28:	00 
    7e29:	8b 45 08             	mov    0x8(%ebp),%eax
    7e2c:	89 04 24             	mov    %eax,(%esp)
    7e2f:	e8 27 e0 ff ff       	call   5e5b <getbits>
    7e34:	89 c2                	mov    %eax,%edx
    7e36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e39:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    7e3c:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7e43:	00 
    7e44:	8b 45 08             	mov    0x8(%ebp),%eax
    7e47:	89 04 24             	mov    %eax,(%esp)
    7e4a:	e8 0c e0 ff ff       	call   5e5b <getbits>
    7e4f:	89 c2                	mov    %eax,%edx
    7e51:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e54:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    7e57:	8b 45 08             	mov    0x8(%ebp),%eax
    7e5a:	89 04 24             	mov    %eax,(%esp)
    7e5d:	e8 e7 de ff ff       	call   5d49 <get1bit>
    7e62:	89 c2                	mov    %eax,%edx
    7e64:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e67:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    7e6a:	8b 45 08             	mov    0x8(%ebp),%eax
    7e6d:	89 04 24             	mov    %eax,(%esp)
    7e70:	e8 d4 de ff ff       	call   5d49 <get1bit>
    7e75:	89 c2                	mov    %eax,%edx
    7e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e7a:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    7e7d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7e84:	00 
    7e85:	8b 45 08             	mov    0x8(%ebp),%eax
    7e88:	89 04 24             	mov    %eax,(%esp)
    7e8b:	e8 cb df ff ff       	call   5e5b <getbits>
    7e90:	89 c2                	mov    %eax,%edx
    7e92:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e95:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    7e98:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7e9f:	00 
    7ea0:	8b 45 08             	mov    0x8(%ebp),%eax
    7ea3:	89 04 24             	mov    %eax,(%esp)
    7ea6:	e8 b0 df ff ff       	call   5e5b <getbits>
    7eab:	89 c2                	mov    %eax,%edx
    7ead:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7eb0:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    7eb3:	8b 45 08             	mov    0x8(%ebp),%eax
    7eb6:	89 04 24             	mov    %eax,(%esp)
    7eb9:	e8 8b de ff ff       	call   5d49 <get1bit>
    7ebe:	89 c2                	mov    %eax,%edx
    7ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ec3:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    7ec6:	8b 45 08             	mov    0x8(%ebp),%eax
    7ec9:	89 04 24             	mov    %eax,(%esp)
    7ecc:	e8 78 de ff ff       	call   5d49 <get1bit>
    7ed1:	89 c2                	mov    %eax,%edx
    7ed3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ed6:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    7ed9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7ee0:	00 
    7ee1:	8b 45 08             	mov    0x8(%ebp),%eax
    7ee4:	89 04 24             	mov    %eax,(%esp)
    7ee7:	e8 6f df ff ff       	call   5e5b <getbits>
    7eec:	89 c2                	mov    %eax,%edx
    7eee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ef1:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    7ef4:	c9                   	leave  
    7ef5:	c3                   	ret    

00007ef6 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    7ef6:	55                   	push   %ebp
    7ef7:	89 e5                	mov    %esp,%ebp
    7ef9:	56                   	push   %esi
    7efa:	53                   	push   %ebx
    7efb:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    7efe:	8b 45 10             	mov    0x10(%ebp),%eax
    7f01:	8b 40 08             	mov    0x8(%eax),%eax
    7f04:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    7f07:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    7f0e:	00 
    7f0f:	8b 45 08             	mov    0x8(%ebp),%eax
    7f12:	89 04 24             	mov    %eax,(%esp)
    7f15:	e8 41 df ff ff       	call   5e5b <getbits>
    7f1a:	8b 55 0c             	mov    0xc(%ebp),%edx
    7f1d:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    7f1f:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    7f23:	75 1b                	jne    7f40 <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    7f25:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7f2c:	00 
    7f2d:	8b 45 08             	mov    0x8(%ebp),%eax
    7f30:	89 04 24             	mov    %eax,(%esp)
    7f33:	e8 23 df ff ff       	call   5e5b <getbits>
    7f38:	8b 55 0c             	mov    0xc(%ebp),%edx
    7f3b:	89 42 04             	mov    %eax,0x4(%edx)
    7f3e:	eb 19                	jmp    7f59 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    7f40:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    7f47:	00 
    7f48:	8b 45 08             	mov    0x8(%ebp),%eax
    7f4b:	89 04 24             	mov    %eax,(%esp)
    7f4e:	e8 08 df ff ff       	call   5e5b <getbits>
    7f53:	8b 55 0c             	mov    0xc(%ebp),%edx
    7f56:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    7f59:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7f60:	eb 3d                	jmp    7f9f <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    7f62:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7f69:	eb 2a                	jmp    7f95 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    7f6b:	8b 45 08             	mov    0x8(%ebp),%eax
    7f6e:	89 04 24             	mov    %eax,(%esp)
    7f71:	e8 d3 dd ff ff       	call   5d49 <get1bit>
    7f76:	89 c1                	mov    %eax,%ecx
    7f78:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7f7b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7f7e:	89 d0                	mov    %edx,%eax
    7f80:	c1 e0 02             	shl    $0x2,%eax
    7f83:	01 d0                	add    %edx,%eax
    7f85:	c1 e0 03             	shl    $0x3,%eax
    7f88:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7f8b:	01 d0                	add    %edx,%eax
    7f8d:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    7f91:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7f95:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    7f99:	7e d0                	jle    7f6b <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    7f9b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fa2:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7fa5:	7c bb                	jl     7f62 <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    7fa7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7fae:	e9 c5 05 00 00       	jmp    8578 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    7fb3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7fba:	e9 a9 05 00 00       	jmp    8568 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    7fbf:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    7fc6:	00 
    7fc7:	8b 45 08             	mov    0x8(%ebp),%eax
    7fca:	89 04 24             	mov    %eax,(%esp)
    7fcd:	e8 89 de ff ff       	call   5e5b <getbits>
    7fd2:	89 c3                	mov    %eax,%ebx
    7fd4:	8b 75 0c             	mov    0xc(%ebp),%esi
    7fd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7fda:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7fdd:	89 c2                	mov    %eax,%edx
    7fdf:	c1 e2 03             	shl    $0x3,%edx
    7fe2:	01 c2                	add    %eax,%edx
    7fe4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7feb:	89 c2                	mov    %eax,%edx
    7fed:	89 c8                	mov    %ecx,%eax
    7fef:	c1 e0 02             	shl    $0x2,%eax
    7ff2:	01 c8                	add    %ecx,%eax
    7ff4:	c1 e0 05             	shl    $0x5,%eax
    7ff7:	01 d0                	add    %edx,%eax
    7ff9:	01 f0                	add    %esi,%eax
    7ffb:	83 c0 18             	add    $0x18,%eax
    7ffe:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    8000:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    8007:	00 
    8008:	8b 45 08             	mov    0x8(%ebp),%eax
    800b:	89 04 24             	mov    %eax,(%esp)
    800e:	e8 48 de ff ff       	call   5e5b <getbits>
    8013:	89 c3                	mov    %eax,%ebx
    8015:	8b 75 0c             	mov    0xc(%ebp),%esi
    8018:	8b 45 f0             	mov    -0x10(%ebp),%eax
    801b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    801e:	89 c2                	mov    %eax,%edx
    8020:	c1 e2 03             	shl    $0x3,%edx
    8023:	01 c2                	add    %eax,%edx
    8025:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    802c:	89 c2                	mov    %eax,%edx
    802e:	89 c8                	mov    %ecx,%eax
    8030:	c1 e0 02             	shl    $0x2,%eax
    8033:	01 c8                	add    %ecx,%eax
    8035:	c1 e0 05             	shl    $0x5,%eax
    8038:	01 d0                	add    %edx,%eax
    803a:	01 f0                	add    %esi,%eax
    803c:	83 c0 1c             	add    $0x1c,%eax
    803f:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    8041:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    8048:	00 
    8049:	8b 45 08             	mov    0x8(%ebp),%eax
    804c:	89 04 24             	mov    %eax,(%esp)
    804f:	e8 07 de ff ff       	call   5e5b <getbits>
    8054:	89 c3                	mov    %eax,%ebx
    8056:	8b 75 0c             	mov    0xc(%ebp),%esi
    8059:	8b 45 f0             	mov    -0x10(%ebp),%eax
    805c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    805f:	89 c2                	mov    %eax,%edx
    8061:	c1 e2 03             	shl    $0x3,%edx
    8064:	01 c2                	add    %eax,%edx
    8066:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    806d:	89 c2                	mov    %eax,%edx
    806f:	89 c8                	mov    %ecx,%eax
    8071:	c1 e0 02             	shl    $0x2,%eax
    8074:	01 c8                	add    %ecx,%eax
    8076:	c1 e0 05             	shl    $0x5,%eax
    8079:	01 d0                	add    %edx,%eax
    807b:	01 f0                	add    %esi,%eax
    807d:	83 c0 20             	add    $0x20,%eax
    8080:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    8082:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8089:	00 
    808a:	8b 45 08             	mov    0x8(%ebp),%eax
    808d:	89 04 24             	mov    %eax,(%esp)
    8090:	e8 c6 dd ff ff       	call   5e5b <getbits>
    8095:	89 c3                	mov    %eax,%ebx
    8097:	8b 75 0c             	mov    0xc(%ebp),%esi
    809a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    809d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    80a0:	89 c2                	mov    %eax,%edx
    80a2:	c1 e2 03             	shl    $0x3,%edx
    80a5:	01 c2                	add    %eax,%edx
    80a7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    80ae:	89 c2                	mov    %eax,%edx
    80b0:	89 c8                	mov    %ecx,%eax
    80b2:	c1 e0 02             	shl    $0x2,%eax
    80b5:	01 c8                	add    %ecx,%eax
    80b7:	c1 e0 05             	shl    $0x5,%eax
    80ba:	01 d0                	add    %edx,%eax
    80bc:	01 f0                	add    %esi,%eax
    80be:	83 c0 24             	add    $0x24,%eax
    80c1:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    80c3:	8b 45 08             	mov    0x8(%ebp),%eax
    80c6:	89 04 24             	mov    %eax,(%esp)
    80c9:	e8 7b dc ff ff       	call   5d49 <get1bit>
    80ce:	89 c3                	mov    %eax,%ebx
    80d0:	8b 75 0c             	mov    0xc(%ebp),%esi
    80d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    80d6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    80d9:	89 c2                	mov    %eax,%edx
    80db:	c1 e2 03             	shl    $0x3,%edx
    80de:	01 c2                	add    %eax,%edx
    80e0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    80e7:	89 c2                	mov    %eax,%edx
    80e9:	89 c8                	mov    %ecx,%eax
    80eb:	c1 e0 02             	shl    $0x2,%eax
    80ee:	01 c8                	add    %ecx,%eax
    80f0:	c1 e0 05             	shl    $0x5,%eax
    80f3:	01 d0                	add    %edx,%eax
    80f5:	01 f0                	add    %esi,%eax
    80f7:	83 c0 28             	add    $0x28,%eax
    80fa:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    80fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    80ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8102:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8105:	89 c2                	mov    %eax,%edx
    8107:	c1 e2 03             	shl    $0x3,%edx
    810a:	01 c2                	add    %eax,%edx
    810c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8113:	89 c2                	mov    %eax,%edx
    8115:	89 c8                	mov    %ecx,%eax
    8117:	c1 e0 02             	shl    $0x2,%eax
    811a:	01 c8                	add    %ecx,%eax
    811c:	c1 e0 05             	shl    $0x5,%eax
    811f:	01 d0                	add    %edx,%eax
    8121:	01 d8                	add    %ebx,%eax
    8123:	83 c0 28             	add    $0x28,%eax
    8126:	8b 00                	mov    (%eax),%eax
    8128:	85 c0                	test   %eax,%eax
    812a:	0f 84 82 02 00 00    	je     83b2 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    8130:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8137:	00 
    8138:	8b 45 08             	mov    0x8(%ebp),%eax
    813b:	89 04 24             	mov    %eax,(%esp)
    813e:	e8 18 dd ff ff       	call   5e5b <getbits>
    8143:	89 c3                	mov    %eax,%ebx
    8145:	8b 75 0c             	mov    0xc(%ebp),%esi
    8148:	8b 45 f0             	mov    -0x10(%ebp),%eax
    814b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    814e:	89 c2                	mov    %eax,%edx
    8150:	c1 e2 03             	shl    $0x3,%edx
    8153:	01 c2                	add    %eax,%edx
    8155:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    815c:	89 c2                	mov    %eax,%edx
    815e:	89 c8                	mov    %ecx,%eax
    8160:	c1 e0 02             	shl    $0x2,%eax
    8163:	01 c8                	add    %ecx,%eax
    8165:	c1 e0 05             	shl    $0x5,%eax
    8168:	01 d0                	add    %edx,%eax
    816a:	01 f0                	add    %esi,%eax
    816c:	83 c0 2c             	add    $0x2c,%eax
    816f:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    8171:	8b 45 08             	mov    0x8(%ebp),%eax
    8174:	89 04 24             	mov    %eax,(%esp)
    8177:	e8 cd db ff ff       	call   5d49 <get1bit>
    817c:	89 c3                	mov    %eax,%ebx
    817e:	8b 75 0c             	mov    0xc(%ebp),%esi
    8181:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8184:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8187:	89 c2                	mov    %eax,%edx
    8189:	c1 e2 03             	shl    $0x3,%edx
    818c:	01 c2                	add    %eax,%edx
    818e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8195:	89 c2                	mov    %eax,%edx
    8197:	89 c8                	mov    %ecx,%eax
    8199:	c1 e0 02             	shl    $0x2,%eax
    819c:	01 c8                	add    %ecx,%eax
    819e:	c1 e0 05             	shl    $0x5,%eax
    81a1:	01 d0                	add    %edx,%eax
    81a3:	01 f0                	add    %esi,%eax
    81a5:	83 c0 30             	add    $0x30,%eax
    81a8:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    81aa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    81b1:	eb 46                	jmp    81f9 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    81b3:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    81ba:	00 
    81bb:	8b 45 08             	mov    0x8(%ebp),%eax
    81be:	89 04 24             	mov    %eax,(%esp)
    81c1:	e8 95 dc ff ff       	call   5e5b <getbits>
    81c6:	89 c3                	mov    %eax,%ebx
    81c8:	8b 75 0c             	mov    0xc(%ebp),%esi
    81cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    81ce:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    81d1:	89 c2                	mov    %eax,%edx
    81d3:	c1 e2 03             	shl    $0x3,%edx
    81d6:	01 c2                	add    %eax,%edx
    81d8:	8d 04 12             	lea    (%edx,%edx,1),%eax
    81db:	89 c2                	mov    %eax,%edx
    81dd:	89 c8                	mov    %ecx,%eax
    81df:	c1 e0 02             	shl    $0x2,%eax
    81e2:	01 c8                	add    %ecx,%eax
    81e4:	c1 e0 03             	shl    $0x3,%eax
    81e7:	01 c2                	add    %eax,%edx
    81e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81ec:	01 d0                	add    %edx,%eax
    81ee:	83 c0 08             	add    $0x8,%eax
    81f1:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    81f5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    81f9:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    81fd:	7e b4                	jle    81b3 <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    81ff:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8206:	eb 46                	jmp    824e <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    8208:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    820f:	00 
    8210:	8b 45 08             	mov    0x8(%ebp),%eax
    8213:	89 04 24             	mov    %eax,(%esp)
    8216:	e8 40 dc ff ff       	call   5e5b <getbits>
    821b:	89 c3                	mov    %eax,%ebx
    821d:	8b 75 0c             	mov    0xc(%ebp),%esi
    8220:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8223:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8226:	89 c2                	mov    %eax,%edx
    8228:	c1 e2 03             	shl    $0x3,%edx
    822b:	01 c2                	add    %eax,%edx
    822d:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8230:	89 c2                	mov    %eax,%edx
    8232:	89 c8                	mov    %ecx,%eax
    8234:	c1 e0 02             	shl    $0x2,%eax
    8237:	01 c8                	add    %ecx,%eax
    8239:	c1 e0 03             	shl    $0x3,%eax
    823c:	01 c2                	add    %eax,%edx
    823e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8241:	01 d0                	add    %edx,%eax
    8243:	83 c0 0c             	add    $0xc,%eax
    8246:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    824a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    824e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8252:	7e b4                	jle    8208 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    8254:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8257:	8b 45 f0             	mov    -0x10(%ebp),%eax
    825a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    825d:	89 c2                	mov    %eax,%edx
    825f:	c1 e2 03             	shl    $0x3,%edx
    8262:	01 c2                	add    %eax,%edx
    8264:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    826b:	89 c2                	mov    %eax,%edx
    826d:	89 c8                	mov    %ecx,%eax
    826f:	c1 e0 02             	shl    $0x2,%eax
    8272:	01 c8                	add    %ecx,%eax
    8274:	c1 e0 05             	shl    $0x5,%eax
    8277:	01 d0                	add    %edx,%eax
    8279:	01 d8                	add    %ebx,%eax
    827b:	83 c0 2c             	add    $0x2c,%eax
    827e:	8b 00                	mov    (%eax),%eax
    8280:	85 c0                	test   %eax,%eax
    8282:	75 05                	jne    8289 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    8284:	e8 84 cb ff ff       	call   4e0d <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    8289:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    828c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    828f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8292:	89 c2                	mov    %eax,%edx
    8294:	c1 e2 03             	shl    $0x3,%edx
    8297:	01 c2                	add    %eax,%edx
    8299:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    82a0:	89 c2                	mov    %eax,%edx
    82a2:	89 c8                	mov    %ecx,%eax
    82a4:	c1 e0 02             	shl    $0x2,%eax
    82a7:	01 c8                	add    %ecx,%eax
    82a9:	c1 e0 05             	shl    $0x5,%eax
    82ac:	01 d0                	add    %edx,%eax
    82ae:	01 d8                	add    %ebx,%eax
    82b0:	83 c0 2c             	add    $0x2c,%eax
    82b3:	8b 00                	mov    (%eax),%eax
    82b5:	83 f8 02             	cmp    $0x2,%eax
    82b8:	75 62                	jne    831c <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    82ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    82bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    82c0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    82c3:	89 c2                	mov    %eax,%edx
    82c5:	c1 e2 03             	shl    $0x3,%edx
    82c8:	01 c2                	add    %eax,%edx
    82ca:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    82d1:	89 c2                	mov    %eax,%edx
    82d3:	89 c8                	mov    %ecx,%eax
    82d5:	c1 e0 02             	shl    $0x2,%eax
    82d8:	01 c8                	add    %ecx,%eax
    82da:	c1 e0 05             	shl    $0x5,%eax
    82dd:	01 d0                	add    %edx,%eax
    82df:	01 d8                	add    %ebx,%eax
    82e1:	83 c0 30             	add    $0x30,%eax
    82e4:	8b 00                	mov    (%eax),%eax
    82e6:	85 c0                	test   %eax,%eax
    82e8:	75 32                	jne    831c <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    82ea:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    82ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    82f0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    82f3:	89 c2                	mov    %eax,%edx
    82f5:	c1 e2 03             	shl    $0x3,%edx
    82f8:	01 c2                	add    %eax,%edx
    82fa:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8301:	89 c2                	mov    %eax,%edx
    8303:	89 c8                	mov    %ecx,%eax
    8305:	c1 e0 02             	shl    $0x2,%eax
    8308:	01 c8                	add    %ecx,%eax
    830a:	c1 e0 05             	shl    $0x5,%eax
    830d:	01 d0                	add    %edx,%eax
    830f:	01 d8                	add    %ebx,%eax
    8311:	83 c0 4c             	add    $0x4c,%eax
    8314:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    831a:	eb 30                	jmp    834c <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    831c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    831f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8322:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8325:	89 c2                	mov    %eax,%edx
    8327:	c1 e2 03             	shl    $0x3,%edx
    832a:	01 c2                	add    %eax,%edx
    832c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8333:	89 c2                	mov    %eax,%edx
    8335:	89 c8                	mov    %ecx,%eax
    8337:	c1 e0 02             	shl    $0x2,%eax
    833a:	01 c8                	add    %ecx,%eax
    833c:	c1 e0 05             	shl    $0x5,%eax
    833f:	01 d0                	add    %edx,%eax
    8341:	01 d8                	add    %ebx,%eax
    8343:	83 c0 4c             	add    $0x4c,%eax
    8346:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    834c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    834f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8352:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8355:	89 c2                	mov    %eax,%edx
    8357:	c1 e2 03             	shl    $0x3,%edx
    835a:	01 c2                	add    %eax,%edx
    835c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8363:	89 c2                	mov    %eax,%edx
    8365:	89 c8                	mov    %ecx,%eax
    8367:	c1 e0 02             	shl    $0x2,%eax
    836a:	01 c8                	add    %ecx,%eax
    836c:	c1 e0 05             	shl    $0x5,%eax
    836f:	01 d0                	add    %edx,%eax
    8371:	01 d8                	add    %ebx,%eax
    8373:	83 c0 4c             	add    $0x4c,%eax
    8376:	8b 00                	mov    (%eax),%eax
    8378:	ba 14 00 00 00       	mov    $0x14,%edx
    837d:	89 d3                	mov    %edx,%ebx
    837f:	29 c3                	sub    %eax,%ebx
    8381:	8b 75 0c             	mov    0xc(%ebp),%esi
    8384:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8387:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    838a:	89 c2                	mov    %eax,%edx
    838c:	c1 e2 03             	shl    $0x3,%edx
    838f:	01 c2                	add    %eax,%edx
    8391:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8398:	89 c2                	mov    %eax,%edx
    839a:	89 c8                	mov    %ecx,%eax
    839c:	c1 e0 02             	shl    $0x2,%eax
    839f:	01 c8                	add    %ecx,%eax
    83a1:	c1 e0 05             	shl    $0x5,%eax
    83a4:	01 d0                	add    %edx,%eax
    83a6:	01 f0                	add    %esi,%eax
    83a8:	83 c0 50             	add    $0x50,%eax
    83ab:	89 18                	mov    %ebx,(%eax)
    83ad:	e9 07 01 00 00       	jmp    84b9 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    83b2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    83b9:	eb 46                	jmp    8401 <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    83bb:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    83c2:	00 
    83c3:	8b 45 08             	mov    0x8(%ebp),%eax
    83c6:	89 04 24             	mov    %eax,(%esp)
    83c9:	e8 8d da ff ff       	call   5e5b <getbits>
    83ce:	89 c3                	mov    %eax,%ebx
    83d0:	8b 75 0c             	mov    0xc(%ebp),%esi
    83d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83d6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    83d9:	89 c2                	mov    %eax,%edx
    83db:	c1 e2 03             	shl    $0x3,%edx
    83de:	01 c2                	add    %eax,%edx
    83e0:	8d 04 12             	lea    (%edx,%edx,1),%eax
    83e3:	89 c2                	mov    %eax,%edx
    83e5:	89 c8                	mov    %ecx,%eax
    83e7:	c1 e0 02             	shl    $0x2,%eax
    83ea:	01 c8                	add    %ecx,%eax
    83ec:	c1 e0 03             	shl    $0x3,%eax
    83ef:	01 c2                	add    %eax,%edx
    83f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    83f4:	01 d0                	add    %edx,%eax
    83f6:	83 c0 08             	add    $0x8,%eax
    83f9:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    83fd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8401:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8405:	7e b4                	jle    83bb <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    8407:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    840e:	00 
    840f:	8b 45 08             	mov    0x8(%ebp),%eax
    8412:	89 04 24             	mov    %eax,(%esp)
    8415:	e8 41 da ff ff       	call   5e5b <getbits>
    841a:	89 c3                	mov    %eax,%ebx
    841c:	8b 75 0c             	mov    0xc(%ebp),%esi
    841f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8422:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8425:	89 c2                	mov    %eax,%edx
    8427:	c1 e2 03             	shl    $0x3,%edx
    842a:	01 c2                	add    %eax,%edx
    842c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8433:	89 c2                	mov    %eax,%edx
    8435:	89 c8                	mov    %ecx,%eax
    8437:	c1 e0 02             	shl    $0x2,%eax
    843a:	01 c8                	add    %ecx,%eax
    843c:	c1 e0 05             	shl    $0x5,%eax
    843f:	01 d0                	add    %edx,%eax
    8441:	01 f0                	add    %esi,%eax
    8443:	83 c0 4c             	add    $0x4c,%eax
    8446:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    8448:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    844f:	00 
    8450:	8b 45 08             	mov    0x8(%ebp),%eax
    8453:	89 04 24             	mov    %eax,(%esp)
    8456:	e8 00 da ff ff       	call   5e5b <getbits>
    845b:	89 c3                	mov    %eax,%ebx
    845d:	8b 75 0c             	mov    0xc(%ebp),%esi
    8460:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8463:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8466:	89 c2                	mov    %eax,%edx
    8468:	c1 e2 03             	shl    $0x3,%edx
    846b:	01 c2                	add    %eax,%edx
    846d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8474:	89 c2                	mov    %eax,%edx
    8476:	89 c8                	mov    %ecx,%eax
    8478:	c1 e0 02             	shl    $0x2,%eax
    847b:	01 c8                	add    %ecx,%eax
    847d:	c1 e0 05             	shl    $0x5,%eax
    8480:	01 d0                	add    %edx,%eax
    8482:	01 f0                	add    %esi,%eax
    8484:	83 c0 50             	add    $0x50,%eax
    8487:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    8489:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    848c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    848f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8492:	89 c2                	mov    %eax,%edx
    8494:	c1 e2 03             	shl    $0x3,%edx
    8497:	01 c2                	add    %eax,%edx
    8499:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    84a0:	89 c2                	mov    %eax,%edx
    84a2:	89 c8                	mov    %ecx,%eax
    84a4:	c1 e0 02             	shl    $0x2,%eax
    84a7:	01 c8                	add    %ecx,%eax
    84a9:	c1 e0 05             	shl    $0x5,%eax
    84ac:	01 d0                	add    %edx,%eax
    84ae:	01 d8                	add    %ebx,%eax
    84b0:	83 c0 2c             	add    $0x2c,%eax
    84b3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    84b9:	8b 45 08             	mov    0x8(%ebp),%eax
    84bc:	89 04 24             	mov    %eax,(%esp)
    84bf:	e8 85 d8 ff ff       	call   5d49 <get1bit>
    84c4:	89 c3                	mov    %eax,%ebx
    84c6:	8b 75 0c             	mov    0xc(%ebp),%esi
    84c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84cc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    84cf:	89 c2                	mov    %eax,%edx
    84d1:	c1 e2 03             	shl    $0x3,%edx
    84d4:	01 c2                	add    %eax,%edx
    84d6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    84dd:	89 c2                	mov    %eax,%edx
    84df:	89 c8                	mov    %ecx,%eax
    84e1:	c1 e0 02             	shl    $0x2,%eax
    84e4:	01 c8                	add    %ecx,%eax
    84e6:	c1 e0 05             	shl    $0x5,%eax
    84e9:	01 d0                	add    %edx,%eax
    84eb:	01 f0                	add    %esi,%eax
    84ed:	83 c0 54             	add    $0x54,%eax
    84f0:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    84f2:	8b 45 08             	mov    0x8(%ebp),%eax
    84f5:	89 04 24             	mov    %eax,(%esp)
    84f8:	e8 4c d8 ff ff       	call   5d49 <get1bit>
    84fd:	89 c3                	mov    %eax,%ebx
    84ff:	8b 75 0c             	mov    0xc(%ebp),%esi
    8502:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8505:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8508:	89 c2                	mov    %eax,%edx
    850a:	c1 e2 03             	shl    $0x3,%edx
    850d:	01 c2                	add    %eax,%edx
    850f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8516:	89 c2                	mov    %eax,%edx
    8518:	89 c8                	mov    %ecx,%eax
    851a:	c1 e0 02             	shl    $0x2,%eax
    851d:	01 c8                	add    %ecx,%eax
    851f:	c1 e0 05             	shl    $0x5,%eax
    8522:	01 d0                	add    %edx,%eax
    8524:	01 f0                	add    %esi,%eax
    8526:	83 c0 58             	add    $0x58,%eax
    8529:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    852b:	8b 45 08             	mov    0x8(%ebp),%eax
    852e:	89 04 24             	mov    %eax,(%esp)
    8531:	e8 13 d8 ff ff       	call   5d49 <get1bit>
    8536:	89 c3                	mov    %eax,%ebx
    8538:	8b 75 0c             	mov    0xc(%ebp),%esi
    853b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    853e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8541:	89 c2                	mov    %eax,%edx
    8543:	c1 e2 03             	shl    $0x3,%edx
    8546:	01 c2                	add    %eax,%edx
    8548:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    854f:	89 c2                	mov    %eax,%edx
    8551:	89 c8                	mov    %ecx,%eax
    8553:	c1 e0 02             	shl    $0x2,%eax
    8556:	01 c8                	add    %ecx,%eax
    8558:	c1 e0 05             	shl    $0x5,%eax
    855b:	01 d0                	add    %edx,%eax
    855d:	01 f0                	add    %esi,%eax
    855f:	83 c0 5c             	add    $0x5c,%eax
    8562:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    8564:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8568:	8b 45 f4             	mov    -0xc(%ebp),%eax
    856b:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    856e:	0f 8c 4b fa ff ff    	jl     7fbf <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    8574:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8578:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    857c:	0f 8e 31 fa ff ff    	jle    7fb3 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    8582:	83 c4 20             	add    $0x20,%esp
    8585:	5b                   	pop    %ebx
    8586:	5e                   	pop    %esi
    8587:	5d                   	pop    %ebp
    8588:	c3                   	ret    

00008589 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    8589:	55                   	push   %ebp
    858a:	89 e5                	mov    %esp,%ebp
    858c:	56                   	push   %esi
    858d:	53                   	push   %ebx
    858e:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    8591:	8b 45 10             	mov    0x10(%ebp),%eax
    8594:	89 c2                	mov    %eax,%edx
    8596:	c1 e2 03             	shl    $0x3,%edx
    8599:	01 c2                	add    %eax,%edx
    859b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    85a2:	89 c2                	mov    %eax,%edx
    85a4:	8b 4d 14             	mov    0x14(%ebp),%ecx
    85a7:	89 c8                	mov    %ecx,%eax
    85a9:	c1 e0 02             	shl    $0x2,%eax
    85ac:	01 c8                	add    %ecx,%eax
    85ae:	c1 e0 05             	shl    $0x5,%eax
    85b1:	01 d0                	add    %edx,%eax
    85b3:	8d 50 10             	lea    0x10(%eax),%edx
    85b6:	8b 45 0c             	mov    0xc(%ebp),%eax
    85b9:	01 d0                	add    %edx,%eax
    85bb:	83 c0 08             	add    $0x8,%eax
    85be:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    85c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    85c4:	8b 40 10             	mov    0x10(%eax),%eax
    85c7:	85 c0                	test   %eax,%eax
    85c9:	0f 84 7e 02 00 00    	je     884d <III_get_scale_factors+0x2c4>
    85cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    85d2:	8b 40 14             	mov    0x14(%eax),%eax
    85d5:	83 f8 02             	cmp    $0x2,%eax
    85d8:	0f 85 6f 02 00 00    	jne    884d <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    85de:	8b 45 e8             	mov    -0x18(%ebp),%eax
    85e1:	8b 40 18             	mov    0x18(%eax),%eax
    85e4:	85 c0                	test   %eax,%eax
    85e6:	0f 84 6b 01 00 00    	je     8757 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    85ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    85f3:	eb 32                	jmp    8627 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    85f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    85f8:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    85fb:	8b 04 85 a0 ff 00 00 	mov    0xffa0(,%eax,4),%eax
    8602:	89 04 24             	mov    %eax,(%esp)
    8605:	e8 b9 db ff ff       	call   61c3 <hgetbits>
    860a:	89 c3                	mov    %eax,%ebx
    860c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    860f:	8b 45 14             	mov    0x14(%ebp),%eax
    8612:	01 c0                	add    %eax,%eax
    8614:	89 c2                	mov    %eax,%edx
    8616:	c1 e2 05             	shl    $0x5,%edx
    8619:	29 c2                	sub    %eax,%edx
    861b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    861e:	01 d0                	add    %edx,%eax
    8620:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    8623:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8627:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    862b:	7e c8                	jle    85f5 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    862d:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    8634:	eb 5c                	jmp    8692 <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    8636:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    863d:	eb 49                	jmp    8688 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    863f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8642:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    8645:	8b 04 85 a0 ff 00 00 	mov    0xffa0(,%eax,4),%eax
    864c:	89 04 24             	mov    %eax,(%esp)
    864f:	e8 6f db ff ff       	call   61c3 <hgetbits>
    8654:	89 c6                	mov    %eax,%esi
    8656:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8659:	8b 55 ec             	mov    -0x14(%ebp),%edx
    865c:	8b 4d 14             	mov    0x14(%ebp),%ecx
    865f:	89 d0                	mov    %edx,%eax
    8661:	01 c0                	add    %eax,%eax
    8663:	01 d0                	add    %edx,%eax
    8665:	c1 e0 02             	shl    $0x2,%eax
    8668:	01 d0                	add    %edx,%eax
    866a:	89 ca                	mov    %ecx,%edx
    866c:	01 d2                	add    %edx,%edx
    866e:	89 d1                	mov    %edx,%ecx
    8670:	c1 e1 05             	shl    $0x5,%ecx
    8673:	29 d1                	sub    %edx,%ecx
    8675:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8678:	8b 45 f4             	mov    -0xc(%ebp),%eax
    867b:	01 d0                	add    %edx,%eax
    867d:	83 c0 14             	add    $0x14,%eax
    8680:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    8684:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8688:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    868c:	7e b1                	jle    863f <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    868e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8692:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    8696:	7e 9e                	jle    8636 <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    8698:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    869f:	eb 5f                	jmp    8700 <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    86a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    86a8:	eb 4c                	jmp    86f6 <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    86aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    86ad:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    86b0:	83 c0 10             	add    $0x10,%eax
    86b3:	8b 04 85 a0 ff 00 00 	mov    0xffa0(,%eax,4),%eax
    86ba:	89 04 24             	mov    %eax,(%esp)
    86bd:	e8 01 db ff ff       	call   61c3 <hgetbits>
    86c2:	89 c6                	mov    %eax,%esi
    86c4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    86c7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    86ca:	8b 4d 14             	mov    0x14(%ebp),%ecx
    86cd:	89 d0                	mov    %edx,%eax
    86cf:	01 c0                	add    %eax,%eax
    86d1:	01 d0                	add    %edx,%eax
    86d3:	c1 e0 02             	shl    $0x2,%eax
    86d6:	01 d0                	add    %edx,%eax
    86d8:	89 ca                	mov    %ecx,%edx
    86da:	01 d2                	add    %edx,%edx
    86dc:	89 d1                	mov    %edx,%ecx
    86de:	c1 e1 05             	shl    $0x5,%ecx
    86e1:	29 d1                	sub    %edx,%ecx
    86e3:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    86e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86e9:	01 d0                	add    %edx,%eax
    86eb:	83 c0 14             	add    $0x14,%eax
    86ee:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    86f2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    86f6:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    86fa:	7e ae                	jle    86aa <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    86fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8700:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8704:	7e 9b                	jle    86a1 <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    8706:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    870d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8714:	eb 36                	jmp    874c <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    8716:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8719:	8b 55 ec             	mov    -0x14(%ebp),%edx
    871c:	8b 4d 14             	mov    0x14(%ebp),%ecx
    871f:	89 d0                	mov    %edx,%eax
    8721:	01 c0                	add    %eax,%eax
    8723:	01 d0                	add    %edx,%eax
    8725:	c1 e0 02             	shl    $0x2,%eax
    8728:	01 d0                	add    %edx,%eax
    872a:	89 ca                	mov    %ecx,%edx
    872c:	01 d2                	add    %edx,%edx
    872e:	89 d1                	mov    %edx,%ecx
    8730:	c1 e1 05             	shl    $0x5,%ecx
    8733:	29 d1                	sub    %edx,%ecx
    8735:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8738:	8b 45 f4             	mov    -0xc(%ebp),%eax
    873b:	01 d0                	add    %edx,%eax
    873d:	83 c0 14             	add    $0x14,%eax
    8740:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    8747:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    8748:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    874c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8750:	7e c4                	jle    8716 <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    8752:	e9 b1 01 00 00       	jmp    8908 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    8757:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    875e:	e9 8f 00 00 00       	jmp    87f2 <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    8763:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8766:	83 c0 04             	add    $0x4,%eax
    8769:	8b 04 85 84 ff 00 00 	mov    0xff84(,%eax,4),%eax
    8770:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8773:	eb 64                	jmp    87d9 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    8775:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    877c:	eb 51                	jmp    87cf <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    877e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8781:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    8784:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8787:	c1 e2 04             	shl    $0x4,%edx
    878a:	01 d0                	add    %edx,%eax
    878c:	8b 04 85 a0 ff 00 00 	mov    0xffa0(,%eax,4),%eax
    8793:	89 04 24             	mov    %eax,(%esp)
    8796:	e8 28 da ff ff       	call   61c3 <hgetbits>
    879b:	89 c6                	mov    %eax,%esi
    879d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    87a0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    87a3:	8b 4d 14             	mov    0x14(%ebp),%ecx
    87a6:	89 d0                	mov    %edx,%eax
    87a8:	01 c0                	add    %eax,%eax
    87aa:	01 d0                	add    %edx,%eax
    87ac:	c1 e0 02             	shl    $0x2,%eax
    87af:	01 d0                	add    %edx,%eax
    87b1:	89 ca                	mov    %ecx,%edx
    87b3:	01 d2                	add    %edx,%edx
    87b5:	89 d1                	mov    %edx,%ecx
    87b7:	c1 e1 05             	shl    $0x5,%ecx
    87ba:	29 d1                	sub    %edx,%ecx
    87bc:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    87bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87c2:	01 d0                	add    %edx,%eax
    87c4:	83 c0 14             	add    $0x14,%eax
    87c7:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    87cb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    87cf:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    87d3:	7e a9                	jle    877e <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    87d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    87d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    87dc:	83 c0 01             	add    $0x1,%eax
    87df:	83 c0 04             	add    $0x4,%eax
    87e2:	8b 04 85 84 ff 00 00 	mov    0xff84(,%eax,4),%eax
    87e9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    87ec:	7f 87                	jg     8775 <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    87ee:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    87f2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    87f6:	0f 8e 67 ff ff ff    	jle    8763 <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    87fc:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8803:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    880a:	eb 36                	jmp    8842 <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    880c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    880f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8812:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8815:	89 d0                	mov    %edx,%eax
    8817:	01 c0                	add    %eax,%eax
    8819:	01 d0                	add    %edx,%eax
    881b:	c1 e0 02             	shl    $0x2,%eax
    881e:	01 d0                	add    %edx,%eax
    8820:	89 ca                	mov    %ecx,%edx
    8822:	01 d2                	add    %edx,%edx
    8824:	89 d1                	mov    %edx,%ecx
    8826:	c1 e1 05             	shl    $0x5,%ecx
    8829:	29 d1                	sub    %edx,%ecx
    882b:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    882e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8831:	01 d0                	add    %edx,%eax
    8833:	83 c0 14             	add    $0x14,%eax
    8836:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    883d:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    883e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8842:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8846:	7e c4                	jle    880c <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    8848:	e9 bb 00 00 00       	jmp    8908 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    884d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8854:	e9 89 00 00 00       	jmp    88e2 <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    8859:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    885c:	8b 55 14             	mov    0x14(%ebp),%edx
    885f:	89 d0                	mov    %edx,%eax
    8861:	c1 e0 02             	shl    $0x2,%eax
    8864:	01 d0                	add    %edx,%eax
    8866:	c1 e0 03             	shl    $0x3,%eax
    8869:	8b 55 f0             	mov    -0x10(%ebp),%edx
    886c:	01 d0                	add    %edx,%eax
    886e:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    8872:	85 c0                	test   %eax,%eax
    8874:	74 06                	je     887c <III_get_scale_factors+0x2f3>
    8876:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    887a:	75 62                	jne    88de <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    887c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    887f:	8b 04 85 80 ff 00 00 	mov    0xff80(,%eax,4),%eax
    8886:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8889:	eb 41                	jmp    88cc <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    888b:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    888f:	0f 9f c0             	setg   %al
    8892:	0f b6 d0             	movzbl %al,%edx
    8895:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8898:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    889b:	c1 e2 04             	shl    $0x4,%edx
    889e:	01 d0                	add    %edx,%eax
    88a0:	8b 04 85 a0 ff 00 00 	mov    0xffa0(,%eax,4),%eax
    88a7:	89 04 24             	mov    %eax,(%esp)
    88aa:	e8 14 d9 ff ff       	call   61c3 <hgetbits>
    88af:	89 c3                	mov    %eax,%ebx
    88b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    88b4:	8b 45 14             	mov    0x14(%ebp),%eax
    88b7:	01 c0                	add    %eax,%eax
    88b9:	89 c2                	mov    %eax,%edx
    88bb:	c1 e2 05             	shl    $0x5,%edx
    88be:	29 c2                	sub    %eax,%edx
    88c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88c3:	01 d0                	add    %edx,%eax
    88c5:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    88c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    88cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    88cf:	83 c0 01             	add    $0x1,%eax
    88d2:	8b 04 85 80 ff 00 00 	mov    0xff80(,%eax,4),%eax
    88d9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    88dc:	7f ad                	jg     888b <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    88de:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    88e2:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    88e6:	0f 8e 6d ff ff ff    	jle    8859 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    88ec:	8b 4d 08             	mov    0x8(%ebp),%ecx
    88ef:	8b 45 14             	mov    0x14(%ebp),%eax
    88f2:	c1 e0 03             	shl    $0x3,%eax
    88f5:	89 c2                	mov    %eax,%edx
    88f7:	c1 e2 05             	shl    $0x5,%edx
    88fa:	29 c2                	sub    %eax,%edx
    88fc:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    88ff:	83 c0 58             	add    $0x58,%eax
    8902:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    8908:	83 c4 20             	add    $0x20,%esp
    890b:	5b                   	pop    %ebx
    890c:	5e                   	pop    %esi
    890d:	5d                   	pop    %ebp
    890e:	c3                   	ret    

0000890f <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    890f:	55                   	push   %ebp
    8910:	89 e5                	mov    %esp,%ebp
    8912:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    8915:	a1 c0 02 01 00       	mov    0x102c0,%eax
    891a:	85 c0                	test   %eax,%eax
    891c:	74 02                	je     8920 <initialize_huffman+0x11>
    891e:	eb 0f                	jmp    892f <initialize_huffman+0x20>
	read_decoder_table();
    8920:	e8 03 d9 ff ff       	call   6228 <read_decoder_table>
	huffman_initialized = TRUE;
    8925:	c7 05 c0 02 01 00 01 	movl   $0x1,0x102c0
    892c:	00 00 00 
}
    892f:	c9                   	leave  
    8930:	c3                   	ret    

00008931 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    8931:	55                   	push   %ebp
    8932:	89 e5                	mov    %esp,%ebp
    8934:	57                   	push   %edi
    8935:	56                   	push   %esi
    8936:	53                   	push   %ebx
    8937:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    893a:	e8 d0 ff ff ff       	call   890f <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    893f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8942:	8b 45 14             	mov    0x14(%ebp),%eax
    8945:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8948:	89 c2                	mov    %eax,%edx
    894a:	c1 e2 03             	shl    $0x3,%edx
    894d:	01 c2                	add    %eax,%edx
    894f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8956:	89 c2                	mov    %eax,%edx
    8958:	89 c8                	mov    %ecx,%eax
    895a:	c1 e0 02             	shl    $0x2,%eax
    895d:	01 c8                	add    %ecx,%eax
    895f:	c1 e0 05             	shl    $0x5,%eax
    8962:	01 d0                	add    %edx,%eax
    8964:	01 d8                	add    %ebx,%eax
    8966:	83 c0 28             	add    $0x28,%eax
    8969:	8b 00                	mov    (%eax),%eax
    896b:	85 c0                	test   %eax,%eax
    896d:	74 44                	je     89b3 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    896f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8972:	8b 45 14             	mov    0x14(%ebp),%eax
    8975:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8978:	89 c2                	mov    %eax,%edx
    897a:	c1 e2 03             	shl    $0x3,%edx
    897d:	01 c2                	add    %eax,%edx
    897f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8986:	89 c2                	mov    %eax,%edx
    8988:	89 c8                	mov    %ecx,%eax
    898a:	c1 e0 02             	shl    $0x2,%eax
    898d:	01 c8                	add    %ecx,%eax
    898f:	c1 e0 05             	shl    $0x5,%eax
    8992:	01 d0                	add    %edx,%eax
    8994:	01 d8                	add    %ebx,%eax
    8996:	83 c0 2c             	add    $0x2c,%eax
    8999:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    899b:	83 f8 02             	cmp    $0x2,%eax
    899e:	75 13                	jne    89b3 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    89a0:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    89a7:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    89ae:	e9 cc 00 00 00       	jmp    8a7f <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    89b3:	8b 45 1c             	mov    0x1c(%ebp),%eax
    89b6:	8b 00                	mov    (%eax),%eax
    89b8:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    89bb:	8b 75 0c             	mov    0xc(%ebp),%esi
    89be:	8b 45 14             	mov    0x14(%ebp),%eax
    89c1:	8b 5d 10             	mov    0x10(%ebp),%ebx
    89c4:	89 c2                	mov    %eax,%edx
    89c6:	c1 e2 03             	shl    $0x3,%edx
    89c9:	01 c2                	add    %eax,%edx
    89cb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    89d2:	89 c2                	mov    %eax,%edx
    89d4:	89 d8                	mov    %ebx,%eax
    89d6:	c1 e0 02             	shl    $0x2,%eax
    89d9:	01 d8                	add    %ebx,%eax
    89db:	c1 e0 05             	shl    $0x5,%eax
    89de:	01 d0                	add    %edx,%eax
    89e0:	01 f0                	add    %esi,%eax
    89e2:	83 c0 4c             	add    $0x4c,%eax
    89e5:	8b 00                	mov    (%eax),%eax
    89e7:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    89ea:	89 c8                	mov    %ecx,%eax
    89ec:	c1 e0 03             	shl    $0x3,%eax
    89ef:	01 c8                	add    %ecx,%eax
    89f1:	c1 e0 02             	shl    $0x2,%eax
    89f4:	01 c8                	add    %ecx,%eax
    89f6:	01 d0                	add    %edx,%eax
    89f8:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    89ff:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8a02:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8a05:	8b 00                	mov    (%eax),%eax
    8a07:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8a0a:	8b 75 0c             	mov    0xc(%ebp),%esi
    8a0d:	8b 45 14             	mov    0x14(%ebp),%eax
    8a10:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8a13:	89 c2                	mov    %eax,%edx
    8a15:	c1 e2 03             	shl    $0x3,%edx
    8a18:	01 c2                	add    %eax,%edx
    8a1a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8a21:	89 c2                	mov    %eax,%edx
    8a23:	89 d8                	mov    %ebx,%eax
    8a25:	c1 e0 02             	shl    $0x2,%eax
    8a28:	01 d8                	add    %ebx,%eax
    8a2a:	c1 e0 05             	shl    $0x5,%eax
    8a2d:	01 d0                	add    %edx,%eax
    8a2f:	01 f0                	add    %esi,%eax
    8a31:	83 c0 4c             	add    $0x4c,%eax
    8a34:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    8a36:	8b 7d 0c             	mov    0xc(%ebp),%edi
    8a39:	8b 45 14             	mov    0x14(%ebp),%eax
    8a3c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8a3f:	89 c2                	mov    %eax,%edx
    8a41:	c1 e2 03             	shl    $0x3,%edx
    8a44:	01 c2                	add    %eax,%edx
    8a46:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8a4d:	89 c2                	mov    %eax,%edx
    8a4f:	89 d8                	mov    %ebx,%eax
    8a51:	c1 e0 02             	shl    $0x2,%eax
    8a54:	01 d8                	add    %ebx,%eax
    8a56:	c1 e0 05             	shl    $0x5,%eax
    8a59:	01 d0                	add    %edx,%eax
    8a5b:	01 f8                	add    %edi,%eax
    8a5d:	83 c0 50             	add    $0x50,%eax
    8a60:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8a62:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    8a64:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8a67:	89 c8                	mov    %ecx,%eax
    8a69:	c1 e0 03             	shl    $0x3,%eax
    8a6c:	01 c8                	add    %ecx,%eax
    8a6e:	c1 e0 02             	shl    $0x2,%eax
    8a71:	01 c8                	add    %ecx,%eax
    8a73:	01 d0                	add    %edx,%eax
    8a75:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    8a7c:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    8a7f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    8a86:	e9 ac 01 00 00       	jmp    8c37 <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    8a8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8a8e:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8a91:	7d 43                	jge    8ad6 <III_hufman_decode+0x1a5>
    8a93:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8a96:	8b 45 14             	mov    0x14(%ebp),%eax
    8a99:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8a9c:	89 c2                	mov    %eax,%edx
    8a9e:	c1 e2 03             	shl    $0x3,%edx
    8aa1:	01 c2                	add    %eax,%edx
    8aa3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8aaa:	89 c2                	mov    %eax,%edx
    8aac:	89 c8                	mov    %ecx,%eax
    8aae:	c1 e0 02             	shl    $0x2,%eax
    8ab1:	01 c8                	add    %ecx,%eax
    8ab3:	c1 e0 05             	shl    $0x5,%eax
    8ab6:	01 d0                	add    %edx,%eax
    8ab8:	01 d8                	add    %ebx,%eax
    8aba:	83 c0 34             	add    $0x34,%eax
    8abd:	8b 10                	mov    (%eax),%edx
    8abf:	89 d0                	mov    %edx,%eax
    8ac1:	c1 e0 02             	shl    $0x2,%eax
    8ac4:	01 d0                	add    %edx,%eax
    8ac6:	c1 e0 03             	shl    $0x3,%eax
    8ac9:	05 40 3d 01 00       	add    $0x13d40,%eax
    8ace:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8ad1:	e9 86 00 00 00       	jmp    8b5c <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    8ad6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8ad9:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    8adc:	7d 40                	jge    8b1e <III_hufman_decode+0x1ed>
    8ade:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8ae1:	8b 45 14             	mov    0x14(%ebp),%eax
    8ae4:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8ae7:	89 c2                	mov    %eax,%edx
    8ae9:	c1 e2 03             	shl    $0x3,%edx
    8aec:	01 c2                	add    %eax,%edx
    8aee:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8af5:	89 c2                	mov    %eax,%edx
    8af7:	89 c8                	mov    %ecx,%eax
    8af9:	c1 e0 02             	shl    $0x2,%eax
    8afc:	01 c8                	add    %ecx,%eax
    8afe:	c1 e0 05             	shl    $0x5,%eax
    8b01:	01 d0                	add    %edx,%eax
    8b03:	01 d8                	add    %ebx,%eax
    8b05:	83 c0 38             	add    $0x38,%eax
    8b08:	8b 10                	mov    (%eax),%edx
    8b0a:	89 d0                	mov    %edx,%eax
    8b0c:	c1 e0 02             	shl    $0x2,%eax
    8b0f:	01 d0                	add    %edx,%eax
    8b11:	c1 e0 03             	shl    $0x3,%eax
    8b14:	05 40 3d 01 00       	add    $0x13d40,%eax
    8b19:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8b1c:	eb 3e                	jmp    8b5c <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    8b1e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8b21:	8b 45 14             	mov    0x14(%ebp),%eax
    8b24:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8b27:	89 c2                	mov    %eax,%edx
    8b29:	c1 e2 03             	shl    $0x3,%edx
    8b2c:	01 c2                	add    %eax,%edx
    8b2e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8b35:	89 c2                	mov    %eax,%edx
    8b37:	89 c8                	mov    %ecx,%eax
    8b39:	c1 e0 02             	shl    $0x2,%eax
    8b3c:	01 c8                	add    %ecx,%eax
    8b3e:	c1 e0 05             	shl    $0x5,%eax
    8b41:	01 d0                	add    %edx,%eax
    8b43:	01 d8                	add    %ebx,%eax
    8b45:	83 c0 3c             	add    $0x3c,%eax
    8b48:	8b 10                	mov    (%eax),%edx
    8b4a:	89 d0                	mov    %edx,%eax
    8b4c:	c1 e0 02             	shl    $0x2,%eax
    8b4f:	01 d0                	add    %edx,%eax
    8b51:	c1 e0 03             	shl    $0x3,%eax
    8b54:	05 40 3d 01 00       	add    $0x13d40,%eax
    8b59:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    8b5c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8b5f:	89 44 24 10          	mov    %eax,0x10(%esp)
    8b63:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8b66:	89 44 24 0c          	mov    %eax,0xc(%esp)
    8b6a:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8b6d:	89 44 24 08          	mov    %eax,0x8(%esp)
    8b71:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    8b74:	89 44 24 04          	mov    %eax,0x4(%esp)
    8b78:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8b7b:	89 04 24             	mov    %eax,(%esp)
    8b7e:	e8 fd ee ff ff       	call   7a80 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    8b83:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8b86:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8b8b:	89 c8                	mov    %ecx,%eax
    8b8d:	f7 ea                	imul   %edx
    8b8f:	c1 fa 02             	sar    $0x2,%edx
    8b92:	89 c8                	mov    %ecx,%eax
    8b94:	c1 f8 1f             	sar    $0x1f,%eax
    8b97:	29 c2                	sub    %eax,%edx
    8b99:	89 d0                	mov    %edx,%eax
    8b9b:	89 c2                	mov    %eax,%edx
    8b9d:	89 d0                	mov    %edx,%eax
    8b9f:	c1 e0 03             	shl    $0x3,%eax
    8ba2:	01 d0                	add    %edx,%eax
    8ba4:	c1 e0 03             	shl    $0x3,%eax
    8ba7:	89 c2                	mov    %eax,%edx
    8ba9:	8b 45 08             	mov    0x8(%ebp),%eax
    8bac:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8baf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8bb2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8bb7:	89 c8                	mov    %ecx,%eax
    8bb9:	f7 ea                	imul   %edx
    8bbb:	c1 fa 02             	sar    $0x2,%edx
    8bbe:	89 c8                	mov    %ecx,%eax
    8bc0:	c1 f8 1f             	sar    $0x1f,%eax
    8bc3:	29 c2                	sub    %eax,%edx
    8bc5:	89 d0                	mov    %edx,%eax
    8bc7:	c1 e0 03             	shl    $0x3,%eax
    8bca:	01 d0                	add    %edx,%eax
    8bcc:	01 c0                	add    %eax,%eax
    8bce:	29 c1                	sub    %eax,%ecx
    8bd0:	89 ca                	mov    %ecx,%edx
    8bd2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8bd5:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    8bd8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8bdb:	8d 48 01             	lea    0x1(%eax),%ecx
    8bde:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8be3:	89 c8                	mov    %ecx,%eax
    8be5:	f7 ea                	imul   %edx
    8be7:	c1 fa 02             	sar    $0x2,%edx
    8bea:	89 c8                	mov    %ecx,%eax
    8bec:	c1 f8 1f             	sar    $0x1f,%eax
    8bef:	29 c2                	sub    %eax,%edx
    8bf1:	89 d0                	mov    %edx,%eax
    8bf3:	89 c2                	mov    %eax,%edx
    8bf5:	89 d0                	mov    %edx,%eax
    8bf7:	c1 e0 03             	shl    $0x3,%eax
    8bfa:	01 d0                	add    %edx,%eax
    8bfc:	c1 e0 03             	shl    $0x3,%eax
    8bff:	89 c2                	mov    %eax,%edx
    8c01:	8b 45 08             	mov    0x8(%ebp),%eax
    8c04:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8c07:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8c0a:	8d 48 01             	lea    0x1(%eax),%ecx
    8c0d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c12:	89 c8                	mov    %ecx,%eax
    8c14:	f7 ea                	imul   %edx
    8c16:	c1 fa 02             	sar    $0x2,%edx
    8c19:	89 c8                	mov    %ecx,%eax
    8c1b:	c1 f8 1f             	sar    $0x1f,%eax
    8c1e:	29 c2                	sub    %eax,%edx
    8c20:	89 d0                	mov    %edx,%eax
    8c22:	c1 e0 03             	shl    $0x3,%eax
    8c25:	01 d0                	add    %edx,%eax
    8c27:	01 c0                	add    %eax,%eax
    8c29:	29 c1                	sub    %eax,%ecx
    8c2b:	89 ca                	mov    %ecx,%edx
    8c2d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8c30:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    8c33:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    8c37:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    8c3a:	8b 75 0c             	mov    0xc(%ebp),%esi
    8c3d:	8b 45 14             	mov    0x14(%ebp),%eax
    8c40:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8c43:	89 c2                	mov    %eax,%edx
    8c45:	c1 e2 03             	shl    $0x3,%edx
    8c48:	01 c2                	add    %eax,%edx
    8c4a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c51:	89 c2                	mov    %eax,%edx
    8c53:	89 c8                	mov    %ecx,%eax
    8c55:	c1 e0 02             	shl    $0x2,%eax
    8c58:	01 c8                	add    %ecx,%eax
    8c5a:	c1 e0 05             	shl    $0x5,%eax
    8c5d:	01 d0                	add    %edx,%eax
    8c5f:	01 f0                	add    %esi,%eax
    8c61:	83 c0 1c             	add    $0x1c,%eax
    8c64:	8b 00                	mov    (%eax),%eax
    8c66:	01 c0                	add    %eax,%eax
    8c68:	39 c3                	cmp    %eax,%ebx
    8c6a:	0f 82 1b fe ff ff    	jb     8a8b <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    8c70:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8c73:	8b 45 14             	mov    0x14(%ebp),%eax
    8c76:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8c79:	89 c2                	mov    %eax,%edx
    8c7b:	c1 e2 03             	shl    $0x3,%edx
    8c7e:	01 c2                	add    %eax,%edx
    8c80:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c87:	89 c2                	mov    %eax,%edx
    8c89:	89 c8                	mov    %ecx,%eax
    8c8b:	c1 e0 02             	shl    $0x2,%eax
    8c8e:	01 c8                	add    %ecx,%eax
    8c90:	c1 e0 05             	shl    $0x5,%eax
    8c93:	01 d0                	add    %edx,%eax
    8c95:	01 d8                	add    %ebx,%eax
    8c97:	83 c0 5c             	add    $0x5c,%eax
    8c9a:	8b 00                	mov    (%eax),%eax
    8c9c:	8d 50 20             	lea    0x20(%eax),%edx
    8c9f:	89 d0                	mov    %edx,%eax
    8ca1:	c1 e0 02             	shl    $0x2,%eax
    8ca4:	01 d0                	add    %edx,%eax
    8ca6:	c1 e0 03             	shl    $0x3,%eax
    8ca9:	05 40 3d 01 00       	add    $0x13d40,%eax
    8cae:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    8cb1:	e9 91 01 00 00       	jmp    8e47 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    8cb6:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8cb9:	89 44 24 10          	mov    %eax,0x10(%esp)
    8cbd:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8cc0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    8cc4:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8cc7:	89 44 24 08          	mov    %eax,0x8(%esp)
    8ccb:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    8cce:	89 44 24 04          	mov    %eax,0x4(%esp)
    8cd2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8cd5:	89 04 24             	mov    %eax,(%esp)
    8cd8:	e8 a3 ed ff ff       	call   7a80 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    8cdd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8ce0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ce5:	89 c8                	mov    %ecx,%eax
    8ce7:	f7 ea                	imul   %edx
    8ce9:	c1 fa 02             	sar    $0x2,%edx
    8cec:	89 c8                	mov    %ecx,%eax
    8cee:	c1 f8 1f             	sar    $0x1f,%eax
    8cf1:	29 c2                	sub    %eax,%edx
    8cf3:	89 d0                	mov    %edx,%eax
    8cf5:	89 c2                	mov    %eax,%edx
    8cf7:	89 d0                	mov    %edx,%eax
    8cf9:	c1 e0 03             	shl    $0x3,%eax
    8cfc:	01 d0                	add    %edx,%eax
    8cfe:	c1 e0 03             	shl    $0x3,%eax
    8d01:	89 c2                	mov    %eax,%edx
    8d03:	8b 45 08             	mov    0x8(%ebp),%eax
    8d06:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8d09:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8d0c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d11:	89 c8                	mov    %ecx,%eax
    8d13:	f7 ea                	imul   %edx
    8d15:	c1 fa 02             	sar    $0x2,%edx
    8d18:	89 c8                	mov    %ecx,%eax
    8d1a:	c1 f8 1f             	sar    $0x1f,%eax
    8d1d:	29 c2                	sub    %eax,%edx
    8d1f:	89 d0                	mov    %edx,%eax
    8d21:	c1 e0 03             	shl    $0x3,%eax
    8d24:	01 d0                	add    %edx,%eax
    8d26:	01 c0                	add    %eax,%eax
    8d28:	29 c1                	sub    %eax,%ecx
    8d2a:	89 ca                	mov    %ecx,%edx
    8d2c:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8d2f:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    8d32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8d35:	8d 48 01             	lea    0x1(%eax),%ecx
    8d38:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d3d:	89 c8                	mov    %ecx,%eax
    8d3f:	f7 ea                	imul   %edx
    8d41:	c1 fa 02             	sar    $0x2,%edx
    8d44:	89 c8                	mov    %ecx,%eax
    8d46:	c1 f8 1f             	sar    $0x1f,%eax
    8d49:	29 c2                	sub    %eax,%edx
    8d4b:	89 d0                	mov    %edx,%eax
    8d4d:	89 c2                	mov    %eax,%edx
    8d4f:	89 d0                	mov    %edx,%eax
    8d51:	c1 e0 03             	shl    $0x3,%eax
    8d54:	01 d0                	add    %edx,%eax
    8d56:	c1 e0 03             	shl    $0x3,%eax
    8d59:	89 c2                	mov    %eax,%edx
    8d5b:	8b 45 08             	mov    0x8(%ebp),%eax
    8d5e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8d61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8d64:	8d 48 01             	lea    0x1(%eax),%ecx
    8d67:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d6c:	89 c8                	mov    %ecx,%eax
    8d6e:	f7 ea                	imul   %edx
    8d70:	c1 fa 02             	sar    $0x2,%edx
    8d73:	89 c8                	mov    %ecx,%eax
    8d75:	c1 f8 1f             	sar    $0x1f,%eax
    8d78:	29 c2                	sub    %eax,%edx
    8d7a:	89 d0                	mov    %edx,%eax
    8d7c:	c1 e0 03             	shl    $0x3,%eax
    8d7f:	01 d0                	add    %edx,%eax
    8d81:	01 c0                	add    %eax,%eax
    8d83:	29 c1                	sub    %eax,%ecx
    8d85:	89 ca                	mov    %ecx,%edx
    8d87:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8d8a:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    8d8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8d90:	8d 48 02             	lea    0x2(%eax),%ecx
    8d93:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d98:	89 c8                	mov    %ecx,%eax
    8d9a:	f7 ea                	imul   %edx
    8d9c:	c1 fa 02             	sar    $0x2,%edx
    8d9f:	89 c8                	mov    %ecx,%eax
    8da1:	c1 f8 1f             	sar    $0x1f,%eax
    8da4:	29 c2                	sub    %eax,%edx
    8da6:	89 d0                	mov    %edx,%eax
    8da8:	89 c2                	mov    %eax,%edx
    8daa:	89 d0                	mov    %edx,%eax
    8dac:	c1 e0 03             	shl    $0x3,%eax
    8daf:	01 d0                	add    %edx,%eax
    8db1:	c1 e0 03             	shl    $0x3,%eax
    8db4:	89 c2                	mov    %eax,%edx
    8db6:	8b 45 08             	mov    0x8(%ebp),%eax
    8db9:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8dbc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8dbf:	8d 48 02             	lea    0x2(%eax),%ecx
    8dc2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8dc7:	89 c8                	mov    %ecx,%eax
    8dc9:	f7 ea                	imul   %edx
    8dcb:	c1 fa 02             	sar    $0x2,%edx
    8dce:	89 c8                	mov    %ecx,%eax
    8dd0:	c1 f8 1f             	sar    $0x1f,%eax
    8dd3:	29 c2                	sub    %eax,%edx
    8dd5:	89 d0                	mov    %edx,%eax
    8dd7:	c1 e0 03             	shl    $0x3,%eax
    8dda:	01 d0                	add    %edx,%eax
    8ddc:	01 c0                	add    %eax,%eax
    8dde:	29 c1                	sub    %eax,%ecx
    8de0:	89 ca                	mov    %ecx,%edx
    8de2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8de5:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    8de8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8deb:	8d 48 03             	lea    0x3(%eax),%ecx
    8dee:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8df3:	89 c8                	mov    %ecx,%eax
    8df5:	f7 ea                	imul   %edx
    8df7:	c1 fa 02             	sar    $0x2,%edx
    8dfa:	89 c8                	mov    %ecx,%eax
    8dfc:	c1 f8 1f             	sar    $0x1f,%eax
    8dff:	29 c2                	sub    %eax,%edx
    8e01:	89 d0                	mov    %edx,%eax
    8e03:	89 c2                	mov    %eax,%edx
    8e05:	89 d0                	mov    %edx,%eax
    8e07:	c1 e0 03             	shl    $0x3,%eax
    8e0a:	01 d0                	add    %edx,%eax
    8e0c:	c1 e0 03             	shl    $0x3,%eax
    8e0f:	89 c2                	mov    %eax,%edx
    8e11:	8b 45 08             	mov    0x8(%ebp),%eax
    8e14:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8e17:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8e1a:	8d 48 03             	lea    0x3(%eax),%ecx
    8e1d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8e22:	89 c8                	mov    %ecx,%eax
    8e24:	f7 ea                	imul   %edx
    8e26:	c1 fa 02             	sar    $0x2,%edx
    8e29:	89 c8                	mov    %ecx,%eax
    8e2b:	c1 f8 1f             	sar    $0x1f,%eax
    8e2e:	29 c2                	sub    %eax,%edx
    8e30:	89 d0                	mov    %edx,%eax
    8e32:	c1 e0 03             	shl    $0x3,%eax
    8e35:	01 d0                	add    %edx,%eax
    8e37:	01 c0                	add    %eax,%eax
    8e39:	29 c1                	sub    %eax,%ecx
    8e3b:	89 ca                	mov    %ecx,%edx
    8e3d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8e40:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    8e43:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    8e47:	e8 5b d3 ff ff       	call   61a7 <hsstell>
    8e4c:	89 c3                	mov    %eax,%ebx
    8e4e:	8b 75 0c             	mov    0xc(%ebp),%esi
    8e51:	8b 45 14             	mov    0x14(%ebp),%eax
    8e54:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8e57:	89 c2                	mov    %eax,%edx
    8e59:	c1 e2 03             	shl    $0x3,%edx
    8e5c:	01 c2                	add    %eax,%edx
    8e5e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8e65:	89 c2                	mov    %eax,%edx
    8e67:	89 c8                	mov    %ecx,%eax
    8e69:	c1 e0 02             	shl    $0x2,%eax
    8e6c:	01 c8                	add    %ecx,%eax
    8e6e:	c1 e0 05             	shl    $0x5,%eax
    8e71:	01 d0                	add    %edx,%eax
    8e73:	01 f0                	add    %esi,%eax
    8e75:	83 c0 18             	add    $0x18,%eax
    8e78:	8b 10                	mov    (%eax),%edx
    8e7a:	8b 45 18             	mov    0x18(%ebp),%eax
    8e7d:	01 d0                	add    %edx,%eax
    8e7f:	39 c3                	cmp    %eax,%ebx
    8e81:	73 0d                	jae    8e90 <III_hufman_decode+0x55f>
    8e83:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8e8a:	0f 8e 26 fe ff ff    	jle    8cb6 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    8e90:	e8 12 d3 ff ff       	call   61a7 <hsstell>
    8e95:	89 c3                	mov    %eax,%ebx
    8e97:	8b 75 0c             	mov    0xc(%ebp),%esi
    8e9a:	8b 45 14             	mov    0x14(%ebp),%eax
    8e9d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8ea0:	89 c2                	mov    %eax,%edx
    8ea2:	c1 e2 03             	shl    $0x3,%edx
    8ea5:	01 c2                	add    %eax,%edx
    8ea7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8eae:	89 c2                	mov    %eax,%edx
    8eb0:	89 c8                	mov    %ecx,%eax
    8eb2:	c1 e0 02             	shl    $0x2,%eax
    8eb5:	01 c8                	add    %ecx,%eax
    8eb7:	c1 e0 05             	shl    $0x5,%eax
    8eba:	01 d0                	add    %edx,%eax
    8ebc:	01 f0                	add    %esi,%eax
    8ebe:	83 c0 18             	add    $0x18,%eax
    8ec1:	8b 10                	mov    (%eax),%edx
    8ec3:	8b 45 18             	mov    0x18(%ebp),%eax
    8ec6:	01 d0                	add    %edx,%eax
    8ec8:	39 c3                	cmp    %eax,%ebx
    8eca:	76 48                	jbe    8f14 <III_hufman_decode+0x5e3>
   {  i -=4;
    8ecc:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    8ed0:	e8 d2 d2 ff ff       	call   61a7 <hsstell>
    8ed5:	8b 55 18             	mov    0x18(%ebp),%edx
    8ed8:	29 d0                	sub    %edx,%eax
    8eda:	89 c6                	mov    %eax,%esi
    8edc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8edf:	8b 45 14             	mov    0x14(%ebp),%eax
    8ee2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8ee5:	89 c2                	mov    %eax,%edx
    8ee7:	c1 e2 03             	shl    $0x3,%edx
    8eea:	01 c2                	add    %eax,%edx
    8eec:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8ef3:	89 c2                	mov    %eax,%edx
    8ef5:	89 c8                	mov    %ecx,%eax
    8ef7:	c1 e0 02             	shl    $0x2,%eax
    8efa:	01 c8                	add    %ecx,%eax
    8efc:	c1 e0 05             	shl    $0x5,%eax
    8eff:	01 d0                	add    %edx,%eax
    8f01:	01 d8                	add    %ebx,%eax
    8f03:	83 c0 18             	add    $0x18,%eax
    8f06:	8b 00                	mov    (%eax),%eax
    8f08:	29 c6                	sub    %eax,%esi
    8f0a:	89 f0                	mov    %esi,%eax
    8f0c:	89 04 24             	mov    %eax,(%esp)
    8f0f:	e8 de d2 ff ff       	call   61f2 <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    8f14:	e8 8e d2 ff ff       	call   61a7 <hsstell>
    8f19:	89 c3                	mov    %eax,%ebx
    8f1b:	8b 75 0c             	mov    0xc(%ebp),%esi
    8f1e:	8b 45 14             	mov    0x14(%ebp),%eax
    8f21:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8f24:	89 c2                	mov    %eax,%edx
    8f26:	c1 e2 03             	shl    $0x3,%edx
    8f29:	01 c2                	add    %eax,%edx
    8f2b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f32:	89 c2                	mov    %eax,%edx
    8f34:	89 c8                	mov    %ecx,%eax
    8f36:	c1 e0 02             	shl    $0x2,%eax
    8f39:	01 c8                	add    %ecx,%eax
    8f3b:	c1 e0 05             	shl    $0x5,%eax
    8f3e:	01 d0                	add    %edx,%eax
    8f40:	01 f0                	add    %esi,%eax
    8f42:	83 c0 18             	add    $0x18,%eax
    8f45:	8b 10                	mov    (%eax),%edx
    8f47:	8b 45 18             	mov    0x18(%ebp),%eax
    8f4a:	01 d0                	add    %edx,%eax
    8f4c:	39 c3                	cmp    %eax,%ebx
    8f4e:	73 45                	jae    8f95 <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    8f50:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8f53:	8b 45 14             	mov    0x14(%ebp),%eax
    8f56:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8f59:	89 c2                	mov    %eax,%edx
    8f5b:	c1 e2 03             	shl    $0x3,%edx
    8f5e:	01 c2                	add    %eax,%edx
    8f60:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f67:	89 c2                	mov    %eax,%edx
    8f69:	89 c8                	mov    %ecx,%eax
    8f6b:	c1 e0 02             	shl    $0x2,%eax
    8f6e:	01 c8                	add    %ecx,%eax
    8f70:	c1 e0 05             	shl    $0x5,%eax
    8f73:	01 d0                	add    %edx,%eax
    8f75:	01 d8                	add    %ebx,%eax
    8f77:	83 c0 18             	add    $0x18,%eax
    8f7a:	8b 10                	mov    (%eax),%edx
    8f7c:	8b 45 18             	mov    0x18(%ebp),%eax
    8f7f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8f82:	e8 20 d2 ff ff       	call   61a7 <hsstell>
    8f87:	29 c3                	sub    %eax,%ebx
    8f89:	89 d8                	mov    %ebx,%eax
    8f8b:	89 04 24             	mov    %eax,(%esp)
    8f8e:	e8 30 d2 ff ff       	call   61c3 <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    8f93:	eb 5c                	jmp    8ff1 <III_hufman_decode+0x6c0>
    8f95:	eb 5a                	jmp    8ff1 <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    8f97:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8f9a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f9f:	89 c8                	mov    %ecx,%eax
    8fa1:	f7 ea                	imul   %edx
    8fa3:	c1 fa 02             	sar    $0x2,%edx
    8fa6:	89 c8                	mov    %ecx,%eax
    8fa8:	c1 f8 1f             	sar    $0x1f,%eax
    8fab:	29 c2                	sub    %eax,%edx
    8fad:	89 d0                	mov    %edx,%eax
    8faf:	89 c2                	mov    %eax,%edx
    8fb1:	89 d0                	mov    %edx,%eax
    8fb3:	c1 e0 03             	shl    $0x3,%eax
    8fb6:	01 d0                	add    %edx,%eax
    8fb8:	c1 e0 03             	shl    $0x3,%eax
    8fbb:	89 c2                	mov    %eax,%edx
    8fbd:	8b 45 08             	mov    0x8(%ebp),%eax
    8fc0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8fc3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8fc6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8fcb:	89 c8                	mov    %ecx,%eax
    8fcd:	f7 ea                	imul   %edx
    8fcf:	c1 fa 02             	sar    $0x2,%edx
    8fd2:	89 c8                	mov    %ecx,%eax
    8fd4:	c1 f8 1f             	sar    $0x1f,%eax
    8fd7:	29 c2                	sub    %eax,%edx
    8fd9:	89 d0                	mov    %edx,%eax
    8fdb:	c1 e0 03             	shl    $0x3,%eax
    8fde:	01 d0                	add    %edx,%eax
    8fe0:	01 c0                	add    %eax,%eax
    8fe2:	29 c1                	sub    %eax,%ecx
    8fe4:	89 ca                	mov    %ecx,%edx
    8fe6:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    8fed:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    8ff1:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8ff8:	7e 9d                	jle    8f97 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    8ffa:	83 c4 4c             	add    $0x4c,%esp
    8ffd:	5b                   	pop    %ebx
    8ffe:	5e                   	pop    %esi
    8fff:	5f                   	pop    %edi
    9000:	5d                   	pop    %ebp
    9001:	c3                   	ret    

00009002 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    9002:	55                   	push   %ebp
    9003:	89 e5                	mov    %esp,%ebp
    9005:	56                   	push   %esi
    9006:	53                   	push   %ebx
    9007:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    900a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9011:	8b 45 1c             	mov    0x1c(%ebp),%eax
    9014:	8b 00                	mov    (%eax),%eax
    9016:	8b 40 10             	mov    0x10(%eax),%eax
    9019:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    901c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    9023:	8b 45 14             	mov    0x14(%ebp),%eax
    9026:	8b 40 10             	mov    0x10(%eax),%eax
    9029:	85 c0                	test   %eax,%eax
    902b:	74 61                	je     908e <III_dequantize_sample+0x8c>
    902d:	8b 45 14             	mov    0x14(%ebp),%eax
    9030:	8b 40 14             	mov    0x14(%eax),%eax
    9033:	83 f8 02             	cmp    $0x2,%eax
    9036:	75 56                	jne    908e <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    9038:	8b 45 14             	mov    0x14(%ebp),%eax
    903b:	8b 40 18             	mov    0x18(%eax),%eax
    903e:	85 c0                	test   %eax,%eax
    9040:	74 15                	je     9057 <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9042:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9045:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    904b:	05 24 00 01 00       	add    $0x10024,%eax
    9050:	8b 00                	mov    (%eax),%eax
    9052:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9055:	eb 4a                	jmp    90a1 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    9057:	8b 45 dc             	mov    -0x24(%ebp),%eax
    905a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9060:	05 74 00 01 00       	add    $0x10074,%eax
    9065:	8b 50 0c             	mov    0xc(%eax),%edx
    9068:	89 d0                	mov    %edx,%eax
    906a:	01 c0                	add    %eax,%eax
    906c:	01 d0                	add    %edx,%eax
    906e:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    9071:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9074:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    907a:	05 74 00 01 00       	add    $0x10074,%eax
    907f:	8b 40 0c             	mov    0xc(%eax),%eax
    9082:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    9085:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    908c:	eb 13                	jmp    90a1 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    908e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9091:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9097:	05 24 00 01 00       	add    $0x10024,%eax
    909c:	8b 00                	mov    (%eax),%eax
    909e:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    90a1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    90a8:	e9 3d 06 00 00       	jmp    96ea <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    90ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    90b4:	e9 23 06 00 00       	jmp    96dc <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    90b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    90bc:	89 d0                	mov    %edx,%eax
    90be:	c1 e0 03             	shl    $0x3,%eax
    90c1:	01 d0                	add    %edx,%eax
    90c3:	01 c0                	add    %eax,%eax
    90c5:	89 c2                	mov    %eax,%edx
    90c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90ca:	01 d0                	add    %edx,%eax
    90cc:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    90cf:	0f 85 9e 02 00 00    	jne    9373 <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    90d5:	8b 45 14             	mov    0x14(%ebp),%eax
    90d8:	8b 40 10             	mov    0x10(%eax),%eax
    90db:	85 c0                	test   %eax,%eax
    90dd:	0f 84 6b 02 00 00    	je     934e <III_dequantize_sample+0x34c>
    90e3:	8b 45 14             	mov    0x14(%ebp),%eax
    90e6:	8b 40 14             	mov    0x14(%eax),%eax
    90e9:	83 f8 02             	cmp    $0x2,%eax
    90ec:	0f 85 5c 02 00 00    	jne    934e <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    90f2:	8b 45 14             	mov    0x14(%ebp),%eax
    90f5:	8b 40 18             	mov    0x18(%eax),%eax
    90f8:	85 c0                	test   %eax,%eax
    90fa:	0f 84 af 01 00 00    	je     92af <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    9100:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9103:	89 d0                	mov    %edx,%eax
    9105:	c1 e0 03             	shl    $0x3,%eax
    9108:	01 d0                	add    %edx,%eax
    910a:	01 c0                	add    %eax,%eax
    910c:	89 c2                	mov    %eax,%edx
    910e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9111:	01 c2                	add    %eax,%edx
    9113:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9116:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    911c:	05 40 00 01 00       	add    $0x10040,%eax
    9121:	8b 00                	mov    (%eax),%eax
    9123:	39 c2                	cmp    %eax,%edx
    9125:	0f 85 93 00 00 00    	jne    91be <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    912b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    912e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9134:	05 80 00 01 00       	add    $0x10080,%eax
    9139:	8b 50 0c             	mov    0xc(%eax),%edx
    913c:	89 d0                	mov    %edx,%eax
    913e:	01 c0                	add    %eax,%eax
    9140:	01 d0                	add    %edx,%eax
    9142:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    9145:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    914c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    914f:	8d 48 01             	lea    0x1(%eax),%ecx
    9152:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9155:	89 d0                	mov    %edx,%eax
    9157:	c1 e0 03             	shl    $0x3,%eax
    915a:	01 d0                	add    %edx,%eax
    915c:	c1 e0 02             	shl    $0x2,%eax
    915f:	01 d0                	add    %edx,%eax
    9161:	01 c8                	add    %ecx,%eax
    9163:	83 c0 14             	add    $0x14,%eax
    9166:	8b 0c 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    916d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9170:	89 d0                	mov    %edx,%eax
    9172:	c1 e0 03             	shl    $0x3,%eax
    9175:	01 d0                	add    %edx,%eax
    9177:	c1 e0 02             	shl    $0x2,%eax
    917a:	01 d0                	add    %edx,%eax
    917c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    917f:	01 d0                	add    %edx,%eax
    9181:	83 c0 14             	add    $0x14,%eax
    9184:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    918b:	29 c1                	sub    %eax,%ecx
    918d:	89 c8                	mov    %ecx,%eax
    918f:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9192:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9195:	89 d0                	mov    %edx,%eax
    9197:	c1 e0 03             	shl    $0x3,%eax
    919a:	01 d0                	add    %edx,%eax
    919c:	c1 e0 02             	shl    $0x2,%eax
    919f:	01 d0                	add    %edx,%eax
    91a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    91a4:	01 d0                	add    %edx,%eax
    91a6:	83 c0 14             	add    $0x14,%eax
    91a9:	8b 14 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%edx
    91b0:	89 d0                	mov    %edx,%eax
    91b2:	01 c0                	add    %eax,%eax
    91b4:	01 d0                	add    %edx,%eax
    91b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    91b9:	e9 8e 01 00 00       	jmp    934c <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    91be:	8b 55 f0             	mov    -0x10(%ebp),%edx
    91c1:	89 d0                	mov    %edx,%eax
    91c3:	c1 e0 03             	shl    $0x3,%eax
    91c6:	01 d0                	add    %edx,%eax
    91c8:	01 c0                	add    %eax,%eax
    91ca:	89 c2                	mov    %eax,%edx
    91cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    91cf:	01 c2                	add    %eax,%edx
    91d1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    91d4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    91da:	05 40 00 01 00       	add    $0x10040,%eax
    91df:	8b 00                	mov    (%eax),%eax
    91e1:	39 c2                	cmp    %eax,%edx
    91e3:	7d 2a                	jge    920f <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    91e5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    91e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    91ec:	8d 48 01             	lea    0x1(%eax),%ecx
    91ef:	8b 55 dc             	mov    -0x24(%ebp),%edx
    91f2:	89 d0                	mov    %edx,%eax
    91f4:	c1 e0 03             	shl    $0x3,%eax
    91f7:	01 d0                	add    %edx,%eax
    91f9:	c1 e0 02             	shl    $0x2,%eax
    91fc:	01 d0                	add    %edx,%eax
    91fe:	01 c8                	add    %ecx,%eax
    9200:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    9207:	89 45 e8             	mov    %eax,-0x18(%ebp)
    920a:	e9 3d 01 00 00       	jmp    934c <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    920f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9213:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9216:	8d 48 01             	lea    0x1(%eax),%ecx
    9219:	8b 55 dc             	mov    -0x24(%ebp),%edx
    921c:	89 d0                	mov    %edx,%eax
    921e:	c1 e0 03             	shl    $0x3,%eax
    9221:	01 d0                	add    %edx,%eax
    9223:	c1 e0 02             	shl    $0x2,%eax
    9226:	01 d0                	add    %edx,%eax
    9228:	01 c8                	add    %ecx,%eax
    922a:	83 c0 14             	add    $0x14,%eax
    922d:	8b 14 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%edx
    9234:	89 d0                	mov    %edx,%eax
    9236:	01 c0                	add    %eax,%eax
    9238:	01 d0                	add    %edx,%eax
    923a:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    923d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9240:	8d 48 01             	lea    0x1(%eax),%ecx
    9243:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9246:	89 d0                	mov    %edx,%eax
    9248:	c1 e0 03             	shl    $0x3,%eax
    924b:	01 d0                	add    %edx,%eax
    924d:	c1 e0 02             	shl    $0x2,%eax
    9250:	01 d0                	add    %edx,%eax
    9252:	01 c8                	add    %ecx,%eax
    9254:	83 c0 14             	add    $0x14,%eax
    9257:	8b 0c 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    925e:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9261:	89 d0                	mov    %edx,%eax
    9263:	c1 e0 03             	shl    $0x3,%eax
    9266:	01 d0                	add    %edx,%eax
    9268:	c1 e0 02             	shl    $0x2,%eax
    926b:	01 d0                	add    %edx,%eax
    926d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9270:	01 d0                	add    %edx,%eax
    9272:	83 c0 14             	add    $0x14,%eax
    9275:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    927c:	29 c1                	sub    %eax,%ecx
    927e:	89 c8                	mov    %ecx,%eax
    9280:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9283:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9286:	89 d0                	mov    %edx,%eax
    9288:	c1 e0 03             	shl    $0x3,%eax
    928b:	01 d0                	add    %edx,%eax
    928d:	c1 e0 02             	shl    $0x2,%eax
    9290:	01 d0                	add    %edx,%eax
    9292:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9295:	01 d0                	add    %edx,%eax
    9297:	83 c0 14             	add    $0x14,%eax
    929a:	8b 14 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%edx
    92a1:	89 d0                	mov    %edx,%eax
    92a3:	01 c0                	add    %eax,%eax
    92a5:	01 d0                	add    %edx,%eax
    92a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    92aa:	e9 c4 00 00 00       	jmp    9373 <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    92af:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    92b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    92b6:	8d 48 01             	lea    0x1(%eax),%ecx
    92b9:	8b 55 dc             	mov    -0x24(%ebp),%edx
    92bc:	89 d0                	mov    %edx,%eax
    92be:	c1 e0 03             	shl    $0x3,%eax
    92c1:	01 d0                	add    %edx,%eax
    92c3:	c1 e0 02             	shl    $0x2,%eax
    92c6:	01 d0                	add    %edx,%eax
    92c8:	01 c8                	add    %ecx,%eax
    92ca:	83 c0 14             	add    $0x14,%eax
    92cd:	8b 14 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%edx
    92d4:	89 d0                	mov    %edx,%eax
    92d6:	01 c0                	add    %eax,%eax
    92d8:	01 d0                	add    %edx,%eax
    92da:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    92dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    92e0:	8d 48 01             	lea    0x1(%eax),%ecx
    92e3:	8b 55 dc             	mov    -0x24(%ebp),%edx
    92e6:	89 d0                	mov    %edx,%eax
    92e8:	c1 e0 03             	shl    $0x3,%eax
    92eb:	01 d0                	add    %edx,%eax
    92ed:	c1 e0 02             	shl    $0x2,%eax
    92f0:	01 d0                	add    %edx,%eax
    92f2:	01 c8                	add    %ecx,%eax
    92f4:	83 c0 14             	add    $0x14,%eax
    92f7:	8b 0c 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    92fe:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9301:	89 d0                	mov    %edx,%eax
    9303:	c1 e0 03             	shl    $0x3,%eax
    9306:	01 d0                	add    %edx,%eax
    9308:	c1 e0 02             	shl    $0x2,%eax
    930b:	01 d0                	add    %edx,%eax
    930d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9310:	01 d0                	add    %edx,%eax
    9312:	83 c0 14             	add    $0x14,%eax
    9315:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    931c:	29 c1                	sub    %eax,%ecx
    931e:	89 c8                	mov    %ecx,%eax
    9320:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9323:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9326:	89 d0                	mov    %edx,%eax
    9328:	c1 e0 03             	shl    $0x3,%eax
    932b:	01 d0                	add    %edx,%eax
    932d:	c1 e0 02             	shl    $0x2,%eax
    9330:	01 d0                	add    %edx,%eax
    9332:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9335:	01 d0                	add    %edx,%eax
    9337:	83 c0 14             	add    $0x14,%eax
    933a:	8b 14 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%edx
    9341:	89 d0                	mov    %edx,%eax
    9343:	01 c0                	add    %eax,%eax
    9345:	01 d0                	add    %edx,%eax
    9347:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    934a:	eb 27                	jmp    9373 <III_dequantize_sample+0x371>
    934c:	eb 25                	jmp    9373 <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    934e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9352:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9355:	8d 48 01             	lea    0x1(%eax),%ecx
    9358:	8b 55 dc             	mov    -0x24(%ebp),%edx
    935b:	89 d0                	mov    %edx,%eax
    935d:	c1 e0 03             	shl    $0x3,%eax
    9360:	01 d0                	add    %edx,%eax
    9362:	c1 e0 02             	shl    $0x2,%eax
    9365:	01 d0                	add    %edx,%eax
    9367:	01 c8                	add    %ecx,%eax
    9369:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    9370:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    9373:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9376:	89 d0                	mov    %edx,%eax
    9378:	c1 e0 03             	shl    $0x3,%eax
    937b:	01 d0                	add    %edx,%eax
    937d:	c1 e0 04             	shl    $0x4,%eax
    9380:	89 c2                	mov    %eax,%edx
    9382:	8b 45 0c             	mov    0xc(%ebp),%eax
    9385:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9388:	8b 45 14             	mov    0x14(%ebp),%eax
    938b:	8b 40 08             	mov    0x8(%eax),%eax
    938e:	ba 00 00 00 00       	mov    $0x0,%edx
    9393:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9396:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9399:	df 6d c8             	fildll -0x38(%ebp)
    939c:	dd 05 90 e4 00 00    	fldl   0xe490
    93a2:	de e9                	fsubrp %st,%st(1)
    93a4:	dd 05 98 e4 00 00    	fldl   0xe498
    93aa:	de c9                	fmulp  %st,%st(1)
    93ac:	dd 5c 24 08          	fstpl  0x8(%esp)
    93b0:	dd 05 a0 e4 00 00    	fldl   0xe4a0
    93b6:	dd 1c 24             	fstpl  (%esp)
    93b9:	e8 0c c1 ff ff       	call   54ca <pow>
    93be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93c1:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    93c4:	8b 45 14             	mov    0x14(%ebp),%eax
    93c7:	8b 40 10             	mov    0x10(%eax),%eax
    93ca:	85 c0                	test   %eax,%eax
    93cc:	0f 84 86 01 00 00    	je     9558 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    93d2:	8b 45 14             	mov    0x14(%ebp),%eax
    93d5:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    93d8:	83 f8 02             	cmp    $0x2,%eax
    93db:	75 0a                	jne    93e7 <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    93dd:	8b 45 14             	mov    0x14(%ebp),%eax
    93e0:	8b 40 18             	mov    0x18(%eax),%eax
    93e3:	85 c0                	test   %eax,%eax
    93e5:	74 27                	je     940e <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    93e7:	8b 45 14             	mov    0x14(%ebp),%eax
    93ea:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    93ed:	83 f8 02             	cmp    $0x2,%eax
    93f0:	0f 85 62 01 00 00    	jne    9558 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    93f6:	8b 45 14             	mov    0x14(%ebp),%eax
    93f9:	8b 40 18             	mov    0x18(%eax),%eax
    93fc:	85 c0                	test   %eax,%eax
    93fe:	0f 84 54 01 00 00    	je     9558 <III_dequantize_sample+0x556>
    9404:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9408:	0f 8e 4a 01 00 00    	jle    9558 <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    940e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9411:	89 d0                	mov    %edx,%eax
    9413:	c1 e0 03             	shl    $0x3,%eax
    9416:	01 d0                	add    %edx,%eax
    9418:	c1 e0 04             	shl    $0x4,%eax
    941b:	89 c2                	mov    %eax,%edx
    941d:	8b 45 0c             	mov    0xc(%ebp),%eax
    9420:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9423:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9426:	89 d0                	mov    %edx,%eax
    9428:	c1 e0 03             	shl    $0x3,%eax
    942b:	01 d0                	add    %edx,%eax
    942d:	c1 e0 04             	shl    $0x4,%eax
    9430:	89 c2                	mov    %eax,%edx
    9432:	8b 45 0c             	mov    0xc(%ebp),%eax
    9435:	01 c2                	add    %eax,%edx
    9437:	8b 45 f4             	mov    -0xc(%ebp),%eax
    943a:	dd 04 c2             	fldl   (%edx,%eax,8)
    943d:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    9440:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9443:	89 d0                	mov    %edx,%eax
    9445:	c1 e0 03             	shl    $0x3,%eax
    9448:	01 d0                	add    %edx,%eax
    944a:	01 c0                	add    %eax,%eax
    944c:	89 c2                	mov    %eax,%edx
    944e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9451:	01 d0                	add    %edx,%eax
    9453:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    9456:	99                   	cltd   
    9457:	f7 7d e0             	idivl  -0x20(%ebp)
    945a:	89 c2                	mov    %eax,%edx
    945c:	8b 45 14             	mov    0x14(%ebp),%eax
    945f:	83 c2 08             	add    $0x8,%edx
    9462:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    9466:	ba 00 00 00 00       	mov    $0x0,%edx
    946b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    946e:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9471:	df 6d c8             	fildll -0x38(%ebp)
    9474:	dd 05 a8 e4 00 00    	fldl   0xe4a8
    947a:	de c9                	fmulp  %st,%st(1)
    947c:	dd 5c 24 08          	fstpl  0x8(%esp)
    9480:	dd 05 a0 e4 00 00    	fldl   0xe4a0
    9486:	dd 1c 24             	fstpl  (%esp)
    9489:	e8 3c c0 ff ff       	call   54ca <pow>
    948e:	dc 4d c0             	fmull  -0x40(%ebp)
    9491:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9494:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    9497:	8b 55 f0             	mov    -0x10(%ebp),%edx
    949a:	89 d0                	mov    %edx,%eax
    949c:	c1 e0 03             	shl    $0x3,%eax
    949f:	01 d0                	add    %edx,%eax
    94a1:	c1 e0 04             	shl    $0x4,%eax
    94a4:	89 c2                	mov    %eax,%edx
    94a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    94a9:	8d 34 02             	lea    (%edx,%eax,1),%esi
    94ac:	8b 55 f0             	mov    -0x10(%ebp),%edx
    94af:	89 d0                	mov    %edx,%eax
    94b1:	c1 e0 03             	shl    $0x3,%eax
    94b4:	01 d0                	add    %edx,%eax
    94b6:	c1 e0 04             	shl    $0x4,%eax
    94b9:	89 c2                	mov    %eax,%edx
    94bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    94be:	01 c2                	add    %eax,%edx
    94c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94c3:	dd 04 c2             	fldl   (%edx,%eax,8)
    94c6:	dd 5d c0             	fstpl  -0x40(%ebp)
    94c9:	8b 45 14             	mov    0x14(%ebp),%eax
    94cc:	8b 40 40             	mov    0x40(%eax),%eax
    94cf:	ba 00 00 00 00       	mov    $0x0,%edx
    94d4:	89 45 c8             	mov    %eax,-0x38(%ebp)
    94d7:	89 55 cc             	mov    %edx,-0x34(%ebp)
    94da:	df 6d c8             	fildll -0x38(%ebp)
    94dd:	d9 e8                	fld1   
    94df:	de c1                	faddp  %st,%st(1)
    94e1:	dd 05 b0 e4 00 00    	fldl   0xe4b0
    94e7:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    94e9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    94ec:	89 d0                	mov    %edx,%eax
    94ee:	c1 e0 03             	shl    $0x3,%eax
    94f1:	01 d0                	add    %edx,%eax
    94f3:	01 c0                	add    %eax,%eax
    94f5:	89 c2                	mov    %eax,%edx
    94f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94fa:	01 d0                	add    %edx,%eax
    94fc:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    94ff:	99                   	cltd   
    9500:	f7 7d e0             	idivl  -0x20(%ebp)
    9503:	89 c2                	mov    %eax,%edx
    9505:	8b 5d 10             	mov    0x10(%ebp),%ebx
    9508:	8b 4d 18             	mov    0x18(%ebp),%ecx
    950b:	89 d0                	mov    %edx,%eax
    950d:	01 c0                	add    %eax,%eax
    950f:	01 d0                	add    %edx,%eax
    9511:	c1 e0 02             	shl    $0x2,%eax
    9514:	01 d0                	add    %edx,%eax
    9516:	89 ca                	mov    %ecx,%edx
    9518:	01 d2                	add    %edx,%edx
    951a:	89 d1                	mov    %edx,%ecx
    951c:	c1 e1 05             	shl    $0x5,%ecx
    951f:	29 d1                	sub    %edx,%ecx
    9521:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    9524:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9527:	01 d0                	add    %edx,%eax
    9529:	83 c0 14             	add    $0x14,%eax
    952c:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    9530:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    9533:	db 45 d4             	fildl  -0x2c(%ebp)
    9536:	de c9                	fmulp  %st,%st(1)
    9538:	dd 5c 24 08          	fstpl  0x8(%esp)
    953c:	dd 05 a0 e4 00 00    	fldl   0xe4a0
    9542:	dd 1c 24             	fstpl  (%esp)
    9545:	e8 80 bf ff ff       	call   54ca <pow>
    954a:	dc 4d c0             	fmull  -0x40(%ebp)
    954d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9550:	dd 1c c6             	fstpl  (%esi,%eax,8)
    9553:	e9 ab 00 00 00       	jmp    9603 <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    9558:	8b 55 f0             	mov    -0x10(%ebp),%edx
    955b:	89 d0                	mov    %edx,%eax
    955d:	c1 e0 03             	shl    $0x3,%eax
    9560:	01 d0                	add    %edx,%eax
    9562:	c1 e0 04             	shl    $0x4,%eax
    9565:	89 c2                	mov    %eax,%edx
    9567:	8b 45 0c             	mov    0xc(%ebp),%eax
    956a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    956d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9570:	89 d0                	mov    %edx,%eax
    9572:	c1 e0 03             	shl    $0x3,%eax
    9575:	01 d0                	add    %edx,%eax
    9577:	c1 e0 04             	shl    $0x4,%eax
    957a:	89 c2                	mov    %eax,%edx
    957c:	8b 45 0c             	mov    0xc(%ebp),%eax
    957f:	01 c2                	add    %eax,%edx
    9581:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9584:	dd 04 c2             	fldl   (%edx,%eax,8)
    9587:	dd 5d c0             	fstpl  -0x40(%ebp)
    958a:	8b 45 14             	mov    0x14(%ebp),%eax
    958d:	8b 40 40             	mov    0x40(%eax),%eax
    9590:	ba 00 00 00 00       	mov    $0x0,%edx
    9595:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9598:	89 55 cc             	mov    %edx,-0x34(%ebp)
    959b:	df 6d c8             	fildll -0x38(%ebp)
    959e:	d9 e8                	fld1   
    95a0:	de c1                	faddp  %st,%st(1)
    95a2:	dd 05 b0 e4 00 00    	fldl   0xe4b0
    95a8:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    95aa:	8b 4d 10             	mov    0x10(%ebp),%ecx
    95ad:	8b 45 18             	mov    0x18(%ebp),%eax
    95b0:	01 c0                	add    %eax,%eax
    95b2:	89 c2                	mov    %eax,%edx
    95b4:	c1 e2 05             	shl    $0x5,%edx
    95b7:	29 c2                	sub    %eax,%edx
    95b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    95bc:	01 d0                	add    %edx,%eax
    95be:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    95c1:	89 c2                	mov    %eax,%edx
    95c3:	8b 45 14             	mov    0x14(%ebp),%eax
    95c6:	8b 48 3c             	mov    0x3c(%eax),%ecx
    95c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    95cc:	8b 04 85 e0 01 01 00 	mov    0x101e0(,%eax,4),%eax
    95d3:	0f af c1             	imul   %ecx,%eax
    95d6:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    95d8:	ba 00 00 00 00       	mov    $0x0,%edx
    95dd:	89 45 c8             	mov    %eax,-0x38(%ebp)
    95e0:	89 55 cc             	mov    %edx,-0x34(%ebp)
    95e3:	df 6d c8             	fildll -0x38(%ebp)
    95e6:	de c9                	fmulp  %st,%st(1)
    95e8:	dd 5c 24 08          	fstpl  0x8(%esp)
    95ec:	dd 05 a0 e4 00 00    	fldl   0xe4a0
    95f2:	dd 1c 24             	fstpl  (%esp)
    95f5:	e8 d0 be ff ff       	call   54ca <pow>
    95fa:	dc 4d c0             	fmull  -0x40(%ebp)
    95fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9600:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    9603:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9606:	89 d0                	mov    %edx,%eax
    9608:	c1 e0 03             	shl    $0x3,%eax
    960b:	01 d0                	add    %edx,%eax
    960d:	c1 e0 03             	shl    $0x3,%eax
    9610:	89 c2                	mov    %eax,%edx
    9612:	8b 45 08             	mov    0x8(%ebp),%eax
    9615:	01 c2                	add    %eax,%edx
    9617:	8b 45 f4             	mov    -0xc(%ebp),%eax
    961a:	8b 04 82             	mov    (%edx,%eax,4),%eax
    961d:	c1 e8 1f             	shr    $0x1f,%eax
    9620:	0f b6 c0             	movzbl %al,%eax
    9623:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    9626:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9629:	89 d0                	mov    %edx,%eax
    962b:	c1 e0 03             	shl    $0x3,%eax
    962e:	01 d0                	add    %edx,%eax
    9630:	c1 e0 04             	shl    $0x4,%eax
    9633:	89 c2                	mov    %eax,%edx
    9635:	8b 45 0c             	mov    0xc(%ebp),%eax
    9638:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    963b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    963e:	89 d0                	mov    %edx,%eax
    9640:	c1 e0 03             	shl    $0x3,%eax
    9643:	01 d0                	add    %edx,%eax
    9645:	c1 e0 04             	shl    $0x4,%eax
    9648:	89 c2                	mov    %eax,%edx
    964a:	8b 45 0c             	mov    0xc(%ebp),%eax
    964d:	01 c2                	add    %eax,%edx
    964f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9652:	dd 04 c2             	fldl   (%edx,%eax,8)
    9655:	dd 5d c0             	fstpl  -0x40(%ebp)
    9658:	8b 55 f0             	mov    -0x10(%ebp),%edx
    965b:	89 d0                	mov    %edx,%eax
    965d:	c1 e0 03             	shl    $0x3,%eax
    9660:	01 d0                	add    %edx,%eax
    9662:	c1 e0 03             	shl    $0x3,%eax
    9665:	89 c2                	mov    %eax,%edx
    9667:	8b 45 08             	mov    0x8(%ebp),%eax
    966a:	01 c2                	add    %eax,%edx
    966c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    966f:	8b 04 82             	mov    (%edx,%eax,4),%eax
    9672:	89 04 24             	mov    %eax,(%esp)
    9675:	e8 47 bd ff ff       	call   53c1 <abs>
    967a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    967d:	db 45 d4             	fildl  -0x2c(%ebp)
    9680:	dd 05 b8 e4 00 00    	fldl   0xe4b8
    9686:	dd 5c 24 08          	fstpl  0x8(%esp)
    968a:	dd 1c 24             	fstpl  (%esp)
    968d:	e8 38 be ff ff       	call   54ca <pow>
    9692:	dc 4d c0             	fmull  -0x40(%ebp)
    9695:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9698:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    969b:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    969f:	74 37                	je     96d8 <III_dequantize_sample+0x6d6>
    96a1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    96a4:	89 d0                	mov    %edx,%eax
    96a6:	c1 e0 03             	shl    $0x3,%eax
    96a9:	01 d0                	add    %edx,%eax
    96ab:	c1 e0 04             	shl    $0x4,%eax
    96ae:	89 c2                	mov    %eax,%edx
    96b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    96b3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    96b6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    96b9:	89 d0                	mov    %edx,%eax
    96bb:	c1 e0 03             	shl    $0x3,%eax
    96be:	01 d0                	add    %edx,%eax
    96c0:	c1 e0 04             	shl    $0x4,%eax
    96c3:	89 c2                	mov    %eax,%edx
    96c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    96c8:	01 c2                	add    %eax,%edx
    96ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    96cd:	dd 04 c2             	fldl   (%edx,%eax,8)
    96d0:	d9 e0                	fchs   
    96d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    96d5:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    96d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    96dc:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    96e0:	0f 8e d3 f9 ff ff    	jle    90b9 <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    96e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    96ea:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    96ee:	0f 8e b9 f9 ff ff    	jle    90ad <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    96f4:	83 c4 50             	add    $0x50,%esp
    96f7:	5b                   	pop    %ebx
    96f8:	5e                   	pop    %esi
    96f9:	5d                   	pop    %ebp
    96fa:	c3                   	ret    

000096fb <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    96fb:	55                   	push   %ebp
    96fc:	89 e5                	mov    %esp,%ebp
    96fe:	57                   	push   %edi
    96ff:	56                   	push   %esi
    9700:	53                   	push   %ebx
    9701:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    9704:	8b 45 14             	mov    0x14(%ebp),%eax
    9707:	8b 00                	mov    (%eax),%eax
    9709:	8b 40 10             	mov    0x10(%eax),%eax
    970c:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    970f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9716:	eb 33                	jmp    974b <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    9718:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    971f:	eb 20                	jmp    9741 <III_reorder+0x46>
         ro[sb][ss] = 0;
    9721:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9724:	89 d0                	mov    %edx,%eax
    9726:	c1 e0 03             	shl    $0x3,%eax
    9729:	01 d0                	add    %edx,%eax
    972b:	c1 e0 04             	shl    $0x4,%eax
    972e:	89 c2                	mov    %eax,%edx
    9730:	8b 45 0c             	mov    0xc(%ebp),%eax
    9733:	01 c2                	add    %eax,%edx
    9735:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9738:	d9 ee                	fldz   
    973a:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    973d:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9741:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9745:	7e da                	jle    9721 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    9747:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    974b:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    974f:	7e c7                	jle    9718 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    9751:	8b 45 10             	mov    0x10(%ebp),%eax
    9754:	8b 40 10             	mov    0x10(%eax),%eax
    9757:	85 c0                	test   %eax,%eax
    9759:	0f 84 af 03 00 00    	je     9b0e <III_reorder+0x413>
    975f:	8b 45 10             	mov    0x10(%ebp),%eax
    9762:	8b 40 14             	mov    0x14(%eax),%eax
    9765:	83 f8 02             	cmp    $0x2,%eax
    9768:	0f 85 a0 03 00 00    	jne    9b0e <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    976e:	8b 45 10             	mov    0x10(%ebp),%eax
    9771:	8b 40 18             	mov    0x18(%eax),%eax
    9774:	85 c0                	test   %eax,%eax
    9776:	0f 84 00 02 00 00    	je     997c <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    977c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9783:	eb 4c                	jmp    97d1 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    9785:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    978c:	eb 39                	jmp    97c7 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    978e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9791:	89 d0                	mov    %edx,%eax
    9793:	c1 e0 03             	shl    $0x3,%eax
    9796:	01 d0                	add    %edx,%eax
    9798:	c1 e0 04             	shl    $0x4,%eax
    979b:	89 c2                	mov    %eax,%edx
    979d:	8b 45 0c             	mov    0xc(%ebp),%eax
    97a0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    97a3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    97a6:	89 d0                	mov    %edx,%eax
    97a8:	c1 e0 03             	shl    $0x3,%eax
    97ab:	01 d0                	add    %edx,%eax
    97ad:	c1 e0 04             	shl    $0x4,%eax
    97b0:	89 c2                	mov    %eax,%edx
    97b2:	8b 45 08             	mov    0x8(%ebp),%eax
    97b5:	01 c2                	add    %eax,%edx
    97b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    97ba:	dd 04 c2             	fldl   (%edx,%eax,8)
    97bd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    97c0:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    97c3:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    97c7:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    97cb:	7e c1                	jle    978e <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    97cd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    97d1:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    97d5:	7e ae                	jle    9785 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    97d7:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    97de:	8b 45 d0             	mov    -0x30(%ebp),%eax
    97e1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    97e7:	05 7c 00 01 00       	add    $0x1007c,%eax
    97ec:	8b 40 0c             	mov    0xc(%eax),%eax
    97ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    97f2:	8b 45 d0             	mov    -0x30(%ebp),%eax
    97f5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    97fb:	05 80 00 01 00       	add    $0x10080,%eax
    9800:	8b 40 0c             	mov    0xc(%eax),%eax
    9803:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9806:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9809:	e9 5f 01 00 00       	jmp    996d <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    980e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    9815:	e9 fd 00 00 00       	jmp    9917 <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    981a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    9821:	e9 e1 00 00 00       	jmp    9907 <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    9826:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9829:	89 d0                	mov    %edx,%eax
    982b:	01 c0                	add    %eax,%eax
    982d:	01 c2                	add    %eax,%edx
    982f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9832:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    9836:	01 c2                	add    %eax,%edx
    9838:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    983b:	01 d0                	add    %edx,%eax
    983d:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    9840:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9843:	89 d0                	mov    %edx,%eax
    9845:	01 c0                	add    %eax,%eax
    9847:	01 c2                	add    %eax,%edx
    9849:	8b 45 d8             	mov    -0x28(%ebp),%eax
    984c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    984f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    9852:	89 d0                	mov    %edx,%eax
    9854:	01 c0                	add    %eax,%eax
    9856:	01 d0                	add    %edx,%eax
    9858:	01 c8                	add    %ecx,%eax
    985a:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    985d:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    9860:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9865:	89 c8                	mov    %ecx,%eax
    9867:	f7 ea                	imul   %edx
    9869:	c1 fa 02             	sar    $0x2,%edx
    986c:	89 c8                	mov    %ecx,%eax
    986e:	c1 f8 1f             	sar    $0x1f,%eax
    9871:	29 c2                	sub    %eax,%edx
    9873:	89 d0                	mov    %edx,%eax
    9875:	89 c2                	mov    %eax,%edx
    9877:	89 d0                	mov    %edx,%eax
    9879:	c1 e0 03             	shl    $0x3,%eax
    987c:	01 d0                	add    %edx,%eax
    987e:	c1 e0 04             	shl    $0x4,%eax
    9881:	89 c2                	mov    %eax,%edx
    9883:	8b 45 0c             	mov    0xc(%ebp),%eax
    9886:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9889:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    988c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9891:	89 d8                	mov    %ebx,%eax
    9893:	f7 ea                	imul   %edx
    9895:	c1 fa 02             	sar    $0x2,%edx
    9898:	89 d8                	mov    %ebx,%eax
    989a:	c1 f8 1f             	sar    $0x1f,%eax
    989d:	89 d1                	mov    %edx,%ecx
    989f:	29 c1                	sub    %eax,%ecx
    98a1:	89 c8                	mov    %ecx,%eax
    98a3:	c1 e0 03             	shl    $0x3,%eax
    98a6:	01 c8                	add    %ecx,%eax
    98a8:	01 c0                	add    %eax,%eax
    98aa:	29 c3                	sub    %eax,%ebx
    98ac:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    98ae:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    98b1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    98b6:	89 d8                	mov    %ebx,%eax
    98b8:	f7 ea                	imul   %edx
    98ba:	c1 fa 02             	sar    $0x2,%edx
    98bd:	89 d8                	mov    %ebx,%eax
    98bf:	c1 f8 1f             	sar    $0x1f,%eax
    98c2:	29 c2                	sub    %eax,%edx
    98c4:	89 d0                	mov    %edx,%eax
    98c6:	89 c2                	mov    %eax,%edx
    98c8:	89 d0                	mov    %edx,%eax
    98ca:	c1 e0 03             	shl    $0x3,%eax
    98cd:	01 d0                	add    %edx,%eax
    98cf:	c1 e0 04             	shl    $0x4,%eax
    98d2:	89 c2                	mov    %eax,%edx
    98d4:	8b 45 08             	mov    0x8(%ebp),%eax
    98d7:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    98da:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    98dd:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    98e2:	89 d8                	mov    %ebx,%eax
    98e4:	f7 ea                	imul   %edx
    98e6:	c1 fa 02             	sar    $0x2,%edx
    98e9:	89 d8                	mov    %ebx,%eax
    98eb:	c1 f8 1f             	sar    $0x1f,%eax
    98ee:	29 c2                	sub    %eax,%edx
    98f0:	89 d0                	mov    %edx,%eax
    98f2:	c1 e0 03             	shl    $0x3,%eax
    98f5:	01 d0                	add    %edx,%eax
    98f7:	01 c0                	add    %eax,%eax
    98f9:	29 c3                	sub    %eax,%ebx
    98fb:	89 da                	mov    %ebx,%edx
    98fd:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9900:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9903:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9907:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    990a:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    990d:	0f 8c 13 ff ff ff    	jl     9826 <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9913:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9917:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    991b:	0f 8e f9 fe ff ff    	jle    981a <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9921:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9925:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9928:	89 d0                	mov    %edx,%eax
    992a:	c1 e0 03             	shl    $0x3,%eax
    992d:	01 d0                	add    %edx,%eax
    992f:	c1 e0 02             	shl    $0x2,%eax
    9932:	01 d0                	add    %edx,%eax
    9934:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9937:	01 d0                	add    %edx,%eax
    9939:	83 c0 14             	add    $0x14,%eax
    993c:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
    9943:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9946:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9949:	8d 48 01             	lea    0x1(%eax),%ecx
    994c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    994f:	89 d0                	mov    %edx,%eax
    9951:	c1 e0 03             	shl    $0x3,%eax
    9954:	01 d0                	add    %edx,%eax
    9956:	c1 e0 02             	shl    $0x2,%eax
    9959:	01 d0                	add    %edx,%eax
    995b:	01 c8                	add    %ecx,%eax
    995d:	83 c0 14             	add    $0x14,%eax
    9960:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
    9967:	2b 45 e8             	sub    -0x18(%ebp),%eax
    996a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    996d:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9971:	0f 8e 97 fe ff ff    	jle    980e <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9977:	e9 ed 01 00 00       	jmp    9b69 <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    997c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9983:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    998a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    998d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9993:	05 74 00 01 00       	add    $0x10074,%eax
    9998:	8b 40 0c             	mov    0xc(%eax),%eax
    999b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    999e:	e9 5f 01 00 00       	jmp    9b02 <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    99a3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    99aa:	e9 fd 00 00 00       	jmp    9aac <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    99af:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    99b6:	e9 e1 00 00 00       	jmp    9a9c <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    99bb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    99be:	89 d0                	mov    %edx,%eax
    99c0:	01 c0                	add    %eax,%eax
    99c2:	01 c2                	add    %eax,%edx
    99c4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    99c7:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    99cb:	01 c2                	add    %eax,%edx
    99cd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    99d0:	01 d0                	add    %edx,%eax
    99d2:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    99d5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    99d8:	89 d0                	mov    %edx,%eax
    99da:	01 c0                	add    %eax,%eax
    99dc:	01 c2                	add    %eax,%edx
    99de:	8b 45 d8             	mov    -0x28(%ebp),%eax
    99e1:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    99e4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    99e7:	89 d0                	mov    %edx,%eax
    99e9:	01 c0                	add    %eax,%eax
    99eb:	01 d0                	add    %edx,%eax
    99ed:	01 c8                	add    %ecx,%eax
    99ef:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    99f2:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    99f5:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    99fa:	89 c8                	mov    %ecx,%eax
    99fc:	f7 ea                	imul   %edx
    99fe:	c1 fa 02             	sar    $0x2,%edx
    9a01:	89 c8                	mov    %ecx,%eax
    9a03:	c1 f8 1f             	sar    $0x1f,%eax
    9a06:	29 c2                	sub    %eax,%edx
    9a08:	89 d0                	mov    %edx,%eax
    9a0a:	89 c2                	mov    %eax,%edx
    9a0c:	89 d0                	mov    %edx,%eax
    9a0e:	c1 e0 03             	shl    $0x3,%eax
    9a11:	01 d0                	add    %edx,%eax
    9a13:	c1 e0 04             	shl    $0x4,%eax
    9a16:	89 c2                	mov    %eax,%edx
    9a18:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a1b:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9a1e:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    9a21:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a26:	89 d8                	mov    %ebx,%eax
    9a28:	f7 ea                	imul   %edx
    9a2a:	c1 fa 02             	sar    $0x2,%edx
    9a2d:	89 d8                	mov    %ebx,%eax
    9a2f:	c1 f8 1f             	sar    $0x1f,%eax
    9a32:	89 d1                	mov    %edx,%ecx
    9a34:	29 c1                	sub    %eax,%ecx
    9a36:	89 c8                	mov    %ecx,%eax
    9a38:	c1 e0 03             	shl    $0x3,%eax
    9a3b:	01 c8                	add    %ecx,%eax
    9a3d:	01 c0                	add    %eax,%eax
    9a3f:	29 c3                	sub    %eax,%ebx
    9a41:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    9a43:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9a46:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a4b:	89 d8                	mov    %ebx,%eax
    9a4d:	f7 ea                	imul   %edx
    9a4f:	c1 fa 02             	sar    $0x2,%edx
    9a52:	89 d8                	mov    %ebx,%eax
    9a54:	c1 f8 1f             	sar    $0x1f,%eax
    9a57:	29 c2                	sub    %eax,%edx
    9a59:	89 d0                	mov    %edx,%eax
    9a5b:	89 c2                	mov    %eax,%edx
    9a5d:	89 d0                	mov    %edx,%eax
    9a5f:	c1 e0 03             	shl    $0x3,%eax
    9a62:	01 d0                	add    %edx,%eax
    9a64:	c1 e0 04             	shl    $0x4,%eax
    9a67:	89 c2                	mov    %eax,%edx
    9a69:	8b 45 08             	mov    0x8(%ebp),%eax
    9a6c:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9a6f:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9a72:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a77:	89 d8                	mov    %ebx,%eax
    9a79:	f7 ea                	imul   %edx
    9a7b:	c1 fa 02             	sar    $0x2,%edx
    9a7e:	89 d8                	mov    %ebx,%eax
    9a80:	c1 f8 1f             	sar    $0x1f,%eax
    9a83:	29 c2                	sub    %eax,%edx
    9a85:	89 d0                	mov    %edx,%eax
    9a87:	c1 e0 03             	shl    $0x3,%eax
    9a8a:	01 d0                	add    %edx,%eax
    9a8c:	01 c0                	add    %eax,%eax
    9a8e:	29 c3                	sub    %eax,%ebx
    9a90:	89 da                	mov    %ebx,%edx
    9a92:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9a95:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9a98:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9a9c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9a9f:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9aa2:	0f 8c 13 ff ff ff    	jl     99bb <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9aa8:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9aac:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9ab0:	0f 8e f9 fe ff ff    	jle    99af <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9ab6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9aba:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9abd:	89 d0                	mov    %edx,%eax
    9abf:	c1 e0 03             	shl    $0x3,%eax
    9ac2:	01 d0                	add    %edx,%eax
    9ac4:	c1 e0 02             	shl    $0x2,%eax
    9ac7:	01 d0                	add    %edx,%eax
    9ac9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9acc:	01 d0                	add    %edx,%eax
    9ace:	83 c0 14             	add    $0x14,%eax
    9ad1:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
    9ad8:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9adb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ade:	8d 48 01             	lea    0x1(%eax),%ecx
    9ae1:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9ae4:	89 d0                	mov    %edx,%eax
    9ae6:	c1 e0 03             	shl    $0x3,%eax
    9ae9:	01 d0                	add    %edx,%eax
    9aeb:	c1 e0 02             	shl    $0x2,%eax
    9aee:	01 d0                	add    %edx,%eax
    9af0:	01 c8                	add    %ecx,%eax
    9af2:	83 c0 14             	add    $0x14,%eax
    9af5:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
    9afc:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9aff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    9b02:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9b06:	0f 8e 97 fe ff ff    	jle    99a3 <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9b0c:	eb 5b                	jmp    9b69 <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9b0e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9b15:	eb 4c                	jmp    9b63 <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9b17:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9b1e:	eb 39                	jmp    9b59 <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    9b20:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9b23:	89 d0                	mov    %edx,%eax
    9b25:	c1 e0 03             	shl    $0x3,%eax
    9b28:	01 d0                	add    %edx,%eax
    9b2a:	c1 e0 04             	shl    $0x4,%eax
    9b2d:	89 c2                	mov    %eax,%edx
    9b2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b32:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9b35:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9b38:	89 d0                	mov    %edx,%eax
    9b3a:	c1 e0 03             	shl    $0x3,%eax
    9b3d:	01 d0                	add    %edx,%eax
    9b3f:	c1 e0 04             	shl    $0x4,%eax
    9b42:	89 c2                	mov    %eax,%edx
    9b44:	8b 45 08             	mov    0x8(%ebp),%eax
    9b47:	01 c2                	add    %eax,%edx
    9b49:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9b4c:	dd 04 c2             	fldl   (%edx,%eax,8)
    9b4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9b52:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9b55:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9b59:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9b5d:	7e c1                	jle    9b20 <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9b5f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9b63:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    9b67:	7e ae                	jle    9b17 <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    9b69:	83 c4 34             	add    $0x34,%esp
    9b6c:	5b                   	pop    %ebx
    9b6d:	5e                   	pop    %esi
    9b6e:	5f                   	pop    %edi
    9b6f:	5d                   	pop    %ebp
    9b70:	c3                   	ret    

00009b71 <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9b71:	55                   	push   %ebp
    9b72:	89 e5                	mov    %esp,%ebp
    9b74:	56                   	push   %esi
    9b75:	53                   	push   %ebx
    9b76:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    9b7c:	8b 45 18             	mov    0x18(%ebp),%eax
    9b7f:	8b 00                	mov    (%eax),%eax
    9b81:	8b 40 10             	mov    0x10(%eax),%eax
    9b84:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    9b87:	8b 45 18             	mov    0x18(%ebp),%eax
    9b8a:	8b 40 08             	mov    0x8(%eax),%eax
    9b8d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9b90:	8b 45 18             	mov    0x18(%ebp),%eax
    9b93:	8b 00                	mov    (%eax),%eax
    9b95:	8b 40 1c             	mov    0x1c(%eax),%eax
    9b98:	83 f8 01             	cmp    $0x1,%eax
    9b9b:	75 16                	jne    9bb3 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    9b9d:	8b 45 18             	mov    0x18(%ebp),%eax
    9ba0:	8b 00                	mov    (%eax),%eax
    9ba2:	8b 40 20             	mov    0x20(%eax),%eax
    9ba5:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9ba8:	85 c0                	test   %eax,%eax
    9baa:	74 07                	je     9bb3 <III_stereo+0x42>
    9bac:	b8 01 00 00 00       	mov    $0x1,%eax
    9bb1:	eb 05                	jmp    9bb8 <III_stereo+0x47>
    9bb3:	b8 00 00 00 00       	mov    $0x0,%eax
    9bb8:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9bbb:	8b 45 18             	mov    0x18(%ebp),%eax
    9bbe:	8b 00                	mov    (%eax),%eax
    9bc0:	8b 40 1c             	mov    0x1c(%eax),%eax
    9bc3:	83 f8 01             	cmp    $0x1,%eax
    9bc6:	75 16                	jne    9bde <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    9bc8:	8b 45 18             	mov    0x18(%ebp),%eax
    9bcb:	8b 00                	mov    (%eax),%eax
    9bcd:	8b 40 20             	mov    0x20(%eax),%eax
    9bd0:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9bd3:	85 c0                	test   %eax,%eax
    9bd5:	74 07                	je     9bde <III_stereo+0x6d>
    9bd7:	b8 01 00 00 00       	mov    $0x1,%eax
    9bdc:	eb 05                	jmp    9be3 <III_stereo+0x72>
    9bde:	b8 00 00 00 00       	mov    $0x0,%eax
    9be3:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9be6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9bed:	eb 12                	jmp    9c01 <III_stereo+0x90>
      is_pos[i] = 7;
    9bef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9bf2:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    9bf9:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9bfd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9c01:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    9c08:	7e e5                	jle    9bef <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    9c0a:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9c0e:	0f 85 18 0a 00 00    	jne    a62c <III_stereo+0xabb>
    9c14:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9c18:	0f 84 0e 0a 00 00    	je     a62c <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    9c1e:	8b 45 14             	mov    0x14(%ebp),%eax
    9c21:	8b 40 10             	mov    0x10(%eax),%eax
    9c24:	85 c0                	test   %eax,%eax
    9c26:	0f 84 10 08 00 00    	je     a43c <III_stereo+0x8cb>
    9c2c:	8b 45 14             	mov    0x14(%ebp),%eax
    9c2f:	8b 40 14             	mov    0x14(%eax),%eax
    9c32:	83 f8 02             	cmp    $0x2,%eax
    9c35:	0f 85 01 08 00 00    	jne    a43c <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    9c3b:	8b 45 14             	mov    0x14(%ebp),%eax
    9c3e:	8b 40 18             	mov    0x18(%eax),%eax
    9c41:	85 c0                	test   %eax,%eax
    9c43:	0f 84 d0 04 00 00    	je     a119 <III_stereo+0x5a8>
         {  int max_sfb = 0;
    9c49:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    9c50:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9c57:	e9 1b 03 00 00       	jmp    9f77 <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    9c5c:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    9c63:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9c6a:	e9 0f 01 00 00       	jmp    9d7e <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9c6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c72:	8d 48 01             	lea    0x1(%eax),%ecx
    9c75:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9c78:	89 d0                	mov    %edx,%eax
    9c7a:	c1 e0 03             	shl    $0x3,%eax
    9c7d:	01 d0                	add    %edx,%eax
    9c7f:	c1 e0 02             	shl    $0x2,%eax
    9c82:	01 d0                	add    %edx,%eax
    9c84:	01 c8                	add    %ecx,%eax
    9c86:	83 c0 14             	add    $0x14,%eax
    9c89:	8b 0c 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%ecx
    9c90:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9c93:	89 d0                	mov    %edx,%eax
    9c95:	c1 e0 03             	shl    $0x3,%eax
    9c98:	01 d0                	add    %edx,%eax
    9c9a:	c1 e0 02             	shl    $0x2,%eax
    9c9d:	01 d0                	add    %edx,%eax
    9c9f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9ca2:	01 d0                	add    %edx,%eax
    9ca4:	83 c0 14             	add    $0x14,%eax
    9ca7:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
    9cae:	29 c1                	sub    %eax,%ecx
    9cb0:	89 c8                	mov    %ecx,%eax
    9cb2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9cb5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9cb8:	89 d0                	mov    %edx,%eax
    9cba:	c1 e0 03             	shl    $0x3,%eax
    9cbd:	01 d0                	add    %edx,%eax
    9cbf:	c1 e0 02             	shl    $0x2,%eax
    9cc2:	01 d0                	add    %edx,%eax
    9cc4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9cc7:	01 d0                	add    %edx,%eax
    9cc9:	83 c0 14             	add    $0x14,%eax
    9ccc:	8b 14 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%edx
    9cd3:	89 d0                	mov    %edx,%eax
    9cd5:	01 c0                	add    %eax,%eax
    9cd7:	01 c2                	add    %eax,%edx
    9cd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9cdc:	83 c0 01             	add    $0x1,%eax
    9cdf:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    9ce3:	01 d0                	add    %edx,%eax
    9ce5:	83 e8 01             	sub    $0x1,%eax
    9ce8:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9ceb:	e9 80 00 00 00       	jmp    9d70 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9cf0:	8b 45 08             	mov    0x8(%ebp),%eax
    9cf3:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9cf9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9cfc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9d01:	89 c8                	mov    %ecx,%eax
    9d03:	f7 ea                	imul   %edx
    9d05:	c1 fa 02             	sar    $0x2,%edx
    9d08:	89 c8                	mov    %ecx,%eax
    9d0a:	c1 f8 1f             	sar    $0x1f,%eax
    9d0d:	89 d3                	mov    %edx,%ebx
    9d0f:	29 c3                	sub    %eax,%ebx
    9d11:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9d14:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9d19:	89 c8                	mov    %ecx,%eax
    9d1b:	f7 ea                	imul   %edx
    9d1d:	c1 fa 02             	sar    $0x2,%edx
    9d20:	89 c8                	mov    %ecx,%eax
    9d22:	c1 f8 1f             	sar    $0x1f,%eax
    9d25:	29 c2                	sub    %eax,%edx
    9d27:	89 d0                	mov    %edx,%eax
    9d29:	c1 e0 03             	shl    $0x3,%eax
    9d2c:	01 d0                	add    %edx,%eax
    9d2e:	01 c0                	add    %eax,%eax
    9d30:	29 c1                	sub    %eax,%ecx
    9d32:	89 ca                	mov    %ecx,%edx
    9d34:	89 d8                	mov    %ebx,%eax
    9d36:	c1 e0 03             	shl    $0x3,%eax
    9d39:	01 d8                	add    %ebx,%eax
    9d3b:	01 c0                	add    %eax,%eax
    9d3d:	01 d0                	add    %edx,%eax
    9d3f:	dd 04 c6             	fldl   (%esi,%eax,8)
    9d42:	d9 ee                	fldz   
    9d44:	df e9                	fucomip %st(1),%st
    9d46:	7a 0a                	jp     9d52 <III_stereo+0x1e1>
    9d48:	d9 ee                	fldz   
    9d4a:	df e9                	fucomip %st(1),%st
    9d4c:	dd d8                	fstp   %st(0)
    9d4e:	74 18                	je     9d68 <III_stereo+0x1f7>
    9d50:	eb 02                	jmp    9d54 <III_stereo+0x1e3>
    9d52:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    9d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d57:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    9d5a:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9d61:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    9d68:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    9d6c:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    9d70:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    9d74:	0f 8f 76 ff ff ff    	jg     9cf0 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    9d7a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    9d7e:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    9d82:	0f 8f e7 fe ff ff    	jg     9c6f <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    9d88:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9d8b:	83 c0 01             	add    $0x1,%eax
    9d8e:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    9d91:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d94:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9d97:	7e 0b                	jle    9da4 <III_stereo+0x233>
                  max_sfb = sfb;
    9d99:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d9c:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    9d9f:	e9 f5 00 00 00       	jmp    9e99 <III_stereo+0x328>
    9da4:	e9 f0 00 00 00       	jmp    9e99 <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9da9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9dac:	8d 48 01             	lea    0x1(%eax),%ecx
    9daf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9db2:	89 d0                	mov    %edx,%eax
    9db4:	c1 e0 03             	shl    $0x3,%eax
    9db7:	01 d0                	add    %edx,%eax
    9db9:	c1 e0 02             	shl    $0x2,%eax
    9dbc:	01 d0                	add    %edx,%eax
    9dbe:	01 c8                	add    %ecx,%eax
    9dc0:	83 c0 14             	add    $0x14,%eax
    9dc3:	8b 0c 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%ecx
    9dca:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9dcd:	89 d0                	mov    %edx,%eax
    9dcf:	c1 e0 03             	shl    $0x3,%eax
    9dd2:	01 d0                	add    %edx,%eax
    9dd4:	c1 e0 02             	shl    $0x2,%eax
    9dd7:	01 d0                	add    %edx,%eax
    9dd9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9ddc:	01 d0                	add    %edx,%eax
    9dde:	83 c0 14             	add    $0x14,%eax
    9de1:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
    9de8:	29 c1                	sub    %eax,%ecx
    9dea:	89 c8                	mov    %ecx,%eax
    9dec:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9def:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9df2:	89 d0                	mov    %edx,%eax
    9df4:	c1 e0 03             	shl    $0x3,%eax
    9df7:	01 d0                	add    %edx,%eax
    9df9:	c1 e0 02             	shl    $0x2,%eax
    9dfc:	01 d0                	add    %edx,%eax
    9dfe:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9e01:	01 d0                	add    %edx,%eax
    9e03:	83 c0 14             	add    $0x14,%eax
    9e06:	8b 14 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%edx
    9e0d:	89 d0                	mov    %edx,%eax
    9e0f:	01 c0                	add    %eax,%eax
    9e11:	01 c2                	add    %eax,%edx
    9e13:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e16:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9e1a:	01 d0                	add    %edx,%eax
    9e1c:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9e1f:	eb 6e                	jmp    9e8f <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9e21:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9e24:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9e27:	89 d0                	mov    %edx,%eax
    9e29:	01 c0                	add    %eax,%eax
    9e2b:	01 d0                	add    %edx,%eax
    9e2d:	c1 e0 02             	shl    $0x2,%eax
    9e30:	01 d0                	add    %edx,%eax
    9e32:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9e35:	01 d0                	add    %edx,%eax
    9e37:	83 c0 52             	add    $0x52,%eax
    9e3a:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    9e3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e41:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    9e48:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e4b:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9e52:	83 f8 07             	cmp    $0x7,%eax
    9e55:	74 30                	je     9e87 <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9e57:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e5a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9e61:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9e67:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9e6d:	dd 05 c0 e4 00 00    	fldl   0xe4c0
    9e73:	de c9                	fmulp  %st,%st(1)
    9e75:	dd 1c 24             	fstpl  (%esp)
    9e78:	e8 1d b6 ff ff       	call   549a <tan>
    9e7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e80:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    9e87:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    9e8b:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9e8f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9e93:	7f 8c                	jg     9e21 <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    9e95:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    9e99:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9e9d:	0f 8e 06 ff ff ff    	jle    9da9 <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    9ea3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9ea6:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9eac:	05 9c 00 01 00       	add    $0x1009c,%eax
    9eb1:	8b 50 0c             	mov    0xc(%eax),%edx
    9eb4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9eb7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9ebd:	05 98 00 01 00       	add    $0x10098,%eax
    9ec2:	8b 40 0c             	mov    0xc(%eax),%eax
    9ec5:	29 c2                	sub    %eax,%edx
    9ec7:	89 d0                	mov    %edx,%eax
    9ec9:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9ecc:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9ecf:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9ed5:	05 98 00 01 00       	add    $0x10098,%eax
    9eda:	8b 50 0c             	mov    0xc(%eax),%edx
    9edd:	89 d0                	mov    %edx,%eax
    9edf:	01 c0                	add    %eax,%eax
    9ee1:	01 c2                	add    %eax,%edx
    9ee3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ee6:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9eea:	01 d0                	add    %edx,%eax
    9eec:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9eef:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9ef2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9ef8:	05 a0 00 01 00       	add    $0x100a0,%eax
    9efd:	8b 50 0c             	mov    0xc(%eax),%edx
    9f00:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9f03:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9f09:	05 9c 00 01 00       	add    $0x1009c,%eax
    9f0e:	8b 40 0c             	mov    0xc(%eax),%eax
    9f11:	29 c2                	sub    %eax,%edx
    9f13:	89 d0                	mov    %edx,%eax
    9f15:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9f18:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9f1b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9f21:	05 9c 00 01 00       	add    $0x1009c,%eax
    9f26:	8b 50 0c             	mov    0xc(%eax),%edx
    9f29:	89 d0                	mov    %edx,%eax
    9f2b:	01 c0                	add    %eax,%eax
    9f2d:	01 c2                	add    %eax,%edx
    9f2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9f32:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9f36:	01 d0                	add    %edx,%eax
    9f38:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    9f3b:	eb 30                	jmp    9f6d <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    9f3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f40:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9f47:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f4a:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    9f51:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f54:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9f5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f5e:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    9f65:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    9f69:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9f6d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9f71:	7f ca                	jg     9f3d <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    9f73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9f77:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9f7b:	0f 8e db fc ff ff    	jle    9c5c <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    9f81:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    9f85:	0f 8f 89 01 00 00    	jg     a114 <III_stereo+0x5a3>
             {  i = 2;
    9f8b:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    9f92:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    9f99:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    9fa0:	eb 63                	jmp    a005 <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    9fa2:	8b 45 08             	mov    0x8(%ebp),%eax
    9fa5:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9fab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9fae:	89 d0                	mov    %edx,%eax
    9fb0:	c1 e0 03             	shl    $0x3,%eax
    9fb3:	01 d0                	add    %edx,%eax
    9fb5:	01 c0                	add    %eax,%eax
    9fb7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9fba:	01 d0                	add    %edx,%eax
    9fbc:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9fbf:	d9 ee                	fldz   
    9fc1:	df e9                	fucomip %st(1),%st
    9fc3:	7a 0a                	jp     9fcf <III_stereo+0x45e>
    9fc5:	d9 ee                	fldz   
    9fc7:	df e9                	fucomip %st(1),%st
    9fc9:	dd d8                	fstp   %st(0)
    9fcb:	74 23                	je     9ff0 <III_stereo+0x47f>
    9fcd:	eb 02                	jmp    9fd1 <III_stereo+0x460>
    9fcf:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    9fd1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9fd4:	89 d0                	mov    %edx,%eax
    9fd6:	c1 e0 03             	shl    $0x3,%eax
    9fd9:	01 d0                	add    %edx,%eax
    9fdb:	01 c0                	add    %eax,%eax
    9fdd:	89 c2                	mov    %eax,%edx
    9fdf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9fe2:	01 d0                	add    %edx,%eax
    9fe4:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    9fe7:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9fee:	eb 15                	jmp    a005 <III_stereo+0x494>
                   } else
                   {  ss--;
    9ff0:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    9ff4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9ff8:	79 0b                	jns    a005 <III_stereo+0x494>
                      {  i--;
    9ffa:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    9ffe:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    a005:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    a009:	79 97                	jns    9fa2 <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    a00b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    a012:	eb 04                	jmp    a018 <III_stereo+0x4a7>
                   i++;
    a014:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    a018:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a01b:	89 d0                	mov    %edx,%eax
    a01d:	c1 e0 03             	shl    $0x3,%eax
    a020:	01 d0                	add    %edx,%eax
    a022:	c1 e0 02             	shl    $0x2,%eax
    a025:	01 d0                	add    %edx,%eax
    a027:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a02a:	01 d0                	add    %edx,%eax
    a02c:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    a033:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    a036:	7e dc                	jle    a014 <III_stereo+0x4a3>
                   i++;
                sfb = i;
    a038:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a03b:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    a03e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a041:	89 d0                	mov    %edx,%eax
    a043:	c1 e0 03             	shl    $0x3,%eax
    a046:	01 d0                	add    %edx,%eax
    a048:	c1 e0 02             	shl    $0x2,%eax
    a04b:	01 d0                	add    %edx,%eax
    a04d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a050:	01 d0                	add    %edx,%eax
    a052:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    a059:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    a05c:	e9 a9 00 00 00       	jmp    a10a <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    a061:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a064:	8d 48 01             	lea    0x1(%eax),%ecx
    a067:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a06a:	89 d0                	mov    %edx,%eax
    a06c:	c1 e0 03             	shl    $0x3,%eax
    a06f:	01 d0                	add    %edx,%eax
    a071:	c1 e0 02             	shl    $0x2,%eax
    a074:	01 d0                	add    %edx,%eax
    a076:	01 c8                	add    %ecx,%eax
    a078:	8b 0c 85 20 00 01 00 	mov    0x10020(,%eax,4),%ecx
    a07f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a082:	89 d0                	mov    %edx,%eax
    a084:	c1 e0 03             	shl    $0x3,%eax
    a087:	01 d0                	add    %edx,%eax
    a089:	c1 e0 02             	shl    $0x2,%eax
    a08c:	01 d0                	add    %edx,%eax
    a08e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a091:	01 d0                	add    %edx,%eax
    a093:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    a09a:	29 c1                	sub    %eax,%ecx
    a09c:	89 c8                	mov    %ecx,%eax
    a09e:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    a0a1:	eb 5d                	jmp    a100 <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    a0a3:	8b 45 10             	mov    0x10(%ebp),%eax
    a0a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a0a9:	83 c2 3e             	add    $0x3e,%edx
    a0ac:	8b 14 90             	mov    (%eax,%edx,4),%edx
    a0af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a0b2:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    a0b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a0bc:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a0c3:	83 f8 07             	cmp    $0x7,%eax
    a0c6:	74 30                	je     a0f8 <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a0c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a0cb:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a0d2:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a0d8:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a0de:	dd 05 c0 e4 00 00    	fldl   0xe4c0
    a0e4:	de c9                	fmulp  %st,%st(1)
    a0e6:	dd 1c 24             	fstpl  (%esp)
    a0e9:	e8 ac b3 ff ff       	call   549a <tan>
    a0ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a0f1:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    a0f8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    a0fc:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a100:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a104:	7f 9d                	jg     a0a3 <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    a106:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a10a:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    a10e:	0f 8e 4d ff ff ff    	jle    a061 <III_stereo+0x4f0>
    a114:	e9 1e 03 00 00       	jmp    a437 <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    a119:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a120:	e9 08 03 00 00       	jmp    a42d <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    a125:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    a12c:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a133:	e9 0f 01 00 00       	jmp    a247 <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a138:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a13b:	8d 48 01             	lea    0x1(%eax),%ecx
    a13e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a141:	89 d0                	mov    %edx,%eax
    a143:	c1 e0 03             	shl    $0x3,%eax
    a146:	01 d0                	add    %edx,%eax
    a148:	c1 e0 02             	shl    $0x2,%eax
    a14b:	01 d0                	add    %edx,%eax
    a14d:	01 c8                	add    %ecx,%eax
    a14f:	83 c0 14             	add    $0x14,%eax
    a152:	8b 0c 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%ecx
    a159:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a15c:	89 d0                	mov    %edx,%eax
    a15e:	c1 e0 03             	shl    $0x3,%eax
    a161:	01 d0                	add    %edx,%eax
    a163:	c1 e0 02             	shl    $0x2,%eax
    a166:	01 d0                	add    %edx,%eax
    a168:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a16b:	01 d0                	add    %edx,%eax
    a16d:	83 c0 14             	add    $0x14,%eax
    a170:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
    a177:	29 c1                	sub    %eax,%ecx
    a179:	89 c8                	mov    %ecx,%eax
    a17b:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    a17e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a181:	89 d0                	mov    %edx,%eax
    a183:	c1 e0 03             	shl    $0x3,%eax
    a186:	01 d0                	add    %edx,%eax
    a188:	c1 e0 02             	shl    $0x2,%eax
    a18b:	01 d0                	add    %edx,%eax
    a18d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a190:	01 d0                	add    %edx,%eax
    a192:	83 c0 14             	add    $0x14,%eax
    a195:	8b 14 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%edx
    a19c:	89 d0                	mov    %edx,%eax
    a19e:	01 c0                	add    %eax,%eax
    a1a0:	01 c2                	add    %eax,%edx
    a1a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a1a5:	83 c0 01             	add    $0x1,%eax
    a1a8:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    a1ac:	01 d0                	add    %edx,%eax
    a1ae:	83 e8 01             	sub    $0x1,%eax
    a1b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    a1b4:	e9 80 00 00 00       	jmp    a239 <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    a1b9:	8b 45 08             	mov    0x8(%ebp),%eax
    a1bc:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    a1c2:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a1c5:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a1ca:	89 c8                	mov    %ecx,%eax
    a1cc:	f7 ea                	imul   %edx
    a1ce:	c1 fa 02             	sar    $0x2,%edx
    a1d1:	89 c8                	mov    %ecx,%eax
    a1d3:	c1 f8 1f             	sar    $0x1f,%eax
    a1d6:	89 d3                	mov    %edx,%ebx
    a1d8:	29 c3                	sub    %eax,%ebx
    a1da:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a1dd:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a1e2:	89 c8                	mov    %ecx,%eax
    a1e4:	f7 ea                	imul   %edx
    a1e6:	c1 fa 02             	sar    $0x2,%edx
    a1e9:	89 c8                	mov    %ecx,%eax
    a1eb:	c1 f8 1f             	sar    $0x1f,%eax
    a1ee:	29 c2                	sub    %eax,%edx
    a1f0:	89 d0                	mov    %edx,%eax
    a1f2:	c1 e0 03             	shl    $0x3,%eax
    a1f5:	01 d0                	add    %edx,%eax
    a1f7:	01 c0                	add    %eax,%eax
    a1f9:	29 c1                	sub    %eax,%ecx
    a1fb:	89 ca                	mov    %ecx,%edx
    a1fd:	89 d8                	mov    %ebx,%eax
    a1ff:	c1 e0 03             	shl    $0x3,%eax
    a202:	01 d8                	add    %ebx,%eax
    a204:	01 c0                	add    %eax,%eax
    a206:	01 d0                	add    %edx,%eax
    a208:	dd 04 c6             	fldl   (%esi,%eax,8)
    a20b:	d9 ee                	fldz   
    a20d:	df e9                	fucomip %st(1),%st
    a20f:	7a 0a                	jp     a21b <III_stereo+0x6aa>
    a211:	d9 ee                	fldz   
    a213:	df e9                	fucomip %st(1),%st
    a215:	dd d8                	fstp   %st(0)
    a217:	74 18                	je     a231 <III_stereo+0x6c0>
    a219:	eb 02                	jmp    a21d <III_stereo+0x6ac>
    a21b:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    a21d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a220:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    a223:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    a22a:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    a231:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    a235:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    a239:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    a23d:	0f 8f 76 ff ff ff    	jg     a1b9 <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    a243:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    a247:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    a24b:	0f 89 e7 fe ff ff    	jns    a138 <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    a251:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a254:	83 c0 01             	add    $0x1,%eax
    a257:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    a25a:	e9 f0 00 00 00       	jmp    a34f <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a25f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a262:	8d 48 01             	lea    0x1(%eax),%ecx
    a265:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a268:	89 d0                	mov    %edx,%eax
    a26a:	c1 e0 03             	shl    $0x3,%eax
    a26d:	01 d0                	add    %edx,%eax
    a26f:	c1 e0 02             	shl    $0x2,%eax
    a272:	01 d0                	add    %edx,%eax
    a274:	01 c8                	add    %ecx,%eax
    a276:	83 c0 14             	add    $0x14,%eax
    a279:	8b 0c 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%ecx
    a280:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a283:	89 d0                	mov    %edx,%eax
    a285:	c1 e0 03             	shl    $0x3,%eax
    a288:	01 d0                	add    %edx,%eax
    a28a:	c1 e0 02             	shl    $0x2,%eax
    a28d:	01 d0                	add    %edx,%eax
    a28f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a292:	01 d0                	add    %edx,%eax
    a294:	83 c0 14             	add    $0x14,%eax
    a297:	8b 04 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%eax
    a29e:	29 c1                	sub    %eax,%ecx
    a2a0:	89 c8                	mov    %ecx,%eax
    a2a2:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    a2a5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a2a8:	89 d0                	mov    %edx,%eax
    a2aa:	c1 e0 03             	shl    $0x3,%eax
    a2ad:	01 d0                	add    %edx,%eax
    a2af:	c1 e0 02             	shl    $0x2,%eax
    a2b2:	01 d0                	add    %edx,%eax
    a2b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a2b7:	01 d0                	add    %edx,%eax
    a2b9:	83 c0 14             	add    $0x14,%eax
    a2bc:	8b 14 85 2c 00 01 00 	mov    0x1002c(,%eax,4),%edx
    a2c3:	89 d0                	mov    %edx,%eax
    a2c5:	01 c0                	add    %eax,%eax
    a2c7:	01 c2                	add    %eax,%edx
    a2c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a2cc:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a2d0:	01 d0                	add    %edx,%eax
    a2d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    a2d5:	eb 6e                	jmp    a345 <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    a2d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a2da:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a2dd:	89 d0                	mov    %edx,%eax
    a2df:	01 c0                	add    %eax,%eax
    a2e1:	01 d0                	add    %edx,%eax
    a2e3:	c1 e0 02             	shl    $0x2,%eax
    a2e6:	01 d0                	add    %edx,%eax
    a2e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a2eb:	01 d0                	add    %edx,%eax
    a2ed:	83 c0 52             	add    $0x52,%eax
    a2f0:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    a2f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2f7:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    a2fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a301:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a308:	83 f8 07             	cmp    $0x7,%eax
    a30b:	74 30                	je     a33d <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a30d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a310:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a317:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a31d:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a323:	dd 05 c0 e4 00 00    	fldl   0xe4c0
    a329:	de c9                	fmulp  %st,%st(1)
    a32b:	dd 1c 24             	fstpl  (%esp)
    a32e:	e8 67 b1 ff ff       	call   549a <tan>
    a333:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a336:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    a33d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    a341:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a345:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a349:	7f 8c                	jg     a2d7 <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    a34b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    a34f:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a353:	0f 8e 06 ff ff ff    	jle    a25f <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    a359:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a35c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a362:	05 9c 00 01 00       	add    $0x1009c,%eax
    a367:	8b 50 0c             	mov    0xc(%eax),%edx
    a36a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a36d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a373:	05 98 00 01 00       	add    $0x10098,%eax
    a378:	8b 40 0c             	mov    0xc(%eax),%eax
    a37b:	29 c2                	sub    %eax,%edx
    a37d:	89 d0                	mov    %edx,%eax
    a37f:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    a382:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a385:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a38b:	05 98 00 01 00       	add    $0x10098,%eax
    a390:	8b 50 0c             	mov    0xc(%eax),%edx
    a393:	89 d0                	mov    %edx,%eax
    a395:	01 c0                	add    %eax,%eax
    a397:	01 c2                	add    %eax,%edx
    a399:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a39c:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a3a0:	01 d0                	add    %edx,%eax
    a3a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    a3a5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a3a8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a3ae:	05 a0 00 01 00       	add    $0x100a0,%eax
    a3b3:	8b 50 0c             	mov    0xc(%eax),%edx
    a3b6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a3b9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a3bf:	05 9c 00 01 00       	add    $0x1009c,%eax
    a3c4:	8b 40 0c             	mov    0xc(%eax),%eax
    a3c7:	29 c2                	sub    %eax,%edx
    a3c9:	89 d0                	mov    %edx,%eax
    a3cb:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    a3ce:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a3d1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a3d7:	05 9c 00 01 00       	add    $0x1009c,%eax
    a3dc:	8b 50 0c             	mov    0xc(%eax),%edx
    a3df:	89 d0                	mov    %edx,%eax
    a3e1:	01 c0                	add    %eax,%eax
    a3e3:	01 c2                	add    %eax,%edx
    a3e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a3e8:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a3ec:	01 d0                	add    %edx,%eax
    a3ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    a3f1:	eb 30                	jmp    a423 <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    a3f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a3f6:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a3fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a400:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    a407:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a40a:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a411:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a414:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    a41b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    a41f:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a423:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a427:	7f ca                	jg     a3f3 <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    a429:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a42d:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    a431:	0f 8e ee fc ff ff    	jle    a125 <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    a437:	e9 f0 01 00 00       	jmp    a62c <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    a43c:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    a443:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    a44a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    a451:	eb 63                	jmp    a4b6 <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    a453:	8b 45 08             	mov    0x8(%ebp),%eax
    a456:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a45c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a45f:	89 d0                	mov    %edx,%eax
    a461:	c1 e0 03             	shl    $0x3,%eax
    a464:	01 d0                	add    %edx,%eax
    a466:	01 c0                	add    %eax,%eax
    a468:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a46b:	01 d0                	add    %edx,%eax
    a46d:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a470:	d9 ee                	fldz   
    a472:	df e9                	fucomip %st(1),%st
    a474:	7a 0a                	jp     a480 <III_stereo+0x90f>
    a476:	d9 ee                	fldz   
    a478:	df e9                	fucomip %st(1),%st
    a47a:	dd d8                	fstp   %st(0)
    a47c:	74 23                	je     a4a1 <III_stereo+0x930>
    a47e:	eb 02                	jmp    a482 <III_stereo+0x911>
    a480:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    a482:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a485:	89 d0                	mov    %edx,%eax
    a487:	c1 e0 03             	shl    $0x3,%eax
    a48a:	01 d0                	add    %edx,%eax
    a48c:	01 c0                	add    %eax,%eax
    a48e:	89 c2                	mov    %eax,%edx
    a490:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a493:	01 d0                	add    %edx,%eax
    a495:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    a498:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    a49f:	eb 15                	jmp    a4b6 <III_stereo+0x945>
            } else
            {  ss--;
    a4a1:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    a4a5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    a4a9:	79 0b                	jns    a4b6 <III_stereo+0x945>
               {  i--;
    a4ab:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    a4af:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    a4b6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    a4ba:	79 97                	jns    a453 <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    a4bc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a4c3:	eb 04                	jmp    a4c9 <III_stereo+0x958>
            i++;
    a4c5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a4c9:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a4cc:	89 d0                	mov    %edx,%eax
    a4ce:	c1 e0 03             	shl    $0x3,%eax
    a4d1:	01 d0                	add    %edx,%eax
    a4d3:	c1 e0 02             	shl    $0x2,%eax
    a4d6:	01 d0                	add    %edx,%eax
    a4d8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a4db:	01 d0                	add    %edx,%eax
    a4dd:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    a4e4:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    a4e7:	7e dc                	jle    a4c5 <III_stereo+0x954>
            i++;
         sfb = i;
    a4e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a4ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    a4ef:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a4f2:	89 d0                	mov    %edx,%eax
    a4f4:	c1 e0 03             	shl    $0x3,%eax
    a4f7:	01 d0                	add    %edx,%eax
    a4f9:	c1 e0 02             	shl    $0x2,%eax
    a4fc:	01 d0                	add    %edx,%eax
    a4fe:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a501:	01 d0                	add    %edx,%eax
    a503:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    a50a:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    a50d:	e9 a9 00 00 00       	jmp    a5bb <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    a512:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a515:	8d 48 01             	lea    0x1(%eax),%ecx
    a518:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a51b:	89 d0                	mov    %edx,%eax
    a51d:	c1 e0 03             	shl    $0x3,%eax
    a520:	01 d0                	add    %edx,%eax
    a522:	c1 e0 02             	shl    $0x2,%eax
    a525:	01 d0                	add    %edx,%eax
    a527:	01 c8                	add    %ecx,%eax
    a529:	8b 0c 85 20 00 01 00 	mov    0x10020(,%eax,4),%ecx
    a530:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a533:	89 d0                	mov    %edx,%eax
    a535:	c1 e0 03             	shl    $0x3,%eax
    a538:	01 d0                	add    %edx,%eax
    a53a:	c1 e0 02             	shl    $0x2,%eax
    a53d:	01 d0                	add    %edx,%eax
    a53f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a542:	01 d0                	add    %edx,%eax
    a544:	8b 04 85 20 00 01 00 	mov    0x10020(,%eax,4),%eax
    a54b:	29 c1                	sub    %eax,%ecx
    a54d:	89 c8                	mov    %ecx,%eax
    a54f:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    a552:	eb 5d                	jmp    a5b1 <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    a554:	8b 45 10             	mov    0x10(%ebp),%eax
    a557:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a55a:	83 c2 3e             	add    $0x3e,%edx
    a55d:	8b 14 90             	mov    (%eax,%edx,4),%edx
    a560:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a563:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    a56a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a56d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a574:	83 f8 07             	cmp    $0x7,%eax
    a577:	74 30                	je     a5a9 <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a579:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a57c:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a583:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a589:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a58f:	dd 05 c0 e4 00 00    	fldl   0xe4c0
    a595:	de c9                	fmulp  %st,%st(1)
    a597:	dd 1c 24             	fstpl  (%esp)
    a59a:	e8 fb ae ff ff       	call   549a <tan>
    a59f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a5a2:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    a5a9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    a5ad:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a5b1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a5b5:	7f 9d                	jg     a554 <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    a5b7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a5bb:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    a5bf:	0f 8e 4d ff ff ff    	jle    a512 <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    a5c5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a5c8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a5ce:	05 70 00 01 00       	add    $0x10070,%eax
    a5d3:	8b 00                	mov    (%eax),%eax
    a5d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a5d8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a5db:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a5e1:	05 74 00 01 00       	add    $0x10074,%eax
    a5e6:	8b 00                	mov    (%eax),%eax
    a5e8:	ba 40 02 00 00       	mov    $0x240,%edx
    a5ed:	29 c2                	sub    %eax,%edx
    a5ef:	89 d0                	mov    %edx,%eax
    a5f1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    a5f4:	eb 30                	jmp    a626 <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    a5f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a5f9:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a600:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a603:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    a60a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a60d:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a614:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a617:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    a61e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a622:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a626:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a62a:	7f ca                	jg     a5f6 <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a62c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a633:	eb 55                	jmp    a68a <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    a635:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a63c:	eb 42                	jmp    a680 <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    a63e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a645:	eb 2f                	jmp    a676 <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    a647:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a64a:	89 d0                	mov    %edx,%eax
    a64c:	c1 e0 03             	shl    $0x3,%eax
    a64f:	01 d0                	add    %edx,%eax
    a651:	c1 e0 09             	shl    $0x9,%eax
    a654:	89 c2                	mov    %eax,%edx
    a656:	8b 45 0c             	mov    0xc(%ebp),%eax
    a659:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a65c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a65f:	89 d0                	mov    %edx,%eax
    a661:	c1 e0 03             	shl    $0x3,%eax
    a664:	01 d0                	add    %edx,%eax
    a666:	01 c0                	add    %eax,%eax
    a668:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a66b:	01 d0                	add    %edx,%eax
    a66d:	d9 ee                	fldz   
    a66f:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a672:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a676:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a67a:	7e cb                	jle    a647 <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    a67c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a680:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a684:	7e b8                	jle    a63e <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a686:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a68a:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    a68e:	7e a5                	jle    a635 <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    a690:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    a694:	0f 85 3d 02 00 00    	jne    a8d7 <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    a69a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a6a1:	e9 25 02 00 00       	jmp    a8cb <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    a6a6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a6ad:	e9 0b 02 00 00       	jmp    a8bd <III_stereo+0xd4c>
            i = (sb*18)+ss;
    a6b2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a6b5:	89 d0                	mov    %edx,%eax
    a6b7:	c1 e0 03             	shl    $0x3,%eax
    a6ba:	01 d0                	add    %edx,%eax
    a6bc:	01 c0                	add    %eax,%eax
    a6be:	89 c2                	mov    %eax,%edx
    a6c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a6c3:	01 d0                	add    %edx,%eax
    a6c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    a6c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a6cb:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a6d2:	83 f8 07             	cmp    $0x7,%eax
    a6d5:	0f 85 2c 01 00 00    	jne    a807 <III_stereo+0xc96>
               if ( ms_stereo ) {
    a6db:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    a6df:	0f 84 b5 00 00 00    	je     a79a <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    a6e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a6e8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a6eb:	89 d0                	mov    %edx,%eax
    a6ed:	c1 e0 03             	shl    $0x3,%eax
    a6f0:	01 d0                	add    %edx,%eax
    a6f2:	01 c0                	add    %eax,%eax
    a6f4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a6f7:	01 d0                	add    %edx,%eax
    a6f9:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a6fc:	8b 45 08             	mov    0x8(%ebp),%eax
    a6ff:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a705:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a708:	89 d0                	mov    %edx,%eax
    a70a:	c1 e0 03             	shl    $0x3,%eax
    a70d:	01 d0                	add    %edx,%eax
    a70f:	01 c0                	add    %eax,%eax
    a711:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a714:	01 d0                	add    %edx,%eax
    a716:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a719:	de c1                	faddp  %st,%st(1)
    a71b:	dd 05 c8 e4 00 00    	fldl   0xe4c8
    a721:	de f9                	fdivrp %st,%st(1)
    a723:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a726:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a729:	89 d0                	mov    %edx,%eax
    a72b:	c1 e0 03             	shl    $0x3,%eax
    a72e:	01 d0                	add    %edx,%eax
    a730:	01 c0                	add    %eax,%eax
    a732:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a735:	01 d0                	add    %edx,%eax
    a737:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    a73a:	8b 45 0c             	mov    0xc(%ebp),%eax
    a73d:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a743:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a746:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a749:	89 d0                	mov    %edx,%eax
    a74b:	c1 e0 03             	shl    $0x3,%eax
    a74e:	01 d0                	add    %edx,%eax
    a750:	01 c0                	add    %eax,%eax
    a752:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a755:	01 d0                	add    %edx,%eax
    a757:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a75a:	8b 45 08             	mov    0x8(%ebp),%eax
    a75d:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a763:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a766:	89 d0                	mov    %edx,%eax
    a768:	c1 e0 03             	shl    $0x3,%eax
    a76b:	01 d0                	add    %edx,%eax
    a76d:	01 c0                	add    %eax,%eax
    a76f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a772:	01 d0                	add    %edx,%eax
    a774:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a777:	de e9                	fsubrp %st,%st(1)
    a779:	dd 05 c8 e4 00 00    	fldl   0xe4c8
    a77f:	de f9                	fdivrp %st,%st(1)
    a781:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a784:	89 d0                	mov    %edx,%eax
    a786:	c1 e0 03             	shl    $0x3,%eax
    a789:	01 d0                	add    %edx,%eax
    a78b:	01 c0                	add    %eax,%eax
    a78d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a790:	01 d0                	add    %edx,%eax
    a792:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    a795:	e9 1f 01 00 00       	jmp    a8b9 <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    a79a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a79d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a7a0:	89 d0                	mov    %edx,%eax
    a7a2:	c1 e0 03             	shl    $0x3,%eax
    a7a5:	01 d0                	add    %edx,%eax
    a7a7:	01 c0                	add    %eax,%eax
    a7a9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a7ac:	01 d0                	add    %edx,%eax
    a7ae:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a7b1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a7b4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a7b7:	89 d0                	mov    %edx,%eax
    a7b9:	c1 e0 03             	shl    $0x3,%eax
    a7bc:	01 d0                	add    %edx,%eax
    a7be:	01 c0                	add    %eax,%eax
    a7c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a7c3:	01 d0                	add    %edx,%eax
    a7c5:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    a7c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    a7cb:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a7d1:	8b 45 08             	mov    0x8(%ebp),%eax
    a7d4:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a7da:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a7dd:	89 d0                	mov    %edx,%eax
    a7df:	c1 e0 03             	shl    $0x3,%eax
    a7e2:	01 d0                	add    %edx,%eax
    a7e4:	01 c0                	add    %eax,%eax
    a7e6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a7e9:	01 d0                	add    %edx,%eax
    a7eb:	dd 04 c3             	fldl   (%ebx,%eax,8)
    a7ee:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a7f1:	89 d0                	mov    %edx,%eax
    a7f3:	c1 e0 03             	shl    $0x3,%eax
    a7f6:	01 d0                	add    %edx,%eax
    a7f8:	01 c0                	add    %eax,%eax
    a7fa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a7fd:	01 d0                	add    %edx,%eax
    a7ff:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    a802:	e9 b2 00 00 00       	jmp    a8b9 <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    a807:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    a80b:	0f 84 94 00 00 00    	je     a8a5 <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    a811:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a814:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a817:	89 d0                	mov    %edx,%eax
    a819:	c1 e0 03             	shl    $0x3,%eax
    a81c:	01 d0                	add    %edx,%eax
    a81e:	01 c0                	add    %eax,%eax
    a820:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a823:	01 d0                	add    %edx,%eax
    a825:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a828:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a82b:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a832:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a835:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a83c:	d9 e8                	fld1   
    a83e:	de c1                	faddp  %st,%st(1)
    a840:	de f9                	fdivrp %st,%st(1)
    a842:	de c9                	fmulp  %st,%st(1)
    a844:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a847:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a84a:	89 d0                	mov    %edx,%eax
    a84c:	c1 e0 03             	shl    $0x3,%eax
    a84f:	01 d0                	add    %edx,%eax
    a851:	01 c0                	add    %eax,%eax
    a853:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a856:	01 d0                	add    %edx,%eax
    a858:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    a85b:	8b 45 0c             	mov    0xc(%ebp),%eax
    a85e:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a864:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a867:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a86a:	89 d0                	mov    %edx,%eax
    a86c:	c1 e0 03             	shl    $0x3,%eax
    a86f:	01 d0                	add    %edx,%eax
    a871:	01 c0                	add    %eax,%eax
    a873:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a876:	01 d0                	add    %edx,%eax
    a878:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a87b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a87e:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a885:	d9 e8                	fld1   
    a887:	de c1                	faddp  %st,%st(1)
    a889:	d9 e8                	fld1   
    a88b:	de f1                	fdivp  %st,%st(1)
    a88d:	de c9                	fmulp  %st,%st(1)
    a88f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a892:	89 d0                	mov    %edx,%eax
    a894:	c1 e0 03             	shl    $0x3,%eax
    a897:	01 d0                	add    %edx,%eax
    a899:	01 c0                	add    %eax,%eax
    a89b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a89e:	01 d0                	add    %edx,%eax
    a8a0:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    a8a3:	eb 14                	jmp    a8b9 <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    a8a5:	c7 44 24 04 60 d4 00 	movl   $0xd460,0x4(%esp)
    a8ac:	00 
    a8ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    a8b4:	e8 3c a7 ff ff       	call   4ff5 <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    a8b9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a8bd:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a8c1:	0f 8e eb fd ff ff    	jle    a6b2 <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    a8c7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a8cb:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a8cf:	0f 8e d1 fd ff ff    	jle    a6a6 <III_stereo+0xb35>
    a8d5:	eb 54                	jmp    a92b <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    a8d7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a8de:	eb 45                	jmp    a925 <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    a8e0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a8e7:	eb 32                	jmp    a91b <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    a8e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a8ec:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a8ef:	89 d0                	mov    %edx,%eax
    a8f1:	c1 e0 03             	shl    $0x3,%eax
    a8f4:	01 d0                	add    %edx,%eax
    a8f6:	01 c0                	add    %eax,%eax
    a8f8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a8fb:	01 d0                	add    %edx,%eax
    a8fd:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a900:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a903:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a906:	89 d0                	mov    %edx,%eax
    a908:	c1 e0 03             	shl    $0x3,%eax
    a90b:	01 d0                	add    %edx,%eax
    a90d:	01 c0                	add    %eax,%eax
    a90f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a912:	01 d0                	add    %edx,%eax
    a914:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a917:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a91b:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a91f:	7e c8                	jle    a8e9 <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    a921:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a925:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a929:	7e b5                	jle    a8e0 <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    a92b:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    a931:	5b                   	pop    %ebx
    a932:	5e                   	pop    %esi
    a933:	5d                   	pop    %ebp
    a934:	c3                   	ret    

0000a935 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    a935:	55                   	push   %ebp
    a936:	89 e5                	mov    %esp,%ebp
    a938:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    a93b:	a1 80 02 01 00       	mov    0x10280,%eax
    a940:	85 c0                	test   %eax,%eax
    a942:	74 68                	je     a9ac <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    a944:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a94b:	eb 4f                	jmp    a99c <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    a94d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a950:	dd 04 c5 40 02 01 00 	fldl   0x10240(,%eax,8)
    a957:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a95a:	dd 04 c5 40 02 01 00 	fldl   0x10240(,%eax,8)
    a961:	de c9                	fmulp  %st,%st(1)
    a963:	d9 e8                	fld1   
    a965:	de c1                	faddp  %st,%st(1)
    a967:	dd 1c 24             	fstpl  (%esp)
    a96a:	e8 de ac ff ff       	call   564d <sqrt>
    a96f:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    a972:	d9 e8                	fld1   
    a974:	dc 75 e0             	fdivl  -0x20(%ebp)
    a977:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a97a:	dd 1c c5 e0 02 01 00 	fstpl  0x102e0(,%eax,8)
         ca[i] = Ci[i]/sq;
    a981:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a984:	dd 04 c5 40 02 01 00 	fldl   0x10240(,%eax,8)
    a98b:	dc 75 e0             	fdivl  -0x20(%ebp)
    a98e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a991:	dd 1c c5 20 03 01 00 	fstpl  0x10320(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    a998:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a99c:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    a9a0:	7e ab                	jle    a94d <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    a9a2:	c7 05 80 02 01 00 00 	movl   $0x0,0x10280
    a9a9:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    a9ac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a9b3:	eb 4c                	jmp    aa01 <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    a9b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a9bc:	eb 39                	jmp    a9f7 <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    a9be:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a9c1:	89 d0                	mov    %edx,%eax
    a9c3:	c1 e0 03             	shl    $0x3,%eax
    a9c6:	01 d0                	add    %edx,%eax
    a9c8:	c1 e0 04             	shl    $0x4,%eax
    a9cb:	89 c2                	mov    %eax,%edx
    a9cd:	8b 45 0c             	mov    0xc(%ebp),%eax
    a9d0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a9d3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a9d6:	89 d0                	mov    %edx,%eax
    a9d8:	c1 e0 03             	shl    $0x3,%eax
    a9db:	01 d0                	add    %edx,%eax
    a9dd:	c1 e0 04             	shl    $0x4,%eax
    a9e0:	89 c2                	mov    %eax,%edx
    a9e2:	8b 45 08             	mov    0x8(%ebp),%eax
    a9e5:	01 c2                	add    %eax,%edx
    a9e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a9ea:	dd 04 c2             	fldl   (%edx,%eax,8)
    a9ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a9f0:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    a9f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a9f7:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a9fb:	7e c1                	jle    a9be <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    a9fd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    aa01:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    aa05:	7e ae                	jle    a9b5 <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    aa07:	8b 45 10             	mov    0x10(%ebp),%eax
    aa0a:	8b 40 10             	mov    0x10(%eax),%eax
    aa0d:	85 c0                	test   %eax,%eax
    aa0f:	74 1a                	je     aa2b <III_antialias+0xf6>
    aa11:	8b 45 10             	mov    0x10(%ebp),%eax
    aa14:	8b 40 14             	mov    0x14(%eax),%eax
    aa17:	83 f8 02             	cmp    $0x2,%eax
    aa1a:	75 0f                	jne    aa2b <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    aa1c:	8b 45 10             	mov    0x10(%ebp),%eax
    aa1f:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    aa22:	85 c0                	test   %eax,%eax
    aa24:	75 05                	jne    aa2b <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    aa26:	e9 1c 01 00 00       	jmp    ab47 <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    aa2b:	8b 45 10             	mov    0x10(%ebp),%eax
    aa2e:	8b 40 10             	mov    0x10(%eax),%eax
    aa31:	85 c0                	test   %eax,%eax
    aa33:	74 1e                	je     aa53 <III_antialias+0x11e>
    aa35:	8b 45 10             	mov    0x10(%ebp),%eax
    aa38:	8b 40 18             	mov    0x18(%eax),%eax
    aa3b:	85 c0                	test   %eax,%eax
    aa3d:	74 14                	je     aa53 <III_antialias+0x11e>
     (gr_info->block_type == 2))
    aa3f:	8b 45 10             	mov    0x10(%ebp),%eax
    aa42:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    aa45:	83 f8 02             	cmp    $0x2,%eax
    aa48:	75 09                	jne    aa53 <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    aa4a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    aa51:	eb 07                	jmp    aa5a <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    aa53:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    aa5a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    aa61:	e9 d5 00 00 00       	jmp    ab3b <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    aa66:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    aa6d:	e9 bb 00 00 00       	jmp    ab2d <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    aa72:	8b 55 f0             	mov    -0x10(%ebp),%edx
    aa75:	89 d0                	mov    %edx,%eax
    aa77:	c1 e0 03             	shl    $0x3,%eax
    aa7a:	01 d0                	add    %edx,%eax
    aa7c:	c1 e0 04             	shl    $0x4,%eax
    aa7f:	89 c2                	mov    %eax,%edx
    aa81:	8b 45 08             	mov    0x8(%ebp),%eax
    aa84:	01 c2                	add    %eax,%edx
    aa86:	b8 11 00 00 00       	mov    $0x11,%eax
    aa8b:	2b 45 f4             	sub    -0xc(%ebp),%eax
    aa8e:	dd 04 c2             	fldl   (%edx,%eax,8)
    aa91:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    aa94:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa97:	8d 50 01             	lea    0x1(%eax),%edx
    aa9a:	89 d0                	mov    %edx,%eax
    aa9c:	c1 e0 03             	shl    $0x3,%eax
    aa9f:	01 d0                	add    %edx,%eax
    aaa1:	c1 e0 04             	shl    $0x4,%eax
    aaa4:	89 c2                	mov    %eax,%edx
    aaa6:	8b 45 08             	mov    0x8(%ebp),%eax
    aaa9:	01 c2                	add    %eax,%edx
    aaab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aaae:	dd 04 c2             	fldl   (%edx,%eax,8)
    aab1:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    aab4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    aab7:	89 d0                	mov    %edx,%eax
    aab9:	c1 e0 03             	shl    $0x3,%eax
    aabc:	01 d0                	add    %edx,%eax
    aabe:	c1 e0 04             	shl    $0x4,%eax
    aac1:	89 c2                	mov    %eax,%edx
    aac3:	8b 45 0c             	mov    0xc(%ebp),%eax
    aac6:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    aac9:	b8 11 00 00 00       	mov    $0x11,%eax
    aace:	2b 45 f4             	sub    -0xc(%ebp),%eax
    aad1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    aad4:	dd 04 d5 e0 02 01 00 	fldl   0x102e0(,%edx,8)
    aadb:	dc 4d d8             	fmull  -0x28(%ebp)
    aade:	8b 55 f4             	mov    -0xc(%ebp),%edx
    aae1:	dd 04 d5 20 03 01 00 	fldl   0x10320(,%edx,8)
    aae8:	dc 4d d0             	fmull  -0x30(%ebp)
    aaeb:	de e9                	fsubrp %st,%st(1)
    aaed:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    aaf0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aaf3:	8d 50 01             	lea    0x1(%eax),%edx
    aaf6:	89 d0                	mov    %edx,%eax
    aaf8:	c1 e0 03             	shl    $0x3,%eax
    aafb:	01 d0                	add    %edx,%eax
    aafd:	c1 e0 04             	shl    $0x4,%eax
    ab00:	89 c2                	mov    %eax,%edx
    ab02:	8b 45 0c             	mov    0xc(%ebp),%eax
    ab05:	01 c2                	add    %eax,%edx
    ab07:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab0a:	dd 04 c5 e0 02 01 00 	fldl   0x102e0(,%eax,8)
    ab11:	dc 4d d0             	fmull  -0x30(%ebp)
    ab14:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab17:	dd 04 c5 20 03 01 00 	fldl   0x10320(,%eax,8)
    ab1e:	dc 4d d8             	fmull  -0x28(%ebp)
    ab21:	de c1                	faddp  %st,%st(1)
    ab23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab26:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    ab29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ab2d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    ab31:	0f 8e 3b ff ff ff    	jle    aa72 <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    ab37:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    ab3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ab3e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    ab41:	0f 8c 1f ff ff ff    	jl     aa66 <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    ab47:	c9                   	leave  
    ab48:	c3                   	ret    

0000ab49 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    ab49:	55                   	push   %ebp
    ab4a:	89 e5                	mov    %esp,%ebp
    ab4c:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    ab52:	a1 60 03 01 00       	mov    0x10360,%eax
    ab57:	85 c0                	test   %eax,%eax
    ab59:	0f 85 59 02 00 00    	jne    adb8 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    ab5f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ab66:	eb 29                	jmp    ab91 <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    ab68:	db 45 f4             	fildl  -0xc(%ebp)
    ab6b:	dd 05 d0 e4 00 00    	fldl   0xe4d0
    ab71:	de c1                	faddp  %st,%st(1)
    ab73:	dd 05 d8 e4 00 00    	fldl   0xe4d8
    ab79:	de c9                	fmulp  %st,%st(1)
    ab7b:	dd 1c 24             	fstpl  (%esp)
    ab7e:	e8 53 a8 ff ff       	call   53d6 <sin>
    ab83:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab86:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    ab8d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ab91:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    ab95:	7e d1                	jle    ab68 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    ab97:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ab9e:	eb 2c                	jmp    abcc <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    aba0:	db 45 f4             	fildl  -0xc(%ebp)
    aba3:	dd 05 d0 e4 00 00    	fldl   0xe4d0
    aba9:	de c1                	faddp  %st,%st(1)
    abab:	dd 05 d8 e4 00 00    	fldl   0xe4d8
    abb1:	de c9                	fmulp  %st,%st(1)
    abb3:	dd 1c 24             	fstpl  (%esp)
    abb6:	e8 1b a8 ff ff       	call   53d6 <sin>
    abbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    abbe:	83 c0 24             	add    $0x24,%eax
    abc1:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    abc8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    abcc:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    abd0:	7e ce                	jle    aba0 <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    abd2:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    abd9:	eb 13                	jmp    abee <inv_mdct+0xa5>
         win[1][i] = 1.0;
    abdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    abde:	83 c0 24             	add    $0x24,%eax
    abe1:	d9 e8                	fld1   
    abe3:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    abea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    abee:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    abf2:	7e e7                	jle    abdb <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    abf4:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    abfb:	eb 34                	jmp    ac31 <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    abfd:	db 45 f4             	fildl  -0xc(%ebp)
    ac00:	dd 05 d0 e4 00 00    	fldl   0xe4d0
    ac06:	de c1                	faddp  %st,%st(1)
    ac08:	dd 05 e0 e4 00 00    	fldl   0xe4e0
    ac0e:	de e9                	fsubrp %st,%st(1)
    ac10:	dd 05 c0 e4 00 00    	fldl   0xe4c0
    ac16:	de c9                	fmulp  %st,%st(1)
    ac18:	dd 1c 24             	fstpl  (%esp)
    ac1b:	e8 b6 a7 ff ff       	call   53d6 <sin>
    ac20:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac23:	83 c0 24             	add    $0x24,%eax
    ac26:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    ac2d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ac31:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    ac35:	7e c6                	jle    abfd <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    ac37:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    ac3e:	eb 13                	jmp    ac53 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    ac40:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac43:	83 c0 24             	add    $0x24,%eax
    ac46:	d9 ee                	fldz   
    ac48:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    ac4f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ac53:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    ac57:	7e e7                	jle    ac40 <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    ac59:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ac60:	eb 13                	jmp    ac75 <inv_mdct+0x12c>
         win[3][i] = 0.0;
    ac62:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac65:	83 c0 6c             	add    $0x6c,%eax
    ac68:	d9 ee                	fldz   
    ac6a:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    ac71:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ac75:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    ac79:	7e e7                	jle    ac62 <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    ac7b:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    ac82:	eb 34                	jmp    acb8 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    ac84:	db 45 f4             	fildl  -0xc(%ebp)
    ac87:	dd 05 d0 e4 00 00    	fldl   0xe4d0
    ac8d:	de c1                	faddp  %st,%st(1)
    ac8f:	dd 05 e8 e4 00 00    	fldl   0xe4e8
    ac95:	de e9                	fsubrp %st,%st(1)
    ac97:	dd 05 c0 e4 00 00    	fldl   0xe4c0
    ac9d:	de c9                	fmulp  %st,%st(1)
    ac9f:	dd 1c 24             	fstpl  (%esp)
    aca2:	e8 2f a7 ff ff       	call   53d6 <sin>
    aca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    acaa:	83 c0 6c             	add    $0x6c,%eax
    acad:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    acb4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    acb8:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    acbc:	7e c6                	jle    ac84 <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    acbe:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    acc5:	eb 13                	jmp    acda <inv_mdct+0x191>
         win[3][i] =1.0;
    acc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    acca:	83 c0 6c             	add    $0x6c,%eax
    accd:	d9 e8                	fld1   
    accf:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    acd6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    acda:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    acde:	7e e7                	jle    acc7 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    ace0:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    ace7:	eb 2c                	jmp    ad15 <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    ace9:	db 45 f4             	fildl  -0xc(%ebp)
    acec:	dd 05 d0 e4 00 00    	fldl   0xe4d0
    acf2:	de c1                	faddp  %st,%st(1)
    acf4:	dd 05 d8 e4 00 00    	fldl   0xe4d8
    acfa:	de c9                	fmulp  %st,%st(1)
    acfc:	dd 1c 24             	fstpl  (%esp)
    acff:	e8 d2 a6 ff ff       	call   53d6 <sin>
    ad04:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad07:	83 c0 6c             	add    $0x6c,%eax
    ad0a:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    ad11:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad15:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    ad19:	7e ce                	jle    ace9 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    ad1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ad22:	eb 2c                	jmp    ad50 <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    ad24:	db 45 f4             	fildl  -0xc(%ebp)
    ad27:	dd 05 d0 e4 00 00    	fldl   0xe4d0
    ad2d:	de c1                	faddp  %st,%st(1)
    ad2f:	dd 05 c0 e4 00 00    	fldl   0xe4c0
    ad35:	de c9                	fmulp  %st,%st(1)
    ad37:	dd 1c 24             	fstpl  (%esp)
    ad3a:	e8 97 a6 ff ff       	call   53d6 <sin>
    ad3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad42:	83 c0 48             	add    $0x48,%eax
    ad45:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    ad4c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad50:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    ad54:	7e ce                	jle    ad24 <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    ad56:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    ad5d:	eb 13                	jmp    ad72 <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    ad5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad62:	83 c0 48             	add    $0x48,%eax
    ad65:	d9 ee                	fldz   
    ad67:	dd 1c c5 80 03 01 00 	fstpl  0x10380(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    ad6e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad72:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    ad76:	7e e7                	jle    ad5f <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    ad78:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ad7f:	eb 21                	jmp    ada2 <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    ad81:	db 45 f4             	fildl  -0xc(%ebp)
    ad84:	dd 05 f0 e4 00 00    	fldl   0xe4f0
    ad8a:	de c9                	fmulp  %st,%st(1)
    ad8c:	dd 1c 24             	fstpl  (%esp)
    ad8f:	e8 e1 a6 ff ff       	call   5475 <cos>
    ad94:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad97:	dd 1c c5 00 08 01 00 	fstpl  0x10800(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    ad9e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ada2:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    ada9:	7e d6                	jle    ad81 <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    adab:	a1 60 03 01 00       	mov    0x10360,%eax
    adb0:	83 c0 01             	add    $0x1,%eax
    adb3:	a3 60 03 01 00       	mov    %eax,0x10360
    }

    for(i=0;i<36;i++)
    adb8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    adbf:	eb 17                	jmp    add8 <inv_mdct+0x28f>
       out[i]=0;
    adc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    adc4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    adcb:	8b 45 0c             	mov    0xc(%ebp),%eax
    adce:	01 d0                	add    %edx,%eax
    add0:	d9 ee                	fldz   
    add2:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    add4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    add8:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    addc:	7e e3                	jle    adc1 <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    adde:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    ade2:	0f 85 85 01 00 00    	jne    af6d <inv_mdct+0x424>
       N=12;
    ade8:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    adef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    adf6:	e9 63 01 00 00       	jmp    af5e <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    adfb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    ae02:	e9 df 00 00 00       	jmp    aee6 <inv_mdct+0x39d>
             sum = 0.0;
    ae07:	d9 ee                	fldz   
    ae09:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    ae0c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    ae13:	e9 8f 00 00 00       	jmp    aea7 <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    ae18:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ae1b:	89 d0                	mov    %edx,%eax
    ae1d:	01 c0                	add    %eax,%eax
    ae1f:	01 c2                	add    %eax,%edx
    ae21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae24:	01 d0                	add    %edx,%eax
    ae26:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ae2d:	8b 45 08             	mov    0x8(%ebp),%eax
    ae30:	01 d0                	add    %edx,%eax
    ae32:	dd 00                	fldl   (%eax)
    ae34:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    ae3a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    ae3d:	01 c0                	add    %eax,%eax
    ae3f:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    ae45:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    ae4b:	dd 05 f8 e4 00 00    	fldl   0xe4f8
    ae51:	de f1                	fdivp  %st,%st(1)
    ae53:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ae56:	01 c0                	add    %eax,%eax
    ae58:	8d 50 01             	lea    0x1(%eax),%edx
    ae5b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    ae5e:	89 c1                	mov    %eax,%ecx
    ae60:	c1 e9 1f             	shr    $0x1f,%ecx
    ae63:	01 c8                	add    %ecx,%eax
    ae65:	d1 f8                	sar    %eax
    ae67:	01 d0                	add    %edx,%eax
    ae69:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    ae6f:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    ae75:	de c9                	fmulp  %st,%st(1)
    ae77:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ae7a:	01 c0                	add    %eax,%eax
    ae7c:	83 c0 01             	add    $0x1,%eax
    ae7f:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    ae85:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    ae8b:	de c9                	fmulp  %st,%st(1)
    ae8d:	dd 1c 24             	fstpl  (%esp)
    ae90:	e8 e0 a5 ff ff       	call   5475 <cos>
    ae95:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    ae9b:	dd 45 e0             	fldl   -0x20(%ebp)
    ae9e:	de c1                	faddp  %st,%st(1)
    aea0:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    aea3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    aea7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    aeaa:	89 c2                	mov    %eax,%edx
    aeac:	c1 ea 1f             	shr    $0x1f,%edx
    aeaf:	01 d0                	add    %edx,%eax
    aeb1:	d1 f8                	sar    %eax
    aeb3:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    aeb6:	0f 8f 5c ff ff ff    	jg     ae18 <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    aebc:	8b 55 10             	mov    0x10(%ebp),%edx
    aebf:	89 d0                	mov    %edx,%eax
    aec1:	c1 e0 03             	shl    $0x3,%eax
    aec4:	01 d0                	add    %edx,%eax
    aec6:	c1 e0 02             	shl    $0x2,%eax
    aec9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    aecc:	01 d0                	add    %edx,%eax
    aece:	dd 04 c5 80 03 01 00 	fldl   0x10380(,%eax,8)
    aed5:	dc 4d e0             	fmull  -0x20(%ebp)
    aed8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aedb:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    aee2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    aee6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aee9:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    aeec:	0f 8c 15 ff ff ff    	jl     ae07 <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    aef2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    aef9:	eb 57                	jmp    af52 <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    aefb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    aefe:	89 d0                	mov    %edx,%eax
    af00:	01 c0                	add    %eax,%eax
    af02:	01 d0                	add    %edx,%eax
    af04:	01 c0                	add    %eax,%eax
    af06:	89 c2                	mov    %eax,%edx
    af08:	8b 45 ec             	mov    -0x14(%ebp),%eax
    af0b:	01 d0                	add    %edx,%eax
    af0d:	83 c0 06             	add    $0x6,%eax
    af10:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    af17:	8b 45 0c             	mov    0xc(%ebp),%eax
    af1a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    af1d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    af20:	89 d0                	mov    %edx,%eax
    af22:	01 c0                	add    %eax,%eax
    af24:	01 d0                	add    %edx,%eax
    af26:	01 c0                	add    %eax,%eax
    af28:	89 c2                	mov    %eax,%edx
    af2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    af2d:	01 d0                	add    %edx,%eax
    af2f:	83 c0 06             	add    $0x6,%eax
    af32:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    af39:	8b 45 0c             	mov    0xc(%ebp),%eax
    af3c:	01 d0                	add    %edx,%eax
    af3e:	dd 00                	fldl   (%eax)
    af40:	8b 45 ec             	mov    -0x14(%ebp),%eax
    af43:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    af4a:	de c1                	faddp  %st,%st(1)
    af4c:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    af4e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    af52:	8b 45 ec             	mov    -0x14(%ebp),%eax
    af55:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    af58:	7c a1                	jl     aefb <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    af5a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af5e:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    af62:	0f 8e 93 fe ff ff    	jle    adfb <inv_mdct+0x2b2>
    af68:	e9 da 00 00 00       	jmp    b047 <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    af6d:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    af74:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    af7b:	e9 bb 00 00 00       	jmp    b03b <inv_mdct+0x4f2>
         sum = 0.0;
    af80:	d9 ee                	fldz   
    af82:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    af85:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    af8c:	eb 6a                	jmp    aff8 <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    af8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    af91:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    af98:	8b 45 08             	mov    0x8(%ebp),%eax
    af9b:	01 d0                	add    %edx,%eax
    af9d:	dd 00                	fldl   (%eax)
    af9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    afa2:	01 c0                	add    %eax,%eax
    afa4:	8d 50 01             	lea    0x1(%eax),%edx
    afa7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    afaa:	89 c1                	mov    %eax,%ecx
    afac:	c1 e9 1f             	shr    $0x1f,%ecx
    afaf:	01 c8                	add    %ecx,%eax
    afb1:	d1 f8                	sar    %eax
    afb3:	01 c2                	add    %eax,%edx
    afb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    afb8:	01 c0                	add    %eax,%eax
    afba:	83 c0 01             	add    $0x1,%eax
    afbd:	89 d1                	mov    %edx,%ecx
    afbf:	0f af c8             	imul   %eax,%ecx
    afc2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    afc7:	89 c8                	mov    %ecx,%eax
    afc9:	f7 ea                	imul   %edx
    afcb:	c1 fa 05             	sar    $0x5,%edx
    afce:	89 c8                	mov    %ecx,%eax
    afd0:	c1 f8 1f             	sar    $0x1f,%eax
    afd3:	29 c2                	sub    %eax,%edx
    afd5:	89 d0                	mov    %edx,%eax
    afd7:	c1 e0 03             	shl    $0x3,%eax
    afda:	01 d0                	add    %edx,%eax
    afdc:	c1 e0 04             	shl    $0x4,%eax
    afdf:	29 c1                	sub    %eax,%ecx
    afe1:	89 ca                	mov    %ecx,%edx
    afe3:	dd 04 d5 00 08 01 00 	fldl   0x10800(,%edx,8)
    afea:	de c9                	fmulp  %st,%st(1)
    afec:	dd 45 e0             	fldl   -0x20(%ebp)
    afef:	de c1                	faddp  %st,%st(1)
    aff1:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    aff4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    aff8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    affb:	89 c2                	mov    %eax,%edx
    affd:	c1 ea 1f             	shr    $0x1f,%edx
    b000:	01 d0                	add    %edx,%eax
    b002:	d1 f8                	sar    %eax
    b004:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b007:	7f 85                	jg     af8e <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    b009:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b00c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b013:	8b 45 0c             	mov    0xc(%ebp),%eax
    b016:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b019:	8b 55 10             	mov    0x10(%ebp),%edx
    b01c:	89 d0                	mov    %edx,%eax
    b01e:	c1 e0 03             	shl    $0x3,%eax
    b021:	01 d0                	add    %edx,%eax
    b023:	c1 e0 02             	shl    $0x2,%eax
    b026:	8b 55 ec             	mov    -0x14(%ebp),%edx
    b029:	01 d0                	add    %edx,%eax
    b02b:	dd 04 c5 80 03 01 00 	fldl   0x10380(,%eax,8)
    b032:	dc 4d e0             	fmull  -0x20(%ebp)
    b035:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    b037:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b03b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b03e:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b041:	0f 8c 39 ff ff ff    	jl     af80 <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    b047:	c9                   	leave  
    b048:	c3                   	ret    

0000b049 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    b049:	55                   	push   %ebp
    b04a:	89 e5                	mov    %esp,%ebp
    b04c:	53                   	push   %ebx
    b04d:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    b053:	a1 84 02 01 00       	mov    0x10284,%eax
    b058:	85 c0                	test   %eax,%eax
    b05a:	74 6f                	je     b0cb <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    b05c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b063:	eb 56                	jmp    b0bb <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    b065:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b06c:	eb 43                	jmp    b0b1 <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    b06e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b075:	eb 30                	jmp    b0a7 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    b077:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b07a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    b07d:	89 c2                	mov    %eax,%edx
    b07f:	c1 e2 03             	shl    $0x3,%edx
    b082:	01 c2                	add    %eax,%edx
    b084:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b087:	89 c2                	mov    %eax,%edx
    b089:	89 c8                	mov    %ecx,%eax
    b08b:	c1 e0 03             	shl    $0x3,%eax
    b08e:	01 c8                	add    %ecx,%eax
    b090:	c1 e0 06             	shl    $0x6,%eax
    b093:	01 c2                	add    %eax,%edx
    b095:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b098:	01 d0                	add    %edx,%eax
    b09a:	d9 ee                	fldz   
    b09c:	dd 1c c5 80 0c 01 00 	fstpl  0x10c80(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    b0a3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b0a7:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    b0ab:	7e ca                	jle    b077 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    b0ad:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b0b1:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    b0b5:	7e b7                	jle    b06e <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    b0b7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b0bb:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    b0bf:	7e a4                	jle    b065 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    b0c1:	c7 05 84 02 01 00 00 	movl   $0x0,0x10284
    b0c8:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b0cb:	8b 45 18             	mov    0x18(%ebp),%eax
    b0ce:	8b 40 10             	mov    0x10(%eax),%eax
    b0d1:	85 c0                	test   %eax,%eax
    b0d3:	74 10                	je     b0e5 <III_hybrid+0x9c>
    b0d5:	8b 45 18             	mov    0x18(%ebp),%eax
    b0d8:	8b 40 18             	mov    0x18(%eax),%eax
    b0db:	85 c0                	test   %eax,%eax
    b0dd:	74 06                	je     b0e5 <III_hybrid+0x9c>
    b0df:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    b0e3:	7e 08                	jle    b0ed <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    b0e5:	8b 45 18             	mov    0x18(%ebp),%eax
    b0e8:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b0eb:	eb 05                	jmp    b0f2 <III_hybrid+0xa9>
    b0ed:	b8 00 00 00 00       	mov    $0x0,%eax
    b0f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    b0f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    b0f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    b0fc:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    b102:	89 44 24 04          	mov    %eax,0x4(%esp)
    b106:	8b 45 08             	mov    0x8(%ebp),%eax
    b109:	89 04 24             	mov    %eax,(%esp)
    b10c:	e8 38 fa ff ff       	call   ab49 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    b111:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b118:	e9 83 00 00 00       	jmp    b1a0 <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    b11d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b120:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b127:	8b 45 0c             	mov    0xc(%ebp),%eax
    b12a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    b12d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b130:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    b137:	8b 45 10             	mov    0x10(%ebp),%eax
    b13a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    b13d:	89 c2                	mov    %eax,%edx
    b13f:	c1 e2 03             	shl    $0x3,%edx
    b142:	01 c2                	add    %eax,%edx
    b144:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b147:	89 c2                	mov    %eax,%edx
    b149:	89 c8                	mov    %ecx,%eax
    b14b:	c1 e0 03             	shl    $0x3,%eax
    b14e:	01 c8                	add    %ecx,%eax
    b150:	c1 e0 06             	shl    $0x6,%eax
    b153:	01 c2                	add    %eax,%edx
    b155:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b158:	01 d0                	add    %edx,%eax
    b15a:	dd 04 c5 80 0c 01 00 	fldl   0x10c80(,%eax,8)
    b161:	de c1                	faddp  %st,%st(1)
    b163:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    b165:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b168:	83 c0 12             	add    $0x12,%eax
    b16b:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    b172:	8b 45 10             	mov    0x10(%ebp),%eax
    b175:	8b 4d 14             	mov    0x14(%ebp),%ecx
    b178:	89 c2                	mov    %eax,%edx
    b17a:	c1 e2 03             	shl    $0x3,%edx
    b17d:	01 c2                	add    %eax,%edx
    b17f:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b182:	89 c2                	mov    %eax,%edx
    b184:	89 c8                	mov    %ecx,%eax
    b186:	c1 e0 03             	shl    $0x3,%eax
    b189:	01 c8                	add    %ecx,%eax
    b18b:	c1 e0 06             	shl    $0x6,%eax
    b18e:	01 c2                	add    %eax,%edx
    b190:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b193:	01 d0                	add    %edx,%eax
    b195:	dd 1c c5 80 0c 01 00 	fstpl  0x10c80(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    b19c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b1a0:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b1a4:	0f 8e 73 ff ff ff    	jle    b11d <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    b1aa:	81 c4 54 01 00 00    	add    $0x154,%esp
    b1b0:	5b                   	pop    %ebx
    b1b1:	5d                   	pop    %ebp
    b1b2:	c3                   	ret    

0000b1b3 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    b1b3:	55                   	push   %ebp
    b1b4:	89 e5                	mov    %esp,%ebp
    b1b6:	57                   	push   %edi
    b1b7:	56                   	push   %esi
    b1b8:	53                   	push   %ebx
    b1b9:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    b1bc:	be 00 00 00 00       	mov    $0x0,%esi
    b1c1:	e9 1c 01 00 00       	jmp    b2e2 <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    b1c6:	bb 00 00 00 00       	mov    $0x0,%ebx
    b1cb:	e9 06 01 00 00       	jmp    b2d6 <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    b1d0:	89 f0                	mov    %esi,%eax
    b1d2:	c1 e0 08             	shl    $0x8,%eax
    b1d5:	89 c2                	mov    %eax,%edx
    b1d7:	8b 45 08             	mov    0x8(%ebp),%eax
    b1da:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    b1dd:	89 75 e0             	mov    %esi,-0x20(%ebp)
    b1e0:	db 45 e0             	fildl  -0x20(%ebp)
    b1e3:	dd 05 00 e5 00 00    	fldl   0xe500
    b1e9:	de c9                	fmulp  %st,%st(1)
    b1eb:	dd 05 08 e5 00 00    	fldl   0xe508
    b1f1:	de c1                	faddp  %st,%st(1)
    b1f3:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    b1f6:	83 c0 01             	add    $0x1,%eax
    b1f9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    b1fc:	db 45 e0             	fildl  -0x20(%ebp)
    b1ff:	de c9                	fmulp  %st,%st(1)
    b201:	dd 1c 24             	fstpl  (%esp)
    b204:	e8 6c a2 ff ff       	call   5475 <cos>
    b209:	dd 05 10 e5 00 00    	fldl   0xe510
    b20f:	de c9                	fmulp  %st,%st(1)
    b211:	dd 1c df             	fstpl  (%edi,%ebx,8)
    b214:	dd 04 df             	fldl   (%edi,%ebx,8)
    b217:	d9 ee                	fldz   
    b219:	d9 c9                	fxch   %st(1)
    b21b:	df e9                	fucomip %st(1),%st
    b21d:	dd d8                	fstp   %st(0)
    b21f:	72 47                	jb     b268 <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    b221:	89 f0                	mov    %esi,%eax
    b223:	c1 e0 08             	shl    $0x8,%eax
    b226:	89 c2                	mov    %eax,%edx
    b228:	8b 45 08             	mov    0x8(%ebp),%eax
    b22b:	01 c2                	add    %eax,%edx
    b22d:	89 f0                	mov    %esi,%eax
    b22f:	c1 e0 08             	shl    $0x8,%eax
    b232:	89 c1                	mov    %eax,%ecx
    b234:	8b 45 08             	mov    0x8(%ebp),%eax
    b237:	01 c8                	add    %ecx,%eax
    b239:	dd 04 d8             	fldl   (%eax,%ebx,8)
    b23c:	dd 05 d0 e4 00 00    	fldl   0xe4d0
    b242:	de c1                	faddp  %st,%st(1)
    b244:	d9 7d e6             	fnstcw -0x1a(%ebp)
    b247:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    b24b:	b4 0c                	mov    $0xc,%ah
    b24d:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    b251:	d9 6d e4             	fldcw  -0x1c(%ebp)
    b254:	db 5d e0             	fistpl -0x20(%ebp)
    b257:	d9 6d e6             	fldcw  -0x1a(%ebp)
    b25a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b25d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    b260:	db 45 e0             	fildl  -0x20(%ebp)
    b263:	dd 1c da             	fstpl  (%edx,%ebx,8)
    b266:	eb 45                	jmp    b2ad <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    b268:	89 f0                	mov    %esi,%eax
    b26a:	c1 e0 08             	shl    $0x8,%eax
    b26d:	89 c2                	mov    %eax,%edx
    b26f:	8b 45 08             	mov    0x8(%ebp),%eax
    b272:	01 c2                	add    %eax,%edx
    b274:	89 f0                	mov    %esi,%eax
    b276:	c1 e0 08             	shl    $0x8,%eax
    b279:	89 c1                	mov    %eax,%ecx
    b27b:	8b 45 08             	mov    0x8(%ebp),%eax
    b27e:	01 c8                	add    %ecx,%eax
    b280:	dd 04 d8             	fldl   (%eax,%ebx,8)
    b283:	dd 05 d0 e4 00 00    	fldl   0xe4d0
    b289:	de e9                	fsubrp %st,%st(1)
    b28b:	d9 7d e6             	fnstcw -0x1a(%ebp)
    b28e:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    b292:	b4 0c                	mov    $0xc,%ah
    b294:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    b298:	d9 6d e4             	fldcw  -0x1c(%ebp)
    b29b:	db 5d e0             	fistpl -0x20(%ebp)
    b29e:	d9 6d e6             	fldcw  -0x1a(%ebp)
    b2a1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b2a4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    b2a7:	db 45 e0             	fildl  -0x20(%ebp)
    b2aa:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    b2ad:	89 f0                	mov    %esi,%eax
    b2af:	c1 e0 08             	shl    $0x8,%eax
    b2b2:	89 c2                	mov    %eax,%edx
    b2b4:	8b 45 08             	mov    0x8(%ebp),%eax
    b2b7:	01 d0                	add    %edx,%eax
    b2b9:	89 f2                	mov    %esi,%edx
    b2bb:	89 d1                	mov    %edx,%ecx
    b2bd:	c1 e1 08             	shl    $0x8,%ecx
    b2c0:	8b 55 08             	mov    0x8(%ebp),%edx
    b2c3:	01 ca                	add    %ecx,%edx
    b2c5:	dd 04 da             	fldl   (%edx,%ebx,8)
    b2c8:	dd 05 18 e5 00 00    	fldl   0xe518
    b2ce:	de c9                	fmulp  %st,%st(1)
    b2d0:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    b2d3:	83 c3 01             	add    $0x1,%ebx
    b2d6:	83 fb 1f             	cmp    $0x1f,%ebx
    b2d9:	0f 8e f1 fe ff ff    	jle    b1d0 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    b2df:	83 c6 01             	add    $0x1,%esi
    b2e2:	83 fe 3f             	cmp    $0x3f,%esi
    b2e5:	0f 8e db fe ff ff    	jle    b1c6 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    b2eb:	83 c4 1c             	add    $0x1c,%esp
    b2ee:	5b                   	pop    %ebx
    b2ef:	5e                   	pop    %esi
    b2f0:	5f                   	pop    %edi
    b2f1:	5d                   	pop    %ebp
    b2f2:	c3                   	ret    

0000b2f3 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    b2f3:	55                   	push   %ebp
    b2f4:	89 e5                	mov    %esp,%ebp
    b2f6:	57                   	push   %edi
    b2f7:	56                   	push   %esi
    b2f8:	53                   	push   %ebx
    b2f9:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    b2ff:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    b305:	bb 80 d4 00 00       	mov    $0xd480,%ebx
    b30a:	b8 00 04 00 00       	mov    $0x400,%eax
    b30f:	89 d7                	mov    %edx,%edi
    b311:	89 de                	mov    %ebx,%esi
    b313:	89 c1                	mov    %eax,%ecx
    b315:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    b317:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    b31d:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    b320:	81 c4 14 10 00 00    	add    $0x1014,%esp
    b326:	5b                   	pop    %ebx
    b327:	5e                   	pop    %esi
    b328:	5f                   	pop    %edi
    b329:	5d                   	pop    %ebp
    b32a:	c3                   	ret    

0000b32b <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    b32b:	55                   	push   %ebp
    b32c:	89 e5                	mov    %esp,%ebp
    b32e:	57                   	push   %edi
    b32f:	56                   	push   %esi
    b330:	53                   	push   %ebx
    b331:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    b334:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    b33b:	a1 88 02 01 00       	mov    0x10288,%eax
    b340:	85 c0                	test   %eax,%eax
    b342:	74 6f                	je     b3b3 <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    b344:	c7 44 24 04 80 e4 00 	movl   $0xe480,0x4(%esp)
    b34b:	00 
    b34c:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    b353:	e8 15 a8 ff ff       	call   5b6d <mem_alloc>
    b358:	a3 80 30 01 00       	mov    %eax,0x13080
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    b35d:	c7 44 24 04 83 e4 00 	movl   $0xe483,0x4(%esp)
    b364:	00 
    b365:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    b36c:	e8 fc a7 ff ff       	call   5b6d <mem_alloc>
    b371:	a3 84 30 01 00       	mov    %eax,0x13084
		create_syn_filter(*filter);
    b376:	a1 84 30 01 00       	mov    0x13084,%eax
    b37b:	89 04 24             	mov    %eax,(%esp)
    b37e:	e8 30 fe ff ff       	call   b1b3 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    b383:	c7 44 24 04 86 e4 00 	movl   $0xe486,0x4(%esp)
    b38a:	00 
    b38b:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    b392:	e8 d6 a7 ff ff       	call   5b6d <mem_alloc>
    b397:	a3 88 30 01 00       	mov    %eax,0x13088
		read_syn_window(window);
    b39c:	a1 88 30 01 00       	mov    0x13088,%eax
    b3a1:	89 04 24             	mov    %eax,(%esp)
    b3a4:	e8 4a ff ff ff       	call   b2f3 <read_syn_window>
		init = 0;
    b3a9:	c7 05 88 02 01 00 00 	movl   $0x0,0x10288
    b3b0:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    b3b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    b3b6:	8b 04 85 8c 02 01 00 	mov    0x1028c(,%eax,4),%eax
    b3bd:	83 e8 40             	sub    $0x40,%eax
    b3c0:	25 ff 03 00 00       	and    $0x3ff,%eax
    b3c5:	89 c2                	mov    %eax,%edx
    b3c7:	8b 45 0c             	mov    0xc(%ebp),%eax
    b3ca:	89 14 85 8c 02 01 00 	mov    %edx,0x1028c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    b3d1:	8b 15 80 30 01 00    	mov    0x13080,%edx
    b3d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    b3da:	8b 04 85 8c 02 01 00 	mov    0x1028c(,%eax,4),%eax
    b3e1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b3e4:	c1 e1 0a             	shl    $0xa,%ecx
    b3e7:	01 c8                	add    %ecx,%eax
    b3e9:	c1 e0 03             	shl    $0x3,%eax
    b3ec:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    b3ef:	bb 00 00 00 00       	mov    $0x0,%ebx
    b3f4:	eb 40                	jmp    b436 <SubBandSynthesis+0x10b>
		sum = 0;
    b3f6:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    b3f8:	be 00 00 00 00       	mov    $0x0,%esi
    b3fd:	eb 26                	jmp    b425 <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    b3ff:	89 f0                	mov    %esi,%eax
    b401:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b408:	8b 45 08             	mov    0x8(%ebp),%eax
    b40b:	01 d0                	add    %edx,%eax
    b40d:	dd 00                	fldl   (%eax)
    b40f:	a1 84 30 01 00       	mov    0x13084,%eax
    b414:	89 da                	mov    %ebx,%edx
    b416:	c1 e2 05             	shl    $0x5,%edx
    b419:	01 f2                	add    %esi,%edx
    b41b:	dd 04 d0             	fldl   (%eax,%edx,8)
    b41e:	de c9                	fmulp  %st,%st(1)
    b420:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    b422:	83 c6 01             	add    $0x1,%esi
    b425:	83 fe 1f             	cmp    $0x1f,%esi
    b428:	7e d5                	jle    b3ff <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    b42a:	89 d8                	mov    %ebx,%eax
    b42c:	c1 e0 03             	shl    $0x3,%eax
    b42f:	01 f8                	add    %edi,%eax
    b431:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    b433:	83 c3 01             	add    $0x1,%ebx
    b436:	83 fb 3f             	cmp    $0x3f,%ebx
    b439:	7e bb                	jle    b3f6 <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b43b:	bf 00 00 00 00       	mov    $0x0,%edi
    b440:	e9 c7 00 00 00       	jmp    b50c <SubBandSynthesis+0x1e1>
		sum = 0;
    b445:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    b447:	bb 00 00 00 00       	mov    $0x0,%ebx
    b44c:	eb 4c                	jmp    b49a <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    b44e:	89 d8                	mov    %ebx,%eax
    b450:	c1 e0 05             	shl    $0x5,%eax
    b453:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b456:	a1 88 30 01 00       	mov    0x13088,%eax
    b45b:	89 f2                	mov    %esi,%edx
    b45d:	c1 e2 03             	shl    $0x3,%edx
    b460:	01 d0                	add    %edx,%eax
    b462:	dd 00                	fldl   (%eax)
    b464:	a1 80 30 01 00       	mov    0x13080,%eax
    b469:	8d 53 01             	lea    0x1(%ebx),%edx
    b46c:	d1 fa                	sar    %edx
    b46e:	c1 e2 06             	shl    $0x6,%edx
    b471:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    b474:	8b 55 0c             	mov    0xc(%ebp),%edx
    b477:	8b 14 95 8c 02 01 00 	mov    0x1028c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b47e:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    b480:	89 d1                	mov    %edx,%ecx
    b482:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b488:	8b 55 0c             	mov    0xc(%ebp),%edx
    b48b:	c1 e2 0a             	shl    $0xa,%edx
    b48e:	01 ca                	add    %ecx,%edx
    b490:	dd 04 d0             	fldl   (%eax,%edx,8)
    b493:	de c9                	fmulp  %st,%st(1)
    b495:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    b497:	83 c3 01             	add    $0x1,%ebx
    b49a:	83 fb 0f             	cmp    $0xf,%ebx
    b49d:	7e af                	jle    b44e <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    b49f:	dd 05 20 e5 00 00    	fldl   0xe520
    b4a5:	de c9                	fmulp  %st,%st(1)
    b4a7:	d9 7d d6             	fnstcw -0x2a(%ebp)
    b4aa:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    b4ae:	b4 0c                	mov    $0xc,%ah
    b4b0:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    b4b4:	d9 6d d4             	fldcw  -0x2c(%ebp)
    b4b7:	db 5d e0             	fistpl -0x20(%ebp)
    b4ba:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    b4bd:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    b4c4:	7e 15                	jle    b4db <SubBandSynthesis+0x1b0>
    b4c6:	89 f8                	mov    %edi,%eax
    b4c8:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b4cb:	8b 45 10             	mov    0x10(%ebp),%eax
    b4ce:	01 d0                	add    %edx,%eax
    b4d0:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    b4d5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b4d9:	eb 2e                	jmp    b509 <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    b4db:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    b4e2:	7d 15                	jge    b4f9 <SubBandSynthesis+0x1ce>
    b4e4:	89 f8                	mov    %edi,%eax
    b4e6:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b4e9:	8b 45 10             	mov    0x10(%ebp),%eax
    b4ec:	01 d0                	add    %edx,%eax
    b4ee:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    b4f3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b4f7:	eb 10                	jmp    b509 <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    b4f9:	89 f8                	mov    %edi,%eax
    b4fb:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b4fe:	8b 45 10             	mov    0x10(%ebp),%eax
    b501:	01 c2                	add    %eax,%edx
    b503:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b506:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b509:	83 c7 01             	add    $0x1,%edi
    b50c:	83 ff 1f             	cmp    $0x1f,%edi
    b50f:	0f 8e 30 ff ff ff    	jle    b445 <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    b515:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    b518:	83 c4 2c             	add    $0x2c,%esp
    b51b:	5b                   	pop    %ebx
    b51c:	5e                   	pop    %esi
    b51d:	5f                   	pop    %edi
    b51e:	5d                   	pop    %ebp
    b51f:	c3                   	ret    

0000b520 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    b520:	55                   	push   %ebp
    b521:	89 e5                	mov    %esp,%ebp
    b523:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    b526:	8b 45 10             	mov    0x10(%ebp),%eax
    b529:	8b 40 08             	mov    0x8(%eax),%eax
    b52c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b52f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    b536:	eb 75                	jmp    b5ad <out_fifo+0x8d>
    b538:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    b53f:	eb 62                	jmp    b5a3 <out_fifo+0x83>
            (*psampFrames)++;
    b541:	8b 45 14             	mov    0x14(%ebp),%eax
    b544:	8b 00                	mov    (%eax),%eax
    b546:	8d 50 01             	lea    0x1(%eax),%edx
    b549:	8b 45 14             	mov    0x14(%ebp),%eax
    b54c:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    b54e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b555:	eb 40                	jmp    b597 <out_fifo+0x77>
                if (!(k%1600) && k) {
    b557:	8b 0d 8c 30 01 00    	mov    0x1308c,%ecx
    b55d:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    b562:	89 c8                	mov    %ecx,%eax
    b564:	f7 ea                	imul   %edx
    b566:	c1 fa 09             	sar    $0x9,%edx
    b569:	89 c8                	mov    %ecx,%eax
    b56b:	c1 f8 1f             	sar    $0x1f,%eax
    b56e:	29 c2                	sub    %eax,%edx
    b570:	89 d0                	mov    %edx,%eax
    b572:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    b578:	29 c1                	sub    %eax,%ecx
    b57a:	89 c8                	mov    %ecx,%eax
    b57c:	85 c0                	test   %eax,%eax
    b57e:	75 13                	jne    b593 <out_fifo+0x73>
    b580:	a1 8c 30 01 00       	mov    0x1308c,%eax
    b585:	85 c0                	test   %eax,%eax
    b587:	74 0a                	je     b593 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    b589:	c7 05 8c 30 01 00 00 	movl   $0x0,0x1308c
    b590:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    b593:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b597:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b59a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b59d:	7c b8                	jl     b557 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b59f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    b5a3:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    b5a7:	7e 98                	jle    b541 <out_fifo+0x21>
    b5a9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    b5ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    b5b0:	3b 45 0c             	cmp    0xc(%ebp),%eax
    b5b3:	7c 83                	jl     b538 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    b5b5:	c9                   	leave  
    b5b6:	c3                   	ret    

0000b5b7 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    b5b7:	55                   	push   %ebp
    b5b8:	89 e5                	mov    %esp,%ebp
    b5ba:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    b5bd:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    b5c4:	00 
    b5c5:	8b 45 08             	mov    0x8(%ebp),%eax
    b5c8:	89 04 24             	mov    %eax,(%esp)
    b5cb:	e8 8b a8 ff ff       	call   5e5b <getbits>
    b5d0:	8b 55 0c             	mov    0xc(%ebp),%edx
    b5d3:	89 02                	mov    %eax,(%edx)
}
    b5d5:	c9                   	leave  
    b5d6:	c3                   	ret    

0000b5d7 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    b5d7:	55                   	push   %ebp
    b5d8:	89 e5                	mov    %esp,%ebp
    b5da:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b5dd:	8b 45 08             	mov    0x8(%ebp),%eax
    b5e0:	8b 40 0c             	mov    0xc(%eax),%eax
    b5e3:	83 c0 1e             	add    $0x1e,%eax
    b5e6:	8b 14 85 e0 fd 00 00 	mov    0xfde0(,%eax,4),%edx
    b5ed:	89 d0                	mov    %edx,%eax
    b5ef:	c1 e0 03             	shl    $0x3,%eax
    b5f2:	01 d0                	add    %edx,%eax
    b5f4:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    b5f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    b5fa:	db 45 ec             	fildl  -0x14(%ebp)
    b5fd:	8b 45 08             	mov    0x8(%ebp),%eax
    b600:	8b 40 10             	mov    0x10(%eax),%eax
    b603:	dd 04 c5 a0 fe 00 00 	fldl   0xfea0(,%eax,8)
    b60a:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b60c:	d9 7d ea             	fnstcw -0x16(%ebp)
    b60f:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    b613:	b4 0c                	mov    $0xc,%ah
    b615:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    b619:	d9 6d e8             	fldcw  -0x18(%ebp)
    b61c:	db 5d fc             	fistpl -0x4(%ebp)
    b61f:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    b622:	8b 45 08             	mov    0x8(%ebp),%eax
    b625:	8b 40 14             	mov    0x14(%eax),%eax
    b628:	85 c0                	test   %eax,%eax
    b62a:	74 04                	je     b630 <main_data_slots+0x59>
    b62c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    b630:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    b634:	8b 45 08             	mov    0x8(%ebp),%eax
    b637:	8b 40 08             	mov    0x8(%eax),%eax
    b63a:	85 c0                	test   %eax,%eax
    b63c:	74 04                	je     b642 <main_data_slots+0x6b>
		nSlots -= 2;
    b63e:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    b642:	8b 45 10             	mov    0x10(%ebp),%eax
    b645:	83 f8 01             	cmp    $0x1,%eax
    b648:	75 06                	jne    b650 <main_data_slots+0x79>
		nSlots -= 17;
    b64a:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    b64e:	eb 04                	jmp    b654 <main_data_slots+0x7d>
	else
		nSlots -=32;
    b650:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    b654:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    b657:	c9                   	leave  
    b658:	c3                   	ret    
