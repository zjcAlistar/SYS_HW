
_finder：     文件格式 elf32-i386


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
      7c:	05 8c 35 01 00       	add    $0x1358c,%eax
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
      8e:	c7 05 a0 35 01 00 00 	movl   $0x0,0x135a0
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
      a8:	e8 7e 4f 00 00       	call   502b <malloc>
      ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      b0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
      b7:	e8 6f 4f 00 00       	call   502b <malloc>
      bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
      bf:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
      c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c5:	8b 40 14             	mov    0x14(%eax),%eax
      c8:	8b 55 1c             	mov    0x1c(%ebp),%edx
      cb:	89 54 24 04          	mov    %edx,0x4(%esp)
      cf:	89 04 24             	mov    %eax,(%esp)
      d2:	e8 3d 48 00 00       	call   4914 <strcpy>
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
      f7:	8b 15 6c ff 00 00    	mov    0xff6c,%edx
      fd:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     100:	8d 45 d8             	lea    -0x28(%ebp),%eax
     103:	89 54 24 10          	mov    %edx,0x10(%esp)
     107:	8b 15 80 35 01 00    	mov    0x13580,%edx
     10d:	89 54 24 04          	mov    %edx,0x4(%esp)
     111:	8b 15 84 35 01 00    	mov    0x13584,%edx
     117:	89 54 24 08          	mov    %edx,0x8(%esp)
     11b:	8b 15 88 35 01 00    	mov    0x13588,%edx
     121:	89 54 24 0c          	mov    %edx,0xc(%esp)
     125:	89 04 24             	mov    %eax,(%esp)
     128:	e8 ed 0e 00 00       	call   101a <getPos>
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
     148:	8b 15 68 ff 00 00    	mov    0xff68,%edx
     14e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     151:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     154:	8b 45 f4             	mov    -0xc(%ebp),%eax
     157:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     15e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     161:	a3 68 ff 00 00       	mov    %eax,0xff68
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
     171:	a1 68 ff 00 00       	mov    0xff68,%eax
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
     193:	e8 5a 4d 00 00       	call   4ef2 <free>
		free(temp);
     198:	8b 45 f0             	mov    -0x10(%ebp),%eax
     19b:	89 04 24             	mov    %eax,(%esp)
     19e:	e8 4f 4d 00 00       	call   4ef2 <free>
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
     1a9:	c7 05 68 ff 00 00 00 	movl   $0x0,0xff68
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
     1c1:	e8 bd 47 00 00       	call   4983 <strlen>
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
     255:	c7 05 6c ff 00 00 00 	movl   $0x0,0xff6c
     25c:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     25f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     266:	00 
     267:	8b 45 08             	mov    0x8(%ebp),%eax
     26a:	89 04 24             	mov    %eax,(%esp)
     26d:	e8 25 49 00 00       	call   4b97 <open>
     272:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     275:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     279:	79 20                	jns    29b <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     27b:	8b 45 08             	mov    0x8(%ebp),%eax
     27e:	89 44 24 08          	mov    %eax,0x8(%esp)
     282:	c7 44 24 04 c0 b3 00 	movl   $0xb3c0,0x4(%esp)
     289:	00 
     28a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     291:	e8 a9 4a 00 00       	call   4d3f <printf>
		return;
     296:	e9 8f 02 00 00       	jmp    52a <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     29b:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     2a1:	89 44 24 04          	mov    %eax,0x4(%esp)
     2a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2a8:	89 04 24             	mov    %eax,(%esp)
     2ab:	e8 ff 48 00 00       	call   4baf <fstat>
     2b0:	85 c0                	test   %eax,%eax
     2b2:	79 2b                	jns    2df <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     2b4:	8b 45 08             	mov    0x8(%ebp),%eax
     2b7:	89 44 24 08          	mov    %eax,0x8(%esp)
     2bb:	c7 44 24 04 d4 b3 00 	movl   $0xb3d4,0x4(%esp)
     2c2:	00 
     2c3:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2ca:	e8 70 4a 00 00       	call   4d3f <printf>
		close(fd);
     2cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2d2:	89 04 24             	mov    %eax,(%esp)
     2d5:	e8 a5 48 00 00       	call   4b7f <close>
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
     326:	c7 44 24 04 e8 b3 00 	movl   $0xb3e8,0x4(%esp)
     32d:	00 
     32e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     335:	e8 05 4a 00 00       	call   4d3f <printf>
		break;
     33a:	e9 e0 01 00 00       	jmp    51f <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     33f:	8b 45 08             	mov    0x8(%ebp),%eax
     342:	89 04 24             	mov    %eax,(%esp)
     345:	e8 39 46 00 00       	call   4983 <strlen>
     34a:	83 c0 10             	add    $0x10,%eax
     34d:	3d 00 02 00 00       	cmp    $0x200,%eax
     352:	76 19                	jbe    36d <list+0x124>
			printf(1, "ls: path too long\n");
     354:	c7 44 24 04 f5 b3 00 	movl   $0xb3f5,0x4(%esp)
     35b:	00 
     35c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     363:	e8 d7 49 00 00       	call   4d3f <printf>
			break;
     368:	e9 b2 01 00 00       	jmp    51f <list+0x2d6>
		}
		strcpy(buf, path);
     36d:	8b 45 08             	mov    0x8(%ebp),%eax
     370:	89 44 24 04          	mov    %eax,0x4(%esp)
     374:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     37a:	89 04 24             	mov    %eax,(%esp)
     37d:	e8 92 45 00 00       	call   4914 <strcpy>
		p = buf + strlen(buf);
     382:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     388:	89 04 24             	mov    %eax,(%esp)
     38b:	e8 f3 45 00 00       	call   4983 <strlen>
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
     3d8:	e8 35 47 00 00       	call   4b12 <memmove>
			p[DIRSIZ] = 0;
     3dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
     3e0:	83 c0 0e             	add    $0xe,%eax
     3e3:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     3e6:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     3ec:	89 44 24 04          	mov    %eax,0x4(%esp)
     3f0:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3f6:	89 04 24             	mov    %eax,(%esp)
     3f9:	e8 79 46 00 00       	call   4a77 <stat>
     3fe:	85 c0                	test   %eax,%eax
     400:	79 23                	jns    425 <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     402:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     408:	89 44 24 08          	mov    %eax,0x8(%esp)
     40c:	c7 44 24 04 d4 b3 00 	movl   $0xb3d4,0x4(%esp)
     413:	00 
     414:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     41b:	e8 1f 49 00 00       	call   4d3f <printf>
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
     451:	8b 15 6c ff 00 00    	mov    0xff6c,%edx
     457:	8d 45 d0             	lea    -0x30(%ebp),%eax
     45a:	89 54 24 10          	mov    %edx,0x10(%esp)
     45e:	8b 15 80 35 01 00    	mov    0x13580,%edx
     464:	89 54 24 04          	mov    %edx,0x4(%esp)
     468:	8b 15 84 35 01 00    	mov    0x13584,%edx
     46e:	89 54 24 08          	mov    %edx,0x8(%esp)
     472:	8b 15 88 35 01 00    	mov    0x13588,%edx
     478:	89 54 24 0c          	mov    %edx,0xc(%esp)
     47c:	89 04 24             	mov    %eax,(%esp)
     47f:	e8 96 0b 00 00       	call   101a <getPos>
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
     4eb:	a1 6c ff 00 00       	mov    0xff6c,%eax
     4f0:	83 c0 01             	add    $0x1,%eax
     4f3:	a3 6c ff 00 00       	mov    %eax,0xff6c
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
     510:	e8 5a 46 00 00       	call   4b6f <read>
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
     525:	e8 55 46 00 00       	call   4b7f <close>
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
     53d:	75 08                	jne    547 <drawItem+0x15>
		nameColor = 0x0;
     53f:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     545:	eb 49                	jmp    590 <drawItem+0x5e>
	else 
	{
		nameColor = 0xFFFF;
     547:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     54d:	8b 45 38             	mov    0x38(%ebp),%eax
     550:	89 c3                	mov    %eax,%ebx
     552:	8b 45 34             	mov    0x34(%ebp),%eax
     555:	89 c1                	mov    %eax,%ecx
     557:	8b 45 30             	mov    0x30(%ebp),%eax
     55a:	89 c2                	mov    %eax,%edx
     55c:	8b 45 2c             	mov    0x2c(%ebp),%eax
     55f:	c7 44 24 1c 10 21 00 	movl   $0x2110,0x1c(%esp)
     566:	00 
     567:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     56b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     56f:	89 54 24 10          	mov    %edx,0x10(%esp)
     573:	89 44 24 0c          	mov    %eax,0xc(%esp)
     577:	8b 45 08             	mov    0x8(%ebp),%eax
     57a:	89 04 24             	mov    %eax,(%esp)
     57d:	8b 45 0c             	mov    0xc(%ebp),%eax
     580:	89 44 24 04          	mov    %eax,0x4(%esp)
     584:	8b 45 10             	mov    0x10(%ebp),%eax
     587:	89 44 24 08          	mov    %eax,0x8(%esp)
     58b:	e8 4b 28 00 00       	call   2ddb <fill_rect>
	}
	if (style == ICON_STYLE) {
     590:	a1 44 f6 00 00       	mov    0xf644,%eax
     595:	83 f8 01             	cmp    $0x1,%eax
     598:	0f 85 13 01 00 00    	jne    6b1 <drawItem+0x17f>
		switch (st.type) {
     59e:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     5a2:	98                   	cwtl   
     5a3:	83 f8 01             	cmp    $0x1,%eax
     5a6:	74 53                	je     5fb <drawItem+0xc9>
     5a8:	83 f8 02             	cmp    $0x2,%eax
     5ab:	0f 85 93 00 00 00    	jne    644 <drawItem+0x112>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     5b1:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     5b4:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     5b7:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     5ba:	83 c0 19             	add    $0x19,%eax
     5bd:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     5c1:	89 44 24 18          	mov    %eax,0x18(%esp)
     5c5:	a1 88 f6 00 00       	mov    0xf688,%eax
     5ca:	89 44 24 0c          	mov    %eax,0xc(%esp)
     5ce:	a1 8c f6 00 00       	mov    0xf68c,%eax
     5d3:	89 44 24 10          	mov    %eax,0x10(%esp)
     5d7:	a1 90 f6 00 00       	mov    0xf690,%eax
     5dc:	89 44 24 14          	mov    %eax,0x14(%esp)
     5e0:	8b 45 08             	mov    0x8(%ebp),%eax
     5e3:	89 04 24             	mov    %eax,(%esp)
     5e6:	8b 45 0c             	mov    0xc(%ebp),%eax
     5e9:	89 44 24 04          	mov    %eax,0x4(%esp)
     5ed:	8b 45 10             	mov    0x10(%ebp),%eax
     5f0:	89 44 24 08          	mov    %eax,0x8(%esp)
     5f4:	e8 81 2e 00 00       	call   347a <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     5f9:	eb 49                	jmp    644 <drawItem+0x112>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     5fb:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     5fe:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     601:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     604:	83 c0 19             	add    $0x19,%eax
     607:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     60b:	89 44 24 18          	mov    %eax,0x18(%esp)
     60f:	a1 f0 f6 00 00       	mov    0xf6f0,%eax
     614:	89 44 24 0c          	mov    %eax,0xc(%esp)
     618:	a1 f4 f6 00 00       	mov    0xf6f4,%eax
     61d:	89 44 24 10          	mov    %eax,0x10(%esp)
     621:	a1 f8 f6 00 00       	mov    0xf6f8,%eax
     626:	89 44 24 14          	mov    %eax,0x14(%esp)
     62a:	8b 45 08             	mov    0x8(%ebp),%eax
     62d:	89 04 24             	mov    %eax,(%esp)
     630:	8b 45 0c             	mov    0xc(%ebp),%eax
     633:	89 44 24 04          	mov    %eax,0x4(%esp)
     637:	8b 45 10             	mov    0x10(%ebp),%eax
     63a:	89 44 24 08          	mov    %eax,0x8(%esp)
     63e:	e8 37 2e 00 00       	call   347a <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     643:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     644:	8b 45 14             	mov    0x14(%ebp),%eax
     647:	89 04 24             	mov    %eax,(%esp)
     64a:	e8 34 43 00 00       	call   4983 <strlen>
     64f:	89 c2                	mov    %eax,%edx
     651:	b8 00 00 00 00       	mov    $0x0,%eax
     656:	29 d0                	sub    %edx,%eax
     658:	c1 e0 02             	shl    $0x2,%eax
     65b:	83 c0 30             	add    $0x30,%eax
     65e:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     661:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     665:	79 07                	jns    66e <drawItem+0x13c>
			indent = 0;
     667:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     66e:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     671:	8d 48 46             	lea    0x46(%eax),%ecx
     674:	8b 55 2c             	mov    0x2c(%ebp),%edx
     677:	8b 45 f0             	mov    -0x10(%ebp),%eax
     67a:	01 c2                	add    %eax,%edx
     67c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     680:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     684:	89 54 24 14          	mov    %edx,0x14(%esp)
     688:	89 44 24 10          	mov    %eax,0x10(%esp)
     68c:	8b 45 14             	mov    0x14(%ebp),%eax
     68f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     693:	8b 45 08             	mov    0x8(%ebp),%eax
     696:	89 04 24             	mov    %eax,(%esp)
     699:	8b 45 0c             	mov    0xc(%ebp),%eax
     69c:	89 44 24 04          	mov    %eax,0x4(%esp)
     6a0:	8b 45 10             	mov    0x10(%ebp),%eax
     6a3:	89 44 24 08          	mov    %eax,0x8(%esp)
     6a7:	e8 0e 2d 00 00       	call   33ba <puts_str>
     6ac:	e9 33 01 00 00       	jmp    7e4 <drawItem+0x2b2>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     6b1:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     6b5:	98                   	cwtl   
     6b6:	83 f8 01             	cmp    $0x1,%eax
     6b9:	0f 84 a0 00 00 00    	je     75f <drawItem+0x22d>
     6bf:	83 f8 02             	cmp    $0x2,%eax
     6c2:	0f 85 e0 00 00 00    	jne    7a8 <drawItem+0x276>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6c8:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     6cb:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6ce:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     6d1:	83 c0 08             	add    $0x8,%eax
     6d4:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     6d8:	89 44 24 18          	mov    %eax,0x18(%esp)
     6dc:	a1 bc f6 00 00       	mov    0xf6bc,%eax
     6e1:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6e5:	a1 c0 f6 00 00       	mov    0xf6c0,%eax
     6ea:	89 44 24 10          	mov    %eax,0x10(%esp)
     6ee:	a1 c4 f6 00 00       	mov    0xf6c4,%eax
     6f3:	89 44 24 14          	mov    %eax,0x14(%esp)
     6f7:	8b 45 08             	mov    0x8(%ebp),%eax
     6fa:	89 04 24             	mov    %eax,(%esp)
     6fd:	8b 45 0c             	mov    0xc(%ebp),%eax
     700:	89 44 24 04          	mov    %eax,0x4(%esp)
     704:	8b 45 10             	mov    0x10(%ebp),%eax
     707:	89 44 24 08          	mov    %eax,0x8(%esp)
     70b:	e8 6a 2d 00 00       	call   347a <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     710:	8b 45 28             	mov    0x28(%ebp),%eax
     713:	89 04 24             	mov    %eax,(%esp)
     716:	e8 cf 00 00 00       	call   7ea <sizeFormat>
     71b:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     71e:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     721:	8d 48 03             	lea    0x3(%eax),%ecx
     724:	8b 45 2c             	mov    0x2c(%ebp),%eax
     727:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     72d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     731:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     735:	89 54 24 14          	mov    %edx,0x14(%esp)
     739:	89 44 24 10          	mov    %eax,0x10(%esp)
     73d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     740:	89 44 24 0c          	mov    %eax,0xc(%esp)
     744:	8b 45 08             	mov    0x8(%ebp),%eax
     747:	89 04 24             	mov    %eax,(%esp)
     74a:	8b 45 0c             	mov    0xc(%ebp),%eax
     74d:	89 44 24 04          	mov    %eax,0x4(%esp)
     751:	8b 45 10             	mov    0x10(%ebp),%eax
     754:	89 44 24 08          	mov    %eax,0x8(%esp)
     758:	e8 5d 2c 00 00       	call   33ba <puts_str>
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     75d:	eb 49                	jmp    7a8 <drawItem+0x276>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     75f:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     762:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     765:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     768:	83 c0 08             	add    $0x8,%eax
     76b:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     76f:	89 44 24 18          	mov    %eax,0x18(%esp)
     773:	a1 24 f7 00 00       	mov    0xf724,%eax
     778:	89 44 24 0c          	mov    %eax,0xc(%esp)
     77c:	a1 28 f7 00 00       	mov    0xf728,%eax
     781:	89 44 24 10          	mov    %eax,0x10(%esp)
     785:	a1 2c f7 00 00       	mov    0xf72c,%eax
     78a:	89 44 24 14          	mov    %eax,0x14(%esp)
     78e:	8b 45 08             	mov    0x8(%ebp),%eax
     791:	89 04 24             	mov    %eax,(%esp)
     794:	8b 45 0c             	mov    0xc(%ebp),%eax
     797:	89 44 24 04          	mov    %eax,0x4(%esp)
     79b:	8b 45 10             	mov    0x10(%ebp),%eax
     79e:	89 44 24 08          	mov    %eax,0x8(%esp)
     7a2:	e8 d3 2c 00 00       	call   347a <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     7a7:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     7a8:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     7ab:	8d 48 03             	lea    0x3(%eax),%ecx
     7ae:	8b 45 2c             	mov    0x2c(%ebp),%eax
     7b1:	8d 50 28             	lea    0x28(%eax),%edx
     7b4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     7b8:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     7bc:	89 54 24 14          	mov    %edx,0x14(%esp)
     7c0:	89 44 24 10          	mov    %eax,0x10(%esp)
     7c4:	8b 45 14             	mov    0x14(%ebp),%eax
     7c7:	89 44 24 0c          	mov    %eax,0xc(%esp)
     7cb:	8b 45 08             	mov    0x8(%ebp),%eax
     7ce:	89 04 24             	mov    %eax,(%esp)
     7d1:	8b 45 0c             	mov    0xc(%ebp),%eax
     7d4:	89 44 24 04          	mov    %eax,0x4(%esp)
     7d8:	8b 45 10             	mov    0x10(%ebp),%eax
     7db:	89 44 24 08          	mov    %eax,0x8(%esp)
     7df:	e8 d6 2b 00 00       	call   33ba <puts_str>
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     7e4:	83 c4 34             	add    $0x34,%esp
     7e7:	5b                   	pop    %ebx
     7e8:	5d                   	pop    %ebp
     7e9:	c3                   	ret    

000007ea <sizeFormat>:

char *sizeFormat(uint size){
     7ea:	55                   	push   %ebp
     7eb:	89 e5                	mov    %esp,%ebp
     7ed:	53                   	push   %ebx
     7ee:	83 ec 24             	sub    $0x24,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     7f1:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     7f8:	e8 2e 48 00 00       	call   502b <malloc>
     7fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     800:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     807:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     80e:	0f 86 8b 00 00 00    	jbe    89f <sizeFormat+0xb5>
	{
		size = size / (0x400);
     814:	8b 45 08             	mov    0x8(%ebp),%eax
     817:	c1 e8 0a             	shr    $0xa,%eax
     81a:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     81d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     820:	8d 50 01             	lea    0x1(%eax),%edx
     823:	89 55 f4             	mov    %edx,-0xc(%ebp)
     826:	89 c2                	mov    %eax,%edx
     828:	8b 45 f0             	mov    -0x10(%ebp),%eax
     82b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     82e:	8b 4d 08             	mov    0x8(%ebp),%ecx
     831:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     836:	89 c8                	mov    %ecx,%eax
     838:	f7 e2                	mul    %edx
     83a:	c1 ea 03             	shr    $0x3,%edx
     83d:	89 d0                	mov    %edx,%eax
     83f:	c1 e0 02             	shl    $0x2,%eax
     842:	01 d0                	add    %edx,%eax
     844:	01 c0                	add    %eax,%eax
     846:	29 c1                	sub    %eax,%ecx
     848:	89 ca                	mov    %ecx,%edx
     84a:	89 d0                	mov    %edx,%eax
     84c:	83 c0 30             	add    $0x30,%eax
     84f:	88 03                	mov    %al,(%ebx)
			size /= 10;
     851:	8b 45 08             	mov    0x8(%ebp),%eax
     854:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     859:	f7 e2                	mul    %edx
     85b:	89 d0                	mov    %edx,%eax
     85d:	c1 e8 03             	shr    $0x3,%eax
     860:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     863:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     867:	75 b4                	jne    81d <sizeFormat+0x33>
		result[n++] = 'K';
     869:	8b 45 f4             	mov    -0xc(%ebp),%eax
     86c:	8d 50 01             	lea    0x1(%eax),%edx
     86f:	89 55 f4             	mov    %edx,-0xc(%ebp)
     872:	89 c2                	mov    %eax,%edx
     874:	8b 45 f0             	mov    -0x10(%ebp),%eax
     877:	01 d0                	add    %edx,%eax
     879:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     87c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     87f:	8d 50 01             	lea    0x1(%eax),%edx
     882:	89 55 f4             	mov    %edx,-0xc(%ebp)
     885:	89 c2                	mov    %eax,%edx
     887:	8b 45 f0             	mov    -0x10(%ebp),%eax
     88a:	01 d0                	add    %edx,%eax
     88c:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     88f:	8b 55 f4             	mov    -0xc(%ebp),%edx
     892:	8b 45 f0             	mov    -0x10(%ebp),%eax
     895:	01 d0                	add    %edx,%eax
     897:	c6 00 00             	movb   $0x0,(%eax)
     89a:	e9 a3 00 00 00       	jmp    942 <sizeFormat+0x158>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     89f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8a2:	8d 50 01             	lea    0x1(%eax),%edx
     8a5:	89 55 f4             	mov    %edx,-0xc(%ebp)
     8a8:	89 c2                	mov    %eax,%edx
     8aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8ad:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     8b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
     8b3:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     8b8:	89 c8                	mov    %ecx,%eax
     8ba:	f7 e2                	mul    %edx
     8bc:	c1 ea 03             	shr    $0x3,%edx
     8bf:	89 d0                	mov    %edx,%eax
     8c1:	c1 e0 02             	shl    $0x2,%eax
     8c4:	01 d0                	add    %edx,%eax
     8c6:	01 c0                	add    %eax,%eax
     8c8:	29 c1                	sub    %eax,%ecx
     8ca:	89 ca                	mov    %ecx,%edx
     8cc:	89 d0                	mov    %edx,%eax
     8ce:	83 c0 30             	add    $0x30,%eax
     8d1:	88 03                	mov    %al,(%ebx)
			size /= 10;
     8d3:	8b 45 08             	mov    0x8(%ebp),%eax
     8d6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     8db:	f7 e2                	mul    %edx
     8dd:	89 d0                	mov    %edx,%eax
     8df:	c1 e8 03             	shr    $0x3,%eax
     8e2:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     8e5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     8e9:	75 b4                	jne    89f <sizeFormat+0xb5>
		result[n++] = 'b';
     8eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8ee:	8d 50 01             	lea    0x1(%eax),%edx
     8f1:	89 55 f4             	mov    %edx,-0xc(%ebp)
     8f4:	89 c2                	mov    %eax,%edx
     8f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8f9:	01 d0                	add    %edx,%eax
     8fb:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     8fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
     901:	8d 50 01             	lea    0x1(%eax),%edx
     904:	89 55 f4             	mov    %edx,-0xc(%ebp)
     907:	89 c2                	mov    %eax,%edx
     909:	8b 45 f0             	mov    -0x10(%ebp),%eax
     90c:	01 d0                	add    %edx,%eax
     90e:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     911:	8b 45 f4             	mov    -0xc(%ebp),%eax
     914:	8d 50 01             	lea    0x1(%eax),%edx
     917:	89 55 f4             	mov    %edx,-0xc(%ebp)
     91a:	89 c2                	mov    %eax,%edx
     91c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     91f:	01 d0                	add    %edx,%eax
     921:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     924:	8b 45 f4             	mov    -0xc(%ebp),%eax
     927:	8d 50 01             	lea    0x1(%eax),%edx
     92a:	89 55 f4             	mov    %edx,-0xc(%ebp)
     92d:	89 c2                	mov    %eax,%edx
     92f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     932:	01 d0                	add    %edx,%eax
     934:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     937:	8b 55 f4             	mov    -0xc(%ebp),%edx
     93a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     93d:	01 d0                	add    %edx,%eax
     93f:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     942:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     945:	83 c4 24             	add    $0x24,%esp
     948:	5b                   	pop    %ebx
     949:	5d                   	pop    %ebp
     94a:	c3                   	ret    

0000094b <drawFinderWnd>:
		9 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "blank.bmp",
		10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) } };

void drawFinderWnd(Context context) {
     94b:	55                   	push   %ebp
     94c:	89 e5                	mov    %esp,%ebp
     94e:	83 ec 28             	sub    $0x28,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     951:	8b 45 0c             	mov    0xc(%ebp),%eax
     954:	83 e8 01             	sub    $0x1,%eax
     957:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     95e:	00 
     95f:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     966:	00 
     967:	89 44 24 14          	mov    %eax,0x14(%esp)
     96b:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     972:	00 
     973:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     97a:	00 
     97b:	8b 45 08             	mov    0x8(%ebp),%eax
     97e:	89 04 24             	mov    %eax,(%esp)
     981:	8b 45 0c             	mov    0xc(%ebp),%eax
     984:	89 44 24 04          	mov    %eax,0x4(%esp)
     988:	8b 45 10             	mov    0x10(%ebp),%eax
     98b:	89 44 24 08          	mov    %eax,0x8(%esp)
     98f:	e8 bc 2b 00 00       	call   3550 <draw_line>
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     994:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     997:	8d 48 ff             	lea    -0x1(%eax),%ecx
     99a:	8b 45 0c             	mov    0xc(%ebp),%eax
     99d:	8d 50 ff             	lea    -0x1(%eax),%edx
     9a0:	8b 45 0c             	mov    0xc(%ebp),%eax
     9a3:	83 e8 01             	sub    $0x1,%eax
     9a6:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     9ad:	00 
     9ae:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     9b2:	89 54 24 14          	mov    %edx,0x14(%esp)
     9b6:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     9bd:	00 
     9be:	89 44 24 0c          	mov    %eax,0xc(%esp)
     9c2:	8b 45 08             	mov    0x8(%ebp),%eax
     9c5:	89 04 24             	mov    %eax,(%esp)
     9c8:	8b 45 0c             	mov    0xc(%ebp),%eax
     9cb:	89 44 24 04          	mov    %eax,0x4(%esp)
     9cf:	8b 45 10             	mov    0x10(%ebp),%eax
     9d2:	89 44 24 08          	mov    %eax,0x8(%esp)
     9d6:	e8 75 2b 00 00       	call   3550 <draw_line>
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     9db:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     9de:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     9e1:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     9e4:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     9e7:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     9ea:	83 e8 01             	sub    $0x1,%eax
     9ed:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     9f4:	00 
     9f5:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     9f9:	89 54 24 14          	mov    %edx,0x14(%esp)
     9fd:	89 44 24 10          	mov    %eax,0x10(%esp)
     a01:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a08:	00 
     a09:	8b 45 08             	mov    0x8(%ebp),%eax
     a0c:	89 04 24             	mov    %eax,(%esp)
     a0f:	8b 45 0c             	mov    0xc(%ebp),%eax
     a12:	89 44 24 04          	mov    %eax,0x4(%esp)
     a16:	8b 45 10             	mov    0x10(%ebp),%eax
     a19:	89 44 24 08          	mov    %eax,0x8(%esp)
     a1d:	e8 2e 2b 00 00       	call   3550 <draw_line>
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     a22:	8b 45 10             	mov    0x10(%ebp),%eax
     a25:	83 e8 01             	sub    $0x1,%eax
     a28:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     a2f:	00 
     a30:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     a37:	00 
     a38:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     a3f:	00 
     a40:	89 44 24 10          	mov    %eax,0x10(%esp)
     a44:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a4b:	00 
     a4c:	8b 45 08             	mov    0x8(%ebp),%eax
     a4f:	89 04 24             	mov    %eax,(%esp)
     a52:	8b 45 0c             	mov    0xc(%ebp),%eax
     a55:	89 44 24 04          	mov    %eax,0x4(%esp)
     a59:	8b 45 10             	mov    0x10(%ebp),%eax
     a5c:	89 44 24 08          	mov    %eax,0x8(%esp)
     a60:	e8 eb 2a 00 00       	call   3550 <draw_line>
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     a65:	8b 45 0c             	mov    0xc(%ebp),%eax
     a68:	83 e8 02             	sub    $0x2,%eax
     a6b:	c7 44 24 1c 18 c6 00 	movl   $0xc618,0x1c(%esp)
     a72:	00 
     a73:	c7 44 24 18 46 00 00 	movl   $0x46,0x18(%esp)
     a7a:	00 
     a7b:	89 44 24 14          	mov    %eax,0x14(%esp)
     a7f:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     a86:	00 
     a87:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     a8e:	00 
     a8f:	8b 45 08             	mov    0x8(%ebp),%eax
     a92:	89 04 24             	mov    %eax,(%esp)
     a95:	8b 45 0c             	mov    0xc(%ebp),%eax
     a98:	89 44 24 04          	mov    %eax,0x4(%esp)
     a9c:	8b 45 10             	mov    0x10(%ebp),%eax
     a9f:	89 44 24 08          	mov    %eax,0x8(%esp)
     aa3:	e8 33 23 00 00       	call   2ddb <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     aa8:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     aaf:	00 
     ab0:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     ab7:	00 
     ab8:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     abf:	00 
     ac0:	c7 44 24 0c 08 b4 00 	movl   $0xb408,0xc(%esp)
     ac7:	00 
     ac8:	8b 45 08             	mov    0x8(%ebp),%eax
     acb:	89 04 24             	mov    %eax,(%esp)
     ace:	8b 45 0c             	mov    0xc(%ebp),%eax
     ad1:	89 44 24 04          	mov    %eax,0x4(%esp)
     ad5:	8b 45 10             	mov    0x10(%ebp),%eax
     ad8:	89 44 24 08          	mov    %eax,0x8(%esp)
     adc:	e8 d9 28 00 00       	call   33ba <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     ae1:	c7 44 24 10 0e 00 00 	movl   $0xe,0x10(%esp)
     ae8:	00 
     ae9:	c7 44 24 0c 40 f7 00 	movl   $0xf740,0xc(%esp)
     af0:	00 
     af1:	8b 45 08             	mov    0x8(%ebp),%eax
     af4:	89 04 24             	mov    %eax,(%esp)
     af7:	8b 45 0c             	mov    0xc(%ebp),%eax
     afa:	89 44 24 04          	mov    %eax,0x4(%esp)
     afe:	8b 45 10             	mov    0x10(%ebp),%eax
     b01:	89 44 24 08          	mov    %eax,0x8(%esp)
     b05:	e8 21 2e 00 00       	call   392b <draw_iconlist>
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     b0a:	c7 44 24 18 23 00 00 	movl   $0x23,0x18(%esp)
     b11:	00 
     b12:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
     b19:	00 
     b1a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     b21:	00 
     b22:	c7 44 24 0c 8c 35 01 	movl   $0x1358c,0xc(%esp)
     b29:	00 
     b2a:	8b 45 08             	mov    0x8(%ebp),%eax
     b2d:	89 04 24             	mov    %eax,(%esp)
     b30:	8b 45 0c             	mov    0xc(%ebp),%eax
     b33:	89 44 24 04          	mov    %eax,0x4(%esp)
     b37:	8b 45 10             	mov    0x10(%ebp),%eax
     b3a:	89 44 24 08          	mov    %eax,0x8(%esp)
     b3e:	e8 77 28 00 00       	call   33ba <puts_str>
				- (BUTTON_HEIGHT + 3) );


}
     b43:	c9                   	leave  
     b44:	c3                   	ret    

00000b45 <drawFinderContent>:

void drawFinderContent(Context context) {
     b45:	55                   	push   %ebp
     b46:	89 e5                	mov    %esp,%ebp
     b48:	53                   	push   %ebx
     b49:	83 ec 64             	sub    $0x64,%esp
	struct fileItem *p;
	int tempItemCounter = 0;
     b4c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     b53:	c7 45 ec 46 00 00 00 	movl   $0x46,-0x14(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     b5a:	a1 44 f6 00 00       	mov    0xf644,%eax
     b5f:	83 f8 02             	cmp    $0x2,%eax
     b62:	75 04                	jne    b68 <drawFinderContent+0x23>
     b64:	83 45 ec 1c          	addl   $0x1c,-0x14(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     b68:	8b 45 10             	mov    0x10(%ebp),%eax
     b6b:	83 e8 48             	sub    $0x48,%eax
	int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     b6e:	89 c1                	mov    %eax,%ecx
     b70:	8b 45 0c             	mov    0xc(%ebp),%eax
     b73:	83 e8 02             	sub    $0x2,%eax
     b76:	89 c2                	mov    %eax,%edx
     b78:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b7b:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     b82:	00 
     b83:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     b87:	89 54 24 14          	mov    %edx,0x14(%esp)
     b8b:	89 44 24 10          	mov    %eax,0x10(%esp)
     b8f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     b96:	00 
     b97:	8b 45 08             	mov    0x8(%ebp),%eax
     b9a:	89 04 24             	mov    %eax,(%esp)
     b9d:	8b 45 0c             	mov    0xc(%ebp),%eax
     ba0:	89 44 24 04          	mov    %eax,0x4(%esp)
     ba4:	8b 45 10             	mov    0x10(%ebp),%eax
     ba7:	89 44 24 08          	mov    %eax,0x8(%esp)
     bab:	e8 2b 22 00 00       	call   2ddb <fill_rect>
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     bb0:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     bb3:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     bb6:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     bb9:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     bbc:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     bbf:	83 e8 01             	sub    $0x1,%eax
     bc2:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     bc9:	00 
     bca:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     bce:	89 54 24 14          	mov    %edx,0x14(%esp)
     bd2:	89 44 24 10          	mov    %eax,0x10(%esp)
     bd6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     bdd:	00 
     bde:	8b 45 08             	mov    0x8(%ebp),%eax
     be1:	89 04 24             	mov    %eax,(%esp)
     be4:	8b 45 0c             	mov    0xc(%ebp),%eax
     be7:	89 44 24 04          	mov    %eax,0x4(%esp)
     beb:	8b 45 10             	mov    0x10(%ebp),%eax
     bee:	89 44 24 08          	mov    %eax,0x8(%esp)
     bf2:	e8 59 29 00 00       	call   3550 <draw_line>

	//printf(0, "listing complete!\n");
	//printItemList();
//	p = fileItemList;
//	q = 0;
	if (keyContent.length == 0) {
     bf7:	a1 a0 35 01 00       	mov    0x135a0,%eax
     bfc:	85 c0                	test   %eax,%eax
     bfe:	0f 85 a3 00 00 00    	jne    ca7 <drawFinderContent+0x162>
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
     c04:	c7 44 24 04 10 b4 00 	movl   $0xb410,0x4(%esp)
     c0b:	00 
     c0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c13:	e8 27 41 00 00       	call   4d3f <printf>
//		freeFileItemList();
//		list(".");
		p = fileItemList;
     c18:	a1 68 ff 00 00       	mov    0xff68,%eax
     c1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while (p != 0) {
     c20:	eb 7a                	jmp    c9c <drawFinderContent+0x157>
			//printf(0, "draw item\n");
			drawItem(context, p->name, p->st, p->pos, p->chosen);
     c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c25:	8b 40 28             	mov    0x28(%eax),%eax
     c28:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c2b:	8b 52 14             	mov    0x14(%edx),%edx
     c2e:	89 44 24 34          	mov    %eax,0x34(%esp)
     c32:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c35:	8b 48 18             	mov    0x18(%eax),%ecx
     c38:	89 4c 24 24          	mov    %ecx,0x24(%esp)
     c3c:	8b 48 1c             	mov    0x1c(%eax),%ecx
     c3f:	89 4c 24 28          	mov    %ecx,0x28(%esp)
     c43:	8b 48 20             	mov    0x20(%eax),%ecx
     c46:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
     c4a:	8b 40 24             	mov    0x24(%eax),%eax
     c4d:	89 44 24 30          	mov    %eax,0x30(%esp)
     c51:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c54:	8b 08                	mov    (%eax),%ecx
     c56:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     c5a:	8b 48 04             	mov    0x4(%eax),%ecx
     c5d:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     c61:	8b 48 08             	mov    0x8(%eax),%ecx
     c64:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     c68:	8b 48 0c             	mov    0xc(%eax),%ecx
     c6b:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
     c6f:	8b 40 10             	mov    0x10(%eax),%eax
     c72:	89 44 24 20          	mov    %eax,0x20(%esp)
     c76:	89 54 24 0c          	mov    %edx,0xc(%esp)
     c7a:	8b 45 08             	mov    0x8(%ebp),%eax
     c7d:	89 04 24             	mov    %eax,(%esp)
     c80:	8b 45 0c             	mov    0xc(%ebp),%eax
     c83:	89 44 24 04          	mov    %eax,0x4(%esp)
     c87:	8b 45 10             	mov    0x10(%ebp),%eax
     c8a:	89 44 24 08          	mov    %eax,0x8(%esp)
     c8e:	e8 9f f8 ff ff       	call   532 <drawItem>
			p = p->next;
     c93:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c96:	8b 40 2c             	mov    0x2c(%eax),%eax
     c99:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (keyContent.length == 0) {
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
		while (p != 0) {
     c9c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ca0:	75 80                	jne    c22 <drawFinderContent+0xdd>
     ca2:	e9 04 01 00 00       	jmp    dab <drawFinderContent+0x266>
			drawItem(context, p->name, p->st, p->pos, p->chosen);
			p = p->next;
		}
	}
	else{
		p = fileItemList;
     ca7:	a1 68 ff 00 00       	mov    0xff68,%eax
     cac:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while(p != 0) {
     caf:	e9 ed 00 00 00       	jmp    da1 <drawFinderContent+0x25c>
			printf(0, "now you are searching!\n");
     cb4:	c7 44 24 04 69 b4 00 	movl   $0xb469,0x4(%esp)
     cbb:	00 
     cbc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cc3:	e8 77 40 00 00       	call   4d3f <printf>
		   	if (strstr(p->name, keyContent.content)) {
     cc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ccb:	8b 40 14             	mov    0x14(%eax),%eax
     cce:	c7 44 24 04 8c 35 01 	movl   $0x1358c,0x4(%esp)
     cd5:	00 
     cd6:	89 04 24             	mov    %eax,(%esp)
     cd9:	e8 22 f3 ff ff       	call   0 <strstr>
     cde:	85 c0                	test   %eax,%eax
     ce0:	0f 84 b2 00 00 00    	je     d98 <drawFinderContent+0x253>
				drawItem(context, p->name, p->st, getPos(context, tempItemCounter++), p->chosen);
     ce6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ce9:	8b 58 28             	mov    0x28(%eax),%ebx
     cec:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cef:	8d 50 01             	lea    0x1(%eax),%edx
     cf2:	89 55 f0             	mov    %edx,-0x10(%ebp)
     cf5:	8d 55 dc             	lea    -0x24(%ebp),%edx
     cf8:	89 44 24 10          	mov    %eax,0x10(%esp)
     cfc:	8b 45 08             	mov    0x8(%ebp),%eax
     cff:	89 44 24 04          	mov    %eax,0x4(%esp)
     d03:	8b 45 0c             	mov    0xc(%ebp),%eax
     d06:	89 44 24 08          	mov    %eax,0x8(%esp)
     d0a:	8b 45 10             	mov    0x10(%ebp),%eax
     d0d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     d11:	89 14 24             	mov    %edx,(%esp)
     d14:	e8 01 03 00 00       	call   101a <getPos>
     d19:	83 ec 04             	sub    $0x4,%esp
     d1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d1f:	8b 50 14             	mov    0x14(%eax),%edx
     d22:	89 5c 24 34          	mov    %ebx,0x34(%esp)
     d26:	8b 45 dc             	mov    -0x24(%ebp),%eax
     d29:	89 44 24 24          	mov    %eax,0x24(%esp)
     d2d:	8b 45 e0             	mov    -0x20(%ebp),%eax
     d30:	89 44 24 28          	mov    %eax,0x28(%esp)
     d34:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d37:	89 44 24 2c          	mov    %eax,0x2c(%esp)
     d3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d3e:	89 44 24 30          	mov    %eax,0x30(%esp)
     d42:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d45:	8b 08                	mov    (%eax),%ecx
     d47:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     d4b:	8b 48 04             	mov    0x4(%eax),%ecx
     d4e:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     d52:	8b 48 08             	mov    0x8(%eax),%ecx
     d55:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     d59:	8b 48 0c             	mov    0xc(%eax),%ecx
     d5c:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
     d60:	8b 40 10             	mov    0x10(%eax),%eax
     d63:	89 44 24 20          	mov    %eax,0x20(%esp)
     d67:	89 54 24 0c          	mov    %edx,0xc(%esp)
     d6b:	8b 45 08             	mov    0x8(%ebp),%eax
     d6e:	89 04 24             	mov    %eax,(%esp)
     d71:	8b 45 0c             	mov    0xc(%ebp),%eax
     d74:	89 44 24 04          	mov    %eax,0x4(%esp)
     d78:	8b 45 10             	mov    0x10(%ebp),%eax
     d7b:	89 44 24 08          	mov    %eax,0x8(%esp)
     d7f:	e8 ae f7 ff ff       	call   532 <drawItem>
				printf(0, "now you are searching! printing\n");
     d84:	c7 44 24 04 84 b4 00 	movl   $0xb484,0x4(%esp)
     d8b:	00 
     d8c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d93:	e8 a7 3f 00 00       	call   4d3f <printf>
		   	}
			p = p->next;
     d98:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d9b:	8b 40 2c             	mov    0x2c(%eax),%eax
     d9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
			p = p->next;
		}
	}
	else{
		p = fileItemList;
		while(p != 0) {
     da1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     da5:	0f 85 09 ff ff ff    	jne    cb4 <drawFinderContent+0x16f>
			p = p->next;
			
		}
	}

	if (style == LIST_STYLE)
     dab:	a1 44 f6 00 00       	mov    0xf644,%eax
     db0:	83 f8 02             	cmp    $0x2,%eax
     db3:	0f 85 39 01 00 00    	jne    ef2 <drawFinderContent+0x3ad>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     db9:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     dc0:	00 
     dc1:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     dc8:	00 
     dc9:	c7 44 24 14 26 00 00 	movl   $0x26,0x14(%esp)
     dd0:	00 
     dd1:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     dd8:	00 
     dd9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     de0:	00 
     de1:	8b 45 08             	mov    0x8(%ebp),%eax
     de4:	89 04 24             	mov    %eax,(%esp)
     de7:	8b 45 0c             	mov    0xc(%ebp),%eax
     dea:	89 44 24 04          	mov    %eax,0x4(%esp)
     dee:	8b 45 10             	mov    0x10(%ebp),%eax
     df1:	89 44 24 08          	mov    %eax,0x8(%esp)
     df5:	e8 e1 1f 00 00       	call   2ddb <fill_rect>
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     dfa:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     e01:	00 
     e02:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     e09:	00 
     e0a:	c7 44 24 14 9f 00 00 	movl   $0x9f,0x14(%esp)
     e11:	00 
     e12:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     e19:	00 
     e1a:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
     e21:	00 
     e22:	8b 45 08             	mov    0x8(%ebp),%eax
     e25:	89 04 24             	mov    %eax,(%esp)
     e28:	8b 45 0c             	mov    0xc(%ebp),%eax
     e2b:	89 44 24 04          	mov    %eax,0x4(%esp)
     e2f:	8b 45 10             	mov    0x10(%ebp),%eax
     e32:	89 44 24 08          	mov    %eax,0x8(%esp)
     e36:	e8 a0 1f 00 00       	call   2ddb <fill_rect>
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     e3b:	8b 45 0c             	mov    0xc(%ebp),%eax
     e3e:	2d c9 00 00 00       	sub    $0xc9,%eax
     e43:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     e4a:	00 
     e4b:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     e52:	00 
     e53:	89 44 24 14          	mov    %eax,0x14(%esp)
     e57:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     e5e:	00 
     e5f:	c7 44 24 0c c8 00 00 	movl   $0xc8,0xc(%esp)
     e66:	00 
     e67:	8b 45 08             	mov    0x8(%ebp),%eax
     e6a:	89 04 24             	mov    %eax,(%esp)
     e6d:	8b 45 0c             	mov    0xc(%ebp),%eax
     e70:	89 44 24 04          	mov    %eax,0x4(%esp)
     e74:	8b 45 10             	mov    0x10(%ebp),%eax
     e77:	89 44 24 08          	mov    %eax,0x8(%esp)
     e7b:	e8 5b 1f 00 00       	call   2ddb <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     e80:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     e87:	00 
     e88:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
     e8f:	00 
     e90:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     e97:	00 
     e98:	c7 44 24 0c a5 b4 00 	movl   $0xb4a5,0xc(%esp)
     e9f:	00 
     ea0:	8b 45 08             	mov    0x8(%ebp),%eax
     ea3:	89 04 24             	mov    %eax,(%esp)
     ea6:	8b 45 0c             	mov    0xc(%ebp),%eax
     ea9:	89 44 24 04          	mov    %eax,0x4(%esp)
     ead:	8b 45 10             	mov    0x10(%ebp),%eax
     eb0:	89 44 24 08          	mov    %eax,0x8(%esp)
     eb4:	e8 01 25 00 00       	call   33ba <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     eb9:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     ec0:	00 
     ec1:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
     ec8:	00 
     ec9:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     ed0:	00 
     ed1:	c7 44 24 0c aa b4 00 	movl   $0xb4aa,0xc(%esp)
     ed8:	00 
     ed9:	8b 45 08             	mov    0x8(%ebp),%eax
     edc:	89 04 24             	mov    %eax,(%esp)
     edf:	8b 45 0c             	mov    0xc(%ebp),%eax
     ee2:	89 44 24 04          	mov    %eax,0x4(%esp)
     ee6:	8b 45 10             	mov    0x10(%ebp),%eax
     ee9:	89 44 24 08          	mov    %eax,0x8(%esp)
     eed:	e8 c8 24 00 00       	call   33ba <puts_str>
		}
}
     ef2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ef5:	c9                   	leave  
     ef6:	c3                   	ret    

00000ef7 <int2str>:

char * int2str(int i)
{
     ef7:	55                   	push   %ebp
     ef8:	89 e5                	mov    %esp,%ebp
     efa:	53                   	push   %ebx
     efb:	83 ec 24             	sub    $0x24,%esp
	int j;
	int n = 0;
     efe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     f05:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     f0c:	e8 1a 41 00 00       	call   502b <malloc>
     f11:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     f14:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     f1b:	e8 0b 41 00 00       	call   502b <malloc>
     f20:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     f23:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f26:	8d 50 01             	lea    0x1(%eax),%edx
     f29:	89 55 f0             	mov    %edx,-0x10(%ebp)
     f2c:	89 c2                	mov    %eax,%edx
     f2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f31:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     f34:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f37:	ba 67 66 66 66       	mov    $0x66666667,%edx
     f3c:	89 c8                	mov    %ecx,%eax
     f3e:	f7 ea                	imul   %edx
     f40:	c1 fa 02             	sar    $0x2,%edx
     f43:	89 c8                	mov    %ecx,%eax
     f45:	c1 f8 1f             	sar    $0x1f,%eax
     f48:	29 c2                	sub    %eax,%edx
     f4a:	89 d0                	mov    %edx,%eax
     f4c:	c1 e0 02             	shl    $0x2,%eax
     f4f:	01 d0                	add    %edx,%eax
     f51:	01 c0                	add    %eax,%eax
     f53:	29 c1                	sub    %eax,%ecx
     f55:	89 ca                	mov    %ecx,%edx
     f57:	89 d0                	mov    %edx,%eax
     f59:	83 c0 30             	add    $0x30,%eax
     f5c:	88 03                	mov    %al,(%ebx)
		i /= 10;
     f5e:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f61:	ba 67 66 66 66       	mov    $0x66666667,%edx
     f66:	89 c8                	mov    %ecx,%eax
     f68:	f7 ea                	imul   %edx
     f6a:	c1 fa 02             	sar    $0x2,%edx
     f6d:	89 c8                	mov    %ecx,%eax
     f6f:	c1 f8 1f             	sar    $0x1f,%eax
     f72:	29 c2                	sub    %eax,%edx
     f74:	89 d0                	mov    %edx,%eax
     f76:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     f79:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     f7d:	75 a4                	jne    f23 <int2str+0x2c>
	result[n] = 0;
     f7f:	8b 55 f0             	mov    -0x10(%ebp),%edx
     f82:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f85:	01 d0                	add    %edx,%eax
     f87:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     f8a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f91:	eb 21                	jmp    fb4 <int2str+0xbd>
	{
		temp[j] = result[n-1-j];
     f93:	8b 55 f4             	mov    -0xc(%ebp),%edx
     f96:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f99:	01 c2                	add    %eax,%edx
     f9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f9e:	83 e8 01             	sub    $0x1,%eax
     fa1:	2b 45 f4             	sub    -0xc(%ebp),%eax
     fa4:	89 c1                	mov    %eax,%ecx
     fa6:	8b 45 ec             	mov    -0x14(%ebp),%eax
     fa9:	01 c8                	add    %ecx,%eax
     fab:	0f b6 00             	movzbl (%eax),%eax
     fae:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
     fb0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     fb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb7:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     fba:	7c d7                	jl     f93 <int2str+0x9c>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
     fbc:	8b 55 f0             	mov    -0x10(%ebp),%edx
     fbf:	8b 45 e8             	mov    -0x18(%ebp),%eax
     fc2:	01 d0                	add    %edx,%eax
     fc4:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
     fc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
     fca:	89 04 24             	mov    %eax,(%esp)
     fcd:	e8 20 3f 00 00       	call   4ef2 <free>
	return temp;
     fd2:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
     fd5:	83 c4 24             	add    $0x24,%esp
     fd8:	5b                   	pop    %ebx
     fd9:	5d                   	pop    %ebp
     fda:	c3                   	ret    

00000fdb <printItemList>:

void printItemList() {
     fdb:	55                   	push   %ebp
     fdc:	89 e5                	mov    %esp,%ebp
     fde:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p;
	p = fileItemList;
     fe1:	a1 68 ff 00 00       	mov    0xff68,%eax
     fe6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     fe9:	eb 27                	jmp    1012 <printItemList+0x37>
		printf(0, "%s\n", p->name);
     feb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fee:	8b 40 14             	mov    0x14(%eax),%eax
     ff1:	89 44 24 08          	mov    %eax,0x8(%esp)
     ff5:	c7 44 24 04 af b4 00 	movl   $0xb4af,0x4(%esp)
     ffc:	00 
     ffd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1004:	e8 36 3d 00 00       	call   4d3f <printf>
		p = p->next;
    1009:	8b 45 f4             	mov    -0xc(%ebp),%eax
    100c:	8b 40 2c             	mov    0x2c(%eax),%eax
    100f:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
    1012:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1016:	75 d3                	jne    feb <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
    1018:	c9                   	leave  
    1019:	c3                   	ret    

0000101a <getPos>:

Rect getPos(Context context, int n) {
    101a:	55                   	push   %ebp
    101b:	89 e5                	mov    %esp,%ebp
    101d:	83 ec 48             	sub    $0x48,%esp
	if (style == ICON_STYLE) {
    1020:	a1 44 f6 00 00       	mov    0xf644,%eax
    1025:	83 f8 01             	cmp    $0x1,%eax
    1028:	0f 85 80 00 00 00    	jne    10ae <getPos+0x94>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    102e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1031:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
    1036:	89 c8                	mov    %ecx,%eax
    1038:	f7 ea                	imul   %edx
    103a:	c1 fa 06             	sar    $0x6,%edx
    103d:	89 c8                	mov    %ecx,%eax
    103f:	c1 f8 1f             	sar    $0x1f,%eax
    1042:	29 c2                	sub    %eax,%edx
    1044:	89 d0                	mov    %edx,%eax
    1046:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
    1049:	8b 45 18             	mov    0x18(%ebp),%eax
    104c:	99                   	cltd   
    104d:	f7 7d f4             	idivl  -0xc(%ebp)
    1050:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
    1053:	8b 45 18             	mov    0x18(%ebp),%eax
    1056:	99                   	cltd   
    1057:	f7 7d f4             	idivl  -0xc(%ebp)
    105a:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
    105d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1060:	6b c0 73             	imul   $0x73,%eax,%eax
    1063:	83 c0 5a             	add    $0x5a,%eax
    1066:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    1069:	8b 45 ec             	mov    -0x14(%ebp),%eax
    106c:	01 c0                	add    %eax,%eax
    106e:	89 c2                	mov    %eax,%edx
    1070:	c1 e2 06             	shl    $0x6,%edx
    1073:	01 d0                	add    %edx,%eax
    1075:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
    1078:	8b 15 60 ff 00 00    	mov    0xff60,%edx
    107e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1081:	01 c2                	add    %eax,%edx
    1083:	8b 45 08             	mov    0x8(%ebp),%eax
    1086:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
    108d:	00 
    108e:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
    1095:	00 
    1096:	89 54 24 08          	mov    %edx,0x8(%esp)
    109a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    109d:	89 54 24 04          	mov    %edx,0x4(%esp)
    10a1:	89 04 24             	mov    %eax,(%esp)
    10a4:	e8 7c 31 00 00       	call   4225 <initRect>
    10a9:	83 ec 04             	sub    $0x4,%esp
    10ac:	eb 3d                	jmp    10eb <getPos+0xd1>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
    10ae:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10b1:	8b 55 18             	mov    0x18(%ebp),%edx
    10b4:	89 d0                	mov    %edx,%eax
    10b6:	c1 e0 05             	shl    $0x5,%eax
    10b9:	29 d0                	sub    %edx,%eax
    10bb:	8d 50 62             	lea    0x62(%eax),%edx
    10be:	a1 60 ff 00 00       	mov    0xff60,%eax
    10c3:	01 c2                	add    %eax,%edx
    10c5:	8b 45 08             	mov    0x8(%ebp),%eax
    10c8:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    10cf:	00 
    10d0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    10d4:	89 54 24 08          	mov    %edx,0x8(%esp)
    10d8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10df:	00 
    10e0:	89 04 24             	mov    %eax,(%esp)
    10e3:	e8 3d 31 00 00       	call   4225 <initRect>
    10e8:	83 ec 04             	sub    $0x4,%esp
				LIST_ITEM_HEIGHT);
	}
}
    10eb:	8b 45 08             	mov    0x8(%ebp),%eax
    10ee:	c9                   	leave  
    10ef:	c2 04 00             	ret    $0x4

000010f2 <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
    10f2:	55                   	push   %ebp
    10f3:	89 e5                	mov    %esp,%ebp
    10f5:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
    10f8:	a1 44 f6 00 00       	mov    0xf644,%eax
    10fd:	83 f8 01             	cmp    $0x1,%eax
    1100:	75 0d                	jne    110f <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
    1102:	8b 45 28             	mov    0x28(%ebp),%eax
    1105:	83 f8 45             	cmp    $0x45,%eax
    1108:	7f 12                	jg     111c <addItemEvent+0x2a>
			return;
    110a:	e9 e0 00 00 00       	jmp    11ef <addItemEvent+0xfd>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
    110f:	8b 45 28             	mov    0x28(%ebp),%eax
    1112:	83 f8 61             	cmp    $0x61,%eax
    1115:	7f 05                	jg     111c <addItemEvent+0x2a>
			return;
    1117:	e9 d3 00 00 00       	jmp    11ef <addItemEvent+0xfd>
	}
	switch (item.st.type) {
    111c:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    1120:	98                   	cwtl   
    1121:	83 f8 01             	cmp    $0x1,%eax
    1124:	74 45                	je     116b <addItemEvent+0x79>
    1126:	83 f8 02             	cmp    $0x2,%eax
    1129:	0f 85 ac 00 00 00    	jne    11db <addItemEvent+0xe9>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    112f:	c7 44 24 18 5f 24 00 	movl   $0x245f,0x18(%esp)
    1136:	00 
    1137:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    113e:	00 
    113f:	8b 45 24             	mov    0x24(%ebp),%eax
    1142:	89 44 24 04          	mov    %eax,0x4(%esp)
    1146:	8b 45 28             	mov    0x28(%ebp),%eax
    1149:	89 44 24 08          	mov    %eax,0x8(%esp)
    114d:	8b 45 2c             	mov    0x2c(%ebp),%eax
    1150:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1154:	8b 45 30             	mov    0x30(%ebp),%eax
    1157:	89 44 24 10          	mov    %eax,0x10(%esp)
    115b:	8b 45 08             	mov    0x8(%ebp),%eax
    115e:	89 04 24             	mov    %eax,(%esp)
    1161:	e8 ab 31 00 00       	call   4311 <createClickable>
		break;
    1166:	e9 84 00 00 00       	jmp    11ef <addItemEvent+0xfd>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    116b:	c7 44 24 18 5f 24 00 	movl   $0x245f,0x18(%esp)
    1172:	00 
    1173:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    117a:	00 
    117b:	8b 45 24             	mov    0x24(%ebp),%eax
    117e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1182:	8b 45 28             	mov    0x28(%ebp),%eax
    1185:	89 44 24 08          	mov    %eax,0x8(%esp)
    1189:	8b 45 2c             	mov    0x2c(%ebp),%eax
    118c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1190:	8b 45 30             	mov    0x30(%ebp),%eax
    1193:	89 44 24 10          	mov    %eax,0x10(%esp)
    1197:	8b 45 08             	mov    0x8(%ebp),%eax
    119a:	89 04 24             	mov    %eax,(%esp)
    119d:	e8 6f 31 00 00       	call   4311 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
    11a2:	c7 44 24 18 3d 18 00 	movl   $0x183d,0x18(%esp)
    11a9:	00 
    11aa:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
    11b1:	00 
    11b2:	8b 45 24             	mov    0x24(%ebp),%eax
    11b5:	89 44 24 04          	mov    %eax,0x4(%esp)
    11b9:	8b 45 28             	mov    0x28(%ebp),%eax
    11bc:	89 44 24 08          	mov    %eax,0x8(%esp)
    11c0:	8b 45 2c             	mov    0x2c(%ebp),%eax
    11c3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    11c7:	8b 45 30             	mov    0x30(%ebp),%eax
    11ca:	89 44 24 10          	mov    %eax,0x10(%esp)
    11ce:	8b 45 08             	mov    0x8(%ebp),%eax
    11d1:	89 04 24             	mov    %eax,(%esp)
    11d4:	e8 38 31 00 00       	call   4311 <createClickable>
		break;
    11d9:	eb 14                	jmp    11ef <addItemEvent+0xfd>
	default:
		printf(0, "unknown file type!");
    11db:	c7 44 24 04 b3 b4 00 	movl   $0xb4b3,0x4(%esp)
    11e2:	00 
    11e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11ea:	e8 50 3b 00 00       	call   4d3f <printf>
	}
}
    11ef:	c9                   	leave  
    11f0:	c3                   	ret    

000011f1 <addListEvent>:

void addListEvent(ClickableManager *cm) {
    11f1:	55                   	push   %ebp
    11f2:	89 e5                	mov    %esp,%ebp
    11f4:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
    11f7:	a1 68 ff 00 00       	mov    0xff68,%eax
    11fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    11ff:	eb 70                	jmp    1271 <addListEvent+0x80>
		temp = p;
    1201:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1204:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
    1207:	8b 45 f4             	mov    -0xc(%ebp),%eax
    120a:	8b 40 2c             	mov    0x2c(%eax),%eax
    120d:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
    1210:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1213:	8b 10                	mov    (%eax),%edx
    1215:	89 54 24 04          	mov    %edx,0x4(%esp)
    1219:	8b 50 04             	mov    0x4(%eax),%edx
    121c:	89 54 24 08          	mov    %edx,0x8(%esp)
    1220:	8b 50 08             	mov    0x8(%eax),%edx
    1223:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1227:	8b 50 0c             	mov    0xc(%eax),%edx
    122a:	89 54 24 10          	mov    %edx,0x10(%esp)
    122e:	8b 50 10             	mov    0x10(%eax),%edx
    1231:	89 54 24 14          	mov    %edx,0x14(%esp)
    1235:	8b 50 14             	mov    0x14(%eax),%edx
    1238:	89 54 24 18          	mov    %edx,0x18(%esp)
    123c:	8b 50 18             	mov    0x18(%eax),%edx
    123f:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1243:	8b 50 1c             	mov    0x1c(%eax),%edx
    1246:	89 54 24 20          	mov    %edx,0x20(%esp)
    124a:	8b 50 20             	mov    0x20(%eax),%edx
    124d:	89 54 24 24          	mov    %edx,0x24(%esp)
    1251:	8b 50 24             	mov    0x24(%eax),%edx
    1254:	89 54 24 28          	mov    %edx,0x28(%esp)
    1258:	8b 50 28             	mov    0x28(%eax),%edx
    125b:	89 54 24 2c          	mov    %edx,0x2c(%esp)
    125f:	8b 40 2c             	mov    0x2c(%eax),%eax
    1262:	89 44 24 30          	mov    %eax,0x30(%esp)
    1266:	8b 45 08             	mov    0x8(%ebp),%eax
    1269:	89 04 24             	mov    %eax,(%esp)
    126c:	e8 81 fe ff ff       	call   10f2 <addItemEvent>
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
    1271:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1275:	75 8a                	jne    1201 <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
    1277:	c9                   	leave  
    1278:	c3                   	ret    

00001279 <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox};

void addWndEvent(ClickableManager *cm) {
    1279:	55                   	push   %ebp
    127a:	89 e5                	mov    %esp,%ebp
    127c:	57                   	push   %edi
    127d:	56                   	push   %esi
    127e:	53                   	push   %ebx
    127f:	83 ec 4c             	sub    $0x4c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    1282:	c7 45 e0 0e 00 00 00 	movl   $0xe,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    1289:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1290:	e9 96 00 00 00       	jmp    132b <addWndEvent+0xb2>
		createClickable(cm,
    1295:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1298:	8b 1c 85 20 fa 00 00 	mov    0xfa20(,%eax,4),%ebx
    129f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12a2:	6b c0 34             	imul   $0x34,%eax,%eax
    12a5:	05 60 f7 00 00       	add    $0xf760,%eax
    12aa:	8b 78 10             	mov    0x10(%eax),%edi
    12ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12b0:	6b c0 34             	imul   $0x34,%eax,%eax
    12b3:	05 60 f7 00 00       	add    $0xf760,%eax
    12b8:	8b 70 0c             	mov    0xc(%eax),%esi
    12bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12be:	6b c0 34             	imul   $0x34,%eax,%eax
    12c1:	05 60 f7 00 00       	add    $0xf760,%eax
    12c6:	8b 48 04             	mov    0x4(%eax),%ecx
    12c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12cc:	6b c0 34             	imul   $0x34,%eax,%eax
    12cf:	05 60 f7 00 00       	add    $0xf760,%eax
    12d4:	8b 10                	mov    (%eax),%edx
    12d6:	8d 45 d0             	lea    -0x30(%ebp),%eax
    12d9:	89 7c 24 10          	mov    %edi,0x10(%esp)
    12dd:	89 74 24 0c          	mov    %esi,0xc(%esp)
    12e1:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    12e5:	89 54 24 04          	mov    %edx,0x4(%esp)
    12e9:	89 04 24             	mov    %eax,(%esp)
    12ec:	e8 34 2f 00 00       	call   4225 <initRect>
    12f1:	83 ec 04             	sub    $0x4,%esp
    12f4:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    12f8:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    12ff:	00 
    1300:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1303:	89 44 24 04          	mov    %eax,0x4(%esp)
    1307:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    130a:	89 44 24 08          	mov    %eax,0x8(%esp)
    130e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1311:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1315:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1318:	89 44 24 10          	mov    %eax,0x10(%esp)
    131c:	8b 45 08             	mov    0x8(%ebp),%eax
    131f:	89 04 24             	mov    %eax,(%esp)
    1322:	e8 ea 2f 00 00       	call   4311 <createClickable>
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox};

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
    1327:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    132b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    132e:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    1331:	0f 8c 5e ff ff ff    	jl     1295 <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
    1337:	8d 65 f4             	lea    -0xc(%ebp),%esp
    133a:	5b                   	pop    %ebx
    133b:	5e                   	pop    %esi
    133c:	5f                   	pop    %edi
    133d:	5d                   	pop    %ebp
    133e:	c3                   	ret    

0000133f <getFileItem>:

struct fileItem * getFileItem(Point point) {
    133f:	55                   	push   %ebp
    1340:	89 e5                	mov    %esp,%ebp
    1342:	83 ec 38             	sub    $0x38,%esp
	struct fileItem *p = fileItemList;
    1345:	a1 68 ff 00 00       	mov    0xff68,%eax
    134a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    134d:	eb 43                	jmp    1392 <getFileItem+0x53>
		if (isIn(point, p->pos)) {
    134f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1352:	8b 50 18             	mov    0x18(%eax),%edx
    1355:	89 54 24 08          	mov    %edx,0x8(%esp)
    1359:	8b 50 1c             	mov    0x1c(%eax),%edx
    135c:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1360:	8b 50 20             	mov    0x20(%eax),%edx
    1363:	89 54 24 10          	mov    %edx,0x10(%esp)
    1367:	8b 40 24             	mov    0x24(%eax),%eax
    136a:	89 44 24 14          	mov    %eax,0x14(%esp)
    136e:	8b 45 08             	mov    0x8(%ebp),%eax
    1371:	8b 55 0c             	mov    0xc(%ebp),%edx
    1374:	89 04 24             	mov    %eax,(%esp)
    1377:	89 54 24 04          	mov    %edx,0x4(%esp)
    137b:	e8 00 2f 00 00       	call   4280 <isIn>
    1380:	85 c0                	test   %eax,%eax
    1382:	74 05                	je     1389 <getFileItem+0x4a>
			return p;
    1384:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1387:	eb 14                	jmp    139d <getFileItem+0x5e>
		}
		p = p->next;
    1389:	8b 45 f4             	mov    -0xc(%ebp),%eax
    138c:	8b 40 2c             	mov    0x2c(%eax),%eax
    138f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
    1392:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1396:	75 b7                	jne    134f <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
    1398:	b8 00 00 00 00       	mov    $0x0,%eax
}
    139d:	c9                   	leave  
    139e:	c3                   	ret    

0000139f <h_searchbox>:

void h_searchbox(Point p) {
    139f:	55                   	push   %ebp
    13a0:	89 e5                	mov    %esp,%ebp
	isSearching = 1;
    13a2:	c7 05 60 2d 01 00 01 	movl   $0x1,0x12d60
    13a9:	00 00 00 
}
    13ac:	5d                   	pop    %ebp
    13ad:	c3                   	ret    

000013ae <scrollDown>:

void scrollDown() {
    13ae:	55                   	push   %ebp
    13af:	89 e5                	mov    %esp,%ebp
    13b1:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    13b4:	a1 68 ff 00 00       	mov    0xff68,%eax
    13b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
    13bc:	a1 44 f6 00 00       	mov    0xf644,%eax
    13c1:	83 f8 01             	cmp    $0x1,%eax
    13c4:	75 44                	jne    140a <scrollDown+0x5c>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
    13c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13c9:	8b 40 1c             	mov    0x1c(%eax),%eax
    13cc:	3d 63 01 00 00       	cmp    $0x163,%eax
    13d1:	7e 79                	jle    144c <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    13d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13d6:	8b 40 1c             	mov    0x1c(%eax),%eax
    13d9:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    13de:	7e 0f                	jle    13ef <scrollDown+0x41>
				scrollOffset -= SCROLL_UNIT;
    13e0:	a1 60 ff 00 00       	mov    0xff60,%eax
    13e5:	83 e8 1e             	sub    $0x1e,%eax
    13e8:	a3 60 ff 00 00       	mov    %eax,0xff60
    13ed:	eb 5d                	jmp    144c <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
    13ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13f2:	8b 40 1c             	mov    0x1c(%eax),%eax
    13f5:	ba 63 01 00 00       	mov    $0x163,%edx
    13fa:	29 c2                	sub    %eax,%edx
    13fc:	a1 60 ff 00 00       	mov    0xff60,%eax
    1401:	01 d0                	add    %edx,%eax
    1403:	a3 60 ff 00 00       	mov    %eax,0xff60
    1408:	eb 42                	jmp    144c <scrollDown+0x9e>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
    140a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    140d:	8b 40 1c             	mov    0x1c(%eax),%eax
    1410:	3d a4 01 00 00       	cmp    $0x1a4,%eax
    1415:	7e 35                	jle    144c <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1417:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141a:	8b 40 1c             	mov    0x1c(%eax),%eax
    141d:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1422:	7e 0f                	jle    1433 <scrollDown+0x85>
				scrollOffset -= SCROLL_UNIT;
    1424:	a1 60 ff 00 00       	mov    0xff60,%eax
    1429:	83 e8 1e             	sub    $0x1e,%eax
    142c:	a3 60 ff 00 00       	mov    %eax,0xff60
    1431:	eb 19                	jmp    144c <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    1433:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1436:	8b 40 1c             	mov    0x1c(%eax),%eax
    1439:	ba a4 01 00 00       	mov    $0x1a4,%edx
    143e:	29 c2                	sub    %eax,%edx
    1440:	a1 60 ff 00 00       	mov    0xff60,%eax
    1445:	01 d0                	add    %edx,%eax
    1447:	a3 60 ff 00 00       	mov    %eax,0xff60
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    144c:	a1 60 ff 00 00       	mov    0xff60,%eax
    1451:	89 44 24 08          	mov    %eax,0x8(%esp)
    1455:	c7 44 24 04 c8 b4 00 	movl   $0xb4c8,0x4(%esp)
    145c:	00 
    145d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1464:	e8 d6 38 00 00       	call   4d3f <printf>
}
    1469:	c9                   	leave  
    146a:	c3                   	ret    

0000146b <h_scrollDown>:

void h_scrollDown(Point p) {
    146b:	55                   	push   %ebp
    146c:	89 e5                	mov    %esp,%ebp
    146e:	83 ec 38             	sub    $0x38,%esp
	scrollDown();
    1471:	e8 38 ff ff ff       	call   13ae <scrollDown>
	freeFileItemList();
    1476:	e8 f0 ec ff ff       	call   16b <freeFileItemList>
	list(".");
    147b:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    1482:	e8 c2 ed ff ff       	call   249 <list>
	drawFinderContent(context);
    1487:	a1 80 35 01 00       	mov    0x13580,%eax
    148c:	89 04 24             	mov    %eax,(%esp)
    148f:	a1 84 35 01 00       	mov    0x13584,%eax
    1494:	89 44 24 04          	mov    %eax,0x4(%esp)
    1498:	a1 88 35 01 00       	mov    0x13588,%eax
    149d:	89 44 24 08          	mov    %eax,0x8(%esp)
    14a1:	e8 9f f6 ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    14a6:	a1 80 35 01 00       	mov    0x13580,%eax
    14ab:	89 04 24             	mov    %eax,(%esp)
    14ae:	a1 84 35 01 00       	mov    0x13584,%eax
    14b3:	89 44 24 04          	mov    %eax,0x4(%esp)
    14b7:	a1 88 35 01 00       	mov    0x13588,%eax
    14bc:	89 44 24 08          	mov    %eax,0x8(%esp)
    14c0:	e8 86 f4 ff ff       	call   94b <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    14c5:	8d 45 e8             	lea    -0x18(%ebp),%eax
    14c8:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    14cf:	00 
    14d0:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    14d7:	00 
    14d8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    14df:	00 
    14e0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14e7:	00 
    14e8:	89 04 24             	mov    %eax,(%esp)
    14eb:	e8 35 2d 00 00       	call   4225 <initRect>
    14f0:	83 ec 04             	sub    $0x4,%esp
    14f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14f6:	89 44 24 04          	mov    %eax,0x4(%esp)
    14fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14fd:	89 44 24 08          	mov    %eax,0x8(%esp)
    1501:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1504:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1508:	8b 45 f4             	mov    -0xc(%ebp),%eax
    150b:	89 44 24 10          	mov    %eax,0x10(%esp)
    150f:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1516:	e8 0d 2f 00 00       	call   4428 <deleteClickable>
	addWndEvent(&cm);
    151b:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1522:	e8 52 fd ff ff       	call   1279 <addWndEvent>
	addListEvent(&cm);
    1527:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    152e:	e8 be fc ff ff       	call   11f1 <addListEvent>
}
    1533:	c9                   	leave  
    1534:	c3                   	ret    

00001535 <scrollUp>:

void scrollUp() {
    1535:	55                   	push   %ebp
    1536:	89 e5                	mov    %esp,%ebp
    1538:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    153b:	a1 68 ff 00 00       	mov    0xff68,%eax
    1540:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
    1543:	eb 0f                	jmp    1554 <scrollUp+0x1f>
	{
		p = q;
    1545:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1548:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
    154b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    154e:	8b 40 2c             	mov    0x2c(%eax),%eax
    1551:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
    1554:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1558:	75 eb                	jne    1545 <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	if (style == ICON_STYLE){
    155a:	a1 44 f6 00 00       	mov    0xf644,%eax
    155f:	83 f8 01             	cmp    $0x1,%eax
    1562:	75 40                	jne    15a4 <scrollUp+0x6f>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
    1564:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1567:	8b 40 1c             	mov    0x1c(%eax),%eax
    156a:	83 f8 45             	cmp    $0x45,%eax
    156d:	7f 73                	jg     15e2 <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
    156f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1572:	8b 40 1c             	mov    0x1c(%eax),%eax
    1575:	83 f8 e7             	cmp    $0xffffffe7,%eax
    1578:	7d 0f                	jge    1589 <scrollUp+0x54>
				scrollOffset += SCROLL_UNIT;
    157a:	a1 60 ff 00 00       	mov    0xff60,%eax
    157f:	83 c0 1e             	add    $0x1e,%eax
    1582:	a3 60 ff 00 00       	mov    %eax,0xff60
    1587:	eb 59                	jmp    15e2 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
    1589:	8b 45 f0             	mov    -0x10(%ebp),%eax
    158c:	8b 40 1c             	mov    0x1c(%eax),%eax
    158f:	ba 46 00 00 00       	mov    $0x46,%edx
    1594:	29 c2                	sub    %eax,%edx
    1596:	a1 60 ff 00 00       	mov    0xff60,%eax
    159b:	01 d0                	add    %edx,%eax
    159d:	a3 60 ff 00 00       	mov    %eax,0xff60
    15a2:	eb 3e                	jmp    15e2 <scrollUp+0xad>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    15a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15a7:	8b 40 1c             	mov    0x1c(%eax),%eax
    15aa:	83 f8 61             	cmp    $0x61,%eax
    15ad:	7f 33                	jg     15e2 <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    15af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15b2:	8b 40 1c             	mov    0x1c(%eax),%eax
    15b5:	83 f8 43             	cmp    $0x43,%eax
    15b8:	7f 0f                	jg     15c9 <scrollUp+0x94>
				scrollOffset += SCROLL_UNIT;
    15ba:	a1 60 ff 00 00       	mov    0xff60,%eax
    15bf:	83 c0 1e             	add    $0x1e,%eax
    15c2:	a3 60 ff 00 00       	mov    %eax,0xff60
    15c7:	eb 19                	jmp    15e2 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    15c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15cc:	8b 40 1c             	mov    0x1c(%eax),%eax
    15cf:	ba 62 00 00 00       	mov    $0x62,%edx
    15d4:	29 c2                	sub    %eax,%edx
    15d6:	a1 60 ff 00 00       	mov    0xff60,%eax
    15db:	01 d0                	add    %edx,%eax
    15dd:	a3 60 ff 00 00       	mov    %eax,0xff60
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    15e2:	a1 60 ff 00 00       	mov    0xff60,%eax
    15e7:	89 44 24 08          	mov    %eax,0x8(%esp)
    15eb:	c7 44 24 04 e9 b4 00 	movl   $0xb4e9,0x4(%esp)
    15f2:	00 
    15f3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15fa:	e8 40 37 00 00       	call   4d3f <printf>
}
    15ff:	c9                   	leave  
    1600:	c3                   	ret    

00001601 <h_scrollUp>:

void h_scrollUp(Point p) {
    1601:	55                   	push   %ebp
    1602:	89 e5                	mov    %esp,%ebp
    1604:	83 ec 38             	sub    $0x38,%esp
	scrollUp();
    1607:	e8 29 ff ff ff       	call   1535 <scrollUp>
	freeFileItemList();
    160c:	e8 5a eb ff ff       	call   16b <freeFileItemList>
	list(".");
    1611:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    1618:	e8 2c ec ff ff       	call   249 <list>
	drawFinderContent(context);
    161d:	a1 80 35 01 00       	mov    0x13580,%eax
    1622:	89 04 24             	mov    %eax,(%esp)
    1625:	a1 84 35 01 00       	mov    0x13584,%eax
    162a:	89 44 24 04          	mov    %eax,0x4(%esp)
    162e:	a1 88 35 01 00       	mov    0x13588,%eax
    1633:	89 44 24 08          	mov    %eax,0x8(%esp)
    1637:	e8 09 f5 ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    163c:	a1 80 35 01 00       	mov    0x13580,%eax
    1641:	89 04 24             	mov    %eax,(%esp)
    1644:	a1 84 35 01 00       	mov    0x13584,%eax
    1649:	89 44 24 04          	mov    %eax,0x4(%esp)
    164d:	a1 88 35 01 00       	mov    0x13588,%eax
    1652:	89 44 24 08          	mov    %eax,0x8(%esp)
    1656:	e8 f0 f2 ff ff       	call   94b <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    165b:	8d 45 e8             	lea    -0x18(%ebp),%eax
    165e:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1665:	00 
    1666:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    166d:	00 
    166e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1675:	00 
    1676:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    167d:	00 
    167e:	89 04 24             	mov    %eax,(%esp)
    1681:	e8 9f 2b 00 00       	call   4225 <initRect>
    1686:	83 ec 04             	sub    $0x4,%esp
    1689:	8b 45 e8             	mov    -0x18(%ebp),%eax
    168c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1690:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1693:	89 44 24 08          	mov    %eax,0x8(%esp)
    1697:	8b 45 f0             	mov    -0x10(%ebp),%eax
    169a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    169e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16a1:	89 44 24 10          	mov    %eax,0x10(%esp)
    16a5:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    16ac:	e8 77 2d 00 00       	call   4428 <deleteClickable>
	addWndEvent(&cm);
    16b1:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    16b8:	e8 bc fb ff ff       	call   1279 <addWndEvent>
	addListEvent(&cm);
    16bd:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    16c4:	e8 28 fb ff ff       	call   11f1 <addListEvent>
}
    16c9:	c9                   	leave  
    16ca:	c3                   	ret    

000016cb <updatePath>:

void updatePath(char *name) {
    16cb:	55                   	push   %ebp
    16cc:	89 e5                	mov    %esp,%ebp
    16ce:	83 ec 28             	sub    $0x28,%esp
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    16d1:	8b 45 08             	mov    0x8(%ebp),%eax
    16d4:	89 04 24             	mov    %eax,(%esp)
    16d7:	e8 a7 32 00 00       	call   4983 <strlen>
    16dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    16df:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    16e3:	0f 85 84 00 00 00    	jne    176d <updatePath+0xa2>
    16e9:	8b 45 08             	mov    0x8(%ebp),%eax
    16ec:	0f b6 00             	movzbl (%eax),%eax
    16ef:	3c 2e                	cmp    $0x2e,%al
    16f1:	75 7a                	jne    176d <updatePath+0xa2>
    16f3:	8b 45 08             	mov    0x8(%ebp),%eax
    16f6:	83 c0 01             	add    $0x1,%eax
    16f9:	0f b6 00             	movzbl (%eax),%eax
    16fc:	3c 2e                	cmp    $0x2e,%al
    16fe:	75 6d                	jne    176d <updatePath+0xa2>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1700:	c7 04 24 c0 35 01 00 	movl   $0x135c0,(%esp)
    1707:	e8 77 32 00 00       	call   4983 <strlen>
    170c:	83 f8 01             	cmp    $0x1,%eax
    170f:	75 0b                	jne    171c <updatePath+0x51>
    1711:	0f b6 05 c0 35 01 00 	movzbl 0x135c0,%eax
    1718:	3c 2f                	cmp    $0x2f,%al
    171a:	74 4f                	je     176b <updatePath+0xa0>
        {
            int tmpn = strlen(currentPath);
    171c:	c7 04 24 c0 35 01 00 	movl   $0x135c0,(%esp)
    1723:	e8 5b 32 00 00       	call   4983 <strlen>
    1728:	89 45 ec             	mov    %eax,-0x14(%ebp)
            currentPath[tmpn - 1] = '\0';
    172b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    172e:	83 e8 01             	sub    $0x1,%eax
    1731:	c6 80 c0 35 01 00 00 	movb   $0x0,0x135c0(%eax)
            for (i = tmpn - 2; i > 0; i--)
    1738:	8b 45 ec             	mov    -0x14(%ebp),%eax
    173b:	83 e8 02             	sub    $0x2,%eax
    173e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1741:	eb 22                	jmp    1765 <updatePath+0x9a>
            {
                if (currentPath[i] != '/')
    1743:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1746:	05 c0 35 01 00       	add    $0x135c0,%eax
    174b:	0f b6 00             	movzbl (%eax),%eax
    174e:	3c 2f                	cmp    $0x2f,%al
    1750:	74 11                	je     1763 <updatePath+0x98>
                    currentPath[i] = '\0';
    1752:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1755:	05 c0 35 01 00       	add    $0x135c0,%eax
    175a:	c6 00 00             	movb   $0x0,(%eax)
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    175d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1761:	eb 02                	jmp    1765 <updatePath+0x9a>
            {
                if (currentPath[i] != '/')
                    currentPath[i] = '\0';
                else
                    break;
    1763:	eb 06                	jmp    176b <updatePath+0xa0>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    1765:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1769:	7f d8                	jg     1743 <updatePath+0x78>
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    176b:	eb 4e                	jmp    17bb <updatePath+0xf0>
            }
        }
    }
    else
    {
        int tmpn = strlen(currentPath);
    176d:	c7 04 24 c0 35 01 00 	movl   $0x135c0,(%esp)
    1774:	e8 0a 32 00 00       	call   4983 <strlen>
    1779:	89 45 e8             	mov    %eax,-0x18(%ebp)
        strcpy(currentPath + tmpn, name);
    177c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    177f:	8d 90 c0 35 01 00    	lea    0x135c0(%eax),%edx
    1785:	8b 45 08             	mov    0x8(%ebp),%eax
    1788:	89 44 24 04          	mov    %eax,0x4(%esp)
    178c:	89 14 24             	mov    %edx,(%esp)
    178f:	e8 80 31 00 00       	call   4914 <strcpy>
        tmpn = strlen(currentPath);
    1794:	c7 04 24 c0 35 01 00 	movl   $0x135c0,(%esp)
    179b:	e8 e3 31 00 00       	call   4983 <strlen>
    17a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
        currentPath[tmpn] = '/';
    17a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17a6:	05 c0 35 01 00       	add    $0x135c0,%eax
    17ab:	c6 00 2f             	movb   $0x2f,(%eax)
        currentPath[tmpn + 1] = '\0';
    17ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17b1:	83 c0 01             	add    $0x1,%eax
    17b4:	c6 80 c0 35 01 00 00 	movb   $0x0,0x135c0(%eax)
    }
}
    17bb:	c9                   	leave  
    17bc:	c3                   	ret    

000017bd <enterDir>:

// Handlers
void enterDir(char *name) {
    17bd:	55                   	push   %ebp
    17be:	89 e5                	mov    %esp,%ebp
    17c0:	83 ec 18             	sub    $0x18,%esp
	scrollOffset = 0;
    17c3:	c7 05 60 ff 00 00 00 	movl   $0x0,0xff60
    17ca:	00 00 00 
	printf(0, "entering : %s\n", name);
    17cd:	8b 45 08             	mov    0x8(%ebp),%eax
    17d0:	89 44 24 08          	mov    %eax,0x8(%esp)
    17d4:	c7 44 24 04 06 b5 00 	movl   $0xb506,0x4(%esp)
    17db:	00 
    17dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17e3:	e8 57 35 00 00       	call   4d3f <printf>
	if (chdir(name) < 0)
    17e8:	8b 45 08             	mov    0x8(%ebp),%eax
    17eb:	89 04 24             	mov    %eax,(%esp)
    17ee:	e8 d4 33 00 00       	call   4bc7 <chdir>
    17f3:	85 c0                	test   %eax,%eax
    17f5:	79 1d                	jns    1814 <enterDir+0x57>
		printf(2, "cannot cd %s\n", name);
    17f7:	8b 45 08             	mov    0x8(%ebp),%eax
    17fa:	89 44 24 08          	mov    %eax,0x8(%esp)
    17fe:	c7 44 24 04 15 b5 00 	movl   $0xb515,0x4(%esp)
    1805:	00 
    1806:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    180d:	e8 2d 35 00 00       	call   4d3f <printf>
    1812:	eb 0b                	jmp    181f <enterDir+0x62>
	else
		updatePath(name);
    1814:	8b 45 08             	mov    0x8(%ebp),%eax
    1817:	89 04 24             	mov    %eax,(%esp)
    181a:	e8 ac fe ff ff       	call   16cb <updatePath>
	printf(0, "currentPath: %s\n", currentPath);
    181f:	c7 44 24 08 c0 35 01 	movl   $0x135c0,0x8(%esp)
    1826:	00 
    1827:	c7 44 24 04 23 b5 00 	movl   $0xb523,0x4(%esp)
    182e:	00 
    182f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1836:	e8 04 35 00 00       	call   4d3f <printf>
}
    183b:	c9                   	leave  
    183c:	c3                   	ret    

0000183d <h_enterDir>:

void h_enterDir(Point p) {
    183d:	55                   	push   %ebp
    183e:	89 e5                	mov    %esp,%ebp
    1840:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *temp = getFileItem(p);
    1843:	8b 45 08             	mov    0x8(%ebp),%eax
    1846:	8b 55 0c             	mov    0xc(%ebp),%edx
    1849:	89 04 24             	mov    %eax,(%esp)
    184c:	89 54 24 04          	mov    %edx,0x4(%esp)
    1850:	e8 ea fa ff ff       	call   133f <getFileItem>
    1855:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    1858:	8b 45 f4             	mov    -0xc(%ebp),%eax
    185b:	8b 40 14             	mov    0x14(%eax),%eax
    185e:	89 04 24             	mov    %eax,(%esp)
    1861:	e8 57 ff ff ff       	call   17bd <enterDir>
	freeFileItemList();
    1866:	e8 00 e9 ff ff       	call   16b <freeFileItemList>
	list(".");
    186b:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    1872:	e8 d2 e9 ff ff       	call   249 <list>
	drawFinderContent(context);
    1877:	a1 80 35 01 00       	mov    0x13580,%eax
    187c:	89 04 24             	mov    %eax,(%esp)
    187f:	a1 84 35 01 00       	mov    0x13584,%eax
    1884:	89 44 24 04          	mov    %eax,0x4(%esp)
    1888:	a1 88 35 01 00       	mov    0x13588,%eax
    188d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1891:	e8 af f2 ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    1896:	a1 80 35 01 00       	mov    0x13580,%eax
    189b:	89 04 24             	mov    %eax,(%esp)
    189e:	a1 84 35 01 00       	mov    0x13584,%eax
    18a3:	89 44 24 04          	mov    %eax,0x4(%esp)
    18a7:	a1 88 35 01 00       	mov    0x13588,%eax
    18ac:	89 44 24 08          	mov    %eax,0x8(%esp)
    18b0:	e8 96 f0 ff ff       	call   94b <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    18b5:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    18b8:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    18bf:	00 
    18c0:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    18c7:	00 
    18c8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    18cf:	00 
    18d0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    18d7:	00 
    18d8:	89 04 24             	mov    %eax,(%esp)
    18db:	e8 45 29 00 00       	call   4225 <initRect>
    18e0:	83 ec 04             	sub    $0x4,%esp
    18e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18e6:	89 44 24 04          	mov    %eax,0x4(%esp)
    18ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18ed:	89 44 24 08          	mov    %eax,0x8(%esp)
    18f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18f4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    18f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18fb:	89 44 24 10          	mov    %eax,0x10(%esp)
    18ff:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1906:	e8 1d 2b 00 00       	call   4428 <deleteClickable>
	addWndEvent(&cm);
    190b:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1912:	e8 62 f9 ff ff       	call   1279 <addWndEvent>
	addListEvent(&cm);
    1917:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    191e:	e8 ce f8 ff ff       	call   11f1 <addListEvent>
}
    1923:	c9                   	leave  
    1924:	c3                   	ret    

00001925 <newFile>:

void newFile(char *name) {
    1925:	55                   	push   %ebp
    1926:	89 e5                	mov    %esp,%ebp
    1928:	83 ec 28             	sub    $0x28,%esp
	int fd;
	int n = strlen(name);
    192b:	8b 45 08             	mov    0x8(%ebp),%eax
    192e:	89 04 24             	mov    %eax,(%esp)
    1931:	e8 4d 30 00 00       	call   4983 <strlen>
    1936:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    1939:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    1940:	eb 60                	jmp    19a2 <newFile+0x7d>
	{
		n = strlen(name);
    1942:	8b 45 08             	mov    0x8(%ebp),%eax
    1945:	89 04 24             	mov    %eax,(%esp)
    1948:	e8 36 30 00 00       	call   4983 <strlen>
    194d:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1950:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1953:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1956:	75 09                	jne    1961 <newFile+0x3c>
		{
			counter = 1;
    1958:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    195f:	eb 17                	jmp    1978 <newFile+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1961:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1964:	8b 45 08             	mov    0x8(%ebp),%eax
    1967:	01 d0                	add    %edx,%eax
    1969:	89 04 24             	mov    %eax,(%esp)
    196c:	e8 54 31 00 00       	call   4ac5 <atoi>
    1971:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1974:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1978:	8b 45 f4             	mov    -0xc(%ebp),%eax
    197b:	89 04 24             	mov    %eax,(%esp)
    197e:	e8 74 f5 ff ff       	call   ef7 <int2str>
    1983:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1986:	8b 55 08             	mov    0x8(%ebp),%edx
    1989:	01 ca                	add    %ecx,%edx
    198b:	89 44 24 04          	mov    %eax,0x4(%esp)
    198f:	89 14 24             	mov    %edx,(%esp)
    1992:	e8 7d 2f 00 00       	call   4914 <strcpy>
		close(fd);
    1997:	8b 45 e8             	mov    -0x18(%ebp),%eax
    199a:	89 04 24             	mov    %eax,(%esp)
    199d:	e8 dd 31 00 00       	call   4b7f <close>
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    19a2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19a9:	00 
    19aa:	8b 45 08             	mov    0x8(%ebp),%eax
    19ad:	89 04 24             	mov    %eax,(%esp)
    19b0:	e8 e2 31 00 00       	call   4b97 <open>
    19b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
    19b8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    19bc:	7f 84                	jg     1942 <newFile+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    19be:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    19c5:	00 
    19c6:	8b 45 08             	mov    0x8(%ebp),%eax
    19c9:	89 04 24             	mov    %eax,(%esp)
    19cc:	e8 c6 31 00 00       	call   4b97 <open>
    19d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    19d4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    19d8:	79 20                	jns    19fa <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    19da:	8b 45 08             	mov    0x8(%ebp),%eax
    19dd:	89 44 24 08          	mov    %eax,0x8(%esp)
    19e1:	c7 44 24 04 34 b5 00 	movl   $0xb534,0x4(%esp)
    19e8:	00 
    19e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19f0:	e8 4a 33 00 00       	call   4d3f <printf>
		exit();
    19f5:	e8 5d 31 00 00       	call   4b57 <exit>
	}
	close(fd);
    19fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    19fd:	89 04 24             	mov    %eax,(%esp)
    1a00:	e8 7a 31 00 00       	call   4b7f <close>
}
    1a05:	c9                   	leave  
    1a06:	c3                   	ret    

00001a07 <h_newFile>:

void h_newFile(Point p) {
    1a07:	55                   	push   %ebp
    1a08:	89 e5                	mov    %esp,%ebp
    1a0a:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "file.txt";
    1a0d:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1a14:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1a1b:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    1a22:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1a29:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1a30:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1a37:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1a3e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    1a45:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1a48:	89 04 24             	mov    %eax,(%esp)
    1a4b:	e8 d5 fe ff ff       	call   1925 <newFile>
	freeFileItemList();
    1a50:	e8 16 e7 ff ff       	call   16b <freeFileItemList>
	list(".");
    1a55:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    1a5c:	e8 e8 e7 ff ff       	call   249 <list>
	drawFinderContent(context);
    1a61:	a1 80 35 01 00       	mov    0x13580,%eax
    1a66:	89 04 24             	mov    %eax,(%esp)
    1a69:	a1 84 35 01 00       	mov    0x13584,%eax
    1a6e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a72:	a1 88 35 01 00       	mov    0x13588,%eax
    1a77:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a7b:	e8 c5 f0 ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    1a80:	a1 80 35 01 00       	mov    0x13580,%eax
    1a85:	89 04 24             	mov    %eax,(%esp)
    1a88:	a1 84 35 01 00       	mov    0x13584,%eax
    1a8d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a91:	a1 88 35 01 00       	mov    0x13588,%eax
    1a96:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a9a:	e8 ac ee ff ff       	call   94b <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1a9f:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1aa2:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1aa9:	00 
    1aaa:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1ab1:	00 
    1ab2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1ab9:	00 
    1aba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1ac1:	00 
    1ac2:	89 04 24             	mov    %eax,(%esp)
    1ac5:	e8 5b 27 00 00       	call   4225 <initRect>
    1aca:	83 ec 04             	sub    $0x4,%esp
    1acd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ad0:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ad4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ad7:	89 44 24 08          	mov    %eax,0x8(%esp)
    1adb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ade:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1ae2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ae5:	89 44 24 10          	mov    %eax,0x10(%esp)
    1ae9:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1af0:	e8 33 29 00 00       	call   4428 <deleteClickable>
	addWndEvent(&cm);
    1af5:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1afc:	e8 78 f7 ff ff       	call   1279 <addWndEvent>
	addListEvent(&cm);
    1b01:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1b08:	e8 e4 f6 ff ff       	call   11f1 <addListEvent>
}
    1b0d:	c9                   	leave  
    1b0e:	c3                   	ret    

00001b0f <newFolder>:

void newFolder(char *name) {
    1b0f:	55                   	push   %ebp
    1b10:	89 e5                	mov    %esp,%ebp
    1b12:	83 ec 28             	sub    $0x28,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1b15:	8b 45 08             	mov    0x8(%ebp),%eax
    1b18:	89 04 24             	mov    %eax,(%esp)
    1b1b:	e8 63 2e 00 00       	call   4983 <strlen>
    1b20:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    1b23:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1b2a:	eb 55                	jmp    1b81 <newFolder+0x72>
		n = strlen(name);
    1b2c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2f:	89 04 24             	mov    %eax,(%esp)
    1b32:	e8 4c 2e 00 00       	call   4983 <strlen>
    1b37:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1b3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b3d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1b40:	75 09                	jne    1b4b <newFolder+0x3c>
		{
			counter = 1;
    1b42:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1b49:	eb 17                	jmp    1b62 <newFolder+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1b4b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1b4e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b51:	01 d0                	add    %edx,%eax
    1b53:	89 04 24             	mov    %eax,(%esp)
    1b56:	e8 6a 2f 00 00       	call   4ac5 <atoi>
    1b5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1b5e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1b62:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b65:	89 04 24             	mov    %eax,(%esp)
    1b68:	e8 8a f3 ff ff       	call   ef7 <int2str>
    1b6d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1b70:	8b 55 08             	mov    0x8(%ebp),%edx
    1b73:	01 ca                	add    %ecx,%edx
    1b75:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b79:	89 14 24             	mov    %edx,(%esp)
    1b7c:	e8 93 2d 00 00       	call   4914 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    1b81:	8b 45 08             	mov    0x8(%ebp),%eax
    1b84:	89 04 24             	mov    %eax,(%esp)
    1b87:	e8 33 30 00 00       	call   4bbf <mkdir>
    1b8c:	85 c0                	test   %eax,%eax
    1b8e:	78 9c                	js     1b2c <newFolder+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    1b90:	c9                   	leave  
    1b91:	c3                   	ret    

00001b92 <h_newFolder>:

void h_newFolder(Point p) {
    1b92:	55                   	push   %ebp
    1b93:	89 e5                	mov    %esp,%ebp
    1b95:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "newFolder";
    1b98:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    1b9f:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    1ba6:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    1bad:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1bb4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1bbb:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1bc2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1bc9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    1bd0:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1bd3:	89 04 24             	mov    %eax,(%esp)
    1bd6:	e8 34 ff ff ff       	call   1b0f <newFolder>
	freeFileItemList();
    1bdb:	e8 8b e5 ff ff       	call   16b <freeFileItemList>
	printf(0, "new folder!\n");
    1be0:	c7 44 24 04 49 b5 00 	movl   $0xb549,0x4(%esp)
    1be7:	00 
    1be8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1bef:	e8 4b 31 00 00       	call   4d3f <printf>
	list(".");
    1bf4:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    1bfb:	e8 49 e6 ff ff       	call   249 <list>
	printItemList();
    1c00:	e8 d6 f3 ff ff       	call   fdb <printItemList>
	drawFinderContent(context);
    1c05:	a1 80 35 01 00       	mov    0x13580,%eax
    1c0a:	89 04 24             	mov    %eax,(%esp)
    1c0d:	a1 84 35 01 00       	mov    0x13584,%eax
    1c12:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c16:	a1 88 35 01 00       	mov    0x13588,%eax
    1c1b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c1f:	e8 21 ef ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    1c24:	a1 80 35 01 00       	mov    0x13580,%eax
    1c29:	89 04 24             	mov    %eax,(%esp)
    1c2c:	a1 84 35 01 00       	mov    0x13584,%eax
    1c31:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c35:	a1 88 35 01 00       	mov    0x13588,%eax
    1c3a:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c3e:	e8 08 ed ff ff       	call   94b <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1c43:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1c46:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1c4d:	00 
    1c4e:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1c55:	00 
    1c56:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1c5d:	00 
    1c5e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1c65:	00 
    1c66:	89 04 24             	mov    %eax,(%esp)
    1c69:	e8 b7 25 00 00       	call   4225 <initRect>
    1c6e:	83 ec 04             	sub    $0x4,%esp
    1c71:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c74:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c78:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c7b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c82:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1c86:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c89:	89 44 24 10          	mov    %eax,0x10(%esp)
    1c8d:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1c94:	e8 8f 27 00 00       	call   4428 <deleteClickable>
	addWndEvent(&cm);
    1c99:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1ca0:	e8 d4 f5 ff ff       	call   1279 <addWndEvent>
	addListEvent(&cm);
    1ca5:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1cac:	e8 40 f5 ff ff       	call   11f1 <addListEvent>
}
    1cb1:	c9                   	leave  
    1cb2:	c3                   	ret    

00001cb3 <deleteFile>:

void deleteFile(char *name)
{
    1cb3:	55                   	push   %ebp
    1cb4:	89 e5                	mov    %esp,%ebp
    1cb6:	83 ec 28             	sub    $0x28,%esp
	printf(0, "currently having sex with %s\n", name);
    1cb9:	8b 45 08             	mov    0x8(%ebp),%eax
    1cbc:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cc0:	c7 44 24 04 56 b5 00 	movl   $0xb556,0x4(%esp)
    1cc7:	00 
    1cc8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ccf:	e8 6b 30 00 00       	call   4d3f <printf>
	if(unlink(name) < 0){
    1cd4:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd7:	89 04 24             	mov    %eax,(%esp)
    1cda:	e8 c8 2e 00 00       	call   4ba7 <unlink>
    1cdf:	85 c0                	test   %eax,%eax
    1ce1:	0f 89 9c 00 00 00    	jns    1d83 <deleteFile+0xd0>
		if (chdir(name) < 0){
    1ce7:	8b 45 08             	mov    0x8(%ebp),%eax
    1cea:	89 04 24             	mov    %eax,(%esp)
    1ced:	e8 d5 2e 00 00       	call   4bc7 <chdir>
    1cf2:	85 c0                	test   %eax,%eax
    1cf4:	79 1d                	jns    1d13 <deleteFile+0x60>
			printf(2, "rm: %s failed to delete\n", name);
    1cf6:	8b 45 08             	mov    0x8(%ebp),%eax
    1cf9:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cfd:	c7 44 24 04 74 b5 00 	movl   $0xb574,0x4(%esp)
    1d04:	00 
    1d05:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1d0c:	e8 2e 30 00 00       	call   4d3f <printf>
    1d11:	eb 70                	jmp    1d83 <deleteFile+0xd0>
		}
		else{
			freeFileItemList();
    1d13:	e8 53 e4 ff ff       	call   16b <freeFileItemList>
			list(".");
    1d18:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    1d1f:	e8 25 e5 ff ff       	call   249 <list>
			struct fileItem *p;
			p = fileItemList;
    1d24:	a1 68 ff 00 00       	mov    0xff68,%eax
    1d29:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    1d2c:	eb 27                	jmp    1d55 <deleteFile+0xa2>
				deleteFile(p->name);
    1d2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d31:	8b 40 14             	mov    0x14(%eax),%eax
    1d34:	89 04 24             	mov    %eax,(%esp)
    1d37:	e8 77 ff ff ff       	call   1cb3 <deleteFile>
				freeFileItemList();
    1d3c:	e8 2a e4 ff ff       	call   16b <freeFileItemList>
				list(".");
    1d41:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    1d48:	e8 fc e4 ff ff       	call   249 <list>
				p = fileItemList;
    1d4d:	a1 68 ff 00 00       	mov    0xff68,%eax
    1d52:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else{
			freeFileItemList();
			list(".");
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    1d55:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1d59:	75 d3                	jne    1d2e <deleteFile+0x7b>
				deleteFile(p->name);
				freeFileItemList();
				list(".");
				p = fileItemList;
			}
			chdir("..");
    1d5b:	c7 04 24 8d b5 00 00 	movl   $0xb58d,(%esp)
    1d62:	e8 60 2e 00 00       	call   4bc7 <chdir>
			freeFileItemList();
    1d67:	e8 ff e3 ff ff       	call   16b <freeFileItemList>
			list(".");
    1d6c:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    1d73:	e8 d1 e4 ff ff       	call   249 <list>
			unlink(name);
    1d78:	8b 45 08             	mov    0x8(%ebp),%eax
    1d7b:	89 04 24             	mov    %eax,(%esp)
    1d7e:	e8 24 2e 00 00       	call   4ba7 <unlink>
		}
	}
}
    1d83:	c9                   	leave  
    1d84:	c3                   	ret    

00001d85 <h_deleteFile>:
void h_deleteFile(Point p) {
    1d85:	55                   	push   %ebp
    1d86:	89 e5                	mov    %esp,%ebp
    1d88:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *q = fileItemList;
    1d8b:	a1 68 ff 00 00       	mov    0xff68,%eax
    1d90:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    1d93:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1d9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1da0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1da3:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    1da6:	c7 44 24 04 90 b5 00 	movl   $0xb590,0x4(%esp)
    1dad:	00 
    1dae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1db5:	e8 85 2f 00 00       	call   4d3f <printf>
	while (q != 0)
    1dba:	e9 8d 00 00 00       	jmp    1e4c <h_deleteFile+0xc7>
	{
		printf(0, "hi2\n");
    1dbf:	c7 44 24 04 95 b5 00 	movl   $0xb595,0x4(%esp)
    1dc6:	00 
    1dc7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1dce:	e8 6c 2f 00 00       	call   4d3f <printf>
		if (q->chosen)
    1dd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1dd6:	8b 40 28             	mov    0x28(%eax),%eax
    1dd9:	85 c0                	test   %eax,%eax
    1ddb:	74 66                	je     1e43 <h_deleteFile+0xbe>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    1ddd:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    1de4:	e8 42 32 00 00       	call   502b <malloc>
    1de9:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    1dec:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    1df3:	e8 33 32 00 00       	call   502b <malloc>
    1df8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1dfb:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, q->name);
    1dfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e01:	8b 50 14             	mov    0x14(%eax),%edx
    1e04:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e07:	8b 40 14             	mov    0x14(%eax),%eax
    1e0a:	89 54 24 04          	mov    %edx,0x4(%esp)
    1e0e:	89 04 24             	mov    %eax,(%esp)
    1e11:	e8 fe 2a 00 00       	call   4914 <strcpy>
			if(head == 0)
    1e16:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1e1a:	75 0e                	jne    1e2a <h_deleteFile+0xa5>
			{
				head = p1;
    1e1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e1f:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    1e22:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e25:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1e28:	eb 0f                	jmp    1e39 <h_deleteFile+0xb4>
			} else {
				p2->next = p1;
    1e2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e2d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1e30:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    1e33:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e36:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    1e39:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e3c:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    1e43:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e46:	8b 40 2c             	mov    0x2c(%eax),%eax
    1e49:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    1e4c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e50:	0f 85 69 ff ff ff    	jne    1dbf <h_deleteFile+0x3a>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    1e56:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1e59:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    1e5c:	c7 44 24 04 9c b5 00 	movl   $0xb59c,0x4(%esp)
    1e63:	00 
    1e64:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e6b:	e8 cf 2e 00 00       	call   4d3f <printf>
	while (p1 != 0)
    1e70:	eb 17                	jmp    1e89 <h_deleteFile+0x104>
	{
		deleteFile(p1->name);
    1e72:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e75:	8b 40 14             	mov    0x14(%eax),%eax
    1e78:	89 04 24             	mov    %eax,(%esp)
    1e7b:	e8 33 fe ff ff       	call   1cb3 <deleteFile>
		p1 = p1->next;
    1e80:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e83:	8b 40 2c             	mov    0x2c(%eax),%eax
    1e86:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    1e89:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e8d:	75 e3                	jne    1e72 <h_deleteFile+0xed>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    1e8f:	c7 44 24 04 04 b6 00 	movl   $0xb604,0x4(%esp)
    1e96:	00 
    1e97:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e9e:	e8 9c 2e 00 00       	call   4d3f <printf>
	p1 = head;
    1ea3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ea6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    1ea9:	eb 46                	jmp    1ef1 <h_deleteFile+0x16c>
		p2 = p1;
    1eab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1eae:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    1eb1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1eb4:	8b 40 14             	mov    0x14(%eax),%eax
    1eb7:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ebb:	c7 44 24 04 1a b6 00 	movl   $0xb61a,0x4(%esp)
    1ec2:	00 
    1ec3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1eca:	e8 70 2e 00 00       	call   4d3f <printf>
		p1 = p1->next;
    1ecf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ed2:	8b 40 2c             	mov    0x2c(%eax),%eax
    1ed5:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    1ed8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1edb:	8b 40 14             	mov    0x14(%eax),%eax
    1ede:	89 04 24             	mov    %eax,(%esp)
    1ee1:	e8 0c 30 00 00       	call   4ef2 <free>
		free(p2);
    1ee6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ee9:	89 04 24             	mov    %eax,(%esp)
    1eec:	e8 01 30 00 00       	call   4ef2 <free>
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    1ef1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1ef5:	75 b4                	jne    1eab <h_deleteFile+0x126>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    1ef7:	c7 44 24 04 26 b6 00 	movl   $0xb626,0x4(%esp)
    1efe:	00 
    1eff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f06:	e8 34 2e 00 00       	call   4d3f <printf>
	freeFileItemList();
    1f0b:	e8 5b e2 ff ff       	call   16b <freeFileItemList>
	list(".");
    1f10:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    1f17:	e8 2d e3 ff ff       	call   249 <list>
	printItemList();
    1f1c:	e8 ba f0 ff ff       	call   fdb <printItemList>
	drawFinderContent(context);
    1f21:	a1 80 35 01 00       	mov    0x13580,%eax
    1f26:	89 04 24             	mov    %eax,(%esp)
    1f29:	a1 84 35 01 00       	mov    0x13584,%eax
    1f2e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f32:	a1 88 35 01 00       	mov    0x13588,%eax
    1f37:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f3b:	e8 05 ec ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    1f40:	a1 80 35 01 00       	mov    0x13580,%eax
    1f45:	89 04 24             	mov    %eax,(%esp)
    1f48:	a1 84 35 01 00       	mov    0x13584,%eax
    1f4d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f51:	a1 88 35 01 00       	mov    0x13588,%eax
    1f56:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f5a:	e8 ec e9 ff ff       	call   94b <drawFinderWnd>
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1f5f:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1f62:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1f69:	00 
    1f6a:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1f71:	00 
    1f72:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1f79:	00 
    1f7a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1f81:	00 
    1f82:	89 04 24             	mov    %eax,(%esp)
    1f85:	e8 9b 22 00 00       	call   4225 <initRect>
    1f8a:	83 ec 04             	sub    $0x4,%esp
    1f8d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1f90:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f94:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1f97:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f9b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1f9e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1fa2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1fa5:	89 44 24 10          	mov    %eax,0x10(%esp)
    1fa9:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1fb0:	e8 73 24 00 00       	call   4428 <deleteClickable>
		addWndEvent(&cm);
    1fb5:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1fbc:	e8 b8 f2 ff ff       	call   1279 <addWndEvent>
		addListEvent(&cm);
    1fc1:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    1fc8:	e8 24 f2 ff ff       	call   11f1 <addListEvent>
}
    1fcd:	c9                   	leave  
    1fce:	c3                   	ret    

00001fcf <copyFile>:

void copyFile(){
    1fcf:	55                   	push   %ebp
    1fd0:	89 e5                	mov    %esp,%ebp
    1fd2:	56                   	push   %esi
    1fd3:	53                   	push   %ebx
    1fd4:	83 ec 20             	sub    $0x20,%esp
	int fd;
	struct fileItem *p = fileItemList;
    1fd7:	a1 68 ff 00 00       	mov    0xff68,%eax
    1fdc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    1fdf:	e9 0f 01 00 00       	jmp    20f3 <copyFile+0x124>
		if (p->chosen == 1){
    1fe4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fe7:	8b 40 28             	mov    0x28(%eax),%eax
    1fea:	83 f8 01             	cmp    $0x1,%eax
    1fed:	0f 85 f7 00 00 00    	jne    20ea <copyFile+0x11b>
			if(lenOfWaited >= MAX_COPY_SIZE){
    1ff3:	a1 d4 36 01 00       	mov    0x136d4,%eax
    1ff8:	83 f8 07             	cmp    $0x7,%eax
    1ffb:	7e 22                	jle    201f <copyFile+0x50>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    1ffd:	a1 d4 36 01 00       	mov    0x136d4,%eax
    2002:	89 44 24 08          	mov    %eax,0x8(%esp)
    2006:	c7 44 24 04 38 b6 00 	movl   $0xb638,0x4(%esp)
    200d:	00 
    200e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2015:	e8 25 2d 00 00       	call   4d3f <printf>
    201a:	e9 cb 00 00 00       	jmp    20ea <copyFile+0x11b>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    201f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2022:	8b 40 14             	mov    0x14(%eax),%eax
    2025:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    202c:	00 
    202d:	89 04 24             	mov    %eax,(%esp)
    2030:	e8 62 2b 00 00       	call   4b97 <open>
    2035:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2038:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    203c:	0f 88 8a 00 00 00    	js     20cc <copyFile+0xfd>
					strcpy(filesWaited[lenOfWaited], currentPath);
    2042:	a1 d4 36 01 00       	mov    0x136d4,%eax
    2047:	c1 e0 08             	shl    $0x8,%eax
    204a:	05 80 2d 01 00       	add    $0x12d80,%eax
    204f:	c7 44 24 04 c0 35 01 	movl   $0x135c0,0x4(%esp)
    2056:	00 
    2057:	89 04 24             	mov    %eax,(%esp)
    205a:	e8 b5 28 00 00       	call   4914 <strcpy>
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    205f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2062:	8b 58 14             	mov    0x14(%eax),%ebx
    2065:	a1 d4 36 01 00       	mov    0x136d4,%eax
    206a:	c1 e0 08             	shl    $0x8,%eax
    206d:	8d b0 80 2d 01 00    	lea    0x12d80(%eax),%esi
    2073:	c7 04 24 c0 35 01 00 	movl   $0x135c0,(%esp)
    207a:	e8 04 29 00 00       	call   4983 <strlen>
    207f:	01 f0                	add    %esi,%eax
    2081:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    2085:	89 04 24             	mov    %eax,(%esp)
    2088:	e8 87 28 00 00       	call   4914 <strcpy>
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    208d:	a1 d4 36 01 00       	mov    0x136d4,%eax
    2092:	c1 e0 08             	shl    $0x8,%eax
    2095:	05 80 2d 01 00       	add    $0x12d80,%eax
    209a:	89 44 24 08          	mov    %eax,0x8(%esp)
    209e:	c7 44 24 04 53 b6 00 	movl   $0xb653,0x4(%esp)
    20a5:	00 
    20a6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    20ad:	e8 8d 2c 00 00       	call   4d3f <printf>
					lenOfWaited++;
    20b2:	a1 d4 36 01 00       	mov    0x136d4,%eax
    20b7:	83 c0 01             	add    $0x1,%eax
    20ba:	a3 d4 36 01 00       	mov    %eax,0x136d4
					close(fd);
    20bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20c2:	89 04 24             	mov    %eax,(%esp)
    20c5:	e8 b5 2a 00 00       	call   4b7f <close>
    20ca:	eb 1e                	jmp    20ea <copyFile+0x11b>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    20cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20cf:	8b 40 14             	mov    0x14(%eax),%eax
    20d2:	89 44 24 08          	mov    %eax,0x8(%esp)
    20d6:	c7 44 24 04 69 b6 00 	movl   $0xb669,0x4(%esp)
    20dd:	00 
    20de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    20e5:	e8 55 2c 00 00       	call   4d3f <printf>
				}
			}
		}
		p = p->next;
    20ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20ed:	8b 40 2c             	mov    0x2c(%eax),%eax
    20f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    20f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    20f7:	0f 85 e7 fe ff ff    	jne    1fe4 <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    20fd:	83 c4 20             	add    $0x20,%esp
    2100:	5b                   	pop    %ebx
    2101:	5e                   	pop    %esi
    2102:	5d                   	pop    %ebp
    2103:	c3                   	ret    

00002104 <h_copyFile>:

void h_copyFile(Point p){
    2104:	55                   	push   %ebp
    2105:	89 e5                	mov    %esp,%ebp
    2107:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    210a:	c7 05 64 ff 00 00 00 	movl   $0x0,0xff64
    2111:	00 00 00 
	lenOfWaited = 0;
    2114:	c7 05 d4 36 01 00 00 	movl   $0x0,0x136d4
    211b:	00 00 00 
	copyFile();
    211e:	e8 ac fe ff ff       	call   1fcf <copyFile>
}
    2123:	c9                   	leave  
    2124:	c3                   	ret    

00002125 <moveFile>:

void moveFile(){
    2125:	55                   	push   %ebp
    2126:	89 e5                	mov    %esp,%ebp
    2128:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    212b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2132:	eb 17                	jmp    214b <moveFile+0x26>
		deleteFile(filesWaited[i]);
    2134:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2137:	c1 e0 08             	shl    $0x8,%eax
    213a:	05 80 2d 01 00       	add    $0x12d80,%eax
    213f:	89 04 24             	mov    %eax,(%esp)
    2142:	e8 6c fb ff ff       	call   1cb3 <deleteFile>
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    2147:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    214b:	a1 d4 36 01 00       	mov    0x136d4,%eax
    2150:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2153:	7c df                	jl     2134 <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    2155:	c7 05 d4 36 01 00 00 	movl   $0x0,0x136d4
    215c:	00 00 00 
}
    215f:	c9                   	leave  
    2160:	c3                   	ret    

00002161 <h_cutFile>:

void h_cutFile(Point p){
    2161:	55                   	push   %ebp
    2162:	89 e5                	mov    %esp,%ebp
    2164:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    2167:	c7 05 64 ff 00 00 01 	movl   $0x1,0xff64
    216e:	00 00 00 
	lenOfWaited = 0;
    2171:	c7 05 d4 36 01 00 00 	movl   $0x0,0x136d4
    2178:	00 00 00 
	copyFile();
    217b:	e8 4f fe ff ff       	call   1fcf <copyFile>
}
    2180:	c9                   	leave  
    2181:	c3                   	ret    

00002182 <pasteFile>:

void pasteFile(){
    2182:	55                   	push   %ebp
    2183:	89 e5                	mov    %esp,%ebp
    2185:	83 ec 38             	sub    $0x38,%esp
	int file_src, file_dest;
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
    2188:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    218f:	e8 97 2e 00 00       	call   502b <malloc>
    2194:	89 45 e8             	mov    %eax,-0x18(%ebp)
	memset(buff, 0, 4096);
    2197:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    219e:	00 
    219f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    21a6:	00 
    21a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    21aa:	89 04 24             	mov    %eax,(%esp)
    21ad:	e8 f8 27 00 00       	call   49aa <memset>
    int size = 0;
    21b2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i = 0; i < lenOfWaited; i++){
    21b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    21c0:	e9 a6 01 00 00       	jmp    236b <pasteFile+0x1e9>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    21c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21c8:	c1 e0 08             	shl    $0x8,%eax
    21cb:	05 80 2d 01 00       	add    $0x12d80,%eax
    21d0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    21d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21d7:	89 44 24 08          	mov    %eax,0x8(%esp)
    21db:	c7 44 24 04 7e b6 00 	movl   $0xb67e,0x4(%esp)
    21e2:	00 
    21e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    21ea:	e8 50 2b 00 00       	call   4d3f <printf>
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    21ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21f2:	c1 e0 08             	shl    $0x8,%eax
    21f5:	05 80 2d 01 00       	add    $0x12d80,%eax
    21fa:	89 04 24             	mov    %eax,(%esp)
    21fd:	e8 81 27 00 00       	call   4983 <strlen>
    2202:	83 e8 01             	sub    $0x1,%eax
    2205:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2208:	eb 35                	jmp    223f <pasteFile+0xbd>
        	if (*(filesWaited[i]+j) == '/'){
    220a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    220d:	c1 e0 08             	shl    $0x8,%eax
    2210:	8d 90 80 2d 01 00    	lea    0x12d80(%eax),%edx
    2216:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2219:	01 d0                	add    %edx,%eax
    221b:	0f b6 00             	movzbl (%eax),%eax
    221e:	3c 2f                	cmp    $0x2f,%al
    2220:	75 19                	jne    223b <pasteFile+0xb9>
        		filename = filesWaited[i] + j + 1;
    2222:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2225:	c1 e0 08             	shl    $0x8,%eax
    2228:	8d 90 80 2d 01 00    	lea    0x12d80(%eax),%edx
    222e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2231:	83 c0 01             	add    $0x1,%eax
    2234:	01 d0                	add    %edx,%eax
    2236:	89 45 ec             	mov    %eax,-0x14(%ebp)
        		break;
    2239:	eb 0a                	jmp    2245 <pasteFile+0xc3>
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    223b:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    223f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2243:	79 c5                	jns    220a <pasteFile+0x88>
        	if (*(filesWaited[i]+j) == '/'){
        		filename = filesWaited[i] + j + 1;
        		break;
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
    2245:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2248:	89 44 24 0c          	mov    %eax,0xc(%esp)
    224c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    224f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2253:	c7 44 24 04 9b b6 00 	movl   $0xb69b,0x4(%esp)
    225a:	00 
    225b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2262:	e8 d8 2a 00 00       	call   4d3f <printf>
        file_src = open(filesWaited[i], O_RDONLY);
    2267:	8b 45 f4             	mov    -0xc(%ebp),%eax
    226a:	c1 e0 08             	shl    $0x8,%eax
    226d:	05 80 2d 01 00       	add    $0x12d80,%eax
    2272:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2279:	00 
    227a:	89 04 24             	mov    %eax,(%esp)
    227d:	e8 15 29 00 00       	call   4b97 <open>
    2282:	89 45 e0             	mov    %eax,-0x20(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    2285:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    228c:	00 
    228d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2290:	89 04 24             	mov    %eax,(%esp)
    2293:	e8 ff 28 00 00       	call   4b97 <open>
    2298:	89 45 dc             	mov    %eax,-0x24(%ebp)
    229b:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    229f:	78 32                	js     22d3 <pasteFile+0x151>
			printf(0, "NO.%d file %s already exist\n", i, filename);
    22a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    22a4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    22a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22ab:	89 44 24 08          	mov    %eax,0x8(%esp)
    22af:	c7 44 24 04 b3 b6 00 	movl   $0xb6b3,0x4(%esp)
    22b6:	00 
    22b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22be:	e8 7c 2a 00 00       	call   4d3f <printf>
			close(file_dest);
    22c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    22c6:	89 04 24             	mov    %eax,(%esp)
    22c9:	e8 b1 28 00 00       	call   4b7f <close>
    22ce:	e9 89 00 00 00       	jmp    235c <pasteFile+0x1da>
		}
		else{
			file_dest = open(filename, O_CREATE);
    22d3:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    22da:	00 
    22db:	8b 45 ec             	mov    -0x14(%ebp),%eax
    22de:	89 04 24             	mov    %eax,(%esp)
    22e1:	e8 b1 28 00 00       	call   4b97 <open>
    22e6:	89 45 dc             	mov    %eax,-0x24(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    22e9:	eb 19                	jmp    2304 <pasteFile+0x182>
                write(file_dest, buff, size);
    22eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    22ee:	89 44 24 08          	mov    %eax,0x8(%esp)
    22f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    22f5:	89 44 24 04          	mov    %eax,0x4(%esp)
    22f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    22fc:	89 04 24             	mov    %eax,(%esp)
    22ff:	e8 73 28 00 00       	call   4b77 <write>
			printf(0, "NO.%d file %s already exist\n", i, filename);
			close(file_dest);
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    2304:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    230b:	00 
    230c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    230f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2313:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2316:	89 04 24             	mov    %eax,(%esp)
    2319:	e8 51 28 00 00       	call   4b6f <read>
    231e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2321:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2325:	7f c4                	jg     22eb <pasteFile+0x169>
                write(file_dest, buff, size);
	        if(size < 0)
    2327:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    232b:	79 24                	jns    2351 <pasteFile+0x1cf>
	        {
	            //printf(2, "copy file error!!!\r\n");
	            printf(0, "NO.%d file %s error\n", i, filename);
    232d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2330:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2334:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2337:	89 44 24 08          	mov    %eax,0x8(%esp)
    233b:	c7 44 24 04 d0 b6 00 	movl   $0xb6d0,0x4(%esp)
    2342:	00 
    2343:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    234a:	e8 f0 29 00 00       	call   4d3f <printf>
	            return;
    234f:	eb 33                	jmp    2384 <pasteFile+0x202>
	        }
	        close(file_dest);
    2351:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2354:	89 04 24             	mov    %eax,(%esp)
    2357:	e8 23 28 00 00       	call   4b7f <close>
		}
		close(file_src);
    235c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    235f:	89 04 24             	mov    %eax,(%esp)
    2362:	e8 18 28 00 00       	call   4b7f <close>
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
    2367:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    236b:	a1 d4 36 01 00       	mov    0x136d4,%eax
    2370:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2373:	0f 8c 4c fe ff ff    	jl     21c5 <pasteFile+0x43>
	        }
	        close(file_dest);
		}
		close(file_src);
	}
    free(buff);
    2379:	8b 45 e8             	mov    -0x18(%ebp),%eax
    237c:	89 04 24             	mov    %eax,(%esp)
    237f:	e8 6e 2b 00 00       	call   4ef2 <free>
}
    2384:	c9                   	leave  
    2385:	c3                   	ret    

00002386 <h_pasteFile>:

void h_pasteFile(Point p){
    2386:	55                   	push   %ebp
    2387:	89 e5                	mov    %esp,%ebp
    2389:	83 ec 38             	sub    $0x38,%esp
	pasteFile();
    238c:	e8 f1 fd ff ff       	call   2182 <pasteFile>
	if(copyOrCut == 1)
    2391:	a1 64 ff 00 00       	mov    0xff64,%eax
    2396:	83 f8 01             	cmp    $0x1,%eax
    2399:	75 05                	jne    23a0 <h_pasteFile+0x1a>
		moveFile();
    239b:	e8 85 fd ff ff       	call   2125 <moveFile>
    freeFileItemList();
    23a0:	e8 c6 dd ff ff       	call   16b <freeFileItemList>
	list(".");
    23a5:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    23ac:	e8 98 de ff ff       	call   249 <list>
	drawFinderContent(context);
    23b1:	a1 80 35 01 00       	mov    0x13580,%eax
    23b6:	89 04 24             	mov    %eax,(%esp)
    23b9:	a1 84 35 01 00       	mov    0x13584,%eax
    23be:	89 44 24 04          	mov    %eax,0x4(%esp)
    23c2:	a1 88 35 01 00       	mov    0x13588,%eax
    23c7:	89 44 24 08          	mov    %eax,0x8(%esp)
    23cb:	e8 75 e7 ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    23d0:	a1 80 35 01 00       	mov    0x13580,%eax
    23d5:	89 04 24             	mov    %eax,(%esp)
    23d8:	a1 84 35 01 00       	mov    0x13584,%eax
    23dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    23e1:	a1 88 35 01 00       	mov    0x13588,%eax
    23e6:	89 44 24 08          	mov    %eax,0x8(%esp)
    23ea:	e8 5c e5 ff ff       	call   94b <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    23ef:	8d 45 e8             	lea    -0x18(%ebp),%eax
    23f2:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    23f9:	00 
    23fa:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2401:	00 
    2402:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2409:	00 
    240a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2411:	00 
    2412:	89 04 24             	mov    %eax,(%esp)
    2415:	e8 0b 1e 00 00       	call   4225 <initRect>
    241a:	83 ec 04             	sub    $0x4,%esp
    241d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2420:	89 44 24 04          	mov    %eax,0x4(%esp)
    2424:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2427:	89 44 24 08          	mov    %eax,0x8(%esp)
    242b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    242e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2432:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2435:	89 44 24 10          	mov    %eax,0x10(%esp)
    2439:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    2440:	e8 e3 1f 00 00       	call   4428 <deleteClickable>
	addWndEvent(&cm);
    2445:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    244c:	e8 28 ee ff ff       	call   1279 <addWndEvent>
	addListEvent(&cm);
    2451:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    2458:	e8 94 ed ff ff       	call   11f1 <addListEvent>
}
    245d:	c9                   	leave  
    245e:	c3                   	ret    

0000245f <h_chooseFile>:

void h_chooseFile(Point p) {
    245f:	55                   	push   %ebp
    2460:	89 e5                	mov    %esp,%ebp
    2462:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    2465:	8b 45 08             	mov    0x8(%ebp),%eax
    2468:	8b 55 0c             	mov    0xc(%ebp),%edx
    246b:	89 04 24             	mov    %eax,(%esp)
    246e:	89 54 24 04          	mov    %edx,0x4(%esp)
    2472:	e8 c8 ee ff ff       	call   133f <getFileItem>
    2477:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    247a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    247d:	8b 40 28             	mov    0x28(%eax),%eax
    2480:	85 c0                	test   %eax,%eax
    2482:	74 20                	je     24a4 <h_chooseFile+0x45>
	{
		printf(0, "chooseFile!\n");
    2484:	c7 44 24 04 e5 b6 00 	movl   $0xb6e5,0x4(%esp)
    248b:	00 
    248c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2493:	e8 a7 28 00 00       	call   4d3f <printf>
		temp->chosen = 0;
    2498:	8b 45 f4             	mov    -0xc(%ebp),%eax
    249b:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    24a2:	eb 1e                	jmp    24c2 <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    24a4:	c7 44 24 04 f2 b6 00 	movl   $0xb6f2,0x4(%esp)
    24ab:	00 
    24ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24b3:	e8 87 28 00 00       	call   4d3f <printf>
		temp->chosen = 1;
    24b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24bb:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    24c2:	a1 80 35 01 00       	mov    0x13580,%eax
    24c7:	89 04 24             	mov    %eax,(%esp)
    24ca:	a1 84 35 01 00       	mov    0x13584,%eax
    24cf:	89 44 24 04          	mov    %eax,0x4(%esp)
    24d3:	a1 88 35 01 00       	mov    0x13588,%eax
    24d8:	89 44 24 08          	mov    %eax,0x8(%esp)
    24dc:	e8 64 e6 ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    24e1:	a1 80 35 01 00       	mov    0x13580,%eax
    24e6:	89 04 24             	mov    %eax,(%esp)
    24e9:	a1 84 35 01 00       	mov    0x13584,%eax
    24ee:	89 44 24 04          	mov    %eax,0x4(%esp)
    24f2:	a1 88 35 01 00       	mov    0x13588,%eax
    24f7:	89 44 24 08          	mov    %eax,0x8(%esp)
    24fb:	e8 4b e4 ff ff       	call   94b <drawFinderWnd>
}
    2500:	c9                   	leave  
    2501:	c3                   	ret    

00002502 <h_closeWnd>:

void h_closeWnd(Point p) {
    2502:	55                   	push   %ebp
    2503:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    2505:	c7 05 40 f6 00 00 00 	movl   $0x0,0xf640
    250c:	00 00 00 
}
    250f:	5d                   	pop    %ebp
    2510:	c3                   	ret    

00002511 <h_chvm1>:

void h_chvm1(Point p) {
    2511:	55                   	push   %ebp
    2512:	89 e5                	mov    %esp,%ebp
    2514:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    2517:	c7 05 44 f6 00 00 01 	movl   $0x1,0xf644
    251e:	00 00 00 
	freeFileItemList();
    2521:	e8 45 dc ff ff       	call   16b <freeFileItemList>
		list(".");
    2526:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    252d:	e8 17 dd ff ff       	call   249 <list>
		drawFinderContent(context);
    2532:	a1 80 35 01 00       	mov    0x13580,%eax
    2537:	89 04 24             	mov    %eax,(%esp)
    253a:	a1 84 35 01 00       	mov    0x13584,%eax
    253f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2543:	a1 88 35 01 00       	mov    0x13588,%eax
    2548:	89 44 24 08          	mov    %eax,0x8(%esp)
    254c:	e8 f4 e5 ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    2551:	a1 80 35 01 00       	mov    0x13580,%eax
    2556:	89 04 24             	mov    %eax,(%esp)
    2559:	a1 84 35 01 00       	mov    0x13584,%eax
    255e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2562:	a1 88 35 01 00       	mov    0x13588,%eax
    2567:	89 44 24 08          	mov    %eax,0x8(%esp)
    256b:	e8 db e3 ff ff       	call   94b <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2570:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2573:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    257a:	00 
    257b:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2582:	00 
    2583:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    258a:	00 
    258b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2592:	00 
    2593:	89 04 24             	mov    %eax,(%esp)
    2596:	e8 8a 1c 00 00       	call   4225 <initRect>
    259b:	83 ec 04             	sub    $0x4,%esp
    259e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    25a1:	89 44 24 04          	mov    %eax,0x4(%esp)
    25a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    25a8:	89 44 24 08          	mov    %eax,0x8(%esp)
    25ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    25af:	89 44 24 0c          	mov    %eax,0xc(%esp)
    25b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25b6:	89 44 24 10          	mov    %eax,0x10(%esp)
    25ba:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    25c1:	e8 62 1e 00 00       	call   4428 <deleteClickable>
			addWndEvent(&cm);
    25c6:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    25cd:	e8 a7 ec ff ff       	call   1279 <addWndEvent>
			addListEvent(&cm);
    25d2:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    25d9:	e8 13 ec ff ff       	call   11f1 <addListEvent>
}
    25de:	c9                   	leave  
    25df:	c3                   	ret    

000025e0 <h_chvm2>:

void h_chvm2(Point p) {
    25e0:	55                   	push   %ebp
    25e1:	89 e5                	mov    %esp,%ebp
    25e3:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    25e6:	c7 05 44 f6 00 00 02 	movl   $0x2,0xf644
    25ed:	00 00 00 
	freeFileItemList();
    25f0:	e8 76 db ff ff       	call   16b <freeFileItemList>
		list(".");
    25f5:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    25fc:	e8 48 dc ff ff       	call   249 <list>
		drawFinderContent(context);
    2601:	a1 80 35 01 00       	mov    0x13580,%eax
    2606:	89 04 24             	mov    %eax,(%esp)
    2609:	a1 84 35 01 00       	mov    0x13584,%eax
    260e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2612:	a1 88 35 01 00       	mov    0x13588,%eax
    2617:	89 44 24 08          	mov    %eax,0x8(%esp)
    261b:	e8 25 e5 ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    2620:	a1 80 35 01 00       	mov    0x13580,%eax
    2625:	89 04 24             	mov    %eax,(%esp)
    2628:	a1 84 35 01 00       	mov    0x13584,%eax
    262d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2631:	a1 88 35 01 00       	mov    0x13588,%eax
    2636:	89 44 24 08          	mov    %eax,0x8(%esp)
    263a:	e8 0c e3 ff ff       	call   94b <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    263f:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2642:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2649:	00 
    264a:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2651:	00 
    2652:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2659:	00 
    265a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2661:	00 
    2662:	89 04 24             	mov    %eax,(%esp)
    2665:	e8 bb 1b 00 00       	call   4225 <initRect>
    266a:	83 ec 04             	sub    $0x4,%esp
    266d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2670:	89 44 24 04          	mov    %eax,0x4(%esp)
    2674:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2677:	89 44 24 08          	mov    %eax,0x8(%esp)
    267b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    267e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2682:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2685:	89 44 24 10          	mov    %eax,0x10(%esp)
    2689:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    2690:	e8 93 1d 00 00       	call   4428 <deleteClickable>
			addWndEvent(&cm);
    2695:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    269c:	e8 d8 eb ff ff       	call   1279 <addWndEvent>
			addListEvent(&cm);
    26a1:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    26a8:	e8 44 eb ff ff       	call   11f1 <addListEvent>
}
    26ad:	c9                   	leave  
    26ae:	c3                   	ret    

000026af <h_goUp>:

void h_goUp(Point p) {
    26af:	55                   	push   %ebp
    26b0:	89 e5                	mov    %esp,%ebp
    26b2:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    26b5:	c7 04 24 8d b5 00 00 	movl   $0xb58d,(%esp)
    26bc:	e8 fc f0 ff ff       	call   17bd <enterDir>
	freeFileItemList();
    26c1:	e8 a5 da ff ff       	call   16b <freeFileItemList>
	list(".");
    26c6:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    26cd:	e8 77 db ff ff       	call   249 <list>
	drawFinderContent(context);
    26d2:	a1 80 35 01 00       	mov    0x13580,%eax
    26d7:	89 04 24             	mov    %eax,(%esp)
    26da:	a1 84 35 01 00       	mov    0x13584,%eax
    26df:	89 44 24 04          	mov    %eax,0x4(%esp)
    26e3:	a1 88 35 01 00       	mov    0x13588,%eax
    26e8:	89 44 24 08          	mov    %eax,0x8(%esp)
    26ec:	e8 54 e4 ff ff       	call   b45 <drawFinderContent>
	drawFinderWnd(context);
    26f1:	a1 80 35 01 00       	mov    0x13580,%eax
    26f6:	89 04 24             	mov    %eax,(%esp)
    26f9:	a1 84 35 01 00       	mov    0x13584,%eax
    26fe:	89 44 24 04          	mov    %eax,0x4(%esp)
    2702:	a1 88 35 01 00       	mov    0x13588,%eax
    2707:	89 44 24 08          	mov    %eax,0x8(%esp)
    270b:	e8 3b e2 ff ff       	call   94b <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2710:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2713:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    271a:	00 
    271b:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2722:	00 
    2723:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    272a:	00 
    272b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2732:	00 
    2733:	89 04 24             	mov    %eax,(%esp)
    2736:	e8 ea 1a 00 00       	call   4225 <initRect>
    273b:	83 ec 04             	sub    $0x4,%esp
    273e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2741:	89 44 24 04          	mov    %eax,0x4(%esp)
    2745:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2748:	89 44 24 08          	mov    %eax,0x8(%esp)
    274c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    274f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2753:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2756:	89 44 24 10          	mov    %eax,0x10(%esp)
    275a:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    2761:	e8 c2 1c 00 00       	call   4428 <deleteClickable>
	addWndEvent(&cm);
    2766:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    276d:	e8 07 eb ff ff       	call   1279 <addWndEvent>
	addListEvent(&cm);
    2772:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    2779:	e8 73 ea ff ff       	call   11f1 <addListEvent>
}
    277e:	c9                   	leave  
    277f:	c3                   	ret    

00002780 <h_empty>:

void h_empty(Point p) {
    2780:	55                   	push   %ebp
    2781:	89 e5                	mov    %esp,%ebp

}
    2783:	5d                   	pop    %ebp
    2784:	c3                   	ret    

00002785 <main>:

int main(int argc, char *argv[]) {
    2785:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    2789:	83 e4 f0             	and    $0xfffffff0,%esp
    278c:	ff 71 fc             	pushl  -0x4(%ecx)
    278f:	55                   	push   %ebp
    2790:	89 e5                	mov    %esp,%ebp
    2792:	56                   	push   %esi
    2793:	53                   	push   %ebx
    2794:	51                   	push   %ecx
    2795:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
	struct Msg msg;
	char key;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    279b:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    27a2:	00 
    27a3:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    27aa:	00 
    27ab:	c7 04 24 80 35 01 00 	movl   $0x13580,(%esp)
    27b2:	e8 38 05 00 00       	call   2cef <init_context>
    27b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    27ba:	8d 45 88             	lea    -0x78(%ebp),%eax
    27bd:	8b 15 80 35 01 00    	mov    0x13580,%edx
    27c3:	89 54 24 04          	mov    %edx,0x4(%esp)
    27c7:	8b 15 84 35 01 00    	mov    0x13584,%edx
    27cd:	89 54 24 08          	mov    %edx,0x8(%esp)
    27d1:	8b 15 88 35 01 00    	mov    0x13588,%edx
    27d7:	89 54 24 0c          	mov    %edx,0xc(%esp)
    27db:	89 04 24             	mov    %eax,(%esp)
    27de:	e8 e0 1a 00 00       	call   42c3 <initClickManager>
    27e3:	83 ec 04             	sub    $0x4,%esp
    27e6:	8b 45 88             	mov    -0x78(%ebp),%eax
    27e9:	a3 c0 36 01 00       	mov    %eax,0x136c0
    27ee:	8b 45 8c             	mov    -0x74(%ebp),%eax
    27f1:	a3 c4 36 01 00       	mov    %eax,0x136c4
    27f6:	8b 45 90             	mov    -0x70(%ebp),%eax
    27f9:	a3 c8 36 01 00       	mov    %eax,0x136c8
    27fe:	8b 45 94             	mov    -0x6c(%ebp),%eax
    2801:	a3 cc 36 01 00       	mov    %eax,0x136cc
    2806:	8b 45 98             	mov    -0x68(%ebp),%eax
    2809:	a3 d0 36 01 00       	mov    %eax,0x136d0
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    280e:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
    2815:	00 
    2816:	c7 04 24 40 f7 00 00 	movl   $0xf740,(%esp)
    281d:	e8 c7 10 00 00       	call   38e9 <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    2822:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    2829:	00 
    282a:	c7 04 24 60 f6 00 00 	movl   $0xf660,(%esp)
    2831:	e8 b3 10 00 00       	call   38e9 <load_iconlist>
	//testHandlers();
	strcpy(currentPath, "/");
    2836:	c7 44 24 04 01 b7 00 	movl   $0xb701,0x4(%esp)
    283d:	00 
    283e:	c7 04 24 c0 35 01 00 	movl   $0x135c0,(%esp)
    2845:	e8 ca 20 00 00       	call   4914 <strcpy>
	mkdir("userfolder");
    284a:	c7 04 24 03 b7 00 00 	movl   $0xb703,(%esp)
    2851:	e8 69 23 00 00       	call   4bbf <mkdir>
	enterDir("userfolder");
    2856:	c7 04 24 03 b7 00 00 	movl   $0xb703,(%esp)
    285d:	e8 5b ef ff ff       	call   17bd <enterDir>
	freeFileItemList();
    2862:	e8 04 d9 ff ff       	call   16b <freeFileItemList>
	list(".");
    2867:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    286e:	e8 d6 d9 ff ff       	call   249 <list>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2873:	8d 45 d0             	lea    -0x30(%ebp),%eax
    2876:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    287d:	00 
    287e:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2885:	00 
    2886:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    288d:	00 
    288e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2895:	00 
    2896:	89 04 24             	mov    %eax,(%esp)
    2899:	e8 87 19 00 00       	call   4225 <initRect>
    289e:	83 ec 04             	sub    $0x4,%esp
    28a1:	8b 45 d0             	mov    -0x30(%ebp),%eax
    28a4:	89 44 24 04          	mov    %eax,0x4(%esp)
    28a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    28ab:	89 44 24 08          	mov    %eax,0x8(%esp)
    28af:	8b 45 d8             	mov    -0x28(%ebp),%eax
    28b2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    28b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    28b9:	89 44 24 10          	mov    %eax,0x10(%esp)
    28bd:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    28c4:	e8 5f 1b 00 00       	call   4428 <deleteClickable>
	addWndEvent(&cm);
    28c9:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    28d0:	e8 a4 e9 ff ff       	call   1279 <addWndEvent>
	addListEvent(&cm);
    28d5:	c7 04 24 c0 36 01 00 	movl   $0x136c0,(%esp)
    28dc:	e8 10 e9 ff ff       	call   11f1 <addListEvent>
	lenOfWaited = 0;
    28e1:	c7 05 d4 36 01 00 00 	movl   $0x0,0x136d4
    28e8:	00 00 00 
	while (isRun) {
    28eb:	e9 cf 02 00 00       	jmp    2bbf <main+0x43a>
		getMsg(&msg);
    28f0:	8d 45 b8             	lea    -0x48(%ebp),%eax
    28f3:	89 04 24             	mov    %eax,(%esp)
    28f6:	e8 fc 22 00 00       	call   4bf7 <getMsg>
		switch (msg.msg_type) {
    28fb:	8b 45 b8             	mov    -0x48(%ebp),%eax
    28fe:	83 f8 08             	cmp    $0x8,%eax
    2901:	0f 87 b7 02 00 00    	ja     2bbe <main+0x439>
    2907:	8b 04 85 10 b7 00 00 	mov    0xb710(,%eax,4),%eax
    290e:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2910:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2913:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2916:	8d 45 b0             	lea    -0x50(%ebp),%eax
    2919:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    291d:	89 54 24 04          	mov    %edx,0x4(%esp)
    2921:	89 04 24             	mov    %eax,(%esp)
    2924:	e8 d5 18 00 00       	call   41fe <initPoint>
    2929:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    292c:	8b 0d c4 36 01 00    	mov    0x136c4,%ecx
    2932:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2935:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    2938:	89 44 24 04          	mov    %eax,0x4(%esp)
    293c:	89 54 24 08          	mov    %edx,0x8(%esp)
    2940:	89 0c 24             	mov    %ecx,(%esp)
    2943:	e8 c0 1b 00 00       	call   4508 <executeHandler>
    2948:	85 c0                	test   %eax,%eax
    294a:	74 19                	je     2965 <main+0x1e0>
				updateWindow(winid, context.addr);
    294c:	a1 80 35 01 00       	mov    0x13580,%eax
    2951:	89 44 24 04          	mov    %eax,0x4(%esp)
    2955:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2958:	89 04 24             	mov    %eax,(%esp)
    295b:	e8 af 22 00 00       	call   4c0f <updateWindow>
			}
			break;
    2960:	e9 5a 02 00 00       	jmp    2bbf <main+0x43a>
    2965:	e9 55 02 00 00       	jmp    2bbf <main+0x43a>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    296a:	a1 80 35 01 00       	mov    0x13580,%eax
    296f:	89 04 24             	mov    %eax,(%esp)
    2972:	a1 84 35 01 00       	mov    0x13584,%eax
    2977:	89 44 24 04          	mov    %eax,0x4(%esp)
    297b:	a1 88 35 01 00       	mov    0x13588,%eax
    2980:	89 44 24 08          	mov    %eax,0x8(%esp)
    2984:	e8 bc e1 ff ff       	call   b45 <drawFinderContent>
			drawFinderWnd(context);
    2989:	a1 80 35 01 00       	mov    0x13580,%eax
    298e:	89 04 24             	mov    %eax,(%esp)
    2991:	a1 84 35 01 00       	mov    0x13584,%eax
    2996:	89 44 24 04          	mov    %eax,0x4(%esp)
    299a:	a1 88 35 01 00       	mov    0x13588,%eax
    299f:	89 44 24 08          	mov    %eax,0x8(%esp)
    29a3:	e8 a3 df ff ff       	call   94b <drawFinderWnd>
			updateWindow(winid, context.addr);
    29a8:	a1 80 35 01 00       	mov    0x13580,%eax
    29ad:	89 44 24 04          	mov    %eax,0x4(%esp)
    29b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    29b4:	89 04 24             	mov    %eax,(%esp)
    29b7:	e8 53 22 00 00       	call   4c0f <updateWindow>
			break;
    29bc:	e9 fe 01 00 00       	jmp    2bbf <main+0x43a>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    29c1:	8b 75 c8             	mov    -0x38(%ebp),%esi
    29c4:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
    29c7:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    29ca:	8b 55 bc             	mov    -0x44(%ebp),%edx
    29cd:	a1 80 35 01 00       	mov    0x13580,%eax
    29d2:	89 74 24 14          	mov    %esi,0x14(%esp)
    29d6:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    29da:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    29de:	89 54 24 08          	mov    %edx,0x8(%esp)
    29e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    29e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    29e9:	89 04 24             	mov    %eax,(%esp)
    29ec:	e8 26 22 00 00       	call   4c17 <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    29f1:	e9 c9 01 00 00       	jmp    2bbf <main+0x43a>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    29f6:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    29f9:	8b 55 bc             	mov    -0x44(%ebp),%edx
    29fc:	8d 45 80             	lea    -0x80(%ebp),%eax
    29ff:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2a03:	89 54 24 04          	mov    %edx,0x4(%esp)
    2a07:	89 04 24             	mov    %eax,(%esp)
    2a0a:	e8 ef 17 00 00       	call   41fe <initPoint>
    2a0f:	83 ec 04             	sub    $0x4,%esp
    2a12:	8b 45 80             	mov    -0x80(%ebp),%eax
    2a15:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2a18:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2a1b:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    2a1e:	8b 0d c0 36 01 00    	mov    0x136c0,%ecx
    2a24:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2a27:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    2a2a:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a2e:	89 54 24 08          	mov    %edx,0x8(%esp)
    2a32:	89 0c 24             	mov    %ecx,(%esp)
    2a35:	e8 ce 1a 00 00       	call   4508 <executeHandler>
    2a3a:	85 c0                	test   %eax,%eax
    2a3c:	74 19                	je     2a57 <main+0x2d2>

				updateWindow(winid, context.addr);
    2a3e:	a1 80 35 01 00       	mov    0x13580,%eax
    2a43:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a47:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a4a:	89 04 24             	mov    %eax,(%esp)
    2a4d:	e8 bd 21 00 00       	call   4c0f <updateWindow>
			}
			break;
    2a52:	e9 68 01 00 00       	jmp    2bbf <main+0x43a>
    2a57:	e9 63 01 00 00       	jmp    2bbf <main+0x43a>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2a5c:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2a5f:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2a62:	8d 45 80             	lea    -0x80(%ebp),%eax
    2a65:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2a69:	89 54 24 04          	mov    %edx,0x4(%esp)
    2a6d:	89 04 24             	mov    %eax,(%esp)
    2a70:	e8 89 17 00 00       	call   41fe <initPoint>
    2a75:	83 ec 04             	sub    $0x4,%esp
    2a78:	8b 45 80             	mov    -0x80(%ebp),%eax
    2a7b:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2a7e:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2a81:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    2a84:	8b 0d c8 36 01 00    	mov    0x136c8,%ecx
    2a8a:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2a8d:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    2a90:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a94:	89 54 24 08          	mov    %edx,0x8(%esp)
    2a98:	89 0c 24             	mov    %ecx,(%esp)
    2a9b:	e8 68 1a 00 00       	call   4508 <executeHandler>
    2aa0:	85 c0                	test   %eax,%eax
    2aa2:	74 19                	je     2abd <main+0x338>
				updateWindow(winid, context.addr);
    2aa4:	a1 80 35 01 00       	mov    0x13580,%eax
    2aa9:	89 44 24 04          	mov    %eax,0x4(%esp)
    2aad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ab0:	89 04 24             	mov    %eax,(%esp)
    2ab3:	e8 57 21 00 00       	call   4c0f <updateWindow>
			}
			break;
    2ab8:	e9 02 01 00 00       	jmp    2bbf <main+0x43a>
    2abd:	e9 fd 00 00 00       	jmp    2bbf <main+0x43a>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    2ac2:	0f b6 45 bc          	movzbl -0x44(%ebp),%eax
    2ac6:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    2ac9:	a1 60 2d 01 00       	mov    0x12d60,%eax
    2ace:	85 c0                	test   %eax,%eax
    2ad0:	0f 84 e6 00 00 00    	je     2bbc <main+0x437>
				if (((key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    2ad6:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    2ada:	74 24                	je     2b00 <main+0x37b>
    2adc:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    2ae0:	7e 06                	jle    2ae8 <main+0x363>
    2ae2:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    2ae6:	7e 18                	jle    2b00 <main+0x37b>
    2ae8:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    2aec:	7e 06                	jle    2af4 <main+0x36f>
    2aee:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    2af2:	7e 0c                	jle    2b00 <main+0x37b>
    2af4:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    2af8:	7e 46                	jle    2b40 <main+0x3bb>
    2afa:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    2afe:	7f 40                	jg     2b40 <main+0x3bb>
    2b00:	a1 a0 35 01 00       	mov    0x135a0,%eax
    2b05:	83 f8 13             	cmp    $0x13,%eax
    2b08:	7f 36                	jg     2b40 <main+0x3bb>
					keyContent.content[keyContent.length++] = key;
    2b0a:	a1 a0 35 01 00       	mov    0x135a0,%eax
    2b0f:	8d 50 01             	lea    0x1(%eax),%edx
    2b12:	89 15 a0 35 01 00    	mov    %edx,0x135a0
    2b18:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    2b1c:	88 90 8c 35 01 00    	mov    %dl,0x1358c(%eax)
					printf(0, "%s\n", keyContent.content);
    2b22:	c7 44 24 08 8c 35 01 	movl   $0x1358c,0x8(%esp)
    2b29:	00 
    2b2a:	c7 44 24 04 af b4 00 	movl   $0xb4af,0x4(%esp)
    2b31:	00 
    2b32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b39:	e8 01 22 00 00       	call   4d3f <printf>
    2b3e:	eb 28                	jmp    2b68 <main+0x3e3>
				}
				else if (key == 8 && keyContent.length > 0) {
    2b40:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    2b44:	75 22                	jne    2b68 <main+0x3e3>
    2b46:	a1 a0 35 01 00       	mov    0x135a0,%eax
    2b4b:	85 c0                	test   %eax,%eax
    2b4d:	7e 19                	jle    2b68 <main+0x3e3>
					keyContent.content[--keyContent.length] = 0;
    2b4f:	a1 a0 35 01 00       	mov    0x135a0,%eax
    2b54:	83 e8 01             	sub    $0x1,%eax
    2b57:	a3 a0 35 01 00       	mov    %eax,0x135a0
    2b5c:	a1 a0 35 01 00       	mov    0x135a0,%eax
    2b61:	c6 80 8c 35 01 00 00 	movb   $0x0,0x1358c(%eax)
				}
				drawFinderContent(context);
    2b68:	a1 80 35 01 00       	mov    0x13580,%eax
    2b6d:	89 04 24             	mov    %eax,(%esp)
    2b70:	a1 84 35 01 00       	mov    0x13584,%eax
    2b75:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b79:	a1 88 35 01 00       	mov    0x13588,%eax
    2b7e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b82:	e8 be df ff ff       	call   b45 <drawFinderContent>
				drawFinderWnd(context);
    2b87:	a1 80 35 01 00       	mov    0x13580,%eax
    2b8c:	89 04 24             	mov    %eax,(%esp)
    2b8f:	a1 84 35 01 00       	mov    0x13584,%eax
    2b94:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b98:	a1 88 35 01 00       	mov    0x13588,%eax
    2b9d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ba1:	e8 a5 dd ff ff       	call   94b <drawFinderWnd>
				updateWindow(winid, context.addr);
    2ba6:	a1 80 35 01 00       	mov    0x13580,%eax
    2bab:	89 44 24 04          	mov    %eax,0x4(%esp)
    2baf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bb2:	89 04 24             	mov    %eax,(%esp)
    2bb5:	e8 55 20 00 00       	call   4c0f <updateWindow>
			}
			break;
    2bba:	eb 03                	jmp    2bbf <main+0x43a>
    2bbc:	eb 01                	jmp    2bbf <main+0x43a>
		default:
			break;
    2bbe:	90                   	nop
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    2bbf:	a1 40 f6 00 00       	mov    0xf640,%eax
    2bc4:	85 c0                	test   %eax,%eax
    2bc6:	0f 85 24 fd ff ff    	jne    28f0 <main+0x16b>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    2bcc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bcf:	89 44 24 04          	mov    %eax,0x4(%esp)
    2bd3:	c7 04 24 80 35 01 00 	movl   $0x13580,(%esp)
    2bda:	e8 93 01 00 00       	call   2d72 <free_context>
	exit();
    2bdf:	e8 73 1f 00 00       	call   4b57 <exit>

00002be4 <testHandlers>:
}

void testHandlers() {
    2be4:	55                   	push   %ebp
    2be5:	89 e5                	mov    %esp,%ebp
    2be7:	83 ec 18             	sub    $0x18,%esp

	list(".");
    2bea:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    2bf1:	e8 53 d6 ff ff       	call   249 <list>
	printf(0, "original list:\n");
    2bf6:	c7 44 24 04 34 b7 00 	movl   $0xb734,0x4(%esp)
    2bfd:	00 
    2bfe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c05:	e8 35 21 00 00       	call   4d3f <printf>
	printItemList();
    2c0a:	e8 cc e3 ff ff       	call   fdb <printItemList>
	printf(0, "\n");
    2c0f:	c7 44 24 04 44 b7 00 	movl   $0xb744,0x4(%esp)
    2c16:	00 
    2c17:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c1e:	e8 1c 21 00 00       	call   4d3f <printf>
	printf(0, "new a folder:\n");
    2c23:	c7 44 24 04 46 b7 00 	movl   $0xb746,0x4(%esp)
    2c2a:	00 
    2c2b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c32:	e8 08 21 00 00       	call   4d3f <printf>
	newFolder("newfolder");
    2c37:	c7 04 24 55 b7 00 00 	movl   $0xb755,(%esp)
    2c3e:	e8 cc ee ff ff       	call   1b0f <newFolder>
	freeFileItemList();
    2c43:	e8 23 d5 ff ff       	call   16b <freeFileItemList>
	list(".");
    2c48:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    2c4f:	e8 f5 d5 ff ff       	call   249 <list>
	printItemList();
    2c54:	e8 82 e3 ff ff       	call   fdb <printItemList>
	printf(0, "\n");
    2c59:	c7 44 24 04 44 b7 00 	movl   $0xb744,0x4(%esp)
    2c60:	00 
    2c61:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c68:	e8 d2 20 00 00       	call   4d3f <printf>
	printf(0, "enter new folder:\n");
    2c6d:	c7 44 24 04 5f b7 00 	movl   $0xb75f,0x4(%esp)
    2c74:	00 
    2c75:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c7c:	e8 be 20 00 00       	call   4d3f <printf>
	enterDir("newfolder");
    2c81:	c7 04 24 55 b7 00 00 	movl   $0xb755,(%esp)
    2c88:	e8 30 eb ff ff       	call   17bd <enterDir>
	freeFileItemList();
    2c8d:	e8 d9 d4 ff ff       	call   16b <freeFileItemList>
	list(".");
    2c92:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    2c99:	e8 ab d5 ff ff       	call   249 <list>
	printItemList();
    2c9e:	e8 38 e3 ff ff       	call   fdb <printItemList>
	printf(0, "\n");
    2ca3:	c7 44 24 04 44 b7 00 	movl   $0xb744,0x4(%esp)
    2caa:	00 
    2cab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cb2:	e8 88 20 00 00       	call   4d3f <printf>
	printf(0, "new a file:\n");
    2cb7:	c7 44 24 04 72 b7 00 	movl   $0xb772,0x4(%esp)
    2cbe:	00 
    2cbf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cc6:	e8 74 20 00 00       	call   4d3f <printf>
	newFile("newfile.txt");
    2ccb:	c7 04 24 7f b7 00 00 	movl   $0xb77f,(%esp)
    2cd2:	e8 4e ec ff ff       	call   1925 <newFile>
	freeFileItemList();
    2cd7:	e8 8f d4 ff ff       	call   16b <freeFileItemList>
	list(".");
    2cdc:	c7 04 24 e7 b4 00 00 	movl   $0xb4e7,(%esp)
    2ce3:	e8 61 d5 ff ff       	call   249 <list>
	printItemList();
    2ce8:	e8 ee e2 ff ff       	call   fdb <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    2ced:	c9                   	leave  
    2cee:	c3                   	ret    

00002cef <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    2cef:	55                   	push   %ebp
    2cf0:	89 e5                	mov    %esp,%ebp
    2cf2:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    2cf5:	8b 45 08             	mov    0x8(%ebp),%eax
    2cf8:	8b 55 0c             	mov    0xc(%ebp),%edx
    2cfb:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    2cfe:	8b 45 08             	mov    0x8(%ebp),%eax
    2d01:	8b 55 10             	mov    0x10(%ebp),%edx
    2d04:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    2d07:	8b 55 0c             	mov    0xc(%ebp),%edx
    2d0a:	8b 45 10             	mov    0x10(%ebp),%eax
    2d0d:	0f af c2             	imul   %edx,%eax
    2d10:	01 c0                	add    %eax,%eax
    2d12:	89 04 24             	mov    %eax,(%esp)
    2d15:	e8 11 23 00 00       	call   502b <malloc>
    2d1a:	8b 55 08             	mov    0x8(%ebp),%edx
    2d1d:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    2d1f:	8b 55 0c             	mov    0xc(%ebp),%edx
    2d22:	8b 45 10             	mov    0x10(%ebp),%eax
    2d25:	0f af c2             	imul   %edx,%eax
    2d28:	8d 14 00             	lea    (%eax,%eax,1),%edx
    2d2b:	8b 45 08             	mov    0x8(%ebp),%eax
    2d2e:	8b 00                	mov    (%eax),%eax
    2d30:	89 54 24 08          	mov    %edx,0x8(%esp)
    2d34:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2d3b:	00 
    2d3c:	89 04 24             	mov    %eax,(%esp)
    2d3f:	e8 66 1c 00 00       	call   49aa <memset>
    initializeASCII();
    2d44:	e8 93 01 00 00       	call   2edc <initializeASCII>
    initializeGBK();
    2d49:	e8 17 03 00 00       	call   3065 <initializeGBK>
    return createWindow(0, 0, width, height);
    2d4e:	8b 45 10             	mov    0x10(%ebp),%eax
    2d51:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2d55:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d58:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d5c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2d63:	00 
    2d64:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d6b:	e8 8f 1e 00 00       	call   4bff <createWindow>
}
    2d70:	c9                   	leave  
    2d71:	c3                   	ret    

00002d72 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    2d72:	55                   	push   %ebp
    2d73:	89 e5                	mov    %esp,%ebp
    2d75:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    2d78:	8b 45 08             	mov    0x8(%ebp),%eax
    2d7b:	8b 00                	mov    (%eax),%eax
    2d7d:	89 04 24             	mov    %eax,(%esp)
    2d80:	e8 6d 21 00 00       	call   4ef2 <free>
    freeASCII();
    2d85:	e8 c6 02 00 00       	call   3050 <freeASCII>
    freeGBK();
    2d8a:	e8 7e 03 00 00       	call   310d <freeGBK>
    destroyWindow(winid);
    2d8f:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d92:	89 04 24             	mov    %eax,(%esp)
    2d95:	e8 6d 1e 00 00       	call   4c07 <destroyWindow>
}
    2d9a:	c9                   	leave  
    2d9b:	c3                   	ret    

00002d9c <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    2d9c:	55                   	push   %ebp
    2d9d:	89 e5                	mov    %esp,%ebp
    2d9f:	83 ec 04             	sub    $0x4,%esp
    2da2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2da5:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    2da9:	8b 45 0c             	mov    0xc(%ebp),%eax
    2dac:	3b 45 14             	cmp    0x14(%ebp),%eax
    2daf:	77 02                	ja     2db3 <draw_point+0x17>
    return;
    2db1:	eb 26                	jmp    2dd9 <draw_point+0x3d>
  if(y >= c.height)
    2db3:	8b 45 10             	mov    0x10(%ebp),%eax
    2db6:	3b 45 18             	cmp    0x18(%ebp),%eax
    2db9:	77 02                	ja     2dbd <draw_point+0x21>
    return;
    2dbb:	eb 1c                	jmp    2dd9 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    2dbd:	8b 55 08             	mov    0x8(%ebp),%edx
    2dc0:	8b 45 0c             	mov    0xc(%ebp),%eax
    2dc3:	0f af 45 18          	imul   0x18(%ebp),%eax
    2dc7:	89 c1                	mov    %eax,%ecx
    2dc9:	8b 45 14             	mov    0x14(%ebp),%eax
    2dcc:	01 c8                	add    %ecx,%eax
    2dce:	01 c0                	add    %eax,%eax
    2dd0:	01 c2                	add    %eax,%edx
    2dd2:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    2dd6:	66 89 02             	mov    %ax,(%edx)
}
    2dd9:	c9                   	leave  
    2dda:	c3                   	ret    

00002ddb <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    2ddb:	55                   	push   %ebp
    2ddc:	89 e5                	mov    %esp,%ebp
    2dde:	83 ec 2c             	sub    $0x2c,%esp
    2de1:	8b 45 24             	mov    0x24(%ebp),%eax
    2de4:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    2de8:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2deb:	8b 55 14             	mov    0x14(%ebp),%edx
    2dee:	01 c2                	add    %eax,%edx
    2df0:	8b 45 0c             	mov    0xc(%ebp),%eax
    2df3:	39 c2                	cmp    %eax,%edx
    2df5:	0f 46 c2             	cmovbe %edx,%eax
    2df8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    2dfb:	8b 45 20             	mov    0x20(%ebp),%eax
    2dfe:	8b 55 18             	mov    0x18(%ebp),%edx
    2e01:	01 c2                	add    %eax,%edx
    2e03:	8b 45 10             	mov    0x10(%ebp),%eax
    2e06:	39 c2                	cmp    %eax,%edx
    2e08:	0f 46 c2             	cmovbe %edx,%eax
    2e0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    2e0e:	8b 45 18             	mov    0x18(%ebp),%eax
    2e11:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2e14:	eb 47                	jmp    2e5d <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    2e16:	8b 45 14             	mov    0x14(%ebp),%eax
    2e19:	89 45 fc             	mov    %eax,-0x4(%ebp)
    2e1c:	eb 33                	jmp    2e51 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    2e1e:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    2e22:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2e25:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2e28:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2e2c:	89 54 24 10          	mov    %edx,0x10(%esp)
    2e30:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2e34:	8b 45 08             	mov    0x8(%ebp),%eax
    2e37:	89 04 24             	mov    %eax,(%esp)
    2e3a:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e3d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e41:	8b 45 10             	mov    0x10(%ebp),%eax
    2e44:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e48:	e8 4f ff ff ff       	call   2d9c <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    2e4d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2e51:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2e54:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2e57:	7c c5                	jl     2e1e <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    2e59:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2e5d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2e60:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2e63:	7c b1                	jl     2e16 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    2e65:	c9                   	leave  
    2e66:	c3                   	ret    

00002e67 <printBinary>:

void printBinary(char c)
{
    2e67:	55                   	push   %ebp
    2e68:	89 e5                	mov    %esp,%ebp
    2e6a:	83 ec 28             	sub    $0x28,%esp
    2e6d:	8b 45 08             	mov    0x8(%ebp),%eax
    2e70:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    2e73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2e7a:	eb 44                	jmp    2ec0 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    2e7c:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    2e80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e83:	89 c1                	mov    %eax,%ecx
    2e85:	d3 e2                	shl    %cl,%edx
    2e87:	89 d0                	mov    %edx,%eax
    2e89:	25 80 00 00 00       	and    $0x80,%eax
    2e8e:	85 c0                	test   %eax,%eax
    2e90:	74 16                	je     2ea8 <printBinary+0x41>
		{
			printf(0, "1");
    2e92:	c7 44 24 04 8b b7 00 	movl   $0xb78b,0x4(%esp)
    2e99:	00 
    2e9a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ea1:	e8 99 1e 00 00       	call   4d3f <printf>
    2ea6:	eb 14                	jmp    2ebc <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    2ea8:	c7 44 24 04 8d b7 00 	movl   $0xb78d,0x4(%esp)
    2eaf:	00 
    2eb0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2eb7:	e8 83 1e 00 00       	call   4d3f <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    2ebc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2ec0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    2ec4:	7e b6                	jle    2e7c <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    2ec6:	c7 44 24 04 8f b7 00 	movl   $0xb78f,0x4(%esp)
    2ecd:	00 
    2ece:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ed5:	e8 65 1e 00 00       	call   4d3f <printf>
}
    2eda:	c9                   	leave  
    2edb:	c3                   	ret    

00002edc <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    2edc:	55                   	push   %ebp
    2edd:	89 e5                	mov    %esp,%ebp
    2edf:	56                   	push   %esi
    2ee0:	53                   	push   %ebx
    2ee1:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    2ee4:	c7 44 24 04 91 b7 00 	movl   $0xb791,0x4(%esp)
    2eeb:	00 
    2eec:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ef3:	e8 47 1e 00 00       	call   4d3f <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    2ef8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2eff:	00 
    2f00:	c7 04 24 a4 b7 00 00 	movl   $0xb7a4,(%esp)
    2f07:	e8 8b 1c 00 00       	call   4b97 <open>
    2f0c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2f0f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2f13:	79 21                	jns    2f36 <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    2f15:	c7 44 24 08 a4 b7 00 	movl   $0xb7a4,0x8(%esp)
    2f1c:	00 
    2f1d:	c7 44 24 04 b0 b7 00 	movl   $0xb7b0,0x4(%esp)
    2f24:	00 
    2f25:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f2c:	e8 0e 1e 00 00       	call   4d3f <printf>
	  return;
    2f31:	e9 13 01 00 00       	jmp    3049 <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    2f36:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2f3d:	e8 e9 20 00 00       	call   502b <malloc>
    2f42:	a3 e0 36 01 00       	mov    %eax,0x136e0
	for (i = 0; i < ASCII_NUM; i++)
    2f47:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f4e:	eb 12                	jmp    2f62 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    2f50:	8b 15 e0 36 01 00    	mov    0x136e0,%edx
    2f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f59:	01 d0                	add    %edx,%eax
    2f5b:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    2f5e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2f62:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    2f69:	7e e5                	jle    2f50 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    2f6b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    2f72:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2f79:	e9 84 00 00 00       	jmp    3002 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    2f7e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f85:	eb 73                	jmp    2ffa <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    2f87:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f8a:	05 00 37 01 00       	add    $0x13700,%eax
    2f8f:	0f b6 00             	movzbl (%eax),%eax
    2f92:	3c 2a                	cmp    $0x2a,%al
    2f94:	74 0f                	je     2fa5 <initializeASCII+0xc9>
    2f96:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f99:	05 00 37 01 00       	add    $0x13700,%eax
    2f9e:	0f b6 00             	movzbl (%eax),%eax
    2fa1:	3c 2e                	cmp    $0x2e,%al
    2fa3:	75 51                	jne    2ff6 <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    2fa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fa8:	05 00 37 01 00       	add    $0x13700,%eax
    2fad:	0f b6 00             	movzbl (%eax),%eax
    2fb0:	3c 2a                	cmp    $0x2a,%al
    2fb2:	75 2d                	jne    2fe1 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    2fb4:	8b 15 e0 36 01 00    	mov    0x136e0,%edx
    2fba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2fbd:	01 c2                	add    %eax,%edx
    2fbf:	8b 0d e0 36 01 00    	mov    0x136e0,%ecx
    2fc5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2fc8:	01 c8                	add    %ecx,%eax
    2fca:	0f b6 00             	movzbl (%eax),%eax
    2fcd:	89 c3                	mov    %eax,%ebx
    2fcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2fd2:	be 80 00 00 00       	mov    $0x80,%esi
    2fd7:	89 c1                	mov    %eax,%ecx
    2fd9:	d3 fe                	sar    %cl,%esi
    2fdb:	89 f0                	mov    %esi,%eax
    2fdd:	09 d8                	or     %ebx,%eax
    2fdf:	88 02                	mov    %al,(%edx)
				}
				x ++;
    2fe1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    2fe5:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    2fe9:	7e 0b                	jle    2ff6 <initializeASCII+0x11a>
				{
					x = 0;
    2feb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    2ff2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    2ff6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2ffa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ffd:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    3000:	7c 85                	jl     2f87 <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    3002:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3009:	00 
    300a:	c7 44 24 04 00 37 01 	movl   $0x13700,0x4(%esp)
    3011:	00 
    3012:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3015:	89 04 24             	mov    %eax,(%esp)
    3018:	e8 52 1b 00 00       	call   4b6f <read>
    301d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3020:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3024:	0f 8f 54 ff ff ff    	jg     2f7e <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    302a:	c7 44 24 04 c0 b7 00 	movl   $0xb7c0,0x4(%esp)
    3031:	00 
    3032:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3039:	e8 01 1d 00 00       	call   4d3f <printf>
	close(fd);
    303e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3041:	89 04 24             	mov    %eax,(%esp)
    3044:	e8 36 1b 00 00       	call   4b7f <close>
}
    3049:	83 c4 30             	add    $0x30,%esp
    304c:	5b                   	pop    %ebx
    304d:	5e                   	pop    %esi
    304e:	5d                   	pop    %ebp
    304f:	c3                   	ret    

00003050 <freeASCII>:

void freeASCII(){
    3050:	55                   	push   %ebp
    3051:	89 e5                	mov    %esp,%ebp
    3053:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    3056:	a1 e0 36 01 00       	mov    0x136e0,%eax
    305b:	89 04 24             	mov    %eax,(%esp)
    305e:	e8 8f 1e 00 00       	call   4ef2 <free>
}
    3063:	c9                   	leave  
    3064:	c3                   	ret    

00003065 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    3065:	55                   	push   %ebp
    3066:	89 e5                	mov    %esp,%ebp
    3068:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    306b:	c7 44 24 04 dd b7 00 	movl   $0xb7dd,0x4(%esp)
    3072:	00 
    3073:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    307a:	e8 c0 1c 00 00       	call   4d3f <printf>
	if((fd = open(HZK16, 0)) < 0){
    307f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3086:	00 
    3087:	c7 04 24 ee b7 00 00 	movl   $0xb7ee,(%esp)
    308e:	e8 04 1b 00 00       	call   4b97 <open>
    3093:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3096:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    309a:	79 1e                	jns    30ba <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    309c:	c7 44 24 08 ee b7 00 	movl   $0xb7ee,0x8(%esp)
    30a3:	00 
    30a4:	c7 44 24 04 b0 b7 00 	movl   $0xb7b0,0x4(%esp)
    30ab:	00 
    30ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30b3:	e8 87 1c 00 00       	call   4d3f <printf>
		return;
    30b8:	eb 51                	jmp    310b <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    30ba:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    30c1:	e8 65 1f 00 00       	call   502b <malloc>
    30c6:	a3 e4 36 01 00       	mov    %eax,0x136e4
	fontFile.size = read(fd, fontFile.buf, 27000);
    30cb:	a1 e4 36 01 00       	mov    0x136e4,%eax
    30d0:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    30d7:	00 
    30d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    30dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30df:	89 04 24             	mov    %eax,(%esp)
    30e2:	e8 88 1a 00 00       	call   4b6f <read>
    30e7:	a3 e8 36 01 00       	mov    %eax,0x136e8
	printf(0,"initialzing gbk complete!\n");
    30ec:	c7 44 24 04 f8 b7 00 	movl   $0xb7f8,0x4(%esp)
    30f3:	00 
    30f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30fb:	e8 3f 1c 00 00       	call   4d3f <printf>
	close(fd);
    3100:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3103:	89 04 24             	mov    %eax,(%esp)
    3106:	e8 74 1a 00 00       	call   4b7f <close>
}
    310b:	c9                   	leave  
    310c:	c3                   	ret    

0000310d <freeGBK>:

void freeGBK(){
    310d:	55                   	push   %ebp
    310e:	89 e5                	mov    %esp,%ebp
    3110:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    3113:	a1 e4 36 01 00       	mov    0x136e4,%eax
    3118:	89 04 24             	mov    %eax,(%esp)
    311b:	e8 d2 1d 00 00       	call   4ef2 <free>
}
    3120:	c9                   	leave  
    3121:	c3                   	ret    

00003122 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    3122:	55                   	push   %ebp
    3123:	89 e5                	mov    %esp,%ebp
    3125:	53                   	push   %ebx
    3126:	83 ec 30             	sub    $0x30,%esp
    3129:	8b 55 14             	mov    0x14(%ebp),%edx
    312c:	8b 45 18             	mov    0x18(%ebp),%eax
    312f:	88 55 e8             	mov    %dl,-0x18(%ebp)
    3132:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    3136:	8b 45 20             	mov    0x20(%ebp),%eax
    3139:	89 45 f4             	mov    %eax,-0xc(%ebp)
    313c:	eb 7f                	jmp    31bd <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    313e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3145:	eb 6c                	jmp    31b3 <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    3147:	a1 e0 36 01 00       	mov    0x136e0,%eax
    314c:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    3150:	c1 e2 04             	shl    $0x4,%edx
    3153:	89 d1                	mov    %edx,%ecx
    3155:	8b 55 20             	mov    0x20(%ebp),%edx
    3158:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    315b:	29 d3                	sub    %edx,%ebx
    315d:	89 da                	mov    %ebx,%edx
    315f:	01 ca                	add    %ecx,%edx
    3161:	01 d0                	add    %edx,%eax
    3163:	0f b6 00             	movzbl (%eax),%eax
    3166:	0f b6 d0             	movzbl %al,%edx
    3169:	8b 45 f8             	mov    -0x8(%ebp),%eax
    316c:	89 c1                	mov    %eax,%ecx
    316e:	d3 e2                	shl    %cl,%edx
    3170:	89 d0                	mov    %edx,%eax
    3172:	25 80 00 00 00       	and    $0x80,%eax
    3177:	85 c0                	test   %eax,%eax
    3179:	74 34                	je     31af <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    317b:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    317f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3182:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3185:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3188:	01 d8                	add    %ebx,%eax
    318a:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    318e:	89 54 24 10          	mov    %edx,0x10(%esp)
    3192:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3196:	8b 45 08             	mov    0x8(%ebp),%eax
    3199:	89 04 24             	mov    %eax,(%esp)
    319c:	8b 45 0c             	mov    0xc(%ebp),%eax
    319f:	89 44 24 04          	mov    %eax,0x4(%esp)
    31a3:	8b 45 10             	mov    0x10(%ebp),%eax
    31a6:	89 44 24 08          	mov    %eax,0x8(%esp)
    31aa:	e8 ed fb ff ff       	call   2d9c <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    31af:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    31b3:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    31b7:	7e 8e                	jle    3147 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    31b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    31bd:	8b 45 20             	mov    0x20(%ebp),%eax
    31c0:	83 c0 10             	add    $0x10,%eax
    31c3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    31c6:	0f 8f 72 ff ff ff    	jg     313e <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    31cc:	83 c4 30             	add    $0x30,%esp
    31cf:	5b                   	pop    %ebx
    31d0:	5d                   	pop    %ebp
    31d1:	c3                   	ret    

000031d2 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    31d2:	55                   	push   %ebp
    31d3:	89 e5                	mov    %esp,%ebp
    31d5:	53                   	push   %ebx
    31d6:	83 ec 34             	sub    $0x34,%esp
    31d9:	8b 55 14             	mov    0x14(%ebp),%edx
    31dc:	8b 45 18             	mov    0x18(%ebp),%eax
    31df:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    31e3:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    31e7:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    31eb:	0f b6 c0             	movzbl %al,%eax
    31ee:	3d a0 00 00 00       	cmp    $0xa0,%eax
    31f3:	0f 8e 40 01 00 00    	jle    3339 <put_gbk+0x167>
    31f9:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    31fd:	66 c1 f8 08          	sar    $0x8,%ax
    3201:	98                   	cwtl   
    3202:	0f b6 c0             	movzbl %al,%eax
    3205:	3d a0 00 00 00       	cmp    $0xa0,%eax
    320a:	0f 8e 29 01 00 00    	jle    3339 <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    3210:	a1 e4 36 01 00       	mov    0x136e4,%eax
    3215:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    3218:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    321c:	0f b6 c0             	movzbl %al,%eax
    321f:	2d a1 00 00 00       	sub    $0xa1,%eax
    3224:	6b c0 5e             	imul   $0x5e,%eax,%eax
    3227:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    322b:	66 c1 fa 08          	sar    $0x8,%dx
    322f:	0f bf d2             	movswl %dx,%edx
    3232:	0f b6 d2             	movzbl %dl,%edx
    3235:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    323b:	01 d0                	add    %edx,%eax
    323d:	c1 e0 05             	shl    $0x5,%eax
    3240:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    3243:	8b 45 20             	mov    0x20(%ebp),%eax
    3246:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3249:	e9 da 00 00 00       	jmp    3328 <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    324e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3255:	eb 58                	jmp    32af <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    3257:	8b 45 f0             	mov    -0x10(%ebp),%eax
    325a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    325d:	01 d0                	add    %edx,%eax
    325f:	0f b6 00             	movzbl (%eax),%eax
    3262:	0f b6 d0             	movzbl %al,%edx
    3265:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3268:	89 c1                	mov    %eax,%ecx
    326a:	d3 e2                	shl    %cl,%edx
    326c:	89 d0                	mov    %edx,%eax
    326e:	25 80 00 00 00       	and    $0x80,%eax
    3273:	85 c0                	test   %eax,%eax
    3275:	74 34                	je     32ab <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3277:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    327b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    327e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3281:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3284:	01 d8                	add    %ebx,%eax
    3286:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    328a:	89 54 24 10          	mov    %edx,0x10(%esp)
    328e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3292:	8b 45 08             	mov    0x8(%ebp),%eax
    3295:	89 04 24             	mov    %eax,(%esp)
    3298:	8b 45 0c             	mov    0xc(%ebp),%eax
    329b:	89 44 24 04          	mov    %eax,0x4(%esp)
    329f:	8b 45 10             	mov    0x10(%ebp),%eax
    32a2:	89 44 24 08          	mov    %eax,0x8(%esp)
    32a6:	e8 f1 fa ff ff       	call   2d9c <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    32ab:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    32af:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    32b3:	7e a2                	jle    3257 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    32b5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    32b9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    32c0:	eb 58                	jmp    331a <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    32c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    32c8:	01 d0                	add    %edx,%eax
    32ca:	0f b6 00             	movzbl (%eax),%eax
    32cd:	0f b6 d0             	movzbl %al,%edx
    32d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    32d3:	89 c1                	mov    %eax,%ecx
    32d5:	d3 e2                	shl    %cl,%edx
    32d7:	89 d0                	mov    %edx,%eax
    32d9:	25 80 00 00 00       	and    $0x80,%eax
    32de:	85 c0                	test   %eax,%eax
    32e0:	74 34                	je     3316 <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    32e2:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    32e6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    32e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    32ec:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    32ef:	01 d8                	add    %ebx,%eax
    32f1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    32f5:	89 54 24 10          	mov    %edx,0x10(%esp)
    32f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    32fd:	8b 45 08             	mov    0x8(%ebp),%eax
    3300:	89 04 24             	mov    %eax,(%esp)
    3303:	8b 45 0c             	mov    0xc(%ebp),%eax
    3306:	89 44 24 04          	mov    %eax,0x4(%esp)
    330a:	8b 45 10             	mov    0x10(%ebp),%eax
    330d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3311:	e8 86 fa ff ff       	call   2d9c <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3316:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    331a:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    331e:	7e a2                	jle    32c2 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    3320:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    3324:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3328:	8b 45 20             	mov    0x20(%ebp),%eax
    332b:	83 c0 10             	add    $0x10,%eax
    332e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3331:	0f 8f 17 ff ff ff    	jg     324e <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    3337:	eb 7b                	jmp    33b4 <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    3339:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    333d:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3341:	0f b6 c0             	movzbl %al,%eax
    3344:	8b 4d 20             	mov    0x20(%ebp),%ecx
    3347:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    334b:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    334e:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3352:	89 54 24 10          	mov    %edx,0x10(%esp)
    3356:	89 44 24 0c          	mov    %eax,0xc(%esp)
    335a:	8b 45 08             	mov    0x8(%ebp),%eax
    335d:	89 04 24             	mov    %eax,(%esp)
    3360:	8b 45 0c             	mov    0xc(%ebp),%eax
    3363:	89 44 24 04          	mov    %eax,0x4(%esp)
    3367:	8b 45 10             	mov    0x10(%ebp),%eax
    336a:	89 44 24 08          	mov    %eax,0x8(%esp)
    336e:	e8 af fd ff ff       	call   3122 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    3373:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3376:	8d 58 08             	lea    0x8(%eax),%ebx
    3379:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    337d:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3381:	66 c1 f8 08          	sar    $0x8,%ax
    3385:	0f b6 c0             	movzbl %al,%eax
    3388:	8b 4d 20             	mov    0x20(%ebp),%ecx
    338b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    338f:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    3393:	89 54 24 10          	mov    %edx,0x10(%esp)
    3397:	89 44 24 0c          	mov    %eax,0xc(%esp)
    339b:	8b 45 08             	mov    0x8(%ebp),%eax
    339e:	89 04 24             	mov    %eax,(%esp)
    33a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    33a4:	89 44 24 04          	mov    %eax,0x4(%esp)
    33a8:	8b 45 10             	mov    0x10(%ebp),%eax
    33ab:	89 44 24 08          	mov    %eax,0x8(%esp)
    33af:	e8 6e fd ff ff       	call   3122 <put_ascii>
	}
}
    33b4:	83 c4 34             	add    $0x34,%esp
    33b7:	5b                   	pop    %ebx
    33b8:	5d                   	pop    %ebp
    33b9:	c3                   	ret    

000033ba <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    33ba:	55                   	push   %ebp
    33bb:	89 e5                	mov    %esp,%ebp
    33bd:	83 ec 38             	sub    $0x38,%esp
    33c0:	8b 45 18             	mov    0x18(%ebp),%eax
    33c3:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    33c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    33ce:	8b 45 14             	mov    0x14(%ebp),%eax
    33d1:	89 04 24             	mov    %eax,(%esp)
    33d4:	e8 aa 15 00 00       	call   4983 <strlen>
    33d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    33dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    33e3:	8b 45 1c             	mov    0x1c(%ebp),%eax
    33e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    33e9:	eb 49                	jmp    3434 <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    33eb:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    33ef:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    33f2:	8b 45 14             	mov    0x14(%ebp),%eax
    33f5:	01 c8                	add    %ecx,%eax
    33f7:	0f b6 00             	movzbl (%eax),%eax
    33fa:	0f b6 c0             	movzbl %al,%eax
    33fd:	8b 4d 20             	mov    0x20(%ebp),%ecx
    3400:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3404:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    3407:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    340b:	89 54 24 10          	mov    %edx,0x10(%esp)
    340f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3413:	8b 45 08             	mov    0x8(%ebp),%eax
    3416:	89 04 24             	mov    %eax,(%esp)
    3419:	8b 45 0c             	mov    0xc(%ebp),%eax
    341c:	89 44 24 04          	mov    %eax,0x4(%esp)
    3420:	8b 45 10             	mov    0x10(%ebp),%eax
    3423:	89 44 24 08          	mov    %eax,0x8(%esp)
    3427:	e8 f6 fc ff ff       	call   3122 <put_ascii>
			xTmp += 8;
    342c:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    3430:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    3434:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3437:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    343a:	72 af                	jb     33eb <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    343c:	c9                   	leave  
    343d:	c3                   	ret    

0000343e <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    343e:	55                   	push   %ebp
    343f:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    3441:	8b 45 10             	mov    0x10(%ebp),%eax
    3444:	8d 50 07             	lea    0x7(%eax),%edx
    3447:	85 c0                	test   %eax,%eax
    3449:	0f 48 c2             	cmovs  %edx,%eax
    344c:	c1 f8 03             	sar    $0x3,%eax
    344f:	89 c2                	mov    %eax,%edx
    3451:	8b 45 0c             	mov    0xc(%ebp),%eax
    3454:	8d 48 03             	lea    0x3(%eax),%ecx
    3457:	85 c0                	test   %eax,%eax
    3459:	0f 48 c1             	cmovs  %ecx,%eax
    345c:	c1 f8 02             	sar    $0x2,%eax
    345f:	c1 e0 05             	shl    $0x5,%eax
    3462:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    3465:	8b 45 08             	mov    0x8(%ebp),%eax
    3468:	8d 50 07             	lea    0x7(%eax),%edx
    346b:	85 c0                	test   %eax,%eax
    346d:	0f 48 c2             	cmovs  %edx,%eax
    3470:	c1 f8 03             	sar    $0x3,%eax
    3473:	c1 e0 0b             	shl    $0xb,%eax
    3476:	01 c8                	add    %ecx,%eax
}
    3478:	5d                   	pop    %ebp
    3479:	c3                   	ret    

0000347a <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    347a:	55                   	push   %ebp
    347b:	89 e5                	mov    %esp,%ebp
    347d:	53                   	push   %ebx
    347e:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    3481:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3488:	e9 b1 00 00 00       	jmp    353e <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    348d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3494:	e9 95 00 00 00       	jmp    352e <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    3499:	8b 55 14             	mov    0x14(%ebp),%edx
    349c:	8b 45 18             	mov    0x18(%ebp),%eax
    349f:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    34a3:	89 c1                	mov    %eax,%ecx
    34a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34a8:	01 c8                	add    %ecx,%eax
    34aa:	c1 e0 02             	shl    $0x2,%eax
    34ad:	01 d0                	add    %edx,%eax
    34af:	8b 00                	mov    (%eax),%eax
    34b1:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    34b4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    34b8:	3c 01                	cmp    $0x1,%al
    34ba:	75 02                	jne    34be <draw_picture+0x44>
    34bc:	eb 6c                	jmp    352a <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    34be:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    34c2:	0f b6 c8             	movzbl %al,%ecx
    34c5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    34c9:	0f b6 d0             	movzbl %al,%edx
    34cc:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    34d0:	0f b6 c0             	movzbl %al,%eax
    34d3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    34d7:	89 54 24 04          	mov    %edx,0x4(%esp)
    34db:	89 04 24             	mov    %eax,(%esp)
    34de:	e8 5b ff ff ff       	call   343e <_RGB16BIT565>
    34e3:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    34e7:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    34eb:	8b 45 1c             	mov    0x1c(%ebp),%eax
    34ee:	83 e8 01             	sub    $0x1,%eax
    34f1:	2b 45 f8             	sub    -0x8(%ebp),%eax
    34f4:	89 c2                	mov    %eax,%edx
    34f6:	8b 45 24             	mov    0x24(%ebp),%eax
    34f9:	01 d0                	add    %edx,%eax
    34fb:	89 c2                	mov    %eax,%edx
    34fd:	8b 45 20             	mov    0x20(%ebp),%eax
    3500:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3503:	01 d8                	add    %ebx,%eax
    3505:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3509:	89 54 24 10          	mov    %edx,0x10(%esp)
    350d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3511:	8b 45 08             	mov    0x8(%ebp),%eax
    3514:	89 04 24             	mov    %eax,(%esp)
    3517:	8b 45 0c             	mov    0xc(%ebp),%eax
    351a:	89 44 24 04          	mov    %eax,0x4(%esp)
    351e:	8b 45 10             	mov    0x10(%ebp),%eax
    3521:	89 44 24 08          	mov    %eax,0x8(%esp)
    3525:	e8 72 f8 ff ff       	call   2d9c <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    352a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    352e:	8b 45 18             	mov    0x18(%ebp),%eax
    3531:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3534:	0f 8f 5f ff ff ff    	jg     3499 <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    353a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    353e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3541:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3544:	0f 8f 43 ff ff ff    	jg     348d <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    354a:	83 c4 28             	add    $0x28,%esp
    354d:	5b                   	pop    %ebx
    354e:	5d                   	pop    %ebp
    354f:	c3                   	ret    

00003550 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    3550:	55                   	push   %ebp
    3551:	89 e5                	mov    %esp,%ebp
    3553:	83 ec 3c             	sub    $0x3c,%esp
    3556:	8b 45 24             	mov    0x24(%ebp),%eax
    3559:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    355d:	8b 45 14             	mov    0x14(%ebp),%eax
    3560:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3563:	29 c2                	sub    %eax,%edx
    3565:	89 d0                	mov    %edx,%eax
    3567:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    356a:	8b 45 18             	mov    0x18(%ebp),%eax
    356d:	8b 55 20             	mov    0x20(%ebp),%edx
    3570:	29 c2                	sub    %eax,%edx
    3572:	89 d0                	mov    %edx,%eax
    3574:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    3577:	8b 45 14             	mov    0x14(%ebp),%eax
    357a:	c1 e0 0a             	shl    $0xa,%eax
    357d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    3580:	8b 45 18             	mov    0x18(%ebp),%eax
    3583:	c1 e0 0a             	shl    $0xa,%eax
    3586:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    3589:	8b 45 fc             	mov    -0x4(%ebp),%eax
    358c:	c1 f8 1f             	sar    $0x1f,%eax
    358f:	31 45 fc             	xor    %eax,-0x4(%ebp)
    3592:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    3595:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3598:	c1 f8 1f             	sar    $0x1f,%eax
    359b:	31 45 f8             	xor    %eax,-0x8(%ebp)
    359e:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    35a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    35a4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    35a7:	7c 57                	jl     3600 <draw_line+0xb0>
		len = dx + 1;
    35a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    35ac:	83 c0 01             	add    $0x1,%eax
    35af:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    35b2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    35b5:	3b 45 14             	cmp    0x14(%ebp),%eax
    35b8:	7e 07                	jle    35c1 <draw_line+0x71>
    35ba:	b8 00 04 00 00       	mov    $0x400,%eax
    35bf:	eb 05                	jmp    35c6 <draw_line+0x76>
    35c1:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    35c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    35c9:	8b 45 20             	mov    0x20(%ebp),%eax
    35cc:	3b 45 18             	cmp    0x18(%ebp),%eax
    35cf:	7c 16                	jl     35e7 <draw_line+0x97>
    35d1:	8b 45 18             	mov    0x18(%ebp),%eax
    35d4:	8b 55 20             	mov    0x20(%ebp),%edx
    35d7:	29 c2                	sub    %eax,%edx
    35d9:	89 d0                	mov    %edx,%eax
    35db:	83 c0 01             	add    $0x1,%eax
    35de:	c1 e0 0a             	shl    $0xa,%eax
    35e1:	99                   	cltd   
    35e2:	f7 7d ec             	idivl  -0x14(%ebp)
    35e5:	eb 14                	jmp    35fb <draw_line+0xab>
    35e7:	8b 45 18             	mov    0x18(%ebp),%eax
    35ea:	8b 55 20             	mov    0x20(%ebp),%edx
    35ed:	29 c2                	sub    %eax,%edx
    35ef:	89 d0                	mov    %edx,%eax
    35f1:	83 e8 01             	sub    $0x1,%eax
    35f4:	c1 e0 0a             	shl    $0xa,%eax
    35f7:	99                   	cltd   
    35f8:	f7 7d ec             	idivl  -0x14(%ebp)
    35fb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    35fe:	eb 55                	jmp    3655 <draw_line+0x105>
	}
	else {
		len = dy + 1;
    3600:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3603:	83 c0 01             	add    $0x1,%eax
    3606:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    3609:	8b 45 20             	mov    0x20(%ebp),%eax
    360c:	3b 45 18             	cmp    0x18(%ebp),%eax
    360f:	7e 07                	jle    3618 <draw_line+0xc8>
    3611:	b8 00 04 00 00       	mov    $0x400,%eax
    3616:	eb 05                	jmp    361d <draw_line+0xcd>
    3618:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    361d:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    3620:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3623:	3b 45 14             	cmp    0x14(%ebp),%eax
    3626:	7c 16                	jl     363e <draw_line+0xee>
    3628:	8b 45 14             	mov    0x14(%ebp),%eax
    362b:	8b 55 1c             	mov    0x1c(%ebp),%edx
    362e:	29 c2                	sub    %eax,%edx
    3630:	89 d0                	mov    %edx,%eax
    3632:	83 c0 01             	add    $0x1,%eax
    3635:	c1 e0 0a             	shl    $0xa,%eax
    3638:	99                   	cltd   
    3639:	f7 7d ec             	idivl  -0x14(%ebp)
    363c:	eb 14                	jmp    3652 <draw_line+0x102>
    363e:	8b 45 14             	mov    0x14(%ebp),%eax
    3641:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3644:	29 c2                	sub    %eax,%edx
    3646:	89 d0                	mov    %edx,%eax
    3648:	83 e8 01             	sub    $0x1,%eax
    364b:	c1 e0 0a             	shl    $0xa,%eax
    364e:	99                   	cltd   
    364f:	f7 7d ec             	idivl  -0x14(%ebp)
    3652:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    3655:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    365c:	eb 47                	jmp    36a5 <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    365e:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    3662:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3665:	c1 f8 0a             	sar    $0xa,%eax
    3668:	89 c2                	mov    %eax,%edx
    366a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    366d:	c1 f8 0a             	sar    $0xa,%eax
    3670:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3674:	89 54 24 10          	mov    %edx,0x10(%esp)
    3678:	89 44 24 0c          	mov    %eax,0xc(%esp)
    367c:	8b 45 08             	mov    0x8(%ebp),%eax
    367f:	89 04 24             	mov    %eax,(%esp)
    3682:	8b 45 0c             	mov    0xc(%ebp),%eax
    3685:	89 44 24 04          	mov    %eax,0x4(%esp)
    3689:	8b 45 10             	mov    0x10(%ebp),%eax
    368c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3690:	e8 07 f7 ff ff       	call   2d9c <draw_point>
		y += dy;
    3695:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3698:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    369b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    369e:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    36a1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    36a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    36a8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    36ab:	7c b1                	jl     365e <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    36ad:	c9                   	leave  
    36ae:	c3                   	ret    

000036af <draw_window>:

void
draw_window(Context c, char *title)
{
    36af:	55                   	push   %ebp
    36b0:	89 e5                	mov    %esp,%ebp
    36b2:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    36b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    36b8:	83 e8 01             	sub    $0x1,%eax
    36bb:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    36c2:	00 
    36c3:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    36ca:	00 
    36cb:	89 44 24 14          	mov    %eax,0x14(%esp)
    36cf:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    36d6:	00 
    36d7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    36de:	00 
    36df:	8b 45 08             	mov    0x8(%ebp),%eax
    36e2:	89 04 24             	mov    %eax,(%esp)
    36e5:	8b 45 0c             	mov    0xc(%ebp),%eax
    36e8:	89 44 24 04          	mov    %eax,0x4(%esp)
    36ec:	8b 45 10             	mov    0x10(%ebp),%eax
    36ef:	89 44 24 08          	mov    %eax,0x8(%esp)
    36f3:	e8 58 fe ff ff       	call   3550 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    36f8:	8b 45 10             	mov    0x10(%ebp),%eax
    36fb:	8d 48 ff             	lea    -0x1(%eax),%ecx
    36fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    3701:	8d 50 ff             	lea    -0x1(%eax),%edx
    3704:	8b 45 0c             	mov    0xc(%ebp),%eax
    3707:	83 e8 01             	sub    $0x1,%eax
    370a:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3711:	00 
    3712:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3716:	89 54 24 14          	mov    %edx,0x14(%esp)
    371a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    3721:	00 
    3722:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3726:	8b 45 08             	mov    0x8(%ebp),%eax
    3729:	89 04 24             	mov    %eax,(%esp)
    372c:	8b 45 0c             	mov    0xc(%ebp),%eax
    372f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3733:	8b 45 10             	mov    0x10(%ebp),%eax
    3736:	89 44 24 08          	mov    %eax,0x8(%esp)
    373a:	e8 11 fe ff ff       	call   3550 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    373f:	8b 45 10             	mov    0x10(%ebp),%eax
    3742:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3745:	8b 45 10             	mov    0x10(%ebp),%eax
    3748:	8d 50 ff             	lea    -0x1(%eax),%edx
    374b:	8b 45 0c             	mov    0xc(%ebp),%eax
    374e:	83 e8 01             	sub    $0x1,%eax
    3751:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3758:	00 
    3759:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    375d:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3764:	00 
    3765:	89 54 24 10          	mov    %edx,0x10(%esp)
    3769:	89 44 24 0c          	mov    %eax,0xc(%esp)
    376d:	8b 45 08             	mov    0x8(%ebp),%eax
    3770:	89 04 24             	mov    %eax,(%esp)
    3773:	8b 45 0c             	mov    0xc(%ebp),%eax
    3776:	89 44 24 04          	mov    %eax,0x4(%esp)
    377a:	8b 45 10             	mov    0x10(%ebp),%eax
    377d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3781:	e8 ca fd ff ff       	call   3550 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    3786:	8b 45 10             	mov    0x10(%ebp),%eax
    3789:	83 e8 01             	sub    $0x1,%eax
    378c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3793:	00 
    3794:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    379b:	00 
    379c:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    37a3:	00 
    37a4:	89 44 24 10          	mov    %eax,0x10(%esp)
    37a8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    37af:	00 
    37b0:	8b 45 08             	mov    0x8(%ebp),%eax
    37b3:	89 04 24             	mov    %eax,(%esp)
    37b6:	8b 45 0c             	mov    0xc(%ebp),%eax
    37b9:	89 44 24 04          	mov    %eax,0x4(%esp)
    37bd:	8b 45 10             	mov    0x10(%ebp),%eax
    37c0:	89 44 24 08          	mov    %eax,0x8(%esp)
    37c4:	e8 87 fd ff ff       	call   3550 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    37c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    37cc:	83 e8 02             	sub    $0x2,%eax
    37cf:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    37d6:	00 
    37d7:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    37de:	00 
    37df:	89 44 24 14          	mov    %eax,0x14(%esp)
    37e3:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    37ea:	00 
    37eb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    37f2:	00 
    37f3:	8b 45 08             	mov    0x8(%ebp),%eax
    37f6:	89 04 24             	mov    %eax,(%esp)
    37f9:	8b 45 0c             	mov    0xc(%ebp),%eax
    37fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    3800:	8b 45 10             	mov    0x10(%ebp),%eax
    3803:	89 44 24 08          	mov    %eax,0x8(%esp)
    3807:	e8 cf f5 ff ff       	call   2ddb <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    380c:	8b 45 0c             	mov    0xc(%ebp),%eax
    380f:	83 e8 02             	sub    $0x2,%eax
    3812:	89 c2                	mov    %eax,%edx
    3814:	8b 45 10             	mov    0x10(%ebp),%eax
    3817:	83 e8 15             	sub    $0x15,%eax
    381a:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    3821:	00 
    3822:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    3829:	00 
    382a:	89 54 24 14          	mov    %edx,0x14(%esp)
    382e:	89 44 24 10          	mov    %eax,0x10(%esp)
    3832:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3839:	00 
    383a:	8b 45 08             	mov    0x8(%ebp),%eax
    383d:	89 04 24             	mov    %eax,(%esp)
    3840:	8b 45 0c             	mov    0xc(%ebp),%eax
    3843:	89 44 24 04          	mov    %eax,0x4(%esp)
    3847:	8b 45 10             	mov    0x10(%ebp),%eax
    384a:	89 44 24 08          	mov    %eax,0x8(%esp)
    384e:	e8 88 f5 ff ff       	call   2ddb <fill_rect>

  loadBitmap(&pic, "close.bmp");
    3853:	c7 44 24 04 13 b8 00 	movl   $0xb813,0x4(%esp)
    385a:	00 
    385b:	8d 45 ec             	lea    -0x14(%ebp),%eax
    385e:	89 04 24             	mov    %eax,(%esp)
    3861:	e8 44 01 00 00       	call   39aa <loadBitmap>
  draw_picture(c, pic, 3, 3);
    3866:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    386d:	00 
    386e:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    3875:	00 
    3876:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3879:	89 44 24 0c          	mov    %eax,0xc(%esp)
    387d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3880:	89 44 24 10          	mov    %eax,0x10(%esp)
    3884:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3887:	89 44 24 14          	mov    %eax,0x14(%esp)
    388b:	8b 45 08             	mov    0x8(%ebp),%eax
    388e:	89 04 24             	mov    %eax,(%esp)
    3891:	8b 45 0c             	mov    0xc(%ebp),%eax
    3894:	89 44 24 04          	mov    %eax,0x4(%esp)
    3898:	8b 45 10             	mov    0x10(%ebp),%eax
    389b:	89 44 24 08          	mov    %eax,0x8(%esp)
    389f:	e8 d6 fb ff ff       	call   347a <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    38a4:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    38ab:	00 
    38ac:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    38b3:	00 
    38b4:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    38bb:	00 
    38bc:	8b 45 14             	mov    0x14(%ebp),%eax
    38bf:	89 44 24 0c          	mov    %eax,0xc(%esp)
    38c3:	8b 45 08             	mov    0x8(%ebp),%eax
    38c6:	89 04 24             	mov    %eax,(%esp)
    38c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    38cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    38d0:	8b 45 10             	mov    0x10(%ebp),%eax
    38d3:	89 44 24 08          	mov    %eax,0x8(%esp)
    38d7:	e8 de fa ff ff       	call   33ba <puts_str>
  freepic(&pic);
    38dc:	8d 45 ec             	lea    -0x14(%ebp),%eax
    38df:	89 04 24             	mov    %eax,(%esp)
    38e2:	e8 6f 06 00 00       	call   3f56 <freepic>
}
    38e7:	c9                   	leave  
    38e8:	c3                   	ret    

000038e9 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    38e9:	55                   	push   %ebp
    38ea:	89 e5                	mov    %esp,%ebp
    38ec:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    38ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    38f6:	eb 29                	jmp    3921 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    38f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38fb:	6b d0 34             	imul   $0x34,%eax,%edx
    38fe:	8b 45 08             	mov    0x8(%ebp),%eax
    3901:	01 d0                	add    %edx,%eax
    3903:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3906:	6b ca 34             	imul   $0x34,%edx,%ecx
    3909:	8b 55 08             	mov    0x8(%ebp),%edx
    390c:	01 ca                	add    %ecx,%edx
    390e:	83 c2 28             	add    $0x28,%edx
    3911:	89 44 24 04          	mov    %eax,0x4(%esp)
    3915:	89 14 24             	mov    %edx,(%esp)
    3918:	e8 8d 00 00 00       	call   39aa <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    391d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3921:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3924:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3927:	7c cf                	jl     38f8 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    3929:	c9                   	leave  
    392a:	c3                   	ret    

0000392b <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    392b:	55                   	push   %ebp
    392c:	89 e5                	mov    %esp,%ebp
    392e:	53                   	push   %ebx
    392f:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    3932:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3939:	eb 61                	jmp    399c <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    393b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    393e:	6b d0 34             	imul   $0x34,%eax,%edx
    3941:	8b 45 14             	mov    0x14(%ebp),%eax
    3944:	01 d0                	add    %edx,%eax
    3946:	8b 48 24             	mov    0x24(%eax),%ecx
    3949:	8b 45 f8             	mov    -0x8(%ebp),%eax
    394c:	6b d0 34             	imul   $0x34,%eax,%edx
    394f:	8b 45 14             	mov    0x14(%ebp),%eax
    3952:	01 d0                	add    %edx,%eax
    3954:	8b 50 20             	mov    0x20(%eax),%edx
    3957:	8b 45 f8             	mov    -0x8(%ebp),%eax
    395a:	6b d8 34             	imul   $0x34,%eax,%ebx
    395d:	8b 45 14             	mov    0x14(%ebp),%eax
    3960:	01 d8                	add    %ebx,%eax
    3962:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    3966:	89 54 24 18          	mov    %edx,0x18(%esp)
    396a:	8b 50 28             	mov    0x28(%eax),%edx
    396d:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3971:	8b 50 2c             	mov    0x2c(%eax),%edx
    3974:	89 54 24 10          	mov    %edx,0x10(%esp)
    3978:	8b 40 30             	mov    0x30(%eax),%eax
    397b:	89 44 24 14          	mov    %eax,0x14(%esp)
    397f:	8b 45 08             	mov    0x8(%ebp),%eax
    3982:	89 04 24             	mov    %eax,(%esp)
    3985:	8b 45 0c             	mov    0xc(%ebp),%eax
    3988:	89 44 24 04          	mov    %eax,0x4(%esp)
    398c:	8b 45 10             	mov    0x10(%ebp),%eax
    398f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3993:	e8 e2 fa ff ff       	call   347a <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    3998:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    399c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    399f:	3b 45 18             	cmp    0x18(%ebp),%eax
    39a2:	7c 97                	jl     393b <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    39a4:	83 c4 30             	add    $0x30,%esp
    39a7:	5b                   	pop    %ebx
    39a8:	5d                   	pop    %ebp
    39a9:	c3                   	ret    

000039aa <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    39aa:	55                   	push   %ebp
    39ab:	89 e5                	mov    %esp,%ebp
    39ad:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    39b3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    39ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    39c1:	00 
    39c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    39c5:	89 04 24             	mov    %eax,(%esp)
    39c8:	e8 ca 11 00 00       	call   4b97 <open>
    39cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    39d0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    39d4:	79 20                	jns    39f6 <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    39d6:	8b 45 0c             	mov    0xc(%ebp),%eax
    39d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    39dd:	c7 44 24 04 20 b8 00 	movl   $0xb820,0x4(%esp)
    39e4:	00 
    39e5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    39ec:	e8 4e 13 00 00       	call   4d3f <printf>
		return;
    39f1:	e9 ef 02 00 00       	jmp    3ce5 <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    39f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    39f9:	89 44 24 08          	mov    %eax,0x8(%esp)
    39fd:	c7 44 24 04 30 b8 00 	movl   $0xb830,0x4(%esp)
    3a04:	00 
    3a05:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a0c:	e8 2e 13 00 00       	call   4d3f <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    3a11:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    3a18:	e8 0e 16 00 00       	call   502b <malloc>
    3a1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    3a20:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    3a27:	00 
    3a28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a2b:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a2f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3a32:	89 04 24             	mov    %eax,(%esp)
    3a35:	e8 35 11 00 00       	call   4b6f <read>
    3a3a:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    3a3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a40:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    3a43:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3a46:	0f b7 00             	movzwl (%eax),%eax
    3a49:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    3a4d:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    3a51:	66 3d 42 4d          	cmp    $0x4d42,%ax
    3a55:	74 19                	je     3a70 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    3a57:	c7 44 24 04 44 b8 00 	movl   $0xb844,0x4(%esp)
    3a5e:	00 
    3a5f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a66:	e8 d4 12 00 00       	call   4d3f <printf>
		return;
    3a6b:	e9 75 02 00 00       	jmp    3ce5 <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    3a70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a73:	83 c0 02             	add    $0x2,%eax
    3a76:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    3a79:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3a7c:	8b 00                	mov    (%eax),%eax
    3a7e:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3a81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a84:	83 c0 06             	add    $0x6,%eax
    3a87:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    3a8a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3a8d:	0f b7 00             	movzwl (%eax),%eax
    3a90:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3a94:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a97:	83 c0 08             	add    $0x8,%eax
    3a9a:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    3a9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3aa0:	0f b7 00             	movzwl (%eax),%eax
    3aa3:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3aa7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3aaa:	83 c0 0a             	add    $0xa,%eax
    3aad:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    3ab0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3ab3:	8b 00                	mov    (%eax),%eax
    3ab5:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    3ab8:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    3abf:	00 
    3ac0:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3ac3:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ac7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3aca:	89 04 24             	mov    %eax,(%esp)
    3acd:	e8 9d 10 00 00       	call   4b6f <read>
	width = bitInfoHead.biWidth;
    3ad2:	8b 45 88             	mov    -0x78(%ebp),%eax
    3ad5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    3ad8:	8b 45 8c             	mov    -0x74(%ebp),%eax
    3adb:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    3ade:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3ae1:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    3ae5:	c1 e0 02             	shl    $0x2,%eax
    3ae8:	89 44 24 10          	mov    %eax,0x10(%esp)
    3aec:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3aef:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3af3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3af6:	89 44 24 08          	mov    %eax,0x8(%esp)
    3afa:	c7 44 24 04 5c b8 00 	movl   $0xb85c,0x4(%esp)
    3b01:	00 
    3b02:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b09:	e8 31 12 00 00       	call   4d3f <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    3b0e:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3b12:	75 14                	jne    3b28 <loadBitmap+0x17e>
		printf(0, "0");
    3b14:	c7 44 24 04 81 b8 00 	movl   $0xb881,0x4(%esp)
    3b1b:	00 
    3b1c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b23:	e8 17 12 00 00       	call   4d3f <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    3b28:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3b2c:	0f b7 c0             	movzwl %ax,%eax
    3b2f:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    3b33:	83 c0 1f             	add    $0x1f,%eax
    3b36:	8d 50 1f             	lea    0x1f(%eax),%edx
    3b39:	85 c0                	test   %eax,%eax
    3b3b:	0f 48 c2             	cmovs  %edx,%eax
    3b3e:	c1 f8 05             	sar    $0x5,%eax
    3b41:	c1 e0 02             	shl    $0x2,%eax
    3b44:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    3b47:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b4a:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3b4e:	89 04 24             	mov    %eax,(%esp)
    3b51:	e8 d5 14 00 00       	call   502b <malloc>
    3b56:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    3b59:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3b5c:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3b5f:	0f af c2             	imul   %edx,%eax
    3b62:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b66:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3b6d:	00 
    3b6e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3b71:	89 04 24             	mov    %eax,(%esp)
    3b74:	e8 31 0e 00 00       	call   49aa <memset>
	long nData = height * l_width;
    3b79:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b7c:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3b80:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    3b83:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3b86:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b8a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3b8d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b91:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3b94:	89 04 24             	mov    %eax,(%esp)
    3b97:	e8 d3 0f 00 00       	call   4b6f <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    3b9c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3b9f:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    3ba3:	c1 e0 02             	shl    $0x2,%eax
    3ba6:	89 04 24             	mov    %eax,(%esp)
    3ba9:	e8 7d 14 00 00       	call   502b <malloc>
    3bae:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    3bb1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3bb4:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3bb7:	0f af c2             	imul   %edx,%eax
    3bba:	c1 e0 02             	shl    $0x2,%eax
    3bbd:	89 44 24 08          	mov    %eax,0x8(%esp)
    3bc1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3bc8:	00 
    3bc9:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3bcc:	89 04 24             	mov    %eax,(%esp)
    3bcf:	e8 d6 0d 00 00       	call   49aa <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    3bd4:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3bd8:	66 83 f8 17          	cmp    $0x17,%ax
    3bdc:	77 19                	ja     3bf7 <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    3bde:	c7 44 24 04 84 b8 00 	movl   $0xb884,0x4(%esp)
    3be5:	00 
    3be6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3bed:	e8 4d 11 00 00       	call   4d3f <printf>
		return;
    3bf2:	e9 ee 00 00 00       	jmp    3ce5 <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    3bf7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    3bfe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3c05:	e9 94 00 00 00       	jmp    3c9e <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    3c0a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3c11:	eb 7b                	jmp    3c8e <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    3c13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c16:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3c1a:	89 c1                	mov    %eax,%ecx
    3c1c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3c1f:	89 d0                	mov    %edx,%eax
    3c21:	01 c0                	add    %eax,%eax
    3c23:	01 d0                	add    %edx,%eax
    3c25:	01 c8                	add    %ecx,%eax
    3c27:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    3c2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c2d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3c34:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3c37:	01 c2                	add    %eax,%edx
    3c39:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3c3c:	8d 48 02             	lea    0x2(%eax),%ecx
    3c3f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3c42:	01 c8                	add    %ecx,%eax
    3c44:	0f b6 00             	movzbl (%eax),%eax
    3c47:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    3c4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c4d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3c54:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3c57:	01 c2                	add    %eax,%edx
    3c59:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3c5c:	8d 48 01             	lea    0x1(%eax),%ecx
    3c5f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3c62:	01 c8                	add    %ecx,%eax
    3c64:	0f b6 00             	movzbl (%eax),%eax
    3c67:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    3c6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c6d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3c74:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3c77:	01 c2                	add    %eax,%edx
    3c79:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    3c7c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3c7f:	01 c8                	add    %ecx,%eax
    3c81:	0f b6 00             	movzbl (%eax),%eax
    3c84:	88 02                	mov    %al,(%edx)
				index++;
    3c86:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    3c8a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3c8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c91:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    3c94:	0f 8c 79 ff ff ff    	jl     3c13 <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    3c9a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3c9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ca1:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    3ca4:	0f 8c 60 ff ff ff    	jl     3c0a <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    3caa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3cad:	89 04 24             	mov    %eax,(%esp)
    3cb0:	e8 ca 0e 00 00       	call   4b7f <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    3cb5:	8b 45 08             	mov    0x8(%ebp),%eax
    3cb8:	8b 55 c0             	mov    -0x40(%ebp),%edx
    3cbb:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    3cbd:	8b 45 08             	mov    0x8(%ebp),%eax
    3cc0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3cc3:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    3cc6:	8b 45 08             	mov    0x8(%ebp),%eax
    3cc9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3ccc:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    3ccf:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3cd2:	89 04 24             	mov    %eax,(%esp)
    3cd5:	e8 18 12 00 00       	call   4ef2 <free>
	free(BmpFileHeader);
    3cda:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3cdd:	89 04 24             	mov    %eax,(%esp)
    3ce0:	e8 0d 12 00 00       	call   4ef2 <free>
	//printf("\n");
}
    3ce5:	c9                   	leave  
    3ce6:	c3                   	ret    

00003ce7 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    3ce7:	55                   	push   %ebp
    3ce8:	89 e5                	mov    %esp,%ebp
    3cea:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    3ced:	c7 44 24 04 a4 b8 00 	movl   $0xb8a4,0x4(%esp)
    3cf4:	00 
    3cf5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3cfc:	e8 3e 10 00 00       	call   4d3f <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    3d01:	8b 45 08             	mov    0x8(%ebp),%eax
    3d04:	0f b7 00             	movzwl (%eax),%eax
    3d07:	0f b7 c0             	movzwl %ax,%eax
    3d0a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3d0e:	c7 44 24 04 b6 b8 00 	movl   $0xb8b6,0x4(%esp)
    3d15:	00 
    3d16:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d1d:	e8 1d 10 00 00       	call   4d3f <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    3d22:	8b 45 08             	mov    0x8(%ebp),%eax
    3d25:	8b 40 04             	mov    0x4(%eax),%eax
    3d28:	89 44 24 08          	mov    %eax,0x8(%esp)
    3d2c:	c7 44 24 04 d4 b8 00 	movl   $0xb8d4,0x4(%esp)
    3d33:	00 
    3d34:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d3b:	e8 ff 0f 00 00       	call   4d3f <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    3d40:	8b 45 08             	mov    0x8(%ebp),%eax
    3d43:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    3d47:	0f b7 c0             	movzwl %ax,%eax
    3d4a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3d4e:	c7 44 24 04 e5 b8 00 	movl   $0xb8e5,0x4(%esp)
    3d55:	00 
    3d56:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d5d:	e8 dd 0f 00 00       	call   4d3f <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    3d62:	8b 45 08             	mov    0x8(%ebp),%eax
    3d65:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    3d69:	0f b7 c0             	movzwl %ax,%eax
    3d6c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3d70:	c7 44 24 04 e5 b8 00 	movl   $0xb8e5,0x4(%esp)
    3d77:	00 
    3d78:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d7f:	e8 bb 0f 00 00       	call   4d3f <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    3d84:	8b 45 08             	mov    0x8(%ebp),%eax
    3d87:	8b 40 0c             	mov    0xc(%eax),%eax
    3d8a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3d8e:	c7 44 24 04 f4 b8 00 	movl   $0xb8f4,0x4(%esp)
    3d95:	00 
    3d96:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d9d:	e8 9d 0f 00 00       	call   4d3f <printf>
}
    3da2:	c9                   	leave  
    3da3:	c3                   	ret    

00003da4 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    3da4:	55                   	push   %ebp
    3da5:	89 e5                	mov    %esp,%ebp
    3da7:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    3daa:	c7 44 24 04 1d b9 00 	movl   $0xb91d,0x4(%esp)
    3db1:	00 
    3db2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3db9:	e8 81 0f 00 00       	call   4d3f <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    3dbe:	8b 45 08             	mov    0x8(%ebp),%eax
    3dc1:	8b 00                	mov    (%eax),%eax
    3dc3:	89 44 24 08          	mov    %eax,0x8(%esp)
    3dc7:	c7 44 24 04 2f b9 00 	movl   $0xb92f,0x4(%esp)
    3dce:	00 
    3dcf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3dd6:	e8 64 0f 00 00       	call   4d3f <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    3ddb:	8b 45 08             	mov    0x8(%ebp),%eax
    3dde:	8b 40 04             	mov    0x4(%eax),%eax
    3de1:	89 44 24 08          	mov    %eax,0x8(%esp)
    3de5:	c7 44 24 04 46 b9 00 	movl   $0xb946,0x4(%esp)
    3dec:	00 
    3ded:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3df4:	e8 46 0f 00 00       	call   4d3f <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    3df9:	8b 45 08             	mov    0x8(%ebp),%eax
    3dfc:	8b 40 08             	mov    0x8(%eax),%eax
    3dff:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e03:	c7 44 24 04 54 b9 00 	movl   $0xb954,0x4(%esp)
    3e0a:	00 
    3e0b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e12:	e8 28 0f 00 00       	call   4d3f <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    3e17:	8b 45 08             	mov    0x8(%ebp),%eax
    3e1a:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    3e1e:	0f b7 c0             	movzwl %ax,%eax
    3e21:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e25:	c7 44 24 04 62 b9 00 	movl   $0xb962,0x4(%esp)
    3e2c:	00 
    3e2d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e34:	e8 06 0f 00 00       	call   4d3f <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    3e39:	8b 45 08             	mov    0x8(%ebp),%eax
    3e3c:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    3e40:	0f b7 c0             	movzwl %ax,%eax
    3e43:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e47:	c7 44 24 04 78 b9 00 	movl   $0xb978,0x4(%esp)
    3e4e:	00 
    3e4f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e56:	e8 e4 0e 00 00       	call   4d3f <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    3e5b:	8b 45 08             	mov    0x8(%ebp),%eax
    3e5e:	8b 40 10             	mov    0x10(%eax),%eax
    3e61:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e65:	c7 44 24 04 99 b9 00 	movl   $0xb999,0x4(%esp)
    3e6c:	00 
    3e6d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e74:	e8 c6 0e 00 00       	call   4d3f <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    3e79:	8b 45 08             	mov    0x8(%ebp),%eax
    3e7c:	8b 40 14             	mov    0x14(%eax),%eax
    3e7f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e83:	c7 44 24 04 ac b9 00 	movl   $0xb9ac,0x4(%esp)
    3e8a:	00 
    3e8b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e92:	e8 a8 0e 00 00       	call   4d3f <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    3e97:	8b 45 08             	mov    0x8(%ebp),%eax
    3e9a:	8b 40 18             	mov    0x18(%eax),%eax
    3e9d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ea1:	c7 44 24 04 e0 b9 00 	movl   $0xb9e0,0x4(%esp)
    3ea8:	00 
    3ea9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3eb0:	e8 8a 0e 00 00       	call   4d3f <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    3eb5:	8b 45 08             	mov    0x8(%ebp),%eax
    3eb8:	8b 40 1c             	mov    0x1c(%eax),%eax
    3ebb:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ebf:	c7 44 24 04 f5 b9 00 	movl   $0xb9f5,0x4(%esp)
    3ec6:	00 
    3ec7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ece:	e8 6c 0e 00 00       	call   4d3f <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    3ed3:	8b 45 08             	mov    0x8(%ebp),%eax
    3ed6:	8b 40 20             	mov    0x20(%eax),%eax
    3ed9:	89 44 24 08          	mov    %eax,0x8(%esp)
    3edd:	c7 44 24 04 0a ba 00 	movl   $0xba0a,0x4(%esp)
    3ee4:	00 
    3ee5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3eec:	e8 4e 0e 00 00       	call   4d3f <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    3ef1:	8b 45 08             	mov    0x8(%ebp),%eax
    3ef4:	8b 40 24             	mov    0x24(%eax),%eax
    3ef7:	89 44 24 08          	mov    %eax,0x8(%esp)
    3efb:	c7 44 24 04 21 ba 00 	movl   $0xba21,0x4(%esp)
    3f02:	00 
    3f03:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f0a:	e8 30 0e 00 00       	call   4d3f <printf>
}
    3f0f:	c9                   	leave  
    3f10:	c3                   	ret    

00003f11 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    3f11:	55                   	push   %ebp
    3f12:	89 e5                	mov    %esp,%ebp
    3f14:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    3f17:	8b 45 08             	mov    0x8(%ebp),%eax
    3f1a:	0f b6 00             	movzbl (%eax),%eax
    3f1d:	0f b6 c8             	movzbl %al,%ecx
    3f20:	8b 45 08             	mov    0x8(%ebp),%eax
    3f23:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3f27:	0f b6 d0             	movzbl %al,%edx
    3f2a:	8b 45 08             	mov    0x8(%ebp),%eax
    3f2d:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3f31:	0f b6 c0             	movzbl %al,%eax
    3f34:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3f38:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3f3c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3f40:	c7 44 24 04 35 ba 00 	movl   $0xba35,0x4(%esp)
    3f47:	00 
    3f48:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f4f:	e8 eb 0d 00 00       	call   4d3f <printf>
}
    3f54:	c9                   	leave  
    3f55:	c3                   	ret    

00003f56 <freepic>:

void freepic(PICNODE *pic) {
    3f56:	55                   	push   %ebp
    3f57:	89 e5                	mov    %esp,%ebp
    3f59:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    3f5c:	8b 45 08             	mov    0x8(%ebp),%eax
    3f5f:	8b 00                	mov    (%eax),%eax
    3f61:	89 04 24             	mov    %eax,(%esp)
    3f64:	e8 89 0f 00 00       	call   4ef2 <free>
}
    3f69:	c9                   	leave  
    3f6a:	c3                   	ret    

00003f6b <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    3f6b:	55                   	push   %ebp
    3f6c:	89 e5                	mov    %esp,%ebp
    3f6e:	53                   	push   %ebx
    3f6f:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    3f75:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    3f7c:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3f7f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3f82:	89 54 24 10          	mov    %edx,0x10(%esp)
    3f86:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3f89:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3f8d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3f94:	00 
    3f95:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3f9c:	00 
    3f9d:	89 04 24             	mov    %eax,(%esp)
    3fa0:	e8 80 02 00 00       	call   4225 <initRect>
    3fa5:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    3fa8:	8b 45 08             	mov    0x8(%ebp),%eax
    3fab:	8b 40 04             	mov    0x4(%eax),%eax
    3fae:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3fb1:	89 c2                	mov    %eax,%edx
    3fb3:	8d 45 cc             	lea    -0x34(%ebp),%eax
    3fb6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3fb9:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3fbd:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3fc0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3fc4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3fcb:	00 
    3fcc:	89 54 24 04          	mov    %edx,0x4(%esp)
    3fd0:	89 04 24             	mov    %eax,(%esp)
    3fd3:	e8 4d 02 00 00       	call   4225 <initRect>
    3fd8:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    3fdb:	8b 45 08             	mov    0x8(%ebp),%eax
    3fde:	8b 40 08             	mov    0x8(%eax),%eax
    3fe1:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3fe4:	89 c1                	mov    %eax,%ecx
    3fe6:	8b 45 08             	mov    0x8(%ebp),%eax
    3fe9:	8b 40 04             	mov    0x4(%eax),%eax
    3fec:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3fef:	89 c2                	mov    %eax,%edx
    3ff1:	8d 45 bc             	lea    -0x44(%ebp),%eax
    3ff4:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3ff7:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    3ffb:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3ffe:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    4002:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4006:	89 54 24 04          	mov    %edx,0x4(%esp)
    400a:	89 04 24             	mov    %eax,(%esp)
    400d:	e8 13 02 00 00       	call   4225 <initRect>
    4012:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    4015:	8b 45 08             	mov    0x8(%ebp),%eax
    4018:	8b 40 08             	mov    0x8(%eax),%eax
    401b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    401e:	89 c2                	mov    %eax,%edx
    4020:	8d 45 ac             	lea    -0x54(%ebp),%eax
    4023:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4026:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    402a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    402d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4031:	89 54 24 08          	mov    %edx,0x8(%esp)
    4035:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    403c:	00 
    403d:	89 04 24             	mov    %eax,(%esp)
    4040:	e8 e0 01 00 00       	call   4225 <initRect>
    4045:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    4048:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    404f:	e9 96 01 00 00       	jmp    41ea <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    4054:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    405b:	e9 77 01 00 00       	jmp    41d7 <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    4060:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4063:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4066:	89 54 24 08          	mov    %edx,0x8(%esp)
    406a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    406d:	89 54 24 04          	mov    %edx,0x4(%esp)
    4071:	89 04 24             	mov    %eax,(%esp)
    4074:	e8 85 01 00 00       	call   41fe <initPoint>
    4079:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    407c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    407f:	89 44 24 08          	mov    %eax,0x8(%esp)
    4083:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4086:	89 44 24 0c          	mov    %eax,0xc(%esp)
    408a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    408d:	89 44 24 10          	mov    %eax,0x10(%esp)
    4091:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4094:	89 44 24 14          	mov    %eax,0x14(%esp)
    4098:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    409b:	8b 55 a8             	mov    -0x58(%ebp),%edx
    409e:	89 04 24             	mov    %eax,(%esp)
    40a1:	89 54 24 04          	mov    %edx,0x4(%esp)
    40a5:	e8 d6 01 00 00       	call   4280 <isIn>
    40aa:	85 c0                	test   %eax,%eax
    40ac:	0f 85 9a 00 00 00    	jne    414c <set_icon_alpha+0x1e1>
    40b2:	8b 45 cc             	mov    -0x34(%ebp),%eax
    40b5:	89 44 24 08          	mov    %eax,0x8(%esp)
    40b9:	8b 45 d0             	mov    -0x30(%ebp),%eax
    40bc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    40c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    40c3:	89 44 24 10          	mov    %eax,0x10(%esp)
    40c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    40ca:	89 44 24 14          	mov    %eax,0x14(%esp)
    40ce:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    40d1:	8b 55 a8             	mov    -0x58(%ebp),%edx
    40d4:	89 04 24             	mov    %eax,(%esp)
    40d7:	89 54 24 04          	mov    %edx,0x4(%esp)
    40db:	e8 a0 01 00 00       	call   4280 <isIn>
    40e0:	85 c0                	test   %eax,%eax
    40e2:	75 68                	jne    414c <set_icon_alpha+0x1e1>
    40e4:	8b 45 bc             	mov    -0x44(%ebp),%eax
    40e7:	89 44 24 08          	mov    %eax,0x8(%esp)
    40eb:	8b 45 c0             	mov    -0x40(%ebp),%eax
    40ee:	89 44 24 0c          	mov    %eax,0xc(%esp)
    40f2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    40f5:	89 44 24 10          	mov    %eax,0x10(%esp)
    40f9:	8b 45 c8             	mov    -0x38(%ebp),%eax
    40fc:	89 44 24 14          	mov    %eax,0x14(%esp)
    4100:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4103:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4106:	89 04 24             	mov    %eax,(%esp)
    4109:	89 54 24 04          	mov    %edx,0x4(%esp)
    410d:	e8 6e 01 00 00       	call   4280 <isIn>
    4112:	85 c0                	test   %eax,%eax
    4114:	75 36                	jne    414c <set_icon_alpha+0x1e1>
    4116:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4119:	89 44 24 08          	mov    %eax,0x8(%esp)
    411d:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4120:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4124:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4127:	89 44 24 10          	mov    %eax,0x10(%esp)
    412b:	8b 45 b8             	mov    -0x48(%ebp),%eax
    412e:	89 44 24 14          	mov    %eax,0x14(%esp)
    4132:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4135:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4138:	89 04 24             	mov    %eax,(%esp)
    413b:	89 54 24 04          	mov    %edx,0x4(%esp)
    413f:	e8 3c 01 00 00       	call   4280 <isIn>
    4144:	85 c0                	test   %eax,%eax
    4146:	0f 84 87 00 00 00    	je     41d3 <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    414c:	8b 45 08             	mov    0x8(%ebp),%eax
    414f:	8b 10                	mov    (%eax),%edx
    4151:	8b 45 08             	mov    0x8(%ebp),%eax
    4154:	8b 40 04             	mov    0x4(%eax),%eax
    4157:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    415b:	89 c1                	mov    %eax,%ecx
    415d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4160:	01 c8                	add    %ecx,%eax
    4162:	c1 e0 02             	shl    $0x2,%eax
    4165:	01 d0                	add    %edx,%eax
    4167:	0f b6 00             	movzbl (%eax),%eax
    416a:	3c ff                	cmp    $0xff,%al
    416c:	75 65                	jne    41d3 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    416e:	8b 45 08             	mov    0x8(%ebp),%eax
    4171:	8b 10                	mov    (%eax),%edx
    4173:	8b 45 08             	mov    0x8(%ebp),%eax
    4176:	8b 40 04             	mov    0x4(%eax),%eax
    4179:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    417d:	89 c1                	mov    %eax,%ecx
    417f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4182:	01 c8                	add    %ecx,%eax
    4184:	c1 e0 02             	shl    $0x2,%eax
    4187:	01 d0                	add    %edx,%eax
    4189:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    418d:	3c ff                	cmp    $0xff,%al
    418f:	75 42                	jne    41d3 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    4191:	8b 45 08             	mov    0x8(%ebp),%eax
    4194:	8b 10                	mov    (%eax),%edx
    4196:	8b 45 08             	mov    0x8(%ebp),%eax
    4199:	8b 40 04             	mov    0x4(%eax),%eax
    419c:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    41a0:	89 c1                	mov    %eax,%ecx
    41a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41a5:	01 c8                	add    %ecx,%eax
    41a7:	c1 e0 02             	shl    $0x2,%eax
    41aa:	01 d0                	add    %edx,%eax
    41ac:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    41b0:	3c ff                	cmp    $0xff,%al
    41b2:	75 1f                	jne    41d3 <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    41b4:	8b 45 08             	mov    0x8(%ebp),%eax
    41b7:	8b 10                	mov    (%eax),%edx
    41b9:	8b 45 08             	mov    0x8(%ebp),%eax
    41bc:	8b 40 04             	mov    0x4(%eax),%eax
    41bf:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    41c3:	89 c1                	mov    %eax,%ecx
    41c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41c8:	01 c8                	add    %ecx,%eax
    41ca:	c1 e0 02             	shl    $0x2,%eax
    41cd:	01 d0                	add    %edx,%eax
    41cf:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    41d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    41d7:	8b 45 08             	mov    0x8(%ebp),%eax
    41da:	8b 40 08             	mov    0x8(%eax),%eax
    41dd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    41e0:	0f 8f 7a fe ff ff    	jg     4060 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    41e6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    41ea:	8b 45 08             	mov    0x8(%ebp),%eax
    41ed:	8b 40 04             	mov    0x4(%eax),%eax
    41f0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    41f3:	0f 8f 5b fe ff ff    	jg     4054 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    41f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    41fc:	c9                   	leave  
    41fd:	c3                   	ret    

000041fe <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    41fe:	55                   	push   %ebp
    41ff:	89 e5                	mov    %esp,%ebp
    4201:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    4204:	8b 45 0c             	mov    0xc(%ebp),%eax
    4207:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    420a:	8b 45 10             	mov    0x10(%ebp),%eax
    420d:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    4210:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4213:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4216:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4219:	89 01                	mov    %eax,(%ecx)
    421b:	89 51 04             	mov    %edx,0x4(%ecx)
}
    421e:	8b 45 08             	mov    0x8(%ebp),%eax
    4221:	c9                   	leave  
    4222:	c2 04 00             	ret    $0x4

00004225 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    4225:	55                   	push   %ebp
    4226:	89 e5                	mov    %esp,%ebp
    4228:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    422b:	8d 45 e8             	lea    -0x18(%ebp),%eax
    422e:	8b 55 10             	mov    0x10(%ebp),%edx
    4231:	89 54 24 08          	mov    %edx,0x8(%esp)
    4235:	8b 55 0c             	mov    0xc(%ebp),%edx
    4238:	89 54 24 04          	mov    %edx,0x4(%esp)
    423c:	89 04 24             	mov    %eax,(%esp)
    423f:	e8 ba ff ff ff       	call   41fe <initPoint>
    4244:	83 ec 04             	sub    $0x4,%esp
    4247:	8b 45 e8             	mov    -0x18(%ebp),%eax
    424a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    424d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4250:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    4253:	8b 45 14             	mov    0x14(%ebp),%eax
    4256:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    4259:	8b 45 18             	mov    0x18(%ebp),%eax
    425c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    425f:	8b 45 08             	mov    0x8(%ebp),%eax
    4262:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4265:	89 10                	mov    %edx,(%eax)
    4267:	8b 55 f4             	mov    -0xc(%ebp),%edx
    426a:	89 50 04             	mov    %edx,0x4(%eax)
    426d:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4270:	89 50 08             	mov    %edx,0x8(%eax)
    4273:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4276:	89 50 0c             	mov    %edx,0xc(%eax)
}
    4279:	8b 45 08             	mov    0x8(%ebp),%eax
    427c:	c9                   	leave  
    427d:	c2 04 00             	ret    $0x4

00004280 <isIn>:

int isIn(Point p, Rect r)
{
    4280:	55                   	push   %ebp
    4281:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    4283:	8b 55 08             	mov    0x8(%ebp),%edx
    4286:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    4289:	39 c2                	cmp    %eax,%edx
    428b:	7c 2f                	jl     42bc <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    428d:	8b 45 08             	mov    0x8(%ebp),%eax
    4290:	8b 4d 10             	mov    0x10(%ebp),%ecx
    4293:	8b 55 18             	mov    0x18(%ebp),%edx
    4296:	01 ca                	add    %ecx,%edx
    4298:	39 d0                	cmp    %edx,%eax
    429a:	7d 20                	jge    42bc <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    429c:	8b 55 0c             	mov    0xc(%ebp),%edx
    429f:	8b 45 14             	mov    0x14(%ebp),%eax
    42a2:	39 c2                	cmp    %eax,%edx
    42a4:	7c 16                	jl     42bc <isIn+0x3c>
    42a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    42a9:	8b 4d 14             	mov    0x14(%ebp),%ecx
    42ac:	8b 55 1c             	mov    0x1c(%ebp),%edx
    42af:	01 ca                	add    %ecx,%edx
    42b1:	39 d0                	cmp    %edx,%eax
    42b3:	7d 07                	jge    42bc <isIn+0x3c>
    42b5:	b8 01 00 00 00       	mov    $0x1,%eax
    42ba:	eb 05                	jmp    42c1 <isIn+0x41>
    42bc:	b8 00 00 00 00       	mov    $0x0,%eax
}
    42c1:	5d                   	pop    %ebp
    42c2:	c3                   	ret    

000042c3 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    42c3:	55                   	push   %ebp
    42c4:	89 e5                	mov    %esp,%ebp
    42c6:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    42c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    42d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    42d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    42de:	8b 45 10             	mov    0x10(%ebp),%eax
    42e1:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    42e4:	8b 45 14             	mov    0x14(%ebp),%eax
    42e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    42ea:	8b 45 08             	mov    0x8(%ebp),%eax
    42ed:	8b 55 ec             	mov    -0x14(%ebp),%edx
    42f0:	89 10                	mov    %edx,(%eax)
    42f2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    42f5:	89 50 04             	mov    %edx,0x4(%eax)
    42f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    42fb:	89 50 08             	mov    %edx,0x8(%eax)
    42fe:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4301:	89 50 0c             	mov    %edx,0xc(%eax)
    4304:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4307:	89 50 10             	mov    %edx,0x10(%eax)
}
    430a:	8b 45 08             	mov    0x8(%ebp),%eax
    430d:	c9                   	leave  
    430e:	c2 04 00             	ret    $0x4

00004311 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    4311:	55                   	push   %ebp
    4312:	89 e5                	mov    %esp,%ebp
    4314:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    4317:	8b 45 1c             	mov    0x1c(%ebp),%eax
    431a:	83 f8 03             	cmp    $0x3,%eax
    431d:	74 72                	je     4391 <createClickable+0x80>
    431f:	83 f8 04             	cmp    $0x4,%eax
    4322:	74 0a                	je     432e <createClickable+0x1d>
    4324:	83 f8 02             	cmp    $0x2,%eax
    4327:	74 38                	je     4361 <createClickable+0x50>
    4329:	e9 96 00 00 00       	jmp    43c4 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    432e:	8b 45 08             	mov    0x8(%ebp),%eax
    4331:	8d 50 04             	lea    0x4(%eax),%edx
    4334:	8b 45 20             	mov    0x20(%ebp),%eax
    4337:	89 44 24 14          	mov    %eax,0x14(%esp)
    433b:	8b 45 0c             	mov    0xc(%ebp),%eax
    433e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4342:	8b 45 10             	mov    0x10(%ebp),%eax
    4345:	89 44 24 08          	mov    %eax,0x8(%esp)
    4349:	8b 45 14             	mov    0x14(%ebp),%eax
    434c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4350:	8b 45 18             	mov    0x18(%ebp),%eax
    4353:	89 44 24 10          	mov    %eax,0x10(%esp)
    4357:	89 14 24             	mov    %edx,(%esp)
    435a:	e8 7c 00 00 00       	call   43db <addClickable>
	        break;
    435f:	eb 78                	jmp    43d9 <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    4361:	8b 45 08             	mov    0x8(%ebp),%eax
    4364:	8b 55 20             	mov    0x20(%ebp),%edx
    4367:	89 54 24 14          	mov    %edx,0x14(%esp)
    436b:	8b 55 0c             	mov    0xc(%ebp),%edx
    436e:	89 54 24 04          	mov    %edx,0x4(%esp)
    4372:	8b 55 10             	mov    0x10(%ebp),%edx
    4375:	89 54 24 08          	mov    %edx,0x8(%esp)
    4379:	8b 55 14             	mov    0x14(%ebp),%edx
    437c:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4380:	8b 55 18             	mov    0x18(%ebp),%edx
    4383:	89 54 24 10          	mov    %edx,0x10(%esp)
    4387:	89 04 24             	mov    %eax,(%esp)
    438a:	e8 4c 00 00 00       	call   43db <addClickable>
	    	break;
    438f:	eb 48                	jmp    43d9 <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    4391:	8b 45 08             	mov    0x8(%ebp),%eax
    4394:	8d 50 08             	lea    0x8(%eax),%edx
    4397:	8b 45 20             	mov    0x20(%ebp),%eax
    439a:	89 44 24 14          	mov    %eax,0x14(%esp)
    439e:	8b 45 0c             	mov    0xc(%ebp),%eax
    43a1:	89 44 24 04          	mov    %eax,0x4(%esp)
    43a5:	8b 45 10             	mov    0x10(%ebp),%eax
    43a8:	89 44 24 08          	mov    %eax,0x8(%esp)
    43ac:	8b 45 14             	mov    0x14(%ebp),%eax
    43af:	89 44 24 0c          	mov    %eax,0xc(%esp)
    43b3:	8b 45 18             	mov    0x18(%ebp),%eax
    43b6:	89 44 24 10          	mov    %eax,0x10(%esp)
    43ba:	89 14 24             	mov    %edx,(%esp)
    43bd:	e8 19 00 00 00       	call   43db <addClickable>
	    	break;
    43c2:	eb 15                	jmp    43d9 <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    43c4:	c7 44 24 04 44 ba 00 	movl   $0xba44,0x4(%esp)
    43cb:	00 
    43cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    43d3:	e8 67 09 00 00       	call   4d3f <printf>
	    	break;
    43d8:	90                   	nop
	}
}
    43d9:	c9                   	leave  
    43da:	c3                   	ret    

000043db <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    43db:	55                   	push   %ebp
    43dc:	89 e5                	mov    %esp,%ebp
    43de:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    43e1:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    43e8:	e8 3e 0c 00 00       	call   502b <malloc>
    43ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    43f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43f3:	8b 55 0c             	mov    0xc(%ebp),%edx
    43f6:	89 10                	mov    %edx,(%eax)
    43f8:	8b 55 10             	mov    0x10(%ebp),%edx
    43fb:	89 50 04             	mov    %edx,0x4(%eax)
    43fe:	8b 55 14             	mov    0x14(%ebp),%edx
    4401:	89 50 08             	mov    %edx,0x8(%eax)
    4404:	8b 55 18             	mov    0x18(%ebp),%edx
    4407:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    440a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    440d:	8b 55 1c             	mov    0x1c(%ebp),%edx
    4410:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    4413:	8b 45 08             	mov    0x8(%ebp),%eax
    4416:	8b 10                	mov    (%eax),%edx
    4418:	8b 45 f4             	mov    -0xc(%ebp),%eax
    441b:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    441e:	8b 45 08             	mov    0x8(%ebp),%eax
    4421:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4424:	89 10                	mov    %edx,(%eax)
}
    4426:	c9                   	leave  
    4427:	c3                   	ret    

00004428 <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    4428:	55                   	push   %ebp
    4429:	89 e5                	mov    %esp,%ebp
    442b:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    442e:	8b 45 08             	mov    0x8(%ebp),%eax
    4431:	8b 00                	mov    (%eax),%eax
    4433:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4436:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4439:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    443c:	e9 bb 00 00 00       	jmp    44fc <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    4441:	8b 45 0c             	mov    0xc(%ebp),%eax
    4444:	89 44 24 08          	mov    %eax,0x8(%esp)
    4448:	8b 45 10             	mov    0x10(%ebp),%eax
    444b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    444f:	8b 45 14             	mov    0x14(%ebp),%eax
    4452:	89 44 24 10          	mov    %eax,0x10(%esp)
    4456:	8b 45 18             	mov    0x18(%ebp),%eax
    4459:	89 44 24 14          	mov    %eax,0x14(%esp)
    445d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4460:	8b 50 04             	mov    0x4(%eax),%edx
    4463:	8b 00                	mov    (%eax),%eax
    4465:	89 04 24             	mov    %eax,(%esp)
    4468:	89 54 24 04          	mov    %edx,0x4(%esp)
    446c:	e8 0f fe ff ff       	call   4280 <isIn>
    4471:	85 c0                	test   %eax,%eax
    4473:	74 60                	je     44d5 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    4475:	8b 45 08             	mov    0x8(%ebp),%eax
    4478:	8b 00                	mov    (%eax),%eax
    447a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    447d:	75 2e                	jne    44ad <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    447f:	8b 45 08             	mov    0x8(%ebp),%eax
    4482:	8b 00                	mov    (%eax),%eax
    4484:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    4487:	8b 45 f0             	mov    -0x10(%ebp),%eax
    448a:	8b 50 14             	mov    0x14(%eax),%edx
    448d:	8b 45 08             	mov    0x8(%ebp),%eax
    4490:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    4492:	8b 45 08             	mov    0x8(%ebp),%eax
    4495:	8b 00                	mov    (%eax),%eax
    4497:	89 45 f4             	mov    %eax,-0xc(%ebp)
    449a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    449d:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    44a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    44a3:	89 04 24             	mov    %eax,(%esp)
    44a6:	e8 47 0a 00 00       	call   4ef2 <free>
    44ab:	eb 4f                	jmp    44fc <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    44ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44b0:	8b 50 14             	mov    0x14(%eax),%edx
    44b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44b6:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    44b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    44bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44c2:	8b 40 14             	mov    0x14(%eax),%eax
    44c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    44c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    44cb:	89 04 24             	mov    %eax,(%esp)
    44ce:	e8 1f 0a 00 00       	call   4ef2 <free>
    44d3:	eb 27                	jmp    44fc <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    44d5:	8b 45 08             	mov    0x8(%ebp),%eax
    44d8:	8b 00                	mov    (%eax),%eax
    44da:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    44dd:	75 0b                	jne    44ea <deleteClickable+0xc2>
			{
				cur = cur->next;
    44df:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44e2:	8b 40 14             	mov    0x14(%eax),%eax
    44e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    44e8:	eb 12                	jmp    44fc <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    44ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44ed:	8b 40 14             	mov    0x14(%eax),%eax
    44f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    44f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44f6:	8b 40 14             	mov    0x14(%eax),%eax
    44f9:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    44fc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4500:	0f 85 3b ff ff ff    	jne    4441 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    4506:	c9                   	leave  
    4507:	c3                   	ret    

00004508 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    4508:	55                   	push   %ebp
    4509:	89 e5                	mov    %esp,%ebp
    450b:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    450e:	8b 45 08             	mov    0x8(%ebp),%eax
    4511:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    4514:	eb 63                	jmp    4579 <executeHandler+0x71>
	{
		if (isIn(click, cur->area))
    4516:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4519:	8b 10                	mov    (%eax),%edx
    451b:	89 54 24 08          	mov    %edx,0x8(%esp)
    451f:	8b 50 04             	mov    0x4(%eax),%edx
    4522:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4526:	8b 50 08             	mov    0x8(%eax),%edx
    4529:	89 54 24 10          	mov    %edx,0x10(%esp)
    452d:	8b 40 0c             	mov    0xc(%eax),%eax
    4530:	89 44 24 14          	mov    %eax,0x14(%esp)
    4534:	8b 45 0c             	mov    0xc(%ebp),%eax
    4537:	8b 55 10             	mov    0x10(%ebp),%edx
    453a:	89 04 24             	mov    %eax,(%esp)
    453d:	89 54 24 04          	mov    %edx,0x4(%esp)
    4541:	e8 3a fd ff ff       	call   4280 <isIn>
    4546:	85 c0                	test   %eax,%eax
    4548:	74 26                	je     4570 <executeHandler+0x68>
		{
			isSearching = 0;
    454a:	c7 05 60 2d 01 00 00 	movl   $0x0,0x12d60
    4551:	00 00 00 
			cur->handler(click);
    4554:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4557:	8b 48 10             	mov    0x10(%eax),%ecx
    455a:	8b 45 0c             	mov    0xc(%ebp),%eax
    455d:	8b 55 10             	mov    0x10(%ebp),%edx
    4560:	89 04 24             	mov    %eax,(%esp)
    4563:	89 54 24 04          	mov    %edx,0x4(%esp)
    4567:	ff d1                	call   *%ecx
			return 1;
    4569:	b8 01 00 00 00       	mov    $0x1,%eax
    456e:	eb 32                	jmp    45a2 <executeHandler+0x9a>
		}
		cur = cur->next;
    4570:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4573:	8b 40 14             	mov    0x14(%eax),%eax
    4576:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    4579:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    457d:	75 97                	jne    4516 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    457f:	c7 05 60 2d 01 00 00 	movl   $0x0,0x12d60
    4586:	00 00 00 
	printf(0, "execute: none!\n");
    4589:	c7 44 24 04 72 ba 00 	movl   $0xba72,0x4(%esp)
    4590:	00 
    4591:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4598:	e8 a2 07 00 00       	call   4d3f <printf>
	return 0;
    459d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    45a2:	c9                   	leave  
    45a3:	c3                   	ret    

000045a4 <printClickable>:

void printClickable(Clickable *c)
{
    45a4:	55                   	push   %ebp
    45a5:	89 e5                	mov    %esp,%ebp
    45a7:	53                   	push   %ebx
    45a8:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    45ab:	8b 45 08             	mov    0x8(%ebp),%eax
    45ae:	8b 58 0c             	mov    0xc(%eax),%ebx
    45b1:	8b 45 08             	mov    0x8(%ebp),%eax
    45b4:	8b 48 08             	mov    0x8(%eax),%ecx
    45b7:	8b 45 08             	mov    0x8(%ebp),%eax
    45ba:	8b 50 04             	mov    0x4(%eax),%edx
    45bd:	8b 45 08             	mov    0x8(%ebp),%eax
    45c0:	8b 00                	mov    (%eax),%eax
    45c2:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    45c6:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    45ca:	89 54 24 0c          	mov    %edx,0xc(%esp)
    45ce:	89 44 24 08          	mov    %eax,0x8(%esp)
    45d2:	c7 44 24 04 82 ba 00 	movl   $0xba82,0x4(%esp)
    45d9:	00 
    45da:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    45e1:	e8 59 07 00 00       	call   4d3f <printf>
}
    45e6:	83 c4 24             	add    $0x24,%esp
    45e9:	5b                   	pop    %ebx
    45ea:	5d                   	pop    %ebp
    45eb:	c3                   	ret    

000045ec <printClickableList>:

void printClickableList(Clickable *head)
{
    45ec:	55                   	push   %ebp
    45ed:	89 e5                	mov    %esp,%ebp
    45ef:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    45f2:	8b 45 08             	mov    0x8(%ebp),%eax
    45f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    45f8:	c7 44 24 04 94 ba 00 	movl   $0xba94,0x4(%esp)
    45ff:	00 
    4600:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4607:	e8 33 07 00 00       	call   4d3f <printf>
	while(cur != 0)
    460c:	eb 14                	jmp    4622 <printClickableList+0x36>
	{
		printClickable(cur);
    460e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4611:	89 04 24             	mov    %eax,(%esp)
    4614:	e8 8b ff ff ff       	call   45a4 <printClickable>
		cur = cur->next;
    4619:	8b 45 f4             	mov    -0xc(%ebp),%eax
    461c:	8b 40 14             	mov    0x14(%eax),%eax
    461f:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    4622:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4626:	75 e6                	jne    460e <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    4628:	c7 44 24 04 a5 ba 00 	movl   $0xbaa5,0x4(%esp)
    462f:	00 
    4630:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4637:	e8 03 07 00 00       	call   4d3f <printf>
}
    463c:	c9                   	leave  
    463d:	c3                   	ret    

0000463e <testHanler>:

void testHanler(struct Point p)
{
    463e:	55                   	push   %ebp
    463f:	89 e5                	mov    %esp,%ebp
    4641:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    4644:	8b 55 0c             	mov    0xc(%ebp),%edx
    4647:	8b 45 08             	mov    0x8(%ebp),%eax
    464a:	89 54 24 0c          	mov    %edx,0xc(%esp)
    464e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4652:	c7 44 24 04 a7 ba 00 	movl   $0xbaa7,0x4(%esp)
    4659:	00 
    465a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4661:	e8 d9 06 00 00       	call   4d3f <printf>
}
    4666:	c9                   	leave  
    4667:	c3                   	ret    

00004668 <testClickable>:
void testClickable(struct Context c)
{
    4668:	55                   	push   %ebp
    4669:	89 e5                	mov    %esp,%ebp
    466b:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    4671:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4674:	8b 55 08             	mov    0x8(%ebp),%edx
    4677:	89 54 24 04          	mov    %edx,0x4(%esp)
    467b:	8b 55 0c             	mov    0xc(%ebp),%edx
    467e:	89 54 24 08          	mov    %edx,0x8(%esp)
    4682:	8b 55 10             	mov    0x10(%ebp),%edx
    4685:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4689:	89 04 24             	mov    %eax,(%esp)
    468c:	e8 32 fc ff ff       	call   42c3 <initClickManager>
    4691:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    4694:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    4697:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    469e:	00 
    469f:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    46a6:	00 
    46a7:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    46ae:	00 
    46af:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    46b6:	00 
    46b7:	89 04 24             	mov    %eax,(%esp)
    46ba:	e8 66 fb ff ff       	call   4225 <initRect>
    46bf:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    46c2:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    46c5:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    46cc:	00 
    46cd:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    46d4:	00 
    46d5:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    46dc:	00 
    46dd:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    46e4:	00 
    46e5:	89 04 24             	mov    %eax,(%esp)
    46e8:	e8 38 fb ff ff       	call   4225 <initRect>
    46ed:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    46f0:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    46f3:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    46fa:	00 
    46fb:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    4702:	00 
    4703:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    470a:	00 
    470b:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    4712:	00 
    4713:	89 04 24             	mov    %eax,(%esp)
    4716:	e8 0a fb ff ff       	call   4225 <initRect>
    471b:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    471e:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4721:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    4728:	00 
    4729:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    4730:	00 
    4731:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    4738:	00 
    4739:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4740:	00 
    4741:	89 04 24             	mov    %eax,(%esp)
    4744:	e8 dc fa ff ff       	call   4225 <initRect>
    4749:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    474c:	8d 45 9c             	lea    -0x64(%ebp),%eax
    474f:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    4756:	00 
    4757:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    475e:	00 
    475f:	89 04 24             	mov    %eax,(%esp)
    4762:	e8 97 fa ff ff       	call   41fe <initPoint>
    4767:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    476a:	8d 45 94             	lea    -0x6c(%ebp),%eax
    476d:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    4774:	00 
    4775:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    477c:	00 
    477d:	89 04 24             	mov    %eax,(%esp)
    4780:	e8 79 fa ff ff       	call   41fe <initPoint>
    4785:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    4788:	c7 44 24 18 3e 46 00 	movl   $0x463e,0x18(%esp)
    478f:	00 
    4790:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4797:	00 
    4798:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    479b:	89 44 24 04          	mov    %eax,0x4(%esp)
    479f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    47a2:	89 44 24 08          	mov    %eax,0x8(%esp)
    47a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    47ad:	8b 45 e0             	mov    -0x20(%ebp),%eax
    47b0:	89 44 24 10          	mov    %eax,0x10(%esp)
    47b4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    47b7:	89 04 24             	mov    %eax,(%esp)
    47ba:	e8 52 fb ff ff       	call   4311 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    47bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    47c2:	89 44 24 08          	mov    %eax,0x8(%esp)
    47c6:	c7 44 24 04 bb ba 00 	movl   $0xbabb,0x4(%esp)
    47cd:	00 
    47ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    47d5:	e8 65 05 00 00       	call   4d3f <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    47da:	c7 44 24 18 3e 46 00 	movl   $0x463e,0x18(%esp)
    47e1:	00 
    47e2:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    47e9:	00 
    47ea:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    47ed:	89 44 24 04          	mov    %eax,0x4(%esp)
    47f1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    47f4:	89 44 24 08          	mov    %eax,0x8(%esp)
    47f8:	8b 45 cc             	mov    -0x34(%ebp),%eax
    47fb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    47ff:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4802:	89 44 24 10          	mov    %eax,0x10(%esp)
    4806:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4809:	89 04 24             	mov    %eax,(%esp)
    480c:	e8 00 fb ff ff       	call   4311 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4811:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4814:	89 44 24 08          	mov    %eax,0x8(%esp)
    4818:	c7 44 24 04 bb ba 00 	movl   $0xbabb,0x4(%esp)
    481f:	00 
    4820:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4827:	e8 13 05 00 00       	call   4d3f <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    482c:	c7 44 24 18 3e 46 00 	movl   $0x463e,0x18(%esp)
    4833:	00 
    4834:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    483b:	00 
    483c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    483f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4843:	8b 45 b8             	mov    -0x48(%ebp),%eax
    4846:	89 44 24 08          	mov    %eax,0x8(%esp)
    484a:	8b 45 bc             	mov    -0x44(%ebp),%eax
    484d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4851:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4854:	89 44 24 10          	mov    %eax,0x10(%esp)
    4858:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    485b:	89 04 24             	mov    %eax,(%esp)
    485e:	e8 ae fa ff ff       	call   4311 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4863:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4866:	89 44 24 08          	mov    %eax,0x8(%esp)
    486a:	c7 44 24 04 bb ba 00 	movl   $0xbabb,0x4(%esp)
    4871:	00 
    4872:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4879:	e8 c1 04 00 00       	call   4d3f <printf>
	printClickableList(cm.left_click);
    487e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4881:	89 04 24             	mov    %eax,(%esp)
    4884:	e8 63 fd ff ff       	call   45ec <printClickableList>
	executeHandler(cm.left_click, p1);
    4889:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    488c:	8b 45 9c             	mov    -0x64(%ebp),%eax
    488f:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4892:	89 44 24 04          	mov    %eax,0x4(%esp)
    4896:	89 54 24 08          	mov    %edx,0x8(%esp)
    489a:	89 0c 24             	mov    %ecx,(%esp)
    489d:	e8 66 fc ff ff       	call   4508 <executeHandler>
	executeHandler(cm.left_click, p2);
    48a2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    48a5:	8b 45 94             	mov    -0x6c(%ebp),%eax
    48a8:	8b 55 98             	mov    -0x68(%ebp),%edx
    48ab:	89 44 24 04          	mov    %eax,0x4(%esp)
    48af:	89 54 24 08          	mov    %edx,0x8(%esp)
    48b3:	89 0c 24             	mov    %ecx,(%esp)
    48b6:	e8 4d fc ff ff       	call   4508 <executeHandler>
	deleteClickable(&cm.left_click, r4);
    48bb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    48be:	89 44 24 04          	mov    %eax,0x4(%esp)
    48c2:	8b 45 a8             	mov    -0x58(%ebp),%eax
    48c5:	89 44 24 08          	mov    %eax,0x8(%esp)
    48c9:	8b 45 ac             	mov    -0x54(%ebp),%eax
    48cc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    48d0:	8b 45 b0             	mov    -0x50(%ebp),%eax
    48d3:	89 44 24 10          	mov    %eax,0x10(%esp)
    48d7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    48da:	89 04 24             	mov    %eax,(%esp)
    48dd:	e8 46 fb ff ff       	call   4428 <deleteClickable>
	printClickableList(cm.left_click);
    48e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48e5:	89 04 24             	mov    %eax,(%esp)
    48e8:	e8 ff fc ff ff       	call   45ec <printClickableList>
}
    48ed:	c9                   	leave  
    48ee:	c3                   	ret    

000048ef <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    48ef:	55                   	push   %ebp
    48f0:	89 e5                	mov    %esp,%ebp
    48f2:	57                   	push   %edi
    48f3:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    48f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
    48f7:	8b 55 10             	mov    0x10(%ebp),%edx
    48fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    48fd:	89 cb                	mov    %ecx,%ebx
    48ff:	89 df                	mov    %ebx,%edi
    4901:	89 d1                	mov    %edx,%ecx
    4903:	fc                   	cld    
    4904:	f3 aa                	rep stos %al,%es:(%edi)
    4906:	89 ca                	mov    %ecx,%edx
    4908:	89 fb                	mov    %edi,%ebx
    490a:	89 5d 08             	mov    %ebx,0x8(%ebp)
    490d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    4910:	5b                   	pop    %ebx
    4911:	5f                   	pop    %edi
    4912:	5d                   	pop    %ebp
    4913:	c3                   	ret    

00004914 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    4914:	55                   	push   %ebp
    4915:	89 e5                	mov    %esp,%ebp
    4917:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    491a:	8b 45 08             	mov    0x8(%ebp),%eax
    491d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    4920:	90                   	nop
    4921:	8b 45 08             	mov    0x8(%ebp),%eax
    4924:	8d 50 01             	lea    0x1(%eax),%edx
    4927:	89 55 08             	mov    %edx,0x8(%ebp)
    492a:	8b 55 0c             	mov    0xc(%ebp),%edx
    492d:	8d 4a 01             	lea    0x1(%edx),%ecx
    4930:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    4933:	0f b6 12             	movzbl (%edx),%edx
    4936:	88 10                	mov    %dl,(%eax)
    4938:	0f b6 00             	movzbl (%eax),%eax
    493b:	84 c0                	test   %al,%al
    493d:	75 e2                	jne    4921 <strcpy+0xd>
    ;
  return os;
    493f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4942:	c9                   	leave  
    4943:	c3                   	ret    

00004944 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4944:	55                   	push   %ebp
    4945:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    4947:	eb 08                	jmp    4951 <strcmp+0xd>
    p++, q++;
    4949:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    494d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    4951:	8b 45 08             	mov    0x8(%ebp),%eax
    4954:	0f b6 00             	movzbl (%eax),%eax
    4957:	84 c0                	test   %al,%al
    4959:	74 10                	je     496b <strcmp+0x27>
    495b:	8b 45 08             	mov    0x8(%ebp),%eax
    495e:	0f b6 10             	movzbl (%eax),%edx
    4961:	8b 45 0c             	mov    0xc(%ebp),%eax
    4964:	0f b6 00             	movzbl (%eax),%eax
    4967:	38 c2                	cmp    %al,%dl
    4969:	74 de                	je     4949 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    496b:	8b 45 08             	mov    0x8(%ebp),%eax
    496e:	0f b6 00             	movzbl (%eax),%eax
    4971:	0f b6 d0             	movzbl %al,%edx
    4974:	8b 45 0c             	mov    0xc(%ebp),%eax
    4977:	0f b6 00             	movzbl (%eax),%eax
    497a:	0f b6 c0             	movzbl %al,%eax
    497d:	29 c2                	sub    %eax,%edx
    497f:	89 d0                	mov    %edx,%eax
}
    4981:	5d                   	pop    %ebp
    4982:	c3                   	ret    

00004983 <strlen>:

uint
strlen(char *s)
{
    4983:	55                   	push   %ebp
    4984:	89 e5                	mov    %esp,%ebp
    4986:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    4989:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    4990:	eb 04                	jmp    4996 <strlen+0x13>
    4992:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    4996:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4999:	8b 45 08             	mov    0x8(%ebp),%eax
    499c:	01 d0                	add    %edx,%eax
    499e:	0f b6 00             	movzbl (%eax),%eax
    49a1:	84 c0                	test   %al,%al
    49a3:	75 ed                	jne    4992 <strlen+0xf>
    ;
  return n;
    49a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    49a8:	c9                   	leave  
    49a9:	c3                   	ret    

000049aa <memset>:

void*
memset(void *dst, int c, uint n)
{
    49aa:	55                   	push   %ebp
    49ab:	89 e5                	mov    %esp,%ebp
    49ad:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    49b0:	8b 45 10             	mov    0x10(%ebp),%eax
    49b3:	89 44 24 08          	mov    %eax,0x8(%esp)
    49b7:	8b 45 0c             	mov    0xc(%ebp),%eax
    49ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    49be:	8b 45 08             	mov    0x8(%ebp),%eax
    49c1:	89 04 24             	mov    %eax,(%esp)
    49c4:	e8 26 ff ff ff       	call   48ef <stosb>
  return dst;
    49c9:	8b 45 08             	mov    0x8(%ebp),%eax
}
    49cc:	c9                   	leave  
    49cd:	c3                   	ret    

000049ce <strchr>:

char*
strchr(const char *s, char c)
{
    49ce:	55                   	push   %ebp
    49cf:	89 e5                	mov    %esp,%ebp
    49d1:	83 ec 04             	sub    $0x4,%esp
    49d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    49d7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    49da:	eb 14                	jmp    49f0 <strchr+0x22>
    if(*s == c)
    49dc:	8b 45 08             	mov    0x8(%ebp),%eax
    49df:	0f b6 00             	movzbl (%eax),%eax
    49e2:	3a 45 fc             	cmp    -0x4(%ebp),%al
    49e5:	75 05                	jne    49ec <strchr+0x1e>
      return (char*)s;
    49e7:	8b 45 08             	mov    0x8(%ebp),%eax
    49ea:	eb 13                	jmp    49ff <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    49ec:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    49f0:	8b 45 08             	mov    0x8(%ebp),%eax
    49f3:	0f b6 00             	movzbl (%eax),%eax
    49f6:	84 c0                	test   %al,%al
    49f8:	75 e2                	jne    49dc <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    49fa:	b8 00 00 00 00       	mov    $0x0,%eax
}
    49ff:	c9                   	leave  
    4a00:	c3                   	ret    

00004a01 <gets>:

char*
gets(char *buf, int max)
{
    4a01:	55                   	push   %ebp
    4a02:	89 e5                	mov    %esp,%ebp
    4a04:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4a07:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4a0e:	eb 4c                	jmp    4a5c <gets+0x5b>
    cc = read(0, &c, 1);
    4a10:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4a17:	00 
    4a18:	8d 45 ef             	lea    -0x11(%ebp),%eax
    4a1b:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a26:	e8 44 01 00 00       	call   4b6f <read>
    4a2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    4a2e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4a32:	7f 02                	jg     4a36 <gets+0x35>
      break;
    4a34:	eb 31                	jmp    4a67 <gets+0x66>
    buf[i++] = c;
    4a36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a39:	8d 50 01             	lea    0x1(%eax),%edx
    4a3c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4a3f:	89 c2                	mov    %eax,%edx
    4a41:	8b 45 08             	mov    0x8(%ebp),%eax
    4a44:	01 c2                	add    %eax,%edx
    4a46:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4a4a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    4a4c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4a50:	3c 0a                	cmp    $0xa,%al
    4a52:	74 13                	je     4a67 <gets+0x66>
    4a54:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4a58:	3c 0d                	cmp    $0xd,%al
    4a5a:	74 0b                	je     4a67 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a5f:	83 c0 01             	add    $0x1,%eax
    4a62:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4a65:	7c a9                	jl     4a10 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    4a67:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4a6a:	8b 45 08             	mov    0x8(%ebp),%eax
    4a6d:	01 d0                	add    %edx,%eax
    4a6f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    4a72:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4a75:	c9                   	leave  
    4a76:	c3                   	ret    

00004a77 <stat>:

int
stat(char *n, struct stat *st)
{
    4a77:	55                   	push   %ebp
    4a78:	89 e5                	mov    %esp,%ebp
    4a7a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4a7d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4a84:	00 
    4a85:	8b 45 08             	mov    0x8(%ebp),%eax
    4a88:	89 04 24             	mov    %eax,(%esp)
    4a8b:	e8 07 01 00 00       	call   4b97 <open>
    4a90:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    4a93:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4a97:	79 07                	jns    4aa0 <stat+0x29>
    return -1;
    4a99:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4a9e:	eb 23                	jmp    4ac3 <stat+0x4c>
  r = fstat(fd, st);
    4aa0:	8b 45 0c             	mov    0xc(%ebp),%eax
    4aa3:	89 44 24 04          	mov    %eax,0x4(%esp)
    4aa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4aaa:	89 04 24             	mov    %eax,(%esp)
    4aad:	e8 fd 00 00 00       	call   4baf <fstat>
    4ab2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    4ab5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ab8:	89 04 24             	mov    %eax,(%esp)
    4abb:	e8 bf 00 00 00       	call   4b7f <close>
  return r;
    4ac0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    4ac3:	c9                   	leave  
    4ac4:	c3                   	ret    

00004ac5 <atoi>:

int
atoi(const char *s)
{
    4ac5:	55                   	push   %ebp
    4ac6:	89 e5                	mov    %esp,%ebp
    4ac8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    4acb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    4ad2:	eb 25                	jmp    4af9 <atoi+0x34>
    n = n*10 + *s++ - '0';
    4ad4:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4ad7:	89 d0                	mov    %edx,%eax
    4ad9:	c1 e0 02             	shl    $0x2,%eax
    4adc:	01 d0                	add    %edx,%eax
    4ade:	01 c0                	add    %eax,%eax
    4ae0:	89 c1                	mov    %eax,%ecx
    4ae2:	8b 45 08             	mov    0x8(%ebp),%eax
    4ae5:	8d 50 01             	lea    0x1(%eax),%edx
    4ae8:	89 55 08             	mov    %edx,0x8(%ebp)
    4aeb:	0f b6 00             	movzbl (%eax),%eax
    4aee:	0f be c0             	movsbl %al,%eax
    4af1:	01 c8                	add    %ecx,%eax
    4af3:	83 e8 30             	sub    $0x30,%eax
    4af6:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4af9:	8b 45 08             	mov    0x8(%ebp),%eax
    4afc:	0f b6 00             	movzbl (%eax),%eax
    4aff:	3c 2f                	cmp    $0x2f,%al
    4b01:	7e 0a                	jle    4b0d <atoi+0x48>
    4b03:	8b 45 08             	mov    0x8(%ebp),%eax
    4b06:	0f b6 00             	movzbl (%eax),%eax
    4b09:	3c 39                	cmp    $0x39,%al
    4b0b:	7e c7                	jle    4ad4 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    4b0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4b10:	c9                   	leave  
    4b11:	c3                   	ret    

00004b12 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4b12:	55                   	push   %ebp
    4b13:	89 e5                	mov    %esp,%ebp
    4b15:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    4b18:	8b 45 08             	mov    0x8(%ebp),%eax
    4b1b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    4b1e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b21:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    4b24:	eb 17                	jmp    4b3d <memmove+0x2b>
    *dst++ = *src++;
    4b26:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4b29:	8d 50 01             	lea    0x1(%eax),%edx
    4b2c:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4b2f:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4b32:	8d 4a 01             	lea    0x1(%edx),%ecx
    4b35:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    4b38:	0f b6 12             	movzbl (%edx),%edx
    4b3b:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4b3d:	8b 45 10             	mov    0x10(%ebp),%eax
    4b40:	8d 50 ff             	lea    -0x1(%eax),%edx
    4b43:	89 55 10             	mov    %edx,0x10(%ebp)
    4b46:	85 c0                	test   %eax,%eax
    4b48:	7f dc                	jg     4b26 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    4b4a:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4b4d:	c9                   	leave  
    4b4e:	c3                   	ret    

00004b4f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4b4f:	b8 01 00 00 00       	mov    $0x1,%eax
    4b54:	cd 40                	int    $0x40
    4b56:	c3                   	ret    

00004b57 <exit>:
SYSCALL(exit)
    4b57:	b8 02 00 00 00       	mov    $0x2,%eax
    4b5c:	cd 40                	int    $0x40
    4b5e:	c3                   	ret    

00004b5f <wait>:
SYSCALL(wait)
    4b5f:	b8 03 00 00 00       	mov    $0x3,%eax
    4b64:	cd 40                	int    $0x40
    4b66:	c3                   	ret    

00004b67 <pipe>:
SYSCALL(pipe)
    4b67:	b8 04 00 00 00       	mov    $0x4,%eax
    4b6c:	cd 40                	int    $0x40
    4b6e:	c3                   	ret    

00004b6f <read>:
SYSCALL(read)
    4b6f:	b8 05 00 00 00       	mov    $0x5,%eax
    4b74:	cd 40                	int    $0x40
    4b76:	c3                   	ret    

00004b77 <write>:
SYSCALL(write)
    4b77:	b8 10 00 00 00       	mov    $0x10,%eax
    4b7c:	cd 40                	int    $0x40
    4b7e:	c3                   	ret    

00004b7f <close>:
SYSCALL(close)
    4b7f:	b8 15 00 00 00       	mov    $0x15,%eax
    4b84:	cd 40                	int    $0x40
    4b86:	c3                   	ret    

00004b87 <kill>:
SYSCALL(kill)
    4b87:	b8 06 00 00 00       	mov    $0x6,%eax
    4b8c:	cd 40                	int    $0x40
    4b8e:	c3                   	ret    

00004b8f <exec>:
SYSCALL(exec)
    4b8f:	b8 07 00 00 00       	mov    $0x7,%eax
    4b94:	cd 40                	int    $0x40
    4b96:	c3                   	ret    

00004b97 <open>:
SYSCALL(open)
    4b97:	b8 0f 00 00 00       	mov    $0xf,%eax
    4b9c:	cd 40                	int    $0x40
    4b9e:	c3                   	ret    

00004b9f <mknod>:
SYSCALL(mknod)
    4b9f:	b8 11 00 00 00       	mov    $0x11,%eax
    4ba4:	cd 40                	int    $0x40
    4ba6:	c3                   	ret    

00004ba7 <unlink>:
SYSCALL(unlink)
    4ba7:	b8 12 00 00 00       	mov    $0x12,%eax
    4bac:	cd 40                	int    $0x40
    4bae:	c3                   	ret    

00004baf <fstat>:
SYSCALL(fstat)
    4baf:	b8 08 00 00 00       	mov    $0x8,%eax
    4bb4:	cd 40                	int    $0x40
    4bb6:	c3                   	ret    

00004bb7 <link>:
SYSCALL(link)
    4bb7:	b8 13 00 00 00       	mov    $0x13,%eax
    4bbc:	cd 40                	int    $0x40
    4bbe:	c3                   	ret    

00004bbf <mkdir>:
SYSCALL(mkdir)
    4bbf:	b8 14 00 00 00       	mov    $0x14,%eax
    4bc4:	cd 40                	int    $0x40
    4bc6:	c3                   	ret    

00004bc7 <chdir>:
SYSCALL(chdir)
    4bc7:	b8 09 00 00 00       	mov    $0x9,%eax
    4bcc:	cd 40                	int    $0x40
    4bce:	c3                   	ret    

00004bcf <dup>:
SYSCALL(dup)
    4bcf:	b8 0a 00 00 00       	mov    $0xa,%eax
    4bd4:	cd 40                	int    $0x40
    4bd6:	c3                   	ret    

00004bd7 <getpid>:
SYSCALL(getpid)
    4bd7:	b8 0b 00 00 00       	mov    $0xb,%eax
    4bdc:	cd 40                	int    $0x40
    4bde:	c3                   	ret    

00004bdf <sbrk>:
SYSCALL(sbrk)
    4bdf:	b8 0c 00 00 00       	mov    $0xc,%eax
    4be4:	cd 40                	int    $0x40
    4be6:	c3                   	ret    

00004be7 <sleep>:
SYSCALL(sleep)
    4be7:	b8 0d 00 00 00       	mov    $0xd,%eax
    4bec:	cd 40                	int    $0x40
    4bee:	c3                   	ret    

00004bef <uptime>:
SYSCALL(uptime)
    4bef:	b8 0e 00 00 00       	mov    $0xe,%eax
    4bf4:	cd 40                	int    $0x40
    4bf6:	c3                   	ret    

00004bf7 <getMsg>:
SYSCALL(getMsg)
    4bf7:	b8 16 00 00 00       	mov    $0x16,%eax
    4bfc:	cd 40                	int    $0x40
    4bfe:	c3                   	ret    

00004bff <createWindow>:
SYSCALL(createWindow)
    4bff:	b8 17 00 00 00       	mov    $0x17,%eax
    4c04:	cd 40                	int    $0x40
    4c06:	c3                   	ret    

00004c07 <destroyWindow>:
SYSCALL(destroyWindow)
    4c07:	b8 18 00 00 00       	mov    $0x18,%eax
    4c0c:	cd 40                	int    $0x40
    4c0e:	c3                   	ret    

00004c0f <updateWindow>:
SYSCALL(updateWindow)
    4c0f:	b8 19 00 00 00       	mov    $0x19,%eax
    4c14:	cd 40                	int    $0x40
    4c16:	c3                   	ret    

00004c17 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    4c17:	b8 1a 00 00 00       	mov    $0x1a,%eax
    4c1c:	cd 40                	int    $0x40
    4c1e:	c3                   	ret    

00004c1f <kwrite>:
SYSCALL(kwrite)
    4c1f:	b8 1c 00 00 00       	mov    $0x1c,%eax
    4c24:	cd 40                	int    $0x40
    4c26:	c3                   	ret    

00004c27 <setSampleRate>:
SYSCALL(setSampleRate)
    4c27:	b8 1b 00 00 00       	mov    $0x1b,%eax
    4c2c:	cd 40                	int    $0x40
    4c2e:	c3                   	ret    

00004c2f <pause>:
SYSCALL(pause)
    4c2f:	b8 1d 00 00 00       	mov    $0x1d,%eax
    4c34:	cd 40                	int    $0x40
    4c36:	c3                   	ret    

00004c37 <wavdecode>:
SYSCALL(wavdecode)
    4c37:	b8 1e 00 00 00       	mov    $0x1e,%eax
    4c3c:	cd 40                	int    $0x40
    4c3e:	c3                   	ret    

00004c3f <beginDecode>:
SYSCALL(beginDecode)
    4c3f:	b8 1f 00 00 00       	mov    $0x1f,%eax
    4c44:	cd 40                	int    $0x40
    4c46:	c3                   	ret    

00004c47 <waitForDecode>:
SYSCALL(waitForDecode)
    4c47:	b8 20 00 00 00       	mov    $0x20,%eax
    4c4c:	cd 40                	int    $0x40
    4c4e:	c3                   	ret    

00004c4f <endDecode>:
SYSCALL(endDecode)
    4c4f:	b8 21 00 00 00       	mov    $0x21,%eax
    4c54:	cd 40                	int    $0x40
    4c56:	c3                   	ret    

00004c57 <getCoreBuf>:
    4c57:	b8 22 00 00 00       	mov    $0x22,%eax
    4c5c:	cd 40                	int    $0x40
    4c5e:	c3                   	ret    

00004c5f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4c5f:	55                   	push   %ebp
    4c60:	89 e5                	mov    %esp,%ebp
    4c62:	83 ec 18             	sub    $0x18,%esp
    4c65:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c68:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    4c6b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4c72:	00 
    4c73:	8d 45 f4             	lea    -0xc(%ebp),%eax
    4c76:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c7a:	8b 45 08             	mov    0x8(%ebp),%eax
    4c7d:	89 04 24             	mov    %eax,(%esp)
    4c80:	e8 f2 fe ff ff       	call   4b77 <write>
}
    4c85:	c9                   	leave  
    4c86:	c3                   	ret    

00004c87 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4c87:	55                   	push   %ebp
    4c88:	89 e5                	mov    %esp,%ebp
    4c8a:	56                   	push   %esi
    4c8b:	53                   	push   %ebx
    4c8c:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    4c8f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    4c96:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    4c9a:	74 17                	je     4cb3 <printint+0x2c>
    4c9c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4ca0:	79 11                	jns    4cb3 <printint+0x2c>
    neg = 1;
    4ca2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    4ca9:	8b 45 0c             	mov    0xc(%ebp),%eax
    4cac:	f7 d8                	neg    %eax
    4cae:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4cb1:	eb 06                	jmp    4cb9 <printint+0x32>
  } else {
    x = xx;
    4cb3:	8b 45 0c             	mov    0xc(%ebp),%eax
    4cb6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    4cb9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    4cc0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    4cc3:	8d 41 01             	lea    0x1(%ecx),%eax
    4cc6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4cc9:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4ccc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4ccf:	ba 00 00 00 00       	mov    $0x0,%edx
    4cd4:	f7 f3                	div    %ebx
    4cd6:	89 d0                	mov    %edx,%eax
    4cd8:	0f b6 80 58 fa 00 00 	movzbl 0xfa58(%eax),%eax
    4cdf:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    4ce3:	8b 75 10             	mov    0x10(%ebp),%esi
    4ce6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4ce9:	ba 00 00 00 00       	mov    $0x0,%edx
    4cee:	f7 f6                	div    %esi
    4cf0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4cf3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4cf7:	75 c7                	jne    4cc0 <printint+0x39>
  if(neg)
    4cf9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4cfd:	74 10                	je     4d0f <printint+0x88>
    buf[i++] = '-';
    4cff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d02:	8d 50 01             	lea    0x1(%eax),%edx
    4d05:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4d08:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    4d0d:	eb 1f                	jmp    4d2e <printint+0xa7>
    4d0f:	eb 1d                	jmp    4d2e <printint+0xa7>
    putc(fd, buf[i]);
    4d11:	8d 55 dc             	lea    -0x24(%ebp),%edx
    4d14:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d17:	01 d0                	add    %edx,%eax
    4d19:	0f b6 00             	movzbl (%eax),%eax
    4d1c:	0f be c0             	movsbl %al,%eax
    4d1f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4d23:	8b 45 08             	mov    0x8(%ebp),%eax
    4d26:	89 04 24             	mov    %eax,(%esp)
    4d29:	e8 31 ff ff ff       	call   4c5f <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    4d2e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    4d32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4d36:	79 d9                	jns    4d11 <printint+0x8a>
    putc(fd, buf[i]);
}
    4d38:	83 c4 30             	add    $0x30,%esp
    4d3b:	5b                   	pop    %ebx
    4d3c:	5e                   	pop    %esi
    4d3d:	5d                   	pop    %ebp
    4d3e:	c3                   	ret    

00004d3f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4d3f:	55                   	push   %ebp
    4d40:	89 e5                	mov    %esp,%ebp
    4d42:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    4d45:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    4d4c:	8d 45 0c             	lea    0xc(%ebp),%eax
    4d4f:	83 c0 04             	add    $0x4,%eax
    4d52:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    4d55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4d5c:	e9 7c 01 00 00       	jmp    4edd <printf+0x19e>
    c = fmt[i] & 0xff;
    4d61:	8b 55 0c             	mov    0xc(%ebp),%edx
    4d64:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d67:	01 d0                	add    %edx,%eax
    4d69:	0f b6 00             	movzbl (%eax),%eax
    4d6c:	0f be c0             	movsbl %al,%eax
    4d6f:	25 ff 00 00 00       	and    $0xff,%eax
    4d74:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    4d77:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4d7b:	75 2c                	jne    4da9 <printf+0x6a>
      if(c == '%'){
    4d7d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4d81:	75 0c                	jne    4d8f <printf+0x50>
        state = '%';
    4d83:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    4d8a:	e9 4a 01 00 00       	jmp    4ed9 <printf+0x19a>
      } else {
        putc(fd, c);
    4d8f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d92:	0f be c0             	movsbl %al,%eax
    4d95:	89 44 24 04          	mov    %eax,0x4(%esp)
    4d99:	8b 45 08             	mov    0x8(%ebp),%eax
    4d9c:	89 04 24             	mov    %eax,(%esp)
    4d9f:	e8 bb fe ff ff       	call   4c5f <putc>
    4da4:	e9 30 01 00 00       	jmp    4ed9 <printf+0x19a>
      }
    } else if(state == '%'){
    4da9:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    4dad:	0f 85 26 01 00 00    	jne    4ed9 <printf+0x19a>
      if(c == 'd'){
    4db3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    4db7:	75 2d                	jne    4de6 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    4db9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4dbc:	8b 00                	mov    (%eax),%eax
    4dbe:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    4dc5:	00 
    4dc6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    4dcd:	00 
    4dce:	89 44 24 04          	mov    %eax,0x4(%esp)
    4dd2:	8b 45 08             	mov    0x8(%ebp),%eax
    4dd5:	89 04 24             	mov    %eax,(%esp)
    4dd8:	e8 aa fe ff ff       	call   4c87 <printint>
        ap++;
    4ddd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4de1:	e9 ec 00 00 00       	jmp    4ed2 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    4de6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    4dea:	74 06                	je     4df2 <printf+0xb3>
    4dec:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    4df0:	75 2d                	jne    4e1f <printf+0xe0>
        printint(fd, *ap, 16, 0);
    4df2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4df5:	8b 00                	mov    (%eax),%eax
    4df7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    4dfe:	00 
    4dff:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    4e06:	00 
    4e07:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e0b:	8b 45 08             	mov    0x8(%ebp),%eax
    4e0e:	89 04 24             	mov    %eax,(%esp)
    4e11:	e8 71 fe ff ff       	call   4c87 <printint>
        ap++;
    4e16:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4e1a:	e9 b3 00 00 00       	jmp    4ed2 <printf+0x193>
      } else if(c == 's'){
    4e1f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    4e23:	75 45                	jne    4e6a <printf+0x12b>
        s = (char*)*ap;
    4e25:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4e28:	8b 00                	mov    (%eax),%eax
    4e2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    4e2d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    4e31:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4e35:	75 09                	jne    4e40 <printf+0x101>
          s = "(null)";
    4e37:	c7 45 f4 cb ba 00 00 	movl   $0xbacb,-0xc(%ebp)
        while(*s != 0){
    4e3e:	eb 1e                	jmp    4e5e <printf+0x11f>
    4e40:	eb 1c                	jmp    4e5e <printf+0x11f>
          putc(fd, *s);
    4e42:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e45:	0f b6 00             	movzbl (%eax),%eax
    4e48:	0f be c0             	movsbl %al,%eax
    4e4b:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e4f:	8b 45 08             	mov    0x8(%ebp),%eax
    4e52:	89 04 24             	mov    %eax,(%esp)
    4e55:	e8 05 fe ff ff       	call   4c5f <putc>
          s++;
    4e5a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4e5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e61:	0f b6 00             	movzbl (%eax),%eax
    4e64:	84 c0                	test   %al,%al
    4e66:	75 da                	jne    4e42 <printf+0x103>
    4e68:	eb 68                	jmp    4ed2 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    4e6a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    4e6e:	75 1d                	jne    4e8d <printf+0x14e>
        putc(fd, *ap);
    4e70:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4e73:	8b 00                	mov    (%eax),%eax
    4e75:	0f be c0             	movsbl %al,%eax
    4e78:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e7c:	8b 45 08             	mov    0x8(%ebp),%eax
    4e7f:	89 04 24             	mov    %eax,(%esp)
    4e82:	e8 d8 fd ff ff       	call   4c5f <putc>
        ap++;
    4e87:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4e8b:	eb 45                	jmp    4ed2 <printf+0x193>
      } else if(c == '%'){
    4e8d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4e91:	75 17                	jne    4eaa <printf+0x16b>
        putc(fd, c);
    4e93:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e96:	0f be c0             	movsbl %al,%eax
    4e99:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e9d:	8b 45 08             	mov    0x8(%ebp),%eax
    4ea0:	89 04 24             	mov    %eax,(%esp)
    4ea3:	e8 b7 fd ff ff       	call   4c5f <putc>
    4ea8:	eb 28                	jmp    4ed2 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4eaa:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    4eb1:	00 
    4eb2:	8b 45 08             	mov    0x8(%ebp),%eax
    4eb5:	89 04 24             	mov    %eax,(%esp)
    4eb8:	e8 a2 fd ff ff       	call   4c5f <putc>
        putc(fd, c);
    4ebd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ec0:	0f be c0             	movsbl %al,%eax
    4ec3:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ec7:	8b 45 08             	mov    0x8(%ebp),%eax
    4eca:	89 04 24             	mov    %eax,(%esp)
    4ecd:	e8 8d fd ff ff       	call   4c5f <putc>
      }
      state = 0;
    4ed2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4ed9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4edd:	8b 55 0c             	mov    0xc(%ebp),%edx
    4ee0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4ee3:	01 d0                	add    %edx,%eax
    4ee5:	0f b6 00             	movzbl (%eax),%eax
    4ee8:	84 c0                	test   %al,%al
    4eea:	0f 85 71 fe ff ff    	jne    4d61 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4ef0:	c9                   	leave  
    4ef1:	c3                   	ret    

00004ef2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4ef2:	55                   	push   %ebp
    4ef3:	89 e5                	mov    %esp,%ebp
    4ef5:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4ef8:	8b 45 08             	mov    0x8(%ebp),%eax
    4efb:	83 e8 08             	sub    $0x8,%eax
    4efe:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4f01:	a1 78 ff 00 00       	mov    0xff78,%eax
    4f06:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4f09:	eb 24                	jmp    4f2f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4f0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f0e:	8b 00                	mov    (%eax),%eax
    4f10:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4f13:	77 12                	ja     4f27 <free+0x35>
    4f15:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f18:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4f1b:	77 24                	ja     4f41 <free+0x4f>
    4f1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f20:	8b 00                	mov    (%eax),%eax
    4f22:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4f25:	77 1a                	ja     4f41 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4f27:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f2a:	8b 00                	mov    (%eax),%eax
    4f2c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4f2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f32:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4f35:	76 d4                	jbe    4f0b <free+0x19>
    4f37:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f3a:	8b 00                	mov    (%eax),%eax
    4f3c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4f3f:	76 ca                	jbe    4f0b <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    4f41:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f44:	8b 40 04             	mov    0x4(%eax),%eax
    4f47:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4f4e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f51:	01 c2                	add    %eax,%edx
    4f53:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f56:	8b 00                	mov    (%eax),%eax
    4f58:	39 c2                	cmp    %eax,%edx
    4f5a:	75 24                	jne    4f80 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    4f5c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f5f:	8b 50 04             	mov    0x4(%eax),%edx
    4f62:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f65:	8b 00                	mov    (%eax),%eax
    4f67:	8b 40 04             	mov    0x4(%eax),%eax
    4f6a:	01 c2                	add    %eax,%edx
    4f6c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f6f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4f72:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f75:	8b 00                	mov    (%eax),%eax
    4f77:	8b 10                	mov    (%eax),%edx
    4f79:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f7c:	89 10                	mov    %edx,(%eax)
    4f7e:	eb 0a                	jmp    4f8a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    4f80:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f83:	8b 10                	mov    (%eax),%edx
    4f85:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f88:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    4f8a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f8d:	8b 40 04             	mov    0x4(%eax),%eax
    4f90:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4f97:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f9a:	01 d0                	add    %edx,%eax
    4f9c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4f9f:	75 20                	jne    4fc1 <free+0xcf>
    p->s.size += bp->s.size;
    4fa1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fa4:	8b 50 04             	mov    0x4(%eax),%edx
    4fa7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4faa:	8b 40 04             	mov    0x4(%eax),%eax
    4fad:	01 c2                	add    %eax,%edx
    4faf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fb2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4fb5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4fb8:	8b 10                	mov    (%eax),%edx
    4fba:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fbd:	89 10                	mov    %edx,(%eax)
    4fbf:	eb 08                	jmp    4fc9 <free+0xd7>
  } else
    p->s.ptr = bp;
    4fc1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fc4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4fc7:	89 10                	mov    %edx,(%eax)
  freep = p;
    4fc9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fcc:	a3 78 ff 00 00       	mov    %eax,0xff78
}
    4fd1:	c9                   	leave  
    4fd2:	c3                   	ret    

00004fd3 <morecore>:

static Header*
morecore(uint nu)
{
    4fd3:	55                   	push   %ebp
    4fd4:	89 e5                	mov    %esp,%ebp
    4fd6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4fd9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4fe0:	77 07                	ja     4fe9 <morecore+0x16>
    nu = 4096;
    4fe2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4fe9:	8b 45 08             	mov    0x8(%ebp),%eax
    4fec:	c1 e0 03             	shl    $0x3,%eax
    4fef:	89 04 24             	mov    %eax,(%esp)
    4ff2:	e8 e8 fb ff ff       	call   4bdf <sbrk>
    4ff7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4ffa:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4ffe:	75 07                	jne    5007 <morecore+0x34>
    return 0;
    5000:	b8 00 00 00 00       	mov    $0x0,%eax
    5005:	eb 22                	jmp    5029 <morecore+0x56>
  hp = (Header*)p;
    5007:	8b 45 f4             	mov    -0xc(%ebp),%eax
    500a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    500d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5010:	8b 55 08             	mov    0x8(%ebp),%edx
    5013:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    5016:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5019:	83 c0 08             	add    $0x8,%eax
    501c:	89 04 24             	mov    %eax,(%esp)
    501f:	e8 ce fe ff ff       	call   4ef2 <free>
  return freep;
    5024:	a1 78 ff 00 00       	mov    0xff78,%eax
}
    5029:	c9                   	leave  
    502a:	c3                   	ret    

0000502b <malloc>:

void*
malloc(uint nbytes)
{
    502b:	55                   	push   %ebp
    502c:	89 e5                	mov    %esp,%ebp
    502e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    5031:	8b 45 08             	mov    0x8(%ebp),%eax
    5034:	83 c0 07             	add    $0x7,%eax
    5037:	c1 e8 03             	shr    $0x3,%eax
    503a:	83 c0 01             	add    $0x1,%eax
    503d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    5040:	a1 78 ff 00 00       	mov    0xff78,%eax
    5045:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5048:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    504c:	75 23                	jne    5071 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    504e:	c7 45 f0 70 ff 00 00 	movl   $0xff70,-0x10(%ebp)
    5055:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5058:	a3 78 ff 00 00       	mov    %eax,0xff78
    505d:	a1 78 ff 00 00       	mov    0xff78,%eax
    5062:	a3 70 ff 00 00       	mov    %eax,0xff70
    base.s.size = 0;
    5067:	c7 05 74 ff 00 00 00 	movl   $0x0,0xff74
    506e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5071:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5074:	8b 00                	mov    (%eax),%eax
    5076:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    5079:	8b 45 f4             	mov    -0xc(%ebp),%eax
    507c:	8b 40 04             	mov    0x4(%eax),%eax
    507f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    5082:	72 4d                	jb     50d1 <malloc+0xa6>
      if(p->s.size == nunits)
    5084:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5087:	8b 40 04             	mov    0x4(%eax),%eax
    508a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    508d:	75 0c                	jne    509b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    508f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5092:	8b 10                	mov    (%eax),%edx
    5094:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5097:	89 10                	mov    %edx,(%eax)
    5099:	eb 26                	jmp    50c1 <malloc+0x96>
      else {
        p->s.size -= nunits;
    509b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    509e:	8b 40 04             	mov    0x4(%eax),%eax
    50a1:	2b 45 ec             	sub    -0x14(%ebp),%eax
    50a4:	89 c2                	mov    %eax,%edx
    50a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50a9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    50ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50af:	8b 40 04             	mov    0x4(%eax),%eax
    50b2:	c1 e0 03             	shl    $0x3,%eax
    50b5:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    50b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50bb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    50be:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    50c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    50c4:	a3 78 ff 00 00       	mov    %eax,0xff78
      return (void*)(p + 1);
    50c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50cc:	83 c0 08             	add    $0x8,%eax
    50cf:	eb 38                	jmp    5109 <malloc+0xde>
    }
    if(p == freep)
    50d1:	a1 78 ff 00 00       	mov    0xff78,%eax
    50d6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    50d9:	75 1b                	jne    50f6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    50db:	8b 45 ec             	mov    -0x14(%ebp),%eax
    50de:	89 04 24             	mov    %eax,(%esp)
    50e1:	e8 ed fe ff ff       	call   4fd3 <morecore>
    50e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    50e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    50ed:	75 07                	jne    50f6 <malloc+0xcb>
        return 0;
    50ef:	b8 00 00 00 00       	mov    $0x0,%eax
    50f4:	eb 13                	jmp    5109 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    50f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    50fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50ff:	8b 00                	mov    (%eax),%eax
    5101:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    5104:	e9 70 ff ff ff       	jmp    5079 <malloc+0x4e>
}
    5109:	c9                   	leave  
    510a:	c3                   	ret    

0000510b <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    510b:	55                   	push   %ebp
    510c:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    510e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5112:	79 07                	jns    511b <abs+0x10>
		return x * -1;
    5114:	8b 45 08             	mov    0x8(%ebp),%eax
    5117:	f7 d8                	neg    %eax
    5119:	eb 03                	jmp    511e <abs+0x13>
	else
		return x;
    511b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    511e:	5d                   	pop    %ebp
    511f:	c3                   	ret    

00005120 <sin>:
double sin(double x)  
{  
    5120:	55                   	push   %ebp
    5121:	89 e5                	mov    %esp,%ebp
    5123:	83 ec 3c             	sub    $0x3c,%esp
    5126:	8b 45 08             	mov    0x8(%ebp),%eax
    5129:	89 45 c8             	mov    %eax,-0x38(%ebp)
    512c:	8b 45 0c             	mov    0xc(%ebp),%eax
    512f:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    5132:	dd 45 c8             	fldl   -0x38(%ebp)
    5135:	dd 5d f8             	fstpl  -0x8(%ebp)
    5138:	d9 e8                	fld1   
    513a:	dd 5d f0             	fstpl  -0x10(%ebp)
    513d:	dd 45 c8             	fldl   -0x38(%ebp)
    5140:	dd 5d e8             	fstpl  -0x18(%ebp)
    5143:	dd 45 c8             	fldl   -0x38(%ebp)
    5146:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    5149:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    5150:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    5157:	eb 50                	jmp    51a9 <sin+0x89>
	{  
		n = n+1;  
    5159:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    515d:	db 45 dc             	fildl  -0x24(%ebp)
    5160:	dc 4d f0             	fmull  -0x10(%ebp)
    5163:	8b 45 dc             	mov    -0x24(%ebp),%eax
    5166:	83 c0 01             	add    $0x1,%eax
    5169:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    516c:	db 45 c4             	fildl  -0x3c(%ebp)
    516f:	de c9                	fmulp  %st,%st(1)
    5171:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    5174:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    5178:	dd 45 c8             	fldl   -0x38(%ebp)
    517b:	dc 4d c8             	fmull  -0x38(%ebp)
    517e:	dd 45 e8             	fldl   -0x18(%ebp)
    5181:	de c9                	fmulp  %st,%st(1)
    5183:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    5186:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    5189:	dd 45 e8             	fldl   -0x18(%ebp)
    518c:	dc 75 f0             	fdivl  -0x10(%ebp)
    518f:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    5192:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    5196:	7e 08                	jle    51a0 <sin+0x80>
    5198:	dd 45 f8             	fldl   -0x8(%ebp)
    519b:	dc 45 e0             	faddl  -0x20(%ebp)
    519e:	eb 06                	jmp    51a6 <sin+0x86>
    51a0:	dd 45 f8             	fldl   -0x8(%ebp)
    51a3:	dc 65 e0             	fsubl  -0x20(%ebp)
    51a6:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    51a9:	dd 45 e0             	fldl   -0x20(%ebp)
    51ac:	dd 05 d8 ba 00 00    	fldl   0xbad8
    51b2:	d9 c9                	fxch   %st(1)
    51b4:	df e9                	fucomip %st(1),%st
    51b6:	dd d8                	fstp   %st(0)
    51b8:	77 9f                	ja     5159 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    51ba:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    51bd:	c9                   	leave  
    51be:	c3                   	ret    

000051bf <cos>:
double cos(double x)  
{  
    51bf:	55                   	push   %ebp
    51c0:	89 e5                	mov    %esp,%ebp
    51c2:	83 ec 10             	sub    $0x10,%esp
    51c5:	8b 45 08             	mov    0x8(%ebp),%eax
    51c8:	89 45 f8             	mov    %eax,-0x8(%ebp)
    51cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    51ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    51d1:	dd 05 e0 ba 00 00    	fldl   0xbae0
    51d7:	dc 65 f8             	fsubl  -0x8(%ebp)
    51da:	dd 1c 24             	fstpl  (%esp)
    51dd:	e8 3e ff ff ff       	call   5120 <sin>
}  
    51e2:	c9                   	leave  
    51e3:	c3                   	ret    

000051e4 <tan>:
double tan(double x)  
{  
    51e4:	55                   	push   %ebp
    51e5:	89 e5                	mov    %esp,%ebp
    51e7:	83 ec 18             	sub    $0x18,%esp
    51ea:	8b 45 08             	mov    0x8(%ebp),%eax
    51ed:	89 45 f8             	mov    %eax,-0x8(%ebp)
    51f0:	8b 45 0c             	mov    0xc(%ebp),%eax
    51f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    51f6:	dd 45 f8             	fldl   -0x8(%ebp)
    51f9:	dd 1c 24             	fstpl  (%esp)
    51fc:	e8 1f ff ff ff       	call   5120 <sin>
    5201:	dd 5d f0             	fstpl  -0x10(%ebp)
    5204:	dd 45 f8             	fldl   -0x8(%ebp)
    5207:	dd 1c 24             	fstpl  (%esp)
    520a:	e8 b0 ff ff ff       	call   51bf <cos>
    520f:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    5212:	c9                   	leave  
    5213:	c3                   	ret    

00005214 <pow>:

double pow(double x, double y)
{
    5214:	55                   	push   %ebp
    5215:	89 e5                	mov    %esp,%ebp
    5217:	83 ec 48             	sub    $0x48,%esp
    521a:	8b 45 08             	mov    0x8(%ebp),%eax
    521d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5220:	8b 45 0c             	mov    0xc(%ebp),%eax
    5223:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5226:	8b 45 10             	mov    0x10(%ebp),%eax
    5229:	89 45 d8             	mov    %eax,-0x28(%ebp)
    522c:	8b 45 14             	mov    0x14(%ebp),%eax
    522f:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    5232:	dd 45 e0             	fldl   -0x20(%ebp)
    5235:	d9 ee                	fldz   
    5237:	df e9                	fucomip %st(1),%st
    5239:	dd d8                	fstp   %st(0)
    523b:	7a 28                	jp     5265 <pow+0x51>
    523d:	dd 45 e0             	fldl   -0x20(%ebp)
    5240:	d9 ee                	fldz   
    5242:	df e9                	fucomip %st(1),%st
    5244:	dd d8                	fstp   %st(0)
    5246:	75 1d                	jne    5265 <pow+0x51>
    5248:	dd 45 d8             	fldl   -0x28(%ebp)
    524b:	d9 ee                	fldz   
    524d:	df e9                	fucomip %st(1),%st
    524f:	dd d8                	fstp   %st(0)
    5251:	7a 0b                	jp     525e <pow+0x4a>
    5253:	dd 45 d8             	fldl   -0x28(%ebp)
    5256:	d9 ee                	fldz   
    5258:	df e9                	fucomip %st(1),%st
    525a:	dd d8                	fstp   %st(0)
    525c:	74 07                	je     5265 <pow+0x51>
    525e:	d9 ee                	fldz   
    5260:	e9 30 01 00 00       	jmp    5395 <pow+0x181>
	else if(x==0 && y==0) return 1;
    5265:	dd 45 e0             	fldl   -0x20(%ebp)
    5268:	d9 ee                	fldz   
    526a:	df e9                	fucomip %st(1),%st
    526c:	dd d8                	fstp   %st(0)
    526e:	7a 28                	jp     5298 <pow+0x84>
    5270:	dd 45 e0             	fldl   -0x20(%ebp)
    5273:	d9 ee                	fldz   
    5275:	df e9                	fucomip %st(1),%st
    5277:	dd d8                	fstp   %st(0)
    5279:	75 1d                	jne    5298 <pow+0x84>
    527b:	dd 45 d8             	fldl   -0x28(%ebp)
    527e:	d9 ee                	fldz   
    5280:	df e9                	fucomip %st(1),%st
    5282:	dd d8                	fstp   %st(0)
    5284:	7a 12                	jp     5298 <pow+0x84>
    5286:	dd 45 d8             	fldl   -0x28(%ebp)
    5289:	d9 ee                	fldz   
    528b:	df e9                	fucomip %st(1),%st
    528d:	dd d8                	fstp   %st(0)
    528f:	75 07                	jne    5298 <pow+0x84>
    5291:	d9 e8                	fld1   
    5293:	e9 fd 00 00 00       	jmp    5395 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    5298:	d9 ee                	fldz   
    529a:	dd 45 d8             	fldl   -0x28(%ebp)
    529d:	d9 c9                	fxch   %st(1)
    529f:	df e9                	fucomip %st(1),%st
    52a1:	dd d8                	fstp   %st(0)
    52a3:	76 1d                	jbe    52c2 <pow+0xae>
    52a5:	dd 45 d8             	fldl   -0x28(%ebp)
    52a8:	d9 e0                	fchs   
    52aa:	dd 5c 24 08          	fstpl  0x8(%esp)
    52ae:	dd 45 e0             	fldl   -0x20(%ebp)
    52b1:	dd 1c 24             	fstpl  (%esp)
    52b4:	e8 5b ff ff ff       	call   5214 <pow>
    52b9:	d9 e8                	fld1   
    52bb:	de f1                	fdivp  %st,%st(1)
    52bd:	e9 d3 00 00 00       	jmp    5395 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    52c2:	d9 ee                	fldz   
    52c4:	dd 45 e0             	fldl   -0x20(%ebp)
    52c7:	d9 c9                	fxch   %st(1)
    52c9:	df e9                	fucomip %st(1),%st
    52cb:	dd d8                	fstp   %st(0)
    52cd:	76 40                	jbe    530f <pow+0xfb>
    52cf:	dd 45 d8             	fldl   -0x28(%ebp)
    52d2:	d9 7d d6             	fnstcw -0x2a(%ebp)
    52d5:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    52d9:	b4 0c                	mov    $0xc,%ah
    52db:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    52df:	d9 6d d4             	fldcw  -0x2c(%ebp)
    52e2:	db 5d d0             	fistpl -0x30(%ebp)
    52e5:	d9 6d d6             	fldcw  -0x2a(%ebp)
    52e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    52eb:	89 45 d0             	mov    %eax,-0x30(%ebp)
    52ee:	db 45 d0             	fildl  -0x30(%ebp)
    52f1:	dd 45 d8             	fldl   -0x28(%ebp)
    52f4:	de e1                	fsubp  %st,%st(1)
    52f6:	d9 ee                	fldz   
    52f8:	df e9                	fucomip %st(1),%st
    52fa:	7a 0a                	jp     5306 <pow+0xf2>
    52fc:	d9 ee                	fldz   
    52fe:	df e9                	fucomip %st(1),%st
    5300:	dd d8                	fstp   %st(0)
    5302:	74 0b                	je     530f <pow+0xfb>
    5304:	eb 02                	jmp    5308 <pow+0xf4>
    5306:	dd d8                	fstp   %st(0)
    5308:	d9 ee                	fldz   
    530a:	e9 86 00 00 00       	jmp    5395 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    530f:	d9 ee                	fldz   
    5311:	dd 45 e0             	fldl   -0x20(%ebp)
    5314:	d9 c9                	fxch   %st(1)
    5316:	df e9                	fucomip %st(1),%st
    5318:	dd d8                	fstp   %st(0)
    531a:	76 63                	jbe    537f <pow+0x16b>
    531c:	dd 45 d8             	fldl   -0x28(%ebp)
    531f:	d9 7d d6             	fnstcw -0x2a(%ebp)
    5322:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    5326:	b4 0c                	mov    $0xc,%ah
    5328:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    532c:	d9 6d d4             	fldcw  -0x2c(%ebp)
    532f:	db 5d d0             	fistpl -0x30(%ebp)
    5332:	d9 6d d6             	fldcw  -0x2a(%ebp)
    5335:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5338:	89 45 d0             	mov    %eax,-0x30(%ebp)
    533b:	db 45 d0             	fildl  -0x30(%ebp)
    533e:	dd 45 d8             	fldl   -0x28(%ebp)
    5341:	de e1                	fsubp  %st,%st(1)
    5343:	d9 ee                	fldz   
    5345:	df e9                	fucomip %st(1),%st
    5347:	7a 34                	jp     537d <pow+0x169>
    5349:	d9 ee                	fldz   
    534b:	df e9                	fucomip %st(1),%st
    534d:	dd d8                	fstp   %st(0)
    534f:	75 2e                	jne    537f <pow+0x16b>
	{
		double powint=1;
    5351:	d9 e8                	fld1   
    5353:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    5356:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    535d:	eb 0d                	jmp    536c <pow+0x158>
    535f:	dd 45 f0             	fldl   -0x10(%ebp)
    5362:	dc 4d e0             	fmull  -0x20(%ebp)
    5365:	dd 5d f0             	fstpl  -0x10(%ebp)
    5368:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    536c:	db 45 ec             	fildl  -0x14(%ebp)
    536f:	dd 45 d8             	fldl   -0x28(%ebp)
    5372:	df e9                	fucomip %st(1),%st
    5374:	dd d8                	fstp   %st(0)
    5376:	73 e7                	jae    535f <pow+0x14b>
		return powint;
    5378:	dd 45 f0             	fldl   -0x10(%ebp)
    537b:	eb 18                	jmp    5395 <pow+0x181>
    537d:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    537f:	dd 45 e0             	fldl   -0x20(%ebp)
    5382:	dd 1c 24             	fstpl  (%esp)
    5385:	e8 36 00 00 00       	call   53c0 <ln>
    538a:	dc 4d d8             	fmull  -0x28(%ebp)
    538d:	dd 1c 24             	fstpl  (%esp)
    5390:	e8 0e 02 00 00       	call   55a3 <exp>
}
    5395:	c9                   	leave  
    5396:	c3                   	ret    

00005397 <sqrt>:
// 求根
double sqrt(double x)
{
    5397:	55                   	push   %ebp
    5398:	89 e5                	mov    %esp,%ebp
    539a:	83 ec 28             	sub    $0x28,%esp
    539d:	8b 45 08             	mov    0x8(%ebp),%eax
    53a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    53a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    53a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    53a9:	dd 05 e8 ba 00 00    	fldl   0xbae8
    53af:	dd 5c 24 08          	fstpl  0x8(%esp)
    53b3:	dd 45 f0             	fldl   -0x10(%ebp)
    53b6:	dd 1c 24             	fstpl  (%esp)
    53b9:	e8 56 fe ff ff       	call   5214 <pow>
}
    53be:	c9                   	leave  
    53bf:	c3                   	ret    

000053c0 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    53c0:	55                   	push   %ebp
    53c1:	89 e5                	mov    %esp,%ebp
    53c3:	81 ec 88 00 00 00    	sub    $0x88,%esp
    53c9:	8b 45 08             	mov    0x8(%ebp),%eax
    53cc:	89 45 90             	mov    %eax,-0x70(%ebp)
    53cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    53d2:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    53d5:	dd 45 90             	fldl   -0x70(%ebp)
    53d8:	d9 e8                	fld1   
    53da:	de e9                	fsubrp %st,%st(1)
    53dc:	dd 5d c0             	fstpl  -0x40(%ebp)
    53df:	d9 ee                	fldz   
    53e1:	dd 5d f0             	fstpl  -0x10(%ebp)
    53e4:	d9 ee                	fldz   
    53e6:	dd 5d b8             	fstpl  -0x48(%ebp)
    53e9:	d9 ee                	fldz   
    53eb:	dd 5d b0             	fstpl  -0x50(%ebp)
    53ee:	d9 ee                	fldz   
    53f0:	dd 5d e8             	fstpl  -0x18(%ebp)
    53f3:	d9 e8                	fld1   
    53f5:	dd 5d e0             	fstpl  -0x20(%ebp)
    53f8:	d9 e8                	fld1   
    53fa:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    53fd:	dd 45 90             	fldl   -0x70(%ebp)
    5400:	d9 e8                	fld1   
    5402:	df e9                	fucomip %st(1),%st
    5404:	dd d8                	fstp   %st(0)
    5406:	7a 12                	jp     541a <ln+0x5a>
    5408:	dd 45 90             	fldl   -0x70(%ebp)
    540b:	d9 e8                	fld1   
    540d:	df e9                	fucomip %st(1),%st
    540f:	dd d8                	fstp   %st(0)
    5411:	75 07                	jne    541a <ln+0x5a>
    5413:	d9 ee                	fldz   
    5415:	e9 87 01 00 00       	jmp    55a1 <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    541a:	dd 45 90             	fldl   -0x70(%ebp)
    541d:	dd 05 f0 ba 00 00    	fldl   0xbaf0
    5423:	d9 c9                	fxch   %st(1)
    5425:	df e9                	fucomip %st(1),%st
    5427:	dd d8                	fstp   %st(0)
    5429:	76 14                	jbe    543f <ln+0x7f>
    542b:	d9 e8                	fld1   
    542d:	dc 75 90             	fdivl  -0x70(%ebp)
    5430:	dd 1c 24             	fstpl  (%esp)
    5433:	e8 88 ff ff ff       	call   53c0 <ln>
    5438:	d9 e0                	fchs   
    543a:	e9 62 01 00 00       	jmp    55a1 <ln+0x1e1>
	else if(x<.1)
    543f:	dd 05 f8 ba 00 00    	fldl   0xbaf8
    5445:	dd 45 90             	fldl   -0x70(%ebp)
    5448:	d9 c9                	fxch   %st(1)
    544a:	df e9                	fucomip %st(1),%st
    544c:	dd d8                	fstp   %st(0)
    544e:	76 59                	jbe    54a9 <ln+0xe9>
	{
		double n=-1;
    5450:	d9 e8                	fld1   
    5452:	d9 e0                	fchs   
    5454:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    5457:	dd 45 c8             	fldl   -0x38(%ebp)
    545a:	dd 05 00 bb 00 00    	fldl   0xbb00
    5460:	de e9                	fsubrp %st,%st(1)
    5462:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    5465:	dd 45 c8             	fldl   -0x38(%ebp)
    5468:	dd 1c 24             	fstpl  (%esp)
    546b:	e8 33 01 00 00       	call   55a3 <exp>
    5470:	dd 45 90             	fldl   -0x70(%ebp)
    5473:	de f1                	fdivp  %st,%st(1)
    5475:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    5478:	dd 45 a0             	fldl   -0x60(%ebp)
    547b:	dd 05 f0 ba 00 00    	fldl   0xbaf0
    5481:	d9 c9                	fxch   %st(1)
    5483:	df e9                	fucomip %st(1),%st
    5485:	dd d8                	fstp   %st(0)
    5487:	77 ce                	ja     5457 <ln+0x97>
    5489:	d9 e8                	fld1   
    548b:	dd 45 a0             	fldl   -0x60(%ebp)
    548e:	d9 c9                	fxch   %st(1)
    5490:	df e9                	fucomip %st(1),%st
    5492:	dd d8                	fstp   %st(0)
    5494:	77 c1                	ja     5457 <ln+0x97>
		return ln(a)+n;
    5496:	dd 45 a0             	fldl   -0x60(%ebp)
    5499:	dd 1c 24             	fstpl  (%esp)
    549c:	e8 1f ff ff ff       	call   53c0 <ln>
    54a1:	dc 45 c8             	faddl  -0x38(%ebp)
    54a4:	e9 f8 00 00 00       	jmp    55a1 <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    54a9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    54b0:	d9 e8                	fld1   
    54b2:	dd 5d d8             	fstpl  -0x28(%ebp)
    54b5:	e9 b6 00 00 00       	jmp    5570 <ln+0x1b0>
	{
		ln_tmp=ln_px;
    54ba:	dd 45 e8             	fldl   -0x18(%ebp)
    54bd:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    54c0:	dd 45 d8             	fldl   -0x28(%ebp)
    54c3:	dc 4d c0             	fmull  -0x40(%ebp)
    54c6:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    54c9:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    54cd:	75 0d                	jne    54dc <ln+0x11c>
    54cf:	db 45 d4             	fildl  -0x2c(%ebp)
    54d2:	dd 45 d8             	fldl   -0x28(%ebp)
    54d5:	de f1                	fdivp  %st,%st(1)
    54d7:	dd 5d d8             	fstpl  -0x28(%ebp)
    54da:	eb 13                	jmp    54ef <ln+0x12f>
		else tmp=tmp/-l;
    54dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    54df:	f7 d8                	neg    %eax
    54e1:	89 45 8c             	mov    %eax,-0x74(%ebp)
    54e4:	db 45 8c             	fildl  -0x74(%ebp)
    54e7:	dd 45 d8             	fldl   -0x28(%ebp)
    54ea:	de f1                	fdivp  %st,%st(1)
    54ec:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    54ef:	dd 45 f0             	fldl   -0x10(%ebp)
    54f2:	dc 45 d8             	faddl  -0x28(%ebp)
    54f5:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    54f8:	dd 45 d8             	fldl   -0x28(%ebp)
    54fb:	d9 e0                	fchs   
    54fd:	dc 4d c0             	fmull  -0x40(%ebp)
    5500:	db 45 d4             	fildl  -0x2c(%ebp)
    5503:	de c9                	fmulp  %st,%st(1)
    5505:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5508:	83 c0 01             	add    $0x1,%eax
    550b:	89 45 8c             	mov    %eax,-0x74(%ebp)
    550e:	db 45 8c             	fildl  -0x74(%ebp)
    5511:	de f9                	fdivrp %st,%st(1)
    5513:	dc 45 f0             	faddl  -0x10(%ebp)
    5516:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    5519:	dd 45 d8             	fldl   -0x28(%ebp)
    551c:	dc 4d c0             	fmull  -0x40(%ebp)
    551f:	dc 4d c0             	fmull  -0x40(%ebp)
    5522:	db 45 d4             	fildl  -0x2c(%ebp)
    5525:	de c9                	fmulp  %st,%st(1)
    5527:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    552a:	83 c0 02             	add    $0x2,%eax
    552d:	89 45 8c             	mov    %eax,-0x74(%ebp)
    5530:	db 45 8c             	fildl  -0x74(%ebp)
    5533:	de f9                	fdivrp %st,%st(1)
    5535:	dc 45 b8             	faddl  -0x48(%ebp)
    5538:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    553b:	dd 45 b0             	fldl   -0x50(%ebp)
    553e:	dc 65 b8             	fsubl  -0x48(%ebp)
    5541:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    5544:	dd 45 a8             	fldl   -0x58(%ebp)
    5547:	dc 4d a8             	fmull  -0x58(%ebp)
    554a:	dd 45 b8             	fldl   -0x48(%ebp)
    554d:	d8 c0                	fadd   %st(0),%st
    554f:	dd 45 b0             	fldl   -0x50(%ebp)
    5552:	de e1                	fsubp  %st,%st(1)
    5554:	dc 45 f0             	faddl  -0x10(%ebp)
    5557:	de f9                	fdivrp %st,%st(1)
    5559:	dd 45 b0             	fldl   -0x50(%ebp)
    555c:	de e1                	fsubp  %st,%st(1)
    555e:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    5561:	db 45 d4             	fildl  -0x2c(%ebp)
    5564:	dd 45 d8             	fldl   -0x28(%ebp)
    5567:	de c9                	fmulp  %st,%st(1)
    5569:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    556c:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    5570:	dd 45 e8             	fldl   -0x18(%ebp)
    5573:	dc 65 e0             	fsubl  -0x20(%ebp)
    5576:	dd 05 08 bb 00 00    	fldl   0xbb08
    557c:	d9 c9                	fxch   %st(1)
    557e:	df e9                	fucomip %st(1),%st
    5580:	dd d8                	fstp   %st(0)
    5582:	0f 87 32 ff ff ff    	ja     54ba <ln+0xfa>
    5588:	dd 45 e8             	fldl   -0x18(%ebp)
    558b:	dc 65 e0             	fsubl  -0x20(%ebp)
    558e:	dd 05 10 bb 00 00    	fldl   0xbb10
    5594:	df e9                	fucomip %st(1),%st
    5596:	dd d8                	fstp   %st(0)
    5598:	0f 87 1c ff ff ff    	ja     54ba <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    559e:	dd 45 e8             	fldl   -0x18(%ebp)
}
    55a1:	c9                   	leave  
    55a2:	c3                   	ret    

000055a3 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    55a3:	55                   	push   %ebp
    55a4:	89 e5                	mov    %esp,%ebp
    55a6:	83 ec 78             	sub    $0x78,%esp
    55a9:	8b 45 08             	mov    0x8(%ebp),%eax
    55ac:	89 45 a0             	mov    %eax,-0x60(%ebp)
    55af:	8b 45 0c             	mov    0xc(%ebp),%eax
    55b2:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    55b5:	dd 45 a0             	fldl   -0x60(%ebp)
    55b8:	dd 5d c0             	fstpl  -0x40(%ebp)
    55bb:	d9 ee                	fldz   
    55bd:	dd 5d f0             	fstpl  -0x10(%ebp)
    55c0:	d9 ee                	fldz   
    55c2:	dd 5d b8             	fstpl  -0x48(%ebp)
    55c5:	d9 ee                	fldz   
    55c7:	dd 5d b0             	fstpl  -0x50(%ebp)
    55ca:	d9 ee                	fldz   
    55cc:	dd 5d e8             	fstpl  -0x18(%ebp)
    55cf:	d9 e8                	fld1   
    55d1:	dd 5d e0             	fstpl  -0x20(%ebp)
    55d4:	d9 e8                	fld1   
    55d6:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    55d9:	dd 45 a0             	fldl   -0x60(%ebp)
    55dc:	d9 ee                	fldz   
    55de:	df e9                	fucomip %st(1),%st
    55e0:	dd d8                	fstp   %st(0)
    55e2:	7a 12                	jp     55f6 <exp+0x53>
    55e4:	dd 45 a0             	fldl   -0x60(%ebp)
    55e7:	d9 ee                	fldz   
    55e9:	df e9                	fucomip %st(1),%st
    55eb:	dd d8                	fstp   %st(0)
    55ed:	75 07                	jne    55f6 <exp+0x53>
    55ef:	d9 e8                	fld1   
    55f1:	e9 08 01 00 00       	jmp    56fe <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    55f6:	d9 ee                	fldz   
    55f8:	dd 45 a0             	fldl   -0x60(%ebp)
    55fb:	d9 c9                	fxch   %st(1)
    55fd:	df e9                	fucomip %st(1),%st
    55ff:	dd d8                	fstp   %st(0)
    5601:	76 16                	jbe    5619 <exp+0x76>
    5603:	dd 45 a0             	fldl   -0x60(%ebp)
    5606:	d9 e0                	fchs   
    5608:	dd 1c 24             	fstpl  (%esp)
    560b:	e8 93 ff ff ff       	call   55a3 <exp>
    5610:	d9 e8                	fld1   
    5612:	de f1                	fdivp  %st,%st(1)
    5614:	e9 e5 00 00 00       	jmp    56fe <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    5619:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    5620:	d9 e8                	fld1   
    5622:	dd 5d d0             	fstpl  -0x30(%ebp)
    5625:	e9 92 00 00 00       	jmp    56bc <exp+0x119>
	{
		ex_tmp=ex_px;
    562a:	dd 45 e8             	fldl   -0x18(%ebp)
    562d:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    5630:	dd 45 d0             	fldl   -0x30(%ebp)
    5633:	dc 4d c0             	fmull  -0x40(%ebp)
    5636:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    5639:	db 45 cc             	fildl  -0x34(%ebp)
    563c:	dd 45 d0             	fldl   -0x30(%ebp)
    563f:	de f1                	fdivp  %st,%st(1)
    5641:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    5644:	dd 45 f0             	fldl   -0x10(%ebp)
    5647:	dc 45 d0             	faddl  -0x30(%ebp)
    564a:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    564d:	dd 45 d0             	fldl   -0x30(%ebp)
    5650:	dc 4d c0             	fmull  -0x40(%ebp)
    5653:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5656:	83 c0 01             	add    $0x1,%eax
    5659:	89 45 9c             	mov    %eax,-0x64(%ebp)
    565c:	db 45 9c             	fildl  -0x64(%ebp)
    565f:	de f9                	fdivrp %st,%st(1)
    5661:	dc 45 f0             	faddl  -0x10(%ebp)
    5664:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    5667:	dd 45 d0             	fldl   -0x30(%ebp)
    566a:	dc 4d c0             	fmull  -0x40(%ebp)
    566d:	dc 4d c0             	fmull  -0x40(%ebp)
    5670:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5673:	83 c0 01             	add    $0x1,%eax
    5676:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5679:	db 45 9c             	fildl  -0x64(%ebp)
    567c:	de f9                	fdivrp %st,%st(1)
    567e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5681:	83 c0 02             	add    $0x2,%eax
    5684:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5687:	db 45 9c             	fildl  -0x64(%ebp)
    568a:	de f9                	fdivrp %st,%st(1)
    568c:	dc 45 b8             	faddl  -0x48(%ebp)
    568f:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    5692:	dd 45 b0             	fldl   -0x50(%ebp)
    5695:	dc 65 b8             	fsubl  -0x48(%ebp)
    5698:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    569b:	dd 45 d8             	fldl   -0x28(%ebp)
    569e:	dc 4d d8             	fmull  -0x28(%ebp)
    56a1:	dd 45 b8             	fldl   -0x48(%ebp)
    56a4:	d8 c0                	fadd   %st(0),%st
    56a6:	dd 45 b0             	fldl   -0x50(%ebp)
    56a9:	de e1                	fsubp  %st,%st(1)
    56ab:	dc 45 f0             	faddl  -0x10(%ebp)
    56ae:	de f9                	fdivrp %st,%st(1)
    56b0:	dd 45 b0             	fldl   -0x50(%ebp)
    56b3:	de e1                	fsubp  %st,%st(1)
    56b5:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    56b8:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    56bc:	dd 45 e8             	fldl   -0x18(%ebp)
    56bf:	dc 65 e0             	fsubl  -0x20(%ebp)
    56c2:	dd 05 18 bb 00 00    	fldl   0xbb18
    56c8:	d9 c9                	fxch   %st(1)
    56ca:	df e9                	fucomip %st(1),%st
    56cc:	dd d8                	fstp   %st(0)
    56ce:	77 12                	ja     56e2 <exp+0x13f>
    56d0:	dd 45 e8             	fldl   -0x18(%ebp)
    56d3:	dc 65 e0             	fsubl  -0x20(%ebp)
    56d6:	dd 05 20 bb 00 00    	fldl   0xbb20
    56dc:	df e9                	fucomip %st(1),%st
    56de:	dd d8                	fstp   %st(0)
    56e0:	76 15                	jbe    56f7 <exp+0x154>
    56e2:	dd 45 d8             	fldl   -0x28(%ebp)
    56e5:	dd 05 18 bb 00 00    	fldl   0xbb18
    56eb:	d9 c9                	fxch   %st(1)
    56ed:	df e9                	fucomip %st(1),%st
    56ef:	dd d8                	fstp   %st(0)
    56f1:	0f 87 33 ff ff ff    	ja     562a <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    56f7:	dd 45 e8             	fldl   -0x18(%ebp)
    56fa:	d9 e8                	fld1   
    56fc:	de c1                	faddp  %st,%st(1)
    56fe:	c9                   	leave  
    56ff:	c3                   	ret    

00005700 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    5700:	55                   	push   %ebp
    5701:	89 e5                	mov    %esp,%ebp
    5703:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    5706:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    570a:	8b 45 08             	mov    0x8(%ebp),%eax
    570d:	89 44 24 04          	mov    %eax,0x4(%esp)
    5711:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5714:	89 04 24             	mov    %eax,(%esp)
    5717:	e8 f8 f1 ff ff       	call   4914 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    571c:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5723:	00 
    5724:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5727:	89 04 24             	mov    %eax,(%esp)
    572a:	e8 68 f4 ff ff       	call   4b97 <open>
    572f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5732:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    5736:	75 1b                	jne    5753 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    5738:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    573b:	89 44 24 08          	mov    %eax,0x8(%esp)
    573f:	c7 44 24 04 54 bb 00 	movl   $0xbb54,0x4(%esp)
    5746:	00 
    5747:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    574e:	e8 ec f5 ff ff       	call   4d3f <printf>
    }
    return f;
    5753:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5756:	c9                   	leave  
    5757:	c3                   	ret    

00005758 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    5758:	55                   	push   %ebp
    5759:	89 e5                	mov    %esp,%ebp
    575b:	57                   	push   %edi
    575c:	56                   	push   %esi
    575d:	53                   	push   %ebx
    575e:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    5761:	8b 45 08             	mov    0x8(%ebp),%eax
    5764:	8b 00                	mov    (%eax),%eax
    5766:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5769:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    576c:	8b 78 14             	mov    0x14(%eax),%edi
    576f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5772:	8b 70 10             	mov    0x10(%eax),%esi
    5775:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5778:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    577b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    577e:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5781:	85 c0                	test   %eax,%eax
    5783:	0f 94 c0             	sete   %al
    5786:	0f b6 c8             	movzbl %al,%ecx
    5789:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    578c:	8b 50 04             	mov    0x4(%eax),%edx
    578f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5792:	8b 00                	mov    (%eax),%eax
    5794:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    5798:	89 74 24 18          	mov    %esi,0x18(%esp)
    579c:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    57a0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    57a4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    57a8:	89 44 24 08          	mov    %eax,0x8(%esp)
    57ac:	c7 44 24 04 74 bb 00 	movl   $0xbb74,0x4(%esp)
    57b3:	00 
    57b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    57bb:	e8 7f f5 ff ff       	call   4d3f <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    57c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    57c3:	8b 78 2c             	mov    0x2c(%eax),%edi
    57c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    57c9:	8b 70 28             	mov    0x28(%eax),%esi
    57cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    57cf:	8b 58 24             	mov    0x24(%eax),%ebx
    57d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    57d5:	8b 48 20             	mov    0x20(%eax),%ecx
    57d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    57db:	8b 50 1c             	mov    0x1c(%eax),%edx
    57de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    57e1:	8b 40 18             	mov    0x18(%eax),%eax
    57e4:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    57e8:	89 74 24 18          	mov    %esi,0x18(%esp)
    57ec:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    57f0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    57f4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    57f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    57fc:	c7 44 24 04 b4 bb 00 	movl   $0xbbb4,0x4(%esp)
    5803:	00 
    5804:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    580b:	e8 2f f5 ff ff       	call   4d3f <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5810:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5813:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5816:	8b 0c 85 80 fb 00 00 	mov    0xfb80(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    581d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5820:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5823:	dd 04 c5 60 fb 00 00 	fldl   0xfb60(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    582a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    582d:	8b 40 04             	mov    0x4(%eax),%eax
    5830:	8d 50 ff             	lea    -0x1(%eax),%edx
    5833:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5836:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5839:	89 d0                	mov    %edx,%eax
    583b:	c1 e0 04             	shl    $0x4,%eax
    583e:	29 d0                	sub    %edx,%eax
    5840:	01 d8                	add    %ebx,%eax
    5842:	8b 14 85 a0 fa 00 00 	mov    0xfaa0(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5849:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    584c:	8b 40 04             	mov    0x4(%eax),%eax
    584f:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5852:	8b 04 85 80 fa 00 00 	mov    0xfa80(,%eax,4),%eax
    5859:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    585d:	dd 5c 24 10          	fstpl  0x10(%esp)
    5861:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5865:	89 44 24 08          	mov    %eax,0x8(%esp)
    5869:	c7 44 24 04 dc bb 00 	movl   $0xbbdc,0x4(%esp)
    5870:	00 
    5871:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5878:	e8 c2 f4 ff ff       	call   4d3f <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    587d:	8b 45 08             	mov    0x8(%ebp),%eax
    5880:	8b 48 08             	mov    0x8(%eax),%ecx
    5883:	8b 45 08             	mov    0x8(%ebp),%eax
    5886:	8b 50 0c             	mov    0xc(%eax),%edx
    5889:	8b 45 08             	mov    0x8(%ebp),%eax
    588c:	8b 40 10             	mov    0x10(%eax),%eax
    588f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5893:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5897:	89 44 24 08          	mov    %eax,0x8(%esp)
    589b:	c7 44 24 04 0b bc 00 	movl   $0xbc0b,0x4(%esp)
    58a2:	00 
    58a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    58aa:	e8 90 f4 ff ff       	call   4d3f <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    58af:	83 c4 3c             	add    $0x3c,%esp
    58b2:	5b                   	pop    %ebx
    58b3:	5e                   	pop    %esi
    58b4:	5f                   	pop    %edi
    58b5:	5d                   	pop    %ebp
    58b6:	c3                   	ret    

000058b7 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    58b7:	55                   	push   %ebp
    58b8:	89 e5                	mov    %esp,%ebp
    58ba:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    58bd:	8b 45 08             	mov    0x8(%ebp),%eax
    58c0:	89 04 24             	mov    %eax,(%esp)
    58c3:	e8 63 f7 ff ff       	call   502b <malloc>
    58c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    58cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    58cf:	74 1c                	je     58ed <mem_alloc+0x36>
		memset(ptr, 0, block);
    58d1:	8b 45 08             	mov    0x8(%ebp),%eax
    58d4:	89 44 24 08          	mov    %eax,0x8(%esp)
    58d8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    58df:	00 
    58e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58e3:	89 04 24             	mov    %eax,(%esp)
    58e6:	e8 bf f0 ff ff       	call   49aa <memset>
    58eb:	eb 20                	jmp    590d <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    58ed:	8b 45 0c             	mov    0xc(%ebp),%eax
    58f0:	89 44 24 08          	mov    %eax,0x8(%esp)
    58f4:	c7 44 24 04 25 bc 00 	movl   $0xbc25,0x4(%esp)
    58fb:	00 
    58fc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5903:	e8 37 f4 ff ff       	call   4d3f <printf>
		exit();
    5908:	e8 4a f2 ff ff       	call   4b57 <exit>
	}
	return ptr;
    590d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5910:	c9                   	leave  
    5911:	c3                   	ret    

00005912 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    5912:	55                   	push   %ebp
    5913:	89 e5                	mov    %esp,%ebp
    5915:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    5918:	8b 45 0c             	mov    0xc(%ebp),%eax
    591b:	c7 44 24 04 3c bc 00 	movl   $0xbc3c,0x4(%esp)
    5922:	00 
    5923:	89 04 24             	mov    %eax,(%esp)
    5926:	e8 8c ff ff ff       	call   58b7 <mem_alloc>
    592b:	8b 55 08             	mov    0x8(%ebp),%edx
    592e:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    5931:	8b 45 08             	mov    0x8(%ebp),%eax
    5934:	8b 55 0c             	mov    0xc(%ebp),%edx
    5937:	89 50 08             	mov    %edx,0x8(%eax)
}
    593a:	c9                   	leave  
    593b:	c3                   	ret    

0000593c <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    593c:	55                   	push   %ebp
    593d:	89 e5                	mov    %esp,%ebp
    593f:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    5942:	8b 45 08             	mov    0x8(%ebp),%eax
    5945:	8b 40 04             	mov    0x4(%eax),%eax
    5948:	89 04 24             	mov    %eax,(%esp)
    594b:	e8 a2 f5 ff ff       	call   4ef2 <free>
}
    5950:	c9                   	leave  
    5951:	c3                   	ret    

00005952 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    5952:	55                   	push   %ebp
    5953:	89 e5                	mov    %esp,%ebp
    5955:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    5958:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    595f:	00 
    5960:	8b 45 0c             	mov    0xc(%ebp),%eax
    5963:	89 04 24             	mov    %eax,(%esp)
    5966:	e8 2c f2 ff ff       	call   4b97 <open>
    596b:	8b 55 08             	mov    0x8(%ebp),%edx
    596e:	89 02                	mov    %eax,(%edx)
    5970:	8b 45 08             	mov    0x8(%ebp),%eax
    5973:	8b 00                	mov    (%eax),%eax
    5975:	83 f8 ff             	cmp    $0xffffffff,%eax
    5978:	75 20                	jne    599a <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    597a:	8b 45 0c             	mov    0xc(%ebp),%eax
    597d:	89 44 24 08          	mov    %eax,0x8(%esp)
    5981:	c7 44 24 04 43 bc 00 	movl   $0xbc43,0x4(%esp)
    5988:	00 
    5989:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5990:	e8 aa f3 ff ff       	call   4d3f <printf>
		exit();
    5995:	e8 bd f1 ff ff       	call   4b57 <exit>
	}

	bs->format = BINARY;
    599a:	8b 45 08             	mov    0x8(%ebp),%eax
    599d:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    59a1:	8b 45 10             	mov    0x10(%ebp),%eax
    59a4:	89 44 24 04          	mov    %eax,0x4(%esp)
    59a8:	8b 45 08             	mov    0x8(%ebp),%eax
    59ab:	89 04 24             	mov    %eax,(%esp)
    59ae:	e8 5f ff ff ff       	call   5912 <alloc_buffer>
	bs->buf_byte_idx=0;
    59b3:	8b 45 08             	mov    0x8(%ebp),%eax
    59b6:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    59bd:	8b 45 08             	mov    0x8(%ebp),%eax
    59c0:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    59c7:	8b 45 08             	mov    0x8(%ebp),%eax
    59ca:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    59d1:	8b 45 08             	mov    0x8(%ebp),%eax
    59d4:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    59db:	8b 45 08             	mov    0x8(%ebp),%eax
    59de:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    59e5:	8b 45 08             	mov    0x8(%ebp),%eax
    59e8:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    59ef:	c9                   	leave  
    59f0:	c3                   	ret    

000059f1 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    59f1:	55                   	push   %ebp
    59f2:	89 e5                	mov    %esp,%ebp
    59f4:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    59f7:	8b 45 08             	mov    0x8(%ebp),%eax
    59fa:	8b 00                	mov    (%eax),%eax
    59fc:	89 04 24             	mov    %eax,(%esp)
    59ff:	e8 7b f1 ff ff       	call   4b7f <close>
	desalloc_buffer(bs);
    5a04:	8b 45 08             	mov    0x8(%ebp),%eax
    5a07:	89 04 24             	mov    %eax,(%esp)
    5a0a:	e8 2d ff ff ff       	call   593c <desalloc_buffer>
}
    5a0f:	c9                   	leave  
    5a10:	c3                   	ret    

00005a11 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    5a11:	55                   	push   %ebp
    5a12:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    5a14:	8b 45 08             	mov    0x8(%ebp),%eax
    5a17:	8b 40 20             	mov    0x20(%eax),%eax
}
    5a1a:	5d                   	pop    %ebp
    5a1b:	c3                   	ret    

00005a1c <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    5a1c:	55                   	push   %ebp
    5a1d:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    5a1f:	8b 45 08             	mov    0x8(%ebp),%eax
    5a22:	8b 40 0c             	mov    0xc(%eax),%eax
}
    5a25:	5d                   	pop    %ebp
    5a26:	c3                   	ret    

00005a27 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    5a27:	55                   	push   %ebp
    5a28:	89 e5                	mov    %esp,%ebp
    5a2a:	56                   	push   %esi
    5a2b:	53                   	push   %ebx
    5a2c:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    5a2f:	8b 45 08             	mov    0x8(%ebp),%eax
    5a32:	8b 40 08             	mov    0x8(%eax),%eax
    5a35:	8d 50 fe             	lea    -0x2(%eax),%edx
    5a38:	8b 45 08             	mov    0x8(%ebp),%eax
    5a3b:	8b 40 10             	mov    0x10(%eax),%eax
    5a3e:	89 d3                	mov    %edx,%ebx
    5a40:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    5a42:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    5a47:	eb 35                	jmp    5a7e <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    5a49:	8b 45 08             	mov    0x8(%ebp),%eax
    5a4c:	8b 50 04             	mov    0x4(%eax),%edx
    5a4f:	89 d8                	mov    %ebx,%eax
    5a51:	8d 58 ff             	lea    -0x1(%eax),%ebx
    5a54:	01 c2                	add    %eax,%edx
    5a56:	8b 45 08             	mov    0x8(%ebp),%eax
    5a59:	8b 00                	mov    (%eax),%eax
    5a5b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5a62:	00 
    5a63:	89 54 24 04          	mov    %edx,0x4(%esp)
    5a67:	89 04 24             	mov    %eax,(%esp)
    5a6a:	e8 00 f1 ff ff       	call   4b6f <read>
    5a6f:	89 c6                	mov    %eax,%esi
		if (!n)
    5a71:	85 f6                	test   %esi,%esi
    5a73:	75 09                	jne    5a7e <refill_buffer+0x57>
		bs->eob= i+1;
    5a75:	8d 53 01             	lea    0x1(%ebx),%edx
    5a78:	8b 45 08             	mov    0x8(%ebp),%eax
    5a7b:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    5a7e:	85 db                	test   %ebx,%ebx
    5a80:	78 0a                	js     5a8c <refill_buffer+0x65>
    5a82:	8b 45 08             	mov    0x8(%ebp),%eax
    5a85:	8b 40 1c             	mov    0x1c(%eax),%eax
    5a88:	85 c0                	test   %eax,%eax
    5a8a:	74 bd                	je     5a49 <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    5a8c:	83 c4 10             	add    $0x10,%esp
    5a8f:	5b                   	pop    %ebx
    5a90:	5e                   	pop    %esi
    5a91:	5d                   	pop    %ebp
    5a92:	c3                   	ret    

00005a93 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    5a93:	55                   	push   %ebp
    5a94:	89 e5                	mov    %esp,%ebp
    5a96:	53                   	push   %ebx
    5a97:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    5a9a:	8b 45 08             	mov    0x8(%ebp),%eax
    5a9d:	8b 40 0c             	mov    0xc(%eax),%eax
    5aa0:	8d 50 01             	lea    0x1(%eax),%edx
    5aa3:	8b 45 08             	mov    0x8(%ebp),%eax
    5aa6:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    5aa9:	8b 45 08             	mov    0x8(%ebp),%eax
    5aac:	8b 40 14             	mov    0x14(%eax),%eax
    5aaf:	85 c0                	test   %eax,%eax
    5ab1:	0f 85 9f 00 00 00    	jne    5b56 <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    5ab7:	8b 45 08             	mov    0x8(%ebp),%eax
    5aba:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    5ac1:	8b 45 08             	mov    0x8(%ebp),%eax
    5ac4:	8b 40 10             	mov    0x10(%eax),%eax
    5ac7:	8d 50 ff             	lea    -0x1(%eax),%edx
    5aca:	8b 45 08             	mov    0x8(%ebp),%eax
    5acd:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    5ad0:	8b 45 08             	mov    0x8(%ebp),%eax
    5ad3:	8b 40 10             	mov    0x10(%eax),%eax
    5ad6:	83 f8 03             	cmp    $0x3,%eax
    5ad9:	7e 10                	jle    5aeb <get1bit+0x58>
    5adb:	8b 45 08             	mov    0x8(%ebp),%eax
    5ade:	8b 50 10             	mov    0x10(%eax),%edx
    5ae1:	8b 45 08             	mov    0x8(%ebp),%eax
    5ae4:	8b 40 1c             	mov    0x1c(%eax),%eax
    5ae7:	39 c2                	cmp    %eax,%edx
    5ae9:	7d 6b                	jge    5b56 <get1bit+0xc3>
             if (bs->eob)
    5aeb:	8b 45 08             	mov    0x8(%ebp),%eax
    5aee:	8b 40 1c             	mov    0x1c(%eax),%eax
    5af1:	85 c0                	test   %eax,%eax
    5af3:	74 0c                	je     5b01 <get1bit+0x6e>
                bs->eobs = TRUE;
    5af5:	8b 45 08             	mov    0x8(%ebp),%eax
    5af8:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5aff:	eb 55                	jmp    5b56 <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5b01:	8b 45 08             	mov    0x8(%ebp),%eax
    5b04:	8b 58 10             	mov    0x10(%eax),%ebx
    5b07:	eb 2f                	jmp    5b38 <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5b09:	8b 45 08             	mov    0x8(%ebp),%eax
    5b0c:	8b 50 04             	mov    0x4(%eax),%edx
    5b0f:	8b 45 08             	mov    0x8(%ebp),%eax
    5b12:	8b 40 08             	mov    0x8(%eax),%eax
    5b15:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5b18:	8b 45 08             	mov    0x8(%ebp),%eax
    5b1b:	8b 40 10             	mov    0x10(%eax),%eax
    5b1e:	29 c1                	sub    %eax,%ecx
    5b20:	89 c8                	mov    %ecx,%eax
    5b22:	01 d8                	add    %ebx,%eax
    5b24:	01 c2                	add    %eax,%edx
    5b26:	8b 45 08             	mov    0x8(%ebp),%eax
    5b29:	8b 48 04             	mov    0x4(%eax),%ecx
    5b2c:	89 d8                	mov    %ebx,%eax
    5b2e:	01 c8                	add    %ecx,%eax
    5b30:	0f b6 00             	movzbl (%eax),%eax
    5b33:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5b35:	83 eb 01             	sub    $0x1,%ebx
    5b38:	85 db                	test   %ebx,%ebx
    5b3a:	79 cd                	jns    5b09 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    5b3c:	8b 45 08             	mov    0x8(%ebp),%eax
    5b3f:	89 04 24             	mov    %eax,(%esp)
    5b42:	e8 e0 fe ff ff       	call   5a27 <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    5b47:	8b 45 08             	mov    0x8(%ebp),%eax
    5b4a:	8b 40 08             	mov    0x8(%eax),%eax
    5b4d:	8d 50 ff             	lea    -0x1(%eax),%edx
    5b50:	8b 45 08             	mov    0x8(%ebp),%eax
    5b53:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    5b56:	8b 45 08             	mov    0x8(%ebp),%eax
    5b59:	8b 50 04             	mov    0x4(%eax),%edx
    5b5c:	8b 45 08             	mov    0x8(%ebp),%eax
    5b5f:	8b 40 10             	mov    0x10(%eax),%eax
    5b62:	01 d0                	add    %edx,%eax
    5b64:	0f b6 00             	movzbl (%eax),%eax
    5b67:	0f b6 d0             	movzbl %al,%edx
    5b6a:	8b 45 08             	mov    0x8(%ebp),%eax
    5b6d:	8b 40 14             	mov    0x14(%eax),%eax
    5b70:	83 e8 01             	sub    $0x1,%eax
    5b73:	8b 04 85 a0 fb 00 00 	mov    0xfba0(,%eax,4),%eax
    5b7a:	21 d0                	and    %edx,%eax
    5b7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    5b7f:	8b 45 08             	mov    0x8(%ebp),%eax
    5b82:	8b 40 14             	mov    0x14(%eax),%eax
    5b85:	83 e8 01             	sub    $0x1,%eax
    5b88:	89 c1                	mov    %eax,%ecx
    5b8a:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    5b8d:	8b 45 08             	mov    0x8(%ebp),%eax
    5b90:	8b 40 14             	mov    0x14(%eax),%eax
    5b93:	8d 50 ff             	lea    -0x1(%eax),%edx
    5b96:	8b 45 08             	mov    0x8(%ebp),%eax
    5b99:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    5b9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5b9f:	83 c4 24             	add    $0x24,%esp
    5ba2:	5b                   	pop    %ebx
    5ba3:	5d                   	pop    %ebp
    5ba4:	c3                   	ret    

00005ba5 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    5ba5:	55                   	push   %ebp
    5ba6:	89 e5                	mov    %esp,%ebp
    5ba8:	57                   	push   %edi
    5ba9:	56                   	push   %esi
    5baa:	53                   	push   %ebx
    5bab:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    5bae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    5bb5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    5bb8:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    5bbc:	7e 1c                	jle    5bda <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    5bbe:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    5bc5:	00 
    5bc6:	c7 44 24 04 5c bc 00 	movl   $0xbc5c,0x4(%esp)
    5bcd:	00 
    5bce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5bd5:	e8 65 f1 ff ff       	call   4d3f <printf>

	bs->totbit += N;
    5bda:	8b 45 08             	mov    0x8(%ebp),%eax
    5bdd:	8b 50 0c             	mov    0xc(%eax),%edx
    5be0:	8b 45 0c             	mov    0xc(%ebp),%eax
    5be3:	01 c2                	add    %eax,%edx
    5be5:	8b 45 08             	mov    0x8(%ebp),%eax
    5be8:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    5beb:	e9 0a 01 00 00       	jmp    5cfa <getbits+0x155>
		if (!bs->buf_bit_idx) {
    5bf0:	8b 45 08             	mov    0x8(%ebp),%eax
    5bf3:	8b 40 14             	mov    0x14(%eax),%eax
    5bf6:	85 c0                	test   %eax,%eax
    5bf8:	0f 85 9f 00 00 00    	jne    5c9d <getbits+0xf8>
			bs->buf_bit_idx = 8;
    5bfe:	8b 45 08             	mov    0x8(%ebp),%eax
    5c01:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    5c08:	8b 45 08             	mov    0x8(%ebp),%eax
    5c0b:	8b 40 10             	mov    0x10(%eax),%eax
    5c0e:	8d 50 ff             	lea    -0x1(%eax),%edx
    5c11:	8b 45 08             	mov    0x8(%ebp),%eax
    5c14:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    5c17:	8b 45 08             	mov    0x8(%ebp),%eax
    5c1a:	8b 40 10             	mov    0x10(%eax),%eax
    5c1d:	83 f8 03             	cmp    $0x3,%eax
    5c20:	7e 10                	jle    5c32 <getbits+0x8d>
    5c22:	8b 45 08             	mov    0x8(%ebp),%eax
    5c25:	8b 50 10             	mov    0x10(%eax),%edx
    5c28:	8b 45 08             	mov    0x8(%ebp),%eax
    5c2b:	8b 40 1c             	mov    0x1c(%eax),%eax
    5c2e:	39 c2                	cmp    %eax,%edx
    5c30:	7d 6b                	jge    5c9d <getbits+0xf8>
				if (bs->eob)
    5c32:	8b 45 08             	mov    0x8(%ebp),%eax
    5c35:	8b 40 1c             	mov    0x1c(%eax),%eax
    5c38:	85 c0                	test   %eax,%eax
    5c3a:	74 0c                	je     5c48 <getbits+0xa3>
					bs->eobs = TRUE;
    5c3c:	8b 45 08             	mov    0x8(%ebp),%eax
    5c3f:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5c46:	eb 55                	jmp    5c9d <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    5c48:	8b 45 08             	mov    0x8(%ebp),%eax
    5c4b:	8b 70 10             	mov    0x10(%eax),%esi
    5c4e:	eb 2f                	jmp    5c7f <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5c50:	8b 45 08             	mov    0x8(%ebp),%eax
    5c53:	8b 50 04             	mov    0x4(%eax),%edx
    5c56:	8b 45 08             	mov    0x8(%ebp),%eax
    5c59:	8b 40 08             	mov    0x8(%eax),%eax
    5c5c:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5c5f:	8b 45 08             	mov    0x8(%ebp),%eax
    5c62:	8b 40 10             	mov    0x10(%eax),%eax
    5c65:	29 c1                	sub    %eax,%ecx
    5c67:	89 c8                	mov    %ecx,%eax
    5c69:	01 f0                	add    %esi,%eax
    5c6b:	01 c2                	add    %eax,%edx
    5c6d:	8b 45 08             	mov    0x8(%ebp),%eax
    5c70:	8b 48 04             	mov    0x4(%eax),%ecx
    5c73:	89 f0                	mov    %esi,%eax
    5c75:	01 c8                	add    %ecx,%eax
    5c77:	0f b6 00             	movzbl (%eax),%eax
    5c7a:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    5c7c:	83 ee 01             	sub    $0x1,%esi
    5c7f:	85 f6                	test   %esi,%esi
    5c81:	79 cd                	jns    5c50 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    5c83:	8b 45 08             	mov    0x8(%ebp),%eax
    5c86:	89 04 24             	mov    %eax,(%esp)
    5c89:	e8 99 fd ff ff       	call   5a27 <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    5c8e:	8b 45 08             	mov    0x8(%ebp),%eax
    5c91:	8b 40 08             	mov    0x8(%eax),%eax
    5c94:	8d 50 ff             	lea    -0x1(%eax),%edx
    5c97:	8b 45 08             	mov    0x8(%ebp),%eax
    5c9a:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    5c9d:	8b 45 08             	mov    0x8(%ebp),%eax
    5ca0:	8b 40 14             	mov    0x14(%eax),%eax
    5ca3:	39 d8                	cmp    %ebx,%eax
    5ca5:	0f 4f c3             	cmovg  %ebx,%eax
    5ca8:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    5caa:	8b 45 08             	mov    0x8(%ebp),%eax
    5cad:	8b 50 04             	mov    0x4(%eax),%edx
    5cb0:	8b 45 08             	mov    0x8(%ebp),%eax
    5cb3:	8b 40 10             	mov    0x10(%eax),%eax
    5cb6:	01 d0                	add    %edx,%eax
    5cb8:	0f b6 00             	movzbl (%eax),%eax
    5cbb:	0f b6 d0             	movzbl %al,%edx
    5cbe:	8b 45 08             	mov    0x8(%ebp),%eax
    5cc1:	8b 40 14             	mov    0x14(%eax),%eax
    5cc4:	8b 04 85 c0 fb 00 00 	mov    0xfbc0(,%eax,4),%eax
    5ccb:	89 d7                	mov    %edx,%edi
    5ccd:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    5ccf:	8b 45 08             	mov    0x8(%ebp),%eax
    5cd2:	8b 40 14             	mov    0x14(%eax),%eax
    5cd5:	29 f0                	sub    %esi,%eax
    5cd7:	89 c1                	mov    %eax,%ecx
    5cd9:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    5cdb:	89 d8                	mov    %ebx,%eax
    5cdd:	29 f0                	sub    %esi,%eax
    5cdf:	89 c1                	mov    %eax,%ecx
    5ce1:	d3 e7                	shl    %cl,%edi
    5ce3:	89 f8                	mov    %edi,%eax
    5ce5:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    5ce8:	8b 45 08             	mov    0x8(%ebp),%eax
    5ceb:	8b 40 14             	mov    0x14(%eax),%eax
    5cee:	29 f0                	sub    %esi,%eax
    5cf0:	89 c2                	mov    %eax,%edx
    5cf2:	8b 45 08             	mov    0x8(%ebp),%eax
    5cf5:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    5cf8:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    5cfa:	85 db                	test   %ebx,%ebx
    5cfc:	0f 8f ee fe ff ff    	jg     5bf0 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    5d02:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    5d05:	83 c4 2c             	add    $0x2c,%esp
    5d08:	5b                   	pop    %ebx
    5d09:	5e                   	pop    %esi
    5d0a:	5f                   	pop    %edi
    5d0b:	5d                   	pop    %ebp
    5d0c:	c3                   	ret    

00005d0d <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    5d0d:	55                   	push   %ebp
    5d0e:	89 e5                	mov    %esp,%ebp
    5d10:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    5d13:	db 45 10             	fildl  0x10(%ebp)
    5d16:	dd 5c 24 08          	fstpl  0x8(%esp)
    5d1a:	dd 05 c8 bc 00 00    	fldl   0xbcc8
    5d20:	dd 1c 24             	fstpl  (%esp)
    5d23:	e8 ec f4 ff ff       	call   5214 <pow>
    5d28:	d9 7d e6             	fnstcw -0x1a(%ebp)
    5d2b:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    5d2f:	b4 0c                	mov    $0xc,%ah
    5d31:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    5d35:	d9 6d e4             	fldcw  -0x1c(%ebp)
    5d38:	db 5d e0             	fistpl -0x20(%ebp)
    5d3b:	d9 6d e6             	fldcw  -0x1a(%ebp)
    5d3e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5d41:	83 e8 01             	sub    $0x1,%eax
    5d44:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    5d47:	8b 45 08             	mov    0x8(%ebp),%eax
    5d4a:	89 04 24             	mov    %eax,(%esp)
    5d4d:	e8 ca fc ff ff       	call   5a1c <sstell>
    5d52:	83 e0 07             	and    $0x7,%eax
    5d55:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    5d58:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5d5c:	74 17                	je     5d75 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    5d5e:	b8 08 00 00 00       	mov    $0x8,%eax
    5d63:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5d66:	89 44 24 04          	mov    %eax,0x4(%esp)
    5d6a:	8b 45 08             	mov    0x8(%ebp),%eax
    5d6d:	89 04 24             	mov    %eax,(%esp)
    5d70:	e8 30 fe ff ff       	call   5ba5 <getbits>

	val = getbits(bs, N);
    5d75:	8b 45 10             	mov    0x10(%ebp),%eax
    5d78:	89 44 24 04          	mov    %eax,0x4(%esp)
    5d7c:	8b 45 08             	mov    0x8(%ebp),%eax
    5d7f:	89 04 24             	mov    %eax,(%esp)
    5d82:	e8 1e fe ff ff       	call   5ba5 <getbits>
    5d87:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    5d8a:	eb 1a                	jmp    5da6 <seek_sync+0x99>
		val <<= ALIGNING;
    5d8c:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    5d90:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    5d97:	00 
    5d98:	8b 45 08             	mov    0x8(%ebp),%eax
    5d9b:	89 04 24             	mov    %eax,(%esp)
    5d9e:	e8 02 fe ff ff       	call   5ba5 <getbits>
    5da3:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    5da6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5da9:	23 45 f4             	and    -0xc(%ebp),%eax
    5dac:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5daf:	74 0f                	je     5dc0 <seek_sync+0xb3>
    5db1:	8b 45 08             	mov    0x8(%ebp),%eax
    5db4:	89 04 24             	mov    %eax,(%esp)
    5db7:	e8 55 fc ff ff       	call   5a11 <end_bs>
    5dbc:	85 c0                	test   %eax,%eax
    5dbe:	74 cc                	je     5d8c <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    5dc0:	8b 45 08             	mov    0x8(%ebp),%eax
    5dc3:	89 04 24             	mov    %eax,(%esp)
    5dc6:	e8 46 fc ff ff       	call   5a11 <end_bs>
    5dcb:	85 c0                	test   %eax,%eax
    5dcd:	74 07                	je     5dd6 <seek_sync+0xc9>
		return(0);
    5dcf:	b8 00 00 00 00       	mov    $0x0,%eax
    5dd4:	eb 05                	jmp    5ddb <seek_sync+0xce>
	else
		return(1);
    5dd6:	b8 01 00 00 00       	mov    $0x1,%eax
}
    5ddb:	c9                   	leave  
    5ddc:	c3                   	ret    

00005ddd <js_bound>:

int js_bound(int lay, int m_ext)
{
    5ddd:	55                   	push   %ebp
    5dde:	89 e5                	mov    %esp,%ebp
    5de0:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    5de3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5de7:	7e 12                	jle    5dfb <js_bound+0x1e>
    5de9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    5ded:	7f 0c                	jg     5dfb <js_bound+0x1e>
    5def:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5df3:	78 06                	js     5dfb <js_bound+0x1e>
    5df5:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    5df9:	7e 27                	jle    5e22 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    5dfb:	8b 45 0c             	mov    0xc(%ebp),%eax
    5dfe:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5e02:	8b 45 08             	mov    0x8(%ebp),%eax
    5e05:	89 44 24 08          	mov    %eax,0x8(%esp)
    5e09:	c7 44 24 04 90 bc 00 	movl   $0xbc90,0x4(%esp)
    5e10:	00 
    5e11:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5e18:	e8 22 ef ff ff       	call   4d3f <printf>
        exit();
    5e1d:	e8 35 ed ff ff       	call   4b57 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    5e22:	8b 45 08             	mov    0x8(%ebp),%eax
    5e25:	83 e8 01             	sub    $0x1,%eax
    5e28:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    5e2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5e32:	01 d0                	add    %edx,%eax
    5e34:	8b 04 85 00 fc 00 00 	mov    0xfc00(,%eax,4),%eax
}
    5e3b:	c9                   	leave  
    5e3c:	c3                   	ret    

00005e3d <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    5e3d:	55                   	push   %ebp
    5e3e:	89 e5                	mov    %esp,%ebp
    5e40:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    5e43:	8b 45 08             	mov    0x8(%ebp),%eax
    5e46:	8b 00                	mov    (%eax),%eax
    5e48:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    5e4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e4e:	8b 50 1c             	mov    0x1c(%eax),%edx
    5e51:	8b 45 08             	mov    0x8(%ebp),%eax
    5e54:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    5e57:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e5a:	8b 40 1c             	mov    0x1c(%eax),%eax
    5e5d:	83 f8 03             	cmp    $0x3,%eax
    5e60:	75 07                	jne    5e69 <hdr_to_frps+0x2c>
    5e62:	b8 01 00 00 00       	mov    $0x1,%eax
    5e67:	eb 05                	jmp    5e6e <hdr_to_frps+0x31>
    5e69:	b8 02 00 00 00       	mov    $0x2,%eax
    5e6e:	8b 55 08             	mov    0x8(%ebp),%edx
    5e71:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    5e74:	8b 45 08             	mov    0x8(%ebp),%eax
    5e77:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    5e7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e81:	8b 40 1c             	mov    0x1c(%eax),%eax
    5e84:	83 f8 01             	cmp    $0x1,%eax
    5e87:	75 20                	jne    5ea9 <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    5e89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e8c:	8b 50 20             	mov    0x20(%eax),%edx
    5e8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e92:	8b 40 04             	mov    0x4(%eax),%eax
    5e95:	89 54 24 04          	mov    %edx,0x4(%esp)
    5e99:	89 04 24             	mov    %eax,(%esp)
    5e9c:	e8 3c ff ff ff       	call   5ddd <js_bound>
    5ea1:	8b 55 08             	mov    0x8(%ebp),%edx
    5ea4:	89 42 0c             	mov    %eax,0xc(%edx)
    5ea7:	eb 0c                	jmp    5eb5 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    5ea9:	8b 45 08             	mov    0x8(%ebp),%eax
    5eac:	8b 50 10             	mov    0x10(%eax),%edx
    5eaf:	8b 45 08             	mov    0x8(%ebp),%eax
    5eb2:	89 50 0c             	mov    %edx,0xc(%eax)
}
    5eb5:	c9                   	leave  
    5eb6:	c3                   	ret    

00005eb7 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    5eb7:	55                   	push   %ebp
    5eb8:	89 e5                	mov    %esp,%ebp
    5eba:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    5ebd:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    5ec1:	74 19                	je     5edc <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    5ec3:	c7 44 24 04 b3 bc 00 	movl   $0xbcb3,0x4(%esp)
    5eca:	00 
    5ecb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5ed2:	e8 68 ee ff ff       	call   4d3f <printf>
		exit();
    5ed7:	e8 7b ec ff ff       	call   4b57 <exit>
	}
	getCoreBuf(1, val);
    5edc:	8b 45 08             	mov    0x8(%ebp),%eax
    5edf:	89 44 24 04          	mov    %eax,0x4(%esp)
    5ee3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    5eea:	e8 68 ed ff ff       	call   4c57 <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    5eef:	c9                   	leave  
    5ef0:	c3                   	ret    

00005ef1 <hsstell>:

unsigned long hsstell()
{
    5ef1:	55                   	push   %ebp
    5ef2:	89 e5                	mov    %esp,%ebp
    5ef4:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    5ef7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    5efe:	00 
    5eff:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    5f06:	e8 4c ed ff ff       	call   4c57 <getCoreBuf>
//	return(totbit);
}
    5f0b:	c9                   	leave  
    5f0c:	c3                   	ret    

00005f0d <hgetbits>:

unsigned long hgetbits(int N)
{
    5f0d:	55                   	push   %ebp
    5f0e:	89 e5                	mov    %esp,%ebp
    5f10:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    5f13:	8b 45 08             	mov    0x8(%ebp),%eax
    5f16:	89 44 24 04          	mov    %eax,0x4(%esp)
    5f1a:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    5f21:	e8 31 ed ff ff       	call   4c57 <getCoreBuf>
}
    5f26:	c9                   	leave  
    5f27:	c3                   	ret    

00005f28 <hget1bit>:


unsigned int hget1bit()
{
    5f28:	55                   	push   %ebp
    5f29:	89 e5                	mov    %esp,%ebp
    5f2b:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    5f2e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    5f35:	e8 d3 ff ff ff       	call   5f0d <hgetbits>
}
    5f3a:	c9                   	leave  
    5f3b:	c3                   	ret    

00005f3c <rewindNbits>:


void rewindNbits(int N)
{
    5f3c:	55                   	push   %ebp
    5f3d:	89 e5                	mov    %esp,%ebp
    5f3f:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    5f42:	8b 45 08             	mov    0x8(%ebp),%eax
    5f45:	89 44 24 04          	mov    %eax,0x4(%esp)
    5f49:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    5f50:	e8 02 ed ff ff       	call   4c57 <getCoreBuf>
}
    5f55:	c9                   	leave  
    5f56:	c3                   	ret    

00005f57 <rewindNbytes>:


void rewindNbytes(int N)
{
    5f57:	55                   	push   %ebp
    5f58:	89 e5                	mov    %esp,%ebp
    5f5a:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    5f5d:	8b 45 08             	mov    0x8(%ebp),%eax
    5f60:	89 44 24 04          	mov    %eax,0x4(%esp)
    5f64:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    5f6b:	e8 e7 ec ff ff       	call   4c57 <getCoreBuf>
}
    5f70:	c9                   	leave  
    5f71:	c3                   	ret    

00005f72 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    5f72:	55                   	push   %ebp
    5f73:	89 e5                	mov    %esp,%ebp
    5f75:	57                   	push   %edi
    5f76:	56                   	push   %esi
    5f77:	53                   	push   %ebx
    5f78:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    5f7e:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    5f82:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    5f86:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    5f8a:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    5f8e:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    5f92:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    5f96:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    5f9a:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    5f9e:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    5fa2:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    5fa6:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    5faa:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    5fae:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    5fb2:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5fb6:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    5fba:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    5fbe:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    5fc2:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    5fc6:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    5fca:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    5fce:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    5fd2:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    5fd6:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    5fda:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    5fde:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    5fe2:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    5fe6:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    5fea:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    5fee:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    5ff2:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    5ff6:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    5ffa:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    5ffe:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    6002:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    6006:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    600a:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    600e:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    6012:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    6016:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    601a:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    601e:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    6022:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    6026:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    602a:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    602e:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    6032:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    6036:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    603a:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    603e:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    6042:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    6046:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    604a:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    604e:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    6052:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    6056:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    605a:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    605e:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    6062:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    6066:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    606a:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    606e:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    6072:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    6076:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    607a:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    607e:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    6082:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    6086:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    608a:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    608e:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    6092:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    6096:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    609a:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    609e:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    60a2:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    60a6:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    60aa:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    60ae:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    60b2:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    60b6:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    60ba:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    60be:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    60c2:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    60c6:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    60cd:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    60d4:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    60db:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    60e2:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    60e9:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    60f0:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    60f7:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    60fe:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    6105:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    610c:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    6113:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    611a:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    6121:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    6128:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    612f:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    6136:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    613d:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    6144:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    614b:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    6152:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    6159:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    6160:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    6167:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    616e:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    6175:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    617c:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    6183:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    618a:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    618e:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    6192:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    6196:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    619a:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    619e:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    61a2:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    61a6:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    61aa:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    61ae:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    61b2:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    61b6:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    61ba:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    61be:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    61c2:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    61c6:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    61ca:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    61ce:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    61d2:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    61d6:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    61da:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    61de:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    61e2:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    61e6:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    61ea:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    61ee:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    61f2:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    61f6:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    61fa:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    61fe:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    6202:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    6206:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    620a:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    620e:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    6212:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    6219:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    6220:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    6227:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    622e:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    6235:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    623c:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    6243:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    624a:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    6251:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    6258:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    625f:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    6266:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    626d:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    6274:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    627b:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    6282:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    6289:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    6290:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    6297:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    629e:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    62a5:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    62ac:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    62b3:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    62ba:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    62c1:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    62c8:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    62cf:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    62d6:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    62dd:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    62e4:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    62eb:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    62f2:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    62f9:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    6300:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    6307:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    630e:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    6315:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    631c:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    6323:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    632a:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    6331:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    6338:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    633f:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    6346:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    634d:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    6354:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    635b:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    6362:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    6369:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    6370:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    6377:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    637e:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    6385:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    638c:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    6393:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    639a:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    63a1:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    63a8:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    63af:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    63b6:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    63bd:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    63c4:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    63ca:	b8 e0 bc 00 00       	mov    $0xbce0,%eax
    63cf:	b9 23 00 00 00       	mov    $0x23,%ecx
    63d4:	89 d7                	mov    %edx,%edi
    63d6:	89 c6                	mov    %eax,%esi
    63d8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    63da:	89 f0                	mov    %esi,%eax
    63dc:	89 fa                	mov    %edi,%edx
    63de:	0f b7 08             	movzwl (%eax),%ecx
    63e1:	66 89 0a             	mov    %cx,(%edx)
    63e4:	83 c2 02             	add    $0x2,%edx
    63e7:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    63ea:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    63f0:	ba 80 bd 00 00       	mov    $0xbd80,%edx
    63f5:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    63fa:	89 c1                	mov    %eax,%ecx
    63fc:	83 e1 02             	and    $0x2,%ecx
    63ff:	85 c9                	test   %ecx,%ecx
    6401:	74 0f                	je     6412 <read_decoder_table+0x4a0>
    6403:	0f b7 0a             	movzwl (%edx),%ecx
    6406:	66 89 08             	mov    %cx,(%eax)
    6409:	83 c0 02             	add    $0x2,%eax
    640c:	83 c2 02             	add    $0x2,%edx
    640f:	83 eb 02             	sub    $0x2,%ebx
    6412:	89 d9                	mov    %ebx,%ecx
    6414:	c1 e9 02             	shr    $0x2,%ecx
    6417:	89 c7                	mov    %eax,%edi
    6419:	89 d6                	mov    %edx,%esi
    641b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    641d:	89 f2                	mov    %esi,%edx
    641f:	89 f8                	mov    %edi,%eax
    6421:	b9 00 00 00 00       	mov    $0x0,%ecx
    6426:	89 de                	mov    %ebx,%esi
    6428:	83 e6 02             	and    $0x2,%esi
    642b:	85 f6                	test   %esi,%esi
    642d:	74 0b                	je     643a <read_decoder_table+0x4c8>
    642f:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    6433:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6437:	83 c1 02             	add    $0x2,%ecx
    643a:	83 e3 01             	and    $0x1,%ebx
    643d:	85 db                	test   %ebx,%ebx
    643f:	74 07                	je     6448 <read_decoder_table+0x4d6>
    6441:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6445:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    6448:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    644e:	b8 20 be 00 00       	mov    $0xbe20,%eax
    6453:	b9 23 00 00 00       	mov    $0x23,%ecx
    6458:	89 d7                	mov    %edx,%edi
    645a:	89 c6                	mov    %eax,%esi
    645c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    645e:	89 f0                	mov    %esi,%eax
    6460:	89 fa                	mov    %edi,%edx
    6462:	0f b7 08             	movzwl (%eax),%ecx
    6465:	66 89 0a             	mov    %cx,(%edx)
    6468:	83 c2 02             	add    $0x2,%edx
    646b:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    646e:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    6474:	ba c0 be 00 00       	mov    $0xbec0,%edx
    6479:	bb fe 00 00 00       	mov    $0xfe,%ebx
    647e:	89 c1                	mov    %eax,%ecx
    6480:	83 e1 02             	and    $0x2,%ecx
    6483:	85 c9                	test   %ecx,%ecx
    6485:	74 0f                	je     6496 <read_decoder_table+0x524>
    6487:	0f b7 0a             	movzwl (%edx),%ecx
    648a:	66 89 08             	mov    %cx,(%eax)
    648d:	83 c0 02             	add    $0x2,%eax
    6490:	83 c2 02             	add    $0x2,%edx
    6493:	83 eb 02             	sub    $0x2,%ebx
    6496:	89 d9                	mov    %ebx,%ecx
    6498:	c1 e9 02             	shr    $0x2,%ecx
    649b:	89 c7                	mov    %eax,%edi
    649d:	89 d6                	mov    %edx,%esi
    649f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    64a1:	89 f2                	mov    %esi,%edx
    64a3:	89 f8                	mov    %edi,%eax
    64a5:	b9 00 00 00 00       	mov    $0x0,%ecx
    64aa:	89 de                	mov    %ebx,%esi
    64ac:	83 e6 02             	and    $0x2,%esi
    64af:	85 f6                	test   %esi,%esi
    64b1:	74 0b                	je     64be <read_decoder_table+0x54c>
    64b3:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    64b7:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    64bb:	83 c1 02             	add    $0x2,%ecx
    64be:	83 e3 01             	and    $0x1,%ebx
    64c1:	85 db                	test   %ebx,%ebx
    64c3:	74 07                	je     64cc <read_decoder_table+0x55a>
    64c5:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    64c9:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    64cc:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    64d2:	b8 c0 bf 00 00       	mov    $0xbfc0,%eax
    64d7:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    64dc:	89 d7                	mov    %edx,%edi
    64de:	89 c6                	mov    %eax,%esi
    64e0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    64e2:	89 f0                	mov    %esi,%eax
    64e4:	89 fa                	mov    %edi,%edx
    64e6:	0f b7 08             	movzwl (%eax),%ecx
    64e9:	66 89 0a             	mov    %cx,(%edx)
    64ec:	83 c2 02             	add    $0x2,%edx
    64ef:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    64f2:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    64f8:	ba c0 c0 00 00       	mov    $0xc0c0,%edx
    64fd:	bb fe 00 00 00       	mov    $0xfe,%ebx
    6502:	89 c1                	mov    %eax,%ecx
    6504:	83 e1 02             	and    $0x2,%ecx
    6507:	85 c9                	test   %ecx,%ecx
    6509:	74 0f                	je     651a <read_decoder_table+0x5a8>
    650b:	0f b7 0a             	movzwl (%edx),%ecx
    650e:	66 89 08             	mov    %cx,(%eax)
    6511:	83 c0 02             	add    $0x2,%eax
    6514:	83 c2 02             	add    $0x2,%edx
    6517:	83 eb 02             	sub    $0x2,%ebx
    651a:	89 d9                	mov    %ebx,%ecx
    651c:	c1 e9 02             	shr    $0x2,%ecx
    651f:	89 c7                	mov    %eax,%edi
    6521:	89 d6                	mov    %edx,%esi
    6523:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6525:	89 f2                	mov    %esi,%edx
    6527:	89 f8                	mov    %edi,%eax
    6529:	b9 00 00 00 00       	mov    $0x0,%ecx
    652e:	89 de                	mov    %ebx,%esi
    6530:	83 e6 02             	and    $0x2,%esi
    6533:	85 f6                	test   %esi,%esi
    6535:	74 0b                	je     6542 <read_decoder_table+0x5d0>
    6537:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    653b:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    653f:	83 c1 02             	add    $0x2,%ecx
    6542:	83 e3 01             	and    $0x1,%ebx
    6545:	85 db                	test   %ebx,%ebx
    6547:	74 07                	je     6550 <read_decoder_table+0x5de>
    6549:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    654d:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    6550:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    6556:	b8 c0 c1 00 00       	mov    $0xc1c0,%eax
    655b:	b9 ff 00 00 00       	mov    $0xff,%ecx
    6560:	89 d7                	mov    %edx,%edi
    6562:	89 c6                	mov    %eax,%esi
    6564:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6566:	89 f0                	mov    %esi,%eax
    6568:	89 fa                	mov    %edi,%edx
    656a:	0f b7 08             	movzwl (%eax),%ecx
    656d:	66 89 0a             	mov    %cx,(%edx)
    6570:	83 c2 02             	add    $0x2,%edx
    6573:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    6576:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    657c:	ba c0 c5 00 00       	mov    $0xc5c0,%edx
    6581:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    6586:	89 c1                	mov    %eax,%ecx
    6588:	83 e1 02             	and    $0x2,%ecx
    658b:	85 c9                	test   %ecx,%ecx
    658d:	74 0f                	je     659e <read_decoder_table+0x62c>
    658f:	0f b7 0a             	movzwl (%edx),%ecx
    6592:	66 89 08             	mov    %cx,(%eax)
    6595:	83 c0 02             	add    $0x2,%eax
    6598:	83 c2 02             	add    $0x2,%edx
    659b:	83 eb 02             	sub    $0x2,%ebx
    659e:	89 d9                	mov    %ebx,%ecx
    65a0:	c1 e9 02             	shr    $0x2,%ecx
    65a3:	89 c7                	mov    %eax,%edi
    65a5:	89 d6                	mov    %edx,%esi
    65a7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    65a9:	89 f2                	mov    %esi,%edx
    65ab:	89 f8                	mov    %edi,%eax
    65ad:	b9 00 00 00 00       	mov    $0x0,%ecx
    65b2:	89 de                	mov    %ebx,%esi
    65b4:	83 e6 02             	and    $0x2,%esi
    65b7:	85 f6                	test   %esi,%esi
    65b9:	74 0b                	je     65c6 <read_decoder_table+0x654>
    65bb:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    65bf:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    65c3:	83 c1 02             	add    $0x2,%ecx
    65c6:	83 e3 01             	and    $0x1,%ebx
    65c9:	85 db                	test   %ebx,%ebx
    65cb:	74 07                	je     65d4 <read_decoder_table+0x662>
    65cd:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    65d1:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    65d4:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    65da:	b8 c0 c9 00 00       	mov    $0xc9c0,%eax
    65df:	b9 ff 00 00 00       	mov    $0xff,%ecx
    65e4:	89 d7                	mov    %edx,%edi
    65e6:	89 c6                	mov    %eax,%esi
    65e8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    65ea:	89 f0                	mov    %esi,%eax
    65ec:	89 fa                	mov    %edi,%edx
    65ee:	0f b7 08             	movzwl (%eax),%ecx
    65f1:	66 89 0a             	mov    %cx,(%edx)
    65f4:	83 c2 02             	add    $0x2,%edx
    65f7:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    65fa:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    6600:	bb c0 cd 00 00       	mov    $0xcdc0,%ebx
    6605:	b8 00 01 00 00       	mov    $0x100,%eax
    660a:	89 d7                	mov    %edx,%edi
    660c:	89 de                	mov    %ebx,%esi
    660e:	89 c1                	mov    %eax,%ecx
    6610:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    6612:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    6619:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    6620:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    6627:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    662e:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    6635:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    663c:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    6643:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    664a:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    6651:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    6658:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    665f:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    6666:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    666d:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    6674:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    667b:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    6682:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    6689:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    6690:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    6697:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    669e:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    66a5:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    66ac:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    66b3:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    66ba:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    66c1:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    66c8:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    66cf:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    66d6:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    66dd:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    66e4:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    66eb:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    66f2:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    66f9:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    6700:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    6707:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    670e:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    6715:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    671c:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    6723:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    672a:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    6731:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    6738:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    673f:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    6746:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    674d:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    6754:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    675b:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    6762:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    6769:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    6770:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    6777:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    677e:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    6785:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    678c:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    6793:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    679a:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    67a1:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    67a8:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    67af:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    67b6:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    67bd:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    67c4:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    67cb:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    67d2:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    67d9:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    67e0:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    67e7:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    67ee:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    67f5:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    67fc:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    6803:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    680a:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    6811:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    6818:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    681f:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    6826:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    682d:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    6834:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    683b:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    6842:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    6849:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    6850:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    6857:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    685e:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    6865:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    686c:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    6873:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    687a:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    6881:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    6888:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    688f:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    6896:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    689d:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    68a4:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    68ab:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    68b2:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    68b9:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    68c0:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    68c7:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    68ce:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    68d5:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    68dc:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    68e3:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    68ea:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    68f1:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    68f8:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    68ff:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    6906:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    690d:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    6914:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    691b:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    6922:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    6929:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    6930:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    6937:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    693e:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    6945:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    694c:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    6953:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    695a:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    6961:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    6968:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    696f:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    6976:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    697d:	30 00 
    697f:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    6986:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    698d:	00 00 00 
    6990:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    6997:	00 00 00 
    699a:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    69a1:	00 00 00 
    69a4:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    69ab:	00 00 00 
    69ae:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    69b5:	ff ff ff 
    69b8:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    69bf:	00 00 00 
    69c2:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    69c9:	00 00 00 
    69cc:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    69d3:	00 00 00 
    69d6:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    69dd:	00 00 00 
    69e0:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    69e7:	31 00 
    69e9:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    69f0:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    69f7:	00 00 00 
    69fa:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    6a01:	00 00 00 
    6a04:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    6a0b:	00 00 00 
    6a0e:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    6a15:	00 00 00 
    6a18:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    6a1f:	ff ff ff 
    6a22:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    6a29:	00 00 00 
    6a2c:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    6a33:	00 00 00 
    6a36:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    6a39:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    6a3f:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    6a46:	00 00 00 
    6a49:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    6a50:	32 00 
    6a52:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    6a59:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    6a60:	00 00 00 
    6a63:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    6a6a:	00 00 00 
    6a6d:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    6a74:	00 00 00 
    6a77:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    6a7e:	00 00 00 
    6a81:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    6a88:	ff ff ff 
    6a8b:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    6a92:	00 00 00 
    6a95:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    6a9c:	00 00 00 
    6a9f:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    6aa2:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    6aa8:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    6aaf:	00 00 00 
    6ab2:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    6ab9:	33 00 
    6abb:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    6ac2:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    6ac9:	00 00 00 
    6acc:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    6ad3:	00 00 00 
    6ad6:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    6add:	00 00 00 
    6ae0:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    6ae7:	00 00 00 
    6aea:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    6af1:	ff ff ff 
    6af4:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    6afb:	00 00 00 
    6afe:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    6b05:	00 00 00 
    6b08:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    6b0b:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    6b11:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    6b18:	00 00 00 
    6b1b:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    6b22:	34 00 
    6b24:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    6b2b:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    6b32:	00 00 00 
    6b35:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    6b3c:	00 00 00 
    6b3f:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    6b46:	00 00 00 
    6b49:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    6b50:	00 00 00 
    6b53:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    6b5a:	ff ff ff 
    6b5d:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    6b64:	00 00 00 
    6b67:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    6b6e:	00 00 00 
    6b71:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    6b78:	00 00 00 
    6b7b:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    6b82:	00 00 00 
    6b85:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    6b8c:	35 00 
    6b8e:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    6b95:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    6b9c:	00 00 00 
    6b9f:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    6ba6:	00 00 00 
    6ba9:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    6bb0:	00 00 00 
    6bb3:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    6bba:	00 00 00 
    6bbd:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    6bc4:	ff ff ff 
    6bc7:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    6bce:	00 00 00 
    6bd1:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    6bd8:	00 00 00 
    6bdb:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    6be1:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    6be7:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    6bee:	00 00 00 
    6bf1:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    6bf8:	36 00 
    6bfa:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    6c01:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    6c08:	00 00 00 
    6c0b:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    6c12:	00 00 00 
    6c15:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    6c1c:	00 00 00 
    6c1f:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    6c26:	00 00 00 
    6c29:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    6c30:	ff ff ff 
    6c33:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    6c3a:	00 00 00 
    6c3d:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    6c44:	00 00 00 
    6c47:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    6c4d:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    6c53:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    6c5a:	00 00 00 
    6c5d:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    6c64:	37 00 
    6c66:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    6c6d:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    6c74:	00 00 00 
    6c77:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    6c7e:	00 00 00 
    6c81:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    6c88:	00 00 00 
    6c8b:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    6c92:	00 00 00 
    6c95:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    6c9c:	ff ff ff 
    6c9f:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    6ca6:	00 00 00 
    6ca9:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    6cb0:	00 00 00 
    6cb3:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    6cb9:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    6cbf:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    6cc6:	00 00 00 
    6cc9:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    6cd0:	38 00 
    6cd2:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    6cd9:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    6ce0:	00 00 00 
    6ce3:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    6cea:	00 00 00 
    6ced:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    6cf4:	00 00 00 
    6cf7:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    6cfe:	00 00 00 
    6d01:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    6d08:	ff ff ff 
    6d0b:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    6d12:	00 00 00 
    6d15:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    6d1c:	00 00 00 
    6d1f:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    6d25:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    6d2b:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    6d32:	00 00 00 
    6d35:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    6d3c:	39 00 
    6d3e:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    6d45:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    6d4c:	00 00 00 
    6d4f:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    6d56:	00 00 00 
    6d59:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    6d60:	00 00 00 
    6d63:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    6d6a:	00 00 00 
    6d6d:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    6d74:	ff ff ff 
    6d77:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    6d7e:	00 00 00 
    6d81:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    6d88:	00 00 00 
    6d8b:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    6d91:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    6d97:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    6d9e:	00 00 00 
    6da1:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    6da8:	31 30 
    6daa:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    6db1:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    6db8:	00 00 00 
    6dbb:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    6dc2:	00 00 00 
    6dc5:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    6dcc:	00 00 00 
    6dcf:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    6dd6:	00 00 00 
    6dd9:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    6de0:	ff ff ff 
    6de3:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    6dea:	00 00 00 
    6ded:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    6df4:	00 00 00 
    6df7:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    6dfd:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    6e03:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    6e0a:	00 00 00 
    6e0d:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    6e14:	31 31 
    6e16:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    6e1d:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    6e24:	00 00 00 
    6e27:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    6e2e:	00 00 00 
    6e31:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    6e38:	00 00 00 
    6e3b:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    6e42:	00 00 00 
    6e45:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    6e4c:	ff ff ff 
    6e4f:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    6e56:	00 00 00 
    6e59:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    6e60:	00 00 00 
    6e63:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    6e69:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    6e6f:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    6e76:	00 00 00 
    6e79:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    6e80:	31 32 
    6e82:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    6e89:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    6e90:	00 00 00 
    6e93:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    6e9a:	00 00 00 
    6e9d:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    6ea4:	00 00 00 
    6ea7:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    6eae:	00 00 00 
    6eb1:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    6eb8:	ff ff ff 
    6ebb:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    6ec2:	00 00 00 
    6ec5:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    6ecc:	00 00 00 
    6ecf:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    6ed5:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    6edb:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    6ee2:	00 00 00 
    6ee5:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    6eec:	31 33 
    6eee:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    6ef5:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    6efc:	00 00 00 
    6eff:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    6f06:	00 00 00 
    6f09:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    6f10:	00 00 00 
    6f13:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    6f1a:	00 00 00 
    6f1d:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    6f24:	ff ff ff 
    6f27:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    6f2e:	00 00 00 
    6f31:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    6f38:	00 00 00 
    6f3b:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    6f41:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    6f47:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    6f4e:	01 00 00 
    6f51:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    6f58:	31 34 
    6f5a:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    6f61:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    6f68:	00 00 00 
    6f6b:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    6f72:	00 00 00 
    6f75:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    6f7c:	00 00 00 
    6f7f:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    6f86:	00 00 00 
    6f89:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    6f90:	ff ff ff 
    6f93:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    6f9a:	00 00 00 
    6f9d:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    6fa4:	00 00 00 
    6fa7:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    6fae:	00 00 00 
    6fb1:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    6fb8:	00 00 00 
    6fbb:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    6fc2:	31 35 
    6fc4:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    6fcb:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    6fd2:	00 00 00 
    6fd5:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    6fdc:	00 00 00 
    6fdf:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    6fe6:	00 00 00 
    6fe9:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    6ff0:	00 00 00 
    6ff3:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    6ffa:	ff ff ff 
    6ffd:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    7004:	00 00 00 
    7007:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    700e:	00 00 00 
    7011:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    7017:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    701d:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    7024:	01 00 00 
    7027:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    702e:	31 36 
    7030:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    7037:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    703e:	00 00 00 
    7041:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    7048:	00 00 00 
    704b:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    7052:	00 00 00 
    7055:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    705c:	00 00 00 
    705f:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    7066:	ff ff ff 
    7069:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    7070:	00 00 00 
    7073:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    707a:	00 00 00 
    707d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7083:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    7089:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    7090:	01 00 00 
    7093:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    709a:	31 37 
    709c:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    70a3:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    70aa:	00 00 00 
    70ad:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    70b4:	00 00 00 
    70b7:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    70be:	00 00 00 
    70c1:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    70c8:	00 00 00 
    70cb:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    70d2:	00 00 00 
    70d5:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    70dc:	00 00 00 
    70df:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    70e6:	00 00 00 
    70e9:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    70ef:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    70f5:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    70fc:	01 00 00 
    70ff:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    7106:	31 38 
    7108:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    710f:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    7116:	00 00 00 
    7119:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    7120:	00 00 00 
    7123:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    712a:	00 00 00 
    712d:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    7134:	00 00 00 
    7137:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    713e:	00 00 00 
    7141:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    7148:	00 00 00 
    714b:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    7152:	00 00 00 
    7155:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    715b:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    7161:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    7168:	01 00 00 
    716b:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    7172:	31 39 
    7174:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    717b:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    7182:	00 00 00 
    7185:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    718c:	00 00 00 
    718f:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    7196:	00 00 00 
    7199:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    71a0:	00 00 00 
    71a3:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    71aa:	00 00 00 
    71ad:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    71b4:	00 00 00 
    71b7:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    71be:	00 00 00 
    71c1:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    71c7:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    71cd:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    71d4:	01 00 00 
    71d7:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    71de:	32 30 
    71e0:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    71e7:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    71ee:	00 00 00 
    71f1:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    71f8:	00 00 00 
    71fb:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    7202:	00 00 00 
    7205:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    720c:	00 00 00 
    720f:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    7216:	00 00 00 
    7219:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    7220:	00 00 00 
    7223:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    722a:	00 00 00 
    722d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7233:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    7239:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    7240:	01 00 00 
    7243:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    724a:	32 31 
    724c:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    7253:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    725a:	00 00 00 
    725d:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    7264:	00 00 00 
    7267:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    726e:	00 00 00 
    7271:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    7278:	00 00 00 
    727b:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    7282:	00 00 00 
    7285:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    728c:	00 00 00 
    728f:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    7296:	00 00 00 
    7299:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    729f:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    72a5:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    72ac:	01 00 00 
    72af:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    72b6:	32 32 
    72b8:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    72bf:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    72c6:	00 00 00 
    72c9:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    72d0:	00 00 00 
    72d3:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    72da:	00 00 00 
    72dd:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    72e4:	03 00 00 
    72e7:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    72ee:	00 00 00 
    72f1:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    72f8:	00 00 00 
    72fb:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    7302:	00 00 00 
    7305:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    730b:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    7311:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    7318:	01 00 00 
    731b:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    7322:	32 33 
    7324:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    732b:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    7332:	00 00 00 
    7335:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    733c:	00 00 00 
    733f:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    7346:	00 00 00 
    7349:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    7350:	1f 00 00 
    7353:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    735a:	00 00 00 
    735d:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    7364:	00 00 00 
    7367:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    736e:	00 00 00 
    7371:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7377:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    737d:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    7384:	01 00 00 
    7387:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    738e:	32 34 
    7390:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    7397:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    739e:	00 00 00 
    73a1:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    73a8:	00 00 00 
    73ab:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    73b2:	00 00 00 
    73b5:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    73bc:	00 00 00 
    73bf:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    73c6:	ff ff ff 
    73c9:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    73d0:	00 00 00 
    73d3:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    73da:	00 00 00 
    73dd:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    73e3:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    73e9:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    73f0:	02 00 00 
    73f3:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    73fa:	32 35 
    73fc:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    7403:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    740a:	00 00 00 
    740d:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    7414:	00 00 00 
    7417:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    741e:	00 00 00 
    7421:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    7428:	00 00 00 
    742b:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    7432:	00 00 00 
    7435:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    743c:	00 00 00 
    743f:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    7446:	00 00 00 
    7449:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    744f:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    7455:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    745c:	02 00 00 
    745f:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    7466:	32 36 
    7468:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    746f:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    7476:	00 00 00 
    7479:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    7480:	00 00 00 
    7483:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    748a:	00 00 00 
    748d:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    7494:	00 00 00 
    7497:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    749e:	00 00 00 
    74a1:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    74a8:	00 00 00 
    74ab:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    74b2:	00 00 00 
    74b5:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    74bb:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    74c1:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    74c8:	02 00 00 
    74cb:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    74d2:	32 37 
    74d4:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    74db:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    74e2:	00 00 00 
    74e5:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    74ec:	00 00 00 
    74ef:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    74f6:	00 00 00 
    74f9:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    7500:	00 00 00 
    7503:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    750a:	00 00 00 
    750d:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    7514:	00 00 00 
    7517:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    751e:	00 00 00 
    7521:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7527:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    752d:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    7534:	02 00 00 
    7537:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    753e:	32 38 
    7540:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    7547:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    754e:	00 00 00 
    7551:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    7558:	00 00 00 
    755b:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    7562:	00 00 00 
    7565:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    756c:	00 00 00 
    756f:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    7576:	00 00 00 
    7579:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    7580:	00 00 00 
    7583:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    758a:	00 00 00 
    758d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7593:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    7599:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    75a0:	02 00 00 
    75a3:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    75aa:	32 39 
    75ac:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    75b3:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    75ba:	00 00 00 
    75bd:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    75c4:	00 00 00 
    75c7:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    75ce:	00 00 00 
    75d1:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    75d8:	01 00 00 
    75db:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    75e2:	00 00 00 
    75e5:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    75ec:	00 00 00 
    75ef:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    75f6:	00 00 00 
    75f9:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    75ff:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    7605:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    760c:	02 00 00 
    760f:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    7616:	33 30 
    7618:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    761f:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    7626:	00 00 00 
    7629:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    7630:	00 00 00 
    7633:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    763a:	00 00 00 
    763d:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    7644:	07 00 00 
    7647:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    764e:	00 00 00 
    7651:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    7658:	00 00 00 
    765b:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    7662:	00 00 00 
    7665:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    766b:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    7671:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    7678:	02 00 00 
    767b:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    7682:	33 31 
    7684:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    768b:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    7692:	00 00 00 
    7695:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    769c:	00 00 00 
    769f:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    76a6:	00 00 00 
    76a9:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    76b0:	1f 00 00 
    76b3:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    76ba:	00 00 00 
    76bd:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    76c4:	00 00 00 
    76c7:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    76ce:	00 00 00 
    76d1:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    76d7:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    76dd:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    76e4:	02 00 00 
    76e7:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    76ee:	33 32 
    76f0:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    76f7:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    76fe:	00 00 00 
    7701:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    7708:	00 00 00 
    770b:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    7712:	00 00 00 
    7715:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    771c:	00 00 00 
    771f:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    7726:	ff ff ff 
    7729:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    7730:	00 00 00 
    7733:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    773a:	00 00 00 
    773d:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    7743:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    7749:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    7750:	00 00 00 
    7753:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    775a:	33 33 
    775c:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    7763:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    776a:	00 00 00 
    776d:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    7774:	00 00 00 
    7777:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    777e:	00 00 00 
    7781:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    7788:	00 00 00 
    778b:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    7792:	ff ff ff 
    7795:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    779c:	00 00 00 
    779f:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    77a6:	00 00 00 
    77a9:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    77af:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    77b5:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    77bc:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    77bf:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    77c5:	5b                   	pop    %ebx
    77c6:	5e                   	pop    %esi
    77c7:	5f                   	pop    %edi
    77c8:	5d                   	pop    %ebp
    77c9:	c3                   	ret    

000077ca <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    77ca:	55                   	push   %ebp
    77cb:	89 e5                	mov    %esp,%ebp
    77cd:	53                   	push   %ebx
    77ce:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    77d1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    77d8:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    77df:	a1 30 fc 00 00       	mov    0xfc30,%eax
    77e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    77e7:	8b 45 08             	mov    0x8(%ebp),%eax
    77ea:	8b 40 20             	mov    0x20(%eax),%eax
    77ed:	85 c0                	test   %eax,%eax
    77ef:	75 0a                	jne    77fb <huffman_decoder+0x31>
    77f1:	b8 02 00 00 00       	mov    $0x2,%eax
    77f6:	e9 0d 03 00 00       	jmp    7b08 <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    77fb:	8b 45 08             	mov    0x8(%ebp),%eax
    77fe:	8b 40 24             	mov    0x24(%eax),%eax
    7801:	85 c0                	test   %eax,%eax
    7803:	75 1d                	jne    7822 <huffman_decoder+0x58>
  {  *x = *y = 0;
    7805:	8b 45 10             	mov    0x10(%ebp),%eax
    7808:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    780e:	8b 45 10             	mov    0x10(%ebp),%eax
    7811:	8b 10                	mov    (%eax),%edx
    7813:	8b 45 0c             	mov    0xc(%ebp),%eax
    7816:	89 10                	mov    %edx,(%eax)
     return 0;
    7818:	b8 00 00 00 00       	mov    $0x0,%eax
    781d:	e9 e6 02 00 00       	jmp    7b08 <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    7822:	8b 45 08             	mov    0x8(%ebp),%eax
    7825:	8b 40 20             	mov    0x20(%eax),%eax
    7828:	8b 55 f0             	mov    -0x10(%ebp),%edx
    782b:	01 d2                	add    %edx,%edx
    782d:	01 d0                	add    %edx,%eax
    782f:	0f b6 00             	movzbl (%eax),%eax
    7832:	84 c0                	test   %al,%al
    7834:	75 46                	jne    787c <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    7836:	8b 45 08             	mov    0x8(%ebp),%eax
    7839:	8b 40 20             	mov    0x20(%eax),%eax
    783c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    783f:	01 d2                	add    %edx,%edx
    7841:	01 d0                	add    %edx,%eax
    7843:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7847:	c0 e8 04             	shr    $0x4,%al
    784a:	0f b6 d0             	movzbl %al,%edx
    784d:	8b 45 0c             	mov    0xc(%ebp),%eax
    7850:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    7852:	8b 45 08             	mov    0x8(%ebp),%eax
    7855:	8b 40 20             	mov    0x20(%eax),%eax
    7858:	8b 55 f0             	mov    -0x10(%ebp),%edx
    785b:	01 d2                	add    %edx,%edx
    785d:	01 d0                	add    %edx,%eax
    785f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7863:	0f b6 c0             	movzbl %al,%eax
    7866:	83 e0 0f             	and    $0xf,%eax
    7869:	89 c2                	mov    %eax,%edx
    786b:	8b 45 10             	mov    0x10(%ebp),%eax
    786e:	89 10                	mov    %edx,(%eax)

      error = 0;
    7870:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    7877:	e9 af 00 00 00       	jmp    792b <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    787c:	e8 a7 e6 ff ff       	call   5f28 <hget1bit>
    7881:	85 c0                	test   %eax,%eax
    7883:	74 47                	je     78cc <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    7885:	eb 17                	jmp    789e <huffman_decoder+0xd4>
    7887:	8b 45 08             	mov    0x8(%ebp),%eax
    788a:	8b 40 20             	mov    0x20(%eax),%eax
    788d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7890:	01 d2                	add    %edx,%edx
    7892:	01 d0                	add    %edx,%eax
    7894:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7898:	0f b6 c0             	movzbl %al,%eax
    789b:	01 45 f0             	add    %eax,-0x10(%ebp)
    789e:	8b 45 08             	mov    0x8(%ebp),%eax
    78a1:	8b 40 20             	mov    0x20(%eax),%eax
    78a4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    78a7:	01 d2                	add    %edx,%edx
    78a9:	01 d0                	add    %edx,%eax
    78ab:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    78af:	3c f9                	cmp    $0xf9,%al
    78b1:	77 d4                	ja     7887 <huffman_decoder+0xbd>
      point += h->val[point][1];
    78b3:	8b 45 08             	mov    0x8(%ebp),%eax
    78b6:	8b 40 20             	mov    0x20(%eax),%eax
    78b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    78bc:	01 d2                	add    %edx,%edx
    78be:	01 d0                	add    %edx,%eax
    78c0:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    78c4:	0f b6 c0             	movzbl %al,%eax
    78c7:	01 45 f0             	add    %eax,-0x10(%ebp)
    78ca:	eb 42                	jmp    790e <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    78cc:	eb 16                	jmp    78e4 <huffman_decoder+0x11a>
    78ce:	8b 45 08             	mov    0x8(%ebp),%eax
    78d1:	8b 40 20             	mov    0x20(%eax),%eax
    78d4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    78d7:	01 d2                	add    %edx,%edx
    78d9:	01 d0                	add    %edx,%eax
    78db:	0f b6 00             	movzbl (%eax),%eax
    78de:	0f b6 c0             	movzbl %al,%eax
    78e1:	01 45 f0             	add    %eax,-0x10(%ebp)
    78e4:	8b 45 08             	mov    0x8(%ebp),%eax
    78e7:	8b 40 20             	mov    0x20(%eax),%eax
    78ea:	8b 55 f0             	mov    -0x10(%ebp),%edx
    78ed:	01 d2                	add    %edx,%edx
    78ef:	01 d0                	add    %edx,%eax
    78f1:	0f b6 00             	movzbl (%eax),%eax
    78f4:	3c f9                	cmp    $0xf9,%al
    78f6:	77 d6                	ja     78ce <huffman_decoder+0x104>
      point += h->val[point][0];
    78f8:	8b 45 08             	mov    0x8(%ebp),%eax
    78fb:	8b 40 20             	mov    0x20(%eax),%eax
    78fe:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7901:	01 d2                	add    %edx,%edx
    7903:	01 d0                	add    %edx,%eax
    7905:	0f b6 00             	movzbl (%eax),%eax
    7908:	0f b6 c0             	movzbl %al,%eax
    790b:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    790e:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    7911:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7915:	0f 85 07 ff ff ff    	jne    7822 <huffman_decoder+0x58>
    791b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    791e:	a1 24 39 01 00       	mov    0x13924,%eax
    7923:	39 c2                	cmp    %eax,%edx
    7925:	0f 82 f7 fe ff ff    	jb     7822 <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    792b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    792f:	74 24                	je     7955 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    7931:	8b 45 08             	mov    0x8(%ebp),%eax
    7934:	8b 40 04             	mov    0x4(%eax),%eax
    7937:	83 e8 01             	sub    $0x1,%eax
    793a:	01 c0                	add    %eax,%eax
    793c:	89 c2                	mov    %eax,%edx
    793e:	8b 45 0c             	mov    0xc(%ebp),%eax
    7941:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    7943:	8b 45 08             	mov    0x8(%ebp),%eax
    7946:	8b 40 08             	mov    0x8(%eax),%eax
    7949:	83 e8 01             	sub    $0x1,%eax
    794c:	01 c0                	add    %eax,%eax
    794e:	89 c2                	mov    %eax,%edx
    7950:	8b 45 10             	mov    0x10(%ebp),%eax
    7953:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    7955:	8b 45 08             	mov    0x8(%ebp),%eax
    7958:	0f b6 00             	movzbl (%eax),%eax
    795b:	3c 33                	cmp    $0x33,%al
    795d:	0f 85 ec 00 00 00    	jne    7a4f <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    7963:	8b 45 08             	mov    0x8(%ebp),%eax
    7966:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    796a:	3c 32                	cmp    $0x32,%al
    796c:	74 0f                	je     797d <huffman_decoder+0x1b3>
    796e:	8b 45 08             	mov    0x8(%ebp),%eax
    7971:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7975:	3c 33                	cmp    $0x33,%al
    7977:	0f 85 d2 00 00 00    	jne    7a4f <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    797d:	8b 45 10             	mov    0x10(%ebp),%eax
    7980:	8b 00                	mov    (%eax),%eax
    7982:	c1 f8 03             	sar    $0x3,%eax
    7985:	83 e0 01             	and    $0x1,%eax
    7988:	89 c2                	mov    %eax,%edx
    798a:	8b 45 14             	mov    0x14(%ebp),%eax
    798d:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    798f:	8b 45 10             	mov    0x10(%ebp),%eax
    7992:	8b 00                	mov    (%eax),%eax
    7994:	c1 f8 02             	sar    $0x2,%eax
    7997:	83 e0 01             	and    $0x1,%eax
    799a:	89 c2                	mov    %eax,%edx
    799c:	8b 45 18             	mov    0x18(%ebp),%eax
    799f:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    79a1:	8b 45 10             	mov    0x10(%ebp),%eax
    79a4:	8b 00                	mov    (%eax),%eax
    79a6:	d1 f8                	sar    %eax
    79a8:	83 e0 01             	and    $0x1,%eax
    79ab:	89 c2                	mov    %eax,%edx
    79ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    79b0:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    79b2:	8b 45 10             	mov    0x10(%ebp),%eax
    79b5:	8b 00                	mov    (%eax),%eax
    79b7:	83 e0 01             	and    $0x1,%eax
    79ba:	89 c2                	mov    %eax,%edx
    79bc:	8b 45 10             	mov    0x10(%ebp),%eax
    79bf:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    79c1:	8b 45 14             	mov    0x14(%ebp),%eax
    79c4:	8b 00                	mov    (%eax),%eax
    79c6:	85 c0                	test   %eax,%eax
    79c8:	74 18                	je     79e2 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    79ca:	e8 59 e5 ff ff       	call   5f28 <hget1bit>
    79cf:	83 f8 01             	cmp    $0x1,%eax
    79d2:	75 0e                	jne    79e2 <huffman_decoder+0x218>
    79d4:	8b 45 14             	mov    0x14(%ebp),%eax
    79d7:	8b 00                	mov    (%eax),%eax
    79d9:	f7 d8                	neg    %eax
    79db:	89 c2                	mov    %eax,%edx
    79dd:	8b 45 14             	mov    0x14(%ebp),%eax
    79e0:	89 10                	mov    %edx,(%eax)
     if (*w)
    79e2:	8b 45 18             	mov    0x18(%ebp),%eax
    79e5:	8b 00                	mov    (%eax),%eax
    79e7:	85 c0                	test   %eax,%eax
    79e9:	74 18                	je     7a03 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    79eb:	e8 38 e5 ff ff       	call   5f28 <hget1bit>
    79f0:	83 f8 01             	cmp    $0x1,%eax
    79f3:	75 0e                	jne    7a03 <huffman_decoder+0x239>
    79f5:	8b 45 18             	mov    0x18(%ebp),%eax
    79f8:	8b 00                	mov    (%eax),%eax
    79fa:	f7 d8                	neg    %eax
    79fc:	89 c2                	mov    %eax,%edx
    79fe:	8b 45 18             	mov    0x18(%ebp),%eax
    7a01:	89 10                	mov    %edx,(%eax)
     if (*x)
    7a03:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a06:	8b 00                	mov    (%eax),%eax
    7a08:	85 c0                	test   %eax,%eax
    7a0a:	74 18                	je     7a24 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    7a0c:	e8 17 e5 ff ff       	call   5f28 <hget1bit>
    7a11:	83 f8 01             	cmp    $0x1,%eax
    7a14:	75 0e                	jne    7a24 <huffman_decoder+0x25a>
    7a16:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a19:	8b 00                	mov    (%eax),%eax
    7a1b:	f7 d8                	neg    %eax
    7a1d:	89 c2                	mov    %eax,%edx
    7a1f:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a22:	89 10                	mov    %edx,(%eax)
     if (*y)
    7a24:	8b 45 10             	mov    0x10(%ebp),%eax
    7a27:	8b 00                	mov    (%eax),%eax
    7a29:	85 c0                	test   %eax,%eax
    7a2b:	74 1d                	je     7a4a <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    7a2d:	e8 f6 e4 ff ff       	call   5f28 <hget1bit>
    7a32:	83 f8 01             	cmp    $0x1,%eax
    7a35:	75 13                	jne    7a4a <huffman_decoder+0x280>
    7a37:	8b 45 10             	mov    0x10(%ebp),%eax
    7a3a:	8b 00                	mov    (%eax),%eax
    7a3c:	f7 d8                	neg    %eax
    7a3e:	89 c2                	mov    %eax,%edx
    7a40:	8b 45 10             	mov    0x10(%ebp),%eax
    7a43:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    7a45:	e9 bb 00 00 00       	jmp    7b05 <huffman_decoder+0x33b>
    7a4a:	e9 b6 00 00 00       	jmp    7b05 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    7a4f:	8b 45 08             	mov    0x8(%ebp),%eax
    7a52:	8b 40 0c             	mov    0xc(%eax),%eax
    7a55:	85 c0                	test   %eax,%eax
    7a57:	74 30                	je     7a89 <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    7a59:	8b 45 08             	mov    0x8(%ebp),%eax
    7a5c:	8b 40 04             	mov    0x4(%eax),%eax
    7a5f:	8d 50 ff             	lea    -0x1(%eax),%edx
    7a62:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a65:	8b 00                	mov    (%eax),%eax
    7a67:	39 c2                	cmp    %eax,%edx
    7a69:	75 1e                	jne    7a89 <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    7a6b:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a6e:	8b 00                	mov    (%eax),%eax
    7a70:	89 c3                	mov    %eax,%ebx
    7a72:	8b 45 08             	mov    0x8(%ebp),%eax
    7a75:	8b 40 0c             	mov    0xc(%eax),%eax
    7a78:	89 04 24             	mov    %eax,(%esp)
    7a7b:	e8 8d e4 ff ff       	call   5f0d <hgetbits>
    7a80:	01 d8                	add    %ebx,%eax
    7a82:	89 c2                	mov    %eax,%edx
    7a84:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a87:	89 10                	mov    %edx,(%eax)
     if (*x)
    7a89:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a8c:	8b 00                	mov    (%eax),%eax
    7a8e:	85 c0                	test   %eax,%eax
    7a90:	74 18                	je     7aaa <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    7a92:	e8 91 e4 ff ff       	call   5f28 <hget1bit>
    7a97:	83 f8 01             	cmp    $0x1,%eax
    7a9a:	75 0e                	jne    7aaa <huffman_decoder+0x2e0>
    7a9c:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a9f:	8b 00                	mov    (%eax),%eax
    7aa1:	f7 d8                	neg    %eax
    7aa3:	89 c2                	mov    %eax,%edx
    7aa5:	8b 45 0c             	mov    0xc(%ebp),%eax
    7aa8:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    7aaa:	8b 45 08             	mov    0x8(%ebp),%eax
    7aad:	8b 40 0c             	mov    0xc(%eax),%eax
    7ab0:	85 c0                	test   %eax,%eax
    7ab2:	74 30                	je     7ae4 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    7ab4:	8b 45 08             	mov    0x8(%ebp),%eax
    7ab7:	8b 40 08             	mov    0x8(%eax),%eax
    7aba:	8d 50 ff             	lea    -0x1(%eax),%edx
    7abd:	8b 45 10             	mov    0x10(%ebp),%eax
    7ac0:	8b 00                	mov    (%eax),%eax
    7ac2:	39 c2                	cmp    %eax,%edx
    7ac4:	75 1e                	jne    7ae4 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    7ac6:	8b 45 10             	mov    0x10(%ebp),%eax
    7ac9:	8b 00                	mov    (%eax),%eax
    7acb:	89 c3                	mov    %eax,%ebx
    7acd:	8b 45 08             	mov    0x8(%ebp),%eax
    7ad0:	8b 40 0c             	mov    0xc(%eax),%eax
    7ad3:	89 04 24             	mov    %eax,(%esp)
    7ad6:	e8 32 e4 ff ff       	call   5f0d <hgetbits>
    7adb:	01 d8                	add    %ebx,%eax
    7add:	89 c2                	mov    %eax,%edx
    7adf:	8b 45 10             	mov    0x10(%ebp),%eax
    7ae2:	89 10                	mov    %edx,(%eax)
     if (*y)
    7ae4:	8b 45 10             	mov    0x10(%ebp),%eax
    7ae7:	8b 00                	mov    (%eax),%eax
    7ae9:	85 c0                	test   %eax,%eax
    7aeb:	74 18                	je     7b05 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    7aed:	e8 36 e4 ff ff       	call   5f28 <hget1bit>
    7af2:	83 f8 01             	cmp    $0x1,%eax
    7af5:	75 0e                	jne    7b05 <huffman_decoder+0x33b>
    7af7:	8b 45 10             	mov    0x10(%ebp),%eax
    7afa:	8b 00                	mov    (%eax),%eax
    7afc:	f7 d8                	neg    %eax
    7afe:	89 c2                	mov    %eax,%edx
    7b00:	8b 45 10             	mov    0x10(%ebp),%eax
    7b03:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    7b05:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    7b08:	83 c4 24             	add    $0x24,%esp
    7b0b:	5b                   	pop    %ebx
    7b0c:	5d                   	pop    %ebp
    7b0d:	c3                   	ret    

00007b0e <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    7b0e:	55                   	push   %ebp
    7b0f:	89 e5                	mov    %esp,%ebp
    7b11:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    7b14:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b17:	8b 00                	mov    (%eax),%eax
    7b19:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    7b1c:	8b 45 08             	mov    0x8(%ebp),%eax
    7b1f:	89 04 24             	mov    %eax,(%esp)
    7b22:	e8 6c df ff ff       	call   5a93 <get1bit>
    7b27:	89 c2                	mov    %eax,%edx
    7b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b2c:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    7b2e:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7b35:	00 
    7b36:	8b 45 08             	mov    0x8(%ebp),%eax
    7b39:	89 04 24             	mov    %eax,(%esp)
    7b3c:	e8 64 e0 ff ff       	call   5ba5 <getbits>
    7b41:	ba 04 00 00 00       	mov    $0x4,%edx
    7b46:	29 c2                	sub    %eax,%edx
    7b48:	89 d0                	mov    %edx,%eax
    7b4a:	89 c2                	mov    %eax,%edx
    7b4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b4f:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    7b52:	8b 45 08             	mov    0x8(%ebp),%eax
    7b55:	89 04 24             	mov    %eax,(%esp)
    7b58:	e8 36 df ff ff       	call   5a93 <get1bit>
    7b5d:	85 c0                	test   %eax,%eax
    7b5f:	0f 94 c0             	sete   %al
    7b62:	0f b6 d0             	movzbl %al,%edx
    7b65:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b68:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    7b6b:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    7b72:	00 
    7b73:	8b 45 08             	mov    0x8(%ebp),%eax
    7b76:	89 04 24             	mov    %eax,(%esp)
    7b79:	e8 27 e0 ff ff       	call   5ba5 <getbits>
    7b7e:	89 c2                	mov    %eax,%edx
    7b80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b83:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    7b86:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7b8d:	00 
    7b8e:	8b 45 08             	mov    0x8(%ebp),%eax
    7b91:	89 04 24             	mov    %eax,(%esp)
    7b94:	e8 0c e0 ff ff       	call   5ba5 <getbits>
    7b99:	89 c2                	mov    %eax,%edx
    7b9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b9e:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    7ba1:	8b 45 08             	mov    0x8(%ebp),%eax
    7ba4:	89 04 24             	mov    %eax,(%esp)
    7ba7:	e8 e7 de ff ff       	call   5a93 <get1bit>
    7bac:	89 c2                	mov    %eax,%edx
    7bae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7bb1:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    7bb4:	8b 45 08             	mov    0x8(%ebp),%eax
    7bb7:	89 04 24             	mov    %eax,(%esp)
    7bba:	e8 d4 de ff ff       	call   5a93 <get1bit>
    7bbf:	89 c2                	mov    %eax,%edx
    7bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7bc4:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    7bc7:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7bce:	00 
    7bcf:	8b 45 08             	mov    0x8(%ebp),%eax
    7bd2:	89 04 24             	mov    %eax,(%esp)
    7bd5:	e8 cb df ff ff       	call   5ba5 <getbits>
    7bda:	89 c2                	mov    %eax,%edx
    7bdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7bdf:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    7be2:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7be9:	00 
    7bea:	8b 45 08             	mov    0x8(%ebp),%eax
    7bed:	89 04 24             	mov    %eax,(%esp)
    7bf0:	e8 b0 df ff ff       	call   5ba5 <getbits>
    7bf5:	89 c2                	mov    %eax,%edx
    7bf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7bfa:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    7bfd:	8b 45 08             	mov    0x8(%ebp),%eax
    7c00:	89 04 24             	mov    %eax,(%esp)
    7c03:	e8 8b de ff ff       	call   5a93 <get1bit>
    7c08:	89 c2                	mov    %eax,%edx
    7c0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c0d:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    7c10:	8b 45 08             	mov    0x8(%ebp),%eax
    7c13:	89 04 24             	mov    %eax,(%esp)
    7c16:	e8 78 de ff ff       	call   5a93 <get1bit>
    7c1b:	89 c2                	mov    %eax,%edx
    7c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c20:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    7c23:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7c2a:	00 
    7c2b:	8b 45 08             	mov    0x8(%ebp),%eax
    7c2e:	89 04 24             	mov    %eax,(%esp)
    7c31:	e8 6f df ff ff       	call   5ba5 <getbits>
    7c36:	89 c2                	mov    %eax,%edx
    7c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c3b:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    7c3e:	c9                   	leave  
    7c3f:	c3                   	ret    

00007c40 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    7c40:	55                   	push   %ebp
    7c41:	89 e5                	mov    %esp,%ebp
    7c43:	56                   	push   %esi
    7c44:	53                   	push   %ebx
    7c45:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    7c48:	8b 45 10             	mov    0x10(%ebp),%eax
    7c4b:	8b 40 08             	mov    0x8(%eax),%eax
    7c4e:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    7c51:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    7c58:	00 
    7c59:	8b 45 08             	mov    0x8(%ebp),%eax
    7c5c:	89 04 24             	mov    %eax,(%esp)
    7c5f:	e8 41 df ff ff       	call   5ba5 <getbits>
    7c64:	8b 55 0c             	mov    0xc(%ebp),%edx
    7c67:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    7c69:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    7c6d:	75 1b                	jne    7c8a <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    7c6f:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7c76:	00 
    7c77:	8b 45 08             	mov    0x8(%ebp),%eax
    7c7a:	89 04 24             	mov    %eax,(%esp)
    7c7d:	e8 23 df ff ff       	call   5ba5 <getbits>
    7c82:	8b 55 0c             	mov    0xc(%ebp),%edx
    7c85:	89 42 04             	mov    %eax,0x4(%edx)
    7c88:	eb 19                	jmp    7ca3 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    7c8a:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    7c91:	00 
    7c92:	8b 45 08             	mov    0x8(%ebp),%eax
    7c95:	89 04 24             	mov    %eax,(%esp)
    7c98:	e8 08 df ff ff       	call   5ba5 <getbits>
    7c9d:	8b 55 0c             	mov    0xc(%ebp),%edx
    7ca0:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    7ca3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7caa:	eb 3d                	jmp    7ce9 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    7cac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7cb3:	eb 2a                	jmp    7cdf <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    7cb5:	8b 45 08             	mov    0x8(%ebp),%eax
    7cb8:	89 04 24             	mov    %eax,(%esp)
    7cbb:	e8 d3 dd ff ff       	call   5a93 <get1bit>
    7cc0:	89 c1                	mov    %eax,%ecx
    7cc2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7cc5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7cc8:	89 d0                	mov    %edx,%eax
    7cca:	c1 e0 02             	shl    $0x2,%eax
    7ccd:	01 d0                	add    %edx,%eax
    7ccf:	c1 e0 03             	shl    $0x3,%eax
    7cd2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7cd5:	01 d0                	add    %edx,%eax
    7cd7:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    7cdb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7cdf:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    7ce3:	7e d0                	jle    7cb5 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    7ce5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7ce9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7cec:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7cef:	7c bb                	jl     7cac <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    7cf1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7cf8:	e9 c5 05 00 00       	jmp    82c2 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    7cfd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7d04:	e9 a9 05 00 00       	jmp    82b2 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    7d09:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    7d10:	00 
    7d11:	8b 45 08             	mov    0x8(%ebp),%eax
    7d14:	89 04 24             	mov    %eax,(%esp)
    7d17:	e8 89 de ff ff       	call   5ba5 <getbits>
    7d1c:	89 c3                	mov    %eax,%ebx
    7d1e:	8b 75 0c             	mov    0xc(%ebp),%esi
    7d21:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d24:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7d27:	89 c2                	mov    %eax,%edx
    7d29:	c1 e2 03             	shl    $0x3,%edx
    7d2c:	01 c2                	add    %eax,%edx
    7d2e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d35:	89 c2                	mov    %eax,%edx
    7d37:	89 c8                	mov    %ecx,%eax
    7d39:	c1 e0 02             	shl    $0x2,%eax
    7d3c:	01 c8                	add    %ecx,%eax
    7d3e:	c1 e0 05             	shl    $0x5,%eax
    7d41:	01 d0                	add    %edx,%eax
    7d43:	01 f0                	add    %esi,%eax
    7d45:	83 c0 18             	add    $0x18,%eax
    7d48:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    7d4a:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    7d51:	00 
    7d52:	8b 45 08             	mov    0x8(%ebp),%eax
    7d55:	89 04 24             	mov    %eax,(%esp)
    7d58:	e8 48 de ff ff       	call   5ba5 <getbits>
    7d5d:	89 c3                	mov    %eax,%ebx
    7d5f:	8b 75 0c             	mov    0xc(%ebp),%esi
    7d62:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d65:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7d68:	89 c2                	mov    %eax,%edx
    7d6a:	c1 e2 03             	shl    $0x3,%edx
    7d6d:	01 c2                	add    %eax,%edx
    7d6f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d76:	89 c2                	mov    %eax,%edx
    7d78:	89 c8                	mov    %ecx,%eax
    7d7a:	c1 e0 02             	shl    $0x2,%eax
    7d7d:	01 c8                	add    %ecx,%eax
    7d7f:	c1 e0 05             	shl    $0x5,%eax
    7d82:	01 d0                	add    %edx,%eax
    7d84:	01 f0                	add    %esi,%eax
    7d86:	83 c0 1c             	add    $0x1c,%eax
    7d89:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    7d8b:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    7d92:	00 
    7d93:	8b 45 08             	mov    0x8(%ebp),%eax
    7d96:	89 04 24             	mov    %eax,(%esp)
    7d99:	e8 07 de ff ff       	call   5ba5 <getbits>
    7d9e:	89 c3                	mov    %eax,%ebx
    7da0:	8b 75 0c             	mov    0xc(%ebp),%esi
    7da3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7da6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7da9:	89 c2                	mov    %eax,%edx
    7dab:	c1 e2 03             	shl    $0x3,%edx
    7dae:	01 c2                	add    %eax,%edx
    7db0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7db7:	89 c2                	mov    %eax,%edx
    7db9:	89 c8                	mov    %ecx,%eax
    7dbb:	c1 e0 02             	shl    $0x2,%eax
    7dbe:	01 c8                	add    %ecx,%eax
    7dc0:	c1 e0 05             	shl    $0x5,%eax
    7dc3:	01 d0                	add    %edx,%eax
    7dc5:	01 f0                	add    %esi,%eax
    7dc7:	83 c0 20             	add    $0x20,%eax
    7dca:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    7dcc:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    7dd3:	00 
    7dd4:	8b 45 08             	mov    0x8(%ebp),%eax
    7dd7:	89 04 24             	mov    %eax,(%esp)
    7dda:	e8 c6 dd ff ff       	call   5ba5 <getbits>
    7ddf:	89 c3                	mov    %eax,%ebx
    7de1:	8b 75 0c             	mov    0xc(%ebp),%esi
    7de4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7de7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7dea:	89 c2                	mov    %eax,%edx
    7dec:	c1 e2 03             	shl    $0x3,%edx
    7def:	01 c2                	add    %eax,%edx
    7df1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7df8:	89 c2                	mov    %eax,%edx
    7dfa:	89 c8                	mov    %ecx,%eax
    7dfc:	c1 e0 02             	shl    $0x2,%eax
    7dff:	01 c8                	add    %ecx,%eax
    7e01:	c1 e0 05             	shl    $0x5,%eax
    7e04:	01 d0                	add    %edx,%eax
    7e06:	01 f0                	add    %esi,%eax
    7e08:	83 c0 24             	add    $0x24,%eax
    7e0b:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    7e0d:	8b 45 08             	mov    0x8(%ebp),%eax
    7e10:	89 04 24             	mov    %eax,(%esp)
    7e13:	e8 7b dc ff ff       	call   5a93 <get1bit>
    7e18:	89 c3                	mov    %eax,%ebx
    7e1a:	8b 75 0c             	mov    0xc(%ebp),%esi
    7e1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e20:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7e23:	89 c2                	mov    %eax,%edx
    7e25:	c1 e2 03             	shl    $0x3,%edx
    7e28:	01 c2                	add    %eax,%edx
    7e2a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7e31:	89 c2                	mov    %eax,%edx
    7e33:	89 c8                	mov    %ecx,%eax
    7e35:	c1 e0 02             	shl    $0x2,%eax
    7e38:	01 c8                	add    %ecx,%eax
    7e3a:	c1 e0 05             	shl    $0x5,%eax
    7e3d:	01 d0                	add    %edx,%eax
    7e3f:	01 f0                	add    %esi,%eax
    7e41:	83 c0 28             	add    $0x28,%eax
    7e44:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    7e46:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e49:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e4c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7e4f:	89 c2                	mov    %eax,%edx
    7e51:	c1 e2 03             	shl    $0x3,%edx
    7e54:	01 c2                	add    %eax,%edx
    7e56:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7e5d:	89 c2                	mov    %eax,%edx
    7e5f:	89 c8                	mov    %ecx,%eax
    7e61:	c1 e0 02             	shl    $0x2,%eax
    7e64:	01 c8                	add    %ecx,%eax
    7e66:	c1 e0 05             	shl    $0x5,%eax
    7e69:	01 d0                	add    %edx,%eax
    7e6b:	01 d8                	add    %ebx,%eax
    7e6d:	83 c0 28             	add    $0x28,%eax
    7e70:	8b 00                	mov    (%eax),%eax
    7e72:	85 c0                	test   %eax,%eax
    7e74:	0f 84 82 02 00 00    	je     80fc <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    7e7a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7e81:	00 
    7e82:	8b 45 08             	mov    0x8(%ebp),%eax
    7e85:	89 04 24             	mov    %eax,(%esp)
    7e88:	e8 18 dd ff ff       	call   5ba5 <getbits>
    7e8d:	89 c3                	mov    %eax,%ebx
    7e8f:	8b 75 0c             	mov    0xc(%ebp),%esi
    7e92:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e95:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7e98:	89 c2                	mov    %eax,%edx
    7e9a:	c1 e2 03             	shl    $0x3,%edx
    7e9d:	01 c2                	add    %eax,%edx
    7e9f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ea6:	89 c2                	mov    %eax,%edx
    7ea8:	89 c8                	mov    %ecx,%eax
    7eaa:	c1 e0 02             	shl    $0x2,%eax
    7ead:	01 c8                	add    %ecx,%eax
    7eaf:	c1 e0 05             	shl    $0x5,%eax
    7eb2:	01 d0                	add    %edx,%eax
    7eb4:	01 f0                	add    %esi,%eax
    7eb6:	83 c0 2c             	add    $0x2c,%eax
    7eb9:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    7ebb:	8b 45 08             	mov    0x8(%ebp),%eax
    7ebe:	89 04 24             	mov    %eax,(%esp)
    7ec1:	e8 cd db ff ff       	call   5a93 <get1bit>
    7ec6:	89 c3                	mov    %eax,%ebx
    7ec8:	8b 75 0c             	mov    0xc(%ebp),%esi
    7ecb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ece:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7ed1:	89 c2                	mov    %eax,%edx
    7ed3:	c1 e2 03             	shl    $0x3,%edx
    7ed6:	01 c2                	add    %eax,%edx
    7ed8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7edf:	89 c2                	mov    %eax,%edx
    7ee1:	89 c8                	mov    %ecx,%eax
    7ee3:	c1 e0 02             	shl    $0x2,%eax
    7ee6:	01 c8                	add    %ecx,%eax
    7ee8:	c1 e0 05             	shl    $0x5,%eax
    7eeb:	01 d0                	add    %edx,%eax
    7eed:	01 f0                	add    %esi,%eax
    7eef:	83 c0 30             	add    $0x30,%eax
    7ef2:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    7ef4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7efb:	eb 46                	jmp    7f43 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    7efd:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7f04:	00 
    7f05:	8b 45 08             	mov    0x8(%ebp),%eax
    7f08:	89 04 24             	mov    %eax,(%esp)
    7f0b:	e8 95 dc ff ff       	call   5ba5 <getbits>
    7f10:	89 c3                	mov    %eax,%ebx
    7f12:	8b 75 0c             	mov    0xc(%ebp),%esi
    7f15:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7f18:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7f1b:	89 c2                	mov    %eax,%edx
    7f1d:	c1 e2 03             	shl    $0x3,%edx
    7f20:	01 c2                	add    %eax,%edx
    7f22:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7f25:	89 c2                	mov    %eax,%edx
    7f27:	89 c8                	mov    %ecx,%eax
    7f29:	c1 e0 02             	shl    $0x2,%eax
    7f2c:	01 c8                	add    %ecx,%eax
    7f2e:	c1 e0 03             	shl    $0x3,%eax
    7f31:	01 c2                	add    %eax,%edx
    7f33:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7f36:	01 d0                	add    %edx,%eax
    7f38:	83 c0 08             	add    $0x8,%eax
    7f3b:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    7f3f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7f43:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    7f47:	7e b4                	jle    7efd <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    7f49:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7f50:	eb 46                	jmp    7f98 <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    7f52:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    7f59:	00 
    7f5a:	8b 45 08             	mov    0x8(%ebp),%eax
    7f5d:	89 04 24             	mov    %eax,(%esp)
    7f60:	e8 40 dc ff ff       	call   5ba5 <getbits>
    7f65:	89 c3                	mov    %eax,%ebx
    7f67:	8b 75 0c             	mov    0xc(%ebp),%esi
    7f6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7f6d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7f70:	89 c2                	mov    %eax,%edx
    7f72:	c1 e2 03             	shl    $0x3,%edx
    7f75:	01 c2                	add    %eax,%edx
    7f77:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7f7a:	89 c2                	mov    %eax,%edx
    7f7c:	89 c8                	mov    %ecx,%eax
    7f7e:	c1 e0 02             	shl    $0x2,%eax
    7f81:	01 c8                	add    %ecx,%eax
    7f83:	c1 e0 03             	shl    $0x3,%eax
    7f86:	01 c2                	add    %eax,%edx
    7f88:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7f8b:	01 d0                	add    %edx,%eax
    7f8d:	83 c0 0c             	add    $0xc,%eax
    7f90:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    7f94:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7f98:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7f9c:	7e b4                	jle    7f52 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    7f9e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7fa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7fa4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7fa7:	89 c2                	mov    %eax,%edx
    7fa9:	c1 e2 03             	shl    $0x3,%edx
    7fac:	01 c2                	add    %eax,%edx
    7fae:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7fb5:	89 c2                	mov    %eax,%edx
    7fb7:	89 c8                	mov    %ecx,%eax
    7fb9:	c1 e0 02             	shl    $0x2,%eax
    7fbc:	01 c8                	add    %ecx,%eax
    7fbe:	c1 e0 05             	shl    $0x5,%eax
    7fc1:	01 d0                	add    %edx,%eax
    7fc3:	01 d8                	add    %ebx,%eax
    7fc5:	83 c0 2c             	add    $0x2c,%eax
    7fc8:	8b 00                	mov    (%eax),%eax
    7fca:	85 c0                	test   %eax,%eax
    7fcc:	75 05                	jne    7fd3 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    7fce:	e8 84 cb ff ff       	call   4b57 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    7fd3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7fd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7fd9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7fdc:	89 c2                	mov    %eax,%edx
    7fde:	c1 e2 03             	shl    $0x3,%edx
    7fe1:	01 c2                	add    %eax,%edx
    7fe3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7fea:	89 c2                	mov    %eax,%edx
    7fec:	89 c8                	mov    %ecx,%eax
    7fee:	c1 e0 02             	shl    $0x2,%eax
    7ff1:	01 c8                	add    %ecx,%eax
    7ff3:	c1 e0 05             	shl    $0x5,%eax
    7ff6:	01 d0                	add    %edx,%eax
    7ff8:	01 d8                	add    %ebx,%eax
    7ffa:	83 c0 2c             	add    $0x2c,%eax
    7ffd:	8b 00                	mov    (%eax),%eax
    7fff:	83 f8 02             	cmp    $0x2,%eax
    8002:	75 62                	jne    8066 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    8004:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8007:	8b 45 f0             	mov    -0x10(%ebp),%eax
    800a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    800d:	89 c2                	mov    %eax,%edx
    800f:	c1 e2 03             	shl    $0x3,%edx
    8012:	01 c2                	add    %eax,%edx
    8014:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    801b:	89 c2                	mov    %eax,%edx
    801d:	89 c8                	mov    %ecx,%eax
    801f:	c1 e0 02             	shl    $0x2,%eax
    8022:	01 c8                	add    %ecx,%eax
    8024:	c1 e0 05             	shl    $0x5,%eax
    8027:	01 d0                	add    %edx,%eax
    8029:	01 d8                	add    %ebx,%eax
    802b:	83 c0 30             	add    $0x30,%eax
    802e:	8b 00                	mov    (%eax),%eax
    8030:	85 c0                	test   %eax,%eax
    8032:	75 32                	jne    8066 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    8034:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8037:	8b 45 f0             	mov    -0x10(%ebp),%eax
    803a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    803d:	89 c2                	mov    %eax,%edx
    803f:	c1 e2 03             	shl    $0x3,%edx
    8042:	01 c2                	add    %eax,%edx
    8044:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    804b:	89 c2                	mov    %eax,%edx
    804d:	89 c8                	mov    %ecx,%eax
    804f:	c1 e0 02             	shl    $0x2,%eax
    8052:	01 c8                	add    %ecx,%eax
    8054:	c1 e0 05             	shl    $0x5,%eax
    8057:	01 d0                	add    %edx,%eax
    8059:	01 d8                	add    %ebx,%eax
    805b:	83 c0 4c             	add    $0x4c,%eax
    805e:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    8064:	eb 30                	jmp    8096 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    8066:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8069:	8b 45 f0             	mov    -0x10(%ebp),%eax
    806c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    806f:	89 c2                	mov    %eax,%edx
    8071:	c1 e2 03             	shl    $0x3,%edx
    8074:	01 c2                	add    %eax,%edx
    8076:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    807d:	89 c2                	mov    %eax,%edx
    807f:	89 c8                	mov    %ecx,%eax
    8081:	c1 e0 02             	shl    $0x2,%eax
    8084:	01 c8                	add    %ecx,%eax
    8086:	c1 e0 05             	shl    $0x5,%eax
    8089:	01 d0                	add    %edx,%eax
    808b:	01 d8                	add    %ebx,%eax
    808d:	83 c0 4c             	add    $0x4c,%eax
    8090:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    8096:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8099:	8b 45 f0             	mov    -0x10(%ebp),%eax
    809c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    809f:	89 c2                	mov    %eax,%edx
    80a1:	c1 e2 03             	shl    $0x3,%edx
    80a4:	01 c2                	add    %eax,%edx
    80a6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    80ad:	89 c2                	mov    %eax,%edx
    80af:	89 c8                	mov    %ecx,%eax
    80b1:	c1 e0 02             	shl    $0x2,%eax
    80b4:	01 c8                	add    %ecx,%eax
    80b6:	c1 e0 05             	shl    $0x5,%eax
    80b9:	01 d0                	add    %edx,%eax
    80bb:	01 d8                	add    %ebx,%eax
    80bd:	83 c0 4c             	add    $0x4c,%eax
    80c0:	8b 00                	mov    (%eax),%eax
    80c2:	ba 14 00 00 00       	mov    $0x14,%edx
    80c7:	89 d3                	mov    %edx,%ebx
    80c9:	29 c3                	sub    %eax,%ebx
    80cb:	8b 75 0c             	mov    0xc(%ebp),%esi
    80ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    80d1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    80d4:	89 c2                	mov    %eax,%edx
    80d6:	c1 e2 03             	shl    $0x3,%edx
    80d9:	01 c2                	add    %eax,%edx
    80db:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    80e2:	89 c2                	mov    %eax,%edx
    80e4:	89 c8                	mov    %ecx,%eax
    80e6:	c1 e0 02             	shl    $0x2,%eax
    80e9:	01 c8                	add    %ecx,%eax
    80eb:	c1 e0 05             	shl    $0x5,%eax
    80ee:	01 d0                	add    %edx,%eax
    80f0:	01 f0                	add    %esi,%eax
    80f2:	83 c0 50             	add    $0x50,%eax
    80f5:	89 18                	mov    %ebx,(%eax)
    80f7:	e9 07 01 00 00       	jmp    8203 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    80fc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8103:	eb 46                	jmp    814b <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8105:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    810c:	00 
    810d:	8b 45 08             	mov    0x8(%ebp),%eax
    8110:	89 04 24             	mov    %eax,(%esp)
    8113:	e8 8d da ff ff       	call   5ba5 <getbits>
    8118:	89 c3                	mov    %eax,%ebx
    811a:	8b 75 0c             	mov    0xc(%ebp),%esi
    811d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8120:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8123:	89 c2                	mov    %eax,%edx
    8125:	c1 e2 03             	shl    $0x3,%edx
    8128:	01 c2                	add    %eax,%edx
    812a:	8d 04 12             	lea    (%edx,%edx,1),%eax
    812d:	89 c2                	mov    %eax,%edx
    812f:	89 c8                	mov    %ecx,%eax
    8131:	c1 e0 02             	shl    $0x2,%eax
    8134:	01 c8                	add    %ecx,%eax
    8136:	c1 e0 03             	shl    $0x3,%eax
    8139:	01 c2                	add    %eax,%edx
    813b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    813e:	01 d0                	add    %edx,%eax
    8140:	83 c0 08             	add    $0x8,%eax
    8143:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    8147:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    814b:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    814f:	7e b4                	jle    8105 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    8151:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8158:	00 
    8159:	8b 45 08             	mov    0x8(%ebp),%eax
    815c:	89 04 24             	mov    %eax,(%esp)
    815f:	e8 41 da ff ff       	call   5ba5 <getbits>
    8164:	89 c3                	mov    %eax,%ebx
    8166:	8b 75 0c             	mov    0xc(%ebp),%esi
    8169:	8b 45 f0             	mov    -0x10(%ebp),%eax
    816c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    816f:	89 c2                	mov    %eax,%edx
    8171:	c1 e2 03             	shl    $0x3,%edx
    8174:	01 c2                	add    %eax,%edx
    8176:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    817d:	89 c2                	mov    %eax,%edx
    817f:	89 c8                	mov    %ecx,%eax
    8181:	c1 e0 02             	shl    $0x2,%eax
    8184:	01 c8                	add    %ecx,%eax
    8186:	c1 e0 05             	shl    $0x5,%eax
    8189:	01 d0                	add    %edx,%eax
    818b:	01 f0                	add    %esi,%eax
    818d:	83 c0 4c             	add    $0x4c,%eax
    8190:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    8192:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    8199:	00 
    819a:	8b 45 08             	mov    0x8(%ebp),%eax
    819d:	89 04 24             	mov    %eax,(%esp)
    81a0:	e8 00 da ff ff       	call   5ba5 <getbits>
    81a5:	89 c3                	mov    %eax,%ebx
    81a7:	8b 75 0c             	mov    0xc(%ebp),%esi
    81aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    81ad:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    81b0:	89 c2                	mov    %eax,%edx
    81b2:	c1 e2 03             	shl    $0x3,%edx
    81b5:	01 c2                	add    %eax,%edx
    81b7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    81be:	89 c2                	mov    %eax,%edx
    81c0:	89 c8                	mov    %ecx,%eax
    81c2:	c1 e0 02             	shl    $0x2,%eax
    81c5:	01 c8                	add    %ecx,%eax
    81c7:	c1 e0 05             	shl    $0x5,%eax
    81ca:	01 d0                	add    %edx,%eax
    81cc:	01 f0                	add    %esi,%eax
    81ce:	83 c0 50             	add    $0x50,%eax
    81d1:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    81d3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    81d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    81d9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    81dc:	89 c2                	mov    %eax,%edx
    81de:	c1 e2 03             	shl    $0x3,%edx
    81e1:	01 c2                	add    %eax,%edx
    81e3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    81ea:	89 c2                	mov    %eax,%edx
    81ec:	89 c8                	mov    %ecx,%eax
    81ee:	c1 e0 02             	shl    $0x2,%eax
    81f1:	01 c8                	add    %ecx,%eax
    81f3:	c1 e0 05             	shl    $0x5,%eax
    81f6:	01 d0                	add    %edx,%eax
    81f8:	01 d8                	add    %ebx,%eax
    81fa:	83 c0 2c             	add    $0x2c,%eax
    81fd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    8203:	8b 45 08             	mov    0x8(%ebp),%eax
    8206:	89 04 24             	mov    %eax,(%esp)
    8209:	e8 85 d8 ff ff       	call   5a93 <get1bit>
    820e:	89 c3                	mov    %eax,%ebx
    8210:	8b 75 0c             	mov    0xc(%ebp),%esi
    8213:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8216:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8219:	89 c2                	mov    %eax,%edx
    821b:	c1 e2 03             	shl    $0x3,%edx
    821e:	01 c2                	add    %eax,%edx
    8220:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8227:	89 c2                	mov    %eax,%edx
    8229:	89 c8                	mov    %ecx,%eax
    822b:	c1 e0 02             	shl    $0x2,%eax
    822e:	01 c8                	add    %ecx,%eax
    8230:	c1 e0 05             	shl    $0x5,%eax
    8233:	01 d0                	add    %edx,%eax
    8235:	01 f0                	add    %esi,%eax
    8237:	83 c0 54             	add    $0x54,%eax
    823a:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    823c:	8b 45 08             	mov    0x8(%ebp),%eax
    823f:	89 04 24             	mov    %eax,(%esp)
    8242:	e8 4c d8 ff ff       	call   5a93 <get1bit>
    8247:	89 c3                	mov    %eax,%ebx
    8249:	8b 75 0c             	mov    0xc(%ebp),%esi
    824c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    824f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8252:	89 c2                	mov    %eax,%edx
    8254:	c1 e2 03             	shl    $0x3,%edx
    8257:	01 c2                	add    %eax,%edx
    8259:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8260:	89 c2                	mov    %eax,%edx
    8262:	89 c8                	mov    %ecx,%eax
    8264:	c1 e0 02             	shl    $0x2,%eax
    8267:	01 c8                	add    %ecx,%eax
    8269:	c1 e0 05             	shl    $0x5,%eax
    826c:	01 d0                	add    %edx,%eax
    826e:	01 f0                	add    %esi,%eax
    8270:	83 c0 58             	add    $0x58,%eax
    8273:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    8275:	8b 45 08             	mov    0x8(%ebp),%eax
    8278:	89 04 24             	mov    %eax,(%esp)
    827b:	e8 13 d8 ff ff       	call   5a93 <get1bit>
    8280:	89 c3                	mov    %eax,%ebx
    8282:	8b 75 0c             	mov    0xc(%ebp),%esi
    8285:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8288:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    828b:	89 c2                	mov    %eax,%edx
    828d:	c1 e2 03             	shl    $0x3,%edx
    8290:	01 c2                	add    %eax,%edx
    8292:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8299:	89 c2                	mov    %eax,%edx
    829b:	89 c8                	mov    %ecx,%eax
    829d:	c1 e0 02             	shl    $0x2,%eax
    82a0:	01 c8                	add    %ecx,%eax
    82a2:	c1 e0 05             	shl    $0x5,%eax
    82a5:	01 d0                	add    %edx,%eax
    82a7:	01 f0                	add    %esi,%eax
    82a9:	83 c0 5c             	add    $0x5c,%eax
    82ac:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    82ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    82b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    82b5:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    82b8:	0f 8c 4b fa ff ff    	jl     7d09 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    82be:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    82c2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    82c6:	0f 8e 31 fa ff ff    	jle    7cfd <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    82cc:	83 c4 20             	add    $0x20,%esp
    82cf:	5b                   	pop    %ebx
    82d0:	5e                   	pop    %esi
    82d1:	5d                   	pop    %ebp
    82d2:	c3                   	ret    

000082d3 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    82d3:	55                   	push   %ebp
    82d4:	89 e5                	mov    %esp,%ebp
    82d6:	56                   	push   %esi
    82d7:	53                   	push   %ebx
    82d8:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    82db:	8b 45 10             	mov    0x10(%ebp),%eax
    82de:	89 c2                	mov    %eax,%edx
    82e0:	c1 e2 03             	shl    $0x3,%edx
    82e3:	01 c2                	add    %eax,%edx
    82e5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    82ec:	89 c2                	mov    %eax,%edx
    82ee:	8b 4d 14             	mov    0x14(%ebp),%ecx
    82f1:	89 c8                	mov    %ecx,%eax
    82f3:	c1 e0 02             	shl    $0x2,%eax
    82f6:	01 c8                	add    %ecx,%eax
    82f8:	c1 e0 05             	shl    $0x5,%eax
    82fb:	01 d0                	add    %edx,%eax
    82fd:	8d 50 10             	lea    0x10(%eax),%edx
    8300:	8b 45 0c             	mov    0xc(%ebp),%eax
    8303:	01 d0                	add    %edx,%eax
    8305:	83 c0 08             	add    $0x8,%eax
    8308:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    830b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    830e:	8b 40 10             	mov    0x10(%eax),%eax
    8311:	85 c0                	test   %eax,%eax
    8313:	0f 84 7e 02 00 00    	je     8597 <III_get_scale_factors+0x2c4>
    8319:	8b 45 e8             	mov    -0x18(%ebp),%eax
    831c:	8b 40 14             	mov    0x14(%eax),%eax
    831f:	83 f8 02             	cmp    $0x2,%eax
    8322:	0f 85 6f 02 00 00    	jne    8597 <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    8328:	8b 45 e8             	mov    -0x18(%ebp),%eax
    832b:	8b 40 18             	mov    0x18(%eax),%eax
    832e:	85 c0                	test   %eax,%eax
    8330:	0f 84 6b 01 00 00    	je     84a1 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    8336:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    833d:	eb 32                	jmp    8371 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    833f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8342:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    8345:	8b 04 85 60 fc 00 00 	mov    0xfc60(,%eax,4),%eax
    834c:	89 04 24             	mov    %eax,(%esp)
    834f:	e8 b9 db ff ff       	call   5f0d <hgetbits>
    8354:	89 c3                	mov    %eax,%ebx
    8356:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8359:	8b 45 14             	mov    0x14(%ebp),%eax
    835c:	01 c0                	add    %eax,%eax
    835e:	89 c2                	mov    %eax,%edx
    8360:	c1 e2 05             	shl    $0x5,%edx
    8363:	29 c2                	sub    %eax,%edx
    8365:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8368:	01 d0                	add    %edx,%eax
    836a:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    836d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8371:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    8375:	7e c8                	jle    833f <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    8377:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    837e:	eb 5c                	jmp    83dc <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    8380:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8387:	eb 49                	jmp    83d2 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    8389:	8b 45 e8             	mov    -0x18(%ebp),%eax
    838c:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    838f:	8b 04 85 60 fc 00 00 	mov    0xfc60(,%eax,4),%eax
    8396:	89 04 24             	mov    %eax,(%esp)
    8399:	e8 6f db ff ff       	call   5f0d <hgetbits>
    839e:	89 c6                	mov    %eax,%esi
    83a0:	8b 5d 08             	mov    0x8(%ebp),%ebx
    83a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    83a6:	8b 4d 14             	mov    0x14(%ebp),%ecx
    83a9:	89 d0                	mov    %edx,%eax
    83ab:	01 c0                	add    %eax,%eax
    83ad:	01 d0                	add    %edx,%eax
    83af:	c1 e0 02             	shl    $0x2,%eax
    83b2:	01 d0                	add    %edx,%eax
    83b4:	89 ca                	mov    %ecx,%edx
    83b6:	01 d2                	add    %edx,%edx
    83b8:	89 d1                	mov    %edx,%ecx
    83ba:	c1 e1 05             	shl    $0x5,%ecx
    83bd:	29 d1                	sub    %edx,%ecx
    83bf:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    83c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83c5:	01 d0                	add    %edx,%eax
    83c7:	83 c0 14             	add    $0x14,%eax
    83ca:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    83ce:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    83d2:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    83d6:	7e b1                	jle    8389 <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    83d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    83dc:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    83e0:	7e 9e                	jle    8380 <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    83e2:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    83e9:	eb 5f                	jmp    844a <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    83eb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    83f2:	eb 4c                	jmp    8440 <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    83f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    83f7:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    83fa:	83 c0 10             	add    $0x10,%eax
    83fd:	8b 04 85 60 fc 00 00 	mov    0xfc60(,%eax,4),%eax
    8404:	89 04 24             	mov    %eax,(%esp)
    8407:	e8 01 db ff ff       	call   5f0d <hgetbits>
    840c:	89 c6                	mov    %eax,%esi
    840e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8411:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8414:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8417:	89 d0                	mov    %edx,%eax
    8419:	01 c0                	add    %eax,%eax
    841b:	01 d0                	add    %edx,%eax
    841d:	c1 e0 02             	shl    $0x2,%eax
    8420:	01 d0                	add    %edx,%eax
    8422:	89 ca                	mov    %ecx,%edx
    8424:	01 d2                	add    %edx,%edx
    8426:	89 d1                	mov    %edx,%ecx
    8428:	c1 e1 05             	shl    $0x5,%ecx
    842b:	29 d1                	sub    %edx,%ecx
    842d:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8430:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8433:	01 d0                	add    %edx,%eax
    8435:	83 c0 14             	add    $0x14,%eax
    8438:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    843c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8440:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8444:	7e ae                	jle    83f4 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    8446:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    844a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    844e:	7e 9b                	jle    83eb <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    8450:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8457:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    845e:	eb 36                	jmp    8496 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    8460:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8463:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8466:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8469:	89 d0                	mov    %edx,%eax
    846b:	01 c0                	add    %eax,%eax
    846d:	01 d0                	add    %edx,%eax
    846f:	c1 e0 02             	shl    $0x2,%eax
    8472:	01 d0                	add    %edx,%eax
    8474:	89 ca                	mov    %ecx,%edx
    8476:	01 d2                	add    %edx,%edx
    8478:	89 d1                	mov    %edx,%ecx
    847a:	c1 e1 05             	shl    $0x5,%ecx
    847d:	29 d1                	sub    %edx,%ecx
    847f:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8482:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8485:	01 d0                	add    %edx,%eax
    8487:	83 c0 14             	add    $0x14,%eax
    848a:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    8491:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    8492:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8496:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    849a:	7e c4                	jle    8460 <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    849c:	e9 b1 01 00 00       	jmp    8652 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    84a1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    84a8:	e9 8f 00 00 00       	jmp    853c <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    84ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84b0:	83 c0 04             	add    $0x4,%eax
    84b3:	8b 04 85 44 fc 00 00 	mov    0xfc44(,%eax,4),%eax
    84ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    84bd:	eb 64                	jmp    8523 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    84bf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    84c6:	eb 51                	jmp    8519 <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    84c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    84cb:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    84ce:	8b 55 f0             	mov    -0x10(%ebp),%edx
    84d1:	c1 e2 04             	shl    $0x4,%edx
    84d4:	01 d0                	add    %edx,%eax
    84d6:	8b 04 85 60 fc 00 00 	mov    0xfc60(,%eax,4),%eax
    84dd:	89 04 24             	mov    %eax,(%esp)
    84e0:	e8 28 da ff ff       	call   5f0d <hgetbits>
    84e5:	89 c6                	mov    %eax,%esi
    84e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    84ea:	8b 55 ec             	mov    -0x14(%ebp),%edx
    84ed:	8b 4d 14             	mov    0x14(%ebp),%ecx
    84f0:	89 d0                	mov    %edx,%eax
    84f2:	01 c0                	add    %eax,%eax
    84f4:	01 d0                	add    %edx,%eax
    84f6:	c1 e0 02             	shl    $0x2,%eax
    84f9:	01 d0                	add    %edx,%eax
    84fb:	89 ca                	mov    %ecx,%edx
    84fd:	01 d2                	add    %edx,%edx
    84ff:	89 d1                	mov    %edx,%ecx
    8501:	c1 e1 05             	shl    $0x5,%ecx
    8504:	29 d1                	sub    %edx,%ecx
    8506:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8509:	8b 45 f4             	mov    -0xc(%ebp),%eax
    850c:	01 d0                	add    %edx,%eax
    850e:	83 c0 14             	add    $0x14,%eax
    8511:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    8515:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8519:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    851d:	7e a9                	jle    84c8 <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    851f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8523:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8526:	83 c0 01             	add    $0x1,%eax
    8529:	83 c0 04             	add    $0x4,%eax
    852c:	8b 04 85 44 fc 00 00 	mov    0xfc44(,%eax,4),%eax
    8533:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    8536:	7f 87                	jg     84bf <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    8538:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    853c:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8540:	0f 8e 67 ff ff ff    	jle    84ad <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    8546:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    854d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8554:	eb 36                	jmp    858c <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    8556:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8559:	8b 55 ec             	mov    -0x14(%ebp),%edx
    855c:	8b 4d 14             	mov    0x14(%ebp),%ecx
    855f:	89 d0                	mov    %edx,%eax
    8561:	01 c0                	add    %eax,%eax
    8563:	01 d0                	add    %edx,%eax
    8565:	c1 e0 02             	shl    $0x2,%eax
    8568:	01 d0                	add    %edx,%eax
    856a:	89 ca                	mov    %ecx,%edx
    856c:	01 d2                	add    %edx,%edx
    856e:	89 d1                	mov    %edx,%ecx
    8570:	c1 e1 05             	shl    $0x5,%ecx
    8573:	29 d1                	sub    %edx,%ecx
    8575:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8578:	8b 45 f4             	mov    -0xc(%ebp),%eax
    857b:	01 d0                	add    %edx,%eax
    857d:	83 c0 14             	add    $0x14,%eax
    8580:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    8587:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    8588:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    858c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8590:	7e c4                	jle    8556 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    8592:	e9 bb 00 00 00       	jmp    8652 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    8597:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    859e:	e9 89 00 00 00       	jmp    862c <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    85a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    85a6:	8b 55 14             	mov    0x14(%ebp),%edx
    85a9:	89 d0                	mov    %edx,%eax
    85ab:	c1 e0 02             	shl    $0x2,%eax
    85ae:	01 d0                	add    %edx,%eax
    85b0:	c1 e0 03             	shl    $0x3,%eax
    85b3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    85b6:	01 d0                	add    %edx,%eax
    85b8:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    85bc:	85 c0                	test   %eax,%eax
    85be:	74 06                	je     85c6 <III_get_scale_factors+0x2f3>
    85c0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    85c4:	75 62                	jne    8628 <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    85c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    85c9:	8b 04 85 40 fc 00 00 	mov    0xfc40(,%eax,4),%eax
    85d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    85d3:	eb 41                	jmp    8616 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    85d5:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    85d9:	0f 9f c0             	setg   %al
    85dc:	0f b6 d0             	movzbl %al,%edx
    85df:	8b 45 e8             	mov    -0x18(%ebp),%eax
    85e2:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    85e5:	c1 e2 04             	shl    $0x4,%edx
    85e8:	01 d0                	add    %edx,%eax
    85ea:	8b 04 85 60 fc 00 00 	mov    0xfc60(,%eax,4),%eax
    85f1:	89 04 24             	mov    %eax,(%esp)
    85f4:	e8 14 d9 ff ff       	call   5f0d <hgetbits>
    85f9:	89 c3                	mov    %eax,%ebx
    85fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
    85fe:	8b 45 14             	mov    0x14(%ebp),%eax
    8601:	01 c0                	add    %eax,%eax
    8603:	89 c2                	mov    %eax,%edx
    8605:	c1 e2 05             	shl    $0x5,%edx
    8608:	29 c2                	sub    %eax,%edx
    860a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    860d:	01 d0                	add    %edx,%eax
    860f:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    8612:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8616:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8619:	83 c0 01             	add    $0x1,%eax
    861c:	8b 04 85 40 fc 00 00 	mov    0xfc40(,%eax,4),%eax
    8623:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    8626:	7f ad                	jg     85d5 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    8628:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    862c:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    8630:	0f 8e 6d ff ff ff    	jle    85a3 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    8636:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8639:	8b 45 14             	mov    0x14(%ebp),%eax
    863c:	c1 e0 03             	shl    $0x3,%eax
    863f:	89 c2                	mov    %eax,%edx
    8641:	c1 e2 05             	shl    $0x5,%edx
    8644:	29 c2                	sub    %eax,%edx
    8646:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    8649:	83 c0 58             	add    $0x58,%eax
    864c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    8652:	83 c4 20             	add    $0x20,%esp
    8655:	5b                   	pop    %ebx
    8656:	5e                   	pop    %esi
    8657:	5d                   	pop    %ebp
    8658:	c3                   	ret    

00008659 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    8659:	55                   	push   %ebp
    865a:	89 e5                	mov    %esp,%ebp
    865c:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    865f:	a1 80 ff 00 00       	mov    0xff80,%eax
    8664:	85 c0                	test   %eax,%eax
    8666:	74 02                	je     866a <initialize_huffman+0x11>
    8668:	eb 0f                	jmp    8679 <initialize_huffman+0x20>
	read_decoder_table();
    866a:	e8 03 d9 ff ff       	call   5f72 <read_decoder_table>
	huffman_initialized = TRUE;
    866f:	c7 05 80 ff 00 00 01 	movl   $0x1,0xff80
    8676:	00 00 00 
}
    8679:	c9                   	leave  
    867a:	c3                   	ret    

0000867b <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    867b:	55                   	push   %ebp
    867c:	89 e5                	mov    %esp,%ebp
    867e:	57                   	push   %edi
    867f:	56                   	push   %esi
    8680:	53                   	push   %ebx
    8681:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    8684:	e8 d0 ff ff ff       	call   8659 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    8689:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    868c:	8b 45 14             	mov    0x14(%ebp),%eax
    868f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8692:	89 c2                	mov    %eax,%edx
    8694:	c1 e2 03             	shl    $0x3,%edx
    8697:	01 c2                	add    %eax,%edx
    8699:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    86a0:	89 c2                	mov    %eax,%edx
    86a2:	89 c8                	mov    %ecx,%eax
    86a4:	c1 e0 02             	shl    $0x2,%eax
    86a7:	01 c8                	add    %ecx,%eax
    86a9:	c1 e0 05             	shl    $0x5,%eax
    86ac:	01 d0                	add    %edx,%eax
    86ae:	01 d8                	add    %ebx,%eax
    86b0:	83 c0 28             	add    $0x28,%eax
    86b3:	8b 00                	mov    (%eax),%eax
    86b5:	85 c0                	test   %eax,%eax
    86b7:	74 44                	je     86fd <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    86b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    86bc:	8b 45 14             	mov    0x14(%ebp),%eax
    86bf:	8b 4d 10             	mov    0x10(%ebp),%ecx
    86c2:	89 c2                	mov    %eax,%edx
    86c4:	c1 e2 03             	shl    $0x3,%edx
    86c7:	01 c2                	add    %eax,%edx
    86c9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    86d0:	89 c2                	mov    %eax,%edx
    86d2:	89 c8                	mov    %ecx,%eax
    86d4:	c1 e0 02             	shl    $0x2,%eax
    86d7:	01 c8                	add    %ecx,%eax
    86d9:	c1 e0 05             	shl    $0x5,%eax
    86dc:	01 d0                	add    %edx,%eax
    86de:	01 d8                	add    %ebx,%eax
    86e0:	83 c0 2c             	add    $0x2c,%eax
    86e3:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    86e5:	83 f8 02             	cmp    $0x2,%eax
    86e8:	75 13                	jne    86fd <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    86ea:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    86f1:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    86f8:	e9 cc 00 00 00       	jmp    87c9 <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    86fd:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8700:	8b 00                	mov    (%eax),%eax
    8702:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    8705:	8b 75 0c             	mov    0xc(%ebp),%esi
    8708:	8b 45 14             	mov    0x14(%ebp),%eax
    870b:	8b 5d 10             	mov    0x10(%ebp),%ebx
    870e:	89 c2                	mov    %eax,%edx
    8710:	c1 e2 03             	shl    $0x3,%edx
    8713:	01 c2                	add    %eax,%edx
    8715:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    871c:	89 c2                	mov    %eax,%edx
    871e:	89 d8                	mov    %ebx,%eax
    8720:	c1 e0 02             	shl    $0x2,%eax
    8723:	01 d8                	add    %ebx,%eax
    8725:	c1 e0 05             	shl    $0x5,%eax
    8728:	01 d0                	add    %edx,%eax
    872a:	01 f0                	add    %esi,%eax
    872c:	83 c0 4c             	add    $0x4c,%eax
    872f:	8b 00                	mov    (%eax),%eax
    8731:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8734:	89 c8                	mov    %ecx,%eax
    8736:	c1 e0 03             	shl    $0x3,%eax
    8739:	01 c8                	add    %ecx,%eax
    873b:	c1 e0 02             	shl    $0x2,%eax
    873e:	01 c8                	add    %ecx,%eax
    8740:	01 d0                	add    %edx,%eax
    8742:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    8749:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    874c:	8b 45 1c             	mov    0x1c(%ebp),%eax
    874f:	8b 00                	mov    (%eax),%eax
    8751:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8754:	8b 75 0c             	mov    0xc(%ebp),%esi
    8757:	8b 45 14             	mov    0x14(%ebp),%eax
    875a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    875d:	89 c2                	mov    %eax,%edx
    875f:	c1 e2 03             	shl    $0x3,%edx
    8762:	01 c2                	add    %eax,%edx
    8764:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    876b:	89 c2                	mov    %eax,%edx
    876d:	89 d8                	mov    %ebx,%eax
    876f:	c1 e0 02             	shl    $0x2,%eax
    8772:	01 d8                	add    %ebx,%eax
    8774:	c1 e0 05             	shl    $0x5,%eax
    8777:	01 d0                	add    %edx,%eax
    8779:	01 f0                	add    %esi,%eax
    877b:	83 c0 4c             	add    $0x4c,%eax
    877e:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    8780:	8b 7d 0c             	mov    0xc(%ebp),%edi
    8783:	8b 45 14             	mov    0x14(%ebp),%eax
    8786:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8789:	89 c2                	mov    %eax,%edx
    878b:	c1 e2 03             	shl    $0x3,%edx
    878e:	01 c2                	add    %eax,%edx
    8790:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8797:	89 c2                	mov    %eax,%edx
    8799:	89 d8                	mov    %ebx,%eax
    879b:	c1 e0 02             	shl    $0x2,%eax
    879e:	01 d8                	add    %ebx,%eax
    87a0:	c1 e0 05             	shl    $0x5,%eax
    87a3:	01 d0                	add    %edx,%eax
    87a5:	01 f8                	add    %edi,%eax
    87a7:	83 c0 50             	add    $0x50,%eax
    87aa:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    87ac:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    87ae:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    87b1:	89 c8                	mov    %ecx,%eax
    87b3:	c1 e0 03             	shl    $0x3,%eax
    87b6:	01 c8                	add    %ecx,%eax
    87b8:	c1 e0 02             	shl    $0x2,%eax
    87bb:	01 c8                	add    %ecx,%eax
    87bd:	01 d0                	add    %edx,%eax
    87bf:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    87c6:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    87c9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    87d0:	e9 ac 01 00 00       	jmp    8981 <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    87d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    87d8:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    87db:	7d 43                	jge    8820 <III_hufman_decode+0x1a5>
    87dd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    87e0:	8b 45 14             	mov    0x14(%ebp),%eax
    87e3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    87e6:	89 c2                	mov    %eax,%edx
    87e8:	c1 e2 03             	shl    $0x3,%edx
    87eb:	01 c2                	add    %eax,%edx
    87ed:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    87f4:	89 c2                	mov    %eax,%edx
    87f6:	89 c8                	mov    %ecx,%eax
    87f8:	c1 e0 02             	shl    $0x2,%eax
    87fb:	01 c8                	add    %ecx,%eax
    87fd:	c1 e0 05             	shl    $0x5,%eax
    8800:	01 d0                	add    %edx,%eax
    8802:	01 d8                	add    %ebx,%eax
    8804:	83 c0 34             	add    $0x34,%eax
    8807:	8b 10                	mov    (%eax),%edx
    8809:	89 d0                	mov    %edx,%eax
    880b:	c1 e0 02             	shl    $0x2,%eax
    880e:	01 d0                	add    %edx,%eax
    8810:	c1 e0 03             	shl    $0x3,%eax
    8813:	05 00 39 01 00       	add    $0x13900,%eax
    8818:	89 45 e0             	mov    %eax,-0x20(%ebp)
    881b:	e9 86 00 00 00       	jmp    88a6 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    8820:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8823:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    8826:	7d 40                	jge    8868 <III_hufman_decode+0x1ed>
    8828:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    882b:	8b 45 14             	mov    0x14(%ebp),%eax
    882e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8831:	89 c2                	mov    %eax,%edx
    8833:	c1 e2 03             	shl    $0x3,%edx
    8836:	01 c2                	add    %eax,%edx
    8838:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    883f:	89 c2                	mov    %eax,%edx
    8841:	89 c8                	mov    %ecx,%eax
    8843:	c1 e0 02             	shl    $0x2,%eax
    8846:	01 c8                	add    %ecx,%eax
    8848:	c1 e0 05             	shl    $0x5,%eax
    884b:	01 d0                	add    %edx,%eax
    884d:	01 d8                	add    %ebx,%eax
    884f:	83 c0 38             	add    $0x38,%eax
    8852:	8b 10                	mov    (%eax),%edx
    8854:	89 d0                	mov    %edx,%eax
    8856:	c1 e0 02             	shl    $0x2,%eax
    8859:	01 d0                	add    %edx,%eax
    885b:	c1 e0 03             	shl    $0x3,%eax
    885e:	05 00 39 01 00       	add    $0x13900,%eax
    8863:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8866:	eb 3e                	jmp    88a6 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    8868:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    886b:	8b 45 14             	mov    0x14(%ebp),%eax
    886e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8871:	89 c2                	mov    %eax,%edx
    8873:	c1 e2 03             	shl    $0x3,%edx
    8876:	01 c2                	add    %eax,%edx
    8878:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    887f:	89 c2                	mov    %eax,%edx
    8881:	89 c8                	mov    %ecx,%eax
    8883:	c1 e0 02             	shl    $0x2,%eax
    8886:	01 c8                	add    %ecx,%eax
    8888:	c1 e0 05             	shl    $0x5,%eax
    888b:	01 d0                	add    %edx,%eax
    888d:	01 d8                	add    %ebx,%eax
    888f:	83 c0 3c             	add    $0x3c,%eax
    8892:	8b 10                	mov    (%eax),%edx
    8894:	89 d0                	mov    %edx,%eax
    8896:	c1 e0 02             	shl    $0x2,%eax
    8899:	01 d0                	add    %edx,%eax
    889b:	c1 e0 03             	shl    $0x3,%eax
    889e:	05 00 39 01 00       	add    $0x13900,%eax
    88a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    88a6:	8d 45 c8             	lea    -0x38(%ebp),%eax
    88a9:	89 44 24 10          	mov    %eax,0x10(%esp)
    88ad:	8d 45 cc             	lea    -0x34(%ebp),%eax
    88b0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    88b4:	8d 45 d0             	lea    -0x30(%ebp),%eax
    88b7:	89 44 24 08          	mov    %eax,0x8(%esp)
    88bb:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    88be:	89 44 24 04          	mov    %eax,0x4(%esp)
    88c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    88c5:	89 04 24             	mov    %eax,(%esp)
    88c8:	e8 fd ee ff ff       	call   77ca <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    88cd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    88d0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    88d5:	89 c8                	mov    %ecx,%eax
    88d7:	f7 ea                	imul   %edx
    88d9:	c1 fa 02             	sar    $0x2,%edx
    88dc:	89 c8                	mov    %ecx,%eax
    88de:	c1 f8 1f             	sar    $0x1f,%eax
    88e1:	29 c2                	sub    %eax,%edx
    88e3:	89 d0                	mov    %edx,%eax
    88e5:	89 c2                	mov    %eax,%edx
    88e7:	89 d0                	mov    %edx,%eax
    88e9:	c1 e0 03             	shl    $0x3,%eax
    88ec:	01 d0                	add    %edx,%eax
    88ee:	c1 e0 03             	shl    $0x3,%eax
    88f1:	89 c2                	mov    %eax,%edx
    88f3:	8b 45 08             	mov    0x8(%ebp),%eax
    88f6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    88f9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    88fc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8901:	89 c8                	mov    %ecx,%eax
    8903:	f7 ea                	imul   %edx
    8905:	c1 fa 02             	sar    $0x2,%edx
    8908:	89 c8                	mov    %ecx,%eax
    890a:	c1 f8 1f             	sar    $0x1f,%eax
    890d:	29 c2                	sub    %eax,%edx
    890f:	89 d0                	mov    %edx,%eax
    8911:	c1 e0 03             	shl    $0x3,%eax
    8914:	01 d0                	add    %edx,%eax
    8916:	01 c0                	add    %eax,%eax
    8918:	29 c1                	sub    %eax,%ecx
    891a:	89 ca                	mov    %ecx,%edx
    891c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    891f:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    8922:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8925:	8d 48 01             	lea    0x1(%eax),%ecx
    8928:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    892d:	89 c8                	mov    %ecx,%eax
    892f:	f7 ea                	imul   %edx
    8931:	c1 fa 02             	sar    $0x2,%edx
    8934:	89 c8                	mov    %ecx,%eax
    8936:	c1 f8 1f             	sar    $0x1f,%eax
    8939:	29 c2                	sub    %eax,%edx
    893b:	89 d0                	mov    %edx,%eax
    893d:	89 c2                	mov    %eax,%edx
    893f:	89 d0                	mov    %edx,%eax
    8941:	c1 e0 03             	shl    $0x3,%eax
    8944:	01 d0                	add    %edx,%eax
    8946:	c1 e0 03             	shl    $0x3,%eax
    8949:	89 c2                	mov    %eax,%edx
    894b:	8b 45 08             	mov    0x8(%ebp),%eax
    894e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8951:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8954:	8d 48 01             	lea    0x1(%eax),%ecx
    8957:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    895c:	89 c8                	mov    %ecx,%eax
    895e:	f7 ea                	imul   %edx
    8960:	c1 fa 02             	sar    $0x2,%edx
    8963:	89 c8                	mov    %ecx,%eax
    8965:	c1 f8 1f             	sar    $0x1f,%eax
    8968:	29 c2                	sub    %eax,%edx
    896a:	89 d0                	mov    %edx,%eax
    896c:	c1 e0 03             	shl    $0x3,%eax
    896f:	01 d0                	add    %edx,%eax
    8971:	01 c0                	add    %eax,%eax
    8973:	29 c1                	sub    %eax,%ecx
    8975:	89 ca                	mov    %ecx,%edx
    8977:	8b 45 d0             	mov    -0x30(%ebp),%eax
    897a:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    897d:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    8981:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    8984:	8b 75 0c             	mov    0xc(%ebp),%esi
    8987:	8b 45 14             	mov    0x14(%ebp),%eax
    898a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    898d:	89 c2                	mov    %eax,%edx
    898f:	c1 e2 03             	shl    $0x3,%edx
    8992:	01 c2                	add    %eax,%edx
    8994:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    899b:	89 c2                	mov    %eax,%edx
    899d:	89 c8                	mov    %ecx,%eax
    899f:	c1 e0 02             	shl    $0x2,%eax
    89a2:	01 c8                	add    %ecx,%eax
    89a4:	c1 e0 05             	shl    $0x5,%eax
    89a7:	01 d0                	add    %edx,%eax
    89a9:	01 f0                	add    %esi,%eax
    89ab:	83 c0 1c             	add    $0x1c,%eax
    89ae:	8b 00                	mov    (%eax),%eax
    89b0:	01 c0                	add    %eax,%eax
    89b2:	39 c3                	cmp    %eax,%ebx
    89b4:	0f 82 1b fe ff ff    	jb     87d5 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    89ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    89bd:	8b 45 14             	mov    0x14(%ebp),%eax
    89c0:	8b 4d 10             	mov    0x10(%ebp),%ecx
    89c3:	89 c2                	mov    %eax,%edx
    89c5:	c1 e2 03             	shl    $0x3,%edx
    89c8:	01 c2                	add    %eax,%edx
    89ca:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    89d1:	89 c2                	mov    %eax,%edx
    89d3:	89 c8                	mov    %ecx,%eax
    89d5:	c1 e0 02             	shl    $0x2,%eax
    89d8:	01 c8                	add    %ecx,%eax
    89da:	c1 e0 05             	shl    $0x5,%eax
    89dd:	01 d0                	add    %edx,%eax
    89df:	01 d8                	add    %ebx,%eax
    89e1:	83 c0 5c             	add    $0x5c,%eax
    89e4:	8b 00                	mov    (%eax),%eax
    89e6:	8d 50 20             	lea    0x20(%eax),%edx
    89e9:	89 d0                	mov    %edx,%eax
    89eb:	c1 e0 02             	shl    $0x2,%eax
    89ee:	01 d0                	add    %edx,%eax
    89f0:	c1 e0 03             	shl    $0x3,%eax
    89f3:	05 00 39 01 00       	add    $0x13900,%eax
    89f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    89fb:	e9 91 01 00 00       	jmp    8b91 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    8a00:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8a03:	89 44 24 10          	mov    %eax,0x10(%esp)
    8a07:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8a0a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    8a0e:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8a11:	89 44 24 08          	mov    %eax,0x8(%esp)
    8a15:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    8a18:	89 44 24 04          	mov    %eax,0x4(%esp)
    8a1c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8a1f:	89 04 24             	mov    %eax,(%esp)
    8a22:	e8 a3 ed ff ff       	call   77ca <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    8a27:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8a2a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8a2f:	89 c8                	mov    %ecx,%eax
    8a31:	f7 ea                	imul   %edx
    8a33:	c1 fa 02             	sar    $0x2,%edx
    8a36:	89 c8                	mov    %ecx,%eax
    8a38:	c1 f8 1f             	sar    $0x1f,%eax
    8a3b:	29 c2                	sub    %eax,%edx
    8a3d:	89 d0                	mov    %edx,%eax
    8a3f:	89 c2                	mov    %eax,%edx
    8a41:	89 d0                	mov    %edx,%eax
    8a43:	c1 e0 03             	shl    $0x3,%eax
    8a46:	01 d0                	add    %edx,%eax
    8a48:	c1 e0 03             	shl    $0x3,%eax
    8a4b:	89 c2                	mov    %eax,%edx
    8a4d:	8b 45 08             	mov    0x8(%ebp),%eax
    8a50:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8a53:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8a56:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8a5b:	89 c8                	mov    %ecx,%eax
    8a5d:	f7 ea                	imul   %edx
    8a5f:	c1 fa 02             	sar    $0x2,%edx
    8a62:	89 c8                	mov    %ecx,%eax
    8a64:	c1 f8 1f             	sar    $0x1f,%eax
    8a67:	29 c2                	sub    %eax,%edx
    8a69:	89 d0                	mov    %edx,%eax
    8a6b:	c1 e0 03             	shl    $0x3,%eax
    8a6e:	01 d0                	add    %edx,%eax
    8a70:	01 c0                	add    %eax,%eax
    8a72:	29 c1                	sub    %eax,%ecx
    8a74:	89 ca                	mov    %ecx,%edx
    8a76:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8a79:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    8a7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8a7f:	8d 48 01             	lea    0x1(%eax),%ecx
    8a82:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8a87:	89 c8                	mov    %ecx,%eax
    8a89:	f7 ea                	imul   %edx
    8a8b:	c1 fa 02             	sar    $0x2,%edx
    8a8e:	89 c8                	mov    %ecx,%eax
    8a90:	c1 f8 1f             	sar    $0x1f,%eax
    8a93:	29 c2                	sub    %eax,%edx
    8a95:	89 d0                	mov    %edx,%eax
    8a97:	89 c2                	mov    %eax,%edx
    8a99:	89 d0                	mov    %edx,%eax
    8a9b:	c1 e0 03             	shl    $0x3,%eax
    8a9e:	01 d0                	add    %edx,%eax
    8aa0:	c1 e0 03             	shl    $0x3,%eax
    8aa3:	89 c2                	mov    %eax,%edx
    8aa5:	8b 45 08             	mov    0x8(%ebp),%eax
    8aa8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8aab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8aae:	8d 48 01             	lea    0x1(%eax),%ecx
    8ab1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ab6:	89 c8                	mov    %ecx,%eax
    8ab8:	f7 ea                	imul   %edx
    8aba:	c1 fa 02             	sar    $0x2,%edx
    8abd:	89 c8                	mov    %ecx,%eax
    8abf:	c1 f8 1f             	sar    $0x1f,%eax
    8ac2:	29 c2                	sub    %eax,%edx
    8ac4:	89 d0                	mov    %edx,%eax
    8ac6:	c1 e0 03             	shl    $0x3,%eax
    8ac9:	01 d0                	add    %edx,%eax
    8acb:	01 c0                	add    %eax,%eax
    8acd:	29 c1                	sub    %eax,%ecx
    8acf:	89 ca                	mov    %ecx,%edx
    8ad1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8ad4:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    8ad7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8ada:	8d 48 02             	lea    0x2(%eax),%ecx
    8add:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ae2:	89 c8                	mov    %ecx,%eax
    8ae4:	f7 ea                	imul   %edx
    8ae6:	c1 fa 02             	sar    $0x2,%edx
    8ae9:	89 c8                	mov    %ecx,%eax
    8aeb:	c1 f8 1f             	sar    $0x1f,%eax
    8aee:	29 c2                	sub    %eax,%edx
    8af0:	89 d0                	mov    %edx,%eax
    8af2:	89 c2                	mov    %eax,%edx
    8af4:	89 d0                	mov    %edx,%eax
    8af6:	c1 e0 03             	shl    $0x3,%eax
    8af9:	01 d0                	add    %edx,%eax
    8afb:	c1 e0 03             	shl    $0x3,%eax
    8afe:	89 c2                	mov    %eax,%edx
    8b00:	8b 45 08             	mov    0x8(%ebp),%eax
    8b03:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8b06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8b09:	8d 48 02             	lea    0x2(%eax),%ecx
    8b0c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8b11:	89 c8                	mov    %ecx,%eax
    8b13:	f7 ea                	imul   %edx
    8b15:	c1 fa 02             	sar    $0x2,%edx
    8b18:	89 c8                	mov    %ecx,%eax
    8b1a:	c1 f8 1f             	sar    $0x1f,%eax
    8b1d:	29 c2                	sub    %eax,%edx
    8b1f:	89 d0                	mov    %edx,%eax
    8b21:	c1 e0 03             	shl    $0x3,%eax
    8b24:	01 d0                	add    %edx,%eax
    8b26:	01 c0                	add    %eax,%eax
    8b28:	29 c1                	sub    %eax,%ecx
    8b2a:	89 ca                	mov    %ecx,%edx
    8b2c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8b2f:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    8b32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8b35:	8d 48 03             	lea    0x3(%eax),%ecx
    8b38:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8b3d:	89 c8                	mov    %ecx,%eax
    8b3f:	f7 ea                	imul   %edx
    8b41:	c1 fa 02             	sar    $0x2,%edx
    8b44:	89 c8                	mov    %ecx,%eax
    8b46:	c1 f8 1f             	sar    $0x1f,%eax
    8b49:	29 c2                	sub    %eax,%edx
    8b4b:	89 d0                	mov    %edx,%eax
    8b4d:	89 c2                	mov    %eax,%edx
    8b4f:	89 d0                	mov    %edx,%eax
    8b51:	c1 e0 03             	shl    $0x3,%eax
    8b54:	01 d0                	add    %edx,%eax
    8b56:	c1 e0 03             	shl    $0x3,%eax
    8b59:	89 c2                	mov    %eax,%edx
    8b5b:	8b 45 08             	mov    0x8(%ebp),%eax
    8b5e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8b61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8b64:	8d 48 03             	lea    0x3(%eax),%ecx
    8b67:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8b6c:	89 c8                	mov    %ecx,%eax
    8b6e:	f7 ea                	imul   %edx
    8b70:	c1 fa 02             	sar    $0x2,%edx
    8b73:	89 c8                	mov    %ecx,%eax
    8b75:	c1 f8 1f             	sar    $0x1f,%eax
    8b78:	29 c2                	sub    %eax,%edx
    8b7a:	89 d0                	mov    %edx,%eax
    8b7c:	c1 e0 03             	shl    $0x3,%eax
    8b7f:	01 d0                	add    %edx,%eax
    8b81:	01 c0                	add    %eax,%eax
    8b83:	29 c1                	sub    %eax,%ecx
    8b85:	89 ca                	mov    %ecx,%edx
    8b87:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8b8a:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    8b8d:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    8b91:	e8 5b d3 ff ff       	call   5ef1 <hsstell>
    8b96:	89 c3                	mov    %eax,%ebx
    8b98:	8b 75 0c             	mov    0xc(%ebp),%esi
    8b9b:	8b 45 14             	mov    0x14(%ebp),%eax
    8b9e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8ba1:	89 c2                	mov    %eax,%edx
    8ba3:	c1 e2 03             	shl    $0x3,%edx
    8ba6:	01 c2                	add    %eax,%edx
    8ba8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8baf:	89 c2                	mov    %eax,%edx
    8bb1:	89 c8                	mov    %ecx,%eax
    8bb3:	c1 e0 02             	shl    $0x2,%eax
    8bb6:	01 c8                	add    %ecx,%eax
    8bb8:	c1 e0 05             	shl    $0x5,%eax
    8bbb:	01 d0                	add    %edx,%eax
    8bbd:	01 f0                	add    %esi,%eax
    8bbf:	83 c0 18             	add    $0x18,%eax
    8bc2:	8b 10                	mov    (%eax),%edx
    8bc4:	8b 45 18             	mov    0x18(%ebp),%eax
    8bc7:	01 d0                	add    %edx,%eax
    8bc9:	39 c3                	cmp    %eax,%ebx
    8bcb:	73 0d                	jae    8bda <III_hufman_decode+0x55f>
    8bcd:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8bd4:	0f 8e 26 fe ff ff    	jle    8a00 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    8bda:	e8 12 d3 ff ff       	call   5ef1 <hsstell>
    8bdf:	89 c3                	mov    %eax,%ebx
    8be1:	8b 75 0c             	mov    0xc(%ebp),%esi
    8be4:	8b 45 14             	mov    0x14(%ebp),%eax
    8be7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8bea:	89 c2                	mov    %eax,%edx
    8bec:	c1 e2 03             	shl    $0x3,%edx
    8bef:	01 c2                	add    %eax,%edx
    8bf1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8bf8:	89 c2                	mov    %eax,%edx
    8bfa:	89 c8                	mov    %ecx,%eax
    8bfc:	c1 e0 02             	shl    $0x2,%eax
    8bff:	01 c8                	add    %ecx,%eax
    8c01:	c1 e0 05             	shl    $0x5,%eax
    8c04:	01 d0                	add    %edx,%eax
    8c06:	01 f0                	add    %esi,%eax
    8c08:	83 c0 18             	add    $0x18,%eax
    8c0b:	8b 10                	mov    (%eax),%edx
    8c0d:	8b 45 18             	mov    0x18(%ebp),%eax
    8c10:	01 d0                	add    %edx,%eax
    8c12:	39 c3                	cmp    %eax,%ebx
    8c14:	76 48                	jbe    8c5e <III_hufman_decode+0x5e3>
   {  i -=4;
    8c16:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    8c1a:	e8 d2 d2 ff ff       	call   5ef1 <hsstell>
    8c1f:	8b 55 18             	mov    0x18(%ebp),%edx
    8c22:	29 d0                	sub    %edx,%eax
    8c24:	89 c6                	mov    %eax,%esi
    8c26:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8c29:	8b 45 14             	mov    0x14(%ebp),%eax
    8c2c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8c2f:	89 c2                	mov    %eax,%edx
    8c31:	c1 e2 03             	shl    $0x3,%edx
    8c34:	01 c2                	add    %eax,%edx
    8c36:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c3d:	89 c2                	mov    %eax,%edx
    8c3f:	89 c8                	mov    %ecx,%eax
    8c41:	c1 e0 02             	shl    $0x2,%eax
    8c44:	01 c8                	add    %ecx,%eax
    8c46:	c1 e0 05             	shl    $0x5,%eax
    8c49:	01 d0                	add    %edx,%eax
    8c4b:	01 d8                	add    %ebx,%eax
    8c4d:	83 c0 18             	add    $0x18,%eax
    8c50:	8b 00                	mov    (%eax),%eax
    8c52:	29 c6                	sub    %eax,%esi
    8c54:	89 f0                	mov    %esi,%eax
    8c56:	89 04 24             	mov    %eax,(%esp)
    8c59:	e8 de d2 ff ff       	call   5f3c <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    8c5e:	e8 8e d2 ff ff       	call   5ef1 <hsstell>
    8c63:	89 c3                	mov    %eax,%ebx
    8c65:	8b 75 0c             	mov    0xc(%ebp),%esi
    8c68:	8b 45 14             	mov    0x14(%ebp),%eax
    8c6b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8c6e:	89 c2                	mov    %eax,%edx
    8c70:	c1 e2 03             	shl    $0x3,%edx
    8c73:	01 c2                	add    %eax,%edx
    8c75:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c7c:	89 c2                	mov    %eax,%edx
    8c7e:	89 c8                	mov    %ecx,%eax
    8c80:	c1 e0 02             	shl    $0x2,%eax
    8c83:	01 c8                	add    %ecx,%eax
    8c85:	c1 e0 05             	shl    $0x5,%eax
    8c88:	01 d0                	add    %edx,%eax
    8c8a:	01 f0                	add    %esi,%eax
    8c8c:	83 c0 18             	add    $0x18,%eax
    8c8f:	8b 10                	mov    (%eax),%edx
    8c91:	8b 45 18             	mov    0x18(%ebp),%eax
    8c94:	01 d0                	add    %edx,%eax
    8c96:	39 c3                	cmp    %eax,%ebx
    8c98:	73 45                	jae    8cdf <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    8c9a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8c9d:	8b 45 14             	mov    0x14(%ebp),%eax
    8ca0:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8ca3:	89 c2                	mov    %eax,%edx
    8ca5:	c1 e2 03             	shl    $0x3,%edx
    8ca8:	01 c2                	add    %eax,%edx
    8caa:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8cb1:	89 c2                	mov    %eax,%edx
    8cb3:	89 c8                	mov    %ecx,%eax
    8cb5:	c1 e0 02             	shl    $0x2,%eax
    8cb8:	01 c8                	add    %ecx,%eax
    8cba:	c1 e0 05             	shl    $0x5,%eax
    8cbd:	01 d0                	add    %edx,%eax
    8cbf:	01 d8                	add    %ebx,%eax
    8cc1:	83 c0 18             	add    $0x18,%eax
    8cc4:	8b 10                	mov    (%eax),%edx
    8cc6:	8b 45 18             	mov    0x18(%ebp),%eax
    8cc9:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8ccc:	e8 20 d2 ff ff       	call   5ef1 <hsstell>
    8cd1:	29 c3                	sub    %eax,%ebx
    8cd3:	89 d8                	mov    %ebx,%eax
    8cd5:	89 04 24             	mov    %eax,(%esp)
    8cd8:	e8 30 d2 ff ff       	call   5f0d <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    8cdd:	eb 5c                	jmp    8d3b <III_hufman_decode+0x6c0>
    8cdf:	eb 5a                	jmp    8d3b <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    8ce1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8ce4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ce9:	89 c8                	mov    %ecx,%eax
    8ceb:	f7 ea                	imul   %edx
    8ced:	c1 fa 02             	sar    $0x2,%edx
    8cf0:	89 c8                	mov    %ecx,%eax
    8cf2:	c1 f8 1f             	sar    $0x1f,%eax
    8cf5:	29 c2                	sub    %eax,%edx
    8cf7:	89 d0                	mov    %edx,%eax
    8cf9:	89 c2                	mov    %eax,%edx
    8cfb:	89 d0                	mov    %edx,%eax
    8cfd:	c1 e0 03             	shl    $0x3,%eax
    8d00:	01 d0                	add    %edx,%eax
    8d02:	c1 e0 03             	shl    $0x3,%eax
    8d05:	89 c2                	mov    %eax,%edx
    8d07:	8b 45 08             	mov    0x8(%ebp),%eax
    8d0a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8d0d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8d10:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d15:	89 c8                	mov    %ecx,%eax
    8d17:	f7 ea                	imul   %edx
    8d19:	c1 fa 02             	sar    $0x2,%edx
    8d1c:	89 c8                	mov    %ecx,%eax
    8d1e:	c1 f8 1f             	sar    $0x1f,%eax
    8d21:	29 c2                	sub    %eax,%edx
    8d23:	89 d0                	mov    %edx,%eax
    8d25:	c1 e0 03             	shl    $0x3,%eax
    8d28:	01 d0                	add    %edx,%eax
    8d2a:	01 c0                	add    %eax,%eax
    8d2c:	29 c1                	sub    %eax,%ecx
    8d2e:	89 ca                	mov    %ecx,%edx
    8d30:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    8d37:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    8d3b:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8d42:	7e 9d                	jle    8ce1 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    8d44:	83 c4 4c             	add    $0x4c,%esp
    8d47:	5b                   	pop    %ebx
    8d48:	5e                   	pop    %esi
    8d49:	5f                   	pop    %edi
    8d4a:	5d                   	pop    %ebp
    8d4b:	c3                   	ret    

00008d4c <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    8d4c:	55                   	push   %ebp
    8d4d:	89 e5                	mov    %esp,%ebp
    8d4f:	56                   	push   %esi
    8d50:	53                   	push   %ebx
    8d51:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    8d54:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8d5b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8d5e:	8b 00                	mov    (%eax),%eax
    8d60:	8b 40 10             	mov    0x10(%eax),%eax
    8d63:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    8d66:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    8d6d:	8b 45 14             	mov    0x14(%ebp),%eax
    8d70:	8b 40 10             	mov    0x10(%eax),%eax
    8d73:	85 c0                	test   %eax,%eax
    8d75:	74 61                	je     8dd8 <III_dequantize_sample+0x8c>
    8d77:	8b 45 14             	mov    0x14(%ebp),%eax
    8d7a:	8b 40 14             	mov    0x14(%eax),%eax
    8d7d:	83 f8 02             	cmp    $0x2,%eax
    8d80:	75 56                	jne    8dd8 <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    8d82:	8b 45 14             	mov    0x14(%ebp),%eax
    8d85:	8b 40 18             	mov    0x18(%eax),%eax
    8d88:	85 c0                	test   %eax,%eax
    8d8a:	74 15                	je     8da1 <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    8d8c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8d8f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d95:	05 e4 fc 00 00       	add    $0xfce4,%eax
    8d9a:	8b 00                	mov    (%eax),%eax
    8d9c:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    8d9f:	eb 4a                	jmp    8deb <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    8da1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8da4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8daa:	05 34 fd 00 00       	add    $0xfd34,%eax
    8daf:	8b 50 0c             	mov    0xc(%eax),%edx
    8db2:	89 d0                	mov    %edx,%eax
    8db4:	01 c0                	add    %eax,%eax
    8db6:	01 d0                	add    %edx,%eax
    8db8:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    8dbb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8dbe:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8dc4:	05 34 fd 00 00       	add    $0xfd34,%eax
    8dc9:	8b 40 0c             	mov    0xc(%eax),%eax
    8dcc:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    8dcf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    8dd6:	eb 13                	jmp    8deb <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    8dd8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8ddb:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8de1:	05 e4 fc 00 00       	add    $0xfce4,%eax
    8de6:	8b 00                	mov    (%eax),%eax
    8de8:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    8deb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8df2:	e9 3d 06 00 00       	jmp    9434 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    8df7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8dfe:	e9 23 06 00 00       	jmp    9426 <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    8e03:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8e06:	89 d0                	mov    %edx,%eax
    8e08:	c1 e0 03             	shl    $0x3,%eax
    8e0b:	01 d0                	add    %edx,%eax
    8e0d:	01 c0                	add    %eax,%eax
    8e0f:	89 c2                	mov    %eax,%edx
    8e11:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e14:	01 d0                	add    %edx,%eax
    8e16:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8e19:	0f 85 9e 02 00 00    	jne    90bd <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8e1f:	8b 45 14             	mov    0x14(%ebp),%eax
    8e22:	8b 40 10             	mov    0x10(%eax),%eax
    8e25:	85 c0                	test   %eax,%eax
    8e27:	0f 84 6b 02 00 00    	je     9098 <III_dequantize_sample+0x34c>
    8e2d:	8b 45 14             	mov    0x14(%ebp),%eax
    8e30:	8b 40 14             	mov    0x14(%eax),%eax
    8e33:	83 f8 02             	cmp    $0x2,%eax
    8e36:	0f 85 5c 02 00 00    	jne    9098 <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    8e3c:	8b 45 14             	mov    0x14(%ebp),%eax
    8e3f:	8b 40 18             	mov    0x18(%eax),%eax
    8e42:	85 c0                	test   %eax,%eax
    8e44:	0f 84 af 01 00 00    	je     8ff9 <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    8e4a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8e4d:	89 d0                	mov    %edx,%eax
    8e4f:	c1 e0 03             	shl    $0x3,%eax
    8e52:	01 d0                	add    %edx,%eax
    8e54:	01 c0                	add    %eax,%eax
    8e56:	89 c2                	mov    %eax,%edx
    8e58:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e5b:	01 c2                	add    %eax,%edx
    8e5d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8e60:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8e66:	05 00 fd 00 00       	add    $0xfd00,%eax
    8e6b:	8b 00                	mov    (%eax),%eax
    8e6d:	39 c2                	cmp    %eax,%edx
    8e6f:	0f 85 93 00 00 00    	jne    8f08 <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    8e75:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8e78:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8e7e:	05 40 fd 00 00       	add    $0xfd40,%eax
    8e83:	8b 50 0c             	mov    0xc(%eax),%edx
    8e86:	89 d0                	mov    %edx,%eax
    8e88:	01 c0                	add    %eax,%eax
    8e8a:	01 d0                	add    %edx,%eax
    8e8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    8e8f:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8e96:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8e99:	8d 48 01             	lea    0x1(%eax),%ecx
    8e9c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8e9f:	89 d0                	mov    %edx,%eax
    8ea1:	c1 e0 03             	shl    $0x3,%eax
    8ea4:	01 d0                	add    %edx,%eax
    8ea6:	c1 e0 02             	shl    $0x2,%eax
    8ea9:	01 d0                	add    %edx,%eax
    8eab:	01 c8                	add    %ecx,%eax
    8ead:	83 c0 14             	add    $0x14,%eax
    8eb0:	8b 0c 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    8eb7:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8eba:	89 d0                	mov    %edx,%eax
    8ebc:	c1 e0 03             	shl    $0x3,%eax
    8ebf:	01 d0                	add    %edx,%eax
    8ec1:	c1 e0 02             	shl    $0x2,%eax
    8ec4:	01 d0                	add    %edx,%eax
    8ec6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8ec9:	01 d0                	add    %edx,%eax
    8ecb:	83 c0 14             	add    $0x14,%eax
    8ece:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8ed5:	29 c1                	sub    %eax,%ecx
    8ed7:	89 c8                	mov    %ecx,%eax
    8ed9:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8edc:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8edf:	89 d0                	mov    %edx,%eax
    8ee1:	c1 e0 03             	shl    $0x3,%eax
    8ee4:	01 d0                	add    %edx,%eax
    8ee6:	c1 e0 02             	shl    $0x2,%eax
    8ee9:	01 d0                	add    %edx,%eax
    8eeb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8eee:	01 d0                	add    %edx,%eax
    8ef0:	83 c0 14             	add    $0x14,%eax
    8ef3:	8b 14 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%edx
    8efa:	89 d0                	mov    %edx,%eax
    8efc:	01 c0                	add    %eax,%eax
    8efe:	01 d0                	add    %edx,%eax
    8f00:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8f03:	e9 8e 01 00 00       	jmp    9096 <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    8f08:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8f0b:	89 d0                	mov    %edx,%eax
    8f0d:	c1 e0 03             	shl    $0x3,%eax
    8f10:	01 d0                	add    %edx,%eax
    8f12:	01 c0                	add    %eax,%eax
    8f14:	89 c2                	mov    %eax,%edx
    8f16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8f19:	01 c2                	add    %eax,%edx
    8f1b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8f1e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8f24:	05 00 fd 00 00       	add    $0xfd00,%eax
    8f29:	8b 00                	mov    (%eax),%eax
    8f2b:	39 c2                	cmp    %eax,%edx
    8f2d:	7d 2a                	jge    8f59 <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    8f2f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8f33:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8f36:	8d 48 01             	lea    0x1(%eax),%ecx
    8f39:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8f3c:	89 d0                	mov    %edx,%eax
    8f3e:	c1 e0 03             	shl    $0x3,%eax
    8f41:	01 d0                	add    %edx,%eax
    8f43:	c1 e0 02             	shl    $0x2,%eax
    8f46:	01 d0                	add    %edx,%eax
    8f48:	01 c8                	add    %ecx,%eax
    8f4a:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    8f51:	89 45 e8             	mov    %eax,-0x18(%ebp)
    8f54:	e9 3d 01 00 00       	jmp    9096 <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8f59:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8f5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8f60:	8d 48 01             	lea    0x1(%eax),%ecx
    8f63:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8f66:	89 d0                	mov    %edx,%eax
    8f68:	c1 e0 03             	shl    $0x3,%eax
    8f6b:	01 d0                	add    %edx,%eax
    8f6d:	c1 e0 02             	shl    $0x2,%eax
    8f70:	01 d0                	add    %edx,%eax
    8f72:	01 c8                	add    %ecx,%eax
    8f74:	83 c0 14             	add    $0x14,%eax
    8f77:	8b 14 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%edx
    8f7e:	89 d0                	mov    %edx,%eax
    8f80:	01 c0                	add    %eax,%eax
    8f82:	01 d0                	add    %edx,%eax
    8f84:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8f87:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8f8a:	8d 48 01             	lea    0x1(%eax),%ecx
    8f8d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8f90:	89 d0                	mov    %edx,%eax
    8f92:	c1 e0 03             	shl    $0x3,%eax
    8f95:	01 d0                	add    %edx,%eax
    8f97:	c1 e0 02             	shl    $0x2,%eax
    8f9a:	01 d0                	add    %edx,%eax
    8f9c:	01 c8                	add    %ecx,%eax
    8f9e:	83 c0 14             	add    $0x14,%eax
    8fa1:	8b 0c 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    8fa8:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8fab:	89 d0                	mov    %edx,%eax
    8fad:	c1 e0 03             	shl    $0x3,%eax
    8fb0:	01 d0                	add    %edx,%eax
    8fb2:	c1 e0 02             	shl    $0x2,%eax
    8fb5:	01 d0                	add    %edx,%eax
    8fb7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8fba:	01 d0                	add    %edx,%eax
    8fbc:	83 c0 14             	add    $0x14,%eax
    8fbf:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8fc6:	29 c1                	sub    %eax,%ecx
    8fc8:	89 c8                	mov    %ecx,%eax
    8fca:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8fcd:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8fd0:	89 d0                	mov    %edx,%eax
    8fd2:	c1 e0 03             	shl    $0x3,%eax
    8fd5:	01 d0                	add    %edx,%eax
    8fd7:	c1 e0 02             	shl    $0x2,%eax
    8fda:	01 d0                	add    %edx,%eax
    8fdc:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8fdf:	01 d0                	add    %edx,%eax
    8fe1:	83 c0 14             	add    $0x14,%eax
    8fe4:	8b 14 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%edx
    8feb:	89 d0                	mov    %edx,%eax
    8fed:	01 c0                	add    %eax,%eax
    8fef:	01 d0                	add    %edx,%eax
    8ff1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8ff4:	e9 c4 00 00 00       	jmp    90bd <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8ff9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8ffd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9000:	8d 48 01             	lea    0x1(%eax),%ecx
    9003:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9006:	89 d0                	mov    %edx,%eax
    9008:	c1 e0 03             	shl    $0x3,%eax
    900b:	01 d0                	add    %edx,%eax
    900d:	c1 e0 02             	shl    $0x2,%eax
    9010:	01 d0                	add    %edx,%eax
    9012:	01 c8                	add    %ecx,%eax
    9014:	83 c0 14             	add    $0x14,%eax
    9017:	8b 14 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%edx
    901e:	89 d0                	mov    %edx,%eax
    9020:	01 c0                	add    %eax,%eax
    9022:	01 d0                	add    %edx,%eax
    9024:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    9027:	8b 45 ec             	mov    -0x14(%ebp),%eax
    902a:	8d 48 01             	lea    0x1(%eax),%ecx
    902d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9030:	89 d0                	mov    %edx,%eax
    9032:	c1 e0 03             	shl    $0x3,%eax
    9035:	01 d0                	add    %edx,%eax
    9037:	c1 e0 02             	shl    $0x2,%eax
    903a:	01 d0                	add    %edx,%eax
    903c:	01 c8                	add    %ecx,%eax
    903e:	83 c0 14             	add    $0x14,%eax
    9041:	8b 0c 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    9048:	8b 55 dc             	mov    -0x24(%ebp),%edx
    904b:	89 d0                	mov    %edx,%eax
    904d:	c1 e0 03             	shl    $0x3,%eax
    9050:	01 d0                	add    %edx,%eax
    9052:	c1 e0 02             	shl    $0x2,%eax
    9055:	01 d0                	add    %edx,%eax
    9057:	8b 55 ec             	mov    -0x14(%ebp),%edx
    905a:	01 d0                	add    %edx,%eax
    905c:	83 c0 14             	add    $0x14,%eax
    905f:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    9066:	29 c1                	sub    %eax,%ecx
    9068:	89 c8                	mov    %ecx,%eax
    906a:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    906d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9070:	89 d0                	mov    %edx,%eax
    9072:	c1 e0 03             	shl    $0x3,%eax
    9075:	01 d0                	add    %edx,%eax
    9077:	c1 e0 02             	shl    $0x2,%eax
    907a:	01 d0                	add    %edx,%eax
    907c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    907f:	01 d0                	add    %edx,%eax
    9081:	83 c0 14             	add    $0x14,%eax
    9084:	8b 14 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%edx
    908b:	89 d0                	mov    %edx,%eax
    908d:	01 c0                	add    %eax,%eax
    908f:	01 d0                	add    %edx,%eax
    9091:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    9094:	eb 27                	jmp    90bd <III_dequantize_sample+0x371>
    9096:	eb 25                	jmp    90bd <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    9098:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    909c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    909f:	8d 48 01             	lea    0x1(%eax),%ecx
    90a2:	8b 55 dc             	mov    -0x24(%ebp),%edx
    90a5:	89 d0                	mov    %edx,%eax
    90a7:	c1 e0 03             	shl    $0x3,%eax
    90aa:	01 d0                	add    %edx,%eax
    90ac:	c1 e0 02             	shl    $0x2,%eax
    90af:	01 d0                	add    %edx,%eax
    90b1:	01 c8                	add    %ecx,%eax
    90b3:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    90ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    90bd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    90c0:	89 d0                	mov    %edx,%eax
    90c2:	c1 e0 03             	shl    $0x3,%eax
    90c5:	01 d0                	add    %edx,%eax
    90c7:	c1 e0 04             	shl    $0x4,%eax
    90ca:	89 c2                	mov    %eax,%edx
    90cc:	8b 45 0c             	mov    0xc(%ebp),%eax
    90cf:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    90d2:	8b 45 14             	mov    0x14(%ebp),%eax
    90d5:	8b 40 08             	mov    0x8(%eax),%eax
    90d8:	ba 00 00 00 00       	mov    $0x0,%edx
    90dd:	89 45 c8             	mov    %eax,-0x38(%ebp)
    90e0:	89 55 cc             	mov    %edx,-0x34(%ebp)
    90e3:	df 6d c8             	fildll -0x38(%ebp)
    90e6:	dd 05 f0 e1 00 00    	fldl   0xe1f0
    90ec:	de e9                	fsubrp %st,%st(1)
    90ee:	dd 05 f8 e1 00 00    	fldl   0xe1f8
    90f4:	de c9                	fmulp  %st,%st(1)
    90f6:	dd 5c 24 08          	fstpl  0x8(%esp)
    90fa:	dd 05 00 e2 00 00    	fldl   0xe200
    9100:	dd 1c 24             	fstpl  (%esp)
    9103:	e8 0c c1 ff ff       	call   5214 <pow>
    9108:	8b 45 f4             	mov    -0xc(%ebp),%eax
    910b:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    910e:	8b 45 14             	mov    0x14(%ebp),%eax
    9111:	8b 40 10             	mov    0x10(%eax),%eax
    9114:	85 c0                	test   %eax,%eax
    9116:	0f 84 86 01 00 00    	je     92a2 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    911c:	8b 45 14             	mov    0x14(%ebp),%eax
    911f:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    9122:	83 f8 02             	cmp    $0x2,%eax
    9125:	75 0a                	jne    9131 <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9127:	8b 45 14             	mov    0x14(%ebp),%eax
    912a:	8b 40 18             	mov    0x18(%eax),%eax
    912d:	85 c0                	test   %eax,%eax
    912f:	74 27                	je     9158 <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    9131:	8b 45 14             	mov    0x14(%ebp),%eax
    9134:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9137:	83 f8 02             	cmp    $0x2,%eax
    913a:	0f 85 62 01 00 00    	jne    92a2 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    9140:	8b 45 14             	mov    0x14(%ebp),%eax
    9143:	8b 40 18             	mov    0x18(%eax),%eax
    9146:	85 c0                	test   %eax,%eax
    9148:	0f 84 54 01 00 00    	je     92a2 <III_dequantize_sample+0x556>
    914e:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9152:	0f 8e 4a 01 00 00    	jle    92a2 <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    9158:	8b 55 f0             	mov    -0x10(%ebp),%edx
    915b:	89 d0                	mov    %edx,%eax
    915d:	c1 e0 03             	shl    $0x3,%eax
    9160:	01 d0                	add    %edx,%eax
    9162:	c1 e0 04             	shl    $0x4,%eax
    9165:	89 c2                	mov    %eax,%edx
    9167:	8b 45 0c             	mov    0xc(%ebp),%eax
    916a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    916d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9170:	89 d0                	mov    %edx,%eax
    9172:	c1 e0 03             	shl    $0x3,%eax
    9175:	01 d0                	add    %edx,%eax
    9177:	c1 e0 04             	shl    $0x4,%eax
    917a:	89 c2                	mov    %eax,%edx
    917c:	8b 45 0c             	mov    0xc(%ebp),%eax
    917f:	01 c2                	add    %eax,%edx
    9181:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9184:	dd 04 c2             	fldl   (%edx,%eax,8)
    9187:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    918a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    918d:	89 d0                	mov    %edx,%eax
    918f:	c1 e0 03             	shl    $0x3,%eax
    9192:	01 d0                	add    %edx,%eax
    9194:	01 c0                	add    %eax,%eax
    9196:	89 c2                	mov    %eax,%edx
    9198:	8b 45 f4             	mov    -0xc(%ebp),%eax
    919b:	01 d0                	add    %edx,%eax
    919d:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    91a0:	99                   	cltd   
    91a1:	f7 7d e0             	idivl  -0x20(%ebp)
    91a4:	89 c2                	mov    %eax,%edx
    91a6:	8b 45 14             	mov    0x14(%ebp),%eax
    91a9:	83 c2 08             	add    $0x8,%edx
    91ac:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    91b0:	ba 00 00 00 00       	mov    $0x0,%edx
    91b5:	89 45 c8             	mov    %eax,-0x38(%ebp)
    91b8:	89 55 cc             	mov    %edx,-0x34(%ebp)
    91bb:	df 6d c8             	fildll -0x38(%ebp)
    91be:	dd 05 08 e2 00 00    	fldl   0xe208
    91c4:	de c9                	fmulp  %st,%st(1)
    91c6:	dd 5c 24 08          	fstpl  0x8(%esp)
    91ca:	dd 05 00 e2 00 00    	fldl   0xe200
    91d0:	dd 1c 24             	fstpl  (%esp)
    91d3:	e8 3c c0 ff ff       	call   5214 <pow>
    91d8:	dc 4d c0             	fmull  -0x40(%ebp)
    91db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    91de:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    91e1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    91e4:	89 d0                	mov    %edx,%eax
    91e6:	c1 e0 03             	shl    $0x3,%eax
    91e9:	01 d0                	add    %edx,%eax
    91eb:	c1 e0 04             	shl    $0x4,%eax
    91ee:	89 c2                	mov    %eax,%edx
    91f0:	8b 45 0c             	mov    0xc(%ebp),%eax
    91f3:	8d 34 02             	lea    (%edx,%eax,1),%esi
    91f6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    91f9:	89 d0                	mov    %edx,%eax
    91fb:	c1 e0 03             	shl    $0x3,%eax
    91fe:	01 d0                	add    %edx,%eax
    9200:	c1 e0 04             	shl    $0x4,%eax
    9203:	89 c2                	mov    %eax,%edx
    9205:	8b 45 0c             	mov    0xc(%ebp),%eax
    9208:	01 c2                	add    %eax,%edx
    920a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    920d:	dd 04 c2             	fldl   (%edx,%eax,8)
    9210:	dd 5d c0             	fstpl  -0x40(%ebp)
    9213:	8b 45 14             	mov    0x14(%ebp),%eax
    9216:	8b 40 40             	mov    0x40(%eax),%eax
    9219:	ba 00 00 00 00       	mov    $0x0,%edx
    921e:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9221:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9224:	df 6d c8             	fildll -0x38(%ebp)
    9227:	d9 e8                	fld1   
    9229:	de c1                	faddp  %st,%st(1)
    922b:	dd 05 10 e2 00 00    	fldl   0xe210
    9231:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    9233:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9236:	89 d0                	mov    %edx,%eax
    9238:	c1 e0 03             	shl    $0x3,%eax
    923b:	01 d0                	add    %edx,%eax
    923d:	01 c0                	add    %eax,%eax
    923f:	89 c2                	mov    %eax,%edx
    9241:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9244:	01 d0                	add    %edx,%eax
    9246:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    9249:	99                   	cltd   
    924a:	f7 7d e0             	idivl  -0x20(%ebp)
    924d:	89 c2                	mov    %eax,%edx
    924f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    9252:	8b 4d 18             	mov    0x18(%ebp),%ecx
    9255:	89 d0                	mov    %edx,%eax
    9257:	01 c0                	add    %eax,%eax
    9259:	01 d0                	add    %edx,%eax
    925b:	c1 e0 02             	shl    $0x2,%eax
    925e:	01 d0                	add    %edx,%eax
    9260:	89 ca                	mov    %ecx,%edx
    9262:	01 d2                	add    %edx,%edx
    9264:	89 d1                	mov    %edx,%ecx
    9266:	c1 e1 05             	shl    $0x5,%ecx
    9269:	29 d1                	sub    %edx,%ecx
    926b:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    926e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9271:	01 d0                	add    %edx,%eax
    9273:	83 c0 14             	add    $0x14,%eax
    9276:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    927a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    927d:	db 45 d4             	fildl  -0x2c(%ebp)
    9280:	de c9                	fmulp  %st,%st(1)
    9282:	dd 5c 24 08          	fstpl  0x8(%esp)
    9286:	dd 05 00 e2 00 00    	fldl   0xe200
    928c:	dd 1c 24             	fstpl  (%esp)
    928f:	e8 80 bf ff ff       	call   5214 <pow>
    9294:	dc 4d c0             	fmull  -0x40(%ebp)
    9297:	8b 45 f4             	mov    -0xc(%ebp),%eax
    929a:	dd 1c c6             	fstpl  (%esi,%eax,8)
    929d:	e9 ab 00 00 00       	jmp    934d <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    92a2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    92a5:	89 d0                	mov    %edx,%eax
    92a7:	c1 e0 03             	shl    $0x3,%eax
    92aa:	01 d0                	add    %edx,%eax
    92ac:	c1 e0 04             	shl    $0x4,%eax
    92af:	89 c2                	mov    %eax,%edx
    92b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    92b4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    92b7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    92ba:	89 d0                	mov    %edx,%eax
    92bc:	c1 e0 03             	shl    $0x3,%eax
    92bf:	01 d0                	add    %edx,%eax
    92c1:	c1 e0 04             	shl    $0x4,%eax
    92c4:	89 c2                	mov    %eax,%edx
    92c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    92c9:	01 c2                	add    %eax,%edx
    92cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92ce:	dd 04 c2             	fldl   (%edx,%eax,8)
    92d1:	dd 5d c0             	fstpl  -0x40(%ebp)
    92d4:	8b 45 14             	mov    0x14(%ebp),%eax
    92d7:	8b 40 40             	mov    0x40(%eax),%eax
    92da:	ba 00 00 00 00       	mov    $0x0,%edx
    92df:	89 45 c8             	mov    %eax,-0x38(%ebp)
    92e2:	89 55 cc             	mov    %edx,-0x34(%ebp)
    92e5:	df 6d c8             	fildll -0x38(%ebp)
    92e8:	d9 e8                	fld1   
    92ea:	de c1                	faddp  %st,%st(1)
    92ec:	dd 05 10 e2 00 00    	fldl   0xe210
    92f2:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    92f4:	8b 4d 10             	mov    0x10(%ebp),%ecx
    92f7:	8b 45 18             	mov    0x18(%ebp),%eax
    92fa:	01 c0                	add    %eax,%eax
    92fc:	89 c2                	mov    %eax,%edx
    92fe:	c1 e2 05             	shl    $0x5,%edx
    9301:	29 c2                	sub    %eax,%edx
    9303:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9306:	01 d0                	add    %edx,%eax
    9308:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    930b:	89 c2                	mov    %eax,%edx
    930d:	8b 45 14             	mov    0x14(%ebp),%eax
    9310:	8b 48 3c             	mov    0x3c(%eax),%ecx
    9313:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9316:	8b 04 85 a0 fe 00 00 	mov    0xfea0(,%eax,4),%eax
    931d:	0f af c1             	imul   %ecx,%eax
    9320:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    9322:	ba 00 00 00 00       	mov    $0x0,%edx
    9327:	89 45 c8             	mov    %eax,-0x38(%ebp)
    932a:	89 55 cc             	mov    %edx,-0x34(%ebp)
    932d:	df 6d c8             	fildll -0x38(%ebp)
    9330:	de c9                	fmulp  %st,%st(1)
    9332:	dd 5c 24 08          	fstpl  0x8(%esp)
    9336:	dd 05 00 e2 00 00    	fldl   0xe200
    933c:	dd 1c 24             	fstpl  (%esp)
    933f:	e8 d0 be ff ff       	call   5214 <pow>
    9344:	dc 4d c0             	fmull  -0x40(%ebp)
    9347:	8b 45 f4             	mov    -0xc(%ebp),%eax
    934a:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    934d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9350:	89 d0                	mov    %edx,%eax
    9352:	c1 e0 03             	shl    $0x3,%eax
    9355:	01 d0                	add    %edx,%eax
    9357:	c1 e0 03             	shl    $0x3,%eax
    935a:	89 c2                	mov    %eax,%edx
    935c:	8b 45 08             	mov    0x8(%ebp),%eax
    935f:	01 c2                	add    %eax,%edx
    9361:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9364:	8b 04 82             	mov    (%edx,%eax,4),%eax
    9367:	c1 e8 1f             	shr    $0x1f,%eax
    936a:	0f b6 c0             	movzbl %al,%eax
    936d:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    9370:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9373:	89 d0                	mov    %edx,%eax
    9375:	c1 e0 03             	shl    $0x3,%eax
    9378:	01 d0                	add    %edx,%eax
    937a:	c1 e0 04             	shl    $0x4,%eax
    937d:	89 c2                	mov    %eax,%edx
    937f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9382:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9385:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9388:	89 d0                	mov    %edx,%eax
    938a:	c1 e0 03             	shl    $0x3,%eax
    938d:	01 d0                	add    %edx,%eax
    938f:	c1 e0 04             	shl    $0x4,%eax
    9392:	89 c2                	mov    %eax,%edx
    9394:	8b 45 0c             	mov    0xc(%ebp),%eax
    9397:	01 c2                	add    %eax,%edx
    9399:	8b 45 f4             	mov    -0xc(%ebp),%eax
    939c:	dd 04 c2             	fldl   (%edx,%eax,8)
    939f:	dd 5d c0             	fstpl  -0x40(%ebp)
    93a2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    93a5:	89 d0                	mov    %edx,%eax
    93a7:	c1 e0 03             	shl    $0x3,%eax
    93aa:	01 d0                	add    %edx,%eax
    93ac:	c1 e0 03             	shl    $0x3,%eax
    93af:	89 c2                	mov    %eax,%edx
    93b1:	8b 45 08             	mov    0x8(%ebp),%eax
    93b4:	01 c2                	add    %eax,%edx
    93b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93b9:	8b 04 82             	mov    (%edx,%eax,4),%eax
    93bc:	89 04 24             	mov    %eax,(%esp)
    93bf:	e8 47 bd ff ff       	call   510b <abs>
    93c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    93c7:	db 45 d4             	fildl  -0x2c(%ebp)
    93ca:	dd 05 18 e2 00 00    	fldl   0xe218
    93d0:	dd 5c 24 08          	fstpl  0x8(%esp)
    93d4:	dd 1c 24             	fstpl  (%esp)
    93d7:	e8 38 be ff ff       	call   5214 <pow>
    93dc:	dc 4d c0             	fmull  -0x40(%ebp)
    93df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93e2:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    93e5:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    93e9:	74 37                	je     9422 <III_dequantize_sample+0x6d6>
    93eb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    93ee:	89 d0                	mov    %edx,%eax
    93f0:	c1 e0 03             	shl    $0x3,%eax
    93f3:	01 d0                	add    %edx,%eax
    93f5:	c1 e0 04             	shl    $0x4,%eax
    93f8:	89 c2                	mov    %eax,%edx
    93fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    93fd:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9400:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9403:	89 d0                	mov    %edx,%eax
    9405:	c1 e0 03             	shl    $0x3,%eax
    9408:	01 d0                	add    %edx,%eax
    940a:	c1 e0 04             	shl    $0x4,%eax
    940d:	89 c2                	mov    %eax,%edx
    940f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9412:	01 c2                	add    %eax,%edx
    9414:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9417:	dd 04 c2             	fldl   (%edx,%eax,8)
    941a:	d9 e0                	fchs   
    941c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    941f:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    9422:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9426:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    942a:	0f 8e d3 f9 ff ff    	jle    8e03 <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    9430:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9434:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    9438:	0f 8e b9 f9 ff ff    	jle    8df7 <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    943e:	83 c4 50             	add    $0x50,%esp
    9441:	5b                   	pop    %ebx
    9442:	5e                   	pop    %esi
    9443:	5d                   	pop    %ebp
    9444:	c3                   	ret    

00009445 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9445:	55                   	push   %ebp
    9446:	89 e5                	mov    %esp,%ebp
    9448:	57                   	push   %edi
    9449:	56                   	push   %esi
    944a:	53                   	push   %ebx
    944b:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    944e:	8b 45 14             	mov    0x14(%ebp),%eax
    9451:	8b 00                	mov    (%eax),%eax
    9453:	8b 40 10             	mov    0x10(%eax),%eax
    9456:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    9459:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9460:	eb 33                	jmp    9495 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    9462:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9469:	eb 20                	jmp    948b <III_reorder+0x46>
         ro[sb][ss] = 0;
    946b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    946e:	89 d0                	mov    %edx,%eax
    9470:	c1 e0 03             	shl    $0x3,%eax
    9473:	01 d0                	add    %edx,%eax
    9475:	c1 e0 04             	shl    $0x4,%eax
    9478:	89 c2                	mov    %eax,%edx
    947a:	8b 45 0c             	mov    0xc(%ebp),%eax
    947d:	01 c2                	add    %eax,%edx
    947f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9482:	d9 ee                	fldz   
    9484:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    9487:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    948b:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    948f:	7e da                	jle    946b <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    9491:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9495:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    9499:	7e c7                	jle    9462 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    949b:	8b 45 10             	mov    0x10(%ebp),%eax
    949e:	8b 40 10             	mov    0x10(%eax),%eax
    94a1:	85 c0                	test   %eax,%eax
    94a3:	0f 84 af 03 00 00    	je     9858 <III_reorder+0x413>
    94a9:	8b 45 10             	mov    0x10(%ebp),%eax
    94ac:	8b 40 14             	mov    0x14(%eax),%eax
    94af:	83 f8 02             	cmp    $0x2,%eax
    94b2:	0f 85 a0 03 00 00    	jne    9858 <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    94b8:	8b 45 10             	mov    0x10(%ebp),%eax
    94bb:	8b 40 18             	mov    0x18(%eax),%eax
    94be:	85 c0                	test   %eax,%eax
    94c0:	0f 84 00 02 00 00    	je     96c6 <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    94c6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    94cd:	eb 4c                	jmp    951b <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    94cf:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    94d6:	eb 39                	jmp    9511 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    94d8:	8b 55 e0             	mov    -0x20(%ebp),%edx
    94db:	89 d0                	mov    %edx,%eax
    94dd:	c1 e0 03             	shl    $0x3,%eax
    94e0:	01 d0                	add    %edx,%eax
    94e2:	c1 e0 04             	shl    $0x4,%eax
    94e5:	89 c2                	mov    %eax,%edx
    94e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    94ea:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    94ed:	8b 55 e0             	mov    -0x20(%ebp),%edx
    94f0:	89 d0                	mov    %edx,%eax
    94f2:	c1 e0 03             	shl    $0x3,%eax
    94f5:	01 d0                	add    %edx,%eax
    94f7:	c1 e0 04             	shl    $0x4,%eax
    94fa:	89 c2                	mov    %eax,%edx
    94fc:	8b 45 08             	mov    0x8(%ebp),%eax
    94ff:	01 c2                	add    %eax,%edx
    9501:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9504:	dd 04 c2             	fldl   (%edx,%eax,8)
    9507:	8b 45 dc             	mov    -0x24(%ebp),%eax
    950a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    950d:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9511:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9515:	7e c1                	jle    94d8 <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    9517:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    951b:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    951f:	7e ae                	jle    94cf <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9521:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    9528:	8b 45 d0             	mov    -0x30(%ebp),%eax
    952b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9531:	05 3c fd 00 00       	add    $0xfd3c,%eax
    9536:	8b 40 0c             	mov    0xc(%eax),%eax
    9539:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    953c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    953f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9545:	05 40 fd 00 00       	add    $0xfd40,%eax
    954a:	8b 40 0c             	mov    0xc(%eax),%eax
    954d:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9550:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9553:	e9 5f 01 00 00       	jmp    96b7 <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9558:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    955f:	e9 fd 00 00 00       	jmp    9661 <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    9564:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    956b:	e9 e1 00 00 00       	jmp    9651 <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    9570:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9573:	89 d0                	mov    %edx,%eax
    9575:	01 c0                	add    %eax,%eax
    9577:	01 c2                	add    %eax,%edx
    9579:	8b 45 d8             	mov    -0x28(%ebp),%eax
    957c:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    9580:	01 c2                	add    %eax,%edx
    9582:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9585:	01 d0                	add    %edx,%eax
    9587:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    958a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    958d:	89 d0                	mov    %edx,%eax
    958f:	01 c0                	add    %eax,%eax
    9591:	01 c2                	add    %eax,%edx
    9593:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9596:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9599:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    959c:	89 d0                	mov    %edx,%eax
    959e:	01 c0                	add    %eax,%eax
    95a0:	01 d0                	add    %edx,%eax
    95a2:	01 c8                	add    %ecx,%eax
    95a4:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    95a7:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    95aa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    95af:	89 c8                	mov    %ecx,%eax
    95b1:	f7 ea                	imul   %edx
    95b3:	c1 fa 02             	sar    $0x2,%edx
    95b6:	89 c8                	mov    %ecx,%eax
    95b8:	c1 f8 1f             	sar    $0x1f,%eax
    95bb:	29 c2                	sub    %eax,%edx
    95bd:	89 d0                	mov    %edx,%eax
    95bf:	89 c2                	mov    %eax,%edx
    95c1:	89 d0                	mov    %edx,%eax
    95c3:	c1 e0 03             	shl    $0x3,%eax
    95c6:	01 d0                	add    %edx,%eax
    95c8:	c1 e0 04             	shl    $0x4,%eax
    95cb:	89 c2                	mov    %eax,%edx
    95cd:	8b 45 0c             	mov    0xc(%ebp),%eax
    95d0:	8d 34 02             	lea    (%edx,%eax,1),%esi
    95d3:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    95d6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    95db:	89 d8                	mov    %ebx,%eax
    95dd:	f7 ea                	imul   %edx
    95df:	c1 fa 02             	sar    $0x2,%edx
    95e2:	89 d8                	mov    %ebx,%eax
    95e4:	c1 f8 1f             	sar    $0x1f,%eax
    95e7:	89 d1                	mov    %edx,%ecx
    95e9:	29 c1                	sub    %eax,%ecx
    95eb:	89 c8                	mov    %ecx,%eax
    95ed:	c1 e0 03             	shl    $0x3,%eax
    95f0:	01 c8                	add    %ecx,%eax
    95f2:	01 c0                	add    %eax,%eax
    95f4:	29 c3                	sub    %eax,%ebx
    95f6:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    95f8:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    95fb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9600:	89 d8                	mov    %ebx,%eax
    9602:	f7 ea                	imul   %edx
    9604:	c1 fa 02             	sar    $0x2,%edx
    9607:	89 d8                	mov    %ebx,%eax
    9609:	c1 f8 1f             	sar    $0x1f,%eax
    960c:	29 c2                	sub    %eax,%edx
    960e:	89 d0                	mov    %edx,%eax
    9610:	89 c2                	mov    %eax,%edx
    9612:	89 d0                	mov    %edx,%eax
    9614:	c1 e0 03             	shl    $0x3,%eax
    9617:	01 d0                	add    %edx,%eax
    9619:	c1 e0 04             	shl    $0x4,%eax
    961c:	89 c2                	mov    %eax,%edx
    961e:	8b 45 08             	mov    0x8(%ebp),%eax
    9621:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9624:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9627:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    962c:	89 d8                	mov    %ebx,%eax
    962e:	f7 ea                	imul   %edx
    9630:	c1 fa 02             	sar    $0x2,%edx
    9633:	89 d8                	mov    %ebx,%eax
    9635:	c1 f8 1f             	sar    $0x1f,%eax
    9638:	29 c2                	sub    %eax,%edx
    963a:	89 d0                	mov    %edx,%eax
    963c:	c1 e0 03             	shl    $0x3,%eax
    963f:	01 d0                	add    %edx,%eax
    9641:	01 c0                	add    %eax,%eax
    9643:	29 c3                	sub    %eax,%ebx
    9645:	89 da                	mov    %ebx,%edx
    9647:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    964a:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    964d:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9651:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9654:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9657:	0f 8c 13 ff ff ff    	jl     9570 <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    965d:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9661:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9665:	0f 8e f9 fe ff ff    	jle    9564 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    966b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    966f:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9672:	89 d0                	mov    %edx,%eax
    9674:	c1 e0 03             	shl    $0x3,%eax
    9677:	01 d0                	add    %edx,%eax
    9679:	c1 e0 02             	shl    $0x2,%eax
    967c:	01 d0                	add    %edx,%eax
    967e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9681:	01 d0                	add    %edx,%eax
    9683:	83 c0 14             	add    $0x14,%eax
    9686:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
    968d:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9690:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9693:	8d 48 01             	lea    0x1(%eax),%ecx
    9696:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9699:	89 d0                	mov    %edx,%eax
    969b:	c1 e0 03             	shl    $0x3,%eax
    969e:	01 d0                	add    %edx,%eax
    96a0:	c1 e0 02             	shl    $0x2,%eax
    96a3:	01 d0                	add    %edx,%eax
    96a5:	01 c8                	add    %ecx,%eax
    96a7:	83 c0 14             	add    $0x14,%eax
    96aa:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
    96b1:	2b 45 e8             	sub    -0x18(%ebp),%eax
    96b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    96b7:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    96bb:	0f 8e 97 fe ff ff    	jle    9558 <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    96c1:	e9 ed 01 00 00       	jmp    98b3 <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    96c6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    96cd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    96d4:	8b 45 d0             	mov    -0x30(%ebp),%eax
    96d7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    96dd:	05 34 fd 00 00       	add    $0xfd34,%eax
    96e2:	8b 40 0c             	mov    0xc(%eax),%eax
    96e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    96e8:	e9 5f 01 00 00       	jmp    984c <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    96ed:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    96f4:	e9 fd 00 00 00       	jmp    97f6 <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    96f9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    9700:	e9 e1 00 00 00       	jmp    97e6 <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    9705:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9708:	89 d0                	mov    %edx,%eax
    970a:	01 c0                	add    %eax,%eax
    970c:	01 c2                	add    %eax,%edx
    970e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9711:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    9715:	01 c2                	add    %eax,%edx
    9717:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    971a:	01 d0                	add    %edx,%eax
    971c:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    971f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9722:	89 d0                	mov    %edx,%eax
    9724:	01 c0                	add    %eax,%eax
    9726:	01 c2                	add    %eax,%edx
    9728:	8b 45 d8             	mov    -0x28(%ebp),%eax
    972b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    972e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    9731:	89 d0                	mov    %edx,%eax
    9733:	01 c0                	add    %eax,%eax
    9735:	01 d0                	add    %edx,%eax
    9737:	01 c8                	add    %ecx,%eax
    9739:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    973c:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    973f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9744:	89 c8                	mov    %ecx,%eax
    9746:	f7 ea                	imul   %edx
    9748:	c1 fa 02             	sar    $0x2,%edx
    974b:	89 c8                	mov    %ecx,%eax
    974d:	c1 f8 1f             	sar    $0x1f,%eax
    9750:	29 c2                	sub    %eax,%edx
    9752:	89 d0                	mov    %edx,%eax
    9754:	89 c2                	mov    %eax,%edx
    9756:	89 d0                	mov    %edx,%eax
    9758:	c1 e0 03             	shl    $0x3,%eax
    975b:	01 d0                	add    %edx,%eax
    975d:	c1 e0 04             	shl    $0x4,%eax
    9760:	89 c2                	mov    %eax,%edx
    9762:	8b 45 0c             	mov    0xc(%ebp),%eax
    9765:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9768:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    976b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9770:	89 d8                	mov    %ebx,%eax
    9772:	f7 ea                	imul   %edx
    9774:	c1 fa 02             	sar    $0x2,%edx
    9777:	89 d8                	mov    %ebx,%eax
    9779:	c1 f8 1f             	sar    $0x1f,%eax
    977c:	89 d1                	mov    %edx,%ecx
    977e:	29 c1                	sub    %eax,%ecx
    9780:	89 c8                	mov    %ecx,%eax
    9782:	c1 e0 03             	shl    $0x3,%eax
    9785:	01 c8                	add    %ecx,%eax
    9787:	01 c0                	add    %eax,%eax
    9789:	29 c3                	sub    %eax,%ebx
    978b:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    978d:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9790:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9795:	89 d8                	mov    %ebx,%eax
    9797:	f7 ea                	imul   %edx
    9799:	c1 fa 02             	sar    $0x2,%edx
    979c:	89 d8                	mov    %ebx,%eax
    979e:	c1 f8 1f             	sar    $0x1f,%eax
    97a1:	29 c2                	sub    %eax,%edx
    97a3:	89 d0                	mov    %edx,%eax
    97a5:	89 c2                	mov    %eax,%edx
    97a7:	89 d0                	mov    %edx,%eax
    97a9:	c1 e0 03             	shl    $0x3,%eax
    97ac:	01 d0                	add    %edx,%eax
    97ae:	c1 e0 04             	shl    $0x4,%eax
    97b1:	89 c2                	mov    %eax,%edx
    97b3:	8b 45 08             	mov    0x8(%ebp),%eax
    97b6:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    97b9:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    97bc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    97c1:	89 d8                	mov    %ebx,%eax
    97c3:	f7 ea                	imul   %edx
    97c5:	c1 fa 02             	sar    $0x2,%edx
    97c8:	89 d8                	mov    %ebx,%eax
    97ca:	c1 f8 1f             	sar    $0x1f,%eax
    97cd:	29 c2                	sub    %eax,%edx
    97cf:	89 d0                	mov    %edx,%eax
    97d1:	c1 e0 03             	shl    $0x3,%eax
    97d4:	01 d0                	add    %edx,%eax
    97d6:	01 c0                	add    %eax,%eax
    97d8:	29 c3                	sub    %eax,%ebx
    97da:	89 da                	mov    %ebx,%edx
    97dc:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    97df:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    97e2:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    97e6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    97e9:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    97ec:	0f 8c 13 ff ff ff    	jl     9705 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    97f2:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    97f6:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    97fa:	0f 8e f9 fe ff ff    	jle    96f9 <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9800:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9804:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9807:	89 d0                	mov    %edx,%eax
    9809:	c1 e0 03             	shl    $0x3,%eax
    980c:	01 d0                	add    %edx,%eax
    980e:	c1 e0 02             	shl    $0x2,%eax
    9811:	01 d0                	add    %edx,%eax
    9813:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9816:	01 d0                	add    %edx,%eax
    9818:	83 c0 14             	add    $0x14,%eax
    981b:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
    9822:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9825:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9828:	8d 48 01             	lea    0x1(%eax),%ecx
    982b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    982e:	89 d0                	mov    %edx,%eax
    9830:	c1 e0 03             	shl    $0x3,%eax
    9833:	01 d0                	add    %edx,%eax
    9835:	c1 e0 02             	shl    $0x2,%eax
    9838:	01 d0                	add    %edx,%eax
    983a:	01 c8                	add    %ecx,%eax
    983c:	83 c0 14             	add    $0x14,%eax
    983f:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
    9846:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9849:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    984c:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9850:	0f 8e 97 fe ff ff    	jle    96ed <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9856:	eb 5b                	jmp    98b3 <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9858:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    985f:	eb 4c                	jmp    98ad <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9861:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9868:	eb 39                	jmp    98a3 <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    986a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    986d:	89 d0                	mov    %edx,%eax
    986f:	c1 e0 03             	shl    $0x3,%eax
    9872:	01 d0                	add    %edx,%eax
    9874:	c1 e0 04             	shl    $0x4,%eax
    9877:	89 c2                	mov    %eax,%edx
    9879:	8b 45 0c             	mov    0xc(%ebp),%eax
    987c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    987f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9882:	89 d0                	mov    %edx,%eax
    9884:	c1 e0 03             	shl    $0x3,%eax
    9887:	01 d0                	add    %edx,%eax
    9889:	c1 e0 04             	shl    $0x4,%eax
    988c:	89 c2                	mov    %eax,%edx
    988e:	8b 45 08             	mov    0x8(%ebp),%eax
    9891:	01 c2                	add    %eax,%edx
    9893:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9896:	dd 04 c2             	fldl   (%edx,%eax,8)
    9899:	8b 45 dc             	mov    -0x24(%ebp),%eax
    989c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    989f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    98a3:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    98a7:	7e c1                	jle    986a <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    98a9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    98ad:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    98b1:	7e ae                	jle    9861 <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    98b3:	83 c4 34             	add    $0x34,%esp
    98b6:	5b                   	pop    %ebx
    98b7:	5e                   	pop    %esi
    98b8:	5f                   	pop    %edi
    98b9:	5d                   	pop    %ebp
    98ba:	c3                   	ret    

000098bb <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    98bb:	55                   	push   %ebp
    98bc:	89 e5                	mov    %esp,%ebp
    98be:	56                   	push   %esi
    98bf:	53                   	push   %ebx
    98c0:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    98c6:	8b 45 18             	mov    0x18(%ebp),%eax
    98c9:	8b 00                	mov    (%eax),%eax
    98cb:	8b 40 10             	mov    0x10(%eax),%eax
    98ce:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    98d1:	8b 45 18             	mov    0x18(%ebp),%eax
    98d4:	8b 40 08             	mov    0x8(%eax),%eax
    98d7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    98da:	8b 45 18             	mov    0x18(%ebp),%eax
    98dd:	8b 00                	mov    (%eax),%eax
    98df:	8b 40 1c             	mov    0x1c(%eax),%eax
    98e2:	83 f8 01             	cmp    $0x1,%eax
    98e5:	75 16                	jne    98fd <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    98e7:	8b 45 18             	mov    0x18(%ebp),%eax
    98ea:	8b 00                	mov    (%eax),%eax
    98ec:	8b 40 20             	mov    0x20(%eax),%eax
    98ef:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    98f2:	85 c0                	test   %eax,%eax
    98f4:	74 07                	je     98fd <III_stereo+0x42>
    98f6:	b8 01 00 00 00       	mov    $0x1,%eax
    98fb:	eb 05                	jmp    9902 <III_stereo+0x47>
    98fd:	b8 00 00 00 00       	mov    $0x0,%eax
    9902:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9905:	8b 45 18             	mov    0x18(%ebp),%eax
    9908:	8b 00                	mov    (%eax),%eax
    990a:	8b 40 1c             	mov    0x1c(%eax),%eax
    990d:	83 f8 01             	cmp    $0x1,%eax
    9910:	75 16                	jne    9928 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    9912:	8b 45 18             	mov    0x18(%ebp),%eax
    9915:	8b 00                	mov    (%eax),%eax
    9917:	8b 40 20             	mov    0x20(%eax),%eax
    991a:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    991d:	85 c0                	test   %eax,%eax
    991f:	74 07                	je     9928 <III_stereo+0x6d>
    9921:	b8 01 00 00 00       	mov    $0x1,%eax
    9926:	eb 05                	jmp    992d <III_stereo+0x72>
    9928:	b8 00 00 00 00       	mov    $0x0,%eax
    992d:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9930:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9937:	eb 12                	jmp    994b <III_stereo+0x90>
      is_pos[i] = 7;
    9939:	8b 45 f0             	mov    -0x10(%ebp),%eax
    993c:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    9943:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9947:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    994b:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    9952:	7e e5                	jle    9939 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    9954:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9958:	0f 85 18 0a 00 00    	jne    a376 <III_stereo+0xabb>
    995e:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9962:	0f 84 0e 0a 00 00    	je     a376 <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    9968:	8b 45 14             	mov    0x14(%ebp),%eax
    996b:	8b 40 10             	mov    0x10(%eax),%eax
    996e:	85 c0                	test   %eax,%eax
    9970:	0f 84 10 08 00 00    	je     a186 <III_stereo+0x8cb>
    9976:	8b 45 14             	mov    0x14(%ebp),%eax
    9979:	8b 40 14             	mov    0x14(%eax),%eax
    997c:	83 f8 02             	cmp    $0x2,%eax
    997f:	0f 85 01 08 00 00    	jne    a186 <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    9985:	8b 45 14             	mov    0x14(%ebp),%eax
    9988:	8b 40 18             	mov    0x18(%eax),%eax
    998b:	85 c0                	test   %eax,%eax
    998d:	0f 84 d0 04 00 00    	je     9e63 <III_stereo+0x5a8>
         {  int max_sfb = 0;
    9993:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    999a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    99a1:	e9 1b 03 00 00       	jmp    9cc1 <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    99a6:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    99ad:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    99b4:	e9 0f 01 00 00       	jmp    9ac8 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    99b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99bc:	8d 48 01             	lea    0x1(%eax),%ecx
    99bf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    99c2:	89 d0                	mov    %edx,%eax
    99c4:	c1 e0 03             	shl    $0x3,%eax
    99c7:	01 d0                	add    %edx,%eax
    99c9:	c1 e0 02             	shl    $0x2,%eax
    99cc:	01 d0                	add    %edx,%eax
    99ce:	01 c8                	add    %ecx,%eax
    99d0:	83 c0 14             	add    $0x14,%eax
    99d3:	8b 0c 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%ecx
    99da:	8b 55 c8             	mov    -0x38(%ebp),%edx
    99dd:	89 d0                	mov    %edx,%eax
    99df:	c1 e0 03             	shl    $0x3,%eax
    99e2:	01 d0                	add    %edx,%eax
    99e4:	c1 e0 02             	shl    $0x2,%eax
    99e7:	01 d0                	add    %edx,%eax
    99e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    99ec:	01 d0                	add    %edx,%eax
    99ee:	83 c0 14             	add    $0x14,%eax
    99f1:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
    99f8:	29 c1                	sub    %eax,%ecx
    99fa:	89 c8                	mov    %ecx,%eax
    99fc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    99ff:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9a02:	89 d0                	mov    %edx,%eax
    9a04:	c1 e0 03             	shl    $0x3,%eax
    9a07:	01 d0                	add    %edx,%eax
    9a09:	c1 e0 02             	shl    $0x2,%eax
    9a0c:	01 d0                	add    %edx,%eax
    9a0e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9a11:	01 d0                	add    %edx,%eax
    9a13:	83 c0 14             	add    $0x14,%eax
    9a16:	8b 14 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%edx
    9a1d:	89 d0                	mov    %edx,%eax
    9a1f:	01 c0                	add    %eax,%eax
    9a21:	01 c2                	add    %eax,%edx
    9a23:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9a26:	83 c0 01             	add    $0x1,%eax
    9a29:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    9a2d:	01 d0                	add    %edx,%eax
    9a2f:	83 e8 01             	sub    $0x1,%eax
    9a32:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9a35:	e9 80 00 00 00       	jmp    9aba <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9a3a:	8b 45 08             	mov    0x8(%ebp),%eax
    9a3d:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9a43:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9a46:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a4b:	89 c8                	mov    %ecx,%eax
    9a4d:	f7 ea                	imul   %edx
    9a4f:	c1 fa 02             	sar    $0x2,%edx
    9a52:	89 c8                	mov    %ecx,%eax
    9a54:	c1 f8 1f             	sar    $0x1f,%eax
    9a57:	89 d3                	mov    %edx,%ebx
    9a59:	29 c3                	sub    %eax,%ebx
    9a5b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9a5e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a63:	89 c8                	mov    %ecx,%eax
    9a65:	f7 ea                	imul   %edx
    9a67:	c1 fa 02             	sar    $0x2,%edx
    9a6a:	89 c8                	mov    %ecx,%eax
    9a6c:	c1 f8 1f             	sar    $0x1f,%eax
    9a6f:	29 c2                	sub    %eax,%edx
    9a71:	89 d0                	mov    %edx,%eax
    9a73:	c1 e0 03             	shl    $0x3,%eax
    9a76:	01 d0                	add    %edx,%eax
    9a78:	01 c0                	add    %eax,%eax
    9a7a:	29 c1                	sub    %eax,%ecx
    9a7c:	89 ca                	mov    %ecx,%edx
    9a7e:	89 d8                	mov    %ebx,%eax
    9a80:	c1 e0 03             	shl    $0x3,%eax
    9a83:	01 d8                	add    %ebx,%eax
    9a85:	01 c0                	add    %eax,%eax
    9a87:	01 d0                	add    %edx,%eax
    9a89:	dd 04 c6             	fldl   (%esi,%eax,8)
    9a8c:	d9 ee                	fldz   
    9a8e:	df e9                	fucomip %st(1),%st
    9a90:	7a 0a                	jp     9a9c <III_stereo+0x1e1>
    9a92:	d9 ee                	fldz   
    9a94:	df e9                	fucomip %st(1),%st
    9a96:	dd d8                	fstp   %st(0)
    9a98:	74 18                	je     9ab2 <III_stereo+0x1f7>
    9a9a:	eb 02                	jmp    9a9e <III_stereo+0x1e3>
    9a9c:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    9a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9aa1:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    9aa4:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9aab:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    9ab2:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    9ab6:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    9aba:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    9abe:	0f 8f 76 ff ff ff    	jg     9a3a <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    9ac4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    9ac8:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    9acc:	0f 8f e7 fe ff ff    	jg     99b9 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    9ad2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9ad5:	83 c0 01             	add    $0x1,%eax
    9ad8:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    9adb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ade:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9ae1:	7e 0b                	jle    9aee <III_stereo+0x233>
                  max_sfb = sfb;
    9ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ae6:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    9ae9:	e9 f5 00 00 00       	jmp    9be3 <III_stereo+0x328>
    9aee:	e9 f0 00 00 00       	jmp    9be3 <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9af3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9af6:	8d 48 01             	lea    0x1(%eax),%ecx
    9af9:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9afc:	89 d0                	mov    %edx,%eax
    9afe:	c1 e0 03             	shl    $0x3,%eax
    9b01:	01 d0                	add    %edx,%eax
    9b03:	c1 e0 02             	shl    $0x2,%eax
    9b06:	01 d0                	add    %edx,%eax
    9b08:	01 c8                	add    %ecx,%eax
    9b0a:	83 c0 14             	add    $0x14,%eax
    9b0d:	8b 0c 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%ecx
    9b14:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9b17:	89 d0                	mov    %edx,%eax
    9b19:	c1 e0 03             	shl    $0x3,%eax
    9b1c:	01 d0                	add    %edx,%eax
    9b1e:	c1 e0 02             	shl    $0x2,%eax
    9b21:	01 d0                	add    %edx,%eax
    9b23:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9b26:	01 d0                	add    %edx,%eax
    9b28:	83 c0 14             	add    $0x14,%eax
    9b2b:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
    9b32:	29 c1                	sub    %eax,%ecx
    9b34:	89 c8                	mov    %ecx,%eax
    9b36:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9b39:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9b3c:	89 d0                	mov    %edx,%eax
    9b3e:	c1 e0 03             	shl    $0x3,%eax
    9b41:	01 d0                	add    %edx,%eax
    9b43:	c1 e0 02             	shl    $0x2,%eax
    9b46:	01 d0                	add    %edx,%eax
    9b48:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9b4b:	01 d0                	add    %edx,%eax
    9b4d:	83 c0 14             	add    $0x14,%eax
    9b50:	8b 14 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%edx
    9b57:	89 d0                	mov    %edx,%eax
    9b59:	01 c0                	add    %eax,%eax
    9b5b:	01 c2                	add    %eax,%edx
    9b5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9b60:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9b64:	01 d0                	add    %edx,%eax
    9b66:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9b69:	eb 6e                	jmp    9bd9 <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9b6b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9b6e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9b71:	89 d0                	mov    %edx,%eax
    9b73:	01 c0                	add    %eax,%eax
    9b75:	01 d0                	add    %edx,%eax
    9b77:	c1 e0 02             	shl    $0x2,%eax
    9b7a:	01 d0                	add    %edx,%eax
    9b7c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9b7f:	01 d0                	add    %edx,%eax
    9b81:	83 c0 52             	add    $0x52,%eax
    9b84:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    9b88:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9b8b:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    9b92:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9b95:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9b9c:	83 f8 07             	cmp    $0x7,%eax
    9b9f:	74 30                	je     9bd1 <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9ba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ba4:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9bab:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9bb1:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9bb7:	dd 05 20 e2 00 00    	fldl   0xe220
    9bbd:	de c9                	fmulp  %st,%st(1)
    9bbf:	dd 1c 24             	fstpl  (%esp)
    9bc2:	e8 1d b6 ff ff       	call   51e4 <tan>
    9bc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9bca:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    9bd1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    9bd5:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9bd9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9bdd:	7f 8c                	jg     9b6b <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    9bdf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    9be3:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9be7:	0f 8e 06 ff ff ff    	jle    9af3 <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    9bed:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9bf0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9bf6:	05 5c fd 00 00       	add    $0xfd5c,%eax
    9bfb:	8b 50 0c             	mov    0xc(%eax),%edx
    9bfe:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9c01:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c07:	05 58 fd 00 00       	add    $0xfd58,%eax
    9c0c:	8b 40 0c             	mov    0xc(%eax),%eax
    9c0f:	29 c2                	sub    %eax,%edx
    9c11:	89 d0                	mov    %edx,%eax
    9c13:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9c16:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9c19:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c1f:	05 58 fd 00 00       	add    $0xfd58,%eax
    9c24:	8b 50 0c             	mov    0xc(%eax),%edx
    9c27:	89 d0                	mov    %edx,%eax
    9c29:	01 c0                	add    %eax,%eax
    9c2b:	01 c2                	add    %eax,%edx
    9c2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9c30:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9c34:	01 d0                	add    %edx,%eax
    9c36:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9c39:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9c3c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c42:	05 60 fd 00 00       	add    $0xfd60,%eax
    9c47:	8b 50 0c             	mov    0xc(%eax),%edx
    9c4a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9c4d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c53:	05 5c fd 00 00       	add    $0xfd5c,%eax
    9c58:	8b 40 0c             	mov    0xc(%eax),%eax
    9c5b:	29 c2                	sub    %eax,%edx
    9c5d:	89 d0                	mov    %edx,%eax
    9c5f:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9c62:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9c65:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c6b:	05 5c fd 00 00       	add    $0xfd5c,%eax
    9c70:	8b 50 0c             	mov    0xc(%eax),%edx
    9c73:	89 d0                	mov    %edx,%eax
    9c75:	01 c0                	add    %eax,%eax
    9c77:	01 c2                	add    %eax,%edx
    9c79:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9c7c:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9c80:	01 d0                	add    %edx,%eax
    9c82:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    9c85:	eb 30                	jmp    9cb7 <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    9c87:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c8a:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9c91:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c94:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    9c9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c9e:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9ca5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ca8:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    9caf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    9cb3:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9cb7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9cbb:	7f ca                	jg     9c87 <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    9cbd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9cc1:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9cc5:	0f 8e db fc ff ff    	jle    99a6 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    9ccb:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    9ccf:	0f 8f 89 01 00 00    	jg     9e5e <III_stereo+0x5a3>
             {  i = 2;
    9cd5:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    9cdc:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    9ce3:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    9cea:	eb 63                	jmp    9d4f <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    9cec:	8b 45 08             	mov    0x8(%ebp),%eax
    9cef:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9cf5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9cf8:	89 d0                	mov    %edx,%eax
    9cfa:	c1 e0 03             	shl    $0x3,%eax
    9cfd:	01 d0                	add    %edx,%eax
    9cff:	01 c0                	add    %eax,%eax
    9d01:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9d04:	01 d0                	add    %edx,%eax
    9d06:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9d09:	d9 ee                	fldz   
    9d0b:	df e9                	fucomip %st(1),%st
    9d0d:	7a 0a                	jp     9d19 <III_stereo+0x45e>
    9d0f:	d9 ee                	fldz   
    9d11:	df e9                	fucomip %st(1),%st
    9d13:	dd d8                	fstp   %st(0)
    9d15:	74 23                	je     9d3a <III_stereo+0x47f>
    9d17:	eb 02                	jmp    9d1b <III_stereo+0x460>
    9d19:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    9d1b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9d1e:	89 d0                	mov    %edx,%eax
    9d20:	c1 e0 03             	shl    $0x3,%eax
    9d23:	01 d0                	add    %edx,%eax
    9d25:	01 c0                	add    %eax,%eax
    9d27:	89 c2                	mov    %eax,%edx
    9d29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9d2c:	01 d0                	add    %edx,%eax
    9d2e:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    9d31:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9d38:	eb 15                	jmp    9d4f <III_stereo+0x494>
                   } else
                   {  ss--;
    9d3a:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    9d3e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9d42:	79 0b                	jns    9d4f <III_stereo+0x494>
                      {  i--;
    9d44:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    9d48:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    9d4f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9d53:	79 97                	jns    9cec <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    9d55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    9d5c:	eb 04                	jmp    9d62 <III_stereo+0x4a7>
                   i++;
    9d5e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    9d62:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9d65:	89 d0                	mov    %edx,%eax
    9d67:	c1 e0 03             	shl    $0x3,%eax
    9d6a:	01 d0                	add    %edx,%eax
    9d6c:	c1 e0 02             	shl    $0x2,%eax
    9d6f:	01 d0                	add    %edx,%eax
    9d71:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9d74:	01 d0                	add    %edx,%eax
    9d76:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    9d7d:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9d80:	7e dc                	jle    9d5e <III_stereo+0x4a3>
                   i++;
                sfb = i;
    9d82:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d85:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    9d88:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9d8b:	89 d0                	mov    %edx,%eax
    9d8d:	c1 e0 03             	shl    $0x3,%eax
    9d90:	01 d0                	add    %edx,%eax
    9d92:	c1 e0 02             	shl    $0x2,%eax
    9d95:	01 d0                	add    %edx,%eax
    9d97:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9d9a:	01 d0                	add    %edx,%eax
    9d9c:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    9da3:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    9da6:	e9 a9 00 00 00       	jmp    9e54 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    9dab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9dae:	8d 48 01             	lea    0x1(%eax),%ecx
    9db1:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9db4:	89 d0                	mov    %edx,%eax
    9db6:	c1 e0 03             	shl    $0x3,%eax
    9db9:	01 d0                	add    %edx,%eax
    9dbb:	c1 e0 02             	shl    $0x2,%eax
    9dbe:	01 d0                	add    %edx,%eax
    9dc0:	01 c8                	add    %ecx,%eax
    9dc2:	8b 0c 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%ecx
    9dc9:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9dcc:	89 d0                	mov    %edx,%eax
    9dce:	c1 e0 03             	shl    $0x3,%eax
    9dd1:	01 d0                	add    %edx,%eax
    9dd3:	c1 e0 02             	shl    $0x2,%eax
    9dd6:	01 d0                	add    %edx,%eax
    9dd8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9ddb:	01 d0                	add    %edx,%eax
    9ddd:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    9de4:	29 c1                	sub    %eax,%ecx
    9de6:	89 c8                	mov    %ecx,%eax
    9de8:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    9deb:	eb 5d                	jmp    9e4a <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    9ded:	8b 45 10             	mov    0x10(%ebp),%eax
    9df0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9df3:	83 c2 3e             	add    $0x3e,%edx
    9df6:	8b 14 90             	mov    (%eax,%edx,4),%edx
    9df9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9dfc:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    9e03:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e06:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9e0d:	83 f8 07             	cmp    $0x7,%eax
    9e10:	74 30                	je     9e42 <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9e12:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e15:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9e1c:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9e22:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9e28:	dd 05 20 e2 00 00    	fldl   0xe220
    9e2e:	de c9                	fmulp  %st,%st(1)
    9e30:	dd 1c 24             	fstpl  (%esp)
    9e33:	e8 ac b3 ff ff       	call   51e4 <tan>
    9e38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e3b:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    9e42:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    9e46:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9e4a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9e4e:	7f 9d                	jg     9ded <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    9e50:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9e54:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    9e58:	0f 8e 4d ff ff ff    	jle    9dab <III_stereo+0x4f0>
    9e5e:	e9 1e 03 00 00       	jmp    a181 <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    9e63:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9e6a:	e9 08 03 00 00       	jmp    a177 <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    9e6f:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    9e76:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9e7d:	e9 0f 01 00 00       	jmp    9f91 <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9e82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e85:	8d 48 01             	lea    0x1(%eax),%ecx
    9e88:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9e8b:	89 d0                	mov    %edx,%eax
    9e8d:	c1 e0 03             	shl    $0x3,%eax
    9e90:	01 d0                	add    %edx,%eax
    9e92:	c1 e0 02             	shl    $0x2,%eax
    9e95:	01 d0                	add    %edx,%eax
    9e97:	01 c8                	add    %ecx,%eax
    9e99:	83 c0 14             	add    $0x14,%eax
    9e9c:	8b 0c 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%ecx
    9ea3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9ea6:	89 d0                	mov    %edx,%eax
    9ea8:	c1 e0 03             	shl    $0x3,%eax
    9eab:	01 d0                	add    %edx,%eax
    9ead:	c1 e0 02             	shl    $0x2,%eax
    9eb0:	01 d0                	add    %edx,%eax
    9eb2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9eb5:	01 d0                	add    %edx,%eax
    9eb7:	83 c0 14             	add    $0x14,%eax
    9eba:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
    9ec1:	29 c1                	sub    %eax,%ecx
    9ec3:	89 c8                	mov    %ecx,%eax
    9ec5:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9ec8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9ecb:	89 d0                	mov    %edx,%eax
    9ecd:	c1 e0 03             	shl    $0x3,%eax
    9ed0:	01 d0                	add    %edx,%eax
    9ed2:	c1 e0 02             	shl    $0x2,%eax
    9ed5:	01 d0                	add    %edx,%eax
    9ed7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9eda:	01 d0                	add    %edx,%eax
    9edc:	83 c0 14             	add    $0x14,%eax
    9edf:	8b 14 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%edx
    9ee6:	89 d0                	mov    %edx,%eax
    9ee8:	01 c0                	add    %eax,%eax
    9eea:	01 c2                	add    %eax,%edx
    9eec:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9eef:	83 c0 01             	add    $0x1,%eax
    9ef2:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    9ef6:	01 d0                	add    %edx,%eax
    9ef8:	83 e8 01             	sub    $0x1,%eax
    9efb:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9efe:	e9 80 00 00 00       	jmp    9f83 <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9f03:	8b 45 08             	mov    0x8(%ebp),%eax
    9f06:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9f0c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9f0f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9f14:	89 c8                	mov    %ecx,%eax
    9f16:	f7 ea                	imul   %edx
    9f18:	c1 fa 02             	sar    $0x2,%edx
    9f1b:	89 c8                	mov    %ecx,%eax
    9f1d:	c1 f8 1f             	sar    $0x1f,%eax
    9f20:	89 d3                	mov    %edx,%ebx
    9f22:	29 c3                	sub    %eax,%ebx
    9f24:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9f27:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9f2c:	89 c8                	mov    %ecx,%eax
    9f2e:	f7 ea                	imul   %edx
    9f30:	c1 fa 02             	sar    $0x2,%edx
    9f33:	89 c8                	mov    %ecx,%eax
    9f35:	c1 f8 1f             	sar    $0x1f,%eax
    9f38:	29 c2                	sub    %eax,%edx
    9f3a:	89 d0                	mov    %edx,%eax
    9f3c:	c1 e0 03             	shl    $0x3,%eax
    9f3f:	01 d0                	add    %edx,%eax
    9f41:	01 c0                	add    %eax,%eax
    9f43:	29 c1                	sub    %eax,%ecx
    9f45:	89 ca                	mov    %ecx,%edx
    9f47:	89 d8                	mov    %ebx,%eax
    9f49:	c1 e0 03             	shl    $0x3,%eax
    9f4c:	01 d8                	add    %ebx,%eax
    9f4e:	01 c0                	add    %eax,%eax
    9f50:	01 d0                	add    %edx,%eax
    9f52:	dd 04 c6             	fldl   (%esi,%eax,8)
    9f55:	d9 ee                	fldz   
    9f57:	df e9                	fucomip %st(1),%st
    9f59:	7a 0a                	jp     9f65 <III_stereo+0x6aa>
    9f5b:	d9 ee                	fldz   
    9f5d:	df e9                	fucomip %st(1),%st
    9f5f:	dd d8                	fstp   %st(0)
    9f61:	74 18                	je     9f7b <III_stereo+0x6c0>
    9f63:	eb 02                	jmp    9f67 <III_stereo+0x6ac>
    9f65:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    9f67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f6a:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    9f6d:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9f74:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    9f7b:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    9f7f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    9f83:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    9f87:	0f 8f 76 ff ff ff    	jg     9f03 <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    9f8d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    9f91:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    9f95:	0f 89 e7 fe ff ff    	jns    9e82 <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    9f9b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9f9e:	83 c0 01             	add    $0x1,%eax
    9fa1:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    9fa4:	e9 f0 00 00 00       	jmp    a099 <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9fa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fac:	8d 48 01             	lea    0x1(%eax),%ecx
    9faf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9fb2:	89 d0                	mov    %edx,%eax
    9fb4:	c1 e0 03             	shl    $0x3,%eax
    9fb7:	01 d0                	add    %edx,%eax
    9fb9:	c1 e0 02             	shl    $0x2,%eax
    9fbc:	01 d0                	add    %edx,%eax
    9fbe:	01 c8                	add    %ecx,%eax
    9fc0:	83 c0 14             	add    $0x14,%eax
    9fc3:	8b 0c 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%ecx
    9fca:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9fcd:	89 d0                	mov    %edx,%eax
    9fcf:	c1 e0 03             	shl    $0x3,%eax
    9fd2:	01 d0                	add    %edx,%eax
    9fd4:	c1 e0 02             	shl    $0x2,%eax
    9fd7:	01 d0                	add    %edx,%eax
    9fd9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9fdc:	01 d0                	add    %edx,%eax
    9fde:	83 c0 14             	add    $0x14,%eax
    9fe1:	8b 04 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%eax
    9fe8:	29 c1                	sub    %eax,%ecx
    9fea:	89 c8                	mov    %ecx,%eax
    9fec:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9fef:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9ff2:	89 d0                	mov    %edx,%eax
    9ff4:	c1 e0 03             	shl    $0x3,%eax
    9ff7:	01 d0                	add    %edx,%eax
    9ff9:	c1 e0 02             	shl    $0x2,%eax
    9ffc:	01 d0                	add    %edx,%eax
    9ffe:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a001:	01 d0                	add    %edx,%eax
    a003:	83 c0 14             	add    $0x14,%eax
    a006:	8b 14 85 ec fc 00 00 	mov    0xfcec(,%eax,4),%edx
    a00d:	89 d0                	mov    %edx,%eax
    a00f:	01 c0                	add    %eax,%eax
    a011:	01 c2                	add    %eax,%edx
    a013:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a016:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a01a:	01 d0                	add    %edx,%eax
    a01c:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    a01f:	eb 6e                	jmp    a08f <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    a021:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a024:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a027:	89 d0                	mov    %edx,%eax
    a029:	01 c0                	add    %eax,%eax
    a02b:	01 d0                	add    %edx,%eax
    a02d:	c1 e0 02             	shl    $0x2,%eax
    a030:	01 d0                	add    %edx,%eax
    a032:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a035:	01 d0                	add    %edx,%eax
    a037:	83 c0 52             	add    $0x52,%eax
    a03a:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    a03e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a041:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    a048:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a04b:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a052:	83 f8 07             	cmp    $0x7,%eax
    a055:	74 30                	je     a087 <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a057:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a05a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a061:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a067:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a06d:	dd 05 20 e2 00 00    	fldl   0xe220
    a073:	de c9                	fmulp  %st,%st(1)
    a075:	dd 1c 24             	fstpl  (%esp)
    a078:	e8 67 b1 ff ff       	call   51e4 <tan>
    a07d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a080:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    a087:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    a08b:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a08f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a093:	7f 8c                	jg     a021 <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    a095:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    a099:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a09d:	0f 8e 06 ff ff ff    	jle    9fa9 <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    a0a3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a0a6:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a0ac:	05 5c fd 00 00       	add    $0xfd5c,%eax
    a0b1:	8b 50 0c             	mov    0xc(%eax),%edx
    a0b4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a0b7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a0bd:	05 58 fd 00 00       	add    $0xfd58,%eax
    a0c2:	8b 40 0c             	mov    0xc(%eax),%eax
    a0c5:	29 c2                	sub    %eax,%edx
    a0c7:	89 d0                	mov    %edx,%eax
    a0c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    a0cc:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a0cf:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a0d5:	05 58 fd 00 00       	add    $0xfd58,%eax
    a0da:	8b 50 0c             	mov    0xc(%eax),%edx
    a0dd:	89 d0                	mov    %edx,%eax
    a0df:	01 c0                	add    %eax,%eax
    a0e1:	01 c2                	add    %eax,%edx
    a0e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a0e6:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a0ea:	01 d0                	add    %edx,%eax
    a0ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    a0ef:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a0f2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a0f8:	05 60 fd 00 00       	add    $0xfd60,%eax
    a0fd:	8b 50 0c             	mov    0xc(%eax),%edx
    a100:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a103:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a109:	05 5c fd 00 00       	add    $0xfd5c,%eax
    a10e:	8b 40 0c             	mov    0xc(%eax),%eax
    a111:	29 c2                	sub    %eax,%edx
    a113:	89 d0                	mov    %edx,%eax
    a115:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    a118:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a11b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a121:	05 5c fd 00 00       	add    $0xfd5c,%eax
    a126:	8b 50 0c             	mov    0xc(%eax),%edx
    a129:	89 d0                	mov    %edx,%eax
    a12b:	01 c0                	add    %eax,%eax
    a12d:	01 c2                	add    %eax,%edx
    a12f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a132:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a136:	01 d0                	add    %edx,%eax
    a138:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    a13b:	eb 30                	jmp    a16d <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    a13d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a140:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a147:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a14a:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    a151:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a154:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a15b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a15e:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    a165:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    a169:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a16d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a171:	7f ca                	jg     a13d <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    a173:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a177:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    a17b:	0f 8e ee fc ff ff    	jle    9e6f <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    a181:	e9 f0 01 00 00       	jmp    a376 <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    a186:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    a18d:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    a194:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    a19b:	eb 63                	jmp    a200 <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    a19d:	8b 45 08             	mov    0x8(%ebp),%eax
    a1a0:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a1a6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a1a9:	89 d0                	mov    %edx,%eax
    a1ab:	c1 e0 03             	shl    $0x3,%eax
    a1ae:	01 d0                	add    %edx,%eax
    a1b0:	01 c0                	add    %eax,%eax
    a1b2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a1b5:	01 d0                	add    %edx,%eax
    a1b7:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a1ba:	d9 ee                	fldz   
    a1bc:	df e9                	fucomip %st(1),%st
    a1be:	7a 0a                	jp     a1ca <III_stereo+0x90f>
    a1c0:	d9 ee                	fldz   
    a1c2:	df e9                	fucomip %st(1),%st
    a1c4:	dd d8                	fstp   %st(0)
    a1c6:	74 23                	je     a1eb <III_stereo+0x930>
    a1c8:	eb 02                	jmp    a1cc <III_stereo+0x911>
    a1ca:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    a1cc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a1cf:	89 d0                	mov    %edx,%eax
    a1d1:	c1 e0 03             	shl    $0x3,%eax
    a1d4:	01 d0                	add    %edx,%eax
    a1d6:	01 c0                	add    %eax,%eax
    a1d8:	89 c2                	mov    %eax,%edx
    a1da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a1dd:	01 d0                	add    %edx,%eax
    a1df:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    a1e2:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    a1e9:	eb 15                	jmp    a200 <III_stereo+0x945>
            } else
            {  ss--;
    a1eb:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    a1ef:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    a1f3:	79 0b                	jns    a200 <III_stereo+0x945>
               {  i--;
    a1f5:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    a1f9:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    a200:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    a204:	79 97                	jns    a19d <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    a206:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a20d:	eb 04                	jmp    a213 <III_stereo+0x958>
            i++;
    a20f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a213:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a216:	89 d0                	mov    %edx,%eax
    a218:	c1 e0 03             	shl    $0x3,%eax
    a21b:	01 d0                	add    %edx,%eax
    a21d:	c1 e0 02             	shl    $0x2,%eax
    a220:	01 d0                	add    %edx,%eax
    a222:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a225:	01 d0                	add    %edx,%eax
    a227:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    a22e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    a231:	7e dc                	jle    a20f <III_stereo+0x954>
            i++;
         sfb = i;
    a233:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a236:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    a239:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a23c:	89 d0                	mov    %edx,%eax
    a23e:	c1 e0 03             	shl    $0x3,%eax
    a241:	01 d0                	add    %edx,%eax
    a243:	c1 e0 02             	shl    $0x2,%eax
    a246:	01 d0                	add    %edx,%eax
    a248:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a24b:	01 d0                	add    %edx,%eax
    a24d:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    a254:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    a257:	e9 a9 00 00 00       	jmp    a305 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    a25c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a25f:	8d 48 01             	lea    0x1(%eax),%ecx
    a262:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a265:	89 d0                	mov    %edx,%eax
    a267:	c1 e0 03             	shl    $0x3,%eax
    a26a:	01 d0                	add    %edx,%eax
    a26c:	c1 e0 02             	shl    $0x2,%eax
    a26f:	01 d0                	add    %edx,%eax
    a271:	01 c8                	add    %ecx,%eax
    a273:	8b 0c 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%ecx
    a27a:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a27d:	89 d0                	mov    %edx,%eax
    a27f:	c1 e0 03             	shl    $0x3,%eax
    a282:	01 d0                	add    %edx,%eax
    a284:	c1 e0 02             	shl    $0x2,%eax
    a287:	01 d0                	add    %edx,%eax
    a289:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a28c:	01 d0                	add    %edx,%eax
    a28e:	8b 04 85 e0 fc 00 00 	mov    0xfce0(,%eax,4),%eax
    a295:	29 c1                	sub    %eax,%ecx
    a297:	89 c8                	mov    %ecx,%eax
    a299:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    a29c:	eb 5d                	jmp    a2fb <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    a29e:	8b 45 10             	mov    0x10(%ebp),%eax
    a2a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a2a4:	83 c2 3e             	add    $0x3e,%edx
    a2a7:	8b 14 90             	mov    (%eax,%edx,4),%edx
    a2aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2ad:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    a2b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2b7:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a2be:	83 f8 07             	cmp    $0x7,%eax
    a2c1:	74 30                	je     a2f3 <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a2c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2c6:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a2cd:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a2d3:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a2d9:	dd 05 20 e2 00 00    	fldl   0xe220
    a2df:	de c9                	fmulp  %st,%st(1)
    a2e1:	dd 1c 24             	fstpl  (%esp)
    a2e4:	e8 fb ae ff ff       	call   51e4 <tan>
    a2e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2ec:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    a2f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    a2f7:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a2fb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a2ff:	7f 9d                	jg     a29e <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    a301:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a305:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    a309:	0f 8e 4d ff ff ff    	jle    a25c <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    a30f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a312:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a318:	05 30 fd 00 00       	add    $0xfd30,%eax
    a31d:	8b 00                	mov    (%eax),%eax
    a31f:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a322:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a325:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a32b:	05 34 fd 00 00       	add    $0xfd34,%eax
    a330:	8b 00                	mov    (%eax),%eax
    a332:	ba 40 02 00 00       	mov    $0x240,%edx
    a337:	29 c2                	sub    %eax,%edx
    a339:	89 d0                	mov    %edx,%eax
    a33b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    a33e:	eb 30                	jmp    a370 <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    a340:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a343:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a34a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a34d:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    a354:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a357:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a35e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a361:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    a368:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a36c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a370:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a374:	7f ca                	jg     a340 <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a376:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a37d:	eb 55                	jmp    a3d4 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    a37f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a386:	eb 42                	jmp    a3ca <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    a388:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a38f:	eb 2f                	jmp    a3c0 <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    a391:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a394:	89 d0                	mov    %edx,%eax
    a396:	c1 e0 03             	shl    $0x3,%eax
    a399:	01 d0                	add    %edx,%eax
    a39b:	c1 e0 09             	shl    $0x9,%eax
    a39e:	89 c2                	mov    %eax,%edx
    a3a0:	8b 45 0c             	mov    0xc(%ebp),%eax
    a3a3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a3a6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a3a9:	89 d0                	mov    %edx,%eax
    a3ab:	c1 e0 03             	shl    $0x3,%eax
    a3ae:	01 d0                	add    %edx,%eax
    a3b0:	01 c0                	add    %eax,%eax
    a3b2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a3b5:	01 d0                	add    %edx,%eax
    a3b7:	d9 ee                	fldz   
    a3b9:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a3bc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a3c0:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a3c4:	7e cb                	jle    a391 <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    a3c6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a3ca:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a3ce:	7e b8                	jle    a388 <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a3d0:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a3d4:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    a3d8:	7e a5                	jle    a37f <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    a3da:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    a3de:	0f 85 3d 02 00 00    	jne    a621 <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    a3e4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a3eb:	e9 25 02 00 00       	jmp    a615 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    a3f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a3f7:	e9 0b 02 00 00       	jmp    a607 <III_stereo+0xd4c>
            i = (sb*18)+ss;
    a3fc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a3ff:	89 d0                	mov    %edx,%eax
    a401:	c1 e0 03             	shl    $0x3,%eax
    a404:	01 d0                	add    %edx,%eax
    a406:	01 c0                	add    %eax,%eax
    a408:	89 c2                	mov    %eax,%edx
    a40a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a40d:	01 d0                	add    %edx,%eax
    a40f:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    a412:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a415:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a41c:	83 f8 07             	cmp    $0x7,%eax
    a41f:	0f 85 2c 01 00 00    	jne    a551 <III_stereo+0xc96>
               if ( ms_stereo ) {
    a425:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    a429:	0f 84 b5 00 00 00    	je     a4e4 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    a42f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a432:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a435:	89 d0                	mov    %edx,%eax
    a437:	c1 e0 03             	shl    $0x3,%eax
    a43a:	01 d0                	add    %edx,%eax
    a43c:	01 c0                	add    %eax,%eax
    a43e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a441:	01 d0                	add    %edx,%eax
    a443:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a446:	8b 45 08             	mov    0x8(%ebp),%eax
    a449:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a44f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a452:	89 d0                	mov    %edx,%eax
    a454:	c1 e0 03             	shl    $0x3,%eax
    a457:	01 d0                	add    %edx,%eax
    a459:	01 c0                	add    %eax,%eax
    a45b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a45e:	01 d0                	add    %edx,%eax
    a460:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a463:	de c1                	faddp  %st,%st(1)
    a465:	dd 05 28 e2 00 00    	fldl   0xe228
    a46b:	de f9                	fdivrp %st,%st(1)
    a46d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a470:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a473:	89 d0                	mov    %edx,%eax
    a475:	c1 e0 03             	shl    $0x3,%eax
    a478:	01 d0                	add    %edx,%eax
    a47a:	01 c0                	add    %eax,%eax
    a47c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a47f:	01 d0                	add    %edx,%eax
    a481:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    a484:	8b 45 0c             	mov    0xc(%ebp),%eax
    a487:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a48d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a490:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a493:	89 d0                	mov    %edx,%eax
    a495:	c1 e0 03             	shl    $0x3,%eax
    a498:	01 d0                	add    %edx,%eax
    a49a:	01 c0                	add    %eax,%eax
    a49c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a49f:	01 d0                	add    %edx,%eax
    a4a1:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a4a4:	8b 45 08             	mov    0x8(%ebp),%eax
    a4a7:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a4ad:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a4b0:	89 d0                	mov    %edx,%eax
    a4b2:	c1 e0 03             	shl    $0x3,%eax
    a4b5:	01 d0                	add    %edx,%eax
    a4b7:	01 c0                	add    %eax,%eax
    a4b9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a4bc:	01 d0                	add    %edx,%eax
    a4be:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a4c1:	de e9                	fsubrp %st,%st(1)
    a4c3:	dd 05 28 e2 00 00    	fldl   0xe228
    a4c9:	de f9                	fdivrp %st,%st(1)
    a4cb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a4ce:	89 d0                	mov    %edx,%eax
    a4d0:	c1 e0 03             	shl    $0x3,%eax
    a4d3:	01 d0                	add    %edx,%eax
    a4d5:	01 c0                	add    %eax,%eax
    a4d7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a4da:	01 d0                	add    %edx,%eax
    a4dc:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    a4df:	e9 1f 01 00 00       	jmp    a603 <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    a4e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a4e7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a4ea:	89 d0                	mov    %edx,%eax
    a4ec:	c1 e0 03             	shl    $0x3,%eax
    a4ef:	01 d0                	add    %edx,%eax
    a4f1:	01 c0                	add    %eax,%eax
    a4f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a4f6:	01 d0                	add    %edx,%eax
    a4f8:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a4fb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a4fe:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a501:	89 d0                	mov    %edx,%eax
    a503:	c1 e0 03             	shl    $0x3,%eax
    a506:	01 d0                	add    %edx,%eax
    a508:	01 c0                	add    %eax,%eax
    a50a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a50d:	01 d0                	add    %edx,%eax
    a50f:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    a512:	8b 45 0c             	mov    0xc(%ebp),%eax
    a515:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a51b:	8b 45 08             	mov    0x8(%ebp),%eax
    a51e:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a524:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a527:	89 d0                	mov    %edx,%eax
    a529:	c1 e0 03             	shl    $0x3,%eax
    a52c:	01 d0                	add    %edx,%eax
    a52e:	01 c0                	add    %eax,%eax
    a530:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a533:	01 d0                	add    %edx,%eax
    a535:	dd 04 c3             	fldl   (%ebx,%eax,8)
    a538:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a53b:	89 d0                	mov    %edx,%eax
    a53d:	c1 e0 03             	shl    $0x3,%eax
    a540:	01 d0                	add    %edx,%eax
    a542:	01 c0                	add    %eax,%eax
    a544:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a547:	01 d0                	add    %edx,%eax
    a549:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    a54c:	e9 b2 00 00 00       	jmp    a603 <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    a551:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    a555:	0f 84 94 00 00 00    	je     a5ef <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    a55b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a55e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a561:	89 d0                	mov    %edx,%eax
    a563:	c1 e0 03             	shl    $0x3,%eax
    a566:	01 d0                	add    %edx,%eax
    a568:	01 c0                	add    %eax,%eax
    a56a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a56d:	01 d0                	add    %edx,%eax
    a56f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a572:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a575:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a57c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a57f:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a586:	d9 e8                	fld1   
    a588:	de c1                	faddp  %st,%st(1)
    a58a:	de f9                	fdivrp %st,%st(1)
    a58c:	de c9                	fmulp  %st,%st(1)
    a58e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a591:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a594:	89 d0                	mov    %edx,%eax
    a596:	c1 e0 03             	shl    $0x3,%eax
    a599:	01 d0                	add    %edx,%eax
    a59b:	01 c0                	add    %eax,%eax
    a59d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a5a0:	01 d0                	add    %edx,%eax
    a5a2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    a5a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    a5a8:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a5ae:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a5b1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a5b4:	89 d0                	mov    %edx,%eax
    a5b6:	c1 e0 03             	shl    $0x3,%eax
    a5b9:	01 d0                	add    %edx,%eax
    a5bb:	01 c0                	add    %eax,%eax
    a5bd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a5c0:	01 d0                	add    %edx,%eax
    a5c2:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a5c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a5c8:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a5cf:	d9 e8                	fld1   
    a5d1:	de c1                	faddp  %st,%st(1)
    a5d3:	d9 e8                	fld1   
    a5d5:	de f1                	fdivp  %st,%st(1)
    a5d7:	de c9                	fmulp  %st,%st(1)
    a5d9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a5dc:	89 d0                	mov    %edx,%eax
    a5de:	c1 e0 03             	shl    $0x3,%eax
    a5e1:	01 d0                	add    %edx,%eax
    a5e3:	01 c0                	add    %eax,%eax
    a5e5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a5e8:	01 d0                	add    %edx,%eax
    a5ea:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    a5ed:	eb 14                	jmp    a603 <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    a5ef:	c7 44 24 04 c0 d1 00 	movl   $0xd1c0,0x4(%esp)
    a5f6:	00 
    a5f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    a5fe:	e8 3c a7 ff ff       	call   4d3f <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    a603:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a607:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a60b:	0f 8e eb fd ff ff    	jle    a3fc <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    a611:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a615:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a619:	0f 8e d1 fd ff ff    	jle    a3f0 <III_stereo+0xb35>
    a61f:	eb 54                	jmp    a675 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    a621:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a628:	eb 45                	jmp    a66f <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    a62a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a631:	eb 32                	jmp    a665 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    a633:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a636:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a639:	89 d0                	mov    %edx,%eax
    a63b:	c1 e0 03             	shl    $0x3,%eax
    a63e:	01 d0                	add    %edx,%eax
    a640:	01 c0                	add    %eax,%eax
    a642:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a645:	01 d0                	add    %edx,%eax
    a647:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a64a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a64d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a650:	89 d0                	mov    %edx,%eax
    a652:	c1 e0 03             	shl    $0x3,%eax
    a655:	01 d0                	add    %edx,%eax
    a657:	01 c0                	add    %eax,%eax
    a659:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a65c:	01 d0                	add    %edx,%eax
    a65e:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a661:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a665:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a669:	7e c8                	jle    a633 <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    a66b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a66f:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a673:	7e b5                	jle    a62a <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    a675:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    a67b:	5b                   	pop    %ebx
    a67c:	5e                   	pop    %esi
    a67d:	5d                   	pop    %ebp
    a67e:	c3                   	ret    

0000a67f <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    a67f:	55                   	push   %ebp
    a680:	89 e5                	mov    %esp,%ebp
    a682:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    a685:	a1 40 ff 00 00       	mov    0xff40,%eax
    a68a:	85 c0                	test   %eax,%eax
    a68c:	74 68                	je     a6f6 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    a68e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a695:	eb 4f                	jmp    a6e6 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    a697:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a69a:	dd 04 c5 00 ff 00 00 	fldl   0xff00(,%eax,8)
    a6a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a6a4:	dd 04 c5 00 ff 00 00 	fldl   0xff00(,%eax,8)
    a6ab:	de c9                	fmulp  %st,%st(1)
    a6ad:	d9 e8                	fld1   
    a6af:	de c1                	faddp  %st,%st(1)
    a6b1:	dd 1c 24             	fstpl  (%esp)
    a6b4:	e8 de ac ff ff       	call   5397 <sqrt>
    a6b9:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    a6bc:	d9 e8                	fld1   
    a6be:	dc 75 e0             	fdivl  -0x20(%ebp)
    a6c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a6c4:	dd 1c c5 a0 ff 00 00 	fstpl  0xffa0(,%eax,8)
         ca[i] = Ci[i]/sq;
    a6cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a6ce:	dd 04 c5 00 ff 00 00 	fldl   0xff00(,%eax,8)
    a6d5:	dc 75 e0             	fdivl  -0x20(%ebp)
    a6d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a6db:	dd 1c c5 e0 ff 00 00 	fstpl  0xffe0(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    a6e2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a6e6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    a6ea:	7e ab                	jle    a697 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    a6ec:	c7 05 40 ff 00 00 00 	movl   $0x0,0xff40
    a6f3:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    a6f6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a6fd:	eb 4c                	jmp    a74b <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    a6ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a706:	eb 39                	jmp    a741 <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    a708:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a70b:	89 d0                	mov    %edx,%eax
    a70d:	c1 e0 03             	shl    $0x3,%eax
    a710:	01 d0                	add    %edx,%eax
    a712:	c1 e0 04             	shl    $0x4,%eax
    a715:	89 c2                	mov    %eax,%edx
    a717:	8b 45 0c             	mov    0xc(%ebp),%eax
    a71a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a71d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a720:	89 d0                	mov    %edx,%eax
    a722:	c1 e0 03             	shl    $0x3,%eax
    a725:	01 d0                	add    %edx,%eax
    a727:	c1 e0 04             	shl    $0x4,%eax
    a72a:	89 c2                	mov    %eax,%edx
    a72c:	8b 45 08             	mov    0x8(%ebp),%eax
    a72f:	01 c2                	add    %eax,%edx
    a731:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a734:	dd 04 c2             	fldl   (%edx,%eax,8)
    a737:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a73a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    a73d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a741:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a745:	7e c1                	jle    a708 <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    a747:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a74b:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    a74f:	7e ae                	jle    a6ff <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    a751:	8b 45 10             	mov    0x10(%ebp),%eax
    a754:	8b 40 10             	mov    0x10(%eax),%eax
    a757:	85 c0                	test   %eax,%eax
    a759:	74 1a                	je     a775 <III_antialias+0xf6>
    a75b:	8b 45 10             	mov    0x10(%ebp),%eax
    a75e:	8b 40 14             	mov    0x14(%eax),%eax
    a761:	83 f8 02             	cmp    $0x2,%eax
    a764:	75 0f                	jne    a775 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    a766:	8b 45 10             	mov    0x10(%ebp),%eax
    a769:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    a76c:	85 c0                	test   %eax,%eax
    a76e:	75 05                	jne    a775 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    a770:	e9 1c 01 00 00       	jmp    a891 <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a775:	8b 45 10             	mov    0x10(%ebp),%eax
    a778:	8b 40 10             	mov    0x10(%eax),%eax
    a77b:	85 c0                	test   %eax,%eax
    a77d:	74 1e                	je     a79d <III_antialias+0x11e>
    a77f:	8b 45 10             	mov    0x10(%ebp),%eax
    a782:	8b 40 18             	mov    0x18(%eax),%eax
    a785:	85 c0                	test   %eax,%eax
    a787:	74 14                	je     a79d <III_antialias+0x11e>
     (gr_info->block_type == 2))
    a789:	8b 45 10             	mov    0x10(%ebp),%eax
    a78c:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a78f:	83 f8 02             	cmp    $0x2,%eax
    a792:	75 09                	jne    a79d <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    a794:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    a79b:	eb 07                	jmp    a7a4 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    a79d:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    a7a4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a7ab:	e9 d5 00 00 00       	jmp    a885 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    a7b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a7b7:	e9 bb 00 00 00       	jmp    a877 <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    a7bc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a7bf:	89 d0                	mov    %edx,%eax
    a7c1:	c1 e0 03             	shl    $0x3,%eax
    a7c4:	01 d0                	add    %edx,%eax
    a7c6:	c1 e0 04             	shl    $0x4,%eax
    a7c9:	89 c2                	mov    %eax,%edx
    a7cb:	8b 45 08             	mov    0x8(%ebp),%eax
    a7ce:	01 c2                	add    %eax,%edx
    a7d0:	b8 11 00 00 00       	mov    $0x11,%eax
    a7d5:	2b 45 f4             	sub    -0xc(%ebp),%eax
    a7d8:	dd 04 c2             	fldl   (%edx,%eax,8)
    a7db:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    a7de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a7e1:	8d 50 01             	lea    0x1(%eax),%edx
    a7e4:	89 d0                	mov    %edx,%eax
    a7e6:	c1 e0 03             	shl    $0x3,%eax
    a7e9:	01 d0                	add    %edx,%eax
    a7eb:	c1 e0 04             	shl    $0x4,%eax
    a7ee:	89 c2                	mov    %eax,%edx
    a7f0:	8b 45 08             	mov    0x8(%ebp),%eax
    a7f3:	01 c2                	add    %eax,%edx
    a7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a7f8:	dd 04 c2             	fldl   (%edx,%eax,8)
    a7fb:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    a7fe:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a801:	89 d0                	mov    %edx,%eax
    a803:	c1 e0 03             	shl    $0x3,%eax
    a806:	01 d0                	add    %edx,%eax
    a808:	c1 e0 04             	shl    $0x4,%eax
    a80b:	89 c2                	mov    %eax,%edx
    a80d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a810:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a813:	b8 11 00 00 00       	mov    $0x11,%eax
    a818:	2b 45 f4             	sub    -0xc(%ebp),%eax
    a81b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a81e:	dd 04 d5 a0 ff 00 00 	fldl   0xffa0(,%edx,8)
    a825:	dc 4d d8             	fmull  -0x28(%ebp)
    a828:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a82b:	dd 04 d5 e0 ff 00 00 	fldl   0xffe0(,%edx,8)
    a832:	dc 4d d0             	fmull  -0x30(%ebp)
    a835:	de e9                	fsubrp %st,%st(1)
    a837:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    a83a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a83d:	8d 50 01             	lea    0x1(%eax),%edx
    a840:	89 d0                	mov    %edx,%eax
    a842:	c1 e0 03             	shl    $0x3,%eax
    a845:	01 d0                	add    %edx,%eax
    a847:	c1 e0 04             	shl    $0x4,%eax
    a84a:	89 c2                	mov    %eax,%edx
    a84c:	8b 45 0c             	mov    0xc(%ebp),%eax
    a84f:	01 c2                	add    %eax,%edx
    a851:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a854:	dd 04 c5 a0 ff 00 00 	fldl   0xffa0(,%eax,8)
    a85b:	dc 4d d0             	fmull  -0x30(%ebp)
    a85e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a861:	dd 04 c5 e0 ff 00 00 	fldl   0xffe0(,%eax,8)
    a868:	dc 4d d8             	fmull  -0x28(%ebp)
    a86b:	de c1                	faddp  %st,%st(1)
    a86d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a870:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    a873:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a877:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    a87b:	0f 8e 3b ff ff ff    	jle    a7bc <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    a881:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a885:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a888:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    a88b:	0f 8c 1f ff ff ff    	jl     a7b0 <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    a891:	c9                   	leave  
    a892:	c3                   	ret    

0000a893 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    a893:	55                   	push   %ebp
    a894:	89 e5                	mov    %esp,%ebp
    a896:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    a89c:	a1 20 00 01 00       	mov    0x10020,%eax
    a8a1:	85 c0                	test   %eax,%eax
    a8a3:	0f 85 59 02 00 00    	jne    ab02 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    a8a9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a8b0:	eb 29                	jmp    a8db <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    a8b2:	db 45 f4             	fildl  -0xc(%ebp)
    a8b5:	dd 05 30 e2 00 00    	fldl   0xe230
    a8bb:	de c1                	faddp  %st,%st(1)
    a8bd:	dd 05 38 e2 00 00    	fldl   0xe238
    a8c3:	de c9                	fmulp  %st,%st(1)
    a8c5:	dd 1c 24             	fstpl  (%esp)
    a8c8:	e8 53 a8 ff ff       	call   5120 <sin>
    a8cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a8d0:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    a8d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a8db:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a8df:	7e d1                	jle    a8b2 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    a8e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a8e8:	eb 2c                	jmp    a916 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    a8ea:	db 45 f4             	fildl  -0xc(%ebp)
    a8ed:	dd 05 30 e2 00 00    	fldl   0xe230
    a8f3:	de c1                	faddp  %st,%st(1)
    a8f5:	dd 05 38 e2 00 00    	fldl   0xe238
    a8fb:	de c9                	fmulp  %st,%st(1)
    a8fd:	dd 1c 24             	fstpl  (%esp)
    a900:	e8 1b a8 ff ff       	call   5120 <sin>
    a905:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a908:	83 c0 24             	add    $0x24,%eax
    a90b:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    a912:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a916:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a91a:	7e ce                	jle    a8ea <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    a91c:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    a923:	eb 13                	jmp    a938 <inv_mdct+0xa5>
         win[1][i] = 1.0;
    a925:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a928:	83 c0 24             	add    $0x24,%eax
    a92b:	d9 e8                	fld1   
    a92d:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    a934:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a938:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    a93c:	7e e7                	jle    a925 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    a93e:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    a945:	eb 34                	jmp    a97b <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    a947:	db 45 f4             	fildl  -0xc(%ebp)
    a94a:	dd 05 30 e2 00 00    	fldl   0xe230
    a950:	de c1                	faddp  %st,%st(1)
    a952:	dd 05 40 e2 00 00    	fldl   0xe240
    a958:	de e9                	fsubrp %st,%st(1)
    a95a:	dd 05 20 e2 00 00    	fldl   0xe220
    a960:	de c9                	fmulp  %st,%st(1)
    a962:	dd 1c 24             	fstpl  (%esp)
    a965:	e8 b6 a7 ff ff       	call   5120 <sin>
    a96a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a96d:	83 c0 24             	add    $0x24,%eax
    a970:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    a977:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a97b:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    a97f:	7e c6                	jle    a947 <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a981:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    a988:	eb 13                	jmp    a99d <inv_mdct+0x10a>
         win[1][i] = 0.0;
    a98a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a98d:	83 c0 24             	add    $0x24,%eax
    a990:	d9 ee                	fldz   
    a992:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a999:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a99d:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a9a1:	7e e7                	jle    a98a <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a9a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a9aa:	eb 13                	jmp    a9bf <inv_mdct+0x12c>
         win[3][i] = 0.0;
    a9ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a9af:	83 c0 6c             	add    $0x6c,%eax
    a9b2:	d9 ee                	fldz   
    a9b4:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a9bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a9bf:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    a9c3:	7e e7                	jle    a9ac <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a9c5:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    a9cc:	eb 34                	jmp    aa02 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    a9ce:	db 45 f4             	fildl  -0xc(%ebp)
    a9d1:	dd 05 30 e2 00 00    	fldl   0xe230
    a9d7:	de c1                	faddp  %st,%st(1)
    a9d9:	dd 05 48 e2 00 00    	fldl   0xe248
    a9df:	de e9                	fsubrp %st,%st(1)
    a9e1:	dd 05 20 e2 00 00    	fldl   0xe220
    a9e7:	de c9                	fmulp  %st,%st(1)
    a9e9:	dd 1c 24             	fstpl  (%esp)
    a9ec:	e8 2f a7 ff ff       	call   5120 <sin>
    a9f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a9f4:	83 c0 6c             	add    $0x6c,%eax
    a9f7:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a9fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aa02:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    aa06:	7e c6                	jle    a9ce <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    aa08:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    aa0f:	eb 13                	jmp    aa24 <inv_mdct+0x191>
         win[3][i] =1.0;
    aa11:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aa14:	83 c0 6c             	add    $0x6c,%eax
    aa17:	d9 e8                	fld1   
    aa19:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    aa20:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aa24:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    aa28:	7e e7                	jle    aa11 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    aa2a:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    aa31:	eb 2c                	jmp    aa5f <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    aa33:	db 45 f4             	fildl  -0xc(%ebp)
    aa36:	dd 05 30 e2 00 00    	fldl   0xe230
    aa3c:	de c1                	faddp  %st,%st(1)
    aa3e:	dd 05 38 e2 00 00    	fldl   0xe238
    aa44:	de c9                	fmulp  %st,%st(1)
    aa46:	dd 1c 24             	fstpl  (%esp)
    aa49:	e8 d2 a6 ff ff       	call   5120 <sin>
    aa4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aa51:	83 c0 6c             	add    $0x6c,%eax
    aa54:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    aa5b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aa5f:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    aa63:	7e ce                	jle    aa33 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    aa65:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    aa6c:	eb 2c                	jmp    aa9a <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    aa6e:	db 45 f4             	fildl  -0xc(%ebp)
    aa71:	dd 05 30 e2 00 00    	fldl   0xe230
    aa77:	de c1                	faddp  %st,%st(1)
    aa79:	dd 05 20 e2 00 00    	fldl   0xe220
    aa7f:	de c9                	fmulp  %st,%st(1)
    aa81:	dd 1c 24             	fstpl  (%esp)
    aa84:	e8 97 a6 ff ff       	call   5120 <sin>
    aa89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aa8c:	83 c0 48             	add    $0x48,%eax
    aa8f:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    aa96:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aa9a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    aa9e:	7e ce                	jle    aa6e <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    aaa0:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    aaa7:	eb 13                	jmp    aabc <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    aaa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aaac:	83 c0 48             	add    $0x48,%eax
    aaaf:	d9 ee                	fldz   
    aab1:	dd 1c c5 40 00 01 00 	fstpl  0x10040(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    aab8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aabc:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    aac0:	7e e7                	jle    aaa9 <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    aac2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    aac9:	eb 21                	jmp    aaec <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    aacb:	db 45 f4             	fildl  -0xc(%ebp)
    aace:	dd 05 50 e2 00 00    	fldl   0xe250
    aad4:	de c9                	fmulp  %st,%st(1)
    aad6:	dd 1c 24             	fstpl  (%esp)
    aad9:	e8 e1 a6 ff ff       	call   51bf <cos>
    aade:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aae1:	dd 1c c5 c0 04 01 00 	fstpl  0x104c0(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    aae8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aaec:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    aaf3:	7e d6                	jle    aacb <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    aaf5:	a1 20 00 01 00       	mov    0x10020,%eax
    aafa:	83 c0 01             	add    $0x1,%eax
    aafd:	a3 20 00 01 00       	mov    %eax,0x10020
    }

    for(i=0;i<36;i++)
    ab02:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ab09:	eb 17                	jmp    ab22 <inv_mdct+0x28f>
       out[i]=0;
    ab0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab0e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ab15:	8b 45 0c             	mov    0xc(%ebp),%eax
    ab18:	01 d0                	add    %edx,%eax
    ab1a:	d9 ee                	fldz   
    ab1c:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    ab1e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ab22:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    ab26:	7e e3                	jle    ab0b <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    ab28:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    ab2c:	0f 85 85 01 00 00    	jne    acb7 <inv_mdct+0x424>
       N=12;
    ab32:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    ab39:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ab40:	e9 63 01 00 00       	jmp    aca8 <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    ab45:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    ab4c:	e9 df 00 00 00       	jmp    ac30 <inv_mdct+0x39d>
             sum = 0.0;
    ab51:	d9 ee                	fldz   
    ab53:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    ab56:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    ab5d:	e9 8f 00 00 00       	jmp    abf1 <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    ab62:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ab65:	89 d0                	mov    %edx,%eax
    ab67:	01 c0                	add    %eax,%eax
    ab69:	01 c2                	add    %eax,%edx
    ab6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab6e:	01 d0                	add    %edx,%eax
    ab70:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ab77:	8b 45 08             	mov    0x8(%ebp),%eax
    ab7a:	01 d0                	add    %edx,%eax
    ab7c:	dd 00                	fldl   (%eax)
    ab7e:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    ab84:	8b 45 dc             	mov    -0x24(%ebp),%eax
    ab87:	01 c0                	add    %eax,%eax
    ab89:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    ab8f:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    ab95:	dd 05 58 e2 00 00    	fldl   0xe258
    ab9b:	de f1                	fdivp  %st,%st(1)
    ab9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aba0:	01 c0                	add    %eax,%eax
    aba2:	8d 50 01             	lea    0x1(%eax),%edx
    aba5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    aba8:	89 c1                	mov    %eax,%ecx
    abaa:	c1 e9 1f             	shr    $0x1f,%ecx
    abad:	01 c8                	add    %ecx,%eax
    abaf:	d1 f8                	sar    %eax
    abb1:	01 d0                	add    %edx,%eax
    abb3:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    abb9:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    abbf:	de c9                	fmulp  %st,%st(1)
    abc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    abc4:	01 c0                	add    %eax,%eax
    abc6:	83 c0 01             	add    $0x1,%eax
    abc9:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    abcf:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    abd5:	de c9                	fmulp  %st,%st(1)
    abd7:	dd 1c 24             	fstpl  (%esp)
    abda:	e8 e0 a5 ff ff       	call   51bf <cos>
    abdf:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    abe5:	dd 45 e0             	fldl   -0x20(%ebp)
    abe8:	de c1                	faddp  %st,%st(1)
    abea:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    abed:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    abf1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    abf4:	89 c2                	mov    %eax,%edx
    abf6:	c1 ea 1f             	shr    $0x1f,%edx
    abf9:	01 d0                	add    %edx,%eax
    abfb:	d1 f8                	sar    %eax
    abfd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    ac00:	0f 8f 5c ff ff ff    	jg     ab62 <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    ac06:	8b 55 10             	mov    0x10(%ebp),%edx
    ac09:	89 d0                	mov    %edx,%eax
    ac0b:	c1 e0 03             	shl    $0x3,%eax
    ac0e:	01 d0                	add    %edx,%eax
    ac10:	c1 e0 02             	shl    $0x2,%eax
    ac13:	8b 55 ec             	mov    -0x14(%ebp),%edx
    ac16:	01 d0                	add    %edx,%eax
    ac18:	dd 04 c5 40 00 01 00 	fldl   0x10040(,%eax,8)
    ac1f:	dc 4d e0             	fmull  -0x20(%ebp)
    ac22:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ac25:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    ac2c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    ac30:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ac33:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    ac36:	0f 8c 15 ff ff ff    	jl     ab51 <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    ac3c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    ac43:	eb 57                	jmp    ac9c <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    ac45:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac48:	89 d0                	mov    %edx,%eax
    ac4a:	01 c0                	add    %eax,%eax
    ac4c:	01 d0                	add    %edx,%eax
    ac4e:	01 c0                	add    %eax,%eax
    ac50:	89 c2                	mov    %eax,%edx
    ac52:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ac55:	01 d0                	add    %edx,%eax
    ac57:	83 c0 06             	add    $0x6,%eax
    ac5a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ac61:	8b 45 0c             	mov    0xc(%ebp),%eax
    ac64:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    ac67:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac6a:	89 d0                	mov    %edx,%eax
    ac6c:	01 c0                	add    %eax,%eax
    ac6e:	01 d0                	add    %edx,%eax
    ac70:	01 c0                	add    %eax,%eax
    ac72:	89 c2                	mov    %eax,%edx
    ac74:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ac77:	01 d0                	add    %edx,%eax
    ac79:	83 c0 06             	add    $0x6,%eax
    ac7c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ac83:	8b 45 0c             	mov    0xc(%ebp),%eax
    ac86:	01 d0                	add    %edx,%eax
    ac88:	dd 00                	fldl   (%eax)
    ac8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ac8d:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    ac94:	de c1                	faddp  %st,%st(1)
    ac96:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    ac98:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    ac9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ac9f:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    aca2:	7c a1                	jl     ac45 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    aca4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aca8:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    acac:	0f 8e 93 fe ff ff    	jle    ab45 <inv_mdct+0x2b2>
    acb2:	e9 da 00 00 00       	jmp    ad91 <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    acb7:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    acbe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    acc5:	e9 bb 00 00 00       	jmp    ad85 <inv_mdct+0x4f2>
         sum = 0.0;
    acca:	d9 ee                	fldz   
    accc:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    accf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    acd6:	eb 6a                	jmp    ad42 <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    acd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    acdb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ace2:	8b 45 08             	mov    0x8(%ebp),%eax
    ace5:	01 d0                	add    %edx,%eax
    ace7:	dd 00                	fldl   (%eax)
    ace9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    acec:	01 c0                	add    %eax,%eax
    acee:	8d 50 01             	lea    0x1(%eax),%edx
    acf1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    acf4:	89 c1                	mov    %eax,%ecx
    acf6:	c1 e9 1f             	shr    $0x1f,%ecx
    acf9:	01 c8                	add    %ecx,%eax
    acfb:	d1 f8                	sar    %eax
    acfd:	01 c2                	add    %eax,%edx
    acff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ad02:	01 c0                	add    %eax,%eax
    ad04:	83 c0 01             	add    $0x1,%eax
    ad07:	89 d1                	mov    %edx,%ecx
    ad09:	0f af c8             	imul   %eax,%ecx
    ad0c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    ad11:	89 c8                	mov    %ecx,%eax
    ad13:	f7 ea                	imul   %edx
    ad15:	c1 fa 05             	sar    $0x5,%edx
    ad18:	89 c8                	mov    %ecx,%eax
    ad1a:	c1 f8 1f             	sar    $0x1f,%eax
    ad1d:	29 c2                	sub    %eax,%edx
    ad1f:	89 d0                	mov    %edx,%eax
    ad21:	c1 e0 03             	shl    $0x3,%eax
    ad24:	01 d0                	add    %edx,%eax
    ad26:	c1 e0 04             	shl    $0x4,%eax
    ad29:	29 c1                	sub    %eax,%ecx
    ad2b:	89 ca                	mov    %ecx,%edx
    ad2d:	dd 04 d5 c0 04 01 00 	fldl   0x104c0(,%edx,8)
    ad34:	de c9                	fmulp  %st,%st(1)
    ad36:	dd 45 e0             	fldl   -0x20(%ebp)
    ad39:	de c1                	faddp  %st,%st(1)
    ad3b:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    ad3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    ad42:	8b 45 dc             	mov    -0x24(%ebp),%eax
    ad45:	89 c2                	mov    %eax,%edx
    ad47:	c1 ea 1f             	shr    $0x1f,%edx
    ad4a:	01 d0                	add    %edx,%eax
    ad4c:	d1 f8                	sar    %eax
    ad4e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    ad51:	7f 85                	jg     acd8 <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    ad53:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ad56:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ad5d:	8b 45 0c             	mov    0xc(%ebp),%eax
    ad60:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    ad63:	8b 55 10             	mov    0x10(%ebp),%edx
    ad66:	89 d0                	mov    %edx,%eax
    ad68:	c1 e0 03             	shl    $0x3,%eax
    ad6b:	01 d0                	add    %edx,%eax
    ad6d:	c1 e0 02             	shl    $0x2,%eax
    ad70:	8b 55 ec             	mov    -0x14(%ebp),%edx
    ad73:	01 d0                	add    %edx,%eax
    ad75:	dd 04 c5 40 00 01 00 	fldl   0x10040(,%eax,8)
    ad7c:	dc 4d e0             	fmull  -0x20(%ebp)
    ad7f:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    ad81:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    ad85:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ad88:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    ad8b:	0f 8c 39 ff ff ff    	jl     acca <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    ad91:	c9                   	leave  
    ad92:	c3                   	ret    

0000ad93 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    ad93:	55                   	push   %ebp
    ad94:	89 e5                	mov    %esp,%ebp
    ad96:	53                   	push   %ebx
    ad97:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    ad9d:	a1 44 ff 00 00       	mov    0xff44,%eax
    ada2:	85 c0                	test   %eax,%eax
    ada4:	74 6f                	je     ae15 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    ada6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    adad:	eb 56                	jmp    ae05 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    adaf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    adb6:	eb 43                	jmp    adfb <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    adb8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    adbf:	eb 30                	jmp    adf1 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    adc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    adc4:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    adc7:	89 c2                	mov    %eax,%edx
    adc9:	c1 e2 03             	shl    $0x3,%edx
    adcc:	01 c2                	add    %eax,%edx
    adce:	8d 04 12             	lea    (%edx,%edx,1),%eax
    add1:	89 c2                	mov    %eax,%edx
    add3:	89 c8                	mov    %ecx,%eax
    add5:	c1 e0 03             	shl    $0x3,%eax
    add8:	01 c8                	add    %ecx,%eax
    adda:	c1 e0 06             	shl    $0x6,%eax
    addd:	01 c2                	add    %eax,%edx
    addf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    ade2:	01 d0                	add    %edx,%eax
    ade4:	d9 ee                	fldz   
    ade6:	dd 1c c5 40 09 01 00 	fstpl  0x10940(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    aded:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    adf1:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    adf5:	7e ca                	jle    adc1 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    adf7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    adfb:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    adff:	7e b7                	jle    adb8 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    ae01:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    ae05:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    ae09:	7e a4                	jle    adaf <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    ae0b:	c7 05 44 ff 00 00 00 	movl   $0x0,0xff44
    ae12:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    ae15:	8b 45 18             	mov    0x18(%ebp),%eax
    ae18:	8b 40 10             	mov    0x10(%eax),%eax
    ae1b:	85 c0                	test   %eax,%eax
    ae1d:	74 10                	je     ae2f <III_hybrid+0x9c>
    ae1f:	8b 45 18             	mov    0x18(%ebp),%eax
    ae22:	8b 40 18             	mov    0x18(%eax),%eax
    ae25:	85 c0                	test   %eax,%eax
    ae27:	74 06                	je     ae2f <III_hybrid+0x9c>
    ae29:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    ae2d:	7e 08                	jle    ae37 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    ae2f:	8b 45 18             	mov    0x18(%ebp),%eax
    ae32:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    ae35:	eb 05                	jmp    ae3c <III_hybrid+0xa9>
    ae37:	b8 00 00 00 00       	mov    $0x0,%eax
    ae3c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    ae3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    ae42:	89 44 24 08          	mov    %eax,0x8(%esp)
    ae46:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    ae4c:	89 44 24 04          	mov    %eax,0x4(%esp)
    ae50:	8b 45 08             	mov    0x8(%ebp),%eax
    ae53:	89 04 24             	mov    %eax,(%esp)
    ae56:	e8 38 fa ff ff       	call   a893 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    ae5b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ae62:	e9 83 00 00 00       	jmp    aeea <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    ae67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae6a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ae71:	8b 45 0c             	mov    0xc(%ebp),%eax
    ae74:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    ae77:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae7a:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    ae81:	8b 45 10             	mov    0x10(%ebp),%eax
    ae84:	8b 4d 14             	mov    0x14(%ebp),%ecx
    ae87:	89 c2                	mov    %eax,%edx
    ae89:	c1 e2 03             	shl    $0x3,%edx
    ae8c:	01 c2                	add    %eax,%edx
    ae8e:	8d 04 12             	lea    (%edx,%edx,1),%eax
    ae91:	89 c2                	mov    %eax,%edx
    ae93:	89 c8                	mov    %ecx,%eax
    ae95:	c1 e0 03             	shl    $0x3,%eax
    ae98:	01 c8                	add    %ecx,%eax
    ae9a:	c1 e0 06             	shl    $0x6,%eax
    ae9d:	01 c2                	add    %eax,%edx
    ae9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aea2:	01 d0                	add    %edx,%eax
    aea4:	dd 04 c5 40 09 01 00 	fldl   0x10940(,%eax,8)
    aeab:	de c1                	faddp  %st,%st(1)
    aead:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    aeaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aeb2:	83 c0 12             	add    $0x12,%eax
    aeb5:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    aebc:	8b 45 10             	mov    0x10(%ebp),%eax
    aebf:	8b 4d 14             	mov    0x14(%ebp),%ecx
    aec2:	89 c2                	mov    %eax,%edx
    aec4:	c1 e2 03             	shl    $0x3,%edx
    aec7:	01 c2                	add    %eax,%edx
    aec9:	8d 04 12             	lea    (%edx,%edx,1),%eax
    aecc:	89 c2                	mov    %eax,%edx
    aece:	89 c8                	mov    %ecx,%eax
    aed0:	c1 e0 03             	shl    $0x3,%eax
    aed3:	01 c8                	add    %ecx,%eax
    aed5:	c1 e0 06             	shl    $0x6,%eax
    aed8:	01 c2                	add    %eax,%edx
    aeda:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aedd:	01 d0                	add    %edx,%eax
    aedf:	dd 1c c5 40 09 01 00 	fstpl  0x10940(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    aee6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aeea:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    aeee:	0f 8e 73 ff ff ff    	jle    ae67 <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    aef4:	81 c4 54 01 00 00    	add    $0x154,%esp
    aefa:	5b                   	pop    %ebx
    aefb:	5d                   	pop    %ebp
    aefc:	c3                   	ret    

0000aefd <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    aefd:	55                   	push   %ebp
    aefe:	89 e5                	mov    %esp,%ebp
    af00:	57                   	push   %edi
    af01:	56                   	push   %esi
    af02:	53                   	push   %ebx
    af03:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    af06:	be 00 00 00 00       	mov    $0x0,%esi
    af0b:	e9 1c 01 00 00       	jmp    b02c <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    af10:	bb 00 00 00 00       	mov    $0x0,%ebx
    af15:	e9 06 01 00 00       	jmp    b020 <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    af1a:	89 f0                	mov    %esi,%eax
    af1c:	c1 e0 08             	shl    $0x8,%eax
    af1f:	89 c2                	mov    %eax,%edx
    af21:	8b 45 08             	mov    0x8(%ebp),%eax
    af24:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    af27:	89 75 e0             	mov    %esi,-0x20(%ebp)
    af2a:	db 45 e0             	fildl  -0x20(%ebp)
    af2d:	dd 05 60 e2 00 00    	fldl   0xe260
    af33:	de c9                	fmulp  %st,%st(1)
    af35:	dd 05 68 e2 00 00    	fldl   0xe268
    af3b:	de c1                	faddp  %st,%st(1)
    af3d:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    af40:	83 c0 01             	add    $0x1,%eax
    af43:	89 45 e0             	mov    %eax,-0x20(%ebp)
    af46:	db 45 e0             	fildl  -0x20(%ebp)
    af49:	de c9                	fmulp  %st,%st(1)
    af4b:	dd 1c 24             	fstpl  (%esp)
    af4e:	e8 6c a2 ff ff       	call   51bf <cos>
    af53:	dd 05 70 e2 00 00    	fldl   0xe270
    af59:	de c9                	fmulp  %st,%st(1)
    af5b:	dd 1c df             	fstpl  (%edi,%ebx,8)
    af5e:	dd 04 df             	fldl   (%edi,%ebx,8)
    af61:	d9 ee                	fldz   
    af63:	d9 c9                	fxch   %st(1)
    af65:	df e9                	fucomip %st(1),%st
    af67:	dd d8                	fstp   %st(0)
    af69:	72 47                	jb     afb2 <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    af6b:	89 f0                	mov    %esi,%eax
    af6d:	c1 e0 08             	shl    $0x8,%eax
    af70:	89 c2                	mov    %eax,%edx
    af72:	8b 45 08             	mov    0x8(%ebp),%eax
    af75:	01 c2                	add    %eax,%edx
    af77:	89 f0                	mov    %esi,%eax
    af79:	c1 e0 08             	shl    $0x8,%eax
    af7c:	89 c1                	mov    %eax,%ecx
    af7e:	8b 45 08             	mov    0x8(%ebp),%eax
    af81:	01 c8                	add    %ecx,%eax
    af83:	dd 04 d8             	fldl   (%eax,%ebx,8)
    af86:	dd 05 30 e2 00 00    	fldl   0xe230
    af8c:	de c1                	faddp  %st,%st(1)
    af8e:	d9 7d e6             	fnstcw -0x1a(%ebp)
    af91:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    af95:	b4 0c                	mov    $0xc,%ah
    af97:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    af9b:	d9 6d e4             	fldcw  -0x1c(%ebp)
    af9e:	db 5d e0             	fistpl -0x20(%ebp)
    afa1:	d9 6d e6             	fldcw  -0x1a(%ebp)
    afa4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    afa7:	89 45 e0             	mov    %eax,-0x20(%ebp)
    afaa:	db 45 e0             	fildl  -0x20(%ebp)
    afad:	dd 1c da             	fstpl  (%edx,%ebx,8)
    afb0:	eb 45                	jmp    aff7 <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    afb2:	89 f0                	mov    %esi,%eax
    afb4:	c1 e0 08             	shl    $0x8,%eax
    afb7:	89 c2                	mov    %eax,%edx
    afb9:	8b 45 08             	mov    0x8(%ebp),%eax
    afbc:	01 c2                	add    %eax,%edx
    afbe:	89 f0                	mov    %esi,%eax
    afc0:	c1 e0 08             	shl    $0x8,%eax
    afc3:	89 c1                	mov    %eax,%ecx
    afc5:	8b 45 08             	mov    0x8(%ebp),%eax
    afc8:	01 c8                	add    %ecx,%eax
    afca:	dd 04 d8             	fldl   (%eax,%ebx,8)
    afcd:	dd 05 30 e2 00 00    	fldl   0xe230
    afd3:	de e9                	fsubrp %st,%st(1)
    afd5:	d9 7d e6             	fnstcw -0x1a(%ebp)
    afd8:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    afdc:	b4 0c                	mov    $0xc,%ah
    afde:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    afe2:	d9 6d e4             	fldcw  -0x1c(%ebp)
    afe5:	db 5d e0             	fistpl -0x20(%ebp)
    afe8:	d9 6d e6             	fldcw  -0x1a(%ebp)
    afeb:	8b 45 e0             	mov    -0x20(%ebp),%eax
    afee:	89 45 e0             	mov    %eax,-0x20(%ebp)
    aff1:	db 45 e0             	fildl  -0x20(%ebp)
    aff4:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    aff7:	89 f0                	mov    %esi,%eax
    aff9:	c1 e0 08             	shl    $0x8,%eax
    affc:	89 c2                	mov    %eax,%edx
    affe:	8b 45 08             	mov    0x8(%ebp),%eax
    b001:	01 d0                	add    %edx,%eax
    b003:	89 f2                	mov    %esi,%edx
    b005:	89 d1                	mov    %edx,%ecx
    b007:	c1 e1 08             	shl    $0x8,%ecx
    b00a:	8b 55 08             	mov    0x8(%ebp),%edx
    b00d:	01 ca                	add    %ecx,%edx
    b00f:	dd 04 da             	fldl   (%edx,%ebx,8)
    b012:	dd 05 78 e2 00 00    	fldl   0xe278
    b018:	de c9                	fmulp  %st,%st(1)
    b01a:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    b01d:	83 c3 01             	add    $0x1,%ebx
    b020:	83 fb 1f             	cmp    $0x1f,%ebx
    b023:	0f 8e f1 fe ff ff    	jle    af1a <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    b029:	83 c6 01             	add    $0x1,%esi
    b02c:	83 fe 3f             	cmp    $0x3f,%esi
    b02f:	0f 8e db fe ff ff    	jle    af10 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    b035:	83 c4 1c             	add    $0x1c,%esp
    b038:	5b                   	pop    %ebx
    b039:	5e                   	pop    %esi
    b03a:	5f                   	pop    %edi
    b03b:	5d                   	pop    %ebp
    b03c:	c3                   	ret    

0000b03d <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    b03d:	55                   	push   %ebp
    b03e:	89 e5                	mov    %esp,%ebp
    b040:	57                   	push   %edi
    b041:	56                   	push   %esi
    b042:	53                   	push   %ebx
    b043:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    b049:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    b04f:	bb e0 d1 00 00       	mov    $0xd1e0,%ebx
    b054:	b8 00 04 00 00       	mov    $0x400,%eax
    b059:	89 d7                	mov    %edx,%edi
    b05b:	89 de                	mov    %ebx,%esi
    b05d:	89 c1                	mov    %eax,%ecx
    b05f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    b061:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    b067:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    b06a:	81 c4 14 10 00 00    	add    $0x1014,%esp
    b070:	5b                   	pop    %ebx
    b071:	5e                   	pop    %esi
    b072:	5f                   	pop    %edi
    b073:	5d                   	pop    %ebp
    b074:	c3                   	ret    

0000b075 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    b075:	55                   	push   %ebp
    b076:	89 e5                	mov    %esp,%ebp
    b078:	57                   	push   %edi
    b079:	56                   	push   %esi
    b07a:	53                   	push   %ebx
    b07b:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    b07e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    b085:	a1 48 ff 00 00       	mov    0xff48,%eax
    b08a:	85 c0                	test   %eax,%eax
    b08c:	74 6f                	je     b0fd <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    b08e:	c7 44 24 04 e0 e1 00 	movl   $0xe1e0,0x4(%esp)
    b095:	00 
    b096:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    b09d:	e8 15 a8 ff ff       	call   58b7 <mem_alloc>
    b0a2:	a3 40 2d 01 00       	mov    %eax,0x12d40
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    b0a7:	c7 44 24 04 e3 e1 00 	movl   $0xe1e3,0x4(%esp)
    b0ae:	00 
    b0af:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    b0b6:	e8 fc a7 ff ff       	call   58b7 <mem_alloc>
    b0bb:	a3 44 2d 01 00       	mov    %eax,0x12d44
		create_syn_filter(*filter);
    b0c0:	a1 44 2d 01 00       	mov    0x12d44,%eax
    b0c5:	89 04 24             	mov    %eax,(%esp)
    b0c8:	e8 30 fe ff ff       	call   aefd <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    b0cd:	c7 44 24 04 e6 e1 00 	movl   $0xe1e6,0x4(%esp)
    b0d4:	00 
    b0d5:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    b0dc:	e8 d6 a7 ff ff       	call   58b7 <mem_alloc>
    b0e1:	a3 48 2d 01 00       	mov    %eax,0x12d48
		read_syn_window(window);
    b0e6:	a1 48 2d 01 00       	mov    0x12d48,%eax
    b0eb:	89 04 24             	mov    %eax,(%esp)
    b0ee:	e8 4a ff ff ff       	call   b03d <read_syn_window>
		init = 0;
    b0f3:	c7 05 48 ff 00 00 00 	movl   $0x0,0xff48
    b0fa:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    b0fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    b100:	8b 04 85 4c ff 00 00 	mov    0xff4c(,%eax,4),%eax
    b107:	83 e8 40             	sub    $0x40,%eax
    b10a:	25 ff 03 00 00       	and    $0x3ff,%eax
    b10f:	89 c2                	mov    %eax,%edx
    b111:	8b 45 0c             	mov    0xc(%ebp),%eax
    b114:	89 14 85 4c ff 00 00 	mov    %edx,0xff4c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    b11b:	8b 15 40 2d 01 00    	mov    0x12d40,%edx
    b121:	8b 45 0c             	mov    0xc(%ebp),%eax
    b124:	8b 04 85 4c ff 00 00 	mov    0xff4c(,%eax,4),%eax
    b12b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b12e:	c1 e1 0a             	shl    $0xa,%ecx
    b131:	01 c8                	add    %ecx,%eax
    b133:	c1 e0 03             	shl    $0x3,%eax
    b136:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    b139:	bb 00 00 00 00       	mov    $0x0,%ebx
    b13e:	eb 40                	jmp    b180 <SubBandSynthesis+0x10b>
		sum = 0;
    b140:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    b142:	be 00 00 00 00       	mov    $0x0,%esi
    b147:	eb 26                	jmp    b16f <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    b149:	89 f0                	mov    %esi,%eax
    b14b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b152:	8b 45 08             	mov    0x8(%ebp),%eax
    b155:	01 d0                	add    %edx,%eax
    b157:	dd 00                	fldl   (%eax)
    b159:	a1 44 2d 01 00       	mov    0x12d44,%eax
    b15e:	89 da                	mov    %ebx,%edx
    b160:	c1 e2 05             	shl    $0x5,%edx
    b163:	01 f2                	add    %esi,%edx
    b165:	dd 04 d0             	fldl   (%eax,%edx,8)
    b168:	de c9                	fmulp  %st,%st(1)
    b16a:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    b16c:	83 c6 01             	add    $0x1,%esi
    b16f:	83 fe 1f             	cmp    $0x1f,%esi
    b172:	7e d5                	jle    b149 <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    b174:	89 d8                	mov    %ebx,%eax
    b176:	c1 e0 03             	shl    $0x3,%eax
    b179:	01 f8                	add    %edi,%eax
    b17b:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    b17d:	83 c3 01             	add    $0x1,%ebx
    b180:	83 fb 3f             	cmp    $0x3f,%ebx
    b183:	7e bb                	jle    b140 <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b185:	bf 00 00 00 00       	mov    $0x0,%edi
    b18a:	e9 c7 00 00 00       	jmp    b256 <SubBandSynthesis+0x1e1>
		sum = 0;
    b18f:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    b191:	bb 00 00 00 00       	mov    $0x0,%ebx
    b196:	eb 4c                	jmp    b1e4 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    b198:	89 d8                	mov    %ebx,%eax
    b19a:	c1 e0 05             	shl    $0x5,%eax
    b19d:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b1a0:	a1 48 2d 01 00       	mov    0x12d48,%eax
    b1a5:	89 f2                	mov    %esi,%edx
    b1a7:	c1 e2 03             	shl    $0x3,%edx
    b1aa:	01 d0                	add    %edx,%eax
    b1ac:	dd 00                	fldl   (%eax)
    b1ae:	a1 40 2d 01 00       	mov    0x12d40,%eax
    b1b3:	8d 53 01             	lea    0x1(%ebx),%edx
    b1b6:	d1 fa                	sar    %edx
    b1b8:	c1 e2 06             	shl    $0x6,%edx
    b1bb:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    b1be:	8b 55 0c             	mov    0xc(%ebp),%edx
    b1c1:	8b 14 95 4c ff 00 00 	mov    0xff4c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b1c8:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    b1ca:	89 d1                	mov    %edx,%ecx
    b1cc:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b1d2:	8b 55 0c             	mov    0xc(%ebp),%edx
    b1d5:	c1 e2 0a             	shl    $0xa,%edx
    b1d8:	01 ca                	add    %ecx,%edx
    b1da:	dd 04 d0             	fldl   (%eax,%edx,8)
    b1dd:	de c9                	fmulp  %st,%st(1)
    b1df:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    b1e1:	83 c3 01             	add    $0x1,%ebx
    b1e4:	83 fb 0f             	cmp    $0xf,%ebx
    b1e7:	7e af                	jle    b198 <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    b1e9:	dd 05 80 e2 00 00    	fldl   0xe280
    b1ef:	de c9                	fmulp  %st,%st(1)
    b1f1:	d9 7d d6             	fnstcw -0x2a(%ebp)
    b1f4:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    b1f8:	b4 0c                	mov    $0xc,%ah
    b1fa:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    b1fe:	d9 6d d4             	fldcw  -0x2c(%ebp)
    b201:	db 5d e0             	fistpl -0x20(%ebp)
    b204:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    b207:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    b20e:	7e 15                	jle    b225 <SubBandSynthesis+0x1b0>
    b210:	89 f8                	mov    %edi,%eax
    b212:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b215:	8b 45 10             	mov    0x10(%ebp),%eax
    b218:	01 d0                	add    %edx,%eax
    b21a:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    b21f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b223:	eb 2e                	jmp    b253 <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    b225:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    b22c:	7d 15                	jge    b243 <SubBandSynthesis+0x1ce>
    b22e:	89 f8                	mov    %edi,%eax
    b230:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b233:	8b 45 10             	mov    0x10(%ebp),%eax
    b236:	01 d0                	add    %edx,%eax
    b238:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    b23d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b241:	eb 10                	jmp    b253 <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    b243:	89 f8                	mov    %edi,%eax
    b245:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b248:	8b 45 10             	mov    0x10(%ebp),%eax
    b24b:	01 c2                	add    %eax,%edx
    b24d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b250:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b253:	83 c7 01             	add    $0x1,%edi
    b256:	83 ff 1f             	cmp    $0x1f,%edi
    b259:	0f 8e 30 ff ff ff    	jle    b18f <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    b25f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    b262:	83 c4 2c             	add    $0x2c,%esp
    b265:	5b                   	pop    %ebx
    b266:	5e                   	pop    %esi
    b267:	5f                   	pop    %edi
    b268:	5d                   	pop    %ebp
    b269:	c3                   	ret    

0000b26a <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    b26a:	55                   	push   %ebp
    b26b:	89 e5                	mov    %esp,%ebp
    b26d:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    b270:	8b 45 10             	mov    0x10(%ebp),%eax
    b273:	8b 40 08             	mov    0x8(%eax),%eax
    b276:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b279:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    b280:	eb 75                	jmp    b2f7 <out_fifo+0x8d>
    b282:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    b289:	eb 62                	jmp    b2ed <out_fifo+0x83>
            (*psampFrames)++;
    b28b:	8b 45 14             	mov    0x14(%ebp),%eax
    b28e:	8b 00                	mov    (%eax),%eax
    b290:	8d 50 01             	lea    0x1(%eax),%edx
    b293:	8b 45 14             	mov    0x14(%ebp),%eax
    b296:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    b298:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b29f:	eb 40                	jmp    b2e1 <out_fifo+0x77>
                if (!(k%1600) && k) {
    b2a1:	8b 0d 4c 2d 01 00    	mov    0x12d4c,%ecx
    b2a7:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    b2ac:	89 c8                	mov    %ecx,%eax
    b2ae:	f7 ea                	imul   %edx
    b2b0:	c1 fa 09             	sar    $0x9,%edx
    b2b3:	89 c8                	mov    %ecx,%eax
    b2b5:	c1 f8 1f             	sar    $0x1f,%eax
    b2b8:	29 c2                	sub    %eax,%edx
    b2ba:	89 d0                	mov    %edx,%eax
    b2bc:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    b2c2:	29 c1                	sub    %eax,%ecx
    b2c4:	89 c8                	mov    %ecx,%eax
    b2c6:	85 c0                	test   %eax,%eax
    b2c8:	75 13                	jne    b2dd <out_fifo+0x73>
    b2ca:	a1 4c 2d 01 00       	mov    0x12d4c,%eax
    b2cf:	85 c0                	test   %eax,%eax
    b2d1:	74 0a                	je     b2dd <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    b2d3:	c7 05 4c 2d 01 00 00 	movl   $0x0,0x12d4c
    b2da:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    b2dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b2e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b2e4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b2e7:	7c b8                	jl     b2a1 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b2e9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    b2ed:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    b2f1:	7e 98                	jle    b28b <out_fifo+0x21>
    b2f3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    b2f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    b2fa:	3b 45 0c             	cmp    0xc(%ebp),%eax
    b2fd:	7c 83                	jl     b282 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    b2ff:	c9                   	leave  
    b300:	c3                   	ret    

0000b301 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    b301:	55                   	push   %ebp
    b302:	89 e5                	mov    %esp,%ebp
    b304:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    b307:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    b30e:	00 
    b30f:	8b 45 08             	mov    0x8(%ebp),%eax
    b312:	89 04 24             	mov    %eax,(%esp)
    b315:	e8 8b a8 ff ff       	call   5ba5 <getbits>
    b31a:	8b 55 0c             	mov    0xc(%ebp),%edx
    b31d:	89 02                	mov    %eax,(%edx)
}
    b31f:	c9                   	leave  
    b320:	c3                   	ret    

0000b321 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    b321:	55                   	push   %ebp
    b322:	89 e5                	mov    %esp,%ebp
    b324:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b327:	8b 45 08             	mov    0x8(%ebp),%eax
    b32a:	8b 40 0c             	mov    0xc(%eax),%eax
    b32d:	83 c0 1e             	add    $0x1e,%eax
    b330:	8b 14 85 a0 fa 00 00 	mov    0xfaa0(,%eax,4),%edx
    b337:	89 d0                	mov    %edx,%eax
    b339:	c1 e0 03             	shl    $0x3,%eax
    b33c:	01 d0                	add    %edx,%eax
    b33e:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    b341:	89 45 ec             	mov    %eax,-0x14(%ebp)
    b344:	db 45 ec             	fildl  -0x14(%ebp)
    b347:	8b 45 08             	mov    0x8(%ebp),%eax
    b34a:	8b 40 10             	mov    0x10(%eax),%eax
    b34d:	dd 04 c5 60 fb 00 00 	fldl   0xfb60(,%eax,8)
    b354:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b356:	d9 7d ea             	fnstcw -0x16(%ebp)
    b359:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    b35d:	b4 0c                	mov    $0xc,%ah
    b35f:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    b363:	d9 6d e8             	fldcw  -0x18(%ebp)
    b366:	db 5d fc             	fistpl -0x4(%ebp)
    b369:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    b36c:	8b 45 08             	mov    0x8(%ebp),%eax
    b36f:	8b 40 14             	mov    0x14(%eax),%eax
    b372:	85 c0                	test   %eax,%eax
    b374:	74 04                	je     b37a <main_data_slots+0x59>
    b376:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    b37a:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    b37e:	8b 45 08             	mov    0x8(%ebp),%eax
    b381:	8b 40 08             	mov    0x8(%eax),%eax
    b384:	85 c0                	test   %eax,%eax
    b386:	74 04                	je     b38c <main_data_slots+0x6b>
		nSlots -= 2;
    b388:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    b38c:	8b 45 10             	mov    0x10(%ebp),%eax
    b38f:	83 f8 01             	cmp    $0x1,%eax
    b392:	75 06                	jne    b39a <main_data_slots+0x79>
		nSlots -= 17;
    b394:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    b398:	eb 04                	jmp    b39e <main_data_slots+0x7d>
	else
		nSlots -=32;
    b39a:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    b39e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    b3a1:	c9                   	leave  
    b3a2:	c3                   	ret    
