
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
      7c:	05 ac 3b 01 00       	add    $0x13bac,%eax
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
      8e:	c7 05 c0 3b 01 00 00 	movl   $0x0,0x13bc0
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
      a8:	e8 ca 53 00 00       	call   5477 <malloc>
      ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      b0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
      b7:	e8 bb 53 00 00       	call   5477 <malloc>
      bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
      bf:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
      c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c5:	8b 40 14             	mov    0x14(%eax),%eax
      c8:	8b 55 1c             	mov    0x1c(%ebp),%edx
      cb:	89 54 24 04          	mov    %edx,0x4(%esp)
      cf:	89 04 24             	mov    %eax,(%esp)
      d2:	e8 89 4c 00 00       	call   4d60 <strcpy>
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
      f7:	8b 15 90 04 01 00    	mov    0x10490,%edx
      fd:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     100:	8d 45 d8             	lea    -0x28(%ebp),%eax
     103:	89 54 24 10          	mov    %edx,0x10(%esp)
     107:	8b 15 a0 3b 01 00    	mov    0x13ba0,%edx
     10d:	89 54 24 04          	mov    %edx,0x4(%esp)
     111:	8b 15 a4 3b 01 00    	mov    0x13ba4,%edx
     117:	89 54 24 08          	mov    %edx,0x8(%esp)
     11b:	8b 15 a8 3b 01 00    	mov    0x13ba8,%edx
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
     148:	8b 15 8c 04 01 00    	mov    0x1048c,%edx
     14e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     151:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     154:	8b 45 f4             	mov    -0xc(%ebp),%eax
     157:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     15e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     161:	a3 8c 04 01 00       	mov    %eax,0x1048c
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
     171:	a1 8c 04 01 00       	mov    0x1048c,%eax
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
     193:	e8 a6 51 00 00       	call   533e <free>
		free(temp);
     198:	8b 45 f0             	mov    -0x10(%ebp),%eax
     19b:	89 04 24             	mov    %eax,(%esp)
     19e:	e8 9b 51 00 00       	call   533e <free>
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
     1a9:	c7 05 8c 04 01 00 00 	movl   $0x0,0x1048c
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
     1c1:	e8 09 4c 00 00       	call   4dcf <strlen>
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
     255:	c7 05 90 04 01 00 00 	movl   $0x0,0x10490
     25c:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     25f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     266:	00 
     267:	8b 45 08             	mov    0x8(%ebp),%eax
     26a:	89 04 24             	mov    %eax,(%esp)
     26d:	e8 71 4d 00 00       	call   4fe3 <open>
     272:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     275:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     279:	79 20                	jns    29b <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     27b:	8b 45 08             	mov    0x8(%ebp),%eax
     27e:	89 44 24 08          	mov    %eax,0x8(%esp)
     282:	c7 44 24 04 00 b8 00 	movl   $0xb800,0x4(%esp)
     289:	00 
     28a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     291:	e8 f5 4e 00 00       	call   518b <printf>
		return;
     296:	e9 8f 02 00 00       	jmp    52a <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     29b:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     2a1:	89 44 24 04          	mov    %eax,0x4(%esp)
     2a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2a8:	89 04 24             	mov    %eax,(%esp)
     2ab:	e8 4b 4d 00 00       	call   4ffb <fstat>
     2b0:	85 c0                	test   %eax,%eax
     2b2:	79 2b                	jns    2df <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     2b4:	8b 45 08             	mov    0x8(%ebp),%eax
     2b7:	89 44 24 08          	mov    %eax,0x8(%esp)
     2bb:	c7 44 24 04 14 b8 00 	movl   $0xb814,0x4(%esp)
     2c2:	00 
     2c3:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2ca:	e8 bc 4e 00 00       	call   518b <printf>
		close(fd);
     2cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2d2:	89 04 24             	mov    %eax,(%esp)
     2d5:	e8 f1 4c 00 00       	call   4fcb <close>
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
     326:	c7 44 24 04 28 b8 00 	movl   $0xb828,0x4(%esp)
     32d:	00 
     32e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     335:	e8 51 4e 00 00       	call   518b <printf>
		break;
     33a:	e9 e0 01 00 00       	jmp    51f <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     33f:	8b 45 08             	mov    0x8(%ebp),%eax
     342:	89 04 24             	mov    %eax,(%esp)
     345:	e8 85 4a 00 00       	call   4dcf <strlen>
     34a:	83 c0 10             	add    $0x10,%eax
     34d:	3d 00 02 00 00       	cmp    $0x200,%eax
     352:	76 19                	jbe    36d <list+0x124>
			printf(1, "ls: path too long\n");
     354:	c7 44 24 04 35 b8 00 	movl   $0xb835,0x4(%esp)
     35b:	00 
     35c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     363:	e8 23 4e 00 00       	call   518b <printf>
			break;
     368:	e9 b2 01 00 00       	jmp    51f <list+0x2d6>
		}
		strcpy(buf, path);
     36d:	8b 45 08             	mov    0x8(%ebp),%eax
     370:	89 44 24 04          	mov    %eax,0x4(%esp)
     374:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     37a:	89 04 24             	mov    %eax,(%esp)
     37d:	e8 de 49 00 00       	call   4d60 <strcpy>
		p = buf + strlen(buf);
     382:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     388:	89 04 24             	mov    %eax,(%esp)
     38b:	e8 3f 4a 00 00       	call   4dcf <strlen>
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
     3d8:	e8 81 4b 00 00       	call   4f5e <memmove>
			p[DIRSIZ] = 0;
     3dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
     3e0:	83 c0 0e             	add    $0xe,%eax
     3e3:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     3e6:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     3ec:	89 44 24 04          	mov    %eax,0x4(%esp)
     3f0:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3f6:	89 04 24             	mov    %eax,(%esp)
     3f9:	e8 c5 4a 00 00       	call   4ec3 <stat>
     3fe:	85 c0                	test   %eax,%eax
     400:	79 23                	jns    425 <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     402:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     408:	89 44 24 08          	mov    %eax,0x8(%esp)
     40c:	c7 44 24 04 14 b8 00 	movl   $0xb814,0x4(%esp)
     413:	00 
     414:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     41b:	e8 6b 4d 00 00       	call   518b <printf>
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
     451:	8b 15 90 04 01 00    	mov    0x10490,%edx
     457:	8d 45 d0             	lea    -0x30(%ebp),%eax
     45a:	89 54 24 10          	mov    %edx,0x10(%esp)
     45e:	8b 15 a0 3b 01 00    	mov    0x13ba0,%edx
     464:	89 54 24 04          	mov    %edx,0x4(%esp)
     468:	8b 15 a4 3b 01 00    	mov    0x13ba4,%edx
     46e:	89 54 24 08          	mov    %edx,0x8(%esp)
     472:	8b 15 a8 3b 01 00    	mov    0x13ba8,%edx
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
     4eb:	a1 90 04 01 00       	mov    0x10490,%eax
     4f0:	83 c0 01             	add    $0x1,%eax
     4f3:	a3 90 04 01 00       	mov    %eax,0x10490
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
     510:	e8 a6 4a 00 00       	call   4fbb <read>
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
     525:	e8 a1 4a 00 00       	call   4fcb <close>
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
     594:	e8 69 2c 00 00       	call   3202 <fill_rect>
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
     5df:	e8 1e 2c 00 00       	call   3202 <fill_rect>
	}
	if (style == ICON_STYLE) {
     5e4:	a1 24 fb 00 00       	mov    0xfb24,%eax
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
     619:	a1 68 fb 00 00       	mov    0xfb68,%eax
     61e:	89 44 24 0c          	mov    %eax,0xc(%esp)
     622:	a1 6c fb 00 00       	mov    0xfb6c,%eax
     627:	89 44 24 10          	mov    %eax,0x10(%esp)
     62b:	a1 70 fb 00 00       	mov    0xfb70,%eax
     630:	89 44 24 14          	mov    %eax,0x14(%esp)
     634:	8b 45 08             	mov    0x8(%ebp),%eax
     637:	89 04 24             	mov    %eax,(%esp)
     63a:	8b 45 0c             	mov    0xc(%ebp),%eax
     63d:	89 44 24 04          	mov    %eax,0x4(%esp)
     641:	8b 45 10             	mov    0x10(%ebp),%eax
     644:	89 44 24 08          	mov    %eax,0x8(%esp)
     648:	e8 54 32 00 00       	call   38a1 <draw_picture>
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
     663:	a1 d0 fb 00 00       	mov    0xfbd0,%eax
     668:	89 44 24 0c          	mov    %eax,0xc(%esp)
     66c:	a1 d4 fb 00 00       	mov    0xfbd4,%eax
     671:	89 44 24 10          	mov    %eax,0x10(%esp)
     675:	a1 d8 fb 00 00       	mov    0xfbd8,%eax
     67a:	89 44 24 14          	mov    %eax,0x14(%esp)
     67e:	8b 45 08             	mov    0x8(%ebp),%eax
     681:	89 04 24             	mov    %eax,(%esp)
     684:	8b 45 0c             	mov    0xc(%ebp),%eax
     687:	89 44 24 04          	mov    %eax,0x4(%esp)
     68b:	8b 45 10             	mov    0x10(%ebp),%eax
     68e:	89 44 24 08          	mov    %eax,0x8(%esp)
     692:	e8 0a 32 00 00       	call   38a1 <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     697:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     698:	8b 45 14             	mov    0x14(%ebp),%eax
     69b:	89 04 24             	mov    %eax,(%esp)
     69e:	e8 2c 47 00 00       	call   4dcf <strlen>
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
     6fb:	e8 e1 30 00 00       	call   37e1 <puts_str>
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
     730:	a1 9c fb 00 00       	mov    0xfb9c,%eax
     735:	89 44 24 0c          	mov    %eax,0xc(%esp)
     739:	a1 a0 fb 00 00       	mov    0xfba0,%eax
     73e:	89 44 24 10          	mov    %eax,0x10(%esp)
     742:	a1 a4 fb 00 00       	mov    0xfba4,%eax
     747:	89 44 24 14          	mov    %eax,0x14(%esp)
     74b:	8b 45 08             	mov    0x8(%ebp),%eax
     74e:	89 04 24             	mov    %eax,(%esp)
     751:	8b 45 0c             	mov    0xc(%ebp),%eax
     754:	89 44 24 04          	mov    %eax,0x4(%esp)
     758:	8b 45 10             	mov    0x10(%ebp),%eax
     75b:	89 44 24 08          	mov    %eax,0x8(%esp)
     75f:	e8 3d 31 00 00       	call   38a1 <draw_picture>
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
     7ac:	e8 30 30 00 00       	call   37e1 <puts_str>
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
     7c7:	a1 04 fc 00 00       	mov    0xfc04,%eax
     7cc:	89 44 24 0c          	mov    %eax,0xc(%esp)
     7d0:	a1 08 fc 00 00       	mov    0xfc08,%eax
     7d5:	89 44 24 10          	mov    %eax,0x10(%esp)
     7d9:	a1 0c fc 00 00       	mov    0xfc0c,%eax
     7de:	89 44 24 14          	mov    %eax,0x14(%esp)
     7e2:	8b 45 08             	mov    0x8(%ebp),%eax
     7e5:	89 04 24             	mov    %eax,(%esp)
     7e8:	8b 45 0c             	mov    0xc(%ebp),%eax
     7eb:	89 44 24 04          	mov    %eax,0x4(%esp)
     7ef:	8b 45 10             	mov    0x10(%ebp),%eax
     7f2:	89 44 24 08          	mov    %eax,0x8(%esp)
     7f6:	e8 a6 30 00 00       	call   38a1 <draw_picture>
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
     833:	e8 a9 2f 00 00       	call   37e1 <puts_str>
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
     84c:	e8 26 4c 00 00       	call   5477 <malloc>
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
				- (BUTTON_HEIGHT + 3) }, { "cut.bmp",
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
     9e3:	e8 8f 2f 00 00       	call   3977 <draw_line>
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
     a2a:	e8 48 2f 00 00       	call   3977 <draw_line>
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
     a71:	e8 01 2f 00 00       	call   3977 <draw_line>
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
     ab4:	e8 be 2e 00 00       	call   3977 <draw_line>
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
     af7:	e8 06 27 00 00       	call   3202 <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     afc:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     b03:	00 
     b04:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     b0b:	00 
     b0c:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     b13:	00 
     b14:	c7 44 24 0c 48 b8 00 	movl   $0xb848,0xc(%esp)
     b1b:	00 
     b1c:	8b 45 08             	mov    0x8(%ebp),%eax
     b1f:	89 04 24             	mov    %eax,(%esp)
     b22:	8b 45 0c             	mov    0xc(%ebp),%eax
     b25:	89 44 24 04          	mov    %eax,0x4(%esp)
     b29:	8b 45 10             	mov    0x10(%ebp),%eax
     b2c:	89 44 24 08          	mov    %eax,0x8(%esp)
     b30:	e8 ac 2c 00 00       	call   37e1 <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     b35:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
     b3c:	00 
     b3d:	c7 44 24 0c 20 fc 00 	movl   $0xfc20,0xc(%esp)
     b44:	00 
     b45:	8b 45 08             	mov    0x8(%ebp),%eax
     b48:	89 04 24             	mov    %eax,(%esp)
     b4b:	8b 45 0c             	mov    0xc(%ebp),%eax
     b4e:	89 44 24 04          	mov    %eax,0x4(%esp)
     b52:	8b 45 10             	mov    0x10(%ebp),%eax
     b55:	89 44 24 08          	mov    %eax,0x8(%esp)
     b59:	e8 f4 31 00 00       	call   3d52 <draw_iconlist>
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     b5e:	c7 44 24 18 23 00 00 	movl   $0x23,0x18(%esp)
     b65:	00 
     b66:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
     b6d:	00 
     b6e:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     b75:	00 
     b76:	c7 44 24 0c ac 3b 01 	movl   $0x13bac,0xc(%esp)
     b7d:	00 
     b7e:	8b 45 08             	mov    0x8(%ebp),%eax
     b81:	89 04 24             	mov    %eax,(%esp)
     b84:	8b 45 0c             	mov    0xc(%ebp),%eax
     b87:	89 44 24 04          	mov    %eax,0x4(%esp)
     b8b:	8b 45 10             	mov    0x10(%ebp),%eax
     b8e:	89 44 24 08          	mov    %eax,0x8(%esp)
     b92:	e8 4a 2c 00 00       	call   37e1 <puts_str>
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
     bae:	a1 24 fb 00 00       	mov    0xfb24,%eax
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
     bff:	e8 fe 25 00 00       	call   3202 <fill_rect>
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
     c46:	e8 2c 2d 00 00       	call   3977 <draw_line>

	//printf(0, "listing complete!\n");
	//printItemList();
//	p = fileItemList;
//	q = 0;
	if (keyContent.length == 0) {
     c4b:	a1 c0 3b 01 00       	mov    0x13bc0,%eax
     c50:	85 c0                	test   %eax,%eax
     c52:	0f 85 a3 00 00 00    	jne    cfb <drawFinderContent+0x162>
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
     c58:	c7 44 24 04 50 b8 00 	movl   $0xb850,0x4(%esp)
     c5f:	00 
     c60:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c67:	e8 1f 45 00 00       	call   518b <printf>
//		freeFileItemList();
//		list(".");
		p = fileItemList;
     c6c:	a1 8c 04 01 00       	mov    0x1048c,%eax
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
     cfb:	a1 8c 04 01 00       	mov    0x1048c,%eax
     d00:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while(p != 0) {
     d03:	e9 ed 00 00 00       	jmp    df5 <drawFinderContent+0x25c>
			printf(0, "now you are searching!\n");
     d08:	c7 44 24 04 a9 b8 00 	movl   $0xb8a9,0x4(%esp)
     d0f:	00 
     d10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d17:	e8 6f 44 00 00       	call   518b <printf>
		   	if (strstr(p->name, keyContent.content)) {
     d1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d1f:	8b 40 14             	mov    0x14(%eax),%eax
     d22:	c7 44 24 04 ac 3b 01 	movl   $0x13bac,0x4(%esp)
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
     dd8:	c7 44 24 04 c4 b8 00 	movl   $0xb8c4,0x4(%esp)
     ddf:	00 
     de0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     de7:	e8 9f 43 00 00       	call   518b <printf>
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
     dff:	a1 24 fb 00 00       	mov    0xfb24,%eax
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
     e49:	e8 b4 23 00 00       	call   3202 <fill_rect>
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
     e8a:	e8 73 23 00 00       	call   3202 <fill_rect>
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
     ecf:	e8 2e 23 00 00       	call   3202 <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     ed4:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     edb:	00 
     edc:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
     ee3:	00 
     ee4:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     eeb:	00 
     eec:	c7 44 24 0c e5 b8 00 	movl   $0xb8e5,0xc(%esp)
     ef3:	00 
     ef4:	8b 45 08             	mov    0x8(%ebp),%eax
     ef7:	89 04 24             	mov    %eax,(%esp)
     efa:	8b 45 0c             	mov    0xc(%ebp),%eax
     efd:	89 44 24 04          	mov    %eax,0x4(%esp)
     f01:	8b 45 10             	mov    0x10(%ebp),%eax
     f04:	89 44 24 08          	mov    %eax,0x8(%esp)
     f08:	e8 d4 28 00 00       	call   37e1 <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     f0d:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     f14:	00 
     f15:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
     f1c:	00 
     f1d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     f24:	00 
     f25:	c7 44 24 0c ea b8 00 	movl   $0xb8ea,0xc(%esp)
     f2c:	00 
     f2d:	8b 45 08             	mov    0x8(%ebp),%eax
     f30:	89 04 24             	mov    %eax,(%esp)
     f33:	8b 45 0c             	mov    0xc(%ebp),%eax
     f36:	89 44 24 04          	mov    %eax,0x4(%esp)
     f3a:	8b 45 10             	mov    0x10(%ebp),%eax
     f3d:	89 44 24 08          	mov    %eax,0x8(%esp)
     f41:	e8 9b 28 00 00       	call   37e1 <puts_str>
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
     f60:	e8 12 45 00 00       	call   5477 <malloc>
     f65:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     f68:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     f6f:	e8 03 45 00 00       	call   5477 <malloc>
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
    1021:	e8 18 43 00 00       	call   533e <free>
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
    1035:	a1 8c 04 01 00       	mov    0x1048c,%eax
    103a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    103d:	eb 27                	jmp    1066 <printItemList+0x37>
		printf(0, "%s\n", p->name);
    103f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1042:	8b 40 14             	mov    0x14(%eax),%eax
    1045:	89 44 24 08          	mov    %eax,0x8(%esp)
    1049:	c7 44 24 04 ef b8 00 	movl   $0xb8ef,0x4(%esp)
    1050:	00 
    1051:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1058:	e8 2e 41 00 00       	call   518b <printf>
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
    1074:	a1 24 fb 00 00       	mov    0xfb24,%eax
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
    10cc:	8b 15 80 04 01 00    	mov    0x10480,%edx
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
    10f8:	e8 4f 35 00 00       	call   464c <initRect>
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
    1112:	a1 80 04 01 00       	mov    0x10480,%eax
    1117:	01 c2                	add    %eax,%edx
    1119:	8b 45 08             	mov    0x8(%ebp),%eax
    111c:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    1123:	00 
    1124:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1128:	89 54 24 08          	mov    %edx,0x8(%esp)
    112c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1133:	00 
    1134:	89 04 24             	mov    %eax,(%esp)
    1137:	e8 10 35 00 00       	call   464c <initRect>
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
    114c:	a1 24 fb 00 00       	mov    0xfb24,%eax
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
    1183:	c7 44 24 18 84 26 00 	movl   $0x2684,0x18(%esp)
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
    11b5:	e8 7e 35 00 00       	call   4738 <createClickable>
		break;
    11ba:	e9 84 00 00 00       	jmp    1243 <addItemEvent+0xfd>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    11bf:	c7 44 24 18 84 26 00 	movl   $0x2684,0x18(%esp)
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
    11f1:	e8 42 35 00 00       	call   4738 <createClickable>
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
    1228:	e8 0b 35 00 00       	call   4738 <createClickable>
		break;
    122d:	eb 14                	jmp    1243 <addItemEvent+0xfd>
	default:
		printf(0, "unknown file type!");
    122f:	c7 44 24 04 f3 b8 00 	movl   $0xb8f3,0x4(%esp)
    1236:	00 
    1237:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    123e:	e8 48 3f 00 00       	call   518b <printf>
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
    124b:	a1 8c 04 01 00       	mov    0x1048c,%eax
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
    12ec:	8b 1c 85 40 ff 00 00 	mov    0xff40(,%eax,4),%ebx
    12f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12f6:	6b c0 34             	imul   $0x34,%eax,%eax
    12f9:	05 40 fc 00 00       	add    $0xfc40,%eax
    12fe:	8b 78 10             	mov    0x10(%eax),%edi
    1301:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1304:	6b c0 34             	imul   $0x34,%eax,%eax
    1307:	05 40 fc 00 00       	add    $0xfc40,%eax
    130c:	8b 70 0c             	mov    0xc(%eax),%esi
    130f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1312:	6b c0 34             	imul   $0x34,%eax,%eax
    1315:	05 40 fc 00 00       	add    $0xfc40,%eax
    131a:	8b 48 04             	mov    0x4(%eax),%ecx
    131d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1320:	6b c0 34             	imul   $0x34,%eax,%eax
    1323:	05 40 fc 00 00       	add    $0xfc40,%eax
    1328:	8b 10                	mov    (%eax),%edx
    132a:	8d 45 d0             	lea    -0x30(%ebp),%eax
    132d:	89 7c 24 10          	mov    %edi,0x10(%esp)
    1331:	89 74 24 0c          	mov    %esi,0xc(%esp)
    1335:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1339:	89 54 24 04          	mov    %edx,0x4(%esp)
    133d:	89 04 24             	mov    %eax,(%esp)
    1340:	e8 07 33 00 00       	call   464c <initRect>
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
    1376:	e8 bd 33 00 00       	call   4738 <createClickable>
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
    1399:	a1 8c 04 01 00       	mov    0x1048c,%eax
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
    13cf:	e8 d3 32 00 00       	call   46a7 <isIn>
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
    13f6:	c7 05 80 32 01 00 01 	movl   $0x1,0x13280
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
    1408:	a1 8c 04 01 00       	mov    0x1048c,%eax
    140d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
    1410:	a1 24 fb 00 00       	mov    0xfb24,%eax
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
    1434:	a1 80 04 01 00       	mov    0x10480,%eax
    1439:	83 e8 1e             	sub    $0x1e,%eax
    143c:	a3 80 04 01 00       	mov    %eax,0x10480
    1441:	eb 5d                	jmp    14a0 <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
    1443:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1446:	8b 40 1c             	mov    0x1c(%eax),%eax
    1449:	ba 63 01 00 00       	mov    $0x163,%edx
    144e:	29 c2                	sub    %eax,%edx
    1450:	a1 80 04 01 00       	mov    0x10480,%eax
    1455:	01 d0                	add    %edx,%eax
    1457:	a3 80 04 01 00       	mov    %eax,0x10480
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
    1478:	a1 80 04 01 00       	mov    0x10480,%eax
    147d:	83 e8 1e             	sub    $0x1e,%eax
    1480:	a3 80 04 01 00       	mov    %eax,0x10480
    1485:	eb 19                	jmp    14a0 <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    1487:	8b 45 f4             	mov    -0xc(%ebp),%eax
    148a:	8b 40 1c             	mov    0x1c(%eax),%eax
    148d:	ba a4 01 00 00       	mov    $0x1a4,%edx
    1492:	29 c2                	sub    %eax,%edx
    1494:	a1 80 04 01 00       	mov    0x10480,%eax
    1499:	01 d0                	add    %edx,%eax
    149b:	a3 80 04 01 00       	mov    %eax,0x10480
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    14a0:	a1 80 04 01 00       	mov    0x10480,%eax
    14a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    14a9:	c7 44 24 04 08 b9 00 	movl   $0xb908,0x4(%esp)
    14b0:	00 
    14b1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    14b8:	e8 ce 3c 00 00       	call   518b <printf>
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
    14cf:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    14d6:	e8 6e ed ff ff       	call   249 <list>
	drawFinderContent(context);
    14db:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    14e0:	89 04 24             	mov    %eax,(%esp)
    14e3:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    14e8:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ec:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    14f1:	89 44 24 08          	mov    %eax,0x8(%esp)
    14f5:	e8 9f f6 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    14fa:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    14ff:	89 04 24             	mov    %eax,(%esp)
    1502:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    1507:	89 44 24 04          	mov    %eax,0x4(%esp)
    150b:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
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
    153f:	e8 08 31 00 00       	call   464c <initRect>
    1544:	83 ec 04             	sub    $0x4,%esp
    1547:	8b 45 e8             	mov    -0x18(%ebp),%eax
    154a:	89 44 24 04          	mov    %eax,0x4(%esp)
    154e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1551:	89 44 24 08          	mov    %eax,0x8(%esp)
    1555:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1558:	89 44 24 0c          	mov    %eax,0xc(%esp)
    155c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    155f:	89 44 24 10          	mov    %eax,0x10(%esp)
    1563:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    156a:	e8 e0 32 00 00       	call   484f <deleteClickable>
	addWndEvent(&cm);
    156f:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    1576:	e8 52 fd ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    157b:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
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
    158f:	a1 8c 04 01 00       	mov    0x1048c,%eax
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
    15ae:	a1 24 fb 00 00       	mov    0xfb24,%eax
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
    15ce:	a1 80 04 01 00       	mov    0x10480,%eax
    15d3:	83 c0 1e             	add    $0x1e,%eax
    15d6:	a3 80 04 01 00       	mov    %eax,0x10480
    15db:	eb 59                	jmp    1636 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
    15dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15e0:	8b 40 1c             	mov    0x1c(%eax),%eax
    15e3:	ba 46 00 00 00       	mov    $0x46,%edx
    15e8:	29 c2                	sub    %eax,%edx
    15ea:	a1 80 04 01 00       	mov    0x10480,%eax
    15ef:	01 d0                	add    %edx,%eax
    15f1:	a3 80 04 01 00       	mov    %eax,0x10480
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
    160e:	a1 80 04 01 00       	mov    0x10480,%eax
    1613:	83 c0 1e             	add    $0x1e,%eax
    1616:	a3 80 04 01 00       	mov    %eax,0x10480
    161b:	eb 19                	jmp    1636 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    161d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1620:	8b 40 1c             	mov    0x1c(%eax),%eax
    1623:	ba 62 00 00 00       	mov    $0x62,%edx
    1628:	29 c2                	sub    %eax,%edx
    162a:	a1 80 04 01 00       	mov    0x10480,%eax
    162f:	01 d0                	add    %edx,%eax
    1631:	a3 80 04 01 00       	mov    %eax,0x10480
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    1636:	a1 80 04 01 00       	mov    0x10480,%eax
    163b:	89 44 24 08          	mov    %eax,0x8(%esp)
    163f:	c7 44 24 04 29 b9 00 	movl   $0xb929,0x4(%esp)
    1646:	00 
    1647:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    164e:	e8 38 3b 00 00       	call   518b <printf>
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
    1665:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    166c:	e8 d8 eb ff ff       	call   249 <list>
	drawFinderContent(context);
    1671:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    1676:	89 04 24             	mov    %eax,(%esp)
    1679:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    167e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1682:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    1687:	89 44 24 08          	mov    %eax,0x8(%esp)
    168b:	e8 09 f5 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    1690:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    1695:	89 04 24             	mov    %eax,(%esp)
    1698:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    169d:	89 44 24 04          	mov    %eax,0x4(%esp)
    16a1:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
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
    16d5:	e8 72 2f 00 00       	call   464c <initRect>
    16da:	83 ec 04             	sub    $0x4,%esp
    16dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16e0:	89 44 24 04          	mov    %eax,0x4(%esp)
    16e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16e7:	89 44 24 08          	mov    %eax,0x8(%esp)
    16eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16ee:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16f5:	89 44 24 10          	mov    %eax,0x10(%esp)
    16f9:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    1700:	e8 4a 31 00 00       	call   484f <deleteClickable>
	addWndEvent(&cm);
    1705:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    170c:	e8 bc fb ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    1711:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
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
    172b:	e8 9f 36 00 00       	call   4dcf <strlen>
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
    1754:	c7 04 24 e0 3b 01 00 	movl   $0x13be0,(%esp)
    175b:	e8 6f 36 00 00       	call   4dcf <strlen>
    1760:	83 f8 01             	cmp    $0x1,%eax
    1763:	75 0b                	jne    1770 <updatePath+0x51>
    1765:	0f b6 05 e0 3b 01 00 	movzbl 0x13be0,%eax
    176c:	3c 2f                	cmp    $0x2f,%al
    176e:	74 4f                	je     17bf <updatePath+0xa0>
        {
            int tmpn = strlen(currentPath);
    1770:	c7 04 24 e0 3b 01 00 	movl   $0x13be0,(%esp)
    1777:	e8 53 36 00 00       	call   4dcf <strlen>
    177c:	89 45 ec             	mov    %eax,-0x14(%ebp)
            currentPath[tmpn - 1] = '\0';
    177f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1782:	83 e8 01             	sub    $0x1,%eax
    1785:	c6 80 e0 3b 01 00 00 	movb   $0x0,0x13be0(%eax)
            for (i = tmpn - 2; i > 0; i--)
    178c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    178f:	83 e8 02             	sub    $0x2,%eax
    1792:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1795:	eb 22                	jmp    17b9 <updatePath+0x9a>
            {
                if (currentPath[i] != '/')
    1797:	8b 45 f4             	mov    -0xc(%ebp),%eax
    179a:	05 e0 3b 01 00       	add    $0x13be0,%eax
    179f:	0f b6 00             	movzbl (%eax),%eax
    17a2:	3c 2f                	cmp    $0x2f,%al
    17a4:	74 11                	je     17b7 <updatePath+0x98>
                    currentPath[i] = '\0';
    17a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17a9:	05 e0 3b 01 00       	add    $0x13be0,%eax
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
    17c1:	c7 04 24 e0 3b 01 00 	movl   $0x13be0,(%esp)
    17c8:	e8 02 36 00 00       	call   4dcf <strlen>
    17cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
        strcpy(currentPath + tmpn, name);
    17d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17d3:	8d 90 e0 3b 01 00    	lea    0x13be0(%eax),%edx
    17d9:	8b 45 08             	mov    0x8(%ebp),%eax
    17dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    17e0:	89 14 24             	mov    %edx,(%esp)
    17e3:	e8 78 35 00 00       	call   4d60 <strcpy>
        tmpn = strlen(currentPath);
    17e8:	c7 04 24 e0 3b 01 00 	movl   $0x13be0,(%esp)
    17ef:	e8 db 35 00 00       	call   4dcf <strlen>
    17f4:	89 45 e8             	mov    %eax,-0x18(%ebp)
        currentPath[tmpn] = '/';
    17f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17fa:	05 e0 3b 01 00       	add    $0x13be0,%eax
    17ff:	c6 00 2f             	movb   $0x2f,(%eax)
        currentPath[tmpn + 1] = '\0';
    1802:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1805:	83 c0 01             	add    $0x1,%eax
    1808:	c6 80 e0 3b 01 00 00 	movb   $0x0,0x13be0(%eax)
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
    1817:	c7 05 80 04 01 00 00 	movl   $0x0,0x10480
    181e:	00 00 00 
	printf(0, "entering : %s\n", name);
    1821:	8b 45 08             	mov    0x8(%ebp),%eax
    1824:	89 44 24 08          	mov    %eax,0x8(%esp)
    1828:	c7 44 24 04 46 b9 00 	movl   $0xb946,0x4(%esp)
    182f:	00 
    1830:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1837:	e8 4f 39 00 00       	call   518b <printf>
	if (chdir(name) < 0)
    183c:	8b 45 08             	mov    0x8(%ebp),%eax
    183f:	89 04 24             	mov    %eax,(%esp)
    1842:	e8 cc 37 00 00       	call   5013 <chdir>
    1847:	85 c0                	test   %eax,%eax
    1849:	79 1d                	jns    1868 <enterDir+0x57>
		printf(2, "cannot cd %s\n", name);
    184b:	8b 45 08             	mov    0x8(%ebp),%eax
    184e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1852:	c7 44 24 04 55 b9 00 	movl   $0xb955,0x4(%esp)
    1859:	00 
    185a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1861:	e8 25 39 00 00       	call   518b <printf>
    1866:	eb 0b                	jmp    1873 <enterDir+0x62>
	else
		updatePath(name);
    1868:	8b 45 08             	mov    0x8(%ebp),%eax
    186b:	89 04 24             	mov    %eax,(%esp)
    186e:	e8 ac fe ff ff       	call   171f <updatePath>
	printf(0, "currentPath: %s\n", currentPath);
    1873:	c7 44 24 08 e0 3b 01 	movl   $0x13be0,0x8(%esp)
    187a:	00 
    187b:	c7 44 24 04 63 b9 00 	movl   $0xb963,0x4(%esp)
    1882:	00 
    1883:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    188a:	e8 fc 38 00 00       	call   518b <printf>
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
    18bf:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    18c6:	e8 7e e9 ff ff       	call   249 <list>
	drawFinderContent(context);
    18cb:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    18d0:	89 04 24             	mov    %eax,(%esp)
    18d3:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    18d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    18dc:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    18e1:	89 44 24 08          	mov    %eax,0x8(%esp)
    18e5:	e8 af f2 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    18ea:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    18ef:	89 04 24             	mov    %eax,(%esp)
    18f2:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    18f7:	89 44 24 04          	mov    %eax,0x4(%esp)
    18fb:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
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
    192f:	e8 18 2d 00 00       	call   464c <initRect>
    1934:	83 ec 04             	sub    $0x4,%esp
    1937:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    193a:	89 44 24 04          	mov    %eax,0x4(%esp)
    193e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1941:	89 44 24 08          	mov    %eax,0x8(%esp)
    1945:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1948:	89 44 24 0c          	mov    %eax,0xc(%esp)
    194c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    194f:	89 44 24 10          	mov    %eax,0x10(%esp)
    1953:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    195a:	e8 f0 2e 00 00       	call   484f <deleteClickable>
	addWndEvent(&cm);
    195f:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    1966:	e8 62 f9 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    196b:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
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
    1985:	e8 45 34 00 00       	call   4dcf <strlen>
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
    199c:	e8 2e 34 00 00       	call   4dcf <strlen>
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
    19c0:	e8 4c 35 00 00       	call   4f11 <atoi>
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
    19e6:	e8 75 33 00 00       	call   4d60 <strcpy>
		close(fd);
    19eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    19ee:	89 04 24             	mov    %eax,(%esp)
    19f1:	e8 d5 35 00 00       	call   4fcb <close>
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
    1a04:	e8 da 35 00 00       	call   4fe3 <open>
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
    1a20:	e8 be 35 00 00       	call   4fe3 <open>
    1a25:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1a28:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1a2c:	79 20                	jns    1a4e <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    1a2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a31:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a35:	c7 44 24 04 74 b9 00 	movl   $0xb974,0x4(%esp)
    1a3c:	00 
    1a3d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a44:	e8 42 37 00 00       	call   518b <printf>
		exit();
    1a49:	e8 55 35 00 00       	call   4fa3 <exit>
	}
	close(fd);
    1a4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a51:	89 04 24             	mov    %eax,(%esp)
    1a54:	e8 72 35 00 00       	call   4fcb <close>
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
    1aa9:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    1ab0:	e8 94 e7 ff ff       	call   249 <list>
	drawFinderContent(context);
    1ab5:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    1aba:	89 04 24             	mov    %eax,(%esp)
    1abd:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    1ac2:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ac6:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    1acb:	89 44 24 08          	mov    %eax,0x8(%esp)
    1acf:	e8 c5 f0 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    1ad4:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    1ad9:	89 04 24             	mov    %eax,(%esp)
    1adc:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    1ae1:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ae5:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
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
    1b19:	e8 2e 2b 00 00       	call   464c <initRect>
    1b1e:	83 ec 04             	sub    $0x4,%esp
    1b21:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1b24:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b28:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b2b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b32:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1b36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b39:	89 44 24 10          	mov    %eax,0x10(%esp)
    1b3d:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    1b44:	e8 06 2d 00 00       	call   484f <deleteClickable>
	addWndEvent(&cm);
    1b49:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    1b50:	e8 78 f7 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    1b55:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
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
    1b6f:	e8 5b 32 00 00       	call   4dcf <strlen>
    1b74:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    1b77:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1b7e:	eb 55                	jmp    1bd5 <newFolder+0x72>
		n = strlen(name);
    1b80:	8b 45 08             	mov    0x8(%ebp),%eax
    1b83:	89 04 24             	mov    %eax,(%esp)
    1b86:	e8 44 32 00 00       	call   4dcf <strlen>
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
    1baa:	e8 62 33 00 00       	call   4f11 <atoi>
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
    1bd0:	e8 8b 31 00 00       	call   4d60 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    1bd5:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd8:	89 04 24             	mov    %eax,(%esp)
    1bdb:	e8 2b 34 00 00       	call   500b <mkdir>
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
    1c34:	c7 44 24 04 89 b9 00 	movl   $0xb989,0x4(%esp)
    1c3b:	00 
    1c3c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c43:	e8 43 35 00 00       	call   518b <printf>
	list(".");
    1c48:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    1c4f:	e8 f5 e5 ff ff       	call   249 <list>
	printItemList();
    1c54:	e8 d6 f3 ff ff       	call   102f <printItemList>
	drawFinderContent(context);
    1c59:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    1c5e:	89 04 24             	mov    %eax,(%esp)
    1c61:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    1c66:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c6a:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    1c6f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c73:	e8 21 ef ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    1c78:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    1c7d:	89 04 24             	mov    %eax,(%esp)
    1c80:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    1c85:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c89:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
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
    1cbd:	e8 8a 29 00 00       	call   464c <initRect>
    1cc2:	83 ec 04             	sub    $0x4,%esp
    1cc5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1cc8:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ccc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ccf:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cd6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1cda:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cdd:	89 44 24 10          	mov    %eax,0x10(%esp)
    1ce1:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    1ce8:	e8 62 2b 00 00       	call   484f <deleteClickable>
	addWndEvent(&cm);
    1ced:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    1cf4:	e8 d4 f5 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    1cf9:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
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
    1d14:	c7 44 24 04 96 b9 00 	movl   $0xb996,0x4(%esp)
    1d1b:	00 
    1d1c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d23:	e8 63 34 00 00       	call   518b <printf>
	if(unlink(name) < 0){
    1d28:	8b 45 08             	mov    0x8(%ebp),%eax
    1d2b:	89 04 24             	mov    %eax,(%esp)
    1d2e:	e8 c0 32 00 00       	call   4ff3 <unlink>
    1d33:	85 c0                	test   %eax,%eax
    1d35:	0f 89 9c 00 00 00    	jns    1dd7 <deleteFile+0xd0>
		if (chdir(name) < 0){
    1d3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3e:	89 04 24             	mov    %eax,(%esp)
    1d41:	e8 cd 32 00 00       	call   5013 <chdir>
    1d46:	85 c0                	test   %eax,%eax
    1d48:	79 1d                	jns    1d67 <deleteFile+0x60>
			printf(2, "rm: %s failed to delete\n", name);
    1d4a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d4d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d51:	c7 44 24 04 b4 b9 00 	movl   $0xb9b4,0x4(%esp)
    1d58:	00 
    1d59:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1d60:	e8 26 34 00 00       	call   518b <printf>
    1d65:	eb 70                	jmp    1dd7 <deleteFile+0xd0>
		}
		else{
			freeFileItemList();
    1d67:	e8 ff e3 ff ff       	call   16b <freeFileItemList>
			list(".");
    1d6c:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    1d73:	e8 d1 e4 ff ff       	call   249 <list>
			struct fileItem *p;
			p = fileItemList;
    1d78:	a1 8c 04 01 00       	mov    0x1048c,%eax
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
    1d95:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    1d9c:	e8 a8 e4 ff ff       	call   249 <list>
				p = fileItemList;
    1da1:	a1 8c 04 01 00       	mov    0x1048c,%eax
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
    1daf:	c7 04 24 cd b9 00 00 	movl   $0xb9cd,(%esp)
    1db6:	e8 58 32 00 00       	call   5013 <chdir>
			freeFileItemList();
    1dbb:	e8 ab e3 ff ff       	call   16b <freeFileItemList>
			list(".");
    1dc0:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    1dc7:	e8 7d e4 ff ff       	call   249 <list>
			unlink(name);
    1dcc:	8b 45 08             	mov    0x8(%ebp),%eax
    1dcf:	89 04 24             	mov    %eax,(%esp)
    1dd2:	e8 1c 32 00 00       	call   4ff3 <unlink>
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
    1ddf:	a1 8c 04 01 00       	mov    0x1048c,%eax
    1de4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    1de7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1dee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1df1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1df4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1df7:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    1dfa:	c7 44 24 04 d0 b9 00 	movl   $0xb9d0,0x4(%esp)
    1e01:	00 
    1e02:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e09:	e8 7d 33 00 00       	call   518b <printf>
	while (q != 0)
    1e0e:	e9 8d 00 00 00       	jmp    1ea0 <h_deleteFile+0xc7>
	{
		printf(0, "hi2\n");
    1e13:	c7 44 24 04 d5 b9 00 	movl   $0xb9d5,0x4(%esp)
    1e1a:	00 
    1e1b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e22:	e8 64 33 00 00       	call   518b <printf>
		if (q->chosen)
    1e27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e2a:	8b 40 28             	mov    0x28(%eax),%eax
    1e2d:	85 c0                	test   %eax,%eax
    1e2f:	74 66                	je     1e97 <h_deleteFile+0xbe>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    1e31:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    1e38:	e8 3a 36 00 00       	call   5477 <malloc>
    1e3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    1e40:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    1e47:	e8 2b 36 00 00       	call   5477 <malloc>
    1e4c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1e4f:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, q->name);
    1e52:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e55:	8b 50 14             	mov    0x14(%eax),%edx
    1e58:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e5b:	8b 40 14             	mov    0x14(%eax),%eax
    1e5e:	89 54 24 04          	mov    %edx,0x4(%esp)
    1e62:	89 04 24             	mov    %eax,(%esp)
    1e65:	e8 f6 2e 00 00       	call   4d60 <strcpy>
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
    1eb0:	c7 44 24 04 dc b9 00 	movl   $0xb9dc,0x4(%esp)
    1eb7:	00 
    1eb8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ebf:	e8 c7 32 00 00       	call   518b <printf>
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
    1ee3:	c7 44 24 04 44 ba 00 	movl   $0xba44,0x4(%esp)
    1eea:	00 
    1eeb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ef2:	e8 94 32 00 00       	call   518b <printf>
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
    1f0f:	c7 44 24 04 5a ba 00 	movl   $0xba5a,0x4(%esp)
    1f16:	00 
    1f17:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f1e:	e8 68 32 00 00       	call   518b <printf>
		p1 = p1->next;
    1f23:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f26:	8b 40 2c             	mov    0x2c(%eax),%eax
    1f29:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    1f2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f2f:	8b 40 14             	mov    0x14(%eax),%eax
    1f32:	89 04 24             	mov    %eax,(%esp)
    1f35:	e8 04 34 00 00       	call   533e <free>
		free(p2);
    1f3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f3d:	89 04 24             	mov    %eax,(%esp)
    1f40:	e8 f9 33 00 00       	call   533e <free>
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
    1f4b:	c7 44 24 04 66 ba 00 	movl   $0xba66,0x4(%esp)
    1f52:	00 
    1f53:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f5a:	e8 2c 32 00 00       	call   518b <printf>
	freeFileItemList();
    1f5f:	e8 07 e2 ff ff       	call   16b <freeFileItemList>
	list(".");
    1f64:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    1f6b:	e8 d9 e2 ff ff       	call   249 <list>
	printItemList();
    1f70:	e8 ba f0 ff ff       	call   102f <printItemList>
	drawFinderContent(context);
    1f75:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    1f7a:	89 04 24             	mov    %eax,(%esp)
    1f7d:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    1f82:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f86:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    1f8b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f8f:	e8 05 ec ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    1f94:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    1f99:	89 04 24             	mov    %eax,(%esp)
    1f9c:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    1fa1:	89 44 24 04          	mov    %eax,0x4(%esp)
    1fa5:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
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
    1fd9:	e8 6e 26 00 00       	call   464c <initRect>
    1fde:	83 ec 04             	sub    $0x4,%esp
    1fe1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1fe4:	89 44 24 04          	mov    %eax,0x4(%esp)
    1fe8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1feb:	89 44 24 08          	mov    %eax,0x8(%esp)
    1fef:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ff2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1ff6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ff9:	89 44 24 10          	mov    %eax,0x10(%esp)
    1ffd:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    2004:	e8 46 28 00 00       	call   484f <deleteClickable>
		addWndEvent(&cm);
    2009:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    2010:	e8 b8 f2 ff ff       	call   12cd <addWndEvent>
		addListEvent(&cm);
    2015:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    201c:	e8 24 f2 ff ff       	call   1245 <addListEvent>
}
    2021:	c9                   	leave  
    2022:	c3                   	ret    

00002023 <saveRename>:

void saveRename(){
    2023:	55                   	push   %ebp
    2024:	89 e5                	mov    %esp,%ebp
    2026:	53                   	push   %ebx
    2027:	81 ec 24 01 00 00    	sub    $0x124,%esp
	char tempName[MAX_NAME_LEN + 2];
	int i;
	strcpy(tempName, currentlyRenaming->name);
    202d:	a1 88 04 01 00       	mov    0x10488,%eax
    2032:	8b 40 14             	mov    0x14(%eax),%eax
    2035:	89 44 24 04          	mov    %eax,0x4(%esp)
    2039:	8d 85 f2 fe ff ff    	lea    -0x10e(%ebp),%eax
    203f:	89 04 24             	mov    %eax,(%esp)
    2042:	e8 19 2d 00 00       	call   4d60 <strcpy>
	for(i = 0; i < strlen(tempName); i++){
    2047:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    204e:	eb 3a                	jmp    208a <saveRename+0x67>
		if(tempName[i] == '.'){
    2050:	8d 95 f2 fe ff ff    	lea    -0x10e(%ebp),%edx
    2056:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2059:	01 d0                	add    %edx,%eax
    205b:	0f b6 00             	movzbl (%eax),%eax
    205e:	3c 2e                	cmp    $0x2e,%al
    2060:	75 24                	jne    2086 <saveRename+0x63>
			pasteJustFile(renameFrom, tempName);
    2062:	8d 85 f2 fe ff ff    	lea    -0x10e(%ebp),%eax
    2068:	89 44 24 04          	mov    %eax,0x4(%esp)
    206c:	c7 04 24 a0 3a 01 00 	movl   $0x13aa0,(%esp)
    2073:	e8 30 03 00 00       	call   23a8 <pasteJustFile>
			deleteFile(renameFrom);
    2078:	c7 04 24 a0 3a 01 00 	movl   $0x13aa0,(%esp)
    207f:	e8 83 fc ff ff       	call   1d07 <deleteFile>
    2084:	eb 57                	jmp    20dd <saveRename+0xba>

void saveRename(){
	char tempName[MAX_NAME_LEN + 2];
	int i;
	strcpy(tempName, currentlyRenaming->name);
	for(i = 0; i < strlen(tempName); i++){
    2086:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    208a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    208d:	8d 85 f2 fe ff ff    	lea    -0x10e(%ebp),%eax
    2093:	89 04 24             	mov    %eax,(%esp)
    2096:	e8 34 2d 00 00       	call   4dcf <strlen>
    209b:	39 c3                	cmp    %eax,%ebx
    209d:	72 b1                	jb     2050 <saveRename+0x2d>
			pasteJustFile(renameFrom, tempName);
			deleteFile(renameFrom);
			return;
		}
	}
	tempName[i] = '.';
    209f:	8d 95 f2 fe ff ff    	lea    -0x10e(%ebp),%edx
    20a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20a8:	01 d0                	add    %edx,%eax
    20aa:	c6 00 2e             	movb   $0x2e,(%eax)
	tempName[i + 1] = 0;
    20ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20b0:	83 c0 01             	add    $0x1,%eax
    20b3:	c6 84 05 f2 fe ff ff 	movb   $0x0,-0x10e(%ebp,%eax,1)
    20ba:	00 
	pasteJustFile(renameFrom, tempName);
    20bb:	8d 85 f2 fe ff ff    	lea    -0x10e(%ebp),%eax
    20c1:	89 44 24 04          	mov    %eax,0x4(%esp)
    20c5:	c7 04 24 a0 3a 01 00 	movl   $0x13aa0,(%esp)
    20cc:	e8 d7 02 00 00       	call   23a8 <pasteJustFile>
	deleteFile(renameFrom);
    20d1:	c7 04 24 a0 3a 01 00 	movl   $0x13aa0,(%esp)
    20d8:	e8 2a fc ff ff       	call   1d07 <deleteFile>
}
    20dd:	81 c4 24 01 00 00    	add    $0x124,%esp
    20e3:	5b                   	pop    %ebx
    20e4:	5d                   	pop    %ebp
    20e5:	c3                   	ret    

000020e6 <unrename>:

void unrename(){
    20e6:	55                   	push   %ebp
    20e7:	89 e5                	mov    %esp,%ebp
    20e9:	83 ec 38             	sub    $0x38,%esp
	printf(0, "renaming! currentlyRenaming: %s\n", currentlyRenaming->name);
    20ec:	a1 88 04 01 00       	mov    0x10488,%eax
    20f1:	8b 40 14             	mov    0x14(%eax),%eax
    20f4:	89 44 24 08          	mov    %eax,0x8(%esp)
    20f8:	c7 44 24 04 78 ba 00 	movl   $0xba78,0x4(%esp)
    20ff:	00 
    2100:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2107:	e8 7f 30 00 00       	call   518b <printf>
	saveRename();
    210c:	e8 12 ff ff ff       	call   2023 <saveRename>
	currentlyRenaming->chosen = 1;
    2111:	a1 88 04 01 00       	mov    0x10488,%eax
    2116:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	currentlyRenaming = 0;
    211d:	c7 05 88 04 01 00 00 	movl   $0x0,0x10488
    2124:	00 00 00 
	renaming = 0;
    2127:	c7 05 f4 3c 01 00 00 	movl   $0x0,0x13cf4
    212e:	00 00 00 
	freeFileItemList();
    2131:	e8 35 e0 ff ff       	call   16b <freeFileItemList>
	list(".");
    2136:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    213d:	e8 07 e1 ff ff       	call   249 <list>
	printItemList();
    2142:	e8 e8 ee ff ff       	call   102f <printItemList>
	drawFinderContent(context);
    2147:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    214c:	89 04 24             	mov    %eax,(%esp)
    214f:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2154:	89 44 24 04          	mov    %eax,0x4(%esp)
    2158:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    215d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2161:	e8 33 ea ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    2166:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    216b:	89 04 24             	mov    %eax,(%esp)
    216e:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2173:	89 44 24 04          	mov    %eax,0x4(%esp)
    2177:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    217c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2180:	e8 1a e8 ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2185:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2188:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    218f:	00 
    2190:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2197:	00 
    2198:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    219f:	00 
    21a0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    21a7:	00 
    21a8:	89 04 24             	mov    %eax,(%esp)
    21ab:	e8 9c 24 00 00       	call   464c <initRect>
    21b0:	83 ec 04             	sub    $0x4,%esp
    21b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    21b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    21ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    21bd:	89 44 24 08          	mov    %eax,0x8(%esp)
    21c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21c4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    21c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21cb:	89 44 24 10          	mov    %eax,0x10(%esp)
    21cf:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    21d6:	e8 74 26 00 00       	call   484f <deleteClickable>
	addWndEvent(&cm);
    21db:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    21e2:	e8 e6 f0 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    21e7:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    21ee:	e8 52 f0 ff ff       	call   1245 <addListEvent>
}
    21f3:	c9                   	leave  
    21f4:	c3                   	ret    

000021f5 <copyFile>:

void copyFile(){
    21f5:	55                   	push   %ebp
    21f6:	89 e5                	mov    %esp,%ebp
    21f8:	56                   	push   %esi
    21f9:	53                   	push   %ebx
    21fa:	83 ec 20             	sub    $0x20,%esp
	int fd;
	struct fileItem *p = fileItemList;
    21fd:	a1 8c 04 01 00       	mov    0x1048c,%eax
    2202:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    2205:	e9 0f 01 00 00       	jmp    2319 <copyFile+0x124>
		if (p->chosen == 1){
    220a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    220d:	8b 40 28             	mov    0x28(%eax),%eax
    2210:	83 f8 01             	cmp    $0x1,%eax
    2213:	0f 85 f7 00 00 00    	jne    2310 <copyFile+0x11b>
			if(lenOfWaited >= MAX_COPY_SIZE){
    2219:	a1 f8 3c 01 00       	mov    0x13cf8,%eax
    221e:	83 f8 07             	cmp    $0x7,%eax
    2221:	7e 22                	jle    2245 <copyFile+0x50>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    2223:	a1 f8 3c 01 00       	mov    0x13cf8,%eax
    2228:	89 44 24 08          	mov    %eax,0x8(%esp)
    222c:	c7 44 24 04 99 ba 00 	movl   $0xba99,0x4(%esp)
    2233:	00 
    2234:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    223b:	e8 4b 2f 00 00       	call   518b <printf>
    2240:	e9 cb 00 00 00       	jmp    2310 <copyFile+0x11b>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    2245:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2248:	8b 40 14             	mov    0x14(%eax),%eax
    224b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2252:	00 
    2253:	89 04 24             	mov    %eax,(%esp)
    2256:	e8 88 2d 00 00       	call   4fe3 <open>
    225b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    225e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2262:	0f 88 8a 00 00 00    	js     22f2 <copyFile+0xfd>
					strcpy(filesWaited[lenOfWaited], currentPath);
    2268:	a1 f8 3c 01 00       	mov    0x13cf8,%eax
    226d:	c1 e0 08             	shl    $0x8,%eax
    2270:	05 a0 32 01 00       	add    $0x132a0,%eax
    2275:	c7 44 24 04 e0 3b 01 	movl   $0x13be0,0x4(%esp)
    227c:	00 
    227d:	89 04 24             	mov    %eax,(%esp)
    2280:	e8 db 2a 00 00       	call   4d60 <strcpy>
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    2285:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2288:	8b 58 14             	mov    0x14(%eax),%ebx
    228b:	a1 f8 3c 01 00       	mov    0x13cf8,%eax
    2290:	c1 e0 08             	shl    $0x8,%eax
    2293:	8d b0 a0 32 01 00    	lea    0x132a0(%eax),%esi
    2299:	c7 04 24 e0 3b 01 00 	movl   $0x13be0,(%esp)
    22a0:	e8 2a 2b 00 00       	call   4dcf <strlen>
    22a5:	01 f0                	add    %esi,%eax
    22a7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    22ab:	89 04 24             	mov    %eax,(%esp)
    22ae:	e8 ad 2a 00 00       	call   4d60 <strcpy>
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    22b3:	a1 f8 3c 01 00       	mov    0x13cf8,%eax
    22b8:	c1 e0 08             	shl    $0x8,%eax
    22bb:	05 a0 32 01 00       	add    $0x132a0,%eax
    22c0:	89 44 24 08          	mov    %eax,0x8(%esp)
    22c4:	c7 44 24 04 b4 ba 00 	movl   $0xbab4,0x4(%esp)
    22cb:	00 
    22cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22d3:	e8 b3 2e 00 00       	call   518b <printf>
					lenOfWaited++;
    22d8:	a1 f8 3c 01 00       	mov    0x13cf8,%eax
    22dd:	83 c0 01             	add    $0x1,%eax
    22e0:	a3 f8 3c 01 00       	mov    %eax,0x13cf8
					close(fd);
    22e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22e8:	89 04 24             	mov    %eax,(%esp)
    22eb:	e8 db 2c 00 00       	call   4fcb <close>
    22f0:	eb 1e                	jmp    2310 <copyFile+0x11b>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    22f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22f5:	8b 40 14             	mov    0x14(%eax),%eax
    22f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    22fc:	c7 44 24 04 ca ba 00 	movl   $0xbaca,0x4(%esp)
    2303:	00 
    2304:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    230b:	e8 7b 2e 00 00       	call   518b <printf>
				}
			}
		}
		p = p->next;
    2310:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2313:	8b 40 2c             	mov    0x2c(%eax),%eax
    2316:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    2319:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    231d:	0f 85 e7 fe ff ff    	jne    220a <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    2323:	83 c4 20             	add    $0x20,%esp
    2326:	5b                   	pop    %ebx
    2327:	5e                   	pop    %esi
    2328:	5d                   	pop    %ebp
    2329:	c3                   	ret    

0000232a <h_copyFile>:

void h_copyFile(Point p){
    232a:	55                   	push   %ebp
    232b:	89 e5                	mov    %esp,%ebp
    232d:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    2330:	c7 05 84 04 01 00 00 	movl   $0x0,0x10484
    2337:	00 00 00 
	lenOfWaited = 0;
    233a:	c7 05 f8 3c 01 00 00 	movl   $0x0,0x13cf8
    2341:	00 00 00 
	copyFile();
    2344:	e8 ac fe ff ff       	call   21f5 <copyFile>
}
    2349:	c9                   	leave  
    234a:	c3                   	ret    

0000234b <moveFile>:

void moveFile(){
    234b:	55                   	push   %ebp
    234c:	89 e5                	mov    %esp,%ebp
    234e:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    2351:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2358:	eb 17                	jmp    2371 <moveFile+0x26>
		deleteFile(filesWaited[i]);
    235a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    235d:	c1 e0 08             	shl    $0x8,%eax
    2360:	05 a0 32 01 00       	add    $0x132a0,%eax
    2365:	89 04 24             	mov    %eax,(%esp)
    2368:	e8 9a f9 ff ff       	call   1d07 <deleteFile>
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    236d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2371:	a1 f8 3c 01 00       	mov    0x13cf8,%eax
    2376:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2379:	7c df                	jl     235a <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    237b:	c7 05 f8 3c 01 00 00 	movl   $0x0,0x13cf8
    2382:	00 00 00 
}
    2385:	c9                   	leave  
    2386:	c3                   	ret    

00002387 <h_cutFile>:

void h_cutFile(Point p){
    2387:	55                   	push   %ebp
    2388:	89 e5                	mov    %esp,%ebp
    238a:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    238d:	c7 05 84 04 01 00 01 	movl   $0x1,0x10484
    2394:	00 00 00 
	lenOfWaited = 0;
    2397:	c7 05 f8 3c 01 00 00 	movl   $0x0,0x13cf8
    239e:	00 00 00 
	copyFile();
    23a1:	e8 4f fe ff ff       	call   21f5 <copyFile>
}
    23a6:	c9                   	leave  
    23a7:	c3                   	ret    

000023a8 <pasteJustFile>:

void pasteJustFile(char *src, char *filename){
    23a8:	55                   	push   %ebp
    23a9:	89 e5                	mov    %esp,%ebp
    23ab:	83 ec 28             	sub    $0x28,%esp
	int size = 0;
    23ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	int file_src, file_dest;
	char* buff = (char*)malloc(4096 * sizeof(char));
    23b5:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    23bc:	e8 b6 30 00 00       	call   5477 <malloc>
    23c1:	89 45 ec             	mov    %eax,-0x14(%ebp)
	memset(buff, 0, 4096);
    23c4:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    23cb:	00 
    23cc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    23d3:	00 
    23d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    23d7:	89 04 24             	mov    %eax,(%esp)
    23da:	e8 17 2a 00 00       	call   4df6 <memset>
	file_src = open(src, O_RDONLY);
    23df:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    23e6:	00 
    23e7:	8b 45 08             	mov    0x8(%ebp),%eax
    23ea:	89 04 24             	mov    %eax,(%esp)
    23ed:	e8 f1 2b 00 00       	call   4fe3 <open>
    23f2:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if((file_dest = open(filename, O_RDONLY)) >= 0){
    23f5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    23fc:	00 
    23fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    2400:	89 04 24             	mov    %eax,(%esp)
    2403:	e8 db 2b 00 00       	call   4fe3 <open>
    2408:	89 45 f4             	mov    %eax,-0xc(%ebp)
    240b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    240f:	78 1d                	js     242e <pasteJustFile+0x86>
		printf(0, "File %s already exist\n", filename);
    2411:	8b 45 0c             	mov    0xc(%ebp),%eax
    2414:	89 44 24 08          	mov    %eax,0x8(%esp)
    2418:	c7 44 24 04 df ba 00 	movl   $0xbadf,0x4(%esp)
    241f:	00 
    2420:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2427:	e8 5f 2d 00 00       	call   518b <printf>
    242c:	eb 77                	jmp    24a5 <pasteJustFile+0xfd>
	}
	else{
		file_dest = open(filename, O_CREATE);
    242e:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2435:	00 
    2436:	8b 45 0c             	mov    0xc(%ebp),%eax
    2439:	89 04 24             	mov    %eax,(%esp)
    243c:	e8 a2 2b 00 00       	call   4fe3 <open>
    2441:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while((size = read(file_src, buff, 4096)) > 0)
    2444:	eb 19                	jmp    245f <pasteJustFile+0xb7>
            write(file_dest, buff, size);
    2446:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2449:	89 44 24 08          	mov    %eax,0x8(%esp)
    244d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2450:	89 44 24 04          	mov    %eax,0x4(%esp)
    2454:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2457:	89 04 24             	mov    %eax,(%esp)
    245a:	e8 64 2b 00 00       	call   4fc3 <write>
	if((file_dest = open(filename, O_RDONLY)) >= 0){
		printf(0, "File %s already exist\n", filename);
	}
	else{
		file_dest = open(filename, O_CREATE);
		while((size = read(file_src, buff, 4096)) > 0)
    245f:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    2466:	00 
    2467:	8b 45 ec             	mov    -0x14(%ebp),%eax
    246a:	89 44 24 04          	mov    %eax,0x4(%esp)
    246e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2471:	89 04 24             	mov    %eax,(%esp)
    2474:	e8 42 2b 00 00       	call   4fbb <read>
    2479:	89 45 f0             	mov    %eax,-0x10(%ebp)
    247c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2480:	7f c4                	jg     2446 <pasteJustFile+0x9e>
            write(file_dest, buff, size);
	    if(size < 0)
    2482:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2486:	79 1d                	jns    24a5 <pasteJustFile+0xfd>
	    {
	    	//printf(2, "copy file error!!!\r\n");
	        printf(0, "File %s error\n", filename);
    2488:	8b 45 0c             	mov    0xc(%ebp),%eax
    248b:	89 44 24 08          	mov    %eax,0x8(%esp)
    248f:	c7 44 24 04 f6 ba 00 	movl   $0xbaf6,0x4(%esp)
    2496:	00 
    2497:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    249e:	e8 e8 2c 00 00       	call   518b <printf>
	        return;
    24a3:	eb 21                	jmp    24c6 <pasteJustFile+0x11e>
	    }
	}
	close(file_dest);
    24a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24a8:	89 04 24             	mov    %eax,(%esp)
    24ab:	e8 1b 2b 00 00       	call   4fcb <close>
	close(file_src);
    24b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24b3:	89 04 24             	mov    %eax,(%esp)
    24b6:	e8 10 2b 00 00       	call   4fcb <close>
	free(buff);
    24bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24be:	89 04 24             	mov    %eax,(%esp)
    24c1:	e8 78 2e 00 00       	call   533e <free>
}
    24c6:	c9                   	leave  
    24c7:	c3                   	ret    

000024c8 <pasteFile>:

void pasteFile(){
    24c8:	55                   	push   %ebp
    24c9:	89 e5                	mov    %esp,%ebp
    24cb:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
    24ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    24d5:	e9 c1 00 00 00       	jmp    259b <pasteFile+0xd3>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    24da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24dd:	c1 e0 08             	shl    $0x8,%eax
    24e0:	05 a0 32 01 00       	add    $0x132a0,%eax
    24e5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24ec:	89 44 24 08          	mov    %eax,0x8(%esp)
    24f0:	c7 44 24 04 05 bb 00 	movl   $0xbb05,0x4(%esp)
    24f7:	00 
    24f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24ff:	e8 87 2c 00 00       	call   518b <printf>
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2504:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2507:	c1 e0 08             	shl    $0x8,%eax
    250a:	05 a0 32 01 00       	add    $0x132a0,%eax
    250f:	89 04 24             	mov    %eax,(%esp)
    2512:	e8 b8 28 00 00       	call   4dcf <strlen>
    2517:	83 e8 01             	sub    $0x1,%eax
    251a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    251d:	eb 35                	jmp    2554 <pasteFile+0x8c>
        	if (*(filesWaited[i]+j) == '/'){
    251f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2522:	c1 e0 08             	shl    $0x8,%eax
    2525:	8d 90 a0 32 01 00    	lea    0x132a0(%eax),%edx
    252b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    252e:	01 d0                	add    %edx,%eax
    2530:	0f b6 00             	movzbl (%eax),%eax
    2533:	3c 2f                	cmp    $0x2f,%al
    2535:	75 19                	jne    2550 <pasteFile+0x88>
        		filename = filesWaited[i] + j + 1;
    2537:	8b 45 f4             	mov    -0xc(%ebp),%eax
    253a:	c1 e0 08             	shl    $0x8,%eax
    253d:	8d 90 a0 32 01 00    	lea    0x132a0(%eax),%edx
    2543:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2546:	83 c0 01             	add    $0x1,%eax
    2549:	01 d0                	add    %edx,%eax
    254b:	89 45 ec             	mov    %eax,-0x14(%ebp)
        		break;
    254e:	eb 0a                	jmp    255a <pasteFile+0x92>
void pasteFile(){
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2550:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    2554:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2558:	79 c5                	jns    251f <pasteFile+0x57>
        	if (*(filesWaited[i]+j) == '/'){
        		filename = filesWaited[i] + j + 1;
        		break;
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
    255a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    255d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2561:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2564:	89 44 24 08          	mov    %eax,0x8(%esp)
    2568:	c7 44 24 04 22 bb 00 	movl   $0xbb22,0x4(%esp)
    256f:	00 
    2570:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2577:	e8 0f 2c 00 00       	call   518b <printf>
        pasteJustFile(filesWaited[i], filename);
    257c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    257f:	c1 e0 08             	shl    $0x8,%eax
    2582:	8d 90 a0 32 01 00    	lea    0x132a0(%eax),%edx
    2588:	8b 45 ec             	mov    -0x14(%ebp),%eax
    258b:	89 44 24 04          	mov    %eax,0x4(%esp)
    258f:	89 14 24             	mov    %edx,(%esp)
    2592:	e8 11 fe ff ff       	call   23a8 <pasteJustFile>
}

void pasteFile(){
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
    2597:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    259b:	a1 f8 3c 01 00       	mov    0x13cf8,%eax
    25a0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    25a3:	0f 8c 31 ff ff ff    	jl     24da <pasteFile+0x12>
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
        pasteJustFile(filesWaited[i], filename);
	}
}
    25a9:	c9                   	leave  
    25aa:	c3                   	ret    

000025ab <h_pasteFile>:

void h_pasteFile(Point p){
    25ab:	55                   	push   %ebp
    25ac:	89 e5                	mov    %esp,%ebp
    25ae:	83 ec 38             	sub    $0x38,%esp
	pasteFile();
    25b1:	e8 12 ff ff ff       	call   24c8 <pasteFile>
	if(copyOrCut == 1)
    25b6:	a1 84 04 01 00       	mov    0x10484,%eax
    25bb:	83 f8 01             	cmp    $0x1,%eax
    25be:	75 05                	jne    25c5 <h_pasteFile+0x1a>
		moveFile();
    25c0:	e8 86 fd ff ff       	call   234b <moveFile>
    freeFileItemList();
    25c5:	e8 a1 db ff ff       	call   16b <freeFileItemList>
	list(".");
    25ca:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    25d1:	e8 73 dc ff ff       	call   249 <list>
	drawFinderContent(context);
    25d6:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    25db:	89 04 24             	mov    %eax,(%esp)
    25de:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    25e3:	89 44 24 04          	mov    %eax,0x4(%esp)
    25e7:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    25ec:	89 44 24 08          	mov    %eax,0x8(%esp)
    25f0:	e8 a4 e5 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    25f5:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    25fa:	89 04 24             	mov    %eax,(%esp)
    25fd:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2602:	89 44 24 04          	mov    %eax,0x4(%esp)
    2606:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    260b:	89 44 24 08          	mov    %eax,0x8(%esp)
    260f:	e8 8b e3 ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2614:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2617:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    261e:	00 
    261f:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2626:	00 
    2627:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    262e:	00 
    262f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2636:	00 
    2637:	89 04 24             	mov    %eax,(%esp)
    263a:	e8 0d 20 00 00       	call   464c <initRect>
    263f:	83 ec 04             	sub    $0x4,%esp
    2642:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2645:	89 44 24 04          	mov    %eax,0x4(%esp)
    2649:	8b 45 ec             	mov    -0x14(%ebp),%eax
    264c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2650:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2653:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2657:	8b 45 f4             	mov    -0xc(%ebp),%eax
    265a:	89 44 24 10          	mov    %eax,0x10(%esp)
    265e:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    2665:	e8 e5 21 00 00       	call   484f <deleteClickable>
	addWndEvent(&cm);
    266a:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    2671:	e8 57 ec ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    2676:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    267d:	e8 c3 eb ff ff       	call   1245 <addListEvent>
}
    2682:	c9                   	leave  
    2683:	c3                   	ret    

00002684 <h_chooseFile>:

void h_chooseFile(Point p) {
    2684:	55                   	push   %ebp
    2685:	89 e5                	mov    %esp,%ebp
    2687:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    268a:	8b 45 08             	mov    0x8(%ebp),%eax
    268d:	8b 55 0c             	mov    0xc(%ebp),%edx
    2690:	89 04 24             	mov    %eax,(%esp)
    2693:	89 54 24 04          	mov    %edx,0x4(%esp)
    2697:	e8 f7 ec ff ff       	call   1393 <getFileItem>
    269c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    269f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26a2:	8b 40 28             	mov    0x28(%eax),%eax
    26a5:	85 c0                	test   %eax,%eax
    26a7:	74 20                	je     26c9 <h_chooseFile+0x45>
	{
		printf(0, "chooseFile!\n");
    26a9:	c7 44 24 04 3a bb 00 	movl   $0xbb3a,0x4(%esp)
    26b0:	00 
    26b1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26b8:	e8 ce 2a 00 00       	call   518b <printf>
		temp->chosen = 0;
    26bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26c0:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    26c7:	eb 1e                	jmp    26e7 <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    26c9:	c7 44 24 04 47 bb 00 	movl   $0xbb47,0x4(%esp)
    26d0:	00 
    26d1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26d8:	e8 ae 2a 00 00       	call   518b <printf>
		temp->chosen = 1;
    26dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26e0:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    26e7:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    26ec:	89 04 24             	mov    %eax,(%esp)
    26ef:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    26f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    26f8:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    26fd:	89 44 24 08          	mov    %eax,0x8(%esp)
    2701:	e8 93 e4 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    2706:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    270b:	89 04 24             	mov    %eax,(%esp)
    270e:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2713:	89 44 24 04          	mov    %eax,0x4(%esp)
    2717:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    271c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2720:	e8 7a e2 ff ff       	call   99f <drawFinderWnd>
}
    2725:	c9                   	leave  
    2726:	c3                   	ret    

00002727 <h_closeWnd>:

void h_closeWnd(Point p) {
    2727:	55                   	push   %ebp
    2728:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    272a:	c7 05 20 fb 00 00 00 	movl   $0x0,0xfb20
    2731:	00 00 00 
}
    2734:	5d                   	pop    %ebp
    2735:	c3                   	ret    

00002736 <h_chvm1>:

void h_chvm1(Point p) {
    2736:	55                   	push   %ebp
    2737:	89 e5                	mov    %esp,%ebp
    2739:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    273c:	c7 05 24 fb 00 00 01 	movl   $0x1,0xfb24
    2743:	00 00 00 
	freeFileItemList();
    2746:	e8 20 da ff ff       	call   16b <freeFileItemList>
		list(".");
    274b:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    2752:	e8 f2 da ff ff       	call   249 <list>
		drawFinderContent(context);
    2757:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    275c:	89 04 24             	mov    %eax,(%esp)
    275f:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2764:	89 44 24 04          	mov    %eax,0x4(%esp)
    2768:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    276d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2771:	e8 23 e4 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    2776:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    277b:	89 04 24             	mov    %eax,(%esp)
    277e:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2783:	89 44 24 04          	mov    %eax,0x4(%esp)
    2787:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    278c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2790:	e8 0a e2 ff ff       	call   99f <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2795:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2798:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    279f:	00 
    27a0:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    27a7:	00 
    27a8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    27af:	00 
    27b0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    27b7:	00 
    27b8:	89 04 24             	mov    %eax,(%esp)
    27bb:	e8 8c 1e 00 00       	call   464c <initRect>
    27c0:	83 ec 04             	sub    $0x4,%esp
    27c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27c6:	89 44 24 04          	mov    %eax,0x4(%esp)
    27ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27cd:	89 44 24 08          	mov    %eax,0x8(%esp)
    27d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27d4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    27d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27db:	89 44 24 10          	mov    %eax,0x10(%esp)
    27df:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    27e6:	e8 64 20 00 00       	call   484f <deleteClickable>
			addWndEvent(&cm);
    27eb:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    27f2:	e8 d6 ea ff ff       	call   12cd <addWndEvent>
			addListEvent(&cm);
    27f7:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    27fe:	e8 42 ea ff ff       	call   1245 <addListEvent>
}
    2803:	c9                   	leave  
    2804:	c3                   	ret    

00002805 <h_chvm2>:

void h_chvm2(Point p) {
    2805:	55                   	push   %ebp
    2806:	89 e5                	mov    %esp,%ebp
    2808:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    280b:	c7 05 24 fb 00 00 02 	movl   $0x2,0xfb24
    2812:	00 00 00 
	freeFileItemList();
    2815:	e8 51 d9 ff ff       	call   16b <freeFileItemList>
		list(".");
    281a:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    2821:	e8 23 da ff ff       	call   249 <list>
		drawFinderContent(context);
    2826:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    282b:	89 04 24             	mov    %eax,(%esp)
    282e:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2833:	89 44 24 04          	mov    %eax,0x4(%esp)
    2837:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    283c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2840:	e8 54 e3 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    2845:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    284a:	89 04 24             	mov    %eax,(%esp)
    284d:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2852:	89 44 24 04          	mov    %eax,0x4(%esp)
    2856:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    285b:	89 44 24 08          	mov    %eax,0x8(%esp)
    285f:	e8 3b e1 ff ff       	call   99f <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2864:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2867:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    286e:	00 
    286f:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2876:	00 
    2877:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    287e:	00 
    287f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2886:	00 
    2887:	89 04 24             	mov    %eax,(%esp)
    288a:	e8 bd 1d 00 00       	call   464c <initRect>
    288f:	83 ec 04             	sub    $0x4,%esp
    2892:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2895:	89 44 24 04          	mov    %eax,0x4(%esp)
    2899:	8b 45 ec             	mov    -0x14(%ebp),%eax
    289c:	89 44 24 08          	mov    %eax,0x8(%esp)
    28a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28a3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    28a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28aa:	89 44 24 10          	mov    %eax,0x10(%esp)
    28ae:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    28b5:	e8 95 1f 00 00       	call   484f <deleteClickable>
			addWndEvent(&cm);
    28ba:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    28c1:	e8 07 ea ff ff       	call   12cd <addWndEvent>
			addListEvent(&cm);
    28c6:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    28cd:	e8 73 e9 ff ff       	call   1245 <addListEvent>
}
    28d2:	c9                   	leave  
    28d3:	c3                   	ret    

000028d4 <h_goUp>:

void h_goUp(Point p) {
    28d4:	55                   	push   %ebp
    28d5:	89 e5                	mov    %esp,%ebp
    28d7:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    28da:	c7 04 24 cd b9 00 00 	movl   $0xb9cd,(%esp)
    28e1:	e8 2b ef ff ff       	call   1811 <enterDir>
	freeFileItemList();
    28e6:	e8 80 d8 ff ff       	call   16b <freeFileItemList>
	list(".");
    28eb:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    28f2:	e8 52 d9 ff ff       	call   249 <list>
	drawFinderContent(context);
    28f7:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    28fc:	89 04 24             	mov    %eax,(%esp)
    28ff:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2904:	89 44 24 04          	mov    %eax,0x4(%esp)
    2908:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    290d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2911:	e8 83 e2 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    2916:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    291b:	89 04 24             	mov    %eax,(%esp)
    291e:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2923:	89 44 24 04          	mov    %eax,0x4(%esp)
    2927:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    292c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2930:	e8 6a e0 ff ff       	call   99f <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2935:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2938:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    293f:	00 
    2940:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2947:	00 
    2948:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    294f:	00 
    2950:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2957:	00 
    2958:	89 04 24             	mov    %eax,(%esp)
    295b:	e8 ec 1c 00 00       	call   464c <initRect>
    2960:	83 ec 04             	sub    $0x4,%esp
    2963:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2966:	89 44 24 04          	mov    %eax,0x4(%esp)
    296a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    296d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2971:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2974:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2978:	8b 45 f4             	mov    -0xc(%ebp),%eax
    297b:	89 44 24 10          	mov    %eax,0x10(%esp)
    297f:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    2986:	e8 c4 1e 00 00       	call   484f <deleteClickable>
	addWndEvent(&cm);
    298b:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    2992:	e8 36 e9 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    2997:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    299e:	e8 a2 e8 ff ff       	call   1245 <addListEvent>
}
    29a3:	c9                   	leave  
    29a4:	c3                   	ret    

000029a5 <h_empty>:

void h_empty(Point p) {
    29a5:	55                   	push   %ebp
    29a6:	89 e5                	mov    %esp,%ebp

}
    29a8:	5d                   	pop    %ebp
    29a9:	c3                   	ret    

000029aa <rename>:

void rename() {
    29aa:	55                   	push   %ebp
    29ab:	89 e5                	mov    %esp,%ebp
    29ad:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = fileItemList;
    29b0:	a1 8c 04 01 00       	mov    0x1048c,%eax
    29b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (temp != 0){
    29b8:	eb 48                	jmp    2a02 <rename+0x58>
		if (temp->chosen == 1){
    29ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29bd:	8b 40 28             	mov    0x28(%eax),%eax
    29c0:	83 f8 01             	cmp    $0x1,%eax
    29c3:	75 34                	jne    29f9 <rename+0x4f>
			currentlyRenaming = temp;
    29c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29c8:	a3 88 04 01 00       	mov    %eax,0x10488
			temp->chosen = 2;
    29cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29d0:	c7 40 28 02 00 00 00 	movl   $0x2,0x28(%eax)
			strcpy(renameFrom, temp->name);
    29d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29da:	8b 40 14             	mov    0x14(%eax),%eax
    29dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    29e1:	c7 04 24 a0 3a 01 00 	movl   $0x13aa0,(%esp)
    29e8:	e8 73 23 00 00       	call   4d60 <strcpy>
			renaming = 1;
    29ed:	c7 05 f4 3c 01 00 01 	movl   $0x1,0x13cf4
    29f4:	00 00 00 
			break;
    29f7:	eb 0f                	jmp    2a08 <rename+0x5e>
		}
		else
			temp = temp->next;
    29f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29fc:	8b 40 2c             	mov    0x2c(%eax),%eax
    29ff:	89 45 f4             	mov    %eax,-0xc(%ebp)

}

void rename() {
	struct fileItem *temp = fileItemList;
	while (temp != 0){
    2a02:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a06:	75 b2                	jne    29ba <rename+0x10>
			break;
		}
		else
			temp = temp->next;
	}
}
    2a08:	c9                   	leave  
    2a09:	c3                   	ret    

00002a0a <h_rename>:

void h_rename(Point p) {
    2a0a:	55                   	push   %ebp
    2a0b:	89 e5                	mov    %esp,%ebp
    2a0d:	83 ec 18             	sub    $0x18,%esp
	rename();
    2a10:	e8 95 ff ff ff       	call   29aa <rename>
	drawFinderContent(context);
    2a15:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2a1a:	89 04 24             	mov    %eax,(%esp)
    2a1d:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2a22:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a26:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    2a2b:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a2f:	e8 65 e1 ff ff       	call   b99 <drawFinderContent>
	drawFinderWnd(context);
    2a34:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2a39:	89 04 24             	mov    %eax,(%esp)
    2a3c:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2a41:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a45:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    2a4a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a4e:	e8 4c df ff ff       	call   99f <drawFinderWnd>
}
    2a53:	c9                   	leave  
    2a54:	c3                   	ret    

00002a55 <main>:

int main(int argc, char *argv[]) {
    2a55:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    2a59:	83 e4 f0             	and    $0xfffffff0,%esp
    2a5c:	ff 71 fc             	pushl  -0x4(%ecx)
    2a5f:	55                   	push   %ebp
    2a60:	89 e5                	mov    %esp,%ebp
    2a62:	56                   	push   %esi
    2a63:	53                   	push   %ebx
    2a64:	51                   	push   %ecx
    2a65:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
	struct Msg msg;
	char key;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    2a6b:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    2a72:	00 
    2a73:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    2a7a:	00 
    2a7b:	c7 04 24 a0 3b 01 00 	movl   $0x13ba0,(%esp)
    2a82:	e8 8f 06 00 00       	call   3116 <init_context>
    2a87:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    2a8a:	8d 45 88             	lea    -0x78(%ebp),%eax
    2a8d:	8b 15 a0 3b 01 00    	mov    0x13ba0,%edx
    2a93:	89 54 24 04          	mov    %edx,0x4(%esp)
    2a97:	8b 15 a4 3b 01 00    	mov    0x13ba4,%edx
    2a9d:	89 54 24 08          	mov    %edx,0x8(%esp)
    2aa1:	8b 15 a8 3b 01 00    	mov    0x13ba8,%edx
    2aa7:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2aab:	89 04 24             	mov    %eax,(%esp)
    2aae:	e8 37 1c 00 00       	call   46ea <initClickManager>
    2ab3:	83 ec 04             	sub    $0x4,%esp
    2ab6:	8b 45 88             	mov    -0x78(%ebp),%eax
    2ab9:	a3 e0 3c 01 00       	mov    %eax,0x13ce0
    2abe:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2ac1:	a3 e4 3c 01 00       	mov    %eax,0x13ce4
    2ac6:	8b 45 90             	mov    -0x70(%ebp),%eax
    2ac9:	a3 e8 3c 01 00       	mov    %eax,0x13ce8
    2ace:	8b 45 94             	mov    -0x6c(%ebp),%eax
    2ad1:	a3 ec 3c 01 00       	mov    %eax,0x13cec
    2ad6:	8b 45 98             	mov    -0x68(%ebp),%eax
    2ad9:	a3 f0 3c 01 00       	mov    %eax,0x13cf0
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    2ade:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
    2ae5:	00 
    2ae6:	c7 04 24 20 fc 00 00 	movl   $0xfc20,(%esp)
    2aed:	e8 1e 12 00 00       	call   3d10 <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    2af2:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    2af9:	00 
    2afa:	c7 04 24 40 fb 00 00 	movl   $0xfb40,(%esp)
    2b01:	e8 0a 12 00 00       	call   3d10 <load_iconlist>
	//testHandlers();
	strcpy(currentPath, "/");
    2b06:	c7 44 24 04 56 bb 00 	movl   $0xbb56,0x4(%esp)
    2b0d:	00 
    2b0e:	c7 04 24 e0 3b 01 00 	movl   $0x13be0,(%esp)
    2b15:	e8 46 22 00 00       	call   4d60 <strcpy>
	mkdir("userfolder");
    2b1a:	c7 04 24 58 bb 00 00 	movl   $0xbb58,(%esp)
    2b21:	e8 e5 24 00 00       	call   500b <mkdir>
	enterDir("userfolder");
    2b26:	c7 04 24 58 bb 00 00 	movl   $0xbb58,(%esp)
    2b2d:	e8 df ec ff ff       	call   1811 <enterDir>
	freeFileItemList();
    2b32:	e8 34 d6 ff ff       	call   16b <freeFileItemList>
	list(".");
    2b37:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    2b3e:	e8 06 d7 ff ff       	call   249 <list>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2b43:	8d 45 d0             	lea    -0x30(%ebp),%eax
    2b46:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2b4d:	00 
    2b4e:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2b55:	00 
    2b56:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2b5d:	00 
    2b5e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b65:	00 
    2b66:	89 04 24             	mov    %eax,(%esp)
    2b69:	e8 de 1a 00 00       	call   464c <initRect>
    2b6e:	83 ec 04             	sub    $0x4,%esp
    2b71:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2b74:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b78:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2b7b:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b7f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2b82:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2b86:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2b89:	89 44 24 10          	mov    %eax,0x10(%esp)
    2b8d:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    2b94:	e8 b6 1c 00 00       	call   484f <deleteClickable>
	addWndEvent(&cm);
    2b99:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    2ba0:	e8 28 e7 ff ff       	call   12cd <addWndEvent>
	addListEvent(&cm);
    2ba5:	c7 04 24 e0 3c 01 00 	movl   $0x13ce0,(%esp)
    2bac:	e8 94 e6 ff ff       	call   1245 <addListEvent>
	lenOfWaited = 0;
    2bb1:	c7 05 f8 3c 01 00 00 	movl   $0x0,0x13cf8
    2bb8:	00 00 00 
	while (isRun) {
    2bbb:	e9 26 04 00 00       	jmp    2fe6 <main+0x591>
		getMsg(&msg);
    2bc0:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2bc3:	89 04 24             	mov    %eax,(%esp)
    2bc6:	e8 78 24 00 00       	call   5043 <getMsg>
		switch (msg.msg_type) {
    2bcb:	8b 45 b8             	mov    -0x48(%ebp),%eax
    2bce:	83 f8 08             	cmp    $0x8,%eax
    2bd1:	0f 87 0e 04 00 00    	ja     2fe5 <main+0x590>
    2bd7:	8b 04 85 64 bb 00 00 	mov    0xbb64(,%eax,4),%eax
    2bde:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2be0:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2be3:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2be6:	8d 45 b0             	lea    -0x50(%ebp),%eax
    2be9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2bed:	89 54 24 04          	mov    %edx,0x4(%esp)
    2bf1:	89 04 24             	mov    %eax,(%esp)
    2bf4:	e8 2c 1a 00 00       	call   4625 <initPoint>
    2bf9:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    2bfc:	8b 0d e4 3c 01 00    	mov    0x13ce4,%ecx
    2c02:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2c05:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    2c08:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c0c:	89 54 24 08          	mov    %edx,0x8(%esp)
    2c10:	89 0c 24             	mov    %ecx,(%esp)
    2c13:	e8 17 1d 00 00       	call   492f <executeHandler>
    2c18:	85 c0                	test   %eax,%eax
    2c1a:	74 19                	je     2c35 <main+0x1e0>
				updateWindow(winid, context.addr);
    2c1c:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2c21:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2c28:	89 04 24             	mov    %eax,(%esp)
    2c2b:	e8 2b 24 00 00       	call   505b <updateWindow>
			}
			break;
    2c30:	e9 b1 03 00 00       	jmp    2fe6 <main+0x591>
    2c35:	e9 ac 03 00 00       	jmp    2fe6 <main+0x591>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    2c3a:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2c3f:	89 04 24             	mov    %eax,(%esp)
    2c42:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2c47:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c4b:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    2c50:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c54:	e8 40 df ff ff       	call   b99 <drawFinderContent>
			drawFinderWnd(context);
    2c59:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2c5e:	89 04 24             	mov    %eax,(%esp)
    2c61:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2c66:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c6a:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    2c6f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c73:	e8 27 dd ff ff       	call   99f <drawFinderWnd>
			updateWindow(winid, context.addr);
    2c78:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2c7d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2c84:	89 04 24             	mov    %eax,(%esp)
    2c87:	e8 cf 23 00 00       	call   505b <updateWindow>
			break;
    2c8c:	e9 55 03 00 00       	jmp    2fe6 <main+0x591>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    2c91:	8b 75 c8             	mov    -0x38(%ebp),%esi
    2c94:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
    2c97:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2c9a:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2c9d:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2ca2:	89 74 24 14          	mov    %esi,0x14(%esp)
    2ca6:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    2caa:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    2cae:	89 54 24 08          	mov    %edx,0x8(%esp)
    2cb2:	89 44 24 04          	mov    %eax,0x4(%esp)
    2cb6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2cb9:	89 04 24             	mov    %eax,(%esp)
    2cbc:	e8 a2 23 00 00       	call   5063 <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    2cc1:	e9 20 03 00 00       	jmp    2fe6 <main+0x591>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2cc6:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2cc9:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2ccc:	8d 45 80             	lea    -0x80(%ebp),%eax
    2ccf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2cd3:	89 54 24 04          	mov    %edx,0x4(%esp)
    2cd7:	89 04 24             	mov    %eax,(%esp)
    2cda:	e8 46 19 00 00       	call   4625 <initPoint>
    2cdf:	83 ec 04             	sub    $0x4,%esp
    2ce2:	8b 45 80             	mov    -0x80(%ebp),%eax
    2ce5:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2ce8:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2ceb:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if(renaming == 1){
    2cee:	a1 f4 3c 01 00       	mov    0x13cf4,%eax
    2cf3:	83 f8 01             	cmp    $0x1,%eax
    2cf6:	75 19                	jne    2d11 <main+0x2bc>
				unrename();
    2cf8:	e8 e9 f3 ff ff       	call   20e6 <unrename>
				updateWindow(winid, context.addr);
    2cfd:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2d02:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d09:	89 04 24             	mov    %eax,(%esp)
    2d0c:	e8 4a 23 00 00       	call   505b <updateWindow>
			}
			if (executeHandler(cm.left_click, p)) {
    2d11:	8b 0d e0 3c 01 00    	mov    0x13ce0,%ecx
    2d17:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2d1a:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    2d1d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d21:	89 54 24 08          	mov    %edx,0x8(%esp)
    2d25:	89 0c 24             	mov    %ecx,(%esp)
    2d28:	e8 02 1c 00 00       	call   492f <executeHandler>
    2d2d:	85 c0                	test   %eax,%eax
    2d2f:	74 19                	je     2d4a <main+0x2f5>
				updateWindow(winid, context.addr);
    2d31:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2d36:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d3d:	89 04 24             	mov    %eax,(%esp)
    2d40:	e8 16 23 00 00       	call   505b <updateWindow>
			}
			break;
    2d45:	e9 9c 02 00 00       	jmp    2fe6 <main+0x591>
    2d4a:	e9 97 02 00 00       	jmp    2fe6 <main+0x591>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2d4f:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2d52:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2d55:	8d 45 80             	lea    -0x80(%ebp),%eax
    2d58:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2d5c:	89 54 24 04          	mov    %edx,0x4(%esp)
    2d60:	89 04 24             	mov    %eax,(%esp)
    2d63:	e8 bd 18 00 00       	call   4625 <initPoint>
    2d68:	83 ec 04             	sub    $0x4,%esp
    2d6b:	8b 45 80             	mov    -0x80(%ebp),%eax
    2d6e:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2d71:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2d74:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    2d77:	8b 0d e8 3c 01 00    	mov    0x13ce8,%ecx
    2d7d:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2d80:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    2d83:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d87:	89 54 24 08          	mov    %edx,0x8(%esp)
    2d8b:	89 0c 24             	mov    %ecx,(%esp)
    2d8e:	e8 9c 1b 00 00       	call   492f <executeHandler>
    2d93:	85 c0                	test   %eax,%eax
    2d95:	74 19                	je     2db0 <main+0x35b>
				updateWindow(winid, context.addr);
    2d97:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2d9c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2da0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2da3:	89 04 24             	mov    %eax,(%esp)
    2da6:	e8 b0 22 00 00       	call   505b <updateWindow>
			}
			break;
    2dab:	e9 36 02 00 00       	jmp    2fe6 <main+0x591>
    2db0:	e9 31 02 00 00       	jmp    2fe6 <main+0x591>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    2db5:	0f b6 45 bc          	movzbl -0x44(%ebp),%eax
    2db9:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    2dbc:	a1 80 32 01 00       	mov    0x13280,%eax
    2dc1:	85 c0                	test   %eax,%eax
    2dc3:	0f 84 ea 00 00 00    	je     2eb3 <main+0x45e>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    2dc9:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    2dcd:	74 2a                	je     2df9 <main+0x3a4>
    2dcf:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    2dd3:	74 24                	je     2df9 <main+0x3a4>
    2dd5:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    2dd9:	7e 06                	jle    2de1 <main+0x38c>
    2ddb:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    2ddf:	7e 18                	jle    2df9 <main+0x3a4>
    2de1:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    2de5:	7e 06                	jle    2ded <main+0x398>
    2de7:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    2deb:	7e 0c                	jle    2df9 <main+0x3a4>
    2ded:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    2df1:	7e 46                	jle    2e39 <main+0x3e4>
    2df3:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    2df7:	7f 40                	jg     2e39 <main+0x3e4>
    2df9:	a1 c0 3b 01 00       	mov    0x13bc0,%eax
    2dfe:	83 f8 13             	cmp    $0x13,%eax
    2e01:	7f 36                	jg     2e39 <main+0x3e4>
					keyContent.content[keyContent.length++] = key;
    2e03:	a1 c0 3b 01 00       	mov    0x13bc0,%eax
    2e08:	8d 50 01             	lea    0x1(%eax),%edx
    2e0b:	89 15 c0 3b 01 00    	mov    %edx,0x13bc0
    2e11:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    2e15:	88 90 ac 3b 01 00    	mov    %dl,0x13bac(%eax)
					printf(0, "%s\n", keyContent.content);
    2e1b:	c7 44 24 08 ac 3b 01 	movl   $0x13bac,0x8(%esp)
    2e22:	00 
    2e23:	c7 44 24 04 ef b8 00 	movl   $0xb8ef,0x4(%esp)
    2e2a:	00 
    2e2b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e32:	e8 54 23 00 00       	call   518b <printf>
    2e37:	eb 28                	jmp    2e61 <main+0x40c>
				}
				else if (key == 8 && keyContent.length > 0) {
    2e39:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    2e3d:	75 22                	jne    2e61 <main+0x40c>
    2e3f:	a1 c0 3b 01 00       	mov    0x13bc0,%eax
    2e44:	85 c0                	test   %eax,%eax
    2e46:	7e 19                	jle    2e61 <main+0x40c>
					keyContent.content[--keyContent.length] = 0;
    2e48:	a1 c0 3b 01 00       	mov    0x13bc0,%eax
    2e4d:	83 e8 01             	sub    $0x1,%eax
    2e50:	a3 c0 3b 01 00       	mov    %eax,0x13bc0
    2e55:	a1 c0 3b 01 00       	mov    0x13bc0,%eax
    2e5a:	c6 80 ac 3b 01 00 00 	movb   $0x0,0x13bac(%eax)
				}
				drawFinderContent(context);
    2e61:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2e66:	89 04 24             	mov    %eax,(%esp)
    2e69:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2e6e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e72:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    2e77:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e7b:	e8 19 dd ff ff       	call   b99 <drawFinderContent>
				drawFinderWnd(context);
    2e80:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2e85:	89 04 24             	mov    %eax,(%esp)
    2e88:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2e8d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e91:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    2e96:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e9a:	e8 00 db ff ff       	call   99f <drawFinderWnd>
				updateWindow(winid, context.addr);
    2e9f:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2ea4:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ea8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2eab:	89 04 24             	mov    %eax,(%esp)
    2eae:	e8 a8 21 00 00       	call   505b <updateWindow>
			}
			if (renaming) {
    2eb3:	a1 f4 3c 01 00       	mov    0x13cf4,%eax
    2eb8:	85 c0                	test   %eax,%eax
    2eba:	0f 84 23 01 00 00    	je     2fe3 <main+0x58e>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (strlen(currentlyRenaming->name)<30)) {
    2ec0:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    2ec4:	74 2a                	je     2ef0 <main+0x49b>
    2ec6:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    2eca:	74 24                	je     2ef0 <main+0x49b>
    2ecc:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    2ed0:	7e 06                	jle    2ed8 <main+0x483>
    2ed2:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    2ed6:	7e 18                	jle    2ef0 <main+0x49b>
    2ed8:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    2edc:	7e 06                	jle    2ee4 <main+0x48f>
    2ede:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    2ee2:	7e 0c                	jle    2ef0 <main+0x49b>
    2ee4:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    2ee8:	7e 5e                	jle    2f48 <main+0x4f3>
    2eea:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    2eee:	7f 58                	jg     2f48 <main+0x4f3>
    2ef0:	a1 88 04 01 00       	mov    0x10488,%eax
    2ef5:	8b 40 14             	mov    0x14(%eax),%eax
    2ef8:	89 04 24             	mov    %eax,(%esp)
    2efb:	e8 cf 1e 00 00       	call   4dcf <strlen>
    2f00:	83 f8 1d             	cmp    $0x1d,%eax
    2f03:	77 43                	ja     2f48 <main+0x4f3>
					currentlyRenaming->name[strlen(currentlyRenaming->name) + 1] = 0;
    2f05:	a1 88 04 01 00       	mov    0x10488,%eax
    2f0a:	8b 58 14             	mov    0x14(%eax),%ebx
    2f0d:	a1 88 04 01 00       	mov    0x10488,%eax
    2f12:	8b 40 14             	mov    0x14(%eax),%eax
    2f15:	89 04 24             	mov    %eax,(%esp)
    2f18:	e8 b2 1e 00 00       	call   4dcf <strlen>
    2f1d:	83 c0 01             	add    $0x1,%eax
    2f20:	01 d8                	add    %ebx,%eax
    2f22:	c6 00 00             	movb   $0x0,(%eax)
					currentlyRenaming->name[strlen(currentlyRenaming->name)] = key;
    2f25:	a1 88 04 01 00       	mov    0x10488,%eax
    2f2a:	8b 58 14             	mov    0x14(%eax),%ebx
    2f2d:	a1 88 04 01 00       	mov    0x10488,%eax
    2f32:	8b 40 14             	mov    0x14(%eax),%eax
    2f35:	89 04 24             	mov    %eax,(%esp)
    2f38:	e8 92 1e 00 00       	call   4dcf <strlen>
    2f3d:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    2f40:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
    2f44:	88 02                	mov    %al,(%edx)
    2f46:	eb 47                	jmp    2f8f <main+0x53a>
				}
				else if (key == 8 && (strlen(currentlyRenaming->name)>0)) {
    2f48:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    2f4c:	75 36                	jne    2f84 <main+0x52f>
    2f4e:	a1 88 04 01 00       	mov    0x10488,%eax
    2f53:	8b 40 14             	mov    0x14(%eax),%eax
    2f56:	89 04 24             	mov    %eax,(%esp)
    2f59:	e8 71 1e 00 00       	call   4dcf <strlen>
    2f5e:	85 c0                	test   %eax,%eax
    2f60:	74 22                	je     2f84 <main+0x52f>
					currentlyRenaming->name[strlen(currentlyRenaming->name) - 1] = 0;
    2f62:	a1 88 04 01 00       	mov    0x10488,%eax
    2f67:	8b 58 14             	mov    0x14(%eax),%ebx
    2f6a:	a1 88 04 01 00       	mov    0x10488,%eax
    2f6f:	8b 40 14             	mov    0x14(%eax),%eax
    2f72:	89 04 24             	mov    %eax,(%esp)
    2f75:	e8 55 1e 00 00       	call   4dcf <strlen>
    2f7a:	83 e8 01             	sub    $0x1,%eax
    2f7d:	01 d8                	add    %ebx,%eax
    2f7f:	c6 00 00             	movb   $0x0,(%eax)
    2f82:	eb 0b                	jmp    2f8f <main+0x53a>
				} else if (key == '\n') {
    2f84:	80 7d e3 0a          	cmpb   $0xa,-0x1d(%ebp)
    2f88:	75 05                	jne    2f8f <main+0x53a>
					unrename();
    2f8a:	e8 57 f1 ff ff       	call   20e6 <unrename>
				}
				drawFinderContent(context);
    2f8f:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2f94:	89 04 24             	mov    %eax,(%esp)
    2f97:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2f9c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2fa0:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    2fa5:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fa9:	e8 eb db ff ff       	call   b99 <drawFinderContent>
				drawFinderWnd(context);
    2fae:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2fb3:	89 04 24             	mov    %eax,(%esp)
    2fb6:	a1 a4 3b 01 00       	mov    0x13ba4,%eax
    2fbb:	89 44 24 04          	mov    %eax,0x4(%esp)
    2fbf:	a1 a8 3b 01 00       	mov    0x13ba8,%eax
    2fc4:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fc8:	e8 d2 d9 ff ff       	call   99f <drawFinderWnd>
				updateWindow(winid, context.addr);
    2fcd:	a1 a0 3b 01 00       	mov    0x13ba0,%eax
    2fd2:	89 44 24 04          	mov    %eax,0x4(%esp)
    2fd6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2fd9:	89 04 24             	mov    %eax,(%esp)
    2fdc:	e8 7a 20 00 00       	call   505b <updateWindow>
			}
			break;
    2fe1:	eb 03                	jmp    2fe6 <main+0x591>
    2fe3:	eb 01                	jmp    2fe6 <main+0x591>
		default:
			break;
    2fe5:	90                   	nop
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    2fe6:	a1 20 fb 00 00       	mov    0xfb20,%eax
    2feb:	85 c0                	test   %eax,%eax
    2fed:	0f 85 cd fb ff ff    	jne    2bc0 <main+0x16b>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    2ff3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ff6:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ffa:	c7 04 24 a0 3b 01 00 	movl   $0x13ba0,(%esp)
    3001:	e8 93 01 00 00       	call   3199 <free_context>
	exit();
    3006:	e8 98 1f 00 00       	call   4fa3 <exit>

0000300b <testHandlers>:
}

void testHandlers() {
    300b:	55                   	push   %ebp
    300c:	89 e5                	mov    %esp,%ebp
    300e:	83 ec 18             	sub    $0x18,%esp

	list(".");
    3011:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    3018:	e8 2c d2 ff ff       	call   249 <list>
	printf(0, "original list:\n");
    301d:	c7 44 24 04 88 bb 00 	movl   $0xbb88,0x4(%esp)
    3024:	00 
    3025:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    302c:	e8 5a 21 00 00       	call   518b <printf>
	printItemList();
    3031:	e8 f9 df ff ff       	call   102f <printItemList>
	printf(0, "\n");
    3036:	c7 44 24 04 98 bb 00 	movl   $0xbb98,0x4(%esp)
    303d:	00 
    303e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3045:	e8 41 21 00 00       	call   518b <printf>
	printf(0, "new a folder:\n");
    304a:	c7 44 24 04 9a bb 00 	movl   $0xbb9a,0x4(%esp)
    3051:	00 
    3052:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3059:	e8 2d 21 00 00       	call   518b <printf>
	newFolder("newfolder");
    305e:	c7 04 24 a9 bb 00 00 	movl   $0xbba9,(%esp)
    3065:	e8 f9 ea ff ff       	call   1b63 <newFolder>
	freeFileItemList();
    306a:	e8 fc d0 ff ff       	call   16b <freeFileItemList>
	list(".");
    306f:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    3076:	e8 ce d1 ff ff       	call   249 <list>
	printItemList();
    307b:	e8 af df ff ff       	call   102f <printItemList>
	printf(0, "\n");
    3080:	c7 44 24 04 98 bb 00 	movl   $0xbb98,0x4(%esp)
    3087:	00 
    3088:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    308f:	e8 f7 20 00 00       	call   518b <printf>
	printf(0, "enter new folder:\n");
    3094:	c7 44 24 04 b3 bb 00 	movl   $0xbbb3,0x4(%esp)
    309b:	00 
    309c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30a3:	e8 e3 20 00 00       	call   518b <printf>
	enterDir("newfolder");
    30a8:	c7 04 24 a9 bb 00 00 	movl   $0xbba9,(%esp)
    30af:	e8 5d e7 ff ff       	call   1811 <enterDir>
	freeFileItemList();
    30b4:	e8 b2 d0 ff ff       	call   16b <freeFileItemList>
	list(".");
    30b9:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    30c0:	e8 84 d1 ff ff       	call   249 <list>
	printItemList();
    30c5:	e8 65 df ff ff       	call   102f <printItemList>
	printf(0, "\n");
    30ca:	c7 44 24 04 98 bb 00 	movl   $0xbb98,0x4(%esp)
    30d1:	00 
    30d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30d9:	e8 ad 20 00 00       	call   518b <printf>
	printf(0, "new a file:\n");
    30de:	c7 44 24 04 c6 bb 00 	movl   $0xbbc6,0x4(%esp)
    30e5:	00 
    30e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30ed:	e8 99 20 00 00       	call   518b <printf>
	newFile("newfile.txt");
    30f2:	c7 04 24 d3 bb 00 00 	movl   $0xbbd3,(%esp)
    30f9:	e8 7b e8 ff ff       	call   1979 <newFile>
	freeFileItemList();
    30fe:	e8 68 d0 ff ff       	call   16b <freeFileItemList>
	list(".");
    3103:	c7 04 24 27 b9 00 00 	movl   $0xb927,(%esp)
    310a:	e8 3a d1 ff ff       	call   249 <list>
	printItemList();
    310f:	e8 1b df ff ff       	call   102f <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    3114:	c9                   	leave  
    3115:	c3                   	ret    

00003116 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    3116:	55                   	push   %ebp
    3117:	89 e5                	mov    %esp,%ebp
    3119:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    311c:	8b 45 08             	mov    0x8(%ebp),%eax
    311f:	8b 55 0c             	mov    0xc(%ebp),%edx
    3122:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    3125:	8b 45 08             	mov    0x8(%ebp),%eax
    3128:	8b 55 10             	mov    0x10(%ebp),%edx
    312b:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    312e:	8b 55 0c             	mov    0xc(%ebp),%edx
    3131:	8b 45 10             	mov    0x10(%ebp),%eax
    3134:	0f af c2             	imul   %edx,%eax
    3137:	01 c0                	add    %eax,%eax
    3139:	89 04 24             	mov    %eax,(%esp)
    313c:	e8 36 23 00 00       	call   5477 <malloc>
    3141:	8b 55 08             	mov    0x8(%ebp),%edx
    3144:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    3146:	8b 55 0c             	mov    0xc(%ebp),%edx
    3149:	8b 45 10             	mov    0x10(%ebp),%eax
    314c:	0f af c2             	imul   %edx,%eax
    314f:	8d 14 00             	lea    (%eax,%eax,1),%edx
    3152:	8b 45 08             	mov    0x8(%ebp),%eax
    3155:	8b 00                	mov    (%eax),%eax
    3157:	89 54 24 08          	mov    %edx,0x8(%esp)
    315b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3162:	00 
    3163:	89 04 24             	mov    %eax,(%esp)
    3166:	e8 8b 1c 00 00       	call   4df6 <memset>
    initializeASCII();
    316b:	e8 93 01 00 00       	call   3303 <initializeASCII>
    initializeGBK();
    3170:	e8 17 03 00 00       	call   348c <initializeGBK>
    return createWindow(0, 0, width, height);
    3175:	8b 45 10             	mov    0x10(%ebp),%eax
    3178:	89 44 24 0c          	mov    %eax,0xc(%esp)
    317c:	8b 45 0c             	mov    0xc(%ebp),%eax
    317f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3183:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    318a:	00 
    318b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3192:	e8 b4 1e 00 00       	call   504b <createWindow>
}
    3197:	c9                   	leave  
    3198:	c3                   	ret    

00003199 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    3199:	55                   	push   %ebp
    319a:	89 e5                	mov    %esp,%ebp
    319c:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    319f:	8b 45 08             	mov    0x8(%ebp),%eax
    31a2:	8b 00                	mov    (%eax),%eax
    31a4:	89 04 24             	mov    %eax,(%esp)
    31a7:	e8 92 21 00 00       	call   533e <free>
    freeASCII();
    31ac:	e8 c6 02 00 00       	call   3477 <freeASCII>
    freeGBK();
    31b1:	e8 7e 03 00 00       	call   3534 <freeGBK>
    destroyWindow(winid);
    31b6:	8b 45 0c             	mov    0xc(%ebp),%eax
    31b9:	89 04 24             	mov    %eax,(%esp)
    31bc:	e8 92 1e 00 00       	call   5053 <destroyWindow>
}
    31c1:	c9                   	leave  
    31c2:	c3                   	ret    

000031c3 <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    31c3:	55                   	push   %ebp
    31c4:	89 e5                	mov    %esp,%ebp
    31c6:	83 ec 04             	sub    $0x4,%esp
    31c9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    31cc:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    31d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    31d3:	3b 45 14             	cmp    0x14(%ebp),%eax
    31d6:	77 02                	ja     31da <draw_point+0x17>
    return;
    31d8:	eb 26                	jmp    3200 <draw_point+0x3d>
  if(y >= c.height)
    31da:	8b 45 10             	mov    0x10(%ebp),%eax
    31dd:	3b 45 18             	cmp    0x18(%ebp),%eax
    31e0:	77 02                	ja     31e4 <draw_point+0x21>
    return;
    31e2:	eb 1c                	jmp    3200 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    31e4:	8b 55 08             	mov    0x8(%ebp),%edx
    31e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    31ea:	0f af 45 18          	imul   0x18(%ebp),%eax
    31ee:	89 c1                	mov    %eax,%ecx
    31f0:	8b 45 14             	mov    0x14(%ebp),%eax
    31f3:	01 c8                	add    %ecx,%eax
    31f5:	01 c0                	add    %eax,%eax
    31f7:	01 c2                	add    %eax,%edx
    31f9:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    31fd:	66 89 02             	mov    %ax,(%edx)
}
    3200:	c9                   	leave  
    3201:	c3                   	ret    

00003202 <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    3202:	55                   	push   %ebp
    3203:	89 e5                	mov    %esp,%ebp
    3205:	83 ec 2c             	sub    $0x2c,%esp
    3208:	8b 45 24             	mov    0x24(%ebp),%eax
    320b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    320f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3212:	8b 55 14             	mov    0x14(%ebp),%edx
    3215:	01 c2                	add    %eax,%edx
    3217:	8b 45 0c             	mov    0xc(%ebp),%eax
    321a:	39 c2                	cmp    %eax,%edx
    321c:	0f 46 c2             	cmovbe %edx,%eax
    321f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    3222:	8b 45 20             	mov    0x20(%ebp),%eax
    3225:	8b 55 18             	mov    0x18(%ebp),%edx
    3228:	01 c2                	add    %eax,%edx
    322a:	8b 45 10             	mov    0x10(%ebp),%eax
    322d:	39 c2                	cmp    %eax,%edx
    322f:	0f 46 c2             	cmovbe %edx,%eax
    3232:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    3235:	8b 45 18             	mov    0x18(%ebp),%eax
    3238:	89 45 f8             	mov    %eax,-0x8(%ebp)
    323b:	eb 47                	jmp    3284 <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    323d:	8b 45 14             	mov    0x14(%ebp),%eax
    3240:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3243:	eb 33                	jmp    3278 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    3245:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    3249:	8b 55 f8             	mov    -0x8(%ebp),%edx
    324c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    324f:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3253:	89 54 24 10          	mov    %edx,0x10(%esp)
    3257:	89 44 24 0c          	mov    %eax,0xc(%esp)
    325b:	8b 45 08             	mov    0x8(%ebp),%eax
    325e:	89 04 24             	mov    %eax,(%esp)
    3261:	8b 45 0c             	mov    0xc(%ebp),%eax
    3264:	89 44 24 04          	mov    %eax,0x4(%esp)
    3268:	8b 45 10             	mov    0x10(%ebp),%eax
    326b:	89 44 24 08          	mov    %eax,0x8(%esp)
    326f:	e8 4f ff ff ff       	call   31c3 <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    3274:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3278:	8b 45 fc             	mov    -0x4(%ebp),%eax
    327b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    327e:	7c c5                	jl     3245 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    3280:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3284:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3287:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    328a:	7c b1                	jl     323d <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    328c:	c9                   	leave  
    328d:	c3                   	ret    

0000328e <printBinary>:

void printBinary(char c)
{
    328e:	55                   	push   %ebp
    328f:	89 e5                	mov    %esp,%ebp
    3291:	83 ec 28             	sub    $0x28,%esp
    3294:	8b 45 08             	mov    0x8(%ebp),%eax
    3297:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    329a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    32a1:	eb 44                	jmp    32e7 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    32a3:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    32a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32aa:	89 c1                	mov    %eax,%ecx
    32ac:	d3 e2                	shl    %cl,%edx
    32ae:	89 d0                	mov    %edx,%eax
    32b0:	25 80 00 00 00       	and    $0x80,%eax
    32b5:	85 c0                	test   %eax,%eax
    32b7:	74 16                	je     32cf <printBinary+0x41>
		{
			printf(0, "1");
    32b9:	c7 44 24 04 df bb 00 	movl   $0xbbdf,0x4(%esp)
    32c0:	00 
    32c1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32c8:	e8 be 1e 00 00       	call   518b <printf>
    32cd:	eb 14                	jmp    32e3 <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    32cf:	c7 44 24 04 e1 bb 00 	movl   $0xbbe1,0x4(%esp)
    32d6:	00 
    32d7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32de:	e8 a8 1e 00 00       	call   518b <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    32e3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    32e7:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    32eb:	7e b6                	jle    32a3 <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    32ed:	c7 44 24 04 e3 bb 00 	movl   $0xbbe3,0x4(%esp)
    32f4:	00 
    32f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32fc:	e8 8a 1e 00 00       	call   518b <printf>
}
    3301:	c9                   	leave  
    3302:	c3                   	ret    

00003303 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    3303:	55                   	push   %ebp
    3304:	89 e5                	mov    %esp,%ebp
    3306:	56                   	push   %esi
    3307:	53                   	push   %ebx
    3308:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    330b:	c7 44 24 04 e5 bb 00 	movl   $0xbbe5,0x4(%esp)
    3312:	00 
    3313:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    331a:	e8 6c 1e 00 00       	call   518b <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    331f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3326:	00 
    3327:	c7 04 24 f8 bb 00 00 	movl   $0xbbf8,(%esp)
    332e:	e8 b0 1c 00 00       	call   4fe3 <open>
    3333:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3336:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    333a:	79 21                	jns    335d <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    333c:	c7 44 24 08 f8 bb 00 	movl   $0xbbf8,0x8(%esp)
    3343:	00 
    3344:	c7 44 24 04 04 bc 00 	movl   $0xbc04,0x4(%esp)
    334b:	00 
    334c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3353:	e8 33 1e 00 00       	call   518b <printf>
	  return;
    3358:	e9 13 01 00 00       	jmp    3470 <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    335d:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3364:	e8 0e 21 00 00       	call   5477 <malloc>
    3369:	a3 00 3d 01 00       	mov    %eax,0x13d00
	for (i = 0; i < ASCII_NUM; i++)
    336e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3375:	eb 12                	jmp    3389 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    3377:	8b 15 00 3d 01 00    	mov    0x13d00,%edx
    337d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3380:	01 d0                	add    %edx,%eax
    3382:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    3385:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3389:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    3390:	7e e5                	jle    3377 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    3392:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    3399:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    33a0:	e9 84 00 00 00       	jmp    3429 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    33a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    33ac:	eb 73                	jmp    3421 <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    33ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33b1:	05 20 3d 01 00       	add    $0x13d20,%eax
    33b6:	0f b6 00             	movzbl (%eax),%eax
    33b9:	3c 2a                	cmp    $0x2a,%al
    33bb:	74 0f                	je     33cc <initializeASCII+0xc9>
    33bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33c0:	05 20 3d 01 00       	add    $0x13d20,%eax
    33c5:	0f b6 00             	movzbl (%eax),%eax
    33c8:	3c 2e                	cmp    $0x2e,%al
    33ca:	75 51                	jne    341d <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    33cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33cf:	05 20 3d 01 00       	add    $0x13d20,%eax
    33d4:	0f b6 00             	movzbl (%eax),%eax
    33d7:	3c 2a                	cmp    $0x2a,%al
    33d9:	75 2d                	jne    3408 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    33db:	8b 15 00 3d 01 00    	mov    0x13d00,%edx
    33e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33e4:	01 c2                	add    %eax,%edx
    33e6:	8b 0d 00 3d 01 00    	mov    0x13d00,%ecx
    33ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33ef:	01 c8                	add    %ecx,%eax
    33f1:	0f b6 00             	movzbl (%eax),%eax
    33f4:	89 c3                	mov    %eax,%ebx
    33f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    33f9:	be 80 00 00 00       	mov    $0x80,%esi
    33fe:	89 c1                	mov    %eax,%ecx
    3400:	d3 fe                	sar    %cl,%esi
    3402:	89 f0                	mov    %esi,%eax
    3404:	09 d8                	or     %ebx,%eax
    3406:	88 02                	mov    %al,(%edx)
				}
				x ++;
    3408:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    340c:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    3410:	7e 0b                	jle    341d <initializeASCII+0x11a>
				{
					x = 0;
    3412:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    3419:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    341d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3421:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3424:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    3427:	7c 85                	jl     33ae <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    3429:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3430:	00 
    3431:	c7 44 24 04 20 3d 01 	movl   $0x13d20,0x4(%esp)
    3438:	00 
    3439:	8b 45 e8             	mov    -0x18(%ebp),%eax
    343c:	89 04 24             	mov    %eax,(%esp)
    343f:	e8 77 1b 00 00       	call   4fbb <read>
    3444:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3447:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    344b:	0f 8f 54 ff ff ff    	jg     33a5 <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    3451:	c7 44 24 04 14 bc 00 	movl   $0xbc14,0x4(%esp)
    3458:	00 
    3459:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3460:	e8 26 1d 00 00       	call   518b <printf>
	close(fd);
    3465:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3468:	89 04 24             	mov    %eax,(%esp)
    346b:	e8 5b 1b 00 00       	call   4fcb <close>
}
    3470:	83 c4 30             	add    $0x30,%esp
    3473:	5b                   	pop    %ebx
    3474:	5e                   	pop    %esi
    3475:	5d                   	pop    %ebp
    3476:	c3                   	ret    

00003477 <freeASCII>:

void freeASCII(){
    3477:	55                   	push   %ebp
    3478:	89 e5                	mov    %esp,%ebp
    347a:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    347d:	a1 00 3d 01 00       	mov    0x13d00,%eax
    3482:	89 04 24             	mov    %eax,(%esp)
    3485:	e8 b4 1e 00 00       	call   533e <free>
}
    348a:	c9                   	leave  
    348b:	c3                   	ret    

0000348c <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    348c:	55                   	push   %ebp
    348d:	89 e5                	mov    %esp,%ebp
    348f:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    3492:	c7 44 24 04 31 bc 00 	movl   $0xbc31,0x4(%esp)
    3499:	00 
    349a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34a1:	e8 e5 1c 00 00       	call   518b <printf>
	if((fd = open(HZK16, 0)) < 0){
    34a6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    34ad:	00 
    34ae:	c7 04 24 42 bc 00 00 	movl   $0xbc42,(%esp)
    34b5:	e8 29 1b 00 00       	call   4fe3 <open>
    34ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    34bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    34c1:	79 1e                	jns    34e1 <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    34c3:	c7 44 24 08 42 bc 00 	movl   $0xbc42,0x8(%esp)
    34ca:	00 
    34cb:	c7 44 24 04 04 bc 00 	movl   $0xbc04,0x4(%esp)
    34d2:	00 
    34d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34da:	e8 ac 1c 00 00       	call   518b <printf>
		return;
    34df:	eb 51                	jmp    3532 <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    34e1:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    34e8:	e8 8a 1f 00 00       	call   5477 <malloc>
    34ed:	a3 04 3d 01 00       	mov    %eax,0x13d04
	fontFile.size = read(fd, fontFile.buf, 27000);
    34f2:	a1 04 3d 01 00       	mov    0x13d04,%eax
    34f7:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    34fe:	00 
    34ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    3503:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3506:	89 04 24             	mov    %eax,(%esp)
    3509:	e8 ad 1a 00 00       	call   4fbb <read>
    350e:	a3 08 3d 01 00       	mov    %eax,0x13d08
	printf(0,"initialzing gbk complete!\n");
    3513:	c7 44 24 04 4c bc 00 	movl   $0xbc4c,0x4(%esp)
    351a:	00 
    351b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3522:	e8 64 1c 00 00       	call   518b <printf>
	close(fd);
    3527:	8b 45 f4             	mov    -0xc(%ebp),%eax
    352a:	89 04 24             	mov    %eax,(%esp)
    352d:	e8 99 1a 00 00       	call   4fcb <close>
}
    3532:	c9                   	leave  
    3533:	c3                   	ret    

00003534 <freeGBK>:

void freeGBK(){
    3534:	55                   	push   %ebp
    3535:	89 e5                	mov    %esp,%ebp
    3537:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    353a:	a1 04 3d 01 00       	mov    0x13d04,%eax
    353f:	89 04 24             	mov    %eax,(%esp)
    3542:	e8 f7 1d 00 00       	call   533e <free>
}
    3547:	c9                   	leave  
    3548:	c3                   	ret    

00003549 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    3549:	55                   	push   %ebp
    354a:	89 e5                	mov    %esp,%ebp
    354c:	53                   	push   %ebx
    354d:	83 ec 30             	sub    $0x30,%esp
    3550:	8b 55 14             	mov    0x14(%ebp),%edx
    3553:	8b 45 18             	mov    0x18(%ebp),%eax
    3556:	88 55 e8             	mov    %dl,-0x18(%ebp)
    3559:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    355d:	8b 45 20             	mov    0x20(%ebp),%eax
    3560:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3563:	eb 7f                	jmp    35e4 <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    3565:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    356c:	eb 6c                	jmp    35da <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    356e:	a1 00 3d 01 00       	mov    0x13d00,%eax
    3573:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    3577:	c1 e2 04             	shl    $0x4,%edx
    357a:	89 d1                	mov    %edx,%ecx
    357c:	8b 55 20             	mov    0x20(%ebp),%edx
    357f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3582:	29 d3                	sub    %edx,%ebx
    3584:	89 da                	mov    %ebx,%edx
    3586:	01 ca                	add    %ecx,%edx
    3588:	01 d0                	add    %edx,%eax
    358a:	0f b6 00             	movzbl (%eax),%eax
    358d:	0f b6 d0             	movzbl %al,%edx
    3590:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3593:	89 c1                	mov    %eax,%ecx
    3595:	d3 e2                	shl    %cl,%edx
    3597:	89 d0                	mov    %edx,%eax
    3599:	25 80 00 00 00       	and    $0x80,%eax
    359e:	85 c0                	test   %eax,%eax
    35a0:	74 34                	je     35d6 <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    35a2:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    35a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    35ac:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    35af:	01 d8                	add    %ebx,%eax
    35b1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    35b5:	89 54 24 10          	mov    %edx,0x10(%esp)
    35b9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    35bd:	8b 45 08             	mov    0x8(%ebp),%eax
    35c0:	89 04 24             	mov    %eax,(%esp)
    35c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    35c6:	89 44 24 04          	mov    %eax,0x4(%esp)
    35ca:	8b 45 10             	mov    0x10(%ebp),%eax
    35cd:	89 44 24 08          	mov    %eax,0x8(%esp)
    35d1:	e8 ed fb ff ff       	call   31c3 <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    35d6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    35da:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    35de:	7e 8e                	jle    356e <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    35e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    35e4:	8b 45 20             	mov    0x20(%ebp),%eax
    35e7:	83 c0 10             	add    $0x10,%eax
    35ea:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    35ed:	0f 8f 72 ff ff ff    	jg     3565 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    35f3:	83 c4 30             	add    $0x30,%esp
    35f6:	5b                   	pop    %ebx
    35f7:	5d                   	pop    %ebp
    35f8:	c3                   	ret    

000035f9 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    35f9:	55                   	push   %ebp
    35fa:	89 e5                	mov    %esp,%ebp
    35fc:	53                   	push   %ebx
    35fd:	83 ec 34             	sub    $0x34,%esp
    3600:	8b 55 14             	mov    0x14(%ebp),%edx
    3603:	8b 45 18             	mov    0x18(%ebp),%eax
    3606:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    360a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    360e:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    3612:	0f b6 c0             	movzbl %al,%eax
    3615:	3d a0 00 00 00       	cmp    $0xa0,%eax
    361a:	0f 8e 40 01 00 00    	jle    3760 <put_gbk+0x167>
    3620:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3624:	66 c1 f8 08          	sar    $0x8,%ax
    3628:	98                   	cwtl   
    3629:	0f b6 c0             	movzbl %al,%eax
    362c:	3d a0 00 00 00       	cmp    $0xa0,%eax
    3631:	0f 8e 29 01 00 00    	jle    3760 <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    3637:	a1 04 3d 01 00       	mov    0x13d04,%eax
    363c:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    363f:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    3643:	0f b6 c0             	movzbl %al,%eax
    3646:	2d a1 00 00 00       	sub    $0xa1,%eax
    364b:	6b c0 5e             	imul   $0x5e,%eax,%eax
    364e:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    3652:	66 c1 fa 08          	sar    $0x8,%dx
    3656:	0f bf d2             	movswl %dx,%edx
    3659:	0f b6 d2             	movzbl %dl,%edx
    365c:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    3662:	01 d0                	add    %edx,%eax
    3664:	c1 e0 05             	shl    $0x5,%eax
    3667:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    366a:	8b 45 20             	mov    0x20(%ebp),%eax
    366d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3670:	e9 da 00 00 00       	jmp    374f <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3675:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    367c:	eb 58                	jmp    36d6 <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    367e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3681:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3684:	01 d0                	add    %edx,%eax
    3686:	0f b6 00             	movzbl (%eax),%eax
    3689:	0f b6 d0             	movzbl %al,%edx
    368c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    368f:	89 c1                	mov    %eax,%ecx
    3691:	d3 e2                	shl    %cl,%edx
    3693:	89 d0                	mov    %edx,%eax
    3695:	25 80 00 00 00       	and    $0x80,%eax
    369a:	85 c0                	test   %eax,%eax
    369c:	74 34                	je     36d2 <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    369e:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    36a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    36a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    36a8:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    36ab:	01 d8                	add    %ebx,%eax
    36ad:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    36b1:	89 54 24 10          	mov    %edx,0x10(%esp)
    36b5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    36b9:	8b 45 08             	mov    0x8(%ebp),%eax
    36bc:	89 04 24             	mov    %eax,(%esp)
    36bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    36c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    36c6:	8b 45 10             	mov    0x10(%ebp),%eax
    36c9:	89 44 24 08          	mov    %eax,0x8(%esp)
    36cd:	e8 f1 fa ff ff       	call   31c3 <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    36d2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    36d6:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    36da:	7e a2                	jle    367e <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    36dc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    36e0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    36e7:	eb 58                	jmp    3741 <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    36e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36ec:	8b 55 ec             	mov    -0x14(%ebp),%edx
    36ef:	01 d0                	add    %edx,%eax
    36f1:	0f b6 00             	movzbl (%eax),%eax
    36f4:	0f b6 d0             	movzbl %al,%edx
    36f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    36fa:	89 c1                	mov    %eax,%ecx
    36fc:	d3 e2                	shl    %cl,%edx
    36fe:	89 d0                	mov    %edx,%eax
    3700:	25 80 00 00 00       	and    $0x80,%eax
    3705:	85 c0                	test   %eax,%eax
    3707:	74 34                	je     373d <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3709:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    370d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3710:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3713:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3716:	01 d8                	add    %ebx,%eax
    3718:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    371c:	89 54 24 10          	mov    %edx,0x10(%esp)
    3720:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3724:	8b 45 08             	mov    0x8(%ebp),%eax
    3727:	89 04 24             	mov    %eax,(%esp)
    372a:	8b 45 0c             	mov    0xc(%ebp),%eax
    372d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3731:	8b 45 10             	mov    0x10(%ebp),%eax
    3734:	89 44 24 08          	mov    %eax,0x8(%esp)
    3738:	e8 86 fa ff ff       	call   31c3 <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    373d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3741:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    3745:	7e a2                	jle    36e9 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    3747:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    374b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    374f:	8b 45 20             	mov    0x20(%ebp),%eax
    3752:	83 c0 10             	add    $0x10,%eax
    3755:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3758:	0f 8f 17 ff ff ff    	jg     3675 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    375e:	eb 7b                	jmp    37db <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    3760:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3764:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3768:	0f b6 c0             	movzbl %al,%eax
    376b:	8b 4d 20             	mov    0x20(%ebp),%ecx
    376e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3772:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    3775:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3779:	89 54 24 10          	mov    %edx,0x10(%esp)
    377d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3781:	8b 45 08             	mov    0x8(%ebp),%eax
    3784:	89 04 24             	mov    %eax,(%esp)
    3787:	8b 45 0c             	mov    0xc(%ebp),%eax
    378a:	89 44 24 04          	mov    %eax,0x4(%esp)
    378e:	8b 45 10             	mov    0x10(%ebp),%eax
    3791:	89 44 24 08          	mov    %eax,0x8(%esp)
    3795:	e8 af fd ff ff       	call   3549 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    379a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    379d:	8d 58 08             	lea    0x8(%eax),%ebx
    37a0:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    37a4:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    37a8:	66 c1 f8 08          	sar    $0x8,%ax
    37ac:	0f b6 c0             	movzbl %al,%eax
    37af:	8b 4d 20             	mov    0x20(%ebp),%ecx
    37b2:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    37b6:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    37ba:	89 54 24 10          	mov    %edx,0x10(%esp)
    37be:	89 44 24 0c          	mov    %eax,0xc(%esp)
    37c2:	8b 45 08             	mov    0x8(%ebp),%eax
    37c5:	89 04 24             	mov    %eax,(%esp)
    37c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    37cb:	89 44 24 04          	mov    %eax,0x4(%esp)
    37cf:	8b 45 10             	mov    0x10(%ebp),%eax
    37d2:	89 44 24 08          	mov    %eax,0x8(%esp)
    37d6:	e8 6e fd ff ff       	call   3549 <put_ascii>
	}
}
    37db:	83 c4 34             	add    $0x34,%esp
    37de:	5b                   	pop    %ebx
    37df:	5d                   	pop    %ebp
    37e0:	c3                   	ret    

000037e1 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    37e1:	55                   	push   %ebp
    37e2:	89 e5                	mov    %esp,%ebp
    37e4:	83 ec 38             	sub    $0x38,%esp
    37e7:	8b 45 18             	mov    0x18(%ebp),%eax
    37ea:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    37ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    37f5:	8b 45 14             	mov    0x14(%ebp),%eax
    37f8:	89 04 24             	mov    %eax,(%esp)
    37fb:	e8 cf 15 00 00       	call   4dcf <strlen>
    3800:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    3803:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    380a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    380d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3810:	eb 49                	jmp    385b <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    3812:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3816:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3819:	8b 45 14             	mov    0x14(%ebp),%eax
    381c:	01 c8                	add    %ecx,%eax
    381e:	0f b6 00             	movzbl (%eax),%eax
    3821:	0f b6 c0             	movzbl %al,%eax
    3824:	8b 4d 20             	mov    0x20(%ebp),%ecx
    3827:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    382b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    382e:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3832:	89 54 24 10          	mov    %edx,0x10(%esp)
    3836:	89 44 24 0c          	mov    %eax,0xc(%esp)
    383a:	8b 45 08             	mov    0x8(%ebp),%eax
    383d:	89 04 24             	mov    %eax,(%esp)
    3840:	8b 45 0c             	mov    0xc(%ebp),%eax
    3843:	89 44 24 04          	mov    %eax,0x4(%esp)
    3847:	8b 45 10             	mov    0x10(%ebp),%eax
    384a:	89 44 24 08          	mov    %eax,0x8(%esp)
    384e:	e8 f6 fc ff ff       	call   3549 <put_ascii>
			xTmp += 8;
    3853:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    3857:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    385b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    385e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3861:	72 af                	jb     3812 <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    3863:	c9                   	leave  
    3864:	c3                   	ret    

00003865 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    3865:	55                   	push   %ebp
    3866:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    3868:	8b 45 10             	mov    0x10(%ebp),%eax
    386b:	8d 50 07             	lea    0x7(%eax),%edx
    386e:	85 c0                	test   %eax,%eax
    3870:	0f 48 c2             	cmovs  %edx,%eax
    3873:	c1 f8 03             	sar    $0x3,%eax
    3876:	89 c2                	mov    %eax,%edx
    3878:	8b 45 0c             	mov    0xc(%ebp),%eax
    387b:	8d 48 03             	lea    0x3(%eax),%ecx
    387e:	85 c0                	test   %eax,%eax
    3880:	0f 48 c1             	cmovs  %ecx,%eax
    3883:	c1 f8 02             	sar    $0x2,%eax
    3886:	c1 e0 05             	shl    $0x5,%eax
    3889:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    388c:	8b 45 08             	mov    0x8(%ebp),%eax
    388f:	8d 50 07             	lea    0x7(%eax),%edx
    3892:	85 c0                	test   %eax,%eax
    3894:	0f 48 c2             	cmovs  %edx,%eax
    3897:	c1 f8 03             	sar    $0x3,%eax
    389a:	c1 e0 0b             	shl    $0xb,%eax
    389d:	01 c8                	add    %ecx,%eax
}
    389f:	5d                   	pop    %ebp
    38a0:	c3                   	ret    

000038a1 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    38a1:	55                   	push   %ebp
    38a2:	89 e5                	mov    %esp,%ebp
    38a4:	53                   	push   %ebx
    38a5:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    38a8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    38af:	e9 b1 00 00 00       	jmp    3965 <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    38b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    38bb:	e9 95 00 00 00       	jmp    3955 <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    38c0:	8b 55 14             	mov    0x14(%ebp),%edx
    38c3:	8b 45 18             	mov    0x18(%ebp),%eax
    38c6:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    38ca:	89 c1                	mov    %eax,%ecx
    38cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38cf:	01 c8                	add    %ecx,%eax
    38d1:	c1 e0 02             	shl    $0x2,%eax
    38d4:	01 d0                	add    %edx,%eax
    38d6:	8b 00                	mov    (%eax),%eax
    38d8:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    38db:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    38df:	3c 01                	cmp    $0x1,%al
    38e1:	75 02                	jne    38e5 <draw_picture+0x44>
    38e3:	eb 6c                	jmp    3951 <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    38e5:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    38e9:	0f b6 c8             	movzbl %al,%ecx
    38ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    38f0:	0f b6 d0             	movzbl %al,%edx
    38f3:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    38f7:	0f b6 c0             	movzbl %al,%eax
    38fa:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    38fe:	89 54 24 04          	mov    %edx,0x4(%esp)
    3902:	89 04 24             	mov    %eax,(%esp)
    3905:	e8 5b ff ff ff       	call   3865 <_RGB16BIT565>
    390a:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    390e:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    3912:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3915:	83 e8 01             	sub    $0x1,%eax
    3918:	2b 45 f8             	sub    -0x8(%ebp),%eax
    391b:	89 c2                	mov    %eax,%edx
    391d:	8b 45 24             	mov    0x24(%ebp),%eax
    3920:	01 d0                	add    %edx,%eax
    3922:	89 c2                	mov    %eax,%edx
    3924:	8b 45 20             	mov    0x20(%ebp),%eax
    3927:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    392a:	01 d8                	add    %ebx,%eax
    392c:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3930:	89 54 24 10          	mov    %edx,0x10(%esp)
    3934:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3938:	8b 45 08             	mov    0x8(%ebp),%eax
    393b:	89 04 24             	mov    %eax,(%esp)
    393e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3941:	89 44 24 04          	mov    %eax,0x4(%esp)
    3945:	8b 45 10             	mov    0x10(%ebp),%eax
    3948:	89 44 24 08          	mov    %eax,0x8(%esp)
    394c:	e8 72 f8 ff ff       	call   31c3 <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    3951:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3955:	8b 45 18             	mov    0x18(%ebp),%eax
    3958:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    395b:	0f 8f 5f ff ff ff    	jg     38c0 <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    3961:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3965:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3968:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    396b:	0f 8f 43 ff ff ff    	jg     38b4 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    3971:	83 c4 28             	add    $0x28,%esp
    3974:	5b                   	pop    %ebx
    3975:	5d                   	pop    %ebp
    3976:	c3                   	ret    

00003977 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    3977:	55                   	push   %ebp
    3978:	89 e5                	mov    %esp,%ebp
    397a:	83 ec 3c             	sub    $0x3c,%esp
    397d:	8b 45 24             	mov    0x24(%ebp),%eax
    3980:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    3984:	8b 45 14             	mov    0x14(%ebp),%eax
    3987:	8b 55 1c             	mov    0x1c(%ebp),%edx
    398a:	29 c2                	sub    %eax,%edx
    398c:	89 d0                	mov    %edx,%eax
    398e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    3991:	8b 45 18             	mov    0x18(%ebp),%eax
    3994:	8b 55 20             	mov    0x20(%ebp),%edx
    3997:	29 c2                	sub    %eax,%edx
    3999:	89 d0                	mov    %edx,%eax
    399b:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    399e:	8b 45 14             	mov    0x14(%ebp),%eax
    39a1:	c1 e0 0a             	shl    $0xa,%eax
    39a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    39a7:	8b 45 18             	mov    0x18(%ebp),%eax
    39aa:	c1 e0 0a             	shl    $0xa,%eax
    39ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    39b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    39b3:	c1 f8 1f             	sar    $0x1f,%eax
    39b6:	31 45 fc             	xor    %eax,-0x4(%ebp)
    39b9:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    39bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    39bf:	c1 f8 1f             	sar    $0x1f,%eax
    39c2:	31 45 f8             	xor    %eax,-0x8(%ebp)
    39c5:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    39c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    39cb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    39ce:	7c 57                	jl     3a27 <draw_line+0xb0>
		len = dx + 1;
    39d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    39d3:	83 c0 01             	add    $0x1,%eax
    39d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    39d9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    39dc:	3b 45 14             	cmp    0x14(%ebp),%eax
    39df:	7e 07                	jle    39e8 <draw_line+0x71>
    39e1:	b8 00 04 00 00       	mov    $0x400,%eax
    39e6:	eb 05                	jmp    39ed <draw_line+0x76>
    39e8:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    39ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    39f0:	8b 45 20             	mov    0x20(%ebp),%eax
    39f3:	3b 45 18             	cmp    0x18(%ebp),%eax
    39f6:	7c 16                	jl     3a0e <draw_line+0x97>
    39f8:	8b 45 18             	mov    0x18(%ebp),%eax
    39fb:	8b 55 20             	mov    0x20(%ebp),%edx
    39fe:	29 c2                	sub    %eax,%edx
    3a00:	89 d0                	mov    %edx,%eax
    3a02:	83 c0 01             	add    $0x1,%eax
    3a05:	c1 e0 0a             	shl    $0xa,%eax
    3a08:	99                   	cltd   
    3a09:	f7 7d ec             	idivl  -0x14(%ebp)
    3a0c:	eb 14                	jmp    3a22 <draw_line+0xab>
    3a0e:	8b 45 18             	mov    0x18(%ebp),%eax
    3a11:	8b 55 20             	mov    0x20(%ebp),%edx
    3a14:	29 c2                	sub    %eax,%edx
    3a16:	89 d0                	mov    %edx,%eax
    3a18:	83 e8 01             	sub    $0x1,%eax
    3a1b:	c1 e0 0a             	shl    $0xa,%eax
    3a1e:	99                   	cltd   
    3a1f:	f7 7d ec             	idivl  -0x14(%ebp)
    3a22:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3a25:	eb 55                	jmp    3a7c <draw_line+0x105>
	}
	else {
		len = dy + 1;
    3a27:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3a2a:	83 c0 01             	add    $0x1,%eax
    3a2d:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    3a30:	8b 45 20             	mov    0x20(%ebp),%eax
    3a33:	3b 45 18             	cmp    0x18(%ebp),%eax
    3a36:	7e 07                	jle    3a3f <draw_line+0xc8>
    3a38:	b8 00 04 00 00       	mov    $0x400,%eax
    3a3d:	eb 05                	jmp    3a44 <draw_line+0xcd>
    3a3f:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3a44:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    3a47:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3a4a:	3b 45 14             	cmp    0x14(%ebp),%eax
    3a4d:	7c 16                	jl     3a65 <draw_line+0xee>
    3a4f:	8b 45 14             	mov    0x14(%ebp),%eax
    3a52:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3a55:	29 c2                	sub    %eax,%edx
    3a57:	89 d0                	mov    %edx,%eax
    3a59:	83 c0 01             	add    $0x1,%eax
    3a5c:	c1 e0 0a             	shl    $0xa,%eax
    3a5f:	99                   	cltd   
    3a60:	f7 7d ec             	idivl  -0x14(%ebp)
    3a63:	eb 14                	jmp    3a79 <draw_line+0x102>
    3a65:	8b 45 14             	mov    0x14(%ebp),%eax
    3a68:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3a6b:	29 c2                	sub    %eax,%edx
    3a6d:	89 d0                	mov    %edx,%eax
    3a6f:	83 e8 01             	sub    $0x1,%eax
    3a72:	c1 e0 0a             	shl    $0xa,%eax
    3a75:	99                   	cltd   
    3a76:	f7 7d ec             	idivl  -0x14(%ebp)
    3a79:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    3a7c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3a83:	eb 47                	jmp    3acc <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    3a85:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    3a89:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a8c:	c1 f8 0a             	sar    $0xa,%eax
    3a8f:	89 c2                	mov    %eax,%edx
    3a91:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a94:	c1 f8 0a             	sar    $0xa,%eax
    3a97:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3a9b:	89 54 24 10          	mov    %edx,0x10(%esp)
    3a9f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3aa3:	8b 45 08             	mov    0x8(%ebp),%eax
    3aa6:	89 04 24             	mov    %eax,(%esp)
    3aa9:	8b 45 0c             	mov    0xc(%ebp),%eax
    3aac:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ab0:	8b 45 10             	mov    0x10(%ebp),%eax
    3ab3:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ab7:	e8 07 f7 ff ff       	call   31c3 <draw_point>
		y += dy;
    3abc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3abf:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    3ac2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3ac5:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    3ac8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3acc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3acf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3ad2:	7c b1                	jl     3a85 <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    3ad4:	c9                   	leave  
    3ad5:	c3                   	ret    

00003ad6 <draw_window>:

void
draw_window(Context c, char *title)
{
    3ad6:	55                   	push   %ebp
    3ad7:	89 e5                	mov    %esp,%ebp
    3ad9:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    3adc:	8b 45 0c             	mov    0xc(%ebp),%eax
    3adf:	83 e8 01             	sub    $0x1,%eax
    3ae2:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3ae9:	00 
    3aea:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    3af1:	00 
    3af2:	89 44 24 14          	mov    %eax,0x14(%esp)
    3af6:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    3afd:	00 
    3afe:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3b05:	00 
    3b06:	8b 45 08             	mov    0x8(%ebp),%eax
    3b09:	89 04 24             	mov    %eax,(%esp)
    3b0c:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b0f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b13:	8b 45 10             	mov    0x10(%ebp),%eax
    3b16:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b1a:	e8 58 fe ff ff       	call   3977 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    3b1f:	8b 45 10             	mov    0x10(%ebp),%eax
    3b22:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3b25:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b28:	8d 50 ff             	lea    -0x1(%eax),%edx
    3b2b:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b2e:	83 e8 01             	sub    $0x1,%eax
    3b31:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3b38:	00 
    3b39:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3b3d:	89 54 24 14          	mov    %edx,0x14(%esp)
    3b41:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    3b48:	00 
    3b49:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b4d:	8b 45 08             	mov    0x8(%ebp),%eax
    3b50:	89 04 24             	mov    %eax,(%esp)
    3b53:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b56:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b5a:	8b 45 10             	mov    0x10(%ebp),%eax
    3b5d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b61:	e8 11 fe ff ff       	call   3977 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    3b66:	8b 45 10             	mov    0x10(%ebp),%eax
    3b69:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3b6c:	8b 45 10             	mov    0x10(%ebp),%eax
    3b6f:	8d 50 ff             	lea    -0x1(%eax),%edx
    3b72:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b75:	83 e8 01             	sub    $0x1,%eax
    3b78:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3b7f:	00 
    3b80:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3b84:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3b8b:	00 
    3b8c:	89 54 24 10          	mov    %edx,0x10(%esp)
    3b90:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b94:	8b 45 08             	mov    0x8(%ebp),%eax
    3b97:	89 04 24             	mov    %eax,(%esp)
    3b9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b9d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ba1:	8b 45 10             	mov    0x10(%ebp),%eax
    3ba4:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ba8:	e8 ca fd ff ff       	call   3977 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    3bad:	8b 45 10             	mov    0x10(%ebp),%eax
    3bb0:	83 e8 01             	sub    $0x1,%eax
    3bb3:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3bba:	00 
    3bbb:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    3bc2:	00 
    3bc3:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3bca:	00 
    3bcb:	89 44 24 10          	mov    %eax,0x10(%esp)
    3bcf:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3bd6:	00 
    3bd7:	8b 45 08             	mov    0x8(%ebp),%eax
    3bda:	89 04 24             	mov    %eax,(%esp)
    3bdd:	8b 45 0c             	mov    0xc(%ebp),%eax
    3be0:	89 44 24 04          	mov    %eax,0x4(%esp)
    3be4:	8b 45 10             	mov    0x10(%ebp),%eax
    3be7:	89 44 24 08          	mov    %eax,0x8(%esp)
    3beb:	e8 87 fd ff ff       	call   3977 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    3bf0:	8b 45 0c             	mov    0xc(%ebp),%eax
    3bf3:	83 e8 02             	sub    $0x2,%eax
    3bf6:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    3bfd:	00 
    3bfe:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    3c05:	00 
    3c06:	89 44 24 14          	mov    %eax,0x14(%esp)
    3c0a:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    3c11:	00 
    3c12:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3c19:	00 
    3c1a:	8b 45 08             	mov    0x8(%ebp),%eax
    3c1d:	89 04 24             	mov    %eax,(%esp)
    3c20:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c23:	89 44 24 04          	mov    %eax,0x4(%esp)
    3c27:	8b 45 10             	mov    0x10(%ebp),%eax
    3c2a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c2e:	e8 cf f5 ff ff       	call   3202 <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    3c33:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c36:	83 e8 02             	sub    $0x2,%eax
    3c39:	89 c2                	mov    %eax,%edx
    3c3b:	8b 45 10             	mov    0x10(%ebp),%eax
    3c3e:	83 e8 15             	sub    $0x15,%eax
    3c41:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    3c48:	00 
    3c49:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    3c50:	00 
    3c51:	89 54 24 14          	mov    %edx,0x14(%esp)
    3c55:	89 44 24 10          	mov    %eax,0x10(%esp)
    3c59:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3c60:	00 
    3c61:	8b 45 08             	mov    0x8(%ebp),%eax
    3c64:	89 04 24             	mov    %eax,(%esp)
    3c67:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c6a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3c6e:	8b 45 10             	mov    0x10(%ebp),%eax
    3c71:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c75:	e8 88 f5 ff ff       	call   3202 <fill_rect>

  loadBitmap(&pic, "close.bmp");
    3c7a:	c7 44 24 04 67 bc 00 	movl   $0xbc67,0x4(%esp)
    3c81:	00 
    3c82:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3c85:	89 04 24             	mov    %eax,(%esp)
    3c88:	e8 44 01 00 00       	call   3dd1 <loadBitmap>
  draw_picture(c, pic, 3, 3);
    3c8d:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    3c94:	00 
    3c95:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    3c9c:	00 
    3c9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ca0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3ca4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ca7:	89 44 24 10          	mov    %eax,0x10(%esp)
    3cab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cae:	89 44 24 14          	mov    %eax,0x14(%esp)
    3cb2:	8b 45 08             	mov    0x8(%ebp),%eax
    3cb5:	89 04 24             	mov    %eax,(%esp)
    3cb8:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cbb:	89 44 24 04          	mov    %eax,0x4(%esp)
    3cbf:	8b 45 10             	mov    0x10(%ebp),%eax
    3cc2:	89 44 24 08          	mov    %eax,0x8(%esp)
    3cc6:	e8 d6 fb ff ff       	call   38a1 <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    3ccb:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    3cd2:	00 
    3cd3:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    3cda:	00 
    3cdb:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    3ce2:	00 
    3ce3:	8b 45 14             	mov    0x14(%ebp),%eax
    3ce6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3cea:	8b 45 08             	mov    0x8(%ebp),%eax
    3ced:	89 04 24             	mov    %eax,(%esp)
    3cf0:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cf3:	89 44 24 04          	mov    %eax,0x4(%esp)
    3cf7:	8b 45 10             	mov    0x10(%ebp),%eax
    3cfa:	89 44 24 08          	mov    %eax,0x8(%esp)
    3cfe:	e8 de fa ff ff       	call   37e1 <puts_str>
  freepic(&pic);
    3d03:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3d06:	89 04 24             	mov    %eax,(%esp)
    3d09:	e8 6f 06 00 00       	call   437d <freepic>
}
    3d0e:	c9                   	leave  
    3d0f:	c3                   	ret    

00003d10 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    3d10:	55                   	push   %ebp
    3d11:	89 e5                	mov    %esp,%ebp
    3d13:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    3d16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3d1d:	eb 29                	jmp    3d48 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    3d1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d22:	6b d0 34             	imul   $0x34,%eax,%edx
    3d25:	8b 45 08             	mov    0x8(%ebp),%eax
    3d28:	01 d0                	add    %edx,%eax
    3d2a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3d2d:	6b ca 34             	imul   $0x34,%edx,%ecx
    3d30:	8b 55 08             	mov    0x8(%ebp),%edx
    3d33:	01 ca                	add    %ecx,%edx
    3d35:	83 c2 28             	add    $0x28,%edx
    3d38:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d3c:	89 14 24             	mov    %edx,(%esp)
    3d3f:	e8 8d 00 00 00       	call   3dd1 <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    3d44:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3d48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d4b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3d4e:	7c cf                	jl     3d1f <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    3d50:	c9                   	leave  
    3d51:	c3                   	ret    

00003d52 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    3d52:	55                   	push   %ebp
    3d53:	89 e5                	mov    %esp,%ebp
    3d55:	53                   	push   %ebx
    3d56:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    3d59:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3d60:	eb 61                	jmp    3dc3 <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    3d62:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d65:	6b d0 34             	imul   $0x34,%eax,%edx
    3d68:	8b 45 14             	mov    0x14(%ebp),%eax
    3d6b:	01 d0                	add    %edx,%eax
    3d6d:	8b 48 24             	mov    0x24(%eax),%ecx
    3d70:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d73:	6b d0 34             	imul   $0x34,%eax,%edx
    3d76:	8b 45 14             	mov    0x14(%ebp),%eax
    3d79:	01 d0                	add    %edx,%eax
    3d7b:	8b 50 20             	mov    0x20(%eax),%edx
    3d7e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d81:	6b d8 34             	imul   $0x34,%eax,%ebx
    3d84:	8b 45 14             	mov    0x14(%ebp),%eax
    3d87:	01 d8                	add    %ebx,%eax
    3d89:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    3d8d:	89 54 24 18          	mov    %edx,0x18(%esp)
    3d91:	8b 50 28             	mov    0x28(%eax),%edx
    3d94:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3d98:	8b 50 2c             	mov    0x2c(%eax),%edx
    3d9b:	89 54 24 10          	mov    %edx,0x10(%esp)
    3d9f:	8b 40 30             	mov    0x30(%eax),%eax
    3da2:	89 44 24 14          	mov    %eax,0x14(%esp)
    3da6:	8b 45 08             	mov    0x8(%ebp),%eax
    3da9:	89 04 24             	mov    %eax,(%esp)
    3dac:	8b 45 0c             	mov    0xc(%ebp),%eax
    3daf:	89 44 24 04          	mov    %eax,0x4(%esp)
    3db3:	8b 45 10             	mov    0x10(%ebp),%eax
    3db6:	89 44 24 08          	mov    %eax,0x8(%esp)
    3dba:	e8 e2 fa ff ff       	call   38a1 <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    3dbf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3dc3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3dc6:	3b 45 18             	cmp    0x18(%ebp),%eax
    3dc9:	7c 97                	jl     3d62 <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    3dcb:	83 c4 30             	add    $0x30,%esp
    3dce:	5b                   	pop    %ebx
    3dcf:	5d                   	pop    %ebp
    3dd0:	c3                   	ret    

00003dd1 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    3dd1:	55                   	push   %ebp
    3dd2:	89 e5                	mov    %esp,%ebp
    3dd4:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    3dda:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    3de1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3de8:	00 
    3de9:	8b 45 0c             	mov    0xc(%ebp),%eax
    3dec:	89 04 24             	mov    %eax,(%esp)
    3def:	e8 ef 11 00 00       	call   4fe3 <open>
    3df4:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3df7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3dfb:	79 20                	jns    3e1d <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    3dfd:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e00:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e04:	c7 44 24 04 74 bc 00 	movl   $0xbc74,0x4(%esp)
    3e0b:	00 
    3e0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e13:	e8 73 13 00 00       	call   518b <printf>
		return;
    3e18:	e9 ef 02 00 00       	jmp    410c <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    3e1d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e20:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e24:	c7 44 24 04 84 bc 00 	movl   $0xbc84,0x4(%esp)
    3e2b:	00 
    3e2c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e33:	e8 53 13 00 00       	call   518b <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    3e38:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    3e3f:	e8 33 16 00 00       	call   5477 <malloc>
    3e44:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    3e47:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    3e4e:	00 
    3e4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e52:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e56:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e59:	89 04 24             	mov    %eax,(%esp)
    3e5c:	e8 5a 11 00 00       	call   4fbb <read>
    3e61:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    3e64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e67:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    3e6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3e6d:	0f b7 00             	movzwl (%eax),%eax
    3e70:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    3e74:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    3e78:	66 3d 42 4d          	cmp    $0x4d42,%ax
    3e7c:	74 19                	je     3e97 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    3e7e:	c7 44 24 04 98 bc 00 	movl   $0xbc98,0x4(%esp)
    3e85:	00 
    3e86:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e8d:	e8 f9 12 00 00       	call   518b <printf>
		return;
    3e92:	e9 75 02 00 00       	jmp    410c <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    3e97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e9a:	83 c0 02             	add    $0x2,%eax
    3e9d:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    3ea0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3ea3:	8b 00                	mov    (%eax),%eax
    3ea5:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3ea8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3eab:	83 c0 06             	add    $0x6,%eax
    3eae:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    3eb1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3eb4:	0f b7 00             	movzwl (%eax),%eax
    3eb7:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3ebb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ebe:	83 c0 08             	add    $0x8,%eax
    3ec1:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    3ec4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3ec7:	0f b7 00             	movzwl (%eax),%eax
    3eca:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3ece:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ed1:	83 c0 0a             	add    $0xa,%eax
    3ed4:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    3ed7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3eda:	8b 00                	mov    (%eax),%eax
    3edc:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    3edf:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    3ee6:	00 
    3ee7:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3eea:	89 44 24 04          	mov    %eax,0x4(%esp)
    3eee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3ef1:	89 04 24             	mov    %eax,(%esp)
    3ef4:	e8 c2 10 00 00       	call   4fbb <read>
	width = bitInfoHead.biWidth;
    3ef9:	8b 45 88             	mov    -0x78(%ebp),%eax
    3efc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    3eff:	8b 45 8c             	mov    -0x74(%ebp),%eax
    3f02:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    3f05:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3f08:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    3f0c:	c1 e0 02             	shl    $0x2,%eax
    3f0f:	89 44 24 10          	mov    %eax,0x10(%esp)
    3f13:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3f16:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3f1a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3f1d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3f21:	c7 44 24 04 b0 bc 00 	movl   $0xbcb0,0x4(%esp)
    3f28:	00 
    3f29:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f30:	e8 56 12 00 00       	call   518b <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    3f35:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3f39:	75 14                	jne    3f4f <loadBitmap+0x17e>
		printf(0, "0");
    3f3b:	c7 44 24 04 d5 bc 00 	movl   $0xbcd5,0x4(%esp)
    3f42:	00 
    3f43:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f4a:	e8 3c 12 00 00       	call   518b <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    3f4f:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3f53:	0f b7 c0             	movzwl %ax,%eax
    3f56:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    3f5a:	83 c0 1f             	add    $0x1f,%eax
    3f5d:	8d 50 1f             	lea    0x1f(%eax),%edx
    3f60:	85 c0                	test   %eax,%eax
    3f62:	0f 48 c2             	cmovs  %edx,%eax
    3f65:	c1 f8 05             	sar    $0x5,%eax
    3f68:	c1 e0 02             	shl    $0x2,%eax
    3f6b:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    3f6e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3f71:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3f75:	89 04 24             	mov    %eax,(%esp)
    3f78:	e8 fa 14 00 00       	call   5477 <malloc>
    3f7d:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    3f80:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3f83:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3f86:	0f af c2             	imul   %edx,%eax
    3f89:	89 44 24 08          	mov    %eax,0x8(%esp)
    3f8d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3f94:	00 
    3f95:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3f98:	89 04 24             	mov    %eax,(%esp)
    3f9b:	e8 56 0e 00 00       	call   4df6 <memset>
	long nData = height * l_width;
    3fa0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3fa3:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3fa7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    3faa:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3fad:	89 44 24 08          	mov    %eax,0x8(%esp)
    3fb1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3fb4:	89 44 24 04          	mov    %eax,0x4(%esp)
    3fb8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3fbb:	89 04 24             	mov    %eax,(%esp)
    3fbe:	e8 f8 0f 00 00       	call   4fbb <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    3fc3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3fc6:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    3fca:	c1 e0 02             	shl    $0x2,%eax
    3fcd:	89 04 24             	mov    %eax,(%esp)
    3fd0:	e8 a2 14 00 00       	call   5477 <malloc>
    3fd5:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    3fd8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3fdb:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3fde:	0f af c2             	imul   %edx,%eax
    3fe1:	c1 e0 02             	shl    $0x2,%eax
    3fe4:	89 44 24 08          	mov    %eax,0x8(%esp)
    3fe8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3fef:	00 
    3ff0:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3ff3:	89 04 24             	mov    %eax,(%esp)
    3ff6:	e8 fb 0d 00 00       	call   4df6 <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    3ffb:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3fff:	66 83 f8 17          	cmp    $0x17,%ax
    4003:	77 19                	ja     401e <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    4005:	c7 44 24 04 d8 bc 00 	movl   $0xbcd8,0x4(%esp)
    400c:	00 
    400d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4014:	e8 72 11 00 00       	call   518b <printf>
		return;
    4019:	e9 ee 00 00 00       	jmp    410c <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    401e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    4025:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    402c:	e9 94 00 00 00       	jmp    40c5 <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    4031:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4038:	eb 7b                	jmp    40b5 <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    403a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    403d:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    4041:	89 c1                	mov    %eax,%ecx
    4043:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4046:	89 d0                	mov    %edx,%eax
    4048:	01 c0                	add    %eax,%eax
    404a:	01 d0                	add    %edx,%eax
    404c:	01 c8                	add    %ecx,%eax
    404e:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    4051:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4054:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    405b:	8b 45 c0             	mov    -0x40(%ebp),%eax
    405e:	01 c2                	add    %eax,%edx
    4060:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4063:	8d 48 02             	lea    0x2(%eax),%ecx
    4066:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4069:	01 c8                	add    %ecx,%eax
    406b:	0f b6 00             	movzbl (%eax),%eax
    406e:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    4071:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4074:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    407b:	8b 45 c0             	mov    -0x40(%ebp),%eax
    407e:	01 c2                	add    %eax,%edx
    4080:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4083:	8d 48 01             	lea    0x1(%eax),%ecx
    4086:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4089:	01 c8                	add    %ecx,%eax
    408b:	0f b6 00             	movzbl (%eax),%eax
    408e:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    4091:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4094:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    409b:	8b 45 c0             	mov    -0x40(%ebp),%eax
    409e:	01 c2                	add    %eax,%edx
    40a0:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    40a3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    40a6:	01 c8                	add    %ecx,%eax
    40a8:	0f b6 00             	movzbl (%eax),%eax
    40ab:	88 02                	mov    %al,(%edx)
				index++;
    40ad:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    40b1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    40b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40b8:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    40bb:	0f 8c 79 ff ff ff    	jl     403a <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    40c1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    40c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40c8:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    40cb:	0f 8c 60 ff ff ff    	jl     4031 <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    40d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    40d4:	89 04 24             	mov    %eax,(%esp)
    40d7:	e8 ef 0e 00 00       	call   4fcb <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    40dc:	8b 45 08             	mov    0x8(%ebp),%eax
    40df:	8b 55 c0             	mov    -0x40(%ebp),%edx
    40e2:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    40e4:	8b 45 08             	mov    0x8(%ebp),%eax
    40e7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    40ea:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    40ed:	8b 45 08             	mov    0x8(%ebp),%eax
    40f0:	8b 55 d0             	mov    -0x30(%ebp),%edx
    40f3:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    40f6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    40f9:	89 04 24             	mov    %eax,(%esp)
    40fc:	e8 3d 12 00 00       	call   533e <free>
	free(BmpFileHeader);
    4101:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4104:	89 04 24             	mov    %eax,(%esp)
    4107:	e8 32 12 00 00       	call   533e <free>
	//printf("\n");
}
    410c:	c9                   	leave  
    410d:	c3                   	ret    

0000410e <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    410e:	55                   	push   %ebp
    410f:	89 e5                	mov    %esp,%ebp
    4111:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    4114:	c7 44 24 04 f8 bc 00 	movl   $0xbcf8,0x4(%esp)
    411b:	00 
    411c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4123:	e8 63 10 00 00       	call   518b <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    4128:	8b 45 08             	mov    0x8(%ebp),%eax
    412b:	0f b7 00             	movzwl (%eax),%eax
    412e:	0f b7 c0             	movzwl %ax,%eax
    4131:	89 44 24 08          	mov    %eax,0x8(%esp)
    4135:	c7 44 24 04 0a bd 00 	movl   $0xbd0a,0x4(%esp)
    413c:	00 
    413d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4144:	e8 42 10 00 00       	call   518b <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    4149:	8b 45 08             	mov    0x8(%ebp),%eax
    414c:	8b 40 04             	mov    0x4(%eax),%eax
    414f:	89 44 24 08          	mov    %eax,0x8(%esp)
    4153:	c7 44 24 04 28 bd 00 	movl   $0xbd28,0x4(%esp)
    415a:	00 
    415b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4162:	e8 24 10 00 00       	call   518b <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    4167:	8b 45 08             	mov    0x8(%ebp),%eax
    416a:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    416e:	0f b7 c0             	movzwl %ax,%eax
    4171:	89 44 24 08          	mov    %eax,0x8(%esp)
    4175:	c7 44 24 04 39 bd 00 	movl   $0xbd39,0x4(%esp)
    417c:	00 
    417d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4184:	e8 02 10 00 00       	call   518b <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    4189:	8b 45 08             	mov    0x8(%ebp),%eax
    418c:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    4190:	0f b7 c0             	movzwl %ax,%eax
    4193:	89 44 24 08          	mov    %eax,0x8(%esp)
    4197:	c7 44 24 04 39 bd 00 	movl   $0xbd39,0x4(%esp)
    419e:	00 
    419f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41a6:	e8 e0 0f 00 00       	call   518b <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    41ab:	8b 45 08             	mov    0x8(%ebp),%eax
    41ae:	8b 40 0c             	mov    0xc(%eax),%eax
    41b1:	89 44 24 08          	mov    %eax,0x8(%esp)
    41b5:	c7 44 24 04 48 bd 00 	movl   $0xbd48,0x4(%esp)
    41bc:	00 
    41bd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41c4:	e8 c2 0f 00 00       	call   518b <printf>
}
    41c9:	c9                   	leave  
    41ca:	c3                   	ret    

000041cb <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    41cb:	55                   	push   %ebp
    41cc:	89 e5                	mov    %esp,%ebp
    41ce:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    41d1:	c7 44 24 04 71 bd 00 	movl   $0xbd71,0x4(%esp)
    41d8:	00 
    41d9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41e0:	e8 a6 0f 00 00       	call   518b <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    41e5:	8b 45 08             	mov    0x8(%ebp),%eax
    41e8:	8b 00                	mov    (%eax),%eax
    41ea:	89 44 24 08          	mov    %eax,0x8(%esp)
    41ee:	c7 44 24 04 83 bd 00 	movl   $0xbd83,0x4(%esp)
    41f5:	00 
    41f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41fd:	e8 89 0f 00 00       	call   518b <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    4202:	8b 45 08             	mov    0x8(%ebp),%eax
    4205:	8b 40 04             	mov    0x4(%eax),%eax
    4208:	89 44 24 08          	mov    %eax,0x8(%esp)
    420c:	c7 44 24 04 9a bd 00 	movl   $0xbd9a,0x4(%esp)
    4213:	00 
    4214:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    421b:	e8 6b 0f 00 00       	call   518b <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    4220:	8b 45 08             	mov    0x8(%ebp),%eax
    4223:	8b 40 08             	mov    0x8(%eax),%eax
    4226:	89 44 24 08          	mov    %eax,0x8(%esp)
    422a:	c7 44 24 04 a8 bd 00 	movl   $0xbda8,0x4(%esp)
    4231:	00 
    4232:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4239:	e8 4d 0f 00 00       	call   518b <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    423e:	8b 45 08             	mov    0x8(%ebp),%eax
    4241:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    4245:	0f b7 c0             	movzwl %ax,%eax
    4248:	89 44 24 08          	mov    %eax,0x8(%esp)
    424c:	c7 44 24 04 b6 bd 00 	movl   $0xbdb6,0x4(%esp)
    4253:	00 
    4254:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    425b:	e8 2b 0f 00 00       	call   518b <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    4260:	8b 45 08             	mov    0x8(%ebp),%eax
    4263:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    4267:	0f b7 c0             	movzwl %ax,%eax
    426a:	89 44 24 08          	mov    %eax,0x8(%esp)
    426e:	c7 44 24 04 cc bd 00 	movl   $0xbdcc,0x4(%esp)
    4275:	00 
    4276:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    427d:	e8 09 0f 00 00       	call   518b <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    4282:	8b 45 08             	mov    0x8(%ebp),%eax
    4285:	8b 40 10             	mov    0x10(%eax),%eax
    4288:	89 44 24 08          	mov    %eax,0x8(%esp)
    428c:	c7 44 24 04 ed bd 00 	movl   $0xbded,0x4(%esp)
    4293:	00 
    4294:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    429b:	e8 eb 0e 00 00       	call   518b <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    42a0:	8b 45 08             	mov    0x8(%ebp),%eax
    42a3:	8b 40 14             	mov    0x14(%eax),%eax
    42a6:	89 44 24 08          	mov    %eax,0x8(%esp)
    42aa:	c7 44 24 04 00 be 00 	movl   $0xbe00,0x4(%esp)
    42b1:	00 
    42b2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    42b9:	e8 cd 0e 00 00       	call   518b <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    42be:	8b 45 08             	mov    0x8(%ebp),%eax
    42c1:	8b 40 18             	mov    0x18(%eax),%eax
    42c4:	89 44 24 08          	mov    %eax,0x8(%esp)
    42c8:	c7 44 24 04 34 be 00 	movl   $0xbe34,0x4(%esp)
    42cf:	00 
    42d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    42d7:	e8 af 0e 00 00       	call   518b <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    42dc:	8b 45 08             	mov    0x8(%ebp),%eax
    42df:	8b 40 1c             	mov    0x1c(%eax),%eax
    42e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    42e6:	c7 44 24 04 49 be 00 	movl   $0xbe49,0x4(%esp)
    42ed:	00 
    42ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    42f5:	e8 91 0e 00 00       	call   518b <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    42fa:	8b 45 08             	mov    0x8(%ebp),%eax
    42fd:	8b 40 20             	mov    0x20(%eax),%eax
    4300:	89 44 24 08          	mov    %eax,0x8(%esp)
    4304:	c7 44 24 04 5e be 00 	movl   $0xbe5e,0x4(%esp)
    430b:	00 
    430c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4313:	e8 73 0e 00 00       	call   518b <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    4318:	8b 45 08             	mov    0x8(%ebp),%eax
    431b:	8b 40 24             	mov    0x24(%eax),%eax
    431e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4322:	c7 44 24 04 75 be 00 	movl   $0xbe75,0x4(%esp)
    4329:	00 
    432a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4331:	e8 55 0e 00 00       	call   518b <printf>
}
    4336:	c9                   	leave  
    4337:	c3                   	ret    

00004338 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    4338:	55                   	push   %ebp
    4339:	89 e5                	mov    %esp,%ebp
    433b:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    433e:	8b 45 08             	mov    0x8(%ebp),%eax
    4341:	0f b6 00             	movzbl (%eax),%eax
    4344:	0f b6 c8             	movzbl %al,%ecx
    4347:	8b 45 08             	mov    0x8(%ebp),%eax
    434a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    434e:	0f b6 d0             	movzbl %al,%edx
    4351:	8b 45 08             	mov    0x8(%ebp),%eax
    4354:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    4358:	0f b6 c0             	movzbl %al,%eax
    435b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    435f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4363:	89 44 24 08          	mov    %eax,0x8(%esp)
    4367:	c7 44 24 04 89 be 00 	movl   $0xbe89,0x4(%esp)
    436e:	00 
    436f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4376:	e8 10 0e 00 00       	call   518b <printf>
}
    437b:	c9                   	leave  
    437c:	c3                   	ret    

0000437d <freepic>:

void freepic(PICNODE *pic) {
    437d:	55                   	push   %ebp
    437e:	89 e5                	mov    %esp,%ebp
    4380:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    4383:	8b 45 08             	mov    0x8(%ebp),%eax
    4386:	8b 00                	mov    (%eax),%eax
    4388:	89 04 24             	mov    %eax,(%esp)
    438b:	e8 ae 0f 00 00       	call   533e <free>
}
    4390:	c9                   	leave  
    4391:	c3                   	ret    

00004392 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    4392:	55                   	push   %ebp
    4393:	89 e5                	mov    %esp,%ebp
    4395:	53                   	push   %ebx
    4396:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    439c:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    43a3:	8d 45 dc             	lea    -0x24(%ebp),%eax
    43a6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    43a9:	89 54 24 10          	mov    %edx,0x10(%esp)
    43ad:	8b 55 ec             	mov    -0x14(%ebp),%edx
    43b0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    43b4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    43bb:	00 
    43bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    43c3:	00 
    43c4:	89 04 24             	mov    %eax,(%esp)
    43c7:	e8 80 02 00 00       	call   464c <initRect>
    43cc:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    43cf:	8b 45 08             	mov    0x8(%ebp),%eax
    43d2:	8b 40 04             	mov    0x4(%eax),%eax
    43d5:	2b 45 ec             	sub    -0x14(%ebp),%eax
    43d8:	89 c2                	mov    %eax,%edx
    43da:	8d 45 cc             	lea    -0x34(%ebp),%eax
    43dd:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    43e0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    43e4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    43e7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    43eb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    43f2:	00 
    43f3:	89 54 24 04          	mov    %edx,0x4(%esp)
    43f7:	89 04 24             	mov    %eax,(%esp)
    43fa:	e8 4d 02 00 00       	call   464c <initRect>
    43ff:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    4402:	8b 45 08             	mov    0x8(%ebp),%eax
    4405:	8b 40 08             	mov    0x8(%eax),%eax
    4408:	2b 45 ec             	sub    -0x14(%ebp),%eax
    440b:	89 c1                	mov    %eax,%ecx
    440d:	8b 45 08             	mov    0x8(%ebp),%eax
    4410:	8b 40 04             	mov    0x4(%eax),%eax
    4413:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4416:	89 c2                	mov    %eax,%edx
    4418:	8d 45 bc             	lea    -0x44(%ebp),%eax
    441b:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    441e:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    4422:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    4425:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    4429:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    442d:	89 54 24 04          	mov    %edx,0x4(%esp)
    4431:	89 04 24             	mov    %eax,(%esp)
    4434:	e8 13 02 00 00       	call   464c <initRect>
    4439:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    443c:	8b 45 08             	mov    0x8(%ebp),%eax
    443f:	8b 40 08             	mov    0x8(%eax),%eax
    4442:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4445:	89 c2                	mov    %eax,%edx
    4447:	8d 45 ac             	lea    -0x54(%ebp),%eax
    444a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    444d:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4451:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4454:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4458:	89 54 24 08          	mov    %edx,0x8(%esp)
    445c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4463:	00 
    4464:	89 04 24             	mov    %eax,(%esp)
    4467:	e8 e0 01 00 00       	call   464c <initRect>
    446c:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    446f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4476:	e9 96 01 00 00       	jmp    4611 <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    447b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4482:	e9 77 01 00 00       	jmp    45fe <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    4487:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    448a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    448d:	89 54 24 08          	mov    %edx,0x8(%esp)
    4491:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4494:	89 54 24 04          	mov    %edx,0x4(%esp)
    4498:	89 04 24             	mov    %eax,(%esp)
    449b:	e8 85 01 00 00       	call   4625 <initPoint>
    44a0:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    44a3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    44a6:	89 44 24 08          	mov    %eax,0x8(%esp)
    44aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
    44ad:	89 44 24 0c          	mov    %eax,0xc(%esp)
    44b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44b4:	89 44 24 10          	mov    %eax,0x10(%esp)
    44b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    44bb:	89 44 24 14          	mov    %eax,0x14(%esp)
    44bf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    44c2:	8b 55 a8             	mov    -0x58(%ebp),%edx
    44c5:	89 04 24             	mov    %eax,(%esp)
    44c8:	89 54 24 04          	mov    %edx,0x4(%esp)
    44cc:	e8 d6 01 00 00       	call   46a7 <isIn>
    44d1:	85 c0                	test   %eax,%eax
    44d3:	0f 85 9a 00 00 00    	jne    4573 <set_icon_alpha+0x1e1>
    44d9:	8b 45 cc             	mov    -0x34(%ebp),%eax
    44dc:	89 44 24 08          	mov    %eax,0x8(%esp)
    44e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    44e3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    44e7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    44ea:	89 44 24 10          	mov    %eax,0x10(%esp)
    44ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
    44f1:	89 44 24 14          	mov    %eax,0x14(%esp)
    44f5:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    44f8:	8b 55 a8             	mov    -0x58(%ebp),%edx
    44fb:	89 04 24             	mov    %eax,(%esp)
    44fe:	89 54 24 04          	mov    %edx,0x4(%esp)
    4502:	e8 a0 01 00 00       	call   46a7 <isIn>
    4507:	85 c0                	test   %eax,%eax
    4509:	75 68                	jne    4573 <set_icon_alpha+0x1e1>
    450b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    450e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4512:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4515:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4519:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    451c:	89 44 24 10          	mov    %eax,0x10(%esp)
    4520:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4523:	89 44 24 14          	mov    %eax,0x14(%esp)
    4527:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    452a:	8b 55 a8             	mov    -0x58(%ebp),%edx
    452d:	89 04 24             	mov    %eax,(%esp)
    4530:	89 54 24 04          	mov    %edx,0x4(%esp)
    4534:	e8 6e 01 00 00       	call   46a7 <isIn>
    4539:	85 c0                	test   %eax,%eax
    453b:	75 36                	jne    4573 <set_icon_alpha+0x1e1>
    453d:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4540:	89 44 24 08          	mov    %eax,0x8(%esp)
    4544:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4547:	89 44 24 0c          	mov    %eax,0xc(%esp)
    454b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    454e:	89 44 24 10          	mov    %eax,0x10(%esp)
    4552:	8b 45 b8             	mov    -0x48(%ebp),%eax
    4555:	89 44 24 14          	mov    %eax,0x14(%esp)
    4559:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    455c:	8b 55 a8             	mov    -0x58(%ebp),%edx
    455f:	89 04 24             	mov    %eax,(%esp)
    4562:	89 54 24 04          	mov    %edx,0x4(%esp)
    4566:	e8 3c 01 00 00       	call   46a7 <isIn>
    456b:	85 c0                	test   %eax,%eax
    456d:	0f 84 87 00 00 00    	je     45fa <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    4573:	8b 45 08             	mov    0x8(%ebp),%eax
    4576:	8b 10                	mov    (%eax),%edx
    4578:	8b 45 08             	mov    0x8(%ebp),%eax
    457b:	8b 40 04             	mov    0x4(%eax),%eax
    457e:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4582:	89 c1                	mov    %eax,%ecx
    4584:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4587:	01 c8                	add    %ecx,%eax
    4589:	c1 e0 02             	shl    $0x2,%eax
    458c:	01 d0                	add    %edx,%eax
    458e:	0f b6 00             	movzbl (%eax),%eax
    4591:	3c ff                	cmp    $0xff,%al
    4593:	75 65                	jne    45fa <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    4595:	8b 45 08             	mov    0x8(%ebp),%eax
    4598:	8b 10                	mov    (%eax),%edx
    459a:	8b 45 08             	mov    0x8(%ebp),%eax
    459d:	8b 40 04             	mov    0x4(%eax),%eax
    45a0:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    45a4:	89 c1                	mov    %eax,%ecx
    45a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45a9:	01 c8                	add    %ecx,%eax
    45ab:	c1 e0 02             	shl    $0x2,%eax
    45ae:	01 d0                	add    %edx,%eax
    45b0:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    45b4:	3c ff                	cmp    $0xff,%al
    45b6:	75 42                	jne    45fa <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    45b8:	8b 45 08             	mov    0x8(%ebp),%eax
    45bb:	8b 10                	mov    (%eax),%edx
    45bd:	8b 45 08             	mov    0x8(%ebp),%eax
    45c0:	8b 40 04             	mov    0x4(%eax),%eax
    45c3:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    45c7:	89 c1                	mov    %eax,%ecx
    45c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45cc:	01 c8                	add    %ecx,%eax
    45ce:	c1 e0 02             	shl    $0x2,%eax
    45d1:	01 d0                	add    %edx,%eax
    45d3:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    45d7:	3c ff                	cmp    $0xff,%al
    45d9:	75 1f                	jne    45fa <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    45db:	8b 45 08             	mov    0x8(%ebp),%eax
    45de:	8b 10                	mov    (%eax),%edx
    45e0:	8b 45 08             	mov    0x8(%ebp),%eax
    45e3:	8b 40 04             	mov    0x4(%eax),%eax
    45e6:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    45ea:	89 c1                	mov    %eax,%ecx
    45ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45ef:	01 c8                	add    %ecx,%eax
    45f1:	c1 e0 02             	shl    $0x2,%eax
    45f4:	01 d0                	add    %edx,%eax
    45f6:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    45fa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    45fe:	8b 45 08             	mov    0x8(%ebp),%eax
    4601:	8b 40 08             	mov    0x8(%eax),%eax
    4604:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4607:	0f 8f 7a fe ff ff    	jg     4487 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    460d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4611:	8b 45 08             	mov    0x8(%ebp),%eax
    4614:	8b 40 04             	mov    0x4(%eax),%eax
    4617:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    461a:	0f 8f 5b fe ff ff    	jg     447b <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    4620:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4623:	c9                   	leave  
    4624:	c3                   	ret    

00004625 <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    4625:	55                   	push   %ebp
    4626:	89 e5                	mov    %esp,%ebp
    4628:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    462b:	8b 45 0c             	mov    0xc(%ebp),%eax
    462e:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    4631:	8b 45 10             	mov    0x10(%ebp),%eax
    4634:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    4637:	8b 4d 08             	mov    0x8(%ebp),%ecx
    463a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    463d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4640:	89 01                	mov    %eax,(%ecx)
    4642:	89 51 04             	mov    %edx,0x4(%ecx)
}
    4645:	8b 45 08             	mov    0x8(%ebp),%eax
    4648:	c9                   	leave  
    4649:	c2 04 00             	ret    $0x4

0000464c <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    464c:	55                   	push   %ebp
    464d:	89 e5                	mov    %esp,%ebp
    464f:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    4652:	8d 45 e8             	lea    -0x18(%ebp),%eax
    4655:	8b 55 10             	mov    0x10(%ebp),%edx
    4658:	89 54 24 08          	mov    %edx,0x8(%esp)
    465c:	8b 55 0c             	mov    0xc(%ebp),%edx
    465f:	89 54 24 04          	mov    %edx,0x4(%esp)
    4663:	89 04 24             	mov    %eax,(%esp)
    4666:	e8 ba ff ff ff       	call   4625 <initPoint>
    466b:	83 ec 04             	sub    $0x4,%esp
    466e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4671:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4674:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4677:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    467a:	8b 45 14             	mov    0x14(%ebp),%eax
    467d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    4680:	8b 45 18             	mov    0x18(%ebp),%eax
    4683:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    4686:	8b 45 08             	mov    0x8(%ebp),%eax
    4689:	8b 55 f0             	mov    -0x10(%ebp),%edx
    468c:	89 10                	mov    %edx,(%eax)
    468e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4691:	89 50 04             	mov    %edx,0x4(%eax)
    4694:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4697:	89 50 08             	mov    %edx,0x8(%eax)
    469a:	8b 55 fc             	mov    -0x4(%ebp),%edx
    469d:	89 50 0c             	mov    %edx,0xc(%eax)
}
    46a0:	8b 45 08             	mov    0x8(%ebp),%eax
    46a3:	c9                   	leave  
    46a4:	c2 04 00             	ret    $0x4

000046a7 <isIn>:

int isIn(Point p, Rect r)
{
    46a7:	55                   	push   %ebp
    46a8:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    46aa:	8b 55 08             	mov    0x8(%ebp),%edx
    46ad:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    46b0:	39 c2                	cmp    %eax,%edx
    46b2:	7c 2f                	jl     46e3 <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    46b4:	8b 45 08             	mov    0x8(%ebp),%eax
    46b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    46ba:	8b 55 18             	mov    0x18(%ebp),%edx
    46bd:	01 ca                	add    %ecx,%edx
    46bf:	39 d0                	cmp    %edx,%eax
    46c1:	7d 20                	jge    46e3 <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    46c3:	8b 55 0c             	mov    0xc(%ebp),%edx
    46c6:	8b 45 14             	mov    0x14(%ebp),%eax
    46c9:	39 c2                	cmp    %eax,%edx
    46cb:	7c 16                	jl     46e3 <isIn+0x3c>
    46cd:	8b 45 0c             	mov    0xc(%ebp),%eax
    46d0:	8b 4d 14             	mov    0x14(%ebp),%ecx
    46d3:	8b 55 1c             	mov    0x1c(%ebp),%edx
    46d6:	01 ca                	add    %ecx,%edx
    46d8:	39 d0                	cmp    %edx,%eax
    46da:	7d 07                	jge    46e3 <isIn+0x3c>
    46dc:	b8 01 00 00 00       	mov    $0x1,%eax
    46e1:	eb 05                	jmp    46e8 <isIn+0x41>
    46e3:	b8 00 00 00 00       	mov    $0x0,%eax
}
    46e8:	5d                   	pop    %ebp
    46e9:	c3                   	ret    

000046ea <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    46ea:	55                   	push   %ebp
    46eb:	89 e5                	mov    %esp,%ebp
    46ed:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    46f0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    46f7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    46fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    4705:	8b 45 10             	mov    0x10(%ebp),%eax
    4708:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    470b:	8b 45 14             	mov    0x14(%ebp),%eax
    470e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    4711:	8b 45 08             	mov    0x8(%ebp),%eax
    4714:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4717:	89 10                	mov    %edx,(%eax)
    4719:	8b 55 f0             	mov    -0x10(%ebp),%edx
    471c:	89 50 04             	mov    %edx,0x4(%eax)
    471f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4722:	89 50 08             	mov    %edx,0x8(%eax)
    4725:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4728:	89 50 0c             	mov    %edx,0xc(%eax)
    472b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    472e:	89 50 10             	mov    %edx,0x10(%eax)
}
    4731:	8b 45 08             	mov    0x8(%ebp),%eax
    4734:	c9                   	leave  
    4735:	c2 04 00             	ret    $0x4

00004738 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    4738:	55                   	push   %ebp
    4739:	89 e5                	mov    %esp,%ebp
    473b:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    473e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4741:	83 f8 03             	cmp    $0x3,%eax
    4744:	74 72                	je     47b8 <createClickable+0x80>
    4746:	83 f8 04             	cmp    $0x4,%eax
    4749:	74 0a                	je     4755 <createClickable+0x1d>
    474b:	83 f8 02             	cmp    $0x2,%eax
    474e:	74 38                	je     4788 <createClickable+0x50>
    4750:	e9 96 00 00 00       	jmp    47eb <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    4755:	8b 45 08             	mov    0x8(%ebp),%eax
    4758:	8d 50 04             	lea    0x4(%eax),%edx
    475b:	8b 45 20             	mov    0x20(%ebp),%eax
    475e:	89 44 24 14          	mov    %eax,0x14(%esp)
    4762:	8b 45 0c             	mov    0xc(%ebp),%eax
    4765:	89 44 24 04          	mov    %eax,0x4(%esp)
    4769:	8b 45 10             	mov    0x10(%ebp),%eax
    476c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4770:	8b 45 14             	mov    0x14(%ebp),%eax
    4773:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4777:	8b 45 18             	mov    0x18(%ebp),%eax
    477a:	89 44 24 10          	mov    %eax,0x10(%esp)
    477e:	89 14 24             	mov    %edx,(%esp)
    4781:	e8 7c 00 00 00       	call   4802 <addClickable>
	        break;
    4786:	eb 78                	jmp    4800 <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    4788:	8b 45 08             	mov    0x8(%ebp),%eax
    478b:	8b 55 20             	mov    0x20(%ebp),%edx
    478e:	89 54 24 14          	mov    %edx,0x14(%esp)
    4792:	8b 55 0c             	mov    0xc(%ebp),%edx
    4795:	89 54 24 04          	mov    %edx,0x4(%esp)
    4799:	8b 55 10             	mov    0x10(%ebp),%edx
    479c:	89 54 24 08          	mov    %edx,0x8(%esp)
    47a0:	8b 55 14             	mov    0x14(%ebp),%edx
    47a3:	89 54 24 0c          	mov    %edx,0xc(%esp)
    47a7:	8b 55 18             	mov    0x18(%ebp),%edx
    47aa:	89 54 24 10          	mov    %edx,0x10(%esp)
    47ae:	89 04 24             	mov    %eax,(%esp)
    47b1:	e8 4c 00 00 00       	call   4802 <addClickable>
	    	break;
    47b6:	eb 48                	jmp    4800 <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    47b8:	8b 45 08             	mov    0x8(%ebp),%eax
    47bb:	8d 50 08             	lea    0x8(%eax),%edx
    47be:	8b 45 20             	mov    0x20(%ebp),%eax
    47c1:	89 44 24 14          	mov    %eax,0x14(%esp)
    47c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    47c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    47cc:	8b 45 10             	mov    0x10(%ebp),%eax
    47cf:	89 44 24 08          	mov    %eax,0x8(%esp)
    47d3:	8b 45 14             	mov    0x14(%ebp),%eax
    47d6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    47da:	8b 45 18             	mov    0x18(%ebp),%eax
    47dd:	89 44 24 10          	mov    %eax,0x10(%esp)
    47e1:	89 14 24             	mov    %edx,(%esp)
    47e4:	e8 19 00 00 00       	call   4802 <addClickable>
	    	break;
    47e9:	eb 15                	jmp    4800 <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    47eb:	c7 44 24 04 98 be 00 	movl   $0xbe98,0x4(%esp)
    47f2:	00 
    47f3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    47fa:	e8 8c 09 00 00       	call   518b <printf>
	    	break;
    47ff:	90                   	nop
	}
}
    4800:	c9                   	leave  
    4801:	c3                   	ret    

00004802 <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    4802:	55                   	push   %ebp
    4803:	89 e5                	mov    %esp,%ebp
    4805:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    4808:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    480f:	e8 63 0c 00 00       	call   5477 <malloc>
    4814:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    4817:	8b 45 f4             	mov    -0xc(%ebp),%eax
    481a:	8b 55 0c             	mov    0xc(%ebp),%edx
    481d:	89 10                	mov    %edx,(%eax)
    481f:	8b 55 10             	mov    0x10(%ebp),%edx
    4822:	89 50 04             	mov    %edx,0x4(%eax)
    4825:	8b 55 14             	mov    0x14(%ebp),%edx
    4828:	89 50 08             	mov    %edx,0x8(%eax)
    482b:	8b 55 18             	mov    0x18(%ebp),%edx
    482e:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    4831:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4834:	8b 55 1c             	mov    0x1c(%ebp),%edx
    4837:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    483a:	8b 45 08             	mov    0x8(%ebp),%eax
    483d:	8b 10                	mov    (%eax),%edx
    483f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4842:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    4845:	8b 45 08             	mov    0x8(%ebp),%eax
    4848:	8b 55 f4             	mov    -0xc(%ebp),%edx
    484b:	89 10                	mov    %edx,(%eax)
}
    484d:	c9                   	leave  
    484e:	c3                   	ret    

0000484f <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    484f:	55                   	push   %ebp
    4850:	89 e5                	mov    %esp,%ebp
    4852:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    4855:	8b 45 08             	mov    0x8(%ebp),%eax
    4858:	8b 00                	mov    (%eax),%eax
    485a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    485d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4860:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    4863:	e9 bb 00 00 00       	jmp    4923 <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    4868:	8b 45 0c             	mov    0xc(%ebp),%eax
    486b:	89 44 24 08          	mov    %eax,0x8(%esp)
    486f:	8b 45 10             	mov    0x10(%ebp),%eax
    4872:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4876:	8b 45 14             	mov    0x14(%ebp),%eax
    4879:	89 44 24 10          	mov    %eax,0x10(%esp)
    487d:	8b 45 18             	mov    0x18(%ebp),%eax
    4880:	89 44 24 14          	mov    %eax,0x14(%esp)
    4884:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4887:	8b 50 04             	mov    0x4(%eax),%edx
    488a:	8b 00                	mov    (%eax),%eax
    488c:	89 04 24             	mov    %eax,(%esp)
    488f:	89 54 24 04          	mov    %edx,0x4(%esp)
    4893:	e8 0f fe ff ff       	call   46a7 <isIn>
    4898:	85 c0                	test   %eax,%eax
    489a:	74 60                	je     48fc <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    489c:	8b 45 08             	mov    0x8(%ebp),%eax
    489f:	8b 00                	mov    (%eax),%eax
    48a1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    48a4:	75 2e                	jne    48d4 <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    48a6:	8b 45 08             	mov    0x8(%ebp),%eax
    48a9:	8b 00                	mov    (%eax),%eax
    48ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    48ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    48b1:	8b 50 14             	mov    0x14(%eax),%edx
    48b4:	8b 45 08             	mov    0x8(%ebp),%eax
    48b7:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    48b9:	8b 45 08             	mov    0x8(%ebp),%eax
    48bc:	8b 00                	mov    (%eax),%eax
    48be:	89 45 f4             	mov    %eax,-0xc(%ebp)
    48c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    48c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    48c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    48ca:	89 04 24             	mov    %eax,(%esp)
    48cd:	e8 6c 0a 00 00       	call   533e <free>
    48d2:	eb 4f                	jmp    4923 <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    48d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    48d7:	8b 50 14             	mov    0x14(%eax),%edx
    48da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    48dd:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    48e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    48e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    48e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    48e9:	8b 40 14             	mov    0x14(%eax),%eax
    48ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    48ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
    48f2:	89 04 24             	mov    %eax,(%esp)
    48f5:	e8 44 0a 00 00       	call   533e <free>
    48fa:	eb 27                	jmp    4923 <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    48fc:	8b 45 08             	mov    0x8(%ebp),%eax
    48ff:	8b 00                	mov    (%eax),%eax
    4901:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4904:	75 0b                	jne    4911 <deleteClickable+0xc2>
			{
				cur = cur->next;
    4906:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4909:	8b 40 14             	mov    0x14(%eax),%eax
    490c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    490f:	eb 12                	jmp    4923 <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    4911:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4914:	8b 40 14             	mov    0x14(%eax),%eax
    4917:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    491a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    491d:	8b 40 14             	mov    0x14(%eax),%eax
    4920:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    4923:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4927:	0f 85 3b ff ff ff    	jne    4868 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    492d:	c9                   	leave  
    492e:	c3                   	ret    

0000492f <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    492f:	55                   	push   %ebp
    4930:	89 e5                	mov    %esp,%ebp
    4932:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    4935:	8b 45 08             	mov    0x8(%ebp),%eax
    4938:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    493b:	eb 6d                	jmp    49aa <executeHandler+0x7b>
	{
		if (isIn(click, cur->area))
    493d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4940:	8b 10                	mov    (%eax),%edx
    4942:	89 54 24 08          	mov    %edx,0x8(%esp)
    4946:	8b 50 04             	mov    0x4(%eax),%edx
    4949:	89 54 24 0c          	mov    %edx,0xc(%esp)
    494d:	8b 50 08             	mov    0x8(%eax),%edx
    4950:	89 54 24 10          	mov    %edx,0x10(%esp)
    4954:	8b 40 0c             	mov    0xc(%eax),%eax
    4957:	89 44 24 14          	mov    %eax,0x14(%esp)
    495b:	8b 45 0c             	mov    0xc(%ebp),%eax
    495e:	8b 55 10             	mov    0x10(%ebp),%edx
    4961:	89 04 24             	mov    %eax,(%esp)
    4964:	89 54 24 04          	mov    %edx,0x4(%esp)
    4968:	e8 3a fd ff ff       	call   46a7 <isIn>
    496d:	85 c0                	test   %eax,%eax
    496f:	74 30                	je     49a1 <executeHandler+0x72>
		{
			renaming = 0;
    4971:	c7 05 f4 3c 01 00 00 	movl   $0x0,0x13cf4
    4978:	00 00 00 
			isSearching = 0;
    497b:	c7 05 80 32 01 00 00 	movl   $0x0,0x13280
    4982:	00 00 00 
			cur->handler(click);
    4985:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4988:	8b 48 10             	mov    0x10(%eax),%ecx
    498b:	8b 45 0c             	mov    0xc(%ebp),%eax
    498e:	8b 55 10             	mov    0x10(%ebp),%edx
    4991:	89 04 24             	mov    %eax,(%esp)
    4994:	89 54 24 04          	mov    %edx,0x4(%esp)
    4998:	ff d1                	call   *%ecx
			return 1;
    499a:	b8 01 00 00 00       	mov    $0x1,%eax
    499f:	eb 4d                	jmp    49ee <executeHandler+0xbf>
		}
		cur = cur->next;
    49a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    49a4:	8b 40 14             	mov    0x14(%eax),%eax
    49a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    49aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    49ae:	75 8d                	jne    493d <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    49b0:	c7 05 80 32 01 00 00 	movl   $0x0,0x13280
    49b7:	00 00 00 
	if (renaming == 1){
    49ba:	a1 f4 3c 01 00       	mov    0x13cf4,%eax
    49bf:	83 f8 01             	cmp    $0x1,%eax
    49c2:	75 11                	jne    49d5 <executeHandler+0xa6>
		renaming = 0;
    49c4:	c7 05 f4 3c 01 00 00 	movl   $0x0,0x13cf4
    49cb:	00 00 00 
		return 1;
    49ce:	b8 01 00 00 00       	mov    $0x1,%eax
    49d3:	eb 19                	jmp    49ee <executeHandler+0xbf>
	}
	printf(0, "execute: none!\n");
    49d5:	c7 44 24 04 c6 be 00 	movl   $0xbec6,0x4(%esp)
    49dc:	00 
    49dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    49e4:	e8 a2 07 00 00       	call   518b <printf>
	return 0;
    49e9:	b8 00 00 00 00       	mov    $0x0,%eax
}
    49ee:	c9                   	leave  
    49ef:	c3                   	ret    

000049f0 <printClickable>:

void printClickable(Clickable *c)
{
    49f0:	55                   	push   %ebp
    49f1:	89 e5                	mov    %esp,%ebp
    49f3:	53                   	push   %ebx
    49f4:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    49f7:	8b 45 08             	mov    0x8(%ebp),%eax
    49fa:	8b 58 0c             	mov    0xc(%eax),%ebx
    49fd:	8b 45 08             	mov    0x8(%ebp),%eax
    4a00:	8b 48 08             	mov    0x8(%eax),%ecx
    4a03:	8b 45 08             	mov    0x8(%ebp),%eax
    4a06:	8b 50 04             	mov    0x4(%eax),%edx
    4a09:	8b 45 08             	mov    0x8(%ebp),%eax
    4a0c:	8b 00                	mov    (%eax),%eax
    4a0e:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    4a12:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4a16:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4a1a:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a1e:	c7 44 24 04 d6 be 00 	movl   $0xbed6,0x4(%esp)
    4a25:	00 
    4a26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a2d:	e8 59 07 00 00       	call   518b <printf>
}
    4a32:	83 c4 24             	add    $0x24,%esp
    4a35:	5b                   	pop    %ebx
    4a36:	5d                   	pop    %ebp
    4a37:	c3                   	ret    

00004a38 <printClickableList>:

void printClickableList(Clickable *head)
{
    4a38:	55                   	push   %ebp
    4a39:	89 e5                	mov    %esp,%ebp
    4a3b:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    4a3e:	8b 45 08             	mov    0x8(%ebp),%eax
    4a41:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    4a44:	c7 44 24 04 e8 be 00 	movl   $0xbee8,0x4(%esp)
    4a4b:	00 
    4a4c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a53:	e8 33 07 00 00       	call   518b <printf>
	while(cur != 0)
    4a58:	eb 14                	jmp    4a6e <printClickableList+0x36>
	{
		printClickable(cur);
    4a5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a5d:	89 04 24             	mov    %eax,(%esp)
    4a60:	e8 8b ff ff ff       	call   49f0 <printClickable>
		cur = cur->next;
    4a65:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a68:	8b 40 14             	mov    0x14(%eax),%eax
    4a6b:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    4a6e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4a72:	75 e6                	jne    4a5a <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    4a74:	c7 44 24 04 f9 be 00 	movl   $0xbef9,0x4(%esp)
    4a7b:	00 
    4a7c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a83:	e8 03 07 00 00       	call   518b <printf>
}
    4a88:	c9                   	leave  
    4a89:	c3                   	ret    

00004a8a <testHanler>:

void testHanler(struct Point p)
{
    4a8a:	55                   	push   %ebp
    4a8b:	89 e5                	mov    %esp,%ebp
    4a8d:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    4a90:	8b 55 0c             	mov    0xc(%ebp),%edx
    4a93:	8b 45 08             	mov    0x8(%ebp),%eax
    4a96:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4a9a:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a9e:	c7 44 24 04 fb be 00 	movl   $0xbefb,0x4(%esp)
    4aa5:	00 
    4aa6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4aad:	e8 d9 06 00 00       	call   518b <printf>
}
    4ab2:	c9                   	leave  
    4ab3:	c3                   	ret    

00004ab4 <testClickable>:
void testClickable(struct Context c)
{
    4ab4:	55                   	push   %ebp
    4ab5:	89 e5                	mov    %esp,%ebp
    4ab7:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    4abd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4ac0:	8b 55 08             	mov    0x8(%ebp),%edx
    4ac3:	89 54 24 04          	mov    %edx,0x4(%esp)
    4ac7:	8b 55 0c             	mov    0xc(%ebp),%edx
    4aca:	89 54 24 08          	mov    %edx,0x8(%esp)
    4ace:	8b 55 10             	mov    0x10(%ebp),%edx
    4ad1:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4ad5:	89 04 24             	mov    %eax,(%esp)
    4ad8:	e8 0d fc ff ff       	call   46ea <initClickManager>
    4add:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    4ae0:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    4ae3:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    4aea:	00 
    4aeb:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    4af2:	00 
    4af3:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    4afa:	00 
    4afb:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    4b02:	00 
    4b03:	89 04 24             	mov    %eax,(%esp)
    4b06:	e8 41 fb ff ff       	call   464c <initRect>
    4b0b:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    4b0e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    4b11:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    4b18:	00 
    4b19:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    4b20:	00 
    4b21:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    4b28:	00 
    4b29:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    4b30:	00 
    4b31:	89 04 24             	mov    %eax,(%esp)
    4b34:	e8 13 fb ff ff       	call   464c <initRect>
    4b39:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    4b3c:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    4b3f:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    4b46:	00 
    4b47:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    4b4e:	00 
    4b4f:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    4b56:	00 
    4b57:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    4b5e:	00 
    4b5f:	89 04 24             	mov    %eax,(%esp)
    4b62:	e8 e5 fa ff ff       	call   464c <initRect>
    4b67:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    4b6a:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4b6d:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    4b74:	00 
    4b75:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    4b7c:	00 
    4b7d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    4b84:	00 
    4b85:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4b8c:	00 
    4b8d:	89 04 24             	mov    %eax,(%esp)
    4b90:	e8 b7 fa ff ff       	call   464c <initRect>
    4b95:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    4b98:	8d 45 9c             	lea    -0x64(%ebp),%eax
    4b9b:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    4ba2:	00 
    4ba3:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    4baa:	00 
    4bab:	89 04 24             	mov    %eax,(%esp)
    4bae:	e8 72 fa ff ff       	call   4625 <initPoint>
    4bb3:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    4bb6:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4bb9:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    4bc0:	00 
    4bc1:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    4bc8:	00 
    4bc9:	89 04 24             	mov    %eax,(%esp)
    4bcc:	e8 54 fa ff ff       	call   4625 <initPoint>
    4bd1:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    4bd4:	c7 44 24 18 8a 4a 00 	movl   $0x4a8a,0x18(%esp)
    4bdb:	00 
    4bdc:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4be3:	00 
    4be4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4be7:	89 44 24 04          	mov    %eax,0x4(%esp)
    4beb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4bee:	89 44 24 08          	mov    %eax,0x8(%esp)
    4bf2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4bf5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4bf9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4bfc:	89 44 24 10          	mov    %eax,0x10(%esp)
    4c00:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4c03:	89 04 24             	mov    %eax,(%esp)
    4c06:	e8 2d fb ff ff       	call   4738 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4c0b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4c0e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c12:	c7 44 24 04 0f bf 00 	movl   $0xbf0f,0x4(%esp)
    4c19:	00 
    4c1a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c21:	e8 65 05 00 00       	call   518b <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    4c26:	c7 44 24 18 8a 4a 00 	movl   $0x4a8a,0x18(%esp)
    4c2d:	00 
    4c2e:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4c35:	00 
    4c36:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4c39:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c3d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4c40:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c44:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4c47:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4c4b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4c4e:	89 44 24 10          	mov    %eax,0x10(%esp)
    4c52:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4c55:	89 04 24             	mov    %eax,(%esp)
    4c58:	e8 db fa ff ff       	call   4738 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4c5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4c60:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c64:	c7 44 24 04 0f bf 00 	movl   $0xbf0f,0x4(%esp)
    4c6b:	00 
    4c6c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c73:	e8 13 05 00 00       	call   518b <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    4c78:	c7 44 24 18 8a 4a 00 	movl   $0x4a8a,0x18(%esp)
    4c7f:	00 
    4c80:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4c87:	00 
    4c88:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4c8b:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c8f:	8b 45 b8             	mov    -0x48(%ebp),%eax
    4c92:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c96:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4c99:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4c9d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4ca0:	89 44 24 10          	mov    %eax,0x10(%esp)
    4ca4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4ca7:	89 04 24             	mov    %eax,(%esp)
    4caa:	e8 89 fa ff ff       	call   4738 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4caf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4cb2:	89 44 24 08          	mov    %eax,0x8(%esp)
    4cb6:	c7 44 24 04 0f bf 00 	movl   $0xbf0f,0x4(%esp)
    4cbd:	00 
    4cbe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4cc5:	e8 c1 04 00 00       	call   518b <printf>
	printClickableList(cm.left_click);
    4cca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ccd:	89 04 24             	mov    %eax,(%esp)
    4cd0:	e8 63 fd ff ff       	call   4a38 <printClickableList>
	executeHandler(cm.left_click, p1);
    4cd5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4cd8:	8b 45 9c             	mov    -0x64(%ebp),%eax
    4cdb:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4cde:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ce2:	89 54 24 08          	mov    %edx,0x8(%esp)
    4ce6:	89 0c 24             	mov    %ecx,(%esp)
    4ce9:	e8 41 fc ff ff       	call   492f <executeHandler>
	executeHandler(cm.left_click, p2);
    4cee:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4cf1:	8b 45 94             	mov    -0x6c(%ebp),%eax
    4cf4:	8b 55 98             	mov    -0x68(%ebp),%edx
    4cf7:	89 44 24 04          	mov    %eax,0x4(%esp)
    4cfb:	89 54 24 08          	mov    %edx,0x8(%esp)
    4cff:	89 0c 24             	mov    %ecx,(%esp)
    4d02:	e8 28 fc ff ff       	call   492f <executeHandler>
	deleteClickable(&cm.left_click, r4);
    4d07:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4d0a:	89 44 24 04          	mov    %eax,0x4(%esp)
    4d0e:	8b 45 a8             	mov    -0x58(%ebp),%eax
    4d11:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d15:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4d18:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4d1c:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4d1f:	89 44 24 10          	mov    %eax,0x10(%esp)
    4d23:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4d26:	89 04 24             	mov    %eax,(%esp)
    4d29:	e8 21 fb ff ff       	call   484f <deleteClickable>
	printClickableList(cm.left_click);
    4d2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d31:	89 04 24             	mov    %eax,(%esp)
    4d34:	e8 ff fc ff ff       	call   4a38 <printClickableList>
}
    4d39:	c9                   	leave  
    4d3a:	c3                   	ret    

00004d3b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    4d3b:	55                   	push   %ebp
    4d3c:	89 e5                	mov    %esp,%ebp
    4d3e:	57                   	push   %edi
    4d3f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    4d40:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4d43:	8b 55 10             	mov    0x10(%ebp),%edx
    4d46:	8b 45 0c             	mov    0xc(%ebp),%eax
    4d49:	89 cb                	mov    %ecx,%ebx
    4d4b:	89 df                	mov    %ebx,%edi
    4d4d:	89 d1                	mov    %edx,%ecx
    4d4f:	fc                   	cld    
    4d50:	f3 aa                	rep stos %al,%es:(%edi)
    4d52:	89 ca                	mov    %ecx,%edx
    4d54:	89 fb                	mov    %edi,%ebx
    4d56:	89 5d 08             	mov    %ebx,0x8(%ebp)
    4d59:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    4d5c:	5b                   	pop    %ebx
    4d5d:	5f                   	pop    %edi
    4d5e:	5d                   	pop    %ebp
    4d5f:	c3                   	ret    

00004d60 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    4d60:	55                   	push   %ebp
    4d61:	89 e5                	mov    %esp,%ebp
    4d63:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    4d66:	8b 45 08             	mov    0x8(%ebp),%eax
    4d69:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    4d6c:	90                   	nop
    4d6d:	8b 45 08             	mov    0x8(%ebp),%eax
    4d70:	8d 50 01             	lea    0x1(%eax),%edx
    4d73:	89 55 08             	mov    %edx,0x8(%ebp)
    4d76:	8b 55 0c             	mov    0xc(%ebp),%edx
    4d79:	8d 4a 01             	lea    0x1(%edx),%ecx
    4d7c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    4d7f:	0f b6 12             	movzbl (%edx),%edx
    4d82:	88 10                	mov    %dl,(%eax)
    4d84:	0f b6 00             	movzbl (%eax),%eax
    4d87:	84 c0                	test   %al,%al
    4d89:	75 e2                	jne    4d6d <strcpy+0xd>
    ;
  return os;
    4d8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4d8e:	c9                   	leave  
    4d8f:	c3                   	ret    

00004d90 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4d90:	55                   	push   %ebp
    4d91:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    4d93:	eb 08                	jmp    4d9d <strcmp+0xd>
    p++, q++;
    4d95:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4d99:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    4d9d:	8b 45 08             	mov    0x8(%ebp),%eax
    4da0:	0f b6 00             	movzbl (%eax),%eax
    4da3:	84 c0                	test   %al,%al
    4da5:	74 10                	je     4db7 <strcmp+0x27>
    4da7:	8b 45 08             	mov    0x8(%ebp),%eax
    4daa:	0f b6 10             	movzbl (%eax),%edx
    4dad:	8b 45 0c             	mov    0xc(%ebp),%eax
    4db0:	0f b6 00             	movzbl (%eax),%eax
    4db3:	38 c2                	cmp    %al,%dl
    4db5:	74 de                	je     4d95 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    4db7:	8b 45 08             	mov    0x8(%ebp),%eax
    4dba:	0f b6 00             	movzbl (%eax),%eax
    4dbd:	0f b6 d0             	movzbl %al,%edx
    4dc0:	8b 45 0c             	mov    0xc(%ebp),%eax
    4dc3:	0f b6 00             	movzbl (%eax),%eax
    4dc6:	0f b6 c0             	movzbl %al,%eax
    4dc9:	29 c2                	sub    %eax,%edx
    4dcb:	89 d0                	mov    %edx,%eax
}
    4dcd:	5d                   	pop    %ebp
    4dce:	c3                   	ret    

00004dcf <strlen>:

uint
strlen(char *s)
{
    4dcf:	55                   	push   %ebp
    4dd0:	89 e5                	mov    %esp,%ebp
    4dd2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    4dd5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    4ddc:	eb 04                	jmp    4de2 <strlen+0x13>
    4dde:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    4de2:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4de5:	8b 45 08             	mov    0x8(%ebp),%eax
    4de8:	01 d0                	add    %edx,%eax
    4dea:	0f b6 00             	movzbl (%eax),%eax
    4ded:	84 c0                	test   %al,%al
    4def:	75 ed                	jne    4dde <strlen+0xf>
    ;
  return n;
    4df1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4df4:	c9                   	leave  
    4df5:	c3                   	ret    

00004df6 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4df6:	55                   	push   %ebp
    4df7:	89 e5                	mov    %esp,%ebp
    4df9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    4dfc:	8b 45 10             	mov    0x10(%ebp),%eax
    4dff:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e03:	8b 45 0c             	mov    0xc(%ebp),%eax
    4e06:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e0a:	8b 45 08             	mov    0x8(%ebp),%eax
    4e0d:	89 04 24             	mov    %eax,(%esp)
    4e10:	e8 26 ff ff ff       	call   4d3b <stosb>
  return dst;
    4e15:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4e18:	c9                   	leave  
    4e19:	c3                   	ret    

00004e1a <strchr>:

char*
strchr(const char *s, char c)
{
    4e1a:	55                   	push   %ebp
    4e1b:	89 e5                	mov    %esp,%ebp
    4e1d:	83 ec 04             	sub    $0x4,%esp
    4e20:	8b 45 0c             	mov    0xc(%ebp),%eax
    4e23:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    4e26:	eb 14                	jmp    4e3c <strchr+0x22>
    if(*s == c)
    4e28:	8b 45 08             	mov    0x8(%ebp),%eax
    4e2b:	0f b6 00             	movzbl (%eax),%eax
    4e2e:	3a 45 fc             	cmp    -0x4(%ebp),%al
    4e31:	75 05                	jne    4e38 <strchr+0x1e>
      return (char*)s;
    4e33:	8b 45 08             	mov    0x8(%ebp),%eax
    4e36:	eb 13                	jmp    4e4b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    4e38:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4e3c:	8b 45 08             	mov    0x8(%ebp),%eax
    4e3f:	0f b6 00             	movzbl (%eax),%eax
    4e42:	84 c0                	test   %al,%al
    4e44:	75 e2                	jne    4e28 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    4e46:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4e4b:	c9                   	leave  
    4e4c:	c3                   	ret    

00004e4d <gets>:

char*
gets(char *buf, int max)
{
    4e4d:	55                   	push   %ebp
    4e4e:	89 e5                	mov    %esp,%ebp
    4e50:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4e53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4e5a:	eb 4c                	jmp    4ea8 <gets+0x5b>
    cc = read(0, &c, 1);
    4e5c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4e63:	00 
    4e64:	8d 45 ef             	lea    -0x11(%ebp),%eax
    4e67:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e6b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e72:	e8 44 01 00 00       	call   4fbb <read>
    4e77:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    4e7a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4e7e:	7f 02                	jg     4e82 <gets+0x35>
      break;
    4e80:	eb 31                	jmp    4eb3 <gets+0x66>
    buf[i++] = c;
    4e82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e85:	8d 50 01             	lea    0x1(%eax),%edx
    4e88:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4e8b:	89 c2                	mov    %eax,%edx
    4e8d:	8b 45 08             	mov    0x8(%ebp),%eax
    4e90:	01 c2                	add    %eax,%edx
    4e92:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4e96:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    4e98:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4e9c:	3c 0a                	cmp    $0xa,%al
    4e9e:	74 13                	je     4eb3 <gets+0x66>
    4ea0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4ea4:	3c 0d                	cmp    $0xd,%al
    4ea6:	74 0b                	je     4eb3 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4ea8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4eab:	83 c0 01             	add    $0x1,%eax
    4eae:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4eb1:	7c a9                	jl     4e5c <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    4eb3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4eb6:	8b 45 08             	mov    0x8(%ebp),%eax
    4eb9:	01 d0                	add    %edx,%eax
    4ebb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    4ebe:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4ec1:	c9                   	leave  
    4ec2:	c3                   	ret    

00004ec3 <stat>:

int
stat(char *n, struct stat *st)
{
    4ec3:	55                   	push   %ebp
    4ec4:	89 e5                	mov    %esp,%ebp
    4ec6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4ec9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4ed0:	00 
    4ed1:	8b 45 08             	mov    0x8(%ebp),%eax
    4ed4:	89 04 24             	mov    %eax,(%esp)
    4ed7:	e8 07 01 00 00       	call   4fe3 <open>
    4edc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    4edf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4ee3:	79 07                	jns    4eec <stat+0x29>
    return -1;
    4ee5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4eea:	eb 23                	jmp    4f0f <stat+0x4c>
  r = fstat(fd, st);
    4eec:	8b 45 0c             	mov    0xc(%ebp),%eax
    4eef:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ef3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ef6:	89 04 24             	mov    %eax,(%esp)
    4ef9:	e8 fd 00 00 00       	call   4ffb <fstat>
    4efe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    4f01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4f04:	89 04 24             	mov    %eax,(%esp)
    4f07:	e8 bf 00 00 00       	call   4fcb <close>
  return r;
    4f0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    4f0f:	c9                   	leave  
    4f10:	c3                   	ret    

00004f11 <atoi>:

int
atoi(const char *s)
{
    4f11:	55                   	push   %ebp
    4f12:	89 e5                	mov    %esp,%ebp
    4f14:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    4f17:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    4f1e:	eb 25                	jmp    4f45 <atoi+0x34>
    n = n*10 + *s++ - '0';
    4f20:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4f23:	89 d0                	mov    %edx,%eax
    4f25:	c1 e0 02             	shl    $0x2,%eax
    4f28:	01 d0                	add    %edx,%eax
    4f2a:	01 c0                	add    %eax,%eax
    4f2c:	89 c1                	mov    %eax,%ecx
    4f2e:	8b 45 08             	mov    0x8(%ebp),%eax
    4f31:	8d 50 01             	lea    0x1(%eax),%edx
    4f34:	89 55 08             	mov    %edx,0x8(%ebp)
    4f37:	0f b6 00             	movzbl (%eax),%eax
    4f3a:	0f be c0             	movsbl %al,%eax
    4f3d:	01 c8                	add    %ecx,%eax
    4f3f:	83 e8 30             	sub    $0x30,%eax
    4f42:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4f45:	8b 45 08             	mov    0x8(%ebp),%eax
    4f48:	0f b6 00             	movzbl (%eax),%eax
    4f4b:	3c 2f                	cmp    $0x2f,%al
    4f4d:	7e 0a                	jle    4f59 <atoi+0x48>
    4f4f:	8b 45 08             	mov    0x8(%ebp),%eax
    4f52:	0f b6 00             	movzbl (%eax),%eax
    4f55:	3c 39                	cmp    $0x39,%al
    4f57:	7e c7                	jle    4f20 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    4f59:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4f5c:	c9                   	leave  
    4f5d:	c3                   	ret    

00004f5e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4f5e:	55                   	push   %ebp
    4f5f:	89 e5                	mov    %esp,%ebp
    4f61:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    4f64:	8b 45 08             	mov    0x8(%ebp),%eax
    4f67:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    4f6a:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f6d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    4f70:	eb 17                	jmp    4f89 <memmove+0x2b>
    *dst++ = *src++;
    4f72:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f75:	8d 50 01             	lea    0x1(%eax),%edx
    4f78:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4f7b:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4f7e:	8d 4a 01             	lea    0x1(%edx),%ecx
    4f81:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    4f84:	0f b6 12             	movzbl (%edx),%edx
    4f87:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4f89:	8b 45 10             	mov    0x10(%ebp),%eax
    4f8c:	8d 50 ff             	lea    -0x1(%eax),%edx
    4f8f:	89 55 10             	mov    %edx,0x10(%ebp)
    4f92:	85 c0                	test   %eax,%eax
    4f94:	7f dc                	jg     4f72 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    4f96:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4f99:	c9                   	leave  
    4f9a:	c3                   	ret    

00004f9b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4f9b:	b8 01 00 00 00       	mov    $0x1,%eax
    4fa0:	cd 40                	int    $0x40
    4fa2:	c3                   	ret    

00004fa3 <exit>:
SYSCALL(exit)
    4fa3:	b8 02 00 00 00       	mov    $0x2,%eax
    4fa8:	cd 40                	int    $0x40
    4faa:	c3                   	ret    

00004fab <wait>:
SYSCALL(wait)
    4fab:	b8 03 00 00 00       	mov    $0x3,%eax
    4fb0:	cd 40                	int    $0x40
    4fb2:	c3                   	ret    

00004fb3 <pipe>:
SYSCALL(pipe)
    4fb3:	b8 04 00 00 00       	mov    $0x4,%eax
    4fb8:	cd 40                	int    $0x40
    4fba:	c3                   	ret    

00004fbb <read>:
SYSCALL(read)
    4fbb:	b8 05 00 00 00       	mov    $0x5,%eax
    4fc0:	cd 40                	int    $0x40
    4fc2:	c3                   	ret    

00004fc3 <write>:
SYSCALL(write)
    4fc3:	b8 10 00 00 00       	mov    $0x10,%eax
    4fc8:	cd 40                	int    $0x40
    4fca:	c3                   	ret    

00004fcb <close>:
SYSCALL(close)
    4fcb:	b8 15 00 00 00       	mov    $0x15,%eax
    4fd0:	cd 40                	int    $0x40
    4fd2:	c3                   	ret    

00004fd3 <kill>:
SYSCALL(kill)
    4fd3:	b8 06 00 00 00       	mov    $0x6,%eax
    4fd8:	cd 40                	int    $0x40
    4fda:	c3                   	ret    

00004fdb <exec>:
SYSCALL(exec)
    4fdb:	b8 07 00 00 00       	mov    $0x7,%eax
    4fe0:	cd 40                	int    $0x40
    4fe2:	c3                   	ret    

00004fe3 <open>:
SYSCALL(open)
    4fe3:	b8 0f 00 00 00       	mov    $0xf,%eax
    4fe8:	cd 40                	int    $0x40
    4fea:	c3                   	ret    

00004feb <mknod>:
SYSCALL(mknod)
    4feb:	b8 11 00 00 00       	mov    $0x11,%eax
    4ff0:	cd 40                	int    $0x40
    4ff2:	c3                   	ret    

00004ff3 <unlink>:
SYSCALL(unlink)
    4ff3:	b8 12 00 00 00       	mov    $0x12,%eax
    4ff8:	cd 40                	int    $0x40
    4ffa:	c3                   	ret    

00004ffb <fstat>:
SYSCALL(fstat)
    4ffb:	b8 08 00 00 00       	mov    $0x8,%eax
    5000:	cd 40                	int    $0x40
    5002:	c3                   	ret    

00005003 <link>:
SYSCALL(link)
    5003:	b8 13 00 00 00       	mov    $0x13,%eax
    5008:	cd 40                	int    $0x40
    500a:	c3                   	ret    

0000500b <mkdir>:
SYSCALL(mkdir)
    500b:	b8 14 00 00 00       	mov    $0x14,%eax
    5010:	cd 40                	int    $0x40
    5012:	c3                   	ret    

00005013 <chdir>:
SYSCALL(chdir)
    5013:	b8 09 00 00 00       	mov    $0x9,%eax
    5018:	cd 40                	int    $0x40
    501a:	c3                   	ret    

0000501b <dup>:
SYSCALL(dup)
    501b:	b8 0a 00 00 00       	mov    $0xa,%eax
    5020:	cd 40                	int    $0x40
    5022:	c3                   	ret    

00005023 <getpid>:
SYSCALL(getpid)
    5023:	b8 0b 00 00 00       	mov    $0xb,%eax
    5028:	cd 40                	int    $0x40
    502a:	c3                   	ret    

0000502b <sbrk>:
SYSCALL(sbrk)
    502b:	b8 0c 00 00 00       	mov    $0xc,%eax
    5030:	cd 40                	int    $0x40
    5032:	c3                   	ret    

00005033 <sleep>:
SYSCALL(sleep)
    5033:	b8 0d 00 00 00       	mov    $0xd,%eax
    5038:	cd 40                	int    $0x40
    503a:	c3                   	ret    

0000503b <uptime>:
SYSCALL(uptime)
    503b:	b8 0e 00 00 00       	mov    $0xe,%eax
    5040:	cd 40                	int    $0x40
    5042:	c3                   	ret    

00005043 <getMsg>:
SYSCALL(getMsg)
    5043:	b8 16 00 00 00       	mov    $0x16,%eax
    5048:	cd 40                	int    $0x40
    504a:	c3                   	ret    

0000504b <createWindow>:
SYSCALL(createWindow)
    504b:	b8 17 00 00 00       	mov    $0x17,%eax
    5050:	cd 40                	int    $0x40
    5052:	c3                   	ret    

00005053 <destroyWindow>:
SYSCALL(destroyWindow)
    5053:	b8 18 00 00 00       	mov    $0x18,%eax
    5058:	cd 40                	int    $0x40
    505a:	c3                   	ret    

0000505b <updateWindow>:
SYSCALL(updateWindow)
    505b:	b8 19 00 00 00       	mov    $0x19,%eax
    5060:	cd 40                	int    $0x40
    5062:	c3                   	ret    

00005063 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    5063:	b8 1a 00 00 00       	mov    $0x1a,%eax
    5068:	cd 40                	int    $0x40
    506a:	c3                   	ret    

0000506b <kwrite>:
SYSCALL(kwrite)
    506b:	b8 1c 00 00 00       	mov    $0x1c,%eax
    5070:	cd 40                	int    $0x40
    5072:	c3                   	ret    

00005073 <setSampleRate>:
SYSCALL(setSampleRate)
    5073:	b8 1b 00 00 00       	mov    $0x1b,%eax
    5078:	cd 40                	int    $0x40
    507a:	c3                   	ret    

0000507b <pause>:
SYSCALL(pause)
    507b:	b8 1d 00 00 00       	mov    $0x1d,%eax
    5080:	cd 40                	int    $0x40
    5082:	c3                   	ret    

00005083 <wavdecode>:
SYSCALL(wavdecode)
    5083:	b8 1e 00 00 00       	mov    $0x1e,%eax
    5088:	cd 40                	int    $0x40
    508a:	c3                   	ret    

0000508b <beginDecode>:
SYSCALL(beginDecode)
    508b:	b8 1f 00 00 00       	mov    $0x1f,%eax
    5090:	cd 40                	int    $0x40
    5092:	c3                   	ret    

00005093 <waitForDecode>:
SYSCALL(waitForDecode)
    5093:	b8 20 00 00 00       	mov    $0x20,%eax
    5098:	cd 40                	int    $0x40
    509a:	c3                   	ret    

0000509b <endDecode>:
SYSCALL(endDecode)
    509b:	b8 21 00 00 00       	mov    $0x21,%eax
    50a0:	cd 40                	int    $0x40
    50a2:	c3                   	ret    

000050a3 <getCoreBuf>:
    50a3:	b8 22 00 00 00       	mov    $0x22,%eax
    50a8:	cd 40                	int    $0x40
    50aa:	c3                   	ret    

000050ab <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    50ab:	55                   	push   %ebp
    50ac:	89 e5                	mov    %esp,%ebp
    50ae:	83 ec 18             	sub    $0x18,%esp
    50b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    50b4:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    50b7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    50be:	00 
    50bf:	8d 45 f4             	lea    -0xc(%ebp),%eax
    50c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    50c6:	8b 45 08             	mov    0x8(%ebp),%eax
    50c9:	89 04 24             	mov    %eax,(%esp)
    50cc:	e8 f2 fe ff ff       	call   4fc3 <write>
}
    50d1:	c9                   	leave  
    50d2:	c3                   	ret    

000050d3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    50d3:	55                   	push   %ebp
    50d4:	89 e5                	mov    %esp,%ebp
    50d6:	56                   	push   %esi
    50d7:	53                   	push   %ebx
    50d8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    50db:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    50e2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    50e6:	74 17                	je     50ff <printint+0x2c>
    50e8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    50ec:	79 11                	jns    50ff <printint+0x2c>
    neg = 1;
    50ee:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    50f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    50f8:	f7 d8                	neg    %eax
    50fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    50fd:	eb 06                	jmp    5105 <printint+0x32>
  } else {
    x = xx;
    50ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    5102:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    5105:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    510c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    510f:	8d 41 01             	lea    0x1(%ecx),%eax
    5112:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5115:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5118:	8b 45 ec             	mov    -0x14(%ebp),%eax
    511b:	ba 00 00 00 00       	mov    $0x0,%edx
    5120:	f7 f3                	div    %ebx
    5122:	89 d0                	mov    %edx,%eax
    5124:	0f b6 80 7c ff 00 00 	movzbl 0xff7c(%eax),%eax
    512b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    512f:	8b 75 10             	mov    0x10(%ebp),%esi
    5132:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5135:	ba 00 00 00 00       	mov    $0x0,%edx
    513a:	f7 f6                	div    %esi
    513c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    513f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5143:	75 c7                	jne    510c <printint+0x39>
  if(neg)
    5145:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5149:	74 10                	je     515b <printint+0x88>
    buf[i++] = '-';
    514b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    514e:	8d 50 01             	lea    0x1(%eax),%edx
    5151:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5154:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    5159:	eb 1f                	jmp    517a <printint+0xa7>
    515b:	eb 1d                	jmp    517a <printint+0xa7>
    putc(fd, buf[i]);
    515d:	8d 55 dc             	lea    -0x24(%ebp),%edx
    5160:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5163:	01 d0                	add    %edx,%eax
    5165:	0f b6 00             	movzbl (%eax),%eax
    5168:	0f be c0             	movsbl %al,%eax
    516b:	89 44 24 04          	mov    %eax,0x4(%esp)
    516f:	8b 45 08             	mov    0x8(%ebp),%eax
    5172:	89 04 24             	mov    %eax,(%esp)
    5175:	e8 31 ff ff ff       	call   50ab <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    517a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    517e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5182:	79 d9                	jns    515d <printint+0x8a>
    putc(fd, buf[i]);
}
    5184:	83 c4 30             	add    $0x30,%esp
    5187:	5b                   	pop    %ebx
    5188:	5e                   	pop    %esi
    5189:	5d                   	pop    %ebp
    518a:	c3                   	ret    

0000518b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    518b:	55                   	push   %ebp
    518c:	89 e5                	mov    %esp,%ebp
    518e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    5191:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    5198:	8d 45 0c             	lea    0xc(%ebp),%eax
    519b:	83 c0 04             	add    $0x4,%eax
    519e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    51a1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    51a8:	e9 7c 01 00 00       	jmp    5329 <printf+0x19e>
    c = fmt[i] & 0xff;
    51ad:	8b 55 0c             	mov    0xc(%ebp),%edx
    51b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51b3:	01 d0                	add    %edx,%eax
    51b5:	0f b6 00             	movzbl (%eax),%eax
    51b8:	0f be c0             	movsbl %al,%eax
    51bb:	25 ff 00 00 00       	and    $0xff,%eax
    51c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    51c3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    51c7:	75 2c                	jne    51f5 <printf+0x6a>
      if(c == '%'){
    51c9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    51cd:	75 0c                	jne    51db <printf+0x50>
        state = '%';
    51cf:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    51d6:	e9 4a 01 00 00       	jmp    5325 <printf+0x19a>
      } else {
        putc(fd, c);
    51db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51de:	0f be c0             	movsbl %al,%eax
    51e1:	89 44 24 04          	mov    %eax,0x4(%esp)
    51e5:	8b 45 08             	mov    0x8(%ebp),%eax
    51e8:	89 04 24             	mov    %eax,(%esp)
    51eb:	e8 bb fe ff ff       	call   50ab <putc>
    51f0:	e9 30 01 00 00       	jmp    5325 <printf+0x19a>
      }
    } else if(state == '%'){
    51f5:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    51f9:	0f 85 26 01 00 00    	jne    5325 <printf+0x19a>
      if(c == 'd'){
    51ff:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    5203:	75 2d                	jne    5232 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    5205:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5208:	8b 00                	mov    (%eax),%eax
    520a:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5211:	00 
    5212:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    5219:	00 
    521a:	89 44 24 04          	mov    %eax,0x4(%esp)
    521e:	8b 45 08             	mov    0x8(%ebp),%eax
    5221:	89 04 24             	mov    %eax,(%esp)
    5224:	e8 aa fe ff ff       	call   50d3 <printint>
        ap++;
    5229:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    522d:	e9 ec 00 00 00       	jmp    531e <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    5232:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    5236:	74 06                	je     523e <printf+0xb3>
    5238:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    523c:	75 2d                	jne    526b <printf+0xe0>
        printint(fd, *ap, 16, 0);
    523e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5241:	8b 00                	mov    (%eax),%eax
    5243:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    524a:	00 
    524b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    5252:	00 
    5253:	89 44 24 04          	mov    %eax,0x4(%esp)
    5257:	8b 45 08             	mov    0x8(%ebp),%eax
    525a:	89 04 24             	mov    %eax,(%esp)
    525d:	e8 71 fe ff ff       	call   50d3 <printint>
        ap++;
    5262:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5266:	e9 b3 00 00 00       	jmp    531e <printf+0x193>
      } else if(c == 's'){
    526b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    526f:	75 45                	jne    52b6 <printf+0x12b>
        s = (char*)*ap;
    5271:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5274:	8b 00                	mov    (%eax),%eax
    5276:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    5279:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    527d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5281:	75 09                	jne    528c <printf+0x101>
          s = "(null)";
    5283:	c7 45 f4 1f bf 00 00 	movl   $0xbf1f,-0xc(%ebp)
        while(*s != 0){
    528a:	eb 1e                	jmp    52aa <printf+0x11f>
    528c:	eb 1c                	jmp    52aa <printf+0x11f>
          putc(fd, *s);
    528e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5291:	0f b6 00             	movzbl (%eax),%eax
    5294:	0f be c0             	movsbl %al,%eax
    5297:	89 44 24 04          	mov    %eax,0x4(%esp)
    529b:	8b 45 08             	mov    0x8(%ebp),%eax
    529e:	89 04 24             	mov    %eax,(%esp)
    52a1:	e8 05 fe ff ff       	call   50ab <putc>
          s++;
    52a6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    52aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52ad:	0f b6 00             	movzbl (%eax),%eax
    52b0:	84 c0                	test   %al,%al
    52b2:	75 da                	jne    528e <printf+0x103>
    52b4:	eb 68                	jmp    531e <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    52b6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    52ba:	75 1d                	jne    52d9 <printf+0x14e>
        putc(fd, *ap);
    52bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    52bf:	8b 00                	mov    (%eax),%eax
    52c1:	0f be c0             	movsbl %al,%eax
    52c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    52c8:	8b 45 08             	mov    0x8(%ebp),%eax
    52cb:	89 04 24             	mov    %eax,(%esp)
    52ce:	e8 d8 fd ff ff       	call   50ab <putc>
        ap++;
    52d3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    52d7:	eb 45                	jmp    531e <printf+0x193>
      } else if(c == '%'){
    52d9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    52dd:	75 17                	jne    52f6 <printf+0x16b>
        putc(fd, c);
    52df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    52e2:	0f be c0             	movsbl %al,%eax
    52e5:	89 44 24 04          	mov    %eax,0x4(%esp)
    52e9:	8b 45 08             	mov    0x8(%ebp),%eax
    52ec:	89 04 24             	mov    %eax,(%esp)
    52ef:	e8 b7 fd ff ff       	call   50ab <putc>
    52f4:	eb 28                	jmp    531e <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    52f6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    52fd:	00 
    52fe:	8b 45 08             	mov    0x8(%ebp),%eax
    5301:	89 04 24             	mov    %eax,(%esp)
    5304:	e8 a2 fd ff ff       	call   50ab <putc>
        putc(fd, c);
    5309:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    530c:	0f be c0             	movsbl %al,%eax
    530f:	89 44 24 04          	mov    %eax,0x4(%esp)
    5313:	8b 45 08             	mov    0x8(%ebp),%eax
    5316:	89 04 24             	mov    %eax,(%esp)
    5319:	e8 8d fd ff ff       	call   50ab <putc>
      }
      state = 0;
    531e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    5325:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5329:	8b 55 0c             	mov    0xc(%ebp),%edx
    532c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    532f:	01 d0                	add    %edx,%eax
    5331:	0f b6 00             	movzbl (%eax),%eax
    5334:	84 c0                	test   %al,%al
    5336:	0f 85 71 fe ff ff    	jne    51ad <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    533c:	c9                   	leave  
    533d:	c3                   	ret    

0000533e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    533e:	55                   	push   %ebp
    533f:	89 e5                	mov    %esp,%ebp
    5341:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    5344:	8b 45 08             	mov    0x8(%ebp),%eax
    5347:	83 e8 08             	sub    $0x8,%eax
    534a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    534d:	a1 9c 04 01 00       	mov    0x1049c,%eax
    5352:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5355:	eb 24                	jmp    537b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    5357:	8b 45 fc             	mov    -0x4(%ebp),%eax
    535a:	8b 00                	mov    (%eax),%eax
    535c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    535f:	77 12                	ja     5373 <free+0x35>
    5361:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5364:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5367:	77 24                	ja     538d <free+0x4f>
    5369:	8b 45 fc             	mov    -0x4(%ebp),%eax
    536c:	8b 00                	mov    (%eax),%eax
    536e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5371:	77 1a                	ja     538d <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5373:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5376:	8b 00                	mov    (%eax),%eax
    5378:	89 45 fc             	mov    %eax,-0x4(%ebp)
    537b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    537e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5381:	76 d4                	jbe    5357 <free+0x19>
    5383:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5386:	8b 00                	mov    (%eax),%eax
    5388:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    538b:	76 ca                	jbe    5357 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    538d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5390:	8b 40 04             	mov    0x4(%eax),%eax
    5393:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    539a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    539d:	01 c2                	add    %eax,%edx
    539f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53a2:	8b 00                	mov    (%eax),%eax
    53a4:	39 c2                	cmp    %eax,%edx
    53a6:	75 24                	jne    53cc <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    53a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53ab:	8b 50 04             	mov    0x4(%eax),%edx
    53ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53b1:	8b 00                	mov    (%eax),%eax
    53b3:	8b 40 04             	mov    0x4(%eax),%eax
    53b6:	01 c2                	add    %eax,%edx
    53b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53bb:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    53be:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53c1:	8b 00                	mov    (%eax),%eax
    53c3:	8b 10                	mov    (%eax),%edx
    53c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53c8:	89 10                	mov    %edx,(%eax)
    53ca:	eb 0a                	jmp    53d6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    53cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53cf:	8b 10                	mov    (%eax),%edx
    53d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53d4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    53d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53d9:	8b 40 04             	mov    0x4(%eax),%eax
    53dc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    53e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53e6:	01 d0                	add    %edx,%eax
    53e8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    53eb:	75 20                	jne    540d <free+0xcf>
    p->s.size += bp->s.size;
    53ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53f0:	8b 50 04             	mov    0x4(%eax),%edx
    53f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    53f6:	8b 40 04             	mov    0x4(%eax),%eax
    53f9:	01 c2                	add    %eax,%edx
    53fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53fe:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    5401:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5404:	8b 10                	mov    (%eax),%edx
    5406:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5409:	89 10                	mov    %edx,(%eax)
    540b:	eb 08                	jmp    5415 <free+0xd7>
  } else
    p->s.ptr = bp;
    540d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5410:	8b 55 f8             	mov    -0x8(%ebp),%edx
    5413:	89 10                	mov    %edx,(%eax)
  freep = p;
    5415:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5418:	a3 9c 04 01 00       	mov    %eax,0x1049c
}
    541d:	c9                   	leave  
    541e:	c3                   	ret    

0000541f <morecore>:

static Header*
morecore(uint nu)
{
    541f:	55                   	push   %ebp
    5420:	89 e5                	mov    %esp,%ebp
    5422:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    5425:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    542c:	77 07                	ja     5435 <morecore+0x16>
    nu = 4096;
    542e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    5435:	8b 45 08             	mov    0x8(%ebp),%eax
    5438:	c1 e0 03             	shl    $0x3,%eax
    543b:	89 04 24             	mov    %eax,(%esp)
    543e:	e8 e8 fb ff ff       	call   502b <sbrk>
    5443:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    5446:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    544a:	75 07                	jne    5453 <morecore+0x34>
    return 0;
    544c:	b8 00 00 00 00       	mov    $0x0,%eax
    5451:	eb 22                	jmp    5475 <morecore+0x56>
  hp = (Header*)p;
    5453:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5456:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    5459:	8b 45 f0             	mov    -0x10(%ebp),%eax
    545c:	8b 55 08             	mov    0x8(%ebp),%edx
    545f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    5462:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5465:	83 c0 08             	add    $0x8,%eax
    5468:	89 04 24             	mov    %eax,(%esp)
    546b:	e8 ce fe ff ff       	call   533e <free>
  return freep;
    5470:	a1 9c 04 01 00       	mov    0x1049c,%eax
}
    5475:	c9                   	leave  
    5476:	c3                   	ret    

00005477 <malloc>:

void*
malloc(uint nbytes)
{
    5477:	55                   	push   %ebp
    5478:	89 e5                	mov    %esp,%ebp
    547a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    547d:	8b 45 08             	mov    0x8(%ebp),%eax
    5480:	83 c0 07             	add    $0x7,%eax
    5483:	c1 e8 03             	shr    $0x3,%eax
    5486:	83 c0 01             	add    $0x1,%eax
    5489:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    548c:	a1 9c 04 01 00       	mov    0x1049c,%eax
    5491:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5494:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5498:	75 23                	jne    54bd <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    549a:	c7 45 f0 94 04 01 00 	movl   $0x10494,-0x10(%ebp)
    54a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54a4:	a3 9c 04 01 00       	mov    %eax,0x1049c
    54a9:	a1 9c 04 01 00       	mov    0x1049c,%eax
    54ae:	a3 94 04 01 00       	mov    %eax,0x10494
    base.s.size = 0;
    54b3:	c7 05 98 04 01 00 00 	movl   $0x0,0x10498
    54ba:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    54bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54c0:	8b 00                	mov    (%eax),%eax
    54c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    54c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54c8:	8b 40 04             	mov    0x4(%eax),%eax
    54cb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    54ce:	72 4d                	jb     551d <malloc+0xa6>
      if(p->s.size == nunits)
    54d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54d3:	8b 40 04             	mov    0x4(%eax),%eax
    54d6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    54d9:	75 0c                	jne    54e7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    54db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54de:	8b 10                	mov    (%eax),%edx
    54e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54e3:	89 10                	mov    %edx,(%eax)
    54e5:	eb 26                	jmp    550d <malloc+0x96>
      else {
        p->s.size -= nunits;
    54e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54ea:	8b 40 04             	mov    0x4(%eax),%eax
    54ed:	2b 45 ec             	sub    -0x14(%ebp),%eax
    54f0:	89 c2                	mov    %eax,%edx
    54f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54f5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    54f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54fb:	8b 40 04             	mov    0x4(%eax),%eax
    54fe:	c1 e0 03             	shl    $0x3,%eax
    5501:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    5504:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5507:	8b 55 ec             	mov    -0x14(%ebp),%edx
    550a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    550d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5510:	a3 9c 04 01 00       	mov    %eax,0x1049c
      return (void*)(p + 1);
    5515:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5518:	83 c0 08             	add    $0x8,%eax
    551b:	eb 38                	jmp    5555 <malloc+0xde>
    }
    if(p == freep)
    551d:	a1 9c 04 01 00       	mov    0x1049c,%eax
    5522:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5525:	75 1b                	jne    5542 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    5527:	8b 45 ec             	mov    -0x14(%ebp),%eax
    552a:	89 04 24             	mov    %eax,(%esp)
    552d:	e8 ed fe ff ff       	call   541f <morecore>
    5532:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5535:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5539:	75 07                	jne    5542 <malloc+0xcb>
        return 0;
    553b:	b8 00 00 00 00       	mov    $0x0,%eax
    5540:	eb 13                	jmp    5555 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5542:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5545:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5548:	8b 45 f4             	mov    -0xc(%ebp),%eax
    554b:	8b 00                	mov    (%eax),%eax
    554d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    5550:	e9 70 ff ff ff       	jmp    54c5 <malloc+0x4e>
}
    5555:	c9                   	leave  
    5556:	c3                   	ret    

00005557 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    5557:	55                   	push   %ebp
    5558:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    555a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    555e:	79 07                	jns    5567 <abs+0x10>
		return x * -1;
    5560:	8b 45 08             	mov    0x8(%ebp),%eax
    5563:	f7 d8                	neg    %eax
    5565:	eb 03                	jmp    556a <abs+0x13>
	else
		return x;
    5567:	8b 45 08             	mov    0x8(%ebp),%eax
}
    556a:	5d                   	pop    %ebp
    556b:	c3                   	ret    

0000556c <sin>:
double sin(double x)  
{  
    556c:	55                   	push   %ebp
    556d:	89 e5                	mov    %esp,%ebp
    556f:	83 ec 3c             	sub    $0x3c,%esp
    5572:	8b 45 08             	mov    0x8(%ebp),%eax
    5575:	89 45 c8             	mov    %eax,-0x38(%ebp)
    5578:	8b 45 0c             	mov    0xc(%ebp),%eax
    557b:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    557e:	dd 45 c8             	fldl   -0x38(%ebp)
    5581:	dd 5d f8             	fstpl  -0x8(%ebp)
    5584:	d9 e8                	fld1   
    5586:	dd 5d f0             	fstpl  -0x10(%ebp)
    5589:	dd 45 c8             	fldl   -0x38(%ebp)
    558c:	dd 5d e8             	fstpl  -0x18(%ebp)
    558f:	dd 45 c8             	fldl   -0x38(%ebp)
    5592:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    5595:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    559c:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    55a3:	eb 50                	jmp    55f5 <sin+0x89>
	{  
		n = n+1;  
    55a5:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    55a9:	db 45 dc             	fildl  -0x24(%ebp)
    55ac:	dc 4d f0             	fmull  -0x10(%ebp)
    55af:	8b 45 dc             	mov    -0x24(%ebp),%eax
    55b2:	83 c0 01             	add    $0x1,%eax
    55b5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    55b8:	db 45 c4             	fildl  -0x3c(%ebp)
    55bb:	de c9                	fmulp  %st,%st(1)
    55bd:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    55c0:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    55c4:	dd 45 c8             	fldl   -0x38(%ebp)
    55c7:	dc 4d c8             	fmull  -0x38(%ebp)
    55ca:	dd 45 e8             	fldl   -0x18(%ebp)
    55cd:	de c9                	fmulp  %st,%st(1)
    55cf:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    55d2:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    55d5:	dd 45 e8             	fldl   -0x18(%ebp)
    55d8:	dc 75 f0             	fdivl  -0x10(%ebp)
    55db:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    55de:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    55e2:	7e 08                	jle    55ec <sin+0x80>
    55e4:	dd 45 f8             	fldl   -0x8(%ebp)
    55e7:	dc 45 e0             	faddl  -0x20(%ebp)
    55ea:	eb 06                	jmp    55f2 <sin+0x86>
    55ec:	dd 45 f8             	fldl   -0x8(%ebp)
    55ef:	dc 65 e0             	fsubl  -0x20(%ebp)
    55f2:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    55f5:	dd 45 e0             	fldl   -0x20(%ebp)
    55f8:	dd 05 28 bf 00 00    	fldl   0xbf28
    55fe:	d9 c9                	fxch   %st(1)
    5600:	df e9                	fucomip %st(1),%st
    5602:	dd d8                	fstp   %st(0)
    5604:	77 9f                	ja     55a5 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    5606:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    5609:	c9                   	leave  
    560a:	c3                   	ret    

0000560b <cos>:
double cos(double x)  
{  
    560b:	55                   	push   %ebp
    560c:	89 e5                	mov    %esp,%ebp
    560e:	83 ec 10             	sub    $0x10,%esp
    5611:	8b 45 08             	mov    0x8(%ebp),%eax
    5614:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5617:	8b 45 0c             	mov    0xc(%ebp),%eax
    561a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    561d:	dd 05 30 bf 00 00    	fldl   0xbf30
    5623:	dc 65 f8             	fsubl  -0x8(%ebp)
    5626:	dd 1c 24             	fstpl  (%esp)
    5629:	e8 3e ff ff ff       	call   556c <sin>
}  
    562e:	c9                   	leave  
    562f:	c3                   	ret    

00005630 <tan>:
double tan(double x)  
{  
    5630:	55                   	push   %ebp
    5631:	89 e5                	mov    %esp,%ebp
    5633:	83 ec 18             	sub    $0x18,%esp
    5636:	8b 45 08             	mov    0x8(%ebp),%eax
    5639:	89 45 f8             	mov    %eax,-0x8(%ebp)
    563c:	8b 45 0c             	mov    0xc(%ebp),%eax
    563f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    5642:	dd 45 f8             	fldl   -0x8(%ebp)
    5645:	dd 1c 24             	fstpl  (%esp)
    5648:	e8 1f ff ff ff       	call   556c <sin>
    564d:	dd 5d f0             	fstpl  -0x10(%ebp)
    5650:	dd 45 f8             	fldl   -0x8(%ebp)
    5653:	dd 1c 24             	fstpl  (%esp)
    5656:	e8 b0 ff ff ff       	call   560b <cos>
    565b:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    565e:	c9                   	leave  
    565f:	c3                   	ret    

00005660 <pow>:

double pow(double x, double y)
{
    5660:	55                   	push   %ebp
    5661:	89 e5                	mov    %esp,%ebp
    5663:	83 ec 48             	sub    $0x48,%esp
    5666:	8b 45 08             	mov    0x8(%ebp),%eax
    5669:	89 45 e0             	mov    %eax,-0x20(%ebp)
    566c:	8b 45 0c             	mov    0xc(%ebp),%eax
    566f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5672:	8b 45 10             	mov    0x10(%ebp),%eax
    5675:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5678:	8b 45 14             	mov    0x14(%ebp),%eax
    567b:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    567e:	dd 45 e0             	fldl   -0x20(%ebp)
    5681:	d9 ee                	fldz   
    5683:	df e9                	fucomip %st(1),%st
    5685:	dd d8                	fstp   %st(0)
    5687:	7a 28                	jp     56b1 <pow+0x51>
    5689:	dd 45 e0             	fldl   -0x20(%ebp)
    568c:	d9 ee                	fldz   
    568e:	df e9                	fucomip %st(1),%st
    5690:	dd d8                	fstp   %st(0)
    5692:	75 1d                	jne    56b1 <pow+0x51>
    5694:	dd 45 d8             	fldl   -0x28(%ebp)
    5697:	d9 ee                	fldz   
    5699:	df e9                	fucomip %st(1),%st
    569b:	dd d8                	fstp   %st(0)
    569d:	7a 0b                	jp     56aa <pow+0x4a>
    569f:	dd 45 d8             	fldl   -0x28(%ebp)
    56a2:	d9 ee                	fldz   
    56a4:	df e9                	fucomip %st(1),%st
    56a6:	dd d8                	fstp   %st(0)
    56a8:	74 07                	je     56b1 <pow+0x51>
    56aa:	d9 ee                	fldz   
    56ac:	e9 30 01 00 00       	jmp    57e1 <pow+0x181>
	else if(x==0 && y==0) return 1;
    56b1:	dd 45 e0             	fldl   -0x20(%ebp)
    56b4:	d9 ee                	fldz   
    56b6:	df e9                	fucomip %st(1),%st
    56b8:	dd d8                	fstp   %st(0)
    56ba:	7a 28                	jp     56e4 <pow+0x84>
    56bc:	dd 45 e0             	fldl   -0x20(%ebp)
    56bf:	d9 ee                	fldz   
    56c1:	df e9                	fucomip %st(1),%st
    56c3:	dd d8                	fstp   %st(0)
    56c5:	75 1d                	jne    56e4 <pow+0x84>
    56c7:	dd 45 d8             	fldl   -0x28(%ebp)
    56ca:	d9 ee                	fldz   
    56cc:	df e9                	fucomip %st(1),%st
    56ce:	dd d8                	fstp   %st(0)
    56d0:	7a 12                	jp     56e4 <pow+0x84>
    56d2:	dd 45 d8             	fldl   -0x28(%ebp)
    56d5:	d9 ee                	fldz   
    56d7:	df e9                	fucomip %st(1),%st
    56d9:	dd d8                	fstp   %st(0)
    56db:	75 07                	jne    56e4 <pow+0x84>
    56dd:	d9 e8                	fld1   
    56df:	e9 fd 00 00 00       	jmp    57e1 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    56e4:	d9 ee                	fldz   
    56e6:	dd 45 d8             	fldl   -0x28(%ebp)
    56e9:	d9 c9                	fxch   %st(1)
    56eb:	df e9                	fucomip %st(1),%st
    56ed:	dd d8                	fstp   %st(0)
    56ef:	76 1d                	jbe    570e <pow+0xae>
    56f1:	dd 45 d8             	fldl   -0x28(%ebp)
    56f4:	d9 e0                	fchs   
    56f6:	dd 5c 24 08          	fstpl  0x8(%esp)
    56fa:	dd 45 e0             	fldl   -0x20(%ebp)
    56fd:	dd 1c 24             	fstpl  (%esp)
    5700:	e8 5b ff ff ff       	call   5660 <pow>
    5705:	d9 e8                	fld1   
    5707:	de f1                	fdivp  %st,%st(1)
    5709:	e9 d3 00 00 00       	jmp    57e1 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    570e:	d9 ee                	fldz   
    5710:	dd 45 e0             	fldl   -0x20(%ebp)
    5713:	d9 c9                	fxch   %st(1)
    5715:	df e9                	fucomip %st(1),%st
    5717:	dd d8                	fstp   %st(0)
    5719:	76 40                	jbe    575b <pow+0xfb>
    571b:	dd 45 d8             	fldl   -0x28(%ebp)
    571e:	d9 7d d6             	fnstcw -0x2a(%ebp)
    5721:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    5725:	b4 0c                	mov    $0xc,%ah
    5727:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    572b:	d9 6d d4             	fldcw  -0x2c(%ebp)
    572e:	db 5d d0             	fistpl -0x30(%ebp)
    5731:	d9 6d d6             	fldcw  -0x2a(%ebp)
    5734:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5737:	89 45 d0             	mov    %eax,-0x30(%ebp)
    573a:	db 45 d0             	fildl  -0x30(%ebp)
    573d:	dd 45 d8             	fldl   -0x28(%ebp)
    5740:	de e1                	fsubp  %st,%st(1)
    5742:	d9 ee                	fldz   
    5744:	df e9                	fucomip %st(1),%st
    5746:	7a 0a                	jp     5752 <pow+0xf2>
    5748:	d9 ee                	fldz   
    574a:	df e9                	fucomip %st(1),%st
    574c:	dd d8                	fstp   %st(0)
    574e:	74 0b                	je     575b <pow+0xfb>
    5750:	eb 02                	jmp    5754 <pow+0xf4>
    5752:	dd d8                	fstp   %st(0)
    5754:	d9 ee                	fldz   
    5756:	e9 86 00 00 00       	jmp    57e1 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    575b:	d9 ee                	fldz   
    575d:	dd 45 e0             	fldl   -0x20(%ebp)
    5760:	d9 c9                	fxch   %st(1)
    5762:	df e9                	fucomip %st(1),%st
    5764:	dd d8                	fstp   %st(0)
    5766:	76 63                	jbe    57cb <pow+0x16b>
    5768:	dd 45 d8             	fldl   -0x28(%ebp)
    576b:	d9 7d d6             	fnstcw -0x2a(%ebp)
    576e:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    5772:	b4 0c                	mov    $0xc,%ah
    5774:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    5778:	d9 6d d4             	fldcw  -0x2c(%ebp)
    577b:	db 5d d0             	fistpl -0x30(%ebp)
    577e:	d9 6d d6             	fldcw  -0x2a(%ebp)
    5781:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5784:	89 45 d0             	mov    %eax,-0x30(%ebp)
    5787:	db 45 d0             	fildl  -0x30(%ebp)
    578a:	dd 45 d8             	fldl   -0x28(%ebp)
    578d:	de e1                	fsubp  %st,%st(1)
    578f:	d9 ee                	fldz   
    5791:	df e9                	fucomip %st(1),%st
    5793:	7a 34                	jp     57c9 <pow+0x169>
    5795:	d9 ee                	fldz   
    5797:	df e9                	fucomip %st(1),%st
    5799:	dd d8                	fstp   %st(0)
    579b:	75 2e                	jne    57cb <pow+0x16b>
	{
		double powint=1;
    579d:	d9 e8                	fld1   
    579f:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    57a2:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    57a9:	eb 0d                	jmp    57b8 <pow+0x158>
    57ab:	dd 45 f0             	fldl   -0x10(%ebp)
    57ae:	dc 4d e0             	fmull  -0x20(%ebp)
    57b1:	dd 5d f0             	fstpl  -0x10(%ebp)
    57b4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    57b8:	db 45 ec             	fildl  -0x14(%ebp)
    57bb:	dd 45 d8             	fldl   -0x28(%ebp)
    57be:	df e9                	fucomip %st(1),%st
    57c0:	dd d8                	fstp   %st(0)
    57c2:	73 e7                	jae    57ab <pow+0x14b>
		return powint;
    57c4:	dd 45 f0             	fldl   -0x10(%ebp)
    57c7:	eb 18                	jmp    57e1 <pow+0x181>
    57c9:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    57cb:	dd 45 e0             	fldl   -0x20(%ebp)
    57ce:	dd 1c 24             	fstpl  (%esp)
    57d1:	e8 36 00 00 00       	call   580c <ln>
    57d6:	dc 4d d8             	fmull  -0x28(%ebp)
    57d9:	dd 1c 24             	fstpl  (%esp)
    57dc:	e8 0e 02 00 00       	call   59ef <exp>
}
    57e1:	c9                   	leave  
    57e2:	c3                   	ret    

000057e3 <sqrt>:
// 求根
double sqrt(double x)
{
    57e3:	55                   	push   %ebp
    57e4:	89 e5                	mov    %esp,%ebp
    57e6:	83 ec 28             	sub    $0x28,%esp
    57e9:	8b 45 08             	mov    0x8(%ebp),%eax
    57ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
    57ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    57f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    57f5:	dd 05 38 bf 00 00    	fldl   0xbf38
    57fb:	dd 5c 24 08          	fstpl  0x8(%esp)
    57ff:	dd 45 f0             	fldl   -0x10(%ebp)
    5802:	dd 1c 24             	fstpl  (%esp)
    5805:	e8 56 fe ff ff       	call   5660 <pow>
}
    580a:	c9                   	leave  
    580b:	c3                   	ret    

0000580c <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    580c:	55                   	push   %ebp
    580d:	89 e5                	mov    %esp,%ebp
    580f:	81 ec 88 00 00 00    	sub    $0x88,%esp
    5815:	8b 45 08             	mov    0x8(%ebp),%eax
    5818:	89 45 90             	mov    %eax,-0x70(%ebp)
    581b:	8b 45 0c             	mov    0xc(%ebp),%eax
    581e:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    5821:	dd 45 90             	fldl   -0x70(%ebp)
    5824:	d9 e8                	fld1   
    5826:	de e9                	fsubrp %st,%st(1)
    5828:	dd 5d c0             	fstpl  -0x40(%ebp)
    582b:	d9 ee                	fldz   
    582d:	dd 5d f0             	fstpl  -0x10(%ebp)
    5830:	d9 ee                	fldz   
    5832:	dd 5d b8             	fstpl  -0x48(%ebp)
    5835:	d9 ee                	fldz   
    5837:	dd 5d b0             	fstpl  -0x50(%ebp)
    583a:	d9 ee                	fldz   
    583c:	dd 5d e8             	fstpl  -0x18(%ebp)
    583f:	d9 e8                	fld1   
    5841:	dd 5d e0             	fstpl  -0x20(%ebp)
    5844:	d9 e8                	fld1   
    5846:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    5849:	dd 45 90             	fldl   -0x70(%ebp)
    584c:	d9 e8                	fld1   
    584e:	df e9                	fucomip %st(1),%st
    5850:	dd d8                	fstp   %st(0)
    5852:	7a 12                	jp     5866 <ln+0x5a>
    5854:	dd 45 90             	fldl   -0x70(%ebp)
    5857:	d9 e8                	fld1   
    5859:	df e9                	fucomip %st(1),%st
    585b:	dd d8                	fstp   %st(0)
    585d:	75 07                	jne    5866 <ln+0x5a>
    585f:	d9 ee                	fldz   
    5861:	e9 87 01 00 00       	jmp    59ed <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    5866:	dd 45 90             	fldl   -0x70(%ebp)
    5869:	dd 05 40 bf 00 00    	fldl   0xbf40
    586f:	d9 c9                	fxch   %st(1)
    5871:	df e9                	fucomip %st(1),%st
    5873:	dd d8                	fstp   %st(0)
    5875:	76 14                	jbe    588b <ln+0x7f>
    5877:	d9 e8                	fld1   
    5879:	dc 75 90             	fdivl  -0x70(%ebp)
    587c:	dd 1c 24             	fstpl  (%esp)
    587f:	e8 88 ff ff ff       	call   580c <ln>
    5884:	d9 e0                	fchs   
    5886:	e9 62 01 00 00       	jmp    59ed <ln+0x1e1>
	else if(x<.1)
    588b:	dd 05 48 bf 00 00    	fldl   0xbf48
    5891:	dd 45 90             	fldl   -0x70(%ebp)
    5894:	d9 c9                	fxch   %st(1)
    5896:	df e9                	fucomip %st(1),%st
    5898:	dd d8                	fstp   %st(0)
    589a:	76 59                	jbe    58f5 <ln+0xe9>
	{
		double n=-1;
    589c:	d9 e8                	fld1   
    589e:	d9 e0                	fchs   
    58a0:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    58a3:	dd 45 c8             	fldl   -0x38(%ebp)
    58a6:	dd 05 50 bf 00 00    	fldl   0xbf50
    58ac:	de e9                	fsubrp %st,%st(1)
    58ae:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    58b1:	dd 45 c8             	fldl   -0x38(%ebp)
    58b4:	dd 1c 24             	fstpl  (%esp)
    58b7:	e8 33 01 00 00       	call   59ef <exp>
    58bc:	dd 45 90             	fldl   -0x70(%ebp)
    58bf:	de f1                	fdivp  %st,%st(1)
    58c1:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    58c4:	dd 45 a0             	fldl   -0x60(%ebp)
    58c7:	dd 05 40 bf 00 00    	fldl   0xbf40
    58cd:	d9 c9                	fxch   %st(1)
    58cf:	df e9                	fucomip %st(1),%st
    58d1:	dd d8                	fstp   %st(0)
    58d3:	77 ce                	ja     58a3 <ln+0x97>
    58d5:	d9 e8                	fld1   
    58d7:	dd 45 a0             	fldl   -0x60(%ebp)
    58da:	d9 c9                	fxch   %st(1)
    58dc:	df e9                	fucomip %st(1),%st
    58de:	dd d8                	fstp   %st(0)
    58e0:	77 c1                	ja     58a3 <ln+0x97>
		return ln(a)+n;
    58e2:	dd 45 a0             	fldl   -0x60(%ebp)
    58e5:	dd 1c 24             	fstpl  (%esp)
    58e8:	e8 1f ff ff ff       	call   580c <ln>
    58ed:	dc 45 c8             	faddl  -0x38(%ebp)
    58f0:	e9 f8 00 00 00       	jmp    59ed <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    58f5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    58fc:	d9 e8                	fld1   
    58fe:	dd 5d d8             	fstpl  -0x28(%ebp)
    5901:	e9 b6 00 00 00       	jmp    59bc <ln+0x1b0>
	{
		ln_tmp=ln_px;
    5906:	dd 45 e8             	fldl   -0x18(%ebp)
    5909:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    590c:	dd 45 d8             	fldl   -0x28(%ebp)
    590f:	dc 4d c0             	fmull  -0x40(%ebp)
    5912:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    5915:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    5919:	75 0d                	jne    5928 <ln+0x11c>
    591b:	db 45 d4             	fildl  -0x2c(%ebp)
    591e:	dd 45 d8             	fldl   -0x28(%ebp)
    5921:	de f1                	fdivp  %st,%st(1)
    5923:	dd 5d d8             	fstpl  -0x28(%ebp)
    5926:	eb 13                	jmp    593b <ln+0x12f>
		else tmp=tmp/-l;
    5928:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    592b:	f7 d8                	neg    %eax
    592d:	89 45 8c             	mov    %eax,-0x74(%ebp)
    5930:	db 45 8c             	fildl  -0x74(%ebp)
    5933:	dd 45 d8             	fldl   -0x28(%ebp)
    5936:	de f1                	fdivp  %st,%st(1)
    5938:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    593b:	dd 45 f0             	fldl   -0x10(%ebp)
    593e:	dc 45 d8             	faddl  -0x28(%ebp)
    5941:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    5944:	dd 45 d8             	fldl   -0x28(%ebp)
    5947:	d9 e0                	fchs   
    5949:	dc 4d c0             	fmull  -0x40(%ebp)
    594c:	db 45 d4             	fildl  -0x2c(%ebp)
    594f:	de c9                	fmulp  %st,%st(1)
    5951:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5954:	83 c0 01             	add    $0x1,%eax
    5957:	89 45 8c             	mov    %eax,-0x74(%ebp)
    595a:	db 45 8c             	fildl  -0x74(%ebp)
    595d:	de f9                	fdivrp %st,%st(1)
    595f:	dc 45 f0             	faddl  -0x10(%ebp)
    5962:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    5965:	dd 45 d8             	fldl   -0x28(%ebp)
    5968:	dc 4d c0             	fmull  -0x40(%ebp)
    596b:	dc 4d c0             	fmull  -0x40(%ebp)
    596e:	db 45 d4             	fildl  -0x2c(%ebp)
    5971:	de c9                	fmulp  %st,%st(1)
    5973:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5976:	83 c0 02             	add    $0x2,%eax
    5979:	89 45 8c             	mov    %eax,-0x74(%ebp)
    597c:	db 45 8c             	fildl  -0x74(%ebp)
    597f:	de f9                	fdivrp %st,%st(1)
    5981:	dc 45 b8             	faddl  -0x48(%ebp)
    5984:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    5987:	dd 45 b0             	fldl   -0x50(%ebp)
    598a:	dc 65 b8             	fsubl  -0x48(%ebp)
    598d:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    5990:	dd 45 a8             	fldl   -0x58(%ebp)
    5993:	dc 4d a8             	fmull  -0x58(%ebp)
    5996:	dd 45 b8             	fldl   -0x48(%ebp)
    5999:	d8 c0                	fadd   %st(0),%st
    599b:	dd 45 b0             	fldl   -0x50(%ebp)
    599e:	de e1                	fsubp  %st,%st(1)
    59a0:	dc 45 f0             	faddl  -0x10(%ebp)
    59a3:	de f9                	fdivrp %st,%st(1)
    59a5:	dd 45 b0             	fldl   -0x50(%ebp)
    59a8:	de e1                	fsubp  %st,%st(1)
    59aa:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    59ad:	db 45 d4             	fildl  -0x2c(%ebp)
    59b0:	dd 45 d8             	fldl   -0x28(%ebp)
    59b3:	de c9                	fmulp  %st,%st(1)
    59b5:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    59b8:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    59bc:	dd 45 e8             	fldl   -0x18(%ebp)
    59bf:	dc 65 e0             	fsubl  -0x20(%ebp)
    59c2:	dd 05 58 bf 00 00    	fldl   0xbf58
    59c8:	d9 c9                	fxch   %st(1)
    59ca:	df e9                	fucomip %st(1),%st
    59cc:	dd d8                	fstp   %st(0)
    59ce:	0f 87 32 ff ff ff    	ja     5906 <ln+0xfa>
    59d4:	dd 45 e8             	fldl   -0x18(%ebp)
    59d7:	dc 65 e0             	fsubl  -0x20(%ebp)
    59da:	dd 05 60 bf 00 00    	fldl   0xbf60
    59e0:	df e9                	fucomip %st(1),%st
    59e2:	dd d8                	fstp   %st(0)
    59e4:	0f 87 1c ff ff ff    	ja     5906 <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    59ea:	dd 45 e8             	fldl   -0x18(%ebp)
}
    59ed:	c9                   	leave  
    59ee:	c3                   	ret    

000059ef <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    59ef:	55                   	push   %ebp
    59f0:	89 e5                	mov    %esp,%ebp
    59f2:	83 ec 78             	sub    $0x78,%esp
    59f5:	8b 45 08             	mov    0x8(%ebp),%eax
    59f8:	89 45 a0             	mov    %eax,-0x60(%ebp)
    59fb:	8b 45 0c             	mov    0xc(%ebp),%eax
    59fe:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    5a01:	dd 45 a0             	fldl   -0x60(%ebp)
    5a04:	dd 5d c0             	fstpl  -0x40(%ebp)
    5a07:	d9 ee                	fldz   
    5a09:	dd 5d f0             	fstpl  -0x10(%ebp)
    5a0c:	d9 ee                	fldz   
    5a0e:	dd 5d b8             	fstpl  -0x48(%ebp)
    5a11:	d9 ee                	fldz   
    5a13:	dd 5d b0             	fstpl  -0x50(%ebp)
    5a16:	d9 ee                	fldz   
    5a18:	dd 5d e8             	fstpl  -0x18(%ebp)
    5a1b:	d9 e8                	fld1   
    5a1d:	dd 5d e0             	fstpl  -0x20(%ebp)
    5a20:	d9 e8                	fld1   
    5a22:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    5a25:	dd 45 a0             	fldl   -0x60(%ebp)
    5a28:	d9 ee                	fldz   
    5a2a:	df e9                	fucomip %st(1),%st
    5a2c:	dd d8                	fstp   %st(0)
    5a2e:	7a 12                	jp     5a42 <exp+0x53>
    5a30:	dd 45 a0             	fldl   -0x60(%ebp)
    5a33:	d9 ee                	fldz   
    5a35:	df e9                	fucomip %st(1),%st
    5a37:	dd d8                	fstp   %st(0)
    5a39:	75 07                	jne    5a42 <exp+0x53>
    5a3b:	d9 e8                	fld1   
    5a3d:	e9 08 01 00 00       	jmp    5b4a <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    5a42:	d9 ee                	fldz   
    5a44:	dd 45 a0             	fldl   -0x60(%ebp)
    5a47:	d9 c9                	fxch   %st(1)
    5a49:	df e9                	fucomip %st(1),%st
    5a4b:	dd d8                	fstp   %st(0)
    5a4d:	76 16                	jbe    5a65 <exp+0x76>
    5a4f:	dd 45 a0             	fldl   -0x60(%ebp)
    5a52:	d9 e0                	fchs   
    5a54:	dd 1c 24             	fstpl  (%esp)
    5a57:	e8 93 ff ff ff       	call   59ef <exp>
    5a5c:	d9 e8                	fld1   
    5a5e:	de f1                	fdivp  %st,%st(1)
    5a60:	e9 e5 00 00 00       	jmp    5b4a <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    5a65:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    5a6c:	d9 e8                	fld1   
    5a6e:	dd 5d d0             	fstpl  -0x30(%ebp)
    5a71:	e9 92 00 00 00       	jmp    5b08 <exp+0x119>
	{
		ex_tmp=ex_px;
    5a76:	dd 45 e8             	fldl   -0x18(%ebp)
    5a79:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    5a7c:	dd 45 d0             	fldl   -0x30(%ebp)
    5a7f:	dc 4d c0             	fmull  -0x40(%ebp)
    5a82:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    5a85:	db 45 cc             	fildl  -0x34(%ebp)
    5a88:	dd 45 d0             	fldl   -0x30(%ebp)
    5a8b:	de f1                	fdivp  %st,%st(1)
    5a8d:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    5a90:	dd 45 f0             	fldl   -0x10(%ebp)
    5a93:	dc 45 d0             	faddl  -0x30(%ebp)
    5a96:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    5a99:	dd 45 d0             	fldl   -0x30(%ebp)
    5a9c:	dc 4d c0             	fmull  -0x40(%ebp)
    5a9f:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5aa2:	83 c0 01             	add    $0x1,%eax
    5aa5:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5aa8:	db 45 9c             	fildl  -0x64(%ebp)
    5aab:	de f9                	fdivrp %st,%st(1)
    5aad:	dc 45 f0             	faddl  -0x10(%ebp)
    5ab0:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    5ab3:	dd 45 d0             	fldl   -0x30(%ebp)
    5ab6:	dc 4d c0             	fmull  -0x40(%ebp)
    5ab9:	dc 4d c0             	fmull  -0x40(%ebp)
    5abc:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5abf:	83 c0 01             	add    $0x1,%eax
    5ac2:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5ac5:	db 45 9c             	fildl  -0x64(%ebp)
    5ac8:	de f9                	fdivrp %st,%st(1)
    5aca:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5acd:	83 c0 02             	add    $0x2,%eax
    5ad0:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5ad3:	db 45 9c             	fildl  -0x64(%ebp)
    5ad6:	de f9                	fdivrp %st,%st(1)
    5ad8:	dc 45 b8             	faddl  -0x48(%ebp)
    5adb:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    5ade:	dd 45 b0             	fldl   -0x50(%ebp)
    5ae1:	dc 65 b8             	fsubl  -0x48(%ebp)
    5ae4:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    5ae7:	dd 45 d8             	fldl   -0x28(%ebp)
    5aea:	dc 4d d8             	fmull  -0x28(%ebp)
    5aed:	dd 45 b8             	fldl   -0x48(%ebp)
    5af0:	d8 c0                	fadd   %st(0),%st
    5af2:	dd 45 b0             	fldl   -0x50(%ebp)
    5af5:	de e1                	fsubp  %st,%st(1)
    5af7:	dc 45 f0             	faddl  -0x10(%ebp)
    5afa:	de f9                	fdivrp %st,%st(1)
    5afc:	dd 45 b0             	fldl   -0x50(%ebp)
    5aff:	de e1                	fsubp  %st,%st(1)
    5b01:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    5b04:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    5b08:	dd 45 e8             	fldl   -0x18(%ebp)
    5b0b:	dc 65 e0             	fsubl  -0x20(%ebp)
    5b0e:	dd 05 68 bf 00 00    	fldl   0xbf68
    5b14:	d9 c9                	fxch   %st(1)
    5b16:	df e9                	fucomip %st(1),%st
    5b18:	dd d8                	fstp   %st(0)
    5b1a:	77 12                	ja     5b2e <exp+0x13f>
    5b1c:	dd 45 e8             	fldl   -0x18(%ebp)
    5b1f:	dc 65 e0             	fsubl  -0x20(%ebp)
    5b22:	dd 05 70 bf 00 00    	fldl   0xbf70
    5b28:	df e9                	fucomip %st(1),%st
    5b2a:	dd d8                	fstp   %st(0)
    5b2c:	76 15                	jbe    5b43 <exp+0x154>
    5b2e:	dd 45 d8             	fldl   -0x28(%ebp)
    5b31:	dd 05 68 bf 00 00    	fldl   0xbf68
    5b37:	d9 c9                	fxch   %st(1)
    5b39:	df e9                	fucomip %st(1),%st
    5b3b:	dd d8                	fstp   %st(0)
    5b3d:	0f 87 33 ff ff ff    	ja     5a76 <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    5b43:	dd 45 e8             	fldl   -0x18(%ebp)
    5b46:	d9 e8                	fld1   
    5b48:	de c1                	faddp  %st,%st(1)
    5b4a:	c9                   	leave  
    5b4b:	c3                   	ret    

00005b4c <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    5b4c:	55                   	push   %ebp
    5b4d:	89 e5                	mov    %esp,%ebp
    5b4f:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    5b52:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    5b56:	8b 45 08             	mov    0x8(%ebp),%eax
    5b59:	89 44 24 04          	mov    %eax,0x4(%esp)
    5b5d:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5b60:	89 04 24             	mov    %eax,(%esp)
    5b63:	e8 f8 f1 ff ff       	call   4d60 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    5b68:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5b6f:	00 
    5b70:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5b73:	89 04 24             	mov    %eax,(%esp)
    5b76:	e8 68 f4 ff ff       	call   4fe3 <open>
    5b7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5b7e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    5b82:	75 1b                	jne    5b9f <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    5b84:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5b87:	89 44 24 08          	mov    %eax,0x8(%esp)
    5b8b:	c7 44 24 04 a4 bf 00 	movl   $0xbfa4,0x4(%esp)
    5b92:	00 
    5b93:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5b9a:	e8 ec f5 ff ff       	call   518b <printf>
    }
    return f;
    5b9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5ba2:	c9                   	leave  
    5ba3:	c3                   	ret    

00005ba4 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    5ba4:	55                   	push   %ebp
    5ba5:	89 e5                	mov    %esp,%ebp
    5ba7:	57                   	push   %edi
    5ba8:	56                   	push   %esi
    5ba9:	53                   	push   %ebx
    5baa:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    5bad:	8b 45 08             	mov    0x8(%ebp),%eax
    5bb0:	8b 00                	mov    (%eax),%eax
    5bb2:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5bb5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5bb8:	8b 78 14             	mov    0x14(%eax),%edi
    5bbb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5bbe:	8b 70 10             	mov    0x10(%eax),%esi
    5bc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5bc4:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    5bc7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5bca:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5bcd:	85 c0                	test   %eax,%eax
    5bcf:	0f 94 c0             	sete   %al
    5bd2:	0f b6 c8             	movzbl %al,%ecx
    5bd5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5bd8:	8b 50 04             	mov    0x4(%eax),%edx
    5bdb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5bde:	8b 00                	mov    (%eax),%eax
    5be0:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    5be4:	89 74 24 18          	mov    %esi,0x18(%esp)
    5be8:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    5bec:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5bf0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5bf4:	89 44 24 08          	mov    %eax,0x8(%esp)
    5bf8:	c7 44 24 04 c4 bf 00 	movl   $0xbfc4,0x4(%esp)
    5bff:	00 
    5c00:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5c07:	e8 7f f5 ff ff       	call   518b <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    5c0c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c0f:	8b 78 2c             	mov    0x2c(%eax),%edi
    5c12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c15:	8b 70 28             	mov    0x28(%eax),%esi
    5c18:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c1b:	8b 58 24             	mov    0x24(%eax),%ebx
    5c1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c21:	8b 48 20             	mov    0x20(%eax),%ecx
    5c24:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c27:	8b 50 1c             	mov    0x1c(%eax),%edx
    5c2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c2d:	8b 40 18             	mov    0x18(%eax),%eax
    5c30:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    5c34:	89 74 24 18          	mov    %esi,0x18(%esp)
    5c38:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    5c3c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5c40:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5c44:	89 44 24 08          	mov    %eax,0x8(%esp)
    5c48:	c7 44 24 04 04 c0 00 	movl   $0xc004,0x4(%esp)
    5c4f:	00 
    5c50:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5c57:	e8 2f f5 ff ff       	call   518b <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5c5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c5f:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5c62:	8b 0c 85 a0 00 01 00 	mov    0x100a0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5c69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c6c:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5c6f:	dd 04 c5 80 00 01 00 	fldl   0x10080(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5c76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c79:	8b 40 04             	mov    0x4(%eax),%eax
    5c7c:	8d 50 ff             	lea    -0x1(%eax),%edx
    5c7f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c82:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5c85:	89 d0                	mov    %edx,%eax
    5c87:	c1 e0 04             	shl    $0x4,%eax
    5c8a:	29 d0                	sub    %edx,%eax
    5c8c:	01 d8                	add    %ebx,%eax
    5c8e:	8b 14 85 c0 ff 00 00 	mov    0xffc0(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5c95:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c98:	8b 40 04             	mov    0x4(%eax),%eax
    5c9b:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5c9e:	8b 04 85 a0 ff 00 00 	mov    0xffa0(,%eax,4),%eax
    5ca5:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    5ca9:	dd 5c 24 10          	fstpl  0x10(%esp)
    5cad:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5cb1:	89 44 24 08          	mov    %eax,0x8(%esp)
    5cb5:	c7 44 24 04 2c c0 00 	movl   $0xc02c,0x4(%esp)
    5cbc:	00 
    5cbd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5cc4:	e8 c2 f4 ff ff       	call   518b <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    5cc9:	8b 45 08             	mov    0x8(%ebp),%eax
    5ccc:	8b 48 08             	mov    0x8(%eax),%ecx
    5ccf:	8b 45 08             	mov    0x8(%ebp),%eax
    5cd2:	8b 50 0c             	mov    0xc(%eax),%edx
    5cd5:	8b 45 08             	mov    0x8(%ebp),%eax
    5cd8:	8b 40 10             	mov    0x10(%eax),%eax
    5cdb:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5cdf:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5ce3:	89 44 24 08          	mov    %eax,0x8(%esp)
    5ce7:	c7 44 24 04 5b c0 00 	movl   $0xc05b,0x4(%esp)
    5cee:	00 
    5cef:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5cf6:	e8 90 f4 ff ff       	call   518b <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    5cfb:	83 c4 3c             	add    $0x3c,%esp
    5cfe:	5b                   	pop    %ebx
    5cff:	5e                   	pop    %esi
    5d00:	5f                   	pop    %edi
    5d01:	5d                   	pop    %ebp
    5d02:	c3                   	ret    

00005d03 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    5d03:	55                   	push   %ebp
    5d04:	89 e5                	mov    %esp,%ebp
    5d06:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    5d09:	8b 45 08             	mov    0x8(%ebp),%eax
    5d0c:	89 04 24             	mov    %eax,(%esp)
    5d0f:	e8 63 f7 ff ff       	call   5477 <malloc>
    5d14:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    5d17:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5d1b:	74 1c                	je     5d39 <mem_alloc+0x36>
		memset(ptr, 0, block);
    5d1d:	8b 45 08             	mov    0x8(%ebp),%eax
    5d20:	89 44 24 08          	mov    %eax,0x8(%esp)
    5d24:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    5d2b:	00 
    5d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d2f:	89 04 24             	mov    %eax,(%esp)
    5d32:	e8 bf f0 ff ff       	call   4df6 <memset>
    5d37:	eb 20                	jmp    5d59 <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    5d39:	8b 45 0c             	mov    0xc(%ebp),%eax
    5d3c:	89 44 24 08          	mov    %eax,0x8(%esp)
    5d40:	c7 44 24 04 75 c0 00 	movl   $0xc075,0x4(%esp)
    5d47:	00 
    5d48:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5d4f:	e8 37 f4 ff ff       	call   518b <printf>
		exit();
    5d54:	e8 4a f2 ff ff       	call   4fa3 <exit>
	}
	return ptr;
    5d59:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5d5c:	c9                   	leave  
    5d5d:	c3                   	ret    

00005d5e <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    5d5e:	55                   	push   %ebp
    5d5f:	89 e5                	mov    %esp,%ebp
    5d61:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    5d64:	8b 45 0c             	mov    0xc(%ebp),%eax
    5d67:	c7 44 24 04 8c c0 00 	movl   $0xc08c,0x4(%esp)
    5d6e:	00 
    5d6f:	89 04 24             	mov    %eax,(%esp)
    5d72:	e8 8c ff ff ff       	call   5d03 <mem_alloc>
    5d77:	8b 55 08             	mov    0x8(%ebp),%edx
    5d7a:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    5d7d:	8b 45 08             	mov    0x8(%ebp),%eax
    5d80:	8b 55 0c             	mov    0xc(%ebp),%edx
    5d83:	89 50 08             	mov    %edx,0x8(%eax)
}
    5d86:	c9                   	leave  
    5d87:	c3                   	ret    

00005d88 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    5d88:	55                   	push   %ebp
    5d89:	89 e5                	mov    %esp,%ebp
    5d8b:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    5d8e:	8b 45 08             	mov    0x8(%ebp),%eax
    5d91:	8b 40 04             	mov    0x4(%eax),%eax
    5d94:	89 04 24             	mov    %eax,(%esp)
    5d97:	e8 a2 f5 ff ff       	call   533e <free>
}
    5d9c:	c9                   	leave  
    5d9d:	c3                   	ret    

00005d9e <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    5d9e:	55                   	push   %ebp
    5d9f:	89 e5                	mov    %esp,%ebp
    5da1:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    5da4:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5dab:	00 
    5dac:	8b 45 0c             	mov    0xc(%ebp),%eax
    5daf:	89 04 24             	mov    %eax,(%esp)
    5db2:	e8 2c f2 ff ff       	call   4fe3 <open>
    5db7:	8b 55 08             	mov    0x8(%ebp),%edx
    5dba:	89 02                	mov    %eax,(%edx)
    5dbc:	8b 45 08             	mov    0x8(%ebp),%eax
    5dbf:	8b 00                	mov    (%eax),%eax
    5dc1:	83 f8 ff             	cmp    $0xffffffff,%eax
    5dc4:	75 20                	jne    5de6 <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    5dc6:	8b 45 0c             	mov    0xc(%ebp),%eax
    5dc9:	89 44 24 08          	mov    %eax,0x8(%esp)
    5dcd:	c7 44 24 04 93 c0 00 	movl   $0xc093,0x4(%esp)
    5dd4:	00 
    5dd5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5ddc:	e8 aa f3 ff ff       	call   518b <printf>
		exit();
    5de1:	e8 bd f1 ff ff       	call   4fa3 <exit>
	}

	bs->format = BINARY;
    5de6:	8b 45 08             	mov    0x8(%ebp),%eax
    5de9:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    5ded:	8b 45 10             	mov    0x10(%ebp),%eax
    5df0:	89 44 24 04          	mov    %eax,0x4(%esp)
    5df4:	8b 45 08             	mov    0x8(%ebp),%eax
    5df7:	89 04 24             	mov    %eax,(%esp)
    5dfa:	e8 5f ff ff ff       	call   5d5e <alloc_buffer>
	bs->buf_byte_idx=0;
    5dff:	8b 45 08             	mov    0x8(%ebp),%eax
    5e02:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    5e09:	8b 45 08             	mov    0x8(%ebp),%eax
    5e0c:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    5e13:	8b 45 08             	mov    0x8(%ebp),%eax
    5e16:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    5e1d:	8b 45 08             	mov    0x8(%ebp),%eax
    5e20:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    5e27:	8b 45 08             	mov    0x8(%ebp),%eax
    5e2a:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    5e31:	8b 45 08             	mov    0x8(%ebp),%eax
    5e34:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    5e3b:	c9                   	leave  
    5e3c:	c3                   	ret    

00005e3d <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    5e3d:	55                   	push   %ebp
    5e3e:	89 e5                	mov    %esp,%ebp
    5e40:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    5e43:	8b 45 08             	mov    0x8(%ebp),%eax
    5e46:	8b 00                	mov    (%eax),%eax
    5e48:	89 04 24             	mov    %eax,(%esp)
    5e4b:	e8 7b f1 ff ff       	call   4fcb <close>
	desalloc_buffer(bs);
    5e50:	8b 45 08             	mov    0x8(%ebp),%eax
    5e53:	89 04 24             	mov    %eax,(%esp)
    5e56:	e8 2d ff ff ff       	call   5d88 <desalloc_buffer>
}
    5e5b:	c9                   	leave  
    5e5c:	c3                   	ret    

00005e5d <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    5e5d:	55                   	push   %ebp
    5e5e:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    5e60:	8b 45 08             	mov    0x8(%ebp),%eax
    5e63:	8b 40 20             	mov    0x20(%eax),%eax
}
    5e66:	5d                   	pop    %ebp
    5e67:	c3                   	ret    

00005e68 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    5e68:	55                   	push   %ebp
    5e69:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    5e6b:	8b 45 08             	mov    0x8(%ebp),%eax
    5e6e:	8b 40 0c             	mov    0xc(%eax),%eax
}
    5e71:	5d                   	pop    %ebp
    5e72:	c3                   	ret    

00005e73 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    5e73:	55                   	push   %ebp
    5e74:	89 e5                	mov    %esp,%ebp
    5e76:	56                   	push   %esi
    5e77:	53                   	push   %ebx
    5e78:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    5e7b:	8b 45 08             	mov    0x8(%ebp),%eax
    5e7e:	8b 40 08             	mov    0x8(%eax),%eax
    5e81:	8d 50 fe             	lea    -0x2(%eax),%edx
    5e84:	8b 45 08             	mov    0x8(%ebp),%eax
    5e87:	8b 40 10             	mov    0x10(%eax),%eax
    5e8a:	89 d3                	mov    %edx,%ebx
    5e8c:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    5e8e:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    5e93:	eb 35                	jmp    5eca <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    5e95:	8b 45 08             	mov    0x8(%ebp),%eax
    5e98:	8b 50 04             	mov    0x4(%eax),%edx
    5e9b:	89 d8                	mov    %ebx,%eax
    5e9d:	8d 58 ff             	lea    -0x1(%eax),%ebx
    5ea0:	01 c2                	add    %eax,%edx
    5ea2:	8b 45 08             	mov    0x8(%ebp),%eax
    5ea5:	8b 00                	mov    (%eax),%eax
    5ea7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5eae:	00 
    5eaf:	89 54 24 04          	mov    %edx,0x4(%esp)
    5eb3:	89 04 24             	mov    %eax,(%esp)
    5eb6:	e8 00 f1 ff ff       	call   4fbb <read>
    5ebb:	89 c6                	mov    %eax,%esi
		if (!n)
    5ebd:	85 f6                	test   %esi,%esi
    5ebf:	75 09                	jne    5eca <refill_buffer+0x57>
		bs->eob= i+1;
    5ec1:	8d 53 01             	lea    0x1(%ebx),%edx
    5ec4:	8b 45 08             	mov    0x8(%ebp),%eax
    5ec7:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    5eca:	85 db                	test   %ebx,%ebx
    5ecc:	78 0a                	js     5ed8 <refill_buffer+0x65>
    5ece:	8b 45 08             	mov    0x8(%ebp),%eax
    5ed1:	8b 40 1c             	mov    0x1c(%eax),%eax
    5ed4:	85 c0                	test   %eax,%eax
    5ed6:	74 bd                	je     5e95 <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    5ed8:	83 c4 10             	add    $0x10,%esp
    5edb:	5b                   	pop    %ebx
    5edc:	5e                   	pop    %esi
    5edd:	5d                   	pop    %ebp
    5ede:	c3                   	ret    

00005edf <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    5edf:	55                   	push   %ebp
    5ee0:	89 e5                	mov    %esp,%ebp
    5ee2:	53                   	push   %ebx
    5ee3:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    5ee6:	8b 45 08             	mov    0x8(%ebp),%eax
    5ee9:	8b 40 0c             	mov    0xc(%eax),%eax
    5eec:	8d 50 01             	lea    0x1(%eax),%edx
    5eef:	8b 45 08             	mov    0x8(%ebp),%eax
    5ef2:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    5ef5:	8b 45 08             	mov    0x8(%ebp),%eax
    5ef8:	8b 40 14             	mov    0x14(%eax),%eax
    5efb:	85 c0                	test   %eax,%eax
    5efd:	0f 85 9f 00 00 00    	jne    5fa2 <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    5f03:	8b 45 08             	mov    0x8(%ebp),%eax
    5f06:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    5f0d:	8b 45 08             	mov    0x8(%ebp),%eax
    5f10:	8b 40 10             	mov    0x10(%eax),%eax
    5f13:	8d 50 ff             	lea    -0x1(%eax),%edx
    5f16:	8b 45 08             	mov    0x8(%ebp),%eax
    5f19:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    5f1c:	8b 45 08             	mov    0x8(%ebp),%eax
    5f1f:	8b 40 10             	mov    0x10(%eax),%eax
    5f22:	83 f8 03             	cmp    $0x3,%eax
    5f25:	7e 10                	jle    5f37 <get1bit+0x58>
    5f27:	8b 45 08             	mov    0x8(%ebp),%eax
    5f2a:	8b 50 10             	mov    0x10(%eax),%edx
    5f2d:	8b 45 08             	mov    0x8(%ebp),%eax
    5f30:	8b 40 1c             	mov    0x1c(%eax),%eax
    5f33:	39 c2                	cmp    %eax,%edx
    5f35:	7d 6b                	jge    5fa2 <get1bit+0xc3>
             if (bs->eob)
    5f37:	8b 45 08             	mov    0x8(%ebp),%eax
    5f3a:	8b 40 1c             	mov    0x1c(%eax),%eax
    5f3d:	85 c0                	test   %eax,%eax
    5f3f:	74 0c                	je     5f4d <get1bit+0x6e>
                bs->eobs = TRUE;
    5f41:	8b 45 08             	mov    0x8(%ebp),%eax
    5f44:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5f4b:	eb 55                	jmp    5fa2 <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5f4d:	8b 45 08             	mov    0x8(%ebp),%eax
    5f50:	8b 58 10             	mov    0x10(%eax),%ebx
    5f53:	eb 2f                	jmp    5f84 <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5f55:	8b 45 08             	mov    0x8(%ebp),%eax
    5f58:	8b 50 04             	mov    0x4(%eax),%edx
    5f5b:	8b 45 08             	mov    0x8(%ebp),%eax
    5f5e:	8b 40 08             	mov    0x8(%eax),%eax
    5f61:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5f64:	8b 45 08             	mov    0x8(%ebp),%eax
    5f67:	8b 40 10             	mov    0x10(%eax),%eax
    5f6a:	29 c1                	sub    %eax,%ecx
    5f6c:	89 c8                	mov    %ecx,%eax
    5f6e:	01 d8                	add    %ebx,%eax
    5f70:	01 c2                	add    %eax,%edx
    5f72:	8b 45 08             	mov    0x8(%ebp),%eax
    5f75:	8b 48 04             	mov    0x4(%eax),%ecx
    5f78:	89 d8                	mov    %ebx,%eax
    5f7a:	01 c8                	add    %ecx,%eax
    5f7c:	0f b6 00             	movzbl (%eax),%eax
    5f7f:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5f81:	83 eb 01             	sub    $0x1,%ebx
    5f84:	85 db                	test   %ebx,%ebx
    5f86:	79 cd                	jns    5f55 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    5f88:	8b 45 08             	mov    0x8(%ebp),%eax
    5f8b:	89 04 24             	mov    %eax,(%esp)
    5f8e:	e8 e0 fe ff ff       	call   5e73 <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    5f93:	8b 45 08             	mov    0x8(%ebp),%eax
    5f96:	8b 40 08             	mov    0x8(%eax),%eax
    5f99:	8d 50 ff             	lea    -0x1(%eax),%edx
    5f9c:	8b 45 08             	mov    0x8(%ebp),%eax
    5f9f:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    5fa2:	8b 45 08             	mov    0x8(%ebp),%eax
    5fa5:	8b 50 04             	mov    0x4(%eax),%edx
    5fa8:	8b 45 08             	mov    0x8(%ebp),%eax
    5fab:	8b 40 10             	mov    0x10(%eax),%eax
    5fae:	01 d0                	add    %edx,%eax
    5fb0:	0f b6 00             	movzbl (%eax),%eax
    5fb3:	0f b6 d0             	movzbl %al,%edx
    5fb6:	8b 45 08             	mov    0x8(%ebp),%eax
    5fb9:	8b 40 14             	mov    0x14(%eax),%eax
    5fbc:	83 e8 01             	sub    $0x1,%eax
    5fbf:	8b 04 85 c0 00 01 00 	mov    0x100c0(,%eax,4),%eax
    5fc6:	21 d0                	and    %edx,%eax
    5fc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    5fcb:	8b 45 08             	mov    0x8(%ebp),%eax
    5fce:	8b 40 14             	mov    0x14(%eax),%eax
    5fd1:	83 e8 01             	sub    $0x1,%eax
    5fd4:	89 c1                	mov    %eax,%ecx
    5fd6:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    5fd9:	8b 45 08             	mov    0x8(%ebp),%eax
    5fdc:	8b 40 14             	mov    0x14(%eax),%eax
    5fdf:	8d 50 ff             	lea    -0x1(%eax),%edx
    5fe2:	8b 45 08             	mov    0x8(%ebp),%eax
    5fe5:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    5fe8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5feb:	83 c4 24             	add    $0x24,%esp
    5fee:	5b                   	pop    %ebx
    5fef:	5d                   	pop    %ebp
    5ff0:	c3                   	ret    

00005ff1 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    5ff1:	55                   	push   %ebp
    5ff2:	89 e5                	mov    %esp,%ebp
    5ff4:	57                   	push   %edi
    5ff5:	56                   	push   %esi
    5ff6:	53                   	push   %ebx
    5ff7:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    5ffa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    6001:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    6004:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    6008:	7e 1c                	jle    6026 <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    600a:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    6011:	00 
    6012:	c7 44 24 04 ac c0 00 	movl   $0xc0ac,0x4(%esp)
    6019:	00 
    601a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6021:	e8 65 f1 ff ff       	call   518b <printf>

	bs->totbit += N;
    6026:	8b 45 08             	mov    0x8(%ebp),%eax
    6029:	8b 50 0c             	mov    0xc(%eax),%edx
    602c:	8b 45 0c             	mov    0xc(%ebp),%eax
    602f:	01 c2                	add    %eax,%edx
    6031:	8b 45 08             	mov    0x8(%ebp),%eax
    6034:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    6037:	e9 0a 01 00 00       	jmp    6146 <getbits+0x155>
		if (!bs->buf_bit_idx) {
    603c:	8b 45 08             	mov    0x8(%ebp),%eax
    603f:	8b 40 14             	mov    0x14(%eax),%eax
    6042:	85 c0                	test   %eax,%eax
    6044:	0f 85 9f 00 00 00    	jne    60e9 <getbits+0xf8>
			bs->buf_bit_idx = 8;
    604a:	8b 45 08             	mov    0x8(%ebp),%eax
    604d:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    6054:	8b 45 08             	mov    0x8(%ebp),%eax
    6057:	8b 40 10             	mov    0x10(%eax),%eax
    605a:	8d 50 ff             	lea    -0x1(%eax),%edx
    605d:	8b 45 08             	mov    0x8(%ebp),%eax
    6060:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    6063:	8b 45 08             	mov    0x8(%ebp),%eax
    6066:	8b 40 10             	mov    0x10(%eax),%eax
    6069:	83 f8 03             	cmp    $0x3,%eax
    606c:	7e 10                	jle    607e <getbits+0x8d>
    606e:	8b 45 08             	mov    0x8(%ebp),%eax
    6071:	8b 50 10             	mov    0x10(%eax),%edx
    6074:	8b 45 08             	mov    0x8(%ebp),%eax
    6077:	8b 40 1c             	mov    0x1c(%eax),%eax
    607a:	39 c2                	cmp    %eax,%edx
    607c:	7d 6b                	jge    60e9 <getbits+0xf8>
				if (bs->eob)
    607e:	8b 45 08             	mov    0x8(%ebp),%eax
    6081:	8b 40 1c             	mov    0x1c(%eax),%eax
    6084:	85 c0                	test   %eax,%eax
    6086:	74 0c                	je     6094 <getbits+0xa3>
					bs->eobs = TRUE;
    6088:	8b 45 08             	mov    0x8(%ebp),%eax
    608b:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    6092:	eb 55                	jmp    60e9 <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    6094:	8b 45 08             	mov    0x8(%ebp),%eax
    6097:	8b 70 10             	mov    0x10(%eax),%esi
    609a:	eb 2f                	jmp    60cb <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    609c:	8b 45 08             	mov    0x8(%ebp),%eax
    609f:	8b 50 04             	mov    0x4(%eax),%edx
    60a2:	8b 45 08             	mov    0x8(%ebp),%eax
    60a5:	8b 40 08             	mov    0x8(%eax),%eax
    60a8:	8d 48 ff             	lea    -0x1(%eax),%ecx
    60ab:	8b 45 08             	mov    0x8(%ebp),%eax
    60ae:	8b 40 10             	mov    0x10(%eax),%eax
    60b1:	29 c1                	sub    %eax,%ecx
    60b3:	89 c8                	mov    %ecx,%eax
    60b5:	01 f0                	add    %esi,%eax
    60b7:	01 c2                	add    %eax,%edx
    60b9:	8b 45 08             	mov    0x8(%ebp),%eax
    60bc:	8b 48 04             	mov    0x4(%eax),%ecx
    60bf:	89 f0                	mov    %esi,%eax
    60c1:	01 c8                	add    %ecx,%eax
    60c3:	0f b6 00             	movzbl (%eax),%eax
    60c6:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    60c8:	83 ee 01             	sub    $0x1,%esi
    60cb:	85 f6                	test   %esi,%esi
    60cd:	79 cd                	jns    609c <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    60cf:	8b 45 08             	mov    0x8(%ebp),%eax
    60d2:	89 04 24             	mov    %eax,(%esp)
    60d5:	e8 99 fd ff ff       	call   5e73 <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    60da:	8b 45 08             	mov    0x8(%ebp),%eax
    60dd:	8b 40 08             	mov    0x8(%eax),%eax
    60e0:	8d 50 ff             	lea    -0x1(%eax),%edx
    60e3:	8b 45 08             	mov    0x8(%ebp),%eax
    60e6:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    60e9:	8b 45 08             	mov    0x8(%ebp),%eax
    60ec:	8b 40 14             	mov    0x14(%eax),%eax
    60ef:	39 d8                	cmp    %ebx,%eax
    60f1:	0f 4f c3             	cmovg  %ebx,%eax
    60f4:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    60f6:	8b 45 08             	mov    0x8(%ebp),%eax
    60f9:	8b 50 04             	mov    0x4(%eax),%edx
    60fc:	8b 45 08             	mov    0x8(%ebp),%eax
    60ff:	8b 40 10             	mov    0x10(%eax),%eax
    6102:	01 d0                	add    %edx,%eax
    6104:	0f b6 00             	movzbl (%eax),%eax
    6107:	0f b6 d0             	movzbl %al,%edx
    610a:	8b 45 08             	mov    0x8(%ebp),%eax
    610d:	8b 40 14             	mov    0x14(%eax),%eax
    6110:	8b 04 85 e0 00 01 00 	mov    0x100e0(,%eax,4),%eax
    6117:	89 d7                	mov    %edx,%edi
    6119:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    611b:	8b 45 08             	mov    0x8(%ebp),%eax
    611e:	8b 40 14             	mov    0x14(%eax),%eax
    6121:	29 f0                	sub    %esi,%eax
    6123:	89 c1                	mov    %eax,%ecx
    6125:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    6127:	89 d8                	mov    %ebx,%eax
    6129:	29 f0                	sub    %esi,%eax
    612b:	89 c1                	mov    %eax,%ecx
    612d:	d3 e7                	shl    %cl,%edi
    612f:	89 f8                	mov    %edi,%eax
    6131:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    6134:	8b 45 08             	mov    0x8(%ebp),%eax
    6137:	8b 40 14             	mov    0x14(%eax),%eax
    613a:	29 f0                	sub    %esi,%eax
    613c:	89 c2                	mov    %eax,%edx
    613e:	8b 45 08             	mov    0x8(%ebp),%eax
    6141:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    6144:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    6146:	85 db                	test   %ebx,%ebx
    6148:	0f 8f ee fe ff ff    	jg     603c <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    614e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    6151:	83 c4 2c             	add    $0x2c,%esp
    6154:	5b                   	pop    %ebx
    6155:	5e                   	pop    %esi
    6156:	5f                   	pop    %edi
    6157:	5d                   	pop    %ebp
    6158:	c3                   	ret    

00006159 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    6159:	55                   	push   %ebp
    615a:	89 e5                	mov    %esp,%ebp
    615c:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    615f:	db 45 10             	fildl  0x10(%ebp)
    6162:	dd 5c 24 08          	fstpl  0x8(%esp)
    6166:	dd 05 18 c1 00 00    	fldl   0xc118
    616c:	dd 1c 24             	fstpl  (%esp)
    616f:	e8 ec f4 ff ff       	call   5660 <pow>
    6174:	d9 7d e6             	fnstcw -0x1a(%ebp)
    6177:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    617b:	b4 0c                	mov    $0xc,%ah
    617d:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    6181:	d9 6d e4             	fldcw  -0x1c(%ebp)
    6184:	db 5d e0             	fistpl -0x20(%ebp)
    6187:	d9 6d e6             	fldcw  -0x1a(%ebp)
    618a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    618d:	83 e8 01             	sub    $0x1,%eax
    6190:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    6193:	8b 45 08             	mov    0x8(%ebp),%eax
    6196:	89 04 24             	mov    %eax,(%esp)
    6199:	e8 ca fc ff ff       	call   5e68 <sstell>
    619e:	83 e0 07             	and    $0x7,%eax
    61a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    61a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    61a8:	74 17                	je     61c1 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    61aa:	b8 08 00 00 00       	mov    $0x8,%eax
    61af:	2b 45 ec             	sub    -0x14(%ebp),%eax
    61b2:	89 44 24 04          	mov    %eax,0x4(%esp)
    61b6:	8b 45 08             	mov    0x8(%ebp),%eax
    61b9:	89 04 24             	mov    %eax,(%esp)
    61bc:	e8 30 fe ff ff       	call   5ff1 <getbits>

	val = getbits(bs, N);
    61c1:	8b 45 10             	mov    0x10(%ebp),%eax
    61c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    61c8:	8b 45 08             	mov    0x8(%ebp),%eax
    61cb:	89 04 24             	mov    %eax,(%esp)
    61ce:	e8 1e fe ff ff       	call   5ff1 <getbits>
    61d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    61d6:	eb 1a                	jmp    61f2 <seek_sync+0x99>
		val <<= ALIGNING;
    61d8:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    61dc:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    61e3:	00 
    61e4:	8b 45 08             	mov    0x8(%ebp),%eax
    61e7:	89 04 24             	mov    %eax,(%esp)
    61ea:	e8 02 fe ff ff       	call   5ff1 <getbits>
    61ef:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    61f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    61f5:	23 45 f4             	and    -0xc(%ebp),%eax
    61f8:	3b 45 0c             	cmp    0xc(%ebp),%eax
    61fb:	74 0f                	je     620c <seek_sync+0xb3>
    61fd:	8b 45 08             	mov    0x8(%ebp),%eax
    6200:	89 04 24             	mov    %eax,(%esp)
    6203:	e8 55 fc ff ff       	call   5e5d <end_bs>
    6208:	85 c0                	test   %eax,%eax
    620a:	74 cc                	je     61d8 <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    620c:	8b 45 08             	mov    0x8(%ebp),%eax
    620f:	89 04 24             	mov    %eax,(%esp)
    6212:	e8 46 fc ff ff       	call   5e5d <end_bs>
    6217:	85 c0                	test   %eax,%eax
    6219:	74 07                	je     6222 <seek_sync+0xc9>
		return(0);
    621b:	b8 00 00 00 00       	mov    $0x0,%eax
    6220:	eb 05                	jmp    6227 <seek_sync+0xce>
	else
		return(1);
    6222:	b8 01 00 00 00       	mov    $0x1,%eax
}
    6227:	c9                   	leave  
    6228:	c3                   	ret    

00006229 <js_bound>:

int js_bound(int lay, int m_ext)
{
    6229:	55                   	push   %ebp
    622a:	89 e5                	mov    %esp,%ebp
    622c:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    622f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    6233:	7e 12                	jle    6247 <js_bound+0x1e>
    6235:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    6239:	7f 0c                	jg     6247 <js_bound+0x1e>
    623b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    623f:	78 06                	js     6247 <js_bound+0x1e>
    6241:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    6245:	7e 27                	jle    626e <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    6247:	8b 45 0c             	mov    0xc(%ebp),%eax
    624a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    624e:	8b 45 08             	mov    0x8(%ebp),%eax
    6251:	89 44 24 08          	mov    %eax,0x8(%esp)
    6255:	c7 44 24 04 e0 c0 00 	movl   $0xc0e0,0x4(%esp)
    625c:	00 
    625d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6264:	e8 22 ef ff ff       	call   518b <printf>
        exit();
    6269:	e8 35 ed ff ff       	call   4fa3 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    626e:	8b 45 08             	mov    0x8(%ebp),%eax
    6271:	83 e8 01             	sub    $0x1,%eax
    6274:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    627b:	8b 45 0c             	mov    0xc(%ebp),%eax
    627e:	01 d0                	add    %edx,%eax
    6280:	8b 04 85 20 01 01 00 	mov    0x10120(,%eax,4),%eax
}
    6287:	c9                   	leave  
    6288:	c3                   	ret    

00006289 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    6289:	55                   	push   %ebp
    628a:	89 e5                	mov    %esp,%ebp
    628c:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    628f:	8b 45 08             	mov    0x8(%ebp),%eax
    6292:	8b 00                	mov    (%eax),%eax
    6294:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    6297:	8b 45 f4             	mov    -0xc(%ebp),%eax
    629a:	8b 50 1c             	mov    0x1c(%eax),%edx
    629d:	8b 45 08             	mov    0x8(%ebp),%eax
    62a0:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    62a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    62a6:	8b 40 1c             	mov    0x1c(%eax),%eax
    62a9:	83 f8 03             	cmp    $0x3,%eax
    62ac:	75 07                	jne    62b5 <hdr_to_frps+0x2c>
    62ae:	b8 01 00 00 00       	mov    $0x1,%eax
    62b3:	eb 05                	jmp    62ba <hdr_to_frps+0x31>
    62b5:	b8 02 00 00 00       	mov    $0x2,%eax
    62ba:	8b 55 08             	mov    0x8(%ebp),%edx
    62bd:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    62c0:	8b 45 08             	mov    0x8(%ebp),%eax
    62c3:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    62ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    62cd:	8b 40 1c             	mov    0x1c(%eax),%eax
    62d0:	83 f8 01             	cmp    $0x1,%eax
    62d3:	75 20                	jne    62f5 <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    62d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    62d8:	8b 50 20             	mov    0x20(%eax),%edx
    62db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    62de:	8b 40 04             	mov    0x4(%eax),%eax
    62e1:	89 54 24 04          	mov    %edx,0x4(%esp)
    62e5:	89 04 24             	mov    %eax,(%esp)
    62e8:	e8 3c ff ff ff       	call   6229 <js_bound>
    62ed:	8b 55 08             	mov    0x8(%ebp),%edx
    62f0:	89 42 0c             	mov    %eax,0xc(%edx)
    62f3:	eb 0c                	jmp    6301 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    62f5:	8b 45 08             	mov    0x8(%ebp),%eax
    62f8:	8b 50 10             	mov    0x10(%eax),%edx
    62fb:	8b 45 08             	mov    0x8(%ebp),%eax
    62fe:	89 50 0c             	mov    %edx,0xc(%eax)
}
    6301:	c9                   	leave  
    6302:	c3                   	ret    

00006303 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    6303:	55                   	push   %ebp
    6304:	89 e5                	mov    %esp,%ebp
    6306:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    6309:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    630d:	74 19                	je     6328 <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    630f:	c7 44 24 04 03 c1 00 	movl   $0xc103,0x4(%esp)
    6316:	00 
    6317:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    631e:	e8 68 ee ff ff       	call   518b <printf>
		exit();
    6323:	e8 7b ec ff ff       	call   4fa3 <exit>
	}
	getCoreBuf(1, val);
    6328:	8b 45 08             	mov    0x8(%ebp),%eax
    632b:	89 44 24 04          	mov    %eax,0x4(%esp)
    632f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    6336:	e8 68 ed ff ff       	call   50a3 <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    633b:	c9                   	leave  
    633c:	c3                   	ret    

0000633d <hsstell>:

unsigned long hsstell()
{
    633d:	55                   	push   %ebp
    633e:	89 e5                	mov    %esp,%ebp
    6340:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    6343:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    634a:	00 
    634b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    6352:	e8 4c ed ff ff       	call   50a3 <getCoreBuf>
//	return(totbit);
}
    6357:	c9                   	leave  
    6358:	c3                   	ret    

00006359 <hgetbits>:

unsigned long hgetbits(int N)
{
    6359:	55                   	push   %ebp
    635a:	89 e5                	mov    %esp,%ebp
    635c:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    635f:	8b 45 08             	mov    0x8(%ebp),%eax
    6362:	89 44 24 04          	mov    %eax,0x4(%esp)
    6366:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    636d:	e8 31 ed ff ff       	call   50a3 <getCoreBuf>
}
    6372:	c9                   	leave  
    6373:	c3                   	ret    

00006374 <hget1bit>:


unsigned int hget1bit()
{
    6374:	55                   	push   %ebp
    6375:	89 e5                	mov    %esp,%ebp
    6377:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    637a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    6381:	e8 d3 ff ff ff       	call   6359 <hgetbits>
}
    6386:	c9                   	leave  
    6387:	c3                   	ret    

00006388 <rewindNbits>:


void rewindNbits(int N)
{
    6388:	55                   	push   %ebp
    6389:	89 e5                	mov    %esp,%ebp
    638b:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    638e:	8b 45 08             	mov    0x8(%ebp),%eax
    6391:	89 44 24 04          	mov    %eax,0x4(%esp)
    6395:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    639c:	e8 02 ed ff ff       	call   50a3 <getCoreBuf>
}
    63a1:	c9                   	leave  
    63a2:	c3                   	ret    

000063a3 <rewindNbytes>:


void rewindNbytes(int N)
{
    63a3:	55                   	push   %ebp
    63a4:	89 e5                	mov    %esp,%ebp
    63a6:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    63a9:	8b 45 08             	mov    0x8(%ebp),%eax
    63ac:	89 44 24 04          	mov    %eax,0x4(%esp)
    63b0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    63b7:	e8 e7 ec ff ff       	call   50a3 <getCoreBuf>
}
    63bc:	c9                   	leave  
    63bd:	c3                   	ret    

000063be <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    63be:	55                   	push   %ebp
    63bf:	89 e5                	mov    %esp,%ebp
    63c1:	57                   	push   %edi
    63c2:	56                   	push   %esi
    63c3:	53                   	push   %ebx
    63c4:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    63ca:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    63ce:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    63d2:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    63d6:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    63da:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    63de:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    63e2:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    63e6:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    63ea:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    63ee:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    63f2:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    63f6:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    63fa:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    63fe:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    6402:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    6406:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    640a:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    640e:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    6412:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    6416:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    641a:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    641e:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    6422:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    6426:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    642a:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    642e:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    6432:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    6436:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    643a:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    643e:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    6442:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    6446:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    644a:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    644e:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    6452:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    6456:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    645a:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    645e:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    6462:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    6466:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    646a:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    646e:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    6472:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    6476:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    647a:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    647e:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    6482:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    6486:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    648a:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    648e:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    6492:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    6496:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    649a:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    649e:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    64a2:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    64a6:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    64aa:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    64ae:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    64b2:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    64b6:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    64ba:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    64be:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    64c2:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    64c6:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    64ca:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    64ce:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    64d2:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    64d6:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    64da:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    64de:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    64e2:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    64e6:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    64ea:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    64ee:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    64f2:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    64f6:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    64fa:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    64fe:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    6502:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    6506:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    650a:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    650e:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    6512:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    6519:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    6520:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    6527:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    652e:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    6535:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    653c:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    6543:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    654a:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    6551:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    6558:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    655f:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    6566:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    656d:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    6574:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    657b:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    6582:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    6589:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    6590:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    6597:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    659e:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    65a5:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    65ac:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    65b3:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    65ba:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    65c1:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    65c8:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    65cf:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    65d6:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    65da:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    65de:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    65e2:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    65e6:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    65ea:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    65ee:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    65f2:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    65f6:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    65fa:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    65fe:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    6602:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    6606:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    660a:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    660e:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    6612:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    6616:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    661a:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    661e:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    6622:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    6626:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    662a:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    662e:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    6632:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    6636:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    663a:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    663e:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    6642:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    6646:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    664a:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    664e:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    6652:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    6656:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    665a:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    665e:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    6665:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    666c:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    6673:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    667a:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    6681:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    6688:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    668f:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    6696:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    669d:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    66a4:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    66ab:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    66b2:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    66b9:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    66c0:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    66c7:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    66ce:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    66d5:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    66dc:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    66e3:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    66ea:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    66f1:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    66f8:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    66ff:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    6706:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    670d:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    6714:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    671b:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    6722:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    6729:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    6730:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    6737:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    673e:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    6745:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    674c:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    6753:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    675a:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    6761:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    6768:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    676f:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    6776:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    677d:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    6784:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    678b:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    6792:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    6799:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    67a0:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    67a7:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    67ae:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    67b5:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    67bc:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    67c3:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    67ca:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    67d1:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    67d8:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    67df:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    67e6:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    67ed:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    67f4:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    67fb:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    6802:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    6809:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    6810:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    6816:	b8 20 c1 00 00       	mov    $0xc120,%eax
    681b:	b9 23 00 00 00       	mov    $0x23,%ecx
    6820:	89 d7                	mov    %edx,%edi
    6822:	89 c6                	mov    %eax,%esi
    6824:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6826:	89 f0                	mov    %esi,%eax
    6828:	89 fa                	mov    %edi,%edx
    682a:	0f b7 08             	movzwl (%eax),%ecx
    682d:	66 89 0a             	mov    %cx,(%edx)
    6830:	83 c2 02             	add    $0x2,%edx
    6833:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    6836:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    683c:	ba c0 c1 00 00       	mov    $0xc1c0,%edx
    6841:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    6846:	89 c1                	mov    %eax,%ecx
    6848:	83 e1 02             	and    $0x2,%ecx
    684b:	85 c9                	test   %ecx,%ecx
    684d:	74 0f                	je     685e <read_decoder_table+0x4a0>
    684f:	0f b7 0a             	movzwl (%edx),%ecx
    6852:	66 89 08             	mov    %cx,(%eax)
    6855:	83 c0 02             	add    $0x2,%eax
    6858:	83 c2 02             	add    $0x2,%edx
    685b:	83 eb 02             	sub    $0x2,%ebx
    685e:	89 d9                	mov    %ebx,%ecx
    6860:	c1 e9 02             	shr    $0x2,%ecx
    6863:	89 c7                	mov    %eax,%edi
    6865:	89 d6                	mov    %edx,%esi
    6867:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6869:	89 f2                	mov    %esi,%edx
    686b:	89 f8                	mov    %edi,%eax
    686d:	b9 00 00 00 00       	mov    $0x0,%ecx
    6872:	89 de                	mov    %ebx,%esi
    6874:	83 e6 02             	and    $0x2,%esi
    6877:	85 f6                	test   %esi,%esi
    6879:	74 0b                	je     6886 <read_decoder_table+0x4c8>
    687b:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    687f:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6883:	83 c1 02             	add    $0x2,%ecx
    6886:	83 e3 01             	and    $0x1,%ebx
    6889:	85 db                	test   %ebx,%ebx
    688b:	74 07                	je     6894 <read_decoder_table+0x4d6>
    688d:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6891:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    6894:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    689a:	b8 60 c2 00 00       	mov    $0xc260,%eax
    689f:	b9 23 00 00 00       	mov    $0x23,%ecx
    68a4:	89 d7                	mov    %edx,%edi
    68a6:	89 c6                	mov    %eax,%esi
    68a8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    68aa:	89 f0                	mov    %esi,%eax
    68ac:	89 fa                	mov    %edi,%edx
    68ae:	0f b7 08             	movzwl (%eax),%ecx
    68b1:	66 89 0a             	mov    %cx,(%edx)
    68b4:	83 c2 02             	add    $0x2,%edx
    68b7:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    68ba:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    68c0:	ba 00 c3 00 00       	mov    $0xc300,%edx
    68c5:	bb fe 00 00 00       	mov    $0xfe,%ebx
    68ca:	89 c1                	mov    %eax,%ecx
    68cc:	83 e1 02             	and    $0x2,%ecx
    68cf:	85 c9                	test   %ecx,%ecx
    68d1:	74 0f                	je     68e2 <read_decoder_table+0x524>
    68d3:	0f b7 0a             	movzwl (%edx),%ecx
    68d6:	66 89 08             	mov    %cx,(%eax)
    68d9:	83 c0 02             	add    $0x2,%eax
    68dc:	83 c2 02             	add    $0x2,%edx
    68df:	83 eb 02             	sub    $0x2,%ebx
    68e2:	89 d9                	mov    %ebx,%ecx
    68e4:	c1 e9 02             	shr    $0x2,%ecx
    68e7:	89 c7                	mov    %eax,%edi
    68e9:	89 d6                	mov    %edx,%esi
    68eb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    68ed:	89 f2                	mov    %esi,%edx
    68ef:	89 f8                	mov    %edi,%eax
    68f1:	b9 00 00 00 00       	mov    $0x0,%ecx
    68f6:	89 de                	mov    %ebx,%esi
    68f8:	83 e6 02             	and    $0x2,%esi
    68fb:	85 f6                	test   %esi,%esi
    68fd:	74 0b                	je     690a <read_decoder_table+0x54c>
    68ff:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    6903:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6907:	83 c1 02             	add    $0x2,%ecx
    690a:	83 e3 01             	and    $0x1,%ebx
    690d:	85 db                	test   %ebx,%ebx
    690f:	74 07                	je     6918 <read_decoder_table+0x55a>
    6911:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6915:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    6918:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    691e:	b8 00 c4 00 00       	mov    $0xc400,%eax
    6923:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    6928:	89 d7                	mov    %edx,%edi
    692a:	89 c6                	mov    %eax,%esi
    692c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    692e:	89 f0                	mov    %esi,%eax
    6930:	89 fa                	mov    %edi,%edx
    6932:	0f b7 08             	movzwl (%eax),%ecx
    6935:	66 89 0a             	mov    %cx,(%edx)
    6938:	83 c2 02             	add    $0x2,%edx
    693b:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    693e:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    6944:	ba 00 c5 00 00       	mov    $0xc500,%edx
    6949:	bb fe 00 00 00       	mov    $0xfe,%ebx
    694e:	89 c1                	mov    %eax,%ecx
    6950:	83 e1 02             	and    $0x2,%ecx
    6953:	85 c9                	test   %ecx,%ecx
    6955:	74 0f                	je     6966 <read_decoder_table+0x5a8>
    6957:	0f b7 0a             	movzwl (%edx),%ecx
    695a:	66 89 08             	mov    %cx,(%eax)
    695d:	83 c0 02             	add    $0x2,%eax
    6960:	83 c2 02             	add    $0x2,%edx
    6963:	83 eb 02             	sub    $0x2,%ebx
    6966:	89 d9                	mov    %ebx,%ecx
    6968:	c1 e9 02             	shr    $0x2,%ecx
    696b:	89 c7                	mov    %eax,%edi
    696d:	89 d6                	mov    %edx,%esi
    696f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6971:	89 f2                	mov    %esi,%edx
    6973:	89 f8                	mov    %edi,%eax
    6975:	b9 00 00 00 00       	mov    $0x0,%ecx
    697a:	89 de                	mov    %ebx,%esi
    697c:	83 e6 02             	and    $0x2,%esi
    697f:	85 f6                	test   %esi,%esi
    6981:	74 0b                	je     698e <read_decoder_table+0x5d0>
    6983:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    6987:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    698b:	83 c1 02             	add    $0x2,%ecx
    698e:	83 e3 01             	and    $0x1,%ebx
    6991:	85 db                	test   %ebx,%ebx
    6993:	74 07                	je     699c <read_decoder_table+0x5de>
    6995:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6999:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    699c:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    69a2:	b8 00 c6 00 00       	mov    $0xc600,%eax
    69a7:	b9 ff 00 00 00       	mov    $0xff,%ecx
    69ac:	89 d7                	mov    %edx,%edi
    69ae:	89 c6                	mov    %eax,%esi
    69b0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    69b2:	89 f0                	mov    %esi,%eax
    69b4:	89 fa                	mov    %edi,%edx
    69b6:	0f b7 08             	movzwl (%eax),%ecx
    69b9:	66 89 0a             	mov    %cx,(%edx)
    69bc:	83 c2 02             	add    $0x2,%edx
    69bf:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    69c2:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    69c8:	ba 00 ca 00 00       	mov    $0xca00,%edx
    69cd:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    69d2:	89 c1                	mov    %eax,%ecx
    69d4:	83 e1 02             	and    $0x2,%ecx
    69d7:	85 c9                	test   %ecx,%ecx
    69d9:	74 0f                	je     69ea <read_decoder_table+0x62c>
    69db:	0f b7 0a             	movzwl (%edx),%ecx
    69de:	66 89 08             	mov    %cx,(%eax)
    69e1:	83 c0 02             	add    $0x2,%eax
    69e4:	83 c2 02             	add    $0x2,%edx
    69e7:	83 eb 02             	sub    $0x2,%ebx
    69ea:	89 d9                	mov    %ebx,%ecx
    69ec:	c1 e9 02             	shr    $0x2,%ecx
    69ef:	89 c7                	mov    %eax,%edi
    69f1:	89 d6                	mov    %edx,%esi
    69f3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    69f5:	89 f2                	mov    %esi,%edx
    69f7:	89 f8                	mov    %edi,%eax
    69f9:	b9 00 00 00 00       	mov    $0x0,%ecx
    69fe:	89 de                	mov    %ebx,%esi
    6a00:	83 e6 02             	and    $0x2,%esi
    6a03:	85 f6                	test   %esi,%esi
    6a05:	74 0b                	je     6a12 <read_decoder_table+0x654>
    6a07:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    6a0b:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    6a0f:	83 c1 02             	add    $0x2,%ecx
    6a12:	83 e3 01             	and    $0x1,%ebx
    6a15:	85 db                	test   %ebx,%ebx
    6a17:	74 07                	je     6a20 <read_decoder_table+0x662>
    6a19:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    6a1d:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    6a20:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    6a26:	b8 00 ce 00 00       	mov    $0xce00,%eax
    6a2b:	b9 ff 00 00 00       	mov    $0xff,%ecx
    6a30:	89 d7                	mov    %edx,%edi
    6a32:	89 c6                	mov    %eax,%esi
    6a34:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6a36:	89 f0                	mov    %esi,%eax
    6a38:	89 fa                	mov    %edi,%edx
    6a3a:	0f b7 08             	movzwl (%eax),%ecx
    6a3d:	66 89 0a             	mov    %cx,(%edx)
    6a40:	83 c2 02             	add    $0x2,%edx
    6a43:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    6a46:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    6a4c:	bb 00 d2 00 00       	mov    $0xd200,%ebx
    6a51:	b8 00 01 00 00       	mov    $0x100,%eax
    6a56:	89 d7                	mov    %edx,%edi
    6a58:	89 de                	mov    %ebx,%esi
    6a5a:	89 c1                	mov    %eax,%ecx
    6a5c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    6a5e:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    6a65:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    6a6c:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    6a73:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    6a7a:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    6a81:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    6a88:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    6a8f:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    6a96:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    6a9d:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    6aa4:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    6aab:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    6ab2:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    6ab9:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    6ac0:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    6ac7:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    6ace:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    6ad5:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    6adc:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    6ae3:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    6aea:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    6af1:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    6af8:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    6aff:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    6b06:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    6b0d:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    6b14:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    6b1b:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    6b22:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    6b29:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    6b30:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    6b37:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    6b3e:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    6b45:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    6b4c:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    6b53:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    6b5a:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    6b61:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    6b68:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    6b6f:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    6b76:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    6b7d:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    6b84:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    6b8b:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    6b92:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    6b99:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    6ba0:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    6ba7:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    6bae:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    6bb5:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    6bbc:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    6bc3:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    6bca:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    6bd1:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    6bd8:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    6bdf:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    6be6:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    6bed:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    6bf4:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    6bfb:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    6c02:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    6c09:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    6c10:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    6c17:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    6c1e:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    6c25:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    6c2c:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    6c33:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    6c3a:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    6c41:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    6c48:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    6c4f:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    6c56:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    6c5d:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    6c64:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    6c6b:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    6c72:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    6c79:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    6c80:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    6c87:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    6c8e:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    6c95:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    6c9c:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    6ca3:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    6caa:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    6cb1:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    6cb8:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    6cbf:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    6cc6:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    6ccd:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    6cd4:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    6cdb:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    6ce2:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    6ce9:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    6cf0:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    6cf7:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    6cfe:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    6d05:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    6d0c:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    6d13:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    6d1a:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    6d21:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    6d28:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    6d2f:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    6d36:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    6d3d:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    6d44:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    6d4b:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    6d52:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    6d59:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    6d60:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    6d67:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    6d6e:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    6d75:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    6d7c:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    6d83:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    6d8a:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    6d91:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    6d98:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    6d9f:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    6da6:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    6dad:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    6db4:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    6dbb:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    6dc2:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    6dc9:	30 00 
    6dcb:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    6dd2:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    6dd9:	00 00 00 
    6ddc:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    6de3:	00 00 00 
    6de6:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    6ded:	00 00 00 
    6df0:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    6df7:	00 00 00 
    6dfa:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    6e01:	ff ff ff 
    6e04:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    6e0b:	00 00 00 
    6e0e:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    6e15:	00 00 00 
    6e18:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    6e1f:	00 00 00 
    6e22:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    6e29:	00 00 00 
    6e2c:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    6e33:	31 00 
    6e35:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    6e3c:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    6e43:	00 00 00 
    6e46:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    6e4d:	00 00 00 
    6e50:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    6e57:	00 00 00 
    6e5a:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    6e61:	00 00 00 
    6e64:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    6e6b:	ff ff ff 
    6e6e:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    6e75:	00 00 00 
    6e78:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    6e7f:	00 00 00 
    6e82:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    6e85:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    6e8b:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    6e92:	00 00 00 
    6e95:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    6e9c:	32 00 
    6e9e:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    6ea5:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    6eac:	00 00 00 
    6eaf:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    6eb6:	00 00 00 
    6eb9:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    6ec0:	00 00 00 
    6ec3:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    6eca:	00 00 00 
    6ecd:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    6ed4:	ff ff ff 
    6ed7:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    6ede:	00 00 00 
    6ee1:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    6ee8:	00 00 00 
    6eeb:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    6eee:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    6ef4:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    6efb:	00 00 00 
    6efe:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    6f05:	33 00 
    6f07:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    6f0e:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    6f15:	00 00 00 
    6f18:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    6f1f:	00 00 00 
    6f22:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    6f29:	00 00 00 
    6f2c:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    6f33:	00 00 00 
    6f36:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    6f3d:	ff ff ff 
    6f40:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    6f47:	00 00 00 
    6f4a:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    6f51:	00 00 00 
    6f54:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    6f57:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    6f5d:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    6f64:	00 00 00 
    6f67:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    6f6e:	34 00 
    6f70:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    6f77:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    6f7e:	00 00 00 
    6f81:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    6f88:	00 00 00 
    6f8b:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    6f92:	00 00 00 
    6f95:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    6f9c:	00 00 00 
    6f9f:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    6fa6:	ff ff ff 
    6fa9:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    6fb0:	00 00 00 
    6fb3:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    6fba:	00 00 00 
    6fbd:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    6fc4:	00 00 00 
    6fc7:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    6fce:	00 00 00 
    6fd1:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    6fd8:	35 00 
    6fda:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    6fe1:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    6fe8:	00 00 00 
    6feb:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    6ff2:	00 00 00 
    6ff5:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    6ffc:	00 00 00 
    6fff:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    7006:	00 00 00 
    7009:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    7010:	ff ff ff 
    7013:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    701a:	00 00 00 
    701d:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    7024:	00 00 00 
    7027:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    702d:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    7033:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    703a:	00 00 00 
    703d:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    7044:	36 00 
    7046:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    704d:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    7054:	00 00 00 
    7057:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    705e:	00 00 00 
    7061:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    7068:	00 00 00 
    706b:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    7072:	00 00 00 
    7075:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    707c:	ff ff ff 
    707f:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    7086:	00 00 00 
    7089:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    7090:	00 00 00 
    7093:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    7099:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    709f:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    70a6:	00 00 00 
    70a9:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    70b0:	37 00 
    70b2:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    70b9:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    70c0:	00 00 00 
    70c3:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    70ca:	00 00 00 
    70cd:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    70d4:	00 00 00 
    70d7:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    70de:	00 00 00 
    70e1:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    70e8:	ff ff ff 
    70eb:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    70f2:	00 00 00 
    70f5:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    70fc:	00 00 00 
    70ff:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    7105:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    710b:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    7112:	00 00 00 
    7115:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    711c:	38 00 
    711e:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    7125:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    712c:	00 00 00 
    712f:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    7136:	00 00 00 
    7139:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    7140:	00 00 00 
    7143:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    714a:	00 00 00 
    714d:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    7154:	ff ff ff 
    7157:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    715e:	00 00 00 
    7161:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    7168:	00 00 00 
    716b:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    7171:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    7177:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    717e:	00 00 00 
    7181:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    7188:	39 00 
    718a:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    7191:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    7198:	00 00 00 
    719b:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    71a2:	00 00 00 
    71a5:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    71ac:	00 00 00 
    71af:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    71b6:	00 00 00 
    71b9:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    71c0:	ff ff ff 
    71c3:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    71ca:	00 00 00 
    71cd:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    71d4:	00 00 00 
    71d7:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    71dd:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    71e3:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    71ea:	00 00 00 
    71ed:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    71f4:	31 30 
    71f6:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    71fd:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    7204:	00 00 00 
    7207:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    720e:	00 00 00 
    7211:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    7218:	00 00 00 
    721b:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    7222:	00 00 00 
    7225:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    722c:	ff ff ff 
    722f:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    7236:	00 00 00 
    7239:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    7240:	00 00 00 
    7243:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    7249:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    724f:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    7256:	00 00 00 
    7259:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    7260:	31 31 
    7262:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    7269:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    7270:	00 00 00 
    7273:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    727a:	00 00 00 
    727d:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    7284:	00 00 00 
    7287:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    728e:	00 00 00 
    7291:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    7298:	ff ff ff 
    729b:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    72a2:	00 00 00 
    72a5:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    72ac:	00 00 00 
    72af:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    72b5:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    72bb:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    72c2:	00 00 00 
    72c5:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    72cc:	31 32 
    72ce:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    72d5:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    72dc:	00 00 00 
    72df:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    72e6:	00 00 00 
    72e9:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    72f0:	00 00 00 
    72f3:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    72fa:	00 00 00 
    72fd:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    7304:	ff ff ff 
    7307:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    730e:	00 00 00 
    7311:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    7318:	00 00 00 
    731b:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    7321:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    7327:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    732e:	00 00 00 
    7331:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    7338:	31 33 
    733a:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    7341:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    7348:	00 00 00 
    734b:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    7352:	00 00 00 
    7355:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    735c:	00 00 00 
    735f:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    7366:	00 00 00 
    7369:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    7370:	ff ff ff 
    7373:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    737a:	00 00 00 
    737d:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    7384:	00 00 00 
    7387:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    738d:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    7393:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    739a:	01 00 00 
    739d:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    73a4:	31 34 
    73a6:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    73ad:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    73b4:	00 00 00 
    73b7:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    73be:	00 00 00 
    73c1:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    73c8:	00 00 00 
    73cb:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    73d2:	00 00 00 
    73d5:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    73dc:	ff ff ff 
    73df:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    73e6:	00 00 00 
    73e9:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    73f0:	00 00 00 
    73f3:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    73fa:	00 00 00 
    73fd:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    7404:	00 00 00 
    7407:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    740e:	31 35 
    7410:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    7417:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    741e:	00 00 00 
    7421:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    7428:	00 00 00 
    742b:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    7432:	00 00 00 
    7435:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    743c:	00 00 00 
    743f:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    7446:	ff ff ff 
    7449:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    7450:	00 00 00 
    7453:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    745a:	00 00 00 
    745d:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    7463:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    7469:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    7470:	01 00 00 
    7473:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    747a:	31 36 
    747c:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    7483:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    748a:	00 00 00 
    748d:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    7494:	00 00 00 
    7497:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    749e:	00 00 00 
    74a1:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    74a8:	00 00 00 
    74ab:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    74b2:	ff ff ff 
    74b5:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    74bc:	00 00 00 
    74bf:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    74c6:	00 00 00 
    74c9:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    74cf:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    74d5:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    74dc:	01 00 00 
    74df:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    74e6:	31 37 
    74e8:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    74ef:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    74f6:	00 00 00 
    74f9:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    7500:	00 00 00 
    7503:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    750a:	00 00 00 
    750d:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    7514:	00 00 00 
    7517:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    751e:	00 00 00 
    7521:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    7528:	00 00 00 
    752b:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    7532:	00 00 00 
    7535:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    753b:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    7541:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    7548:	01 00 00 
    754b:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    7552:	31 38 
    7554:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    755b:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    7562:	00 00 00 
    7565:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    756c:	00 00 00 
    756f:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    7576:	00 00 00 
    7579:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    7580:	00 00 00 
    7583:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    758a:	00 00 00 
    758d:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    7594:	00 00 00 
    7597:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    759e:	00 00 00 
    75a1:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    75a7:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    75ad:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    75b4:	01 00 00 
    75b7:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    75be:	31 39 
    75c0:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    75c7:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    75ce:	00 00 00 
    75d1:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    75d8:	00 00 00 
    75db:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    75e2:	00 00 00 
    75e5:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    75ec:	00 00 00 
    75ef:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    75f6:	00 00 00 
    75f9:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    7600:	00 00 00 
    7603:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    760a:	00 00 00 
    760d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7613:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    7619:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    7620:	01 00 00 
    7623:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    762a:	32 30 
    762c:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    7633:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    763a:	00 00 00 
    763d:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    7644:	00 00 00 
    7647:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    764e:	00 00 00 
    7651:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    7658:	00 00 00 
    765b:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    7662:	00 00 00 
    7665:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    766c:	00 00 00 
    766f:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    7676:	00 00 00 
    7679:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    767f:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    7685:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    768c:	01 00 00 
    768f:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    7696:	32 31 
    7698:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    769f:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    76a6:	00 00 00 
    76a9:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    76b0:	00 00 00 
    76b3:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    76ba:	00 00 00 
    76bd:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    76c4:	00 00 00 
    76c7:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    76ce:	00 00 00 
    76d1:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    76d8:	00 00 00 
    76db:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    76e2:	00 00 00 
    76e5:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    76eb:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    76f1:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    76f8:	01 00 00 
    76fb:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    7702:	32 32 
    7704:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    770b:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    7712:	00 00 00 
    7715:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    771c:	00 00 00 
    771f:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    7726:	00 00 00 
    7729:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    7730:	03 00 00 
    7733:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    773a:	00 00 00 
    773d:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    7744:	00 00 00 
    7747:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    774e:	00 00 00 
    7751:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7757:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    775d:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    7764:	01 00 00 
    7767:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    776e:	32 33 
    7770:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    7777:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    777e:	00 00 00 
    7781:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    7788:	00 00 00 
    778b:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    7792:	00 00 00 
    7795:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    779c:	1f 00 00 
    779f:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    77a6:	00 00 00 
    77a9:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    77b0:	00 00 00 
    77b3:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    77ba:	00 00 00 
    77bd:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    77c3:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    77c9:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    77d0:	01 00 00 
    77d3:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    77da:	32 34 
    77dc:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    77e3:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    77ea:	00 00 00 
    77ed:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    77f4:	00 00 00 
    77f7:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    77fe:	00 00 00 
    7801:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    7808:	00 00 00 
    780b:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    7812:	ff ff ff 
    7815:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    781c:	00 00 00 
    781f:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    7826:	00 00 00 
    7829:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    782f:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    7835:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    783c:	02 00 00 
    783f:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    7846:	32 35 
    7848:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    784f:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    7856:	00 00 00 
    7859:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    7860:	00 00 00 
    7863:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    786a:	00 00 00 
    786d:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    7874:	00 00 00 
    7877:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    787e:	00 00 00 
    7881:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    7888:	00 00 00 
    788b:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    7892:	00 00 00 
    7895:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    789b:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    78a1:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    78a8:	02 00 00 
    78ab:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    78b2:	32 36 
    78b4:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    78bb:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    78c2:	00 00 00 
    78c5:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    78cc:	00 00 00 
    78cf:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    78d6:	00 00 00 
    78d9:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    78e0:	00 00 00 
    78e3:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    78ea:	00 00 00 
    78ed:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    78f4:	00 00 00 
    78f7:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    78fe:	00 00 00 
    7901:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7907:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    790d:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    7914:	02 00 00 
    7917:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    791e:	32 37 
    7920:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    7927:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    792e:	00 00 00 
    7931:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    7938:	00 00 00 
    793b:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    7942:	00 00 00 
    7945:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    794c:	00 00 00 
    794f:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    7956:	00 00 00 
    7959:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    7960:	00 00 00 
    7963:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    796a:	00 00 00 
    796d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7973:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    7979:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    7980:	02 00 00 
    7983:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    798a:	32 38 
    798c:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    7993:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    799a:	00 00 00 
    799d:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    79a4:	00 00 00 
    79a7:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    79ae:	00 00 00 
    79b1:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    79b8:	00 00 00 
    79bb:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    79c2:	00 00 00 
    79c5:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    79cc:	00 00 00 
    79cf:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    79d6:	00 00 00 
    79d9:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    79df:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    79e5:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    79ec:	02 00 00 
    79ef:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    79f6:	32 39 
    79f8:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    79ff:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    7a06:	00 00 00 
    7a09:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    7a10:	00 00 00 
    7a13:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    7a1a:	00 00 00 
    7a1d:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    7a24:	01 00 00 
    7a27:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    7a2e:	00 00 00 
    7a31:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    7a38:	00 00 00 
    7a3b:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    7a42:	00 00 00 
    7a45:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7a4b:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    7a51:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    7a58:	02 00 00 
    7a5b:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    7a62:	33 30 
    7a64:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    7a6b:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    7a72:	00 00 00 
    7a75:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    7a7c:	00 00 00 
    7a7f:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    7a86:	00 00 00 
    7a89:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    7a90:	07 00 00 
    7a93:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    7a9a:	00 00 00 
    7a9d:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    7aa4:	00 00 00 
    7aa7:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    7aae:	00 00 00 
    7ab1:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7ab7:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    7abd:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    7ac4:	02 00 00 
    7ac7:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    7ace:	33 31 
    7ad0:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    7ad7:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    7ade:	00 00 00 
    7ae1:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    7ae8:	00 00 00 
    7aeb:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    7af2:	00 00 00 
    7af5:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    7afc:	1f 00 00 
    7aff:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    7b06:	00 00 00 
    7b09:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    7b10:	00 00 00 
    7b13:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    7b1a:	00 00 00 
    7b1d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7b23:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    7b29:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    7b30:	02 00 00 
    7b33:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    7b3a:	33 32 
    7b3c:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    7b43:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    7b4a:	00 00 00 
    7b4d:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    7b54:	00 00 00 
    7b57:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    7b5e:	00 00 00 
    7b61:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    7b68:	00 00 00 
    7b6b:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    7b72:	ff ff ff 
    7b75:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    7b7c:	00 00 00 
    7b7f:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    7b86:	00 00 00 
    7b89:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    7b8f:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    7b95:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    7b9c:	00 00 00 
    7b9f:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    7ba6:	33 33 
    7ba8:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    7baf:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    7bb6:	00 00 00 
    7bb9:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    7bc0:	00 00 00 
    7bc3:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    7bca:	00 00 00 
    7bcd:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    7bd4:	00 00 00 
    7bd7:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    7bde:	ff ff ff 
    7be1:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    7be8:	00 00 00 
    7beb:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    7bf2:	00 00 00 
    7bf5:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    7bfb:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    7c01:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    7c08:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    7c0b:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    7c11:	5b                   	pop    %ebx
    7c12:	5e                   	pop    %esi
    7c13:	5f                   	pop    %edi
    7c14:	5d                   	pop    %ebp
    7c15:	c3                   	ret    

00007c16 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    7c16:	55                   	push   %ebp
    7c17:	89 e5                	mov    %esp,%ebp
    7c19:	53                   	push   %ebx
    7c1a:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    7c1d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    7c24:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    7c2b:	a1 50 01 01 00       	mov    0x10150,%eax
    7c30:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    7c33:	8b 45 08             	mov    0x8(%ebp),%eax
    7c36:	8b 40 20             	mov    0x20(%eax),%eax
    7c39:	85 c0                	test   %eax,%eax
    7c3b:	75 0a                	jne    7c47 <huffman_decoder+0x31>
    7c3d:	b8 02 00 00 00       	mov    $0x2,%eax
    7c42:	e9 0d 03 00 00       	jmp    7f54 <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    7c47:	8b 45 08             	mov    0x8(%ebp),%eax
    7c4a:	8b 40 24             	mov    0x24(%eax),%eax
    7c4d:	85 c0                	test   %eax,%eax
    7c4f:	75 1d                	jne    7c6e <huffman_decoder+0x58>
  {  *x = *y = 0;
    7c51:	8b 45 10             	mov    0x10(%ebp),%eax
    7c54:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    7c5a:	8b 45 10             	mov    0x10(%ebp),%eax
    7c5d:	8b 10                	mov    (%eax),%edx
    7c5f:	8b 45 0c             	mov    0xc(%ebp),%eax
    7c62:	89 10                	mov    %edx,(%eax)
     return 0;
    7c64:	b8 00 00 00 00       	mov    $0x0,%eax
    7c69:	e9 e6 02 00 00       	jmp    7f54 <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    7c6e:	8b 45 08             	mov    0x8(%ebp),%eax
    7c71:	8b 40 20             	mov    0x20(%eax),%eax
    7c74:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c77:	01 d2                	add    %edx,%edx
    7c79:	01 d0                	add    %edx,%eax
    7c7b:	0f b6 00             	movzbl (%eax),%eax
    7c7e:	84 c0                	test   %al,%al
    7c80:	75 46                	jne    7cc8 <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    7c82:	8b 45 08             	mov    0x8(%ebp),%eax
    7c85:	8b 40 20             	mov    0x20(%eax),%eax
    7c88:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c8b:	01 d2                	add    %edx,%edx
    7c8d:	01 d0                	add    %edx,%eax
    7c8f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7c93:	c0 e8 04             	shr    $0x4,%al
    7c96:	0f b6 d0             	movzbl %al,%edx
    7c99:	8b 45 0c             	mov    0xc(%ebp),%eax
    7c9c:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    7c9e:	8b 45 08             	mov    0x8(%ebp),%eax
    7ca1:	8b 40 20             	mov    0x20(%eax),%eax
    7ca4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ca7:	01 d2                	add    %edx,%edx
    7ca9:	01 d0                	add    %edx,%eax
    7cab:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7caf:	0f b6 c0             	movzbl %al,%eax
    7cb2:	83 e0 0f             	and    $0xf,%eax
    7cb5:	89 c2                	mov    %eax,%edx
    7cb7:	8b 45 10             	mov    0x10(%ebp),%eax
    7cba:	89 10                	mov    %edx,(%eax)

      error = 0;
    7cbc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    7cc3:	e9 af 00 00 00       	jmp    7d77 <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    7cc8:	e8 a7 e6 ff ff       	call   6374 <hget1bit>
    7ccd:	85 c0                	test   %eax,%eax
    7ccf:	74 47                	je     7d18 <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    7cd1:	eb 17                	jmp    7cea <huffman_decoder+0xd4>
    7cd3:	8b 45 08             	mov    0x8(%ebp),%eax
    7cd6:	8b 40 20             	mov    0x20(%eax),%eax
    7cd9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7cdc:	01 d2                	add    %edx,%edx
    7cde:	01 d0                	add    %edx,%eax
    7ce0:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7ce4:	0f b6 c0             	movzbl %al,%eax
    7ce7:	01 45 f0             	add    %eax,-0x10(%ebp)
    7cea:	8b 45 08             	mov    0x8(%ebp),%eax
    7ced:	8b 40 20             	mov    0x20(%eax),%eax
    7cf0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7cf3:	01 d2                	add    %edx,%edx
    7cf5:	01 d0                	add    %edx,%eax
    7cf7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7cfb:	3c f9                	cmp    $0xf9,%al
    7cfd:	77 d4                	ja     7cd3 <huffman_decoder+0xbd>
      point += h->val[point][1];
    7cff:	8b 45 08             	mov    0x8(%ebp),%eax
    7d02:	8b 40 20             	mov    0x20(%eax),%eax
    7d05:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d08:	01 d2                	add    %edx,%edx
    7d0a:	01 d0                	add    %edx,%eax
    7d0c:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7d10:	0f b6 c0             	movzbl %al,%eax
    7d13:	01 45 f0             	add    %eax,-0x10(%ebp)
    7d16:	eb 42                	jmp    7d5a <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    7d18:	eb 16                	jmp    7d30 <huffman_decoder+0x11a>
    7d1a:	8b 45 08             	mov    0x8(%ebp),%eax
    7d1d:	8b 40 20             	mov    0x20(%eax),%eax
    7d20:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d23:	01 d2                	add    %edx,%edx
    7d25:	01 d0                	add    %edx,%eax
    7d27:	0f b6 00             	movzbl (%eax),%eax
    7d2a:	0f b6 c0             	movzbl %al,%eax
    7d2d:	01 45 f0             	add    %eax,-0x10(%ebp)
    7d30:	8b 45 08             	mov    0x8(%ebp),%eax
    7d33:	8b 40 20             	mov    0x20(%eax),%eax
    7d36:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d39:	01 d2                	add    %edx,%edx
    7d3b:	01 d0                	add    %edx,%eax
    7d3d:	0f b6 00             	movzbl (%eax),%eax
    7d40:	3c f9                	cmp    $0xf9,%al
    7d42:	77 d6                	ja     7d1a <huffman_decoder+0x104>
      point += h->val[point][0];
    7d44:	8b 45 08             	mov    0x8(%ebp),%eax
    7d47:	8b 40 20             	mov    0x20(%eax),%eax
    7d4a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d4d:	01 d2                	add    %edx,%edx
    7d4f:	01 d0                	add    %edx,%eax
    7d51:	0f b6 00             	movzbl (%eax),%eax
    7d54:	0f b6 c0             	movzbl %al,%eax
    7d57:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    7d5a:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    7d5d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7d61:	0f 85 07 ff ff ff    	jne    7c6e <huffman_decoder+0x58>
    7d67:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d6a:	a1 44 3f 01 00       	mov    0x13f44,%eax
    7d6f:	39 c2                	cmp    %eax,%edx
    7d71:	0f 82 f7 fe ff ff    	jb     7c6e <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    7d77:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    7d7b:	74 24                	je     7da1 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    7d7d:	8b 45 08             	mov    0x8(%ebp),%eax
    7d80:	8b 40 04             	mov    0x4(%eax),%eax
    7d83:	83 e8 01             	sub    $0x1,%eax
    7d86:	01 c0                	add    %eax,%eax
    7d88:	89 c2                	mov    %eax,%edx
    7d8a:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d8d:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    7d8f:	8b 45 08             	mov    0x8(%ebp),%eax
    7d92:	8b 40 08             	mov    0x8(%eax),%eax
    7d95:	83 e8 01             	sub    $0x1,%eax
    7d98:	01 c0                	add    %eax,%eax
    7d9a:	89 c2                	mov    %eax,%edx
    7d9c:	8b 45 10             	mov    0x10(%ebp),%eax
    7d9f:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    7da1:	8b 45 08             	mov    0x8(%ebp),%eax
    7da4:	0f b6 00             	movzbl (%eax),%eax
    7da7:	3c 33                	cmp    $0x33,%al
    7da9:	0f 85 ec 00 00 00    	jne    7e9b <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    7daf:	8b 45 08             	mov    0x8(%ebp),%eax
    7db2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7db6:	3c 32                	cmp    $0x32,%al
    7db8:	74 0f                	je     7dc9 <huffman_decoder+0x1b3>
    7dba:	8b 45 08             	mov    0x8(%ebp),%eax
    7dbd:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7dc1:	3c 33                	cmp    $0x33,%al
    7dc3:	0f 85 d2 00 00 00    	jne    7e9b <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    7dc9:	8b 45 10             	mov    0x10(%ebp),%eax
    7dcc:	8b 00                	mov    (%eax),%eax
    7dce:	c1 f8 03             	sar    $0x3,%eax
    7dd1:	83 e0 01             	and    $0x1,%eax
    7dd4:	89 c2                	mov    %eax,%edx
    7dd6:	8b 45 14             	mov    0x14(%ebp),%eax
    7dd9:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    7ddb:	8b 45 10             	mov    0x10(%ebp),%eax
    7dde:	8b 00                	mov    (%eax),%eax
    7de0:	c1 f8 02             	sar    $0x2,%eax
    7de3:	83 e0 01             	and    $0x1,%eax
    7de6:	89 c2                	mov    %eax,%edx
    7de8:	8b 45 18             	mov    0x18(%ebp),%eax
    7deb:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    7ded:	8b 45 10             	mov    0x10(%ebp),%eax
    7df0:	8b 00                	mov    (%eax),%eax
    7df2:	d1 f8                	sar    %eax
    7df4:	83 e0 01             	and    $0x1,%eax
    7df7:	89 c2                	mov    %eax,%edx
    7df9:	8b 45 0c             	mov    0xc(%ebp),%eax
    7dfc:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    7dfe:	8b 45 10             	mov    0x10(%ebp),%eax
    7e01:	8b 00                	mov    (%eax),%eax
    7e03:	83 e0 01             	and    $0x1,%eax
    7e06:	89 c2                	mov    %eax,%edx
    7e08:	8b 45 10             	mov    0x10(%ebp),%eax
    7e0b:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    7e0d:	8b 45 14             	mov    0x14(%ebp),%eax
    7e10:	8b 00                	mov    (%eax),%eax
    7e12:	85 c0                	test   %eax,%eax
    7e14:	74 18                	je     7e2e <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    7e16:	e8 59 e5 ff ff       	call   6374 <hget1bit>
    7e1b:	83 f8 01             	cmp    $0x1,%eax
    7e1e:	75 0e                	jne    7e2e <huffman_decoder+0x218>
    7e20:	8b 45 14             	mov    0x14(%ebp),%eax
    7e23:	8b 00                	mov    (%eax),%eax
    7e25:	f7 d8                	neg    %eax
    7e27:	89 c2                	mov    %eax,%edx
    7e29:	8b 45 14             	mov    0x14(%ebp),%eax
    7e2c:	89 10                	mov    %edx,(%eax)
     if (*w)
    7e2e:	8b 45 18             	mov    0x18(%ebp),%eax
    7e31:	8b 00                	mov    (%eax),%eax
    7e33:	85 c0                	test   %eax,%eax
    7e35:	74 18                	je     7e4f <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    7e37:	e8 38 e5 ff ff       	call   6374 <hget1bit>
    7e3c:	83 f8 01             	cmp    $0x1,%eax
    7e3f:	75 0e                	jne    7e4f <huffman_decoder+0x239>
    7e41:	8b 45 18             	mov    0x18(%ebp),%eax
    7e44:	8b 00                	mov    (%eax),%eax
    7e46:	f7 d8                	neg    %eax
    7e48:	89 c2                	mov    %eax,%edx
    7e4a:	8b 45 18             	mov    0x18(%ebp),%eax
    7e4d:	89 10                	mov    %edx,(%eax)
     if (*x)
    7e4f:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e52:	8b 00                	mov    (%eax),%eax
    7e54:	85 c0                	test   %eax,%eax
    7e56:	74 18                	je     7e70 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    7e58:	e8 17 e5 ff ff       	call   6374 <hget1bit>
    7e5d:	83 f8 01             	cmp    $0x1,%eax
    7e60:	75 0e                	jne    7e70 <huffman_decoder+0x25a>
    7e62:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e65:	8b 00                	mov    (%eax),%eax
    7e67:	f7 d8                	neg    %eax
    7e69:	89 c2                	mov    %eax,%edx
    7e6b:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e6e:	89 10                	mov    %edx,(%eax)
     if (*y)
    7e70:	8b 45 10             	mov    0x10(%ebp),%eax
    7e73:	8b 00                	mov    (%eax),%eax
    7e75:	85 c0                	test   %eax,%eax
    7e77:	74 1d                	je     7e96 <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    7e79:	e8 f6 e4 ff ff       	call   6374 <hget1bit>
    7e7e:	83 f8 01             	cmp    $0x1,%eax
    7e81:	75 13                	jne    7e96 <huffman_decoder+0x280>
    7e83:	8b 45 10             	mov    0x10(%ebp),%eax
    7e86:	8b 00                	mov    (%eax),%eax
    7e88:	f7 d8                	neg    %eax
    7e8a:	89 c2                	mov    %eax,%edx
    7e8c:	8b 45 10             	mov    0x10(%ebp),%eax
    7e8f:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    7e91:	e9 bb 00 00 00       	jmp    7f51 <huffman_decoder+0x33b>
    7e96:	e9 b6 00 00 00       	jmp    7f51 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    7e9b:	8b 45 08             	mov    0x8(%ebp),%eax
    7e9e:	8b 40 0c             	mov    0xc(%eax),%eax
    7ea1:	85 c0                	test   %eax,%eax
    7ea3:	74 30                	je     7ed5 <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    7ea5:	8b 45 08             	mov    0x8(%ebp),%eax
    7ea8:	8b 40 04             	mov    0x4(%eax),%eax
    7eab:	8d 50 ff             	lea    -0x1(%eax),%edx
    7eae:	8b 45 0c             	mov    0xc(%ebp),%eax
    7eb1:	8b 00                	mov    (%eax),%eax
    7eb3:	39 c2                	cmp    %eax,%edx
    7eb5:	75 1e                	jne    7ed5 <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    7eb7:	8b 45 0c             	mov    0xc(%ebp),%eax
    7eba:	8b 00                	mov    (%eax),%eax
    7ebc:	89 c3                	mov    %eax,%ebx
    7ebe:	8b 45 08             	mov    0x8(%ebp),%eax
    7ec1:	8b 40 0c             	mov    0xc(%eax),%eax
    7ec4:	89 04 24             	mov    %eax,(%esp)
    7ec7:	e8 8d e4 ff ff       	call   6359 <hgetbits>
    7ecc:	01 d8                	add    %ebx,%eax
    7ece:	89 c2                	mov    %eax,%edx
    7ed0:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ed3:	89 10                	mov    %edx,(%eax)
     if (*x)
    7ed5:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ed8:	8b 00                	mov    (%eax),%eax
    7eda:	85 c0                	test   %eax,%eax
    7edc:	74 18                	je     7ef6 <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    7ede:	e8 91 e4 ff ff       	call   6374 <hget1bit>
    7ee3:	83 f8 01             	cmp    $0x1,%eax
    7ee6:	75 0e                	jne    7ef6 <huffman_decoder+0x2e0>
    7ee8:	8b 45 0c             	mov    0xc(%ebp),%eax
    7eeb:	8b 00                	mov    (%eax),%eax
    7eed:	f7 d8                	neg    %eax
    7eef:	89 c2                	mov    %eax,%edx
    7ef1:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ef4:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    7ef6:	8b 45 08             	mov    0x8(%ebp),%eax
    7ef9:	8b 40 0c             	mov    0xc(%eax),%eax
    7efc:	85 c0                	test   %eax,%eax
    7efe:	74 30                	je     7f30 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    7f00:	8b 45 08             	mov    0x8(%ebp),%eax
    7f03:	8b 40 08             	mov    0x8(%eax),%eax
    7f06:	8d 50 ff             	lea    -0x1(%eax),%edx
    7f09:	8b 45 10             	mov    0x10(%ebp),%eax
    7f0c:	8b 00                	mov    (%eax),%eax
    7f0e:	39 c2                	cmp    %eax,%edx
    7f10:	75 1e                	jne    7f30 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    7f12:	8b 45 10             	mov    0x10(%ebp),%eax
    7f15:	8b 00                	mov    (%eax),%eax
    7f17:	89 c3                	mov    %eax,%ebx
    7f19:	8b 45 08             	mov    0x8(%ebp),%eax
    7f1c:	8b 40 0c             	mov    0xc(%eax),%eax
    7f1f:	89 04 24             	mov    %eax,(%esp)
    7f22:	e8 32 e4 ff ff       	call   6359 <hgetbits>
    7f27:	01 d8                	add    %ebx,%eax
    7f29:	89 c2                	mov    %eax,%edx
    7f2b:	8b 45 10             	mov    0x10(%ebp),%eax
    7f2e:	89 10                	mov    %edx,(%eax)
     if (*y)
    7f30:	8b 45 10             	mov    0x10(%ebp),%eax
    7f33:	8b 00                	mov    (%eax),%eax
    7f35:	85 c0                	test   %eax,%eax
    7f37:	74 18                	je     7f51 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    7f39:	e8 36 e4 ff ff       	call   6374 <hget1bit>
    7f3e:	83 f8 01             	cmp    $0x1,%eax
    7f41:	75 0e                	jne    7f51 <huffman_decoder+0x33b>
    7f43:	8b 45 10             	mov    0x10(%ebp),%eax
    7f46:	8b 00                	mov    (%eax),%eax
    7f48:	f7 d8                	neg    %eax
    7f4a:	89 c2                	mov    %eax,%edx
    7f4c:	8b 45 10             	mov    0x10(%ebp),%eax
    7f4f:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    7f51:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    7f54:	83 c4 24             	add    $0x24,%esp
    7f57:	5b                   	pop    %ebx
    7f58:	5d                   	pop    %ebp
    7f59:	c3                   	ret    

00007f5a <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    7f5a:	55                   	push   %ebp
    7f5b:	89 e5                	mov    %esp,%ebp
    7f5d:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    7f60:	8b 45 0c             	mov    0xc(%ebp),%eax
    7f63:	8b 00                	mov    (%eax),%eax
    7f65:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    7f68:	8b 45 08             	mov    0x8(%ebp),%eax
    7f6b:	89 04 24             	mov    %eax,(%esp)
    7f6e:	e8 6c df ff ff       	call   5edf <get1bit>
    7f73:	89 c2                	mov    %eax,%edx
    7f75:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f78:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    7f7a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7f81:	00 
    7f82:	8b 45 08             	mov    0x8(%ebp),%eax
    7f85:	89 04 24             	mov    %eax,(%esp)
    7f88:	e8 64 e0 ff ff       	call   5ff1 <getbits>
    7f8d:	ba 04 00 00 00       	mov    $0x4,%edx
    7f92:	29 c2                	sub    %eax,%edx
    7f94:	89 d0                	mov    %edx,%eax
    7f96:	89 c2                	mov    %eax,%edx
    7f98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f9b:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    7f9e:	8b 45 08             	mov    0x8(%ebp),%eax
    7fa1:	89 04 24             	mov    %eax,(%esp)
    7fa4:	e8 36 df ff ff       	call   5edf <get1bit>
    7fa9:	85 c0                	test   %eax,%eax
    7fab:	0f 94 c0             	sete   %al
    7fae:	0f b6 d0             	movzbl %al,%edx
    7fb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fb4:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    7fb7:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    7fbe:	00 
    7fbf:	8b 45 08             	mov    0x8(%ebp),%eax
    7fc2:	89 04 24             	mov    %eax,(%esp)
    7fc5:	e8 27 e0 ff ff       	call   5ff1 <getbits>
    7fca:	89 c2                	mov    %eax,%edx
    7fcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fcf:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    7fd2:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7fd9:	00 
    7fda:	8b 45 08             	mov    0x8(%ebp),%eax
    7fdd:	89 04 24             	mov    %eax,(%esp)
    7fe0:	e8 0c e0 ff ff       	call   5ff1 <getbits>
    7fe5:	89 c2                	mov    %eax,%edx
    7fe7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fea:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    7fed:	8b 45 08             	mov    0x8(%ebp),%eax
    7ff0:	89 04 24             	mov    %eax,(%esp)
    7ff3:	e8 e7 de ff ff       	call   5edf <get1bit>
    7ff8:	89 c2                	mov    %eax,%edx
    7ffa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ffd:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    8000:	8b 45 08             	mov    0x8(%ebp),%eax
    8003:	89 04 24             	mov    %eax,(%esp)
    8006:	e8 d4 de ff ff       	call   5edf <get1bit>
    800b:	89 c2                	mov    %eax,%edx
    800d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8010:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    8013:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    801a:	00 
    801b:	8b 45 08             	mov    0x8(%ebp),%eax
    801e:	89 04 24             	mov    %eax,(%esp)
    8021:	e8 cb df ff ff       	call   5ff1 <getbits>
    8026:	89 c2                	mov    %eax,%edx
    8028:	8b 45 f4             	mov    -0xc(%ebp),%eax
    802b:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    802e:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8035:	00 
    8036:	8b 45 08             	mov    0x8(%ebp),%eax
    8039:	89 04 24             	mov    %eax,(%esp)
    803c:	e8 b0 df ff ff       	call   5ff1 <getbits>
    8041:	89 c2                	mov    %eax,%edx
    8043:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8046:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    8049:	8b 45 08             	mov    0x8(%ebp),%eax
    804c:	89 04 24             	mov    %eax,(%esp)
    804f:	e8 8b de ff ff       	call   5edf <get1bit>
    8054:	89 c2                	mov    %eax,%edx
    8056:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8059:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    805c:	8b 45 08             	mov    0x8(%ebp),%eax
    805f:	89 04 24             	mov    %eax,(%esp)
    8062:	e8 78 de ff ff       	call   5edf <get1bit>
    8067:	89 c2                	mov    %eax,%edx
    8069:	8b 45 f4             	mov    -0xc(%ebp),%eax
    806c:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    806f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8076:	00 
    8077:	8b 45 08             	mov    0x8(%ebp),%eax
    807a:	89 04 24             	mov    %eax,(%esp)
    807d:	e8 6f df ff ff       	call   5ff1 <getbits>
    8082:	89 c2                	mov    %eax,%edx
    8084:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8087:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    808a:	c9                   	leave  
    808b:	c3                   	ret    

0000808c <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    808c:	55                   	push   %ebp
    808d:	89 e5                	mov    %esp,%ebp
    808f:	56                   	push   %esi
    8090:	53                   	push   %ebx
    8091:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    8094:	8b 45 10             	mov    0x10(%ebp),%eax
    8097:	8b 40 08             	mov    0x8(%eax),%eax
    809a:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    809d:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    80a4:	00 
    80a5:	8b 45 08             	mov    0x8(%ebp),%eax
    80a8:	89 04 24             	mov    %eax,(%esp)
    80ab:	e8 41 df ff ff       	call   5ff1 <getbits>
    80b0:	8b 55 0c             	mov    0xc(%ebp),%edx
    80b3:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    80b5:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    80b9:	75 1b                	jne    80d6 <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    80bb:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    80c2:	00 
    80c3:	8b 45 08             	mov    0x8(%ebp),%eax
    80c6:	89 04 24             	mov    %eax,(%esp)
    80c9:	e8 23 df ff ff       	call   5ff1 <getbits>
    80ce:	8b 55 0c             	mov    0xc(%ebp),%edx
    80d1:	89 42 04             	mov    %eax,0x4(%edx)
    80d4:	eb 19                	jmp    80ef <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    80d6:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    80dd:	00 
    80de:	8b 45 08             	mov    0x8(%ebp),%eax
    80e1:	89 04 24             	mov    %eax,(%esp)
    80e4:	e8 08 df ff ff       	call   5ff1 <getbits>
    80e9:	8b 55 0c             	mov    0xc(%ebp),%edx
    80ec:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    80ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    80f6:	eb 3d                	jmp    8135 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    80f8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    80ff:	eb 2a                	jmp    812b <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    8101:	8b 45 08             	mov    0x8(%ebp),%eax
    8104:	89 04 24             	mov    %eax,(%esp)
    8107:	e8 d3 dd ff ff       	call   5edf <get1bit>
    810c:	89 c1                	mov    %eax,%ecx
    810e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8111:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8114:	89 d0                	mov    %edx,%eax
    8116:	c1 e0 02             	shl    $0x2,%eax
    8119:	01 d0                	add    %edx,%eax
    811b:	c1 e0 03             	shl    $0x3,%eax
    811e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8121:	01 d0                	add    %edx,%eax
    8123:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    8127:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    812b:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    812f:	7e d0                	jle    8101 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    8131:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8135:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8138:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    813b:	7c bb                	jl     80f8 <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    813d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8144:	e9 c5 05 00 00       	jmp    870e <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    8149:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8150:	e9 a9 05 00 00       	jmp    86fe <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    8155:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    815c:	00 
    815d:	8b 45 08             	mov    0x8(%ebp),%eax
    8160:	89 04 24             	mov    %eax,(%esp)
    8163:	e8 89 de ff ff       	call   5ff1 <getbits>
    8168:	89 c3                	mov    %eax,%ebx
    816a:	8b 75 0c             	mov    0xc(%ebp),%esi
    816d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8170:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8173:	89 c2                	mov    %eax,%edx
    8175:	c1 e2 03             	shl    $0x3,%edx
    8178:	01 c2                	add    %eax,%edx
    817a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8181:	89 c2                	mov    %eax,%edx
    8183:	89 c8                	mov    %ecx,%eax
    8185:	c1 e0 02             	shl    $0x2,%eax
    8188:	01 c8                	add    %ecx,%eax
    818a:	c1 e0 05             	shl    $0x5,%eax
    818d:	01 d0                	add    %edx,%eax
    818f:	01 f0                	add    %esi,%eax
    8191:	83 c0 18             	add    $0x18,%eax
    8194:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    8196:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    819d:	00 
    819e:	8b 45 08             	mov    0x8(%ebp),%eax
    81a1:	89 04 24             	mov    %eax,(%esp)
    81a4:	e8 48 de ff ff       	call   5ff1 <getbits>
    81a9:	89 c3                	mov    %eax,%ebx
    81ab:	8b 75 0c             	mov    0xc(%ebp),%esi
    81ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    81b1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    81b4:	89 c2                	mov    %eax,%edx
    81b6:	c1 e2 03             	shl    $0x3,%edx
    81b9:	01 c2                	add    %eax,%edx
    81bb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    81c2:	89 c2                	mov    %eax,%edx
    81c4:	89 c8                	mov    %ecx,%eax
    81c6:	c1 e0 02             	shl    $0x2,%eax
    81c9:	01 c8                	add    %ecx,%eax
    81cb:	c1 e0 05             	shl    $0x5,%eax
    81ce:	01 d0                	add    %edx,%eax
    81d0:	01 f0                	add    %esi,%eax
    81d2:	83 c0 1c             	add    $0x1c,%eax
    81d5:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    81d7:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    81de:	00 
    81df:	8b 45 08             	mov    0x8(%ebp),%eax
    81e2:	89 04 24             	mov    %eax,(%esp)
    81e5:	e8 07 de ff ff       	call   5ff1 <getbits>
    81ea:	89 c3                	mov    %eax,%ebx
    81ec:	8b 75 0c             	mov    0xc(%ebp),%esi
    81ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    81f2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    81f5:	89 c2                	mov    %eax,%edx
    81f7:	c1 e2 03             	shl    $0x3,%edx
    81fa:	01 c2                	add    %eax,%edx
    81fc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8203:	89 c2                	mov    %eax,%edx
    8205:	89 c8                	mov    %ecx,%eax
    8207:	c1 e0 02             	shl    $0x2,%eax
    820a:	01 c8                	add    %ecx,%eax
    820c:	c1 e0 05             	shl    $0x5,%eax
    820f:	01 d0                	add    %edx,%eax
    8211:	01 f0                	add    %esi,%eax
    8213:	83 c0 20             	add    $0x20,%eax
    8216:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    8218:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    821f:	00 
    8220:	8b 45 08             	mov    0x8(%ebp),%eax
    8223:	89 04 24             	mov    %eax,(%esp)
    8226:	e8 c6 dd ff ff       	call   5ff1 <getbits>
    822b:	89 c3                	mov    %eax,%ebx
    822d:	8b 75 0c             	mov    0xc(%ebp),%esi
    8230:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8233:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8236:	89 c2                	mov    %eax,%edx
    8238:	c1 e2 03             	shl    $0x3,%edx
    823b:	01 c2                	add    %eax,%edx
    823d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8244:	89 c2                	mov    %eax,%edx
    8246:	89 c8                	mov    %ecx,%eax
    8248:	c1 e0 02             	shl    $0x2,%eax
    824b:	01 c8                	add    %ecx,%eax
    824d:	c1 e0 05             	shl    $0x5,%eax
    8250:	01 d0                	add    %edx,%eax
    8252:	01 f0                	add    %esi,%eax
    8254:	83 c0 24             	add    $0x24,%eax
    8257:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    8259:	8b 45 08             	mov    0x8(%ebp),%eax
    825c:	89 04 24             	mov    %eax,(%esp)
    825f:	e8 7b dc ff ff       	call   5edf <get1bit>
    8264:	89 c3                	mov    %eax,%ebx
    8266:	8b 75 0c             	mov    0xc(%ebp),%esi
    8269:	8b 45 f0             	mov    -0x10(%ebp),%eax
    826c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    826f:	89 c2                	mov    %eax,%edx
    8271:	c1 e2 03             	shl    $0x3,%edx
    8274:	01 c2                	add    %eax,%edx
    8276:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    827d:	89 c2                	mov    %eax,%edx
    827f:	89 c8                	mov    %ecx,%eax
    8281:	c1 e0 02             	shl    $0x2,%eax
    8284:	01 c8                	add    %ecx,%eax
    8286:	c1 e0 05             	shl    $0x5,%eax
    8289:	01 d0                	add    %edx,%eax
    828b:	01 f0                	add    %esi,%eax
    828d:	83 c0 28             	add    $0x28,%eax
    8290:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    8292:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8295:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8298:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    829b:	89 c2                	mov    %eax,%edx
    829d:	c1 e2 03             	shl    $0x3,%edx
    82a0:	01 c2                	add    %eax,%edx
    82a2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    82a9:	89 c2                	mov    %eax,%edx
    82ab:	89 c8                	mov    %ecx,%eax
    82ad:	c1 e0 02             	shl    $0x2,%eax
    82b0:	01 c8                	add    %ecx,%eax
    82b2:	c1 e0 05             	shl    $0x5,%eax
    82b5:	01 d0                	add    %edx,%eax
    82b7:	01 d8                	add    %ebx,%eax
    82b9:	83 c0 28             	add    $0x28,%eax
    82bc:	8b 00                	mov    (%eax),%eax
    82be:	85 c0                	test   %eax,%eax
    82c0:	0f 84 82 02 00 00    	je     8548 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    82c6:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    82cd:	00 
    82ce:	8b 45 08             	mov    0x8(%ebp),%eax
    82d1:	89 04 24             	mov    %eax,(%esp)
    82d4:	e8 18 dd ff ff       	call   5ff1 <getbits>
    82d9:	89 c3                	mov    %eax,%ebx
    82db:	8b 75 0c             	mov    0xc(%ebp),%esi
    82de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    82e1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    82e4:	89 c2                	mov    %eax,%edx
    82e6:	c1 e2 03             	shl    $0x3,%edx
    82e9:	01 c2                	add    %eax,%edx
    82eb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    82f2:	89 c2                	mov    %eax,%edx
    82f4:	89 c8                	mov    %ecx,%eax
    82f6:	c1 e0 02             	shl    $0x2,%eax
    82f9:	01 c8                	add    %ecx,%eax
    82fb:	c1 e0 05             	shl    $0x5,%eax
    82fe:	01 d0                	add    %edx,%eax
    8300:	01 f0                	add    %esi,%eax
    8302:	83 c0 2c             	add    $0x2c,%eax
    8305:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    8307:	8b 45 08             	mov    0x8(%ebp),%eax
    830a:	89 04 24             	mov    %eax,(%esp)
    830d:	e8 cd db ff ff       	call   5edf <get1bit>
    8312:	89 c3                	mov    %eax,%ebx
    8314:	8b 75 0c             	mov    0xc(%ebp),%esi
    8317:	8b 45 f0             	mov    -0x10(%ebp),%eax
    831a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    831d:	89 c2                	mov    %eax,%edx
    831f:	c1 e2 03             	shl    $0x3,%edx
    8322:	01 c2                	add    %eax,%edx
    8324:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    832b:	89 c2                	mov    %eax,%edx
    832d:	89 c8                	mov    %ecx,%eax
    832f:	c1 e0 02             	shl    $0x2,%eax
    8332:	01 c8                	add    %ecx,%eax
    8334:	c1 e0 05             	shl    $0x5,%eax
    8337:	01 d0                	add    %edx,%eax
    8339:	01 f0                	add    %esi,%eax
    833b:	83 c0 30             	add    $0x30,%eax
    833e:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    8340:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8347:	eb 46                	jmp    838f <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8349:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8350:	00 
    8351:	8b 45 08             	mov    0x8(%ebp),%eax
    8354:	89 04 24             	mov    %eax,(%esp)
    8357:	e8 95 dc ff ff       	call   5ff1 <getbits>
    835c:	89 c3                	mov    %eax,%ebx
    835e:	8b 75 0c             	mov    0xc(%ebp),%esi
    8361:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8364:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8367:	89 c2                	mov    %eax,%edx
    8369:	c1 e2 03             	shl    $0x3,%edx
    836c:	01 c2                	add    %eax,%edx
    836e:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8371:	89 c2                	mov    %eax,%edx
    8373:	89 c8                	mov    %ecx,%eax
    8375:	c1 e0 02             	shl    $0x2,%eax
    8378:	01 c8                	add    %ecx,%eax
    837a:	c1 e0 03             	shl    $0x3,%eax
    837d:	01 c2                	add    %eax,%edx
    837f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8382:	01 d0                	add    %edx,%eax
    8384:	83 c0 08             	add    $0x8,%eax
    8387:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    838b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    838f:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    8393:	7e b4                	jle    8349 <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    8395:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    839c:	eb 46                	jmp    83e4 <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    839e:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    83a5:	00 
    83a6:	8b 45 08             	mov    0x8(%ebp),%eax
    83a9:	89 04 24             	mov    %eax,(%esp)
    83ac:	e8 40 dc ff ff       	call   5ff1 <getbits>
    83b1:	89 c3                	mov    %eax,%ebx
    83b3:	8b 75 0c             	mov    0xc(%ebp),%esi
    83b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83b9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    83bc:	89 c2                	mov    %eax,%edx
    83be:	c1 e2 03             	shl    $0x3,%edx
    83c1:	01 c2                	add    %eax,%edx
    83c3:	8d 04 12             	lea    (%edx,%edx,1),%eax
    83c6:	89 c2                	mov    %eax,%edx
    83c8:	89 c8                	mov    %ecx,%eax
    83ca:	c1 e0 02             	shl    $0x2,%eax
    83cd:	01 c8                	add    %ecx,%eax
    83cf:	c1 e0 03             	shl    $0x3,%eax
    83d2:	01 c2                	add    %eax,%edx
    83d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    83d7:	01 d0                	add    %edx,%eax
    83d9:	83 c0 0c             	add    $0xc,%eax
    83dc:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    83e0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    83e4:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    83e8:	7e b4                	jle    839e <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    83ea:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    83ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83f0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    83f3:	89 c2                	mov    %eax,%edx
    83f5:	c1 e2 03             	shl    $0x3,%edx
    83f8:	01 c2                	add    %eax,%edx
    83fa:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8401:	89 c2                	mov    %eax,%edx
    8403:	89 c8                	mov    %ecx,%eax
    8405:	c1 e0 02             	shl    $0x2,%eax
    8408:	01 c8                	add    %ecx,%eax
    840a:	c1 e0 05             	shl    $0x5,%eax
    840d:	01 d0                	add    %edx,%eax
    840f:	01 d8                	add    %ebx,%eax
    8411:	83 c0 2c             	add    $0x2c,%eax
    8414:	8b 00                	mov    (%eax),%eax
    8416:	85 c0                	test   %eax,%eax
    8418:	75 05                	jne    841f <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    841a:	e8 84 cb ff ff       	call   4fa3 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    841f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8422:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8425:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8428:	89 c2                	mov    %eax,%edx
    842a:	c1 e2 03             	shl    $0x3,%edx
    842d:	01 c2                	add    %eax,%edx
    842f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8436:	89 c2                	mov    %eax,%edx
    8438:	89 c8                	mov    %ecx,%eax
    843a:	c1 e0 02             	shl    $0x2,%eax
    843d:	01 c8                	add    %ecx,%eax
    843f:	c1 e0 05             	shl    $0x5,%eax
    8442:	01 d0                	add    %edx,%eax
    8444:	01 d8                	add    %ebx,%eax
    8446:	83 c0 2c             	add    $0x2c,%eax
    8449:	8b 00                	mov    (%eax),%eax
    844b:	83 f8 02             	cmp    $0x2,%eax
    844e:	75 62                	jne    84b2 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    8450:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8453:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8456:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8459:	89 c2                	mov    %eax,%edx
    845b:	c1 e2 03             	shl    $0x3,%edx
    845e:	01 c2                	add    %eax,%edx
    8460:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8467:	89 c2                	mov    %eax,%edx
    8469:	89 c8                	mov    %ecx,%eax
    846b:	c1 e0 02             	shl    $0x2,%eax
    846e:	01 c8                	add    %ecx,%eax
    8470:	c1 e0 05             	shl    $0x5,%eax
    8473:	01 d0                	add    %edx,%eax
    8475:	01 d8                	add    %ebx,%eax
    8477:	83 c0 30             	add    $0x30,%eax
    847a:	8b 00                	mov    (%eax),%eax
    847c:	85 c0                	test   %eax,%eax
    847e:	75 32                	jne    84b2 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    8480:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8483:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8486:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8489:	89 c2                	mov    %eax,%edx
    848b:	c1 e2 03             	shl    $0x3,%edx
    848e:	01 c2                	add    %eax,%edx
    8490:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8497:	89 c2                	mov    %eax,%edx
    8499:	89 c8                	mov    %ecx,%eax
    849b:	c1 e0 02             	shl    $0x2,%eax
    849e:	01 c8                	add    %ecx,%eax
    84a0:	c1 e0 05             	shl    $0x5,%eax
    84a3:	01 d0                	add    %edx,%eax
    84a5:	01 d8                	add    %ebx,%eax
    84a7:	83 c0 4c             	add    $0x4c,%eax
    84aa:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    84b0:	eb 30                	jmp    84e2 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    84b2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    84b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84b8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    84bb:	89 c2                	mov    %eax,%edx
    84bd:	c1 e2 03             	shl    $0x3,%edx
    84c0:	01 c2                	add    %eax,%edx
    84c2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    84c9:	89 c2                	mov    %eax,%edx
    84cb:	89 c8                	mov    %ecx,%eax
    84cd:	c1 e0 02             	shl    $0x2,%eax
    84d0:	01 c8                	add    %ecx,%eax
    84d2:	c1 e0 05             	shl    $0x5,%eax
    84d5:	01 d0                	add    %edx,%eax
    84d7:	01 d8                	add    %ebx,%eax
    84d9:	83 c0 4c             	add    $0x4c,%eax
    84dc:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    84e2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    84e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84e8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    84eb:	89 c2                	mov    %eax,%edx
    84ed:	c1 e2 03             	shl    $0x3,%edx
    84f0:	01 c2                	add    %eax,%edx
    84f2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    84f9:	89 c2                	mov    %eax,%edx
    84fb:	89 c8                	mov    %ecx,%eax
    84fd:	c1 e0 02             	shl    $0x2,%eax
    8500:	01 c8                	add    %ecx,%eax
    8502:	c1 e0 05             	shl    $0x5,%eax
    8505:	01 d0                	add    %edx,%eax
    8507:	01 d8                	add    %ebx,%eax
    8509:	83 c0 4c             	add    $0x4c,%eax
    850c:	8b 00                	mov    (%eax),%eax
    850e:	ba 14 00 00 00       	mov    $0x14,%edx
    8513:	89 d3                	mov    %edx,%ebx
    8515:	29 c3                	sub    %eax,%ebx
    8517:	8b 75 0c             	mov    0xc(%ebp),%esi
    851a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    851d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8520:	89 c2                	mov    %eax,%edx
    8522:	c1 e2 03             	shl    $0x3,%edx
    8525:	01 c2                	add    %eax,%edx
    8527:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    852e:	89 c2                	mov    %eax,%edx
    8530:	89 c8                	mov    %ecx,%eax
    8532:	c1 e0 02             	shl    $0x2,%eax
    8535:	01 c8                	add    %ecx,%eax
    8537:	c1 e0 05             	shl    $0x5,%eax
    853a:	01 d0                	add    %edx,%eax
    853c:	01 f0                	add    %esi,%eax
    853e:	83 c0 50             	add    $0x50,%eax
    8541:	89 18                	mov    %ebx,(%eax)
    8543:	e9 07 01 00 00       	jmp    864f <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    8548:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    854f:	eb 46                	jmp    8597 <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8551:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8558:	00 
    8559:	8b 45 08             	mov    0x8(%ebp),%eax
    855c:	89 04 24             	mov    %eax,(%esp)
    855f:	e8 8d da ff ff       	call   5ff1 <getbits>
    8564:	89 c3                	mov    %eax,%ebx
    8566:	8b 75 0c             	mov    0xc(%ebp),%esi
    8569:	8b 45 f0             	mov    -0x10(%ebp),%eax
    856c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    856f:	89 c2                	mov    %eax,%edx
    8571:	c1 e2 03             	shl    $0x3,%edx
    8574:	01 c2                	add    %eax,%edx
    8576:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8579:	89 c2                	mov    %eax,%edx
    857b:	89 c8                	mov    %ecx,%eax
    857d:	c1 e0 02             	shl    $0x2,%eax
    8580:	01 c8                	add    %ecx,%eax
    8582:	c1 e0 03             	shl    $0x3,%eax
    8585:	01 c2                	add    %eax,%edx
    8587:	8b 45 ec             	mov    -0x14(%ebp),%eax
    858a:	01 d0                	add    %edx,%eax
    858c:	83 c0 08             	add    $0x8,%eax
    858f:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    8593:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8597:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    859b:	7e b4                	jle    8551 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    859d:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    85a4:	00 
    85a5:	8b 45 08             	mov    0x8(%ebp),%eax
    85a8:	89 04 24             	mov    %eax,(%esp)
    85ab:	e8 41 da ff ff       	call   5ff1 <getbits>
    85b0:	89 c3                	mov    %eax,%ebx
    85b2:	8b 75 0c             	mov    0xc(%ebp),%esi
    85b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    85b8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    85bb:	89 c2                	mov    %eax,%edx
    85bd:	c1 e2 03             	shl    $0x3,%edx
    85c0:	01 c2                	add    %eax,%edx
    85c2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    85c9:	89 c2                	mov    %eax,%edx
    85cb:	89 c8                	mov    %ecx,%eax
    85cd:	c1 e0 02             	shl    $0x2,%eax
    85d0:	01 c8                	add    %ecx,%eax
    85d2:	c1 e0 05             	shl    $0x5,%eax
    85d5:	01 d0                	add    %edx,%eax
    85d7:	01 f0                	add    %esi,%eax
    85d9:	83 c0 4c             	add    $0x4c,%eax
    85dc:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    85de:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    85e5:	00 
    85e6:	8b 45 08             	mov    0x8(%ebp),%eax
    85e9:	89 04 24             	mov    %eax,(%esp)
    85ec:	e8 00 da ff ff       	call   5ff1 <getbits>
    85f1:	89 c3                	mov    %eax,%ebx
    85f3:	8b 75 0c             	mov    0xc(%ebp),%esi
    85f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    85f9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    85fc:	89 c2                	mov    %eax,%edx
    85fe:	c1 e2 03             	shl    $0x3,%edx
    8601:	01 c2                	add    %eax,%edx
    8603:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    860a:	89 c2                	mov    %eax,%edx
    860c:	89 c8                	mov    %ecx,%eax
    860e:	c1 e0 02             	shl    $0x2,%eax
    8611:	01 c8                	add    %ecx,%eax
    8613:	c1 e0 05             	shl    $0x5,%eax
    8616:	01 d0                	add    %edx,%eax
    8618:	01 f0                	add    %esi,%eax
    861a:	83 c0 50             	add    $0x50,%eax
    861d:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    861f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8622:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8625:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8628:	89 c2                	mov    %eax,%edx
    862a:	c1 e2 03             	shl    $0x3,%edx
    862d:	01 c2                	add    %eax,%edx
    862f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8636:	89 c2                	mov    %eax,%edx
    8638:	89 c8                	mov    %ecx,%eax
    863a:	c1 e0 02             	shl    $0x2,%eax
    863d:	01 c8                	add    %ecx,%eax
    863f:	c1 e0 05             	shl    $0x5,%eax
    8642:	01 d0                	add    %edx,%eax
    8644:	01 d8                	add    %ebx,%eax
    8646:	83 c0 2c             	add    $0x2c,%eax
    8649:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    864f:	8b 45 08             	mov    0x8(%ebp),%eax
    8652:	89 04 24             	mov    %eax,(%esp)
    8655:	e8 85 d8 ff ff       	call   5edf <get1bit>
    865a:	89 c3                	mov    %eax,%ebx
    865c:	8b 75 0c             	mov    0xc(%ebp),%esi
    865f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8662:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8665:	89 c2                	mov    %eax,%edx
    8667:	c1 e2 03             	shl    $0x3,%edx
    866a:	01 c2                	add    %eax,%edx
    866c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8673:	89 c2                	mov    %eax,%edx
    8675:	89 c8                	mov    %ecx,%eax
    8677:	c1 e0 02             	shl    $0x2,%eax
    867a:	01 c8                	add    %ecx,%eax
    867c:	c1 e0 05             	shl    $0x5,%eax
    867f:	01 d0                	add    %edx,%eax
    8681:	01 f0                	add    %esi,%eax
    8683:	83 c0 54             	add    $0x54,%eax
    8686:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    8688:	8b 45 08             	mov    0x8(%ebp),%eax
    868b:	89 04 24             	mov    %eax,(%esp)
    868e:	e8 4c d8 ff ff       	call   5edf <get1bit>
    8693:	89 c3                	mov    %eax,%ebx
    8695:	8b 75 0c             	mov    0xc(%ebp),%esi
    8698:	8b 45 f0             	mov    -0x10(%ebp),%eax
    869b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    869e:	89 c2                	mov    %eax,%edx
    86a0:	c1 e2 03             	shl    $0x3,%edx
    86a3:	01 c2                	add    %eax,%edx
    86a5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    86ac:	89 c2                	mov    %eax,%edx
    86ae:	89 c8                	mov    %ecx,%eax
    86b0:	c1 e0 02             	shl    $0x2,%eax
    86b3:	01 c8                	add    %ecx,%eax
    86b5:	c1 e0 05             	shl    $0x5,%eax
    86b8:	01 d0                	add    %edx,%eax
    86ba:	01 f0                	add    %esi,%eax
    86bc:	83 c0 58             	add    $0x58,%eax
    86bf:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    86c1:	8b 45 08             	mov    0x8(%ebp),%eax
    86c4:	89 04 24             	mov    %eax,(%esp)
    86c7:	e8 13 d8 ff ff       	call   5edf <get1bit>
    86cc:	89 c3                	mov    %eax,%ebx
    86ce:	8b 75 0c             	mov    0xc(%ebp),%esi
    86d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86d4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    86d7:	89 c2                	mov    %eax,%edx
    86d9:	c1 e2 03             	shl    $0x3,%edx
    86dc:	01 c2                	add    %eax,%edx
    86de:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    86e5:	89 c2                	mov    %eax,%edx
    86e7:	89 c8                	mov    %ecx,%eax
    86e9:	c1 e0 02             	shl    $0x2,%eax
    86ec:	01 c8                	add    %ecx,%eax
    86ee:	c1 e0 05             	shl    $0x5,%eax
    86f1:	01 d0                	add    %edx,%eax
    86f3:	01 f0                	add    %esi,%eax
    86f5:	83 c0 5c             	add    $0x5c,%eax
    86f8:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    86fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    86fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8701:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8704:	0f 8c 4b fa ff ff    	jl     8155 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    870a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    870e:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8712:	0f 8e 31 fa ff ff    	jle    8149 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    8718:	83 c4 20             	add    $0x20,%esp
    871b:	5b                   	pop    %ebx
    871c:	5e                   	pop    %esi
    871d:	5d                   	pop    %ebp
    871e:	c3                   	ret    

0000871f <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    871f:	55                   	push   %ebp
    8720:	89 e5                	mov    %esp,%ebp
    8722:	56                   	push   %esi
    8723:	53                   	push   %ebx
    8724:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    8727:	8b 45 10             	mov    0x10(%ebp),%eax
    872a:	89 c2                	mov    %eax,%edx
    872c:	c1 e2 03             	shl    $0x3,%edx
    872f:	01 c2                	add    %eax,%edx
    8731:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8738:	89 c2                	mov    %eax,%edx
    873a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    873d:	89 c8                	mov    %ecx,%eax
    873f:	c1 e0 02             	shl    $0x2,%eax
    8742:	01 c8                	add    %ecx,%eax
    8744:	c1 e0 05             	shl    $0x5,%eax
    8747:	01 d0                	add    %edx,%eax
    8749:	8d 50 10             	lea    0x10(%eax),%edx
    874c:	8b 45 0c             	mov    0xc(%ebp),%eax
    874f:	01 d0                	add    %edx,%eax
    8751:	83 c0 08             	add    $0x8,%eax
    8754:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8757:	8b 45 e8             	mov    -0x18(%ebp),%eax
    875a:	8b 40 10             	mov    0x10(%eax),%eax
    875d:	85 c0                	test   %eax,%eax
    875f:	0f 84 7e 02 00 00    	je     89e3 <III_get_scale_factors+0x2c4>
    8765:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8768:	8b 40 14             	mov    0x14(%eax),%eax
    876b:	83 f8 02             	cmp    $0x2,%eax
    876e:	0f 85 6f 02 00 00    	jne    89e3 <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    8774:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8777:	8b 40 18             	mov    0x18(%eax),%eax
    877a:	85 c0                	test   %eax,%eax
    877c:	0f 84 6b 01 00 00    	je     88ed <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    8782:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8789:	eb 32                	jmp    87bd <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    878b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    878e:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    8791:	8b 04 85 80 01 01 00 	mov    0x10180(,%eax,4),%eax
    8798:	89 04 24             	mov    %eax,(%esp)
    879b:	e8 b9 db ff ff       	call   6359 <hgetbits>
    87a0:	89 c3                	mov    %eax,%ebx
    87a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
    87a5:	8b 45 14             	mov    0x14(%ebp),%eax
    87a8:	01 c0                	add    %eax,%eax
    87aa:	89 c2                	mov    %eax,%edx
    87ac:	c1 e2 05             	shl    $0x5,%edx
    87af:	29 c2                	sub    %eax,%edx
    87b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87b4:	01 d0                	add    %edx,%eax
    87b6:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    87b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    87bd:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    87c1:	7e c8                	jle    878b <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    87c3:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    87ca:	eb 5c                	jmp    8828 <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    87cc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    87d3:	eb 49                	jmp    881e <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    87d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    87d8:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    87db:	8b 04 85 80 01 01 00 	mov    0x10180(,%eax,4),%eax
    87e2:	89 04 24             	mov    %eax,(%esp)
    87e5:	e8 6f db ff ff       	call   6359 <hgetbits>
    87ea:	89 c6                	mov    %eax,%esi
    87ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
    87ef:	8b 55 ec             	mov    -0x14(%ebp),%edx
    87f2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    87f5:	89 d0                	mov    %edx,%eax
    87f7:	01 c0                	add    %eax,%eax
    87f9:	01 d0                	add    %edx,%eax
    87fb:	c1 e0 02             	shl    $0x2,%eax
    87fe:	01 d0                	add    %edx,%eax
    8800:	89 ca                	mov    %ecx,%edx
    8802:	01 d2                	add    %edx,%edx
    8804:	89 d1                	mov    %edx,%ecx
    8806:	c1 e1 05             	shl    $0x5,%ecx
    8809:	29 d1                	sub    %edx,%ecx
    880b:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    880e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8811:	01 d0                	add    %edx,%eax
    8813:	83 c0 14             	add    $0x14,%eax
    8816:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    881a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    881e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8822:	7e b1                	jle    87d5 <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    8824:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8828:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    882c:	7e 9e                	jle    87cc <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    882e:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    8835:	eb 5f                	jmp    8896 <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    8837:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    883e:	eb 4c                	jmp    888c <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    8840:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8843:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    8846:	83 c0 10             	add    $0x10,%eax
    8849:	8b 04 85 80 01 01 00 	mov    0x10180(,%eax,4),%eax
    8850:	89 04 24             	mov    %eax,(%esp)
    8853:	e8 01 db ff ff       	call   6359 <hgetbits>
    8858:	89 c6                	mov    %eax,%esi
    885a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    885d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8860:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8863:	89 d0                	mov    %edx,%eax
    8865:	01 c0                	add    %eax,%eax
    8867:	01 d0                	add    %edx,%eax
    8869:	c1 e0 02             	shl    $0x2,%eax
    886c:	01 d0                	add    %edx,%eax
    886e:	89 ca                	mov    %ecx,%edx
    8870:	01 d2                	add    %edx,%edx
    8872:	89 d1                	mov    %edx,%ecx
    8874:	c1 e1 05             	shl    $0x5,%ecx
    8877:	29 d1                	sub    %edx,%ecx
    8879:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    887c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    887f:	01 d0                	add    %edx,%eax
    8881:	83 c0 14             	add    $0x14,%eax
    8884:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    8888:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    888c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8890:	7e ae                	jle    8840 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    8892:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8896:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    889a:	7e 9b                	jle    8837 <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    889c:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    88a3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    88aa:	eb 36                	jmp    88e2 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    88ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
    88af:	8b 55 ec             	mov    -0x14(%ebp),%edx
    88b2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    88b5:	89 d0                	mov    %edx,%eax
    88b7:	01 c0                	add    %eax,%eax
    88b9:	01 d0                	add    %edx,%eax
    88bb:	c1 e0 02             	shl    $0x2,%eax
    88be:	01 d0                	add    %edx,%eax
    88c0:	89 ca                	mov    %ecx,%edx
    88c2:	01 d2                	add    %edx,%edx
    88c4:	89 d1                	mov    %edx,%ecx
    88c6:	c1 e1 05             	shl    $0x5,%ecx
    88c9:	29 d1                	sub    %edx,%ecx
    88cb:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    88ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88d1:	01 d0                	add    %edx,%eax
    88d3:	83 c0 14             	add    $0x14,%eax
    88d6:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    88dd:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    88de:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    88e2:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    88e6:	7e c4                	jle    88ac <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    88e8:	e9 b1 01 00 00       	jmp    8a9e <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    88ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    88f4:	e9 8f 00 00 00       	jmp    8988 <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    88f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    88fc:	83 c0 04             	add    $0x4,%eax
    88ff:	8b 04 85 64 01 01 00 	mov    0x10164(,%eax,4),%eax
    8906:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8909:	eb 64                	jmp    896f <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    890b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8912:	eb 51                	jmp    8965 <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    8914:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8917:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    891a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    891d:	c1 e2 04             	shl    $0x4,%edx
    8920:	01 d0                	add    %edx,%eax
    8922:	8b 04 85 80 01 01 00 	mov    0x10180(,%eax,4),%eax
    8929:	89 04 24             	mov    %eax,(%esp)
    892c:	e8 28 da ff ff       	call   6359 <hgetbits>
    8931:	89 c6                	mov    %eax,%esi
    8933:	8b 5d 08             	mov    0x8(%ebp),%ebx
    8936:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8939:	8b 4d 14             	mov    0x14(%ebp),%ecx
    893c:	89 d0                	mov    %edx,%eax
    893e:	01 c0                	add    %eax,%eax
    8940:	01 d0                	add    %edx,%eax
    8942:	c1 e0 02             	shl    $0x2,%eax
    8945:	01 d0                	add    %edx,%eax
    8947:	89 ca                	mov    %ecx,%edx
    8949:	01 d2                	add    %edx,%edx
    894b:	89 d1                	mov    %edx,%ecx
    894d:	c1 e1 05             	shl    $0x5,%ecx
    8950:	29 d1                	sub    %edx,%ecx
    8952:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8955:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8958:	01 d0                	add    %edx,%eax
    895a:	83 c0 14             	add    $0x14,%eax
    895d:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    8961:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8965:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8969:	7e a9                	jle    8914 <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    896b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    896f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8972:	83 c0 01             	add    $0x1,%eax
    8975:	83 c0 04             	add    $0x4,%eax
    8978:	8b 04 85 64 01 01 00 	mov    0x10164(,%eax,4),%eax
    897f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    8982:	7f 87                	jg     890b <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    8984:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8988:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    898c:	0f 8e 67 ff ff ff    	jle    88f9 <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    8992:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8999:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    89a0:	eb 36                	jmp    89d8 <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    89a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
    89a5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    89a8:	8b 4d 14             	mov    0x14(%ebp),%ecx
    89ab:	89 d0                	mov    %edx,%eax
    89ad:	01 c0                	add    %eax,%eax
    89af:	01 d0                	add    %edx,%eax
    89b1:	c1 e0 02             	shl    $0x2,%eax
    89b4:	01 d0                	add    %edx,%eax
    89b6:	89 ca                	mov    %ecx,%edx
    89b8:	01 d2                	add    %edx,%edx
    89ba:	89 d1                	mov    %edx,%ecx
    89bc:	c1 e1 05             	shl    $0x5,%ecx
    89bf:	29 d1                	sub    %edx,%ecx
    89c1:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    89c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89c7:	01 d0                	add    %edx,%eax
    89c9:	83 c0 14             	add    $0x14,%eax
    89cc:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    89d3:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    89d4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    89d8:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    89dc:	7e c4                	jle    89a2 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    89de:	e9 bb 00 00 00       	jmp    8a9e <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    89e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    89ea:	e9 89 00 00 00       	jmp    8a78 <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    89ef:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    89f2:	8b 55 14             	mov    0x14(%ebp),%edx
    89f5:	89 d0                	mov    %edx,%eax
    89f7:	c1 e0 02             	shl    $0x2,%eax
    89fa:	01 d0                	add    %edx,%eax
    89fc:	c1 e0 03             	shl    $0x3,%eax
    89ff:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a02:	01 d0                	add    %edx,%eax
    8a04:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    8a08:	85 c0                	test   %eax,%eax
    8a0a:	74 06                	je     8a12 <III_get_scale_factors+0x2f3>
    8a0c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    8a10:	75 62                	jne    8a74 <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    8a12:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a15:	8b 04 85 60 01 01 00 	mov    0x10160(,%eax,4),%eax
    8a1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8a1f:	eb 41                	jmp    8a62 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    8a21:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8a25:	0f 9f c0             	setg   %al
    8a28:	0f b6 d0             	movzbl %al,%edx
    8a2b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8a2e:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    8a31:	c1 e2 04             	shl    $0x4,%edx
    8a34:	01 d0                	add    %edx,%eax
    8a36:	8b 04 85 80 01 01 00 	mov    0x10180(,%eax,4),%eax
    8a3d:	89 04 24             	mov    %eax,(%esp)
    8a40:	e8 14 d9 ff ff       	call   6359 <hgetbits>
    8a45:	89 c3                	mov    %eax,%ebx
    8a47:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8a4a:	8b 45 14             	mov    0x14(%ebp),%eax
    8a4d:	01 c0                	add    %eax,%eax
    8a4f:	89 c2                	mov    %eax,%edx
    8a51:	c1 e2 05             	shl    $0x5,%edx
    8a54:	29 c2                	sub    %eax,%edx
    8a56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a59:	01 d0                	add    %edx,%eax
    8a5b:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    8a5e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8a62:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a65:	83 c0 01             	add    $0x1,%eax
    8a68:	8b 04 85 60 01 01 00 	mov    0x10160(,%eax,4),%eax
    8a6f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    8a72:	7f ad                	jg     8a21 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    8a74:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8a78:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    8a7c:	0f 8e 6d ff ff ff    	jle    89ef <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    8a82:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8a85:	8b 45 14             	mov    0x14(%ebp),%eax
    8a88:	c1 e0 03             	shl    $0x3,%eax
    8a8b:	89 c2                	mov    %eax,%edx
    8a8d:	c1 e2 05             	shl    $0x5,%edx
    8a90:	29 c2                	sub    %eax,%edx
    8a92:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    8a95:	83 c0 58             	add    $0x58,%eax
    8a98:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    8a9e:	83 c4 20             	add    $0x20,%esp
    8aa1:	5b                   	pop    %ebx
    8aa2:	5e                   	pop    %esi
    8aa3:	5d                   	pop    %ebp
    8aa4:	c3                   	ret    

00008aa5 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    8aa5:	55                   	push   %ebp
    8aa6:	89 e5                	mov    %esp,%ebp
    8aa8:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    8aab:	a1 a0 04 01 00       	mov    0x104a0,%eax
    8ab0:	85 c0                	test   %eax,%eax
    8ab2:	74 02                	je     8ab6 <initialize_huffman+0x11>
    8ab4:	eb 0f                	jmp    8ac5 <initialize_huffman+0x20>
	read_decoder_table();
    8ab6:	e8 03 d9 ff ff       	call   63be <read_decoder_table>
	huffman_initialized = TRUE;
    8abb:	c7 05 a0 04 01 00 01 	movl   $0x1,0x104a0
    8ac2:	00 00 00 
}
    8ac5:	c9                   	leave  
    8ac6:	c3                   	ret    

00008ac7 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    8ac7:	55                   	push   %ebp
    8ac8:	89 e5                	mov    %esp,%ebp
    8aca:	57                   	push   %edi
    8acb:	56                   	push   %esi
    8acc:	53                   	push   %ebx
    8acd:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    8ad0:	e8 d0 ff ff ff       	call   8aa5 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    8ad5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8ad8:	8b 45 14             	mov    0x14(%ebp),%eax
    8adb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8ade:	89 c2                	mov    %eax,%edx
    8ae0:	c1 e2 03             	shl    $0x3,%edx
    8ae3:	01 c2                	add    %eax,%edx
    8ae5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8aec:	89 c2                	mov    %eax,%edx
    8aee:	89 c8                	mov    %ecx,%eax
    8af0:	c1 e0 02             	shl    $0x2,%eax
    8af3:	01 c8                	add    %ecx,%eax
    8af5:	c1 e0 05             	shl    $0x5,%eax
    8af8:	01 d0                	add    %edx,%eax
    8afa:	01 d8                	add    %ebx,%eax
    8afc:	83 c0 28             	add    $0x28,%eax
    8aff:	8b 00                	mov    (%eax),%eax
    8b01:	85 c0                	test   %eax,%eax
    8b03:	74 44                	je     8b49 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    8b05:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8b08:	8b 45 14             	mov    0x14(%ebp),%eax
    8b0b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8b0e:	89 c2                	mov    %eax,%edx
    8b10:	c1 e2 03             	shl    $0x3,%edx
    8b13:	01 c2                	add    %eax,%edx
    8b15:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8b1c:	89 c2                	mov    %eax,%edx
    8b1e:	89 c8                	mov    %ecx,%eax
    8b20:	c1 e0 02             	shl    $0x2,%eax
    8b23:	01 c8                	add    %ecx,%eax
    8b25:	c1 e0 05             	shl    $0x5,%eax
    8b28:	01 d0                	add    %edx,%eax
    8b2a:	01 d8                	add    %ebx,%eax
    8b2c:	83 c0 2c             	add    $0x2c,%eax
    8b2f:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    8b31:	83 f8 02             	cmp    $0x2,%eax
    8b34:	75 13                	jne    8b49 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    8b36:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    8b3d:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    8b44:	e9 cc 00 00 00       	jmp    8c15 <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8b49:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8b4c:	8b 00                	mov    (%eax),%eax
    8b4e:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    8b51:	8b 75 0c             	mov    0xc(%ebp),%esi
    8b54:	8b 45 14             	mov    0x14(%ebp),%eax
    8b57:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8b5a:	89 c2                	mov    %eax,%edx
    8b5c:	c1 e2 03             	shl    $0x3,%edx
    8b5f:	01 c2                	add    %eax,%edx
    8b61:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8b68:	89 c2                	mov    %eax,%edx
    8b6a:	89 d8                	mov    %ebx,%eax
    8b6c:	c1 e0 02             	shl    $0x2,%eax
    8b6f:	01 d8                	add    %ebx,%eax
    8b71:	c1 e0 05             	shl    $0x5,%eax
    8b74:	01 d0                	add    %edx,%eax
    8b76:	01 f0                	add    %esi,%eax
    8b78:	83 c0 4c             	add    $0x4c,%eax
    8b7b:	8b 00                	mov    (%eax),%eax
    8b7d:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8b80:	89 c8                	mov    %ecx,%eax
    8b82:	c1 e0 03             	shl    $0x3,%eax
    8b85:	01 c8                	add    %ecx,%eax
    8b87:	c1 e0 02             	shl    $0x2,%eax
    8b8a:	01 c8                	add    %ecx,%eax
    8b8c:	01 d0                	add    %edx,%eax
    8b8e:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    8b95:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8b98:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8b9b:	8b 00                	mov    (%eax),%eax
    8b9d:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8ba0:	8b 75 0c             	mov    0xc(%ebp),%esi
    8ba3:	8b 45 14             	mov    0x14(%ebp),%eax
    8ba6:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8ba9:	89 c2                	mov    %eax,%edx
    8bab:	c1 e2 03             	shl    $0x3,%edx
    8bae:	01 c2                	add    %eax,%edx
    8bb0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8bb7:	89 c2                	mov    %eax,%edx
    8bb9:	89 d8                	mov    %ebx,%eax
    8bbb:	c1 e0 02             	shl    $0x2,%eax
    8bbe:	01 d8                	add    %ebx,%eax
    8bc0:	c1 e0 05             	shl    $0x5,%eax
    8bc3:	01 d0                	add    %edx,%eax
    8bc5:	01 f0                	add    %esi,%eax
    8bc7:	83 c0 4c             	add    $0x4c,%eax
    8bca:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    8bcc:	8b 7d 0c             	mov    0xc(%ebp),%edi
    8bcf:	8b 45 14             	mov    0x14(%ebp),%eax
    8bd2:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8bd5:	89 c2                	mov    %eax,%edx
    8bd7:	c1 e2 03             	shl    $0x3,%edx
    8bda:	01 c2                	add    %eax,%edx
    8bdc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8be3:	89 c2                	mov    %eax,%edx
    8be5:	89 d8                	mov    %ebx,%eax
    8be7:	c1 e0 02             	shl    $0x2,%eax
    8bea:	01 d8                	add    %ebx,%eax
    8bec:	c1 e0 05             	shl    $0x5,%eax
    8bef:	01 d0                	add    %edx,%eax
    8bf1:	01 f8                	add    %edi,%eax
    8bf3:	83 c0 50             	add    $0x50,%eax
    8bf6:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8bf8:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    8bfa:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8bfd:	89 c8                	mov    %ecx,%eax
    8bff:	c1 e0 03             	shl    $0x3,%eax
    8c02:	01 c8                	add    %ecx,%eax
    8c04:	c1 e0 02             	shl    $0x2,%eax
    8c07:	01 c8                	add    %ecx,%eax
    8c09:	01 d0                	add    %edx,%eax
    8c0b:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    8c12:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    8c15:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    8c1c:	e9 ac 01 00 00       	jmp    8dcd <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    8c21:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8c24:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8c27:	7d 43                	jge    8c6c <III_hufman_decode+0x1a5>
    8c29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8c2c:	8b 45 14             	mov    0x14(%ebp),%eax
    8c2f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8c32:	89 c2                	mov    %eax,%edx
    8c34:	c1 e2 03             	shl    $0x3,%edx
    8c37:	01 c2                	add    %eax,%edx
    8c39:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c40:	89 c2                	mov    %eax,%edx
    8c42:	89 c8                	mov    %ecx,%eax
    8c44:	c1 e0 02             	shl    $0x2,%eax
    8c47:	01 c8                	add    %ecx,%eax
    8c49:	c1 e0 05             	shl    $0x5,%eax
    8c4c:	01 d0                	add    %edx,%eax
    8c4e:	01 d8                	add    %ebx,%eax
    8c50:	83 c0 34             	add    $0x34,%eax
    8c53:	8b 10                	mov    (%eax),%edx
    8c55:	89 d0                	mov    %edx,%eax
    8c57:	c1 e0 02             	shl    $0x2,%eax
    8c5a:	01 d0                	add    %edx,%eax
    8c5c:	c1 e0 03             	shl    $0x3,%eax
    8c5f:	05 20 3f 01 00       	add    $0x13f20,%eax
    8c64:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8c67:	e9 86 00 00 00       	jmp    8cf2 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    8c6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8c6f:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    8c72:	7d 40                	jge    8cb4 <III_hufman_decode+0x1ed>
    8c74:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8c77:	8b 45 14             	mov    0x14(%ebp),%eax
    8c7a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8c7d:	89 c2                	mov    %eax,%edx
    8c7f:	c1 e2 03             	shl    $0x3,%edx
    8c82:	01 c2                	add    %eax,%edx
    8c84:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c8b:	89 c2                	mov    %eax,%edx
    8c8d:	89 c8                	mov    %ecx,%eax
    8c8f:	c1 e0 02             	shl    $0x2,%eax
    8c92:	01 c8                	add    %ecx,%eax
    8c94:	c1 e0 05             	shl    $0x5,%eax
    8c97:	01 d0                	add    %edx,%eax
    8c99:	01 d8                	add    %ebx,%eax
    8c9b:	83 c0 38             	add    $0x38,%eax
    8c9e:	8b 10                	mov    (%eax),%edx
    8ca0:	89 d0                	mov    %edx,%eax
    8ca2:	c1 e0 02             	shl    $0x2,%eax
    8ca5:	01 d0                	add    %edx,%eax
    8ca7:	c1 e0 03             	shl    $0x3,%eax
    8caa:	05 20 3f 01 00       	add    $0x13f20,%eax
    8caf:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8cb2:	eb 3e                	jmp    8cf2 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    8cb4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8cb7:	8b 45 14             	mov    0x14(%ebp),%eax
    8cba:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8cbd:	89 c2                	mov    %eax,%edx
    8cbf:	c1 e2 03             	shl    $0x3,%edx
    8cc2:	01 c2                	add    %eax,%edx
    8cc4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8ccb:	89 c2                	mov    %eax,%edx
    8ccd:	89 c8                	mov    %ecx,%eax
    8ccf:	c1 e0 02             	shl    $0x2,%eax
    8cd2:	01 c8                	add    %ecx,%eax
    8cd4:	c1 e0 05             	shl    $0x5,%eax
    8cd7:	01 d0                	add    %edx,%eax
    8cd9:	01 d8                	add    %ebx,%eax
    8cdb:	83 c0 3c             	add    $0x3c,%eax
    8cde:	8b 10                	mov    (%eax),%edx
    8ce0:	89 d0                	mov    %edx,%eax
    8ce2:	c1 e0 02             	shl    $0x2,%eax
    8ce5:	01 d0                	add    %edx,%eax
    8ce7:	c1 e0 03             	shl    $0x3,%eax
    8cea:	05 20 3f 01 00       	add    $0x13f20,%eax
    8cef:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    8cf2:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8cf5:	89 44 24 10          	mov    %eax,0x10(%esp)
    8cf9:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8cfc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    8d00:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8d03:	89 44 24 08          	mov    %eax,0x8(%esp)
    8d07:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    8d0a:	89 44 24 04          	mov    %eax,0x4(%esp)
    8d0e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8d11:	89 04 24             	mov    %eax,(%esp)
    8d14:	e8 fd ee ff ff       	call   7c16 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    8d19:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8d1c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d21:	89 c8                	mov    %ecx,%eax
    8d23:	f7 ea                	imul   %edx
    8d25:	c1 fa 02             	sar    $0x2,%edx
    8d28:	89 c8                	mov    %ecx,%eax
    8d2a:	c1 f8 1f             	sar    $0x1f,%eax
    8d2d:	29 c2                	sub    %eax,%edx
    8d2f:	89 d0                	mov    %edx,%eax
    8d31:	89 c2                	mov    %eax,%edx
    8d33:	89 d0                	mov    %edx,%eax
    8d35:	c1 e0 03             	shl    $0x3,%eax
    8d38:	01 d0                	add    %edx,%eax
    8d3a:	c1 e0 03             	shl    $0x3,%eax
    8d3d:	89 c2                	mov    %eax,%edx
    8d3f:	8b 45 08             	mov    0x8(%ebp),%eax
    8d42:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8d45:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8d48:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d4d:	89 c8                	mov    %ecx,%eax
    8d4f:	f7 ea                	imul   %edx
    8d51:	c1 fa 02             	sar    $0x2,%edx
    8d54:	89 c8                	mov    %ecx,%eax
    8d56:	c1 f8 1f             	sar    $0x1f,%eax
    8d59:	29 c2                	sub    %eax,%edx
    8d5b:	89 d0                	mov    %edx,%eax
    8d5d:	c1 e0 03             	shl    $0x3,%eax
    8d60:	01 d0                	add    %edx,%eax
    8d62:	01 c0                	add    %eax,%eax
    8d64:	29 c1                	sub    %eax,%ecx
    8d66:	89 ca                	mov    %ecx,%edx
    8d68:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8d6b:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    8d6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8d71:	8d 48 01             	lea    0x1(%eax),%ecx
    8d74:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d79:	89 c8                	mov    %ecx,%eax
    8d7b:	f7 ea                	imul   %edx
    8d7d:	c1 fa 02             	sar    $0x2,%edx
    8d80:	89 c8                	mov    %ecx,%eax
    8d82:	c1 f8 1f             	sar    $0x1f,%eax
    8d85:	29 c2                	sub    %eax,%edx
    8d87:	89 d0                	mov    %edx,%eax
    8d89:	89 c2                	mov    %eax,%edx
    8d8b:	89 d0                	mov    %edx,%eax
    8d8d:	c1 e0 03             	shl    $0x3,%eax
    8d90:	01 d0                	add    %edx,%eax
    8d92:	c1 e0 03             	shl    $0x3,%eax
    8d95:	89 c2                	mov    %eax,%edx
    8d97:	8b 45 08             	mov    0x8(%ebp),%eax
    8d9a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8d9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8da0:	8d 48 01             	lea    0x1(%eax),%ecx
    8da3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8da8:	89 c8                	mov    %ecx,%eax
    8daa:	f7 ea                	imul   %edx
    8dac:	c1 fa 02             	sar    $0x2,%edx
    8daf:	89 c8                	mov    %ecx,%eax
    8db1:	c1 f8 1f             	sar    $0x1f,%eax
    8db4:	29 c2                	sub    %eax,%edx
    8db6:	89 d0                	mov    %edx,%eax
    8db8:	c1 e0 03             	shl    $0x3,%eax
    8dbb:	01 d0                	add    %edx,%eax
    8dbd:	01 c0                	add    %eax,%eax
    8dbf:	29 c1                	sub    %eax,%ecx
    8dc1:	89 ca                	mov    %ecx,%edx
    8dc3:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8dc6:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    8dc9:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    8dcd:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    8dd0:	8b 75 0c             	mov    0xc(%ebp),%esi
    8dd3:	8b 45 14             	mov    0x14(%ebp),%eax
    8dd6:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8dd9:	89 c2                	mov    %eax,%edx
    8ddb:	c1 e2 03             	shl    $0x3,%edx
    8dde:	01 c2                	add    %eax,%edx
    8de0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8de7:	89 c2                	mov    %eax,%edx
    8de9:	89 c8                	mov    %ecx,%eax
    8deb:	c1 e0 02             	shl    $0x2,%eax
    8dee:	01 c8                	add    %ecx,%eax
    8df0:	c1 e0 05             	shl    $0x5,%eax
    8df3:	01 d0                	add    %edx,%eax
    8df5:	01 f0                	add    %esi,%eax
    8df7:	83 c0 1c             	add    $0x1c,%eax
    8dfa:	8b 00                	mov    (%eax),%eax
    8dfc:	01 c0                	add    %eax,%eax
    8dfe:	39 c3                	cmp    %eax,%ebx
    8e00:	0f 82 1b fe ff ff    	jb     8c21 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    8e06:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8e09:	8b 45 14             	mov    0x14(%ebp),%eax
    8e0c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8e0f:	89 c2                	mov    %eax,%edx
    8e11:	c1 e2 03             	shl    $0x3,%edx
    8e14:	01 c2                	add    %eax,%edx
    8e16:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8e1d:	89 c2                	mov    %eax,%edx
    8e1f:	89 c8                	mov    %ecx,%eax
    8e21:	c1 e0 02             	shl    $0x2,%eax
    8e24:	01 c8                	add    %ecx,%eax
    8e26:	c1 e0 05             	shl    $0x5,%eax
    8e29:	01 d0                	add    %edx,%eax
    8e2b:	01 d8                	add    %ebx,%eax
    8e2d:	83 c0 5c             	add    $0x5c,%eax
    8e30:	8b 00                	mov    (%eax),%eax
    8e32:	8d 50 20             	lea    0x20(%eax),%edx
    8e35:	89 d0                	mov    %edx,%eax
    8e37:	c1 e0 02             	shl    $0x2,%eax
    8e3a:	01 d0                	add    %edx,%eax
    8e3c:	c1 e0 03             	shl    $0x3,%eax
    8e3f:	05 20 3f 01 00       	add    $0x13f20,%eax
    8e44:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    8e47:	e9 91 01 00 00       	jmp    8fdd <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    8e4c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8e4f:	89 44 24 10          	mov    %eax,0x10(%esp)
    8e53:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8e56:	89 44 24 0c          	mov    %eax,0xc(%esp)
    8e5a:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8e5d:	89 44 24 08          	mov    %eax,0x8(%esp)
    8e61:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    8e64:	89 44 24 04          	mov    %eax,0x4(%esp)
    8e68:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8e6b:	89 04 24             	mov    %eax,(%esp)
    8e6e:	e8 a3 ed ff ff       	call   7c16 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    8e73:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8e76:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8e7b:	89 c8                	mov    %ecx,%eax
    8e7d:	f7 ea                	imul   %edx
    8e7f:	c1 fa 02             	sar    $0x2,%edx
    8e82:	89 c8                	mov    %ecx,%eax
    8e84:	c1 f8 1f             	sar    $0x1f,%eax
    8e87:	29 c2                	sub    %eax,%edx
    8e89:	89 d0                	mov    %edx,%eax
    8e8b:	89 c2                	mov    %eax,%edx
    8e8d:	89 d0                	mov    %edx,%eax
    8e8f:	c1 e0 03             	shl    $0x3,%eax
    8e92:	01 d0                	add    %edx,%eax
    8e94:	c1 e0 03             	shl    $0x3,%eax
    8e97:	89 c2                	mov    %eax,%edx
    8e99:	8b 45 08             	mov    0x8(%ebp),%eax
    8e9c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8e9f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8ea2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ea7:	89 c8                	mov    %ecx,%eax
    8ea9:	f7 ea                	imul   %edx
    8eab:	c1 fa 02             	sar    $0x2,%edx
    8eae:	89 c8                	mov    %ecx,%eax
    8eb0:	c1 f8 1f             	sar    $0x1f,%eax
    8eb3:	29 c2                	sub    %eax,%edx
    8eb5:	89 d0                	mov    %edx,%eax
    8eb7:	c1 e0 03             	shl    $0x3,%eax
    8eba:	01 d0                	add    %edx,%eax
    8ebc:	01 c0                	add    %eax,%eax
    8ebe:	29 c1                	sub    %eax,%ecx
    8ec0:	89 ca                	mov    %ecx,%edx
    8ec2:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8ec5:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    8ec8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8ecb:	8d 48 01             	lea    0x1(%eax),%ecx
    8ece:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ed3:	89 c8                	mov    %ecx,%eax
    8ed5:	f7 ea                	imul   %edx
    8ed7:	c1 fa 02             	sar    $0x2,%edx
    8eda:	89 c8                	mov    %ecx,%eax
    8edc:	c1 f8 1f             	sar    $0x1f,%eax
    8edf:	29 c2                	sub    %eax,%edx
    8ee1:	89 d0                	mov    %edx,%eax
    8ee3:	89 c2                	mov    %eax,%edx
    8ee5:	89 d0                	mov    %edx,%eax
    8ee7:	c1 e0 03             	shl    $0x3,%eax
    8eea:	01 d0                	add    %edx,%eax
    8eec:	c1 e0 03             	shl    $0x3,%eax
    8eef:	89 c2                	mov    %eax,%edx
    8ef1:	8b 45 08             	mov    0x8(%ebp),%eax
    8ef4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8ef7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8efa:	8d 48 01             	lea    0x1(%eax),%ecx
    8efd:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f02:	89 c8                	mov    %ecx,%eax
    8f04:	f7 ea                	imul   %edx
    8f06:	c1 fa 02             	sar    $0x2,%edx
    8f09:	89 c8                	mov    %ecx,%eax
    8f0b:	c1 f8 1f             	sar    $0x1f,%eax
    8f0e:	29 c2                	sub    %eax,%edx
    8f10:	89 d0                	mov    %edx,%eax
    8f12:	c1 e0 03             	shl    $0x3,%eax
    8f15:	01 d0                	add    %edx,%eax
    8f17:	01 c0                	add    %eax,%eax
    8f19:	29 c1                	sub    %eax,%ecx
    8f1b:	89 ca                	mov    %ecx,%edx
    8f1d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8f20:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    8f23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8f26:	8d 48 02             	lea    0x2(%eax),%ecx
    8f29:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f2e:	89 c8                	mov    %ecx,%eax
    8f30:	f7 ea                	imul   %edx
    8f32:	c1 fa 02             	sar    $0x2,%edx
    8f35:	89 c8                	mov    %ecx,%eax
    8f37:	c1 f8 1f             	sar    $0x1f,%eax
    8f3a:	29 c2                	sub    %eax,%edx
    8f3c:	89 d0                	mov    %edx,%eax
    8f3e:	89 c2                	mov    %eax,%edx
    8f40:	89 d0                	mov    %edx,%eax
    8f42:	c1 e0 03             	shl    $0x3,%eax
    8f45:	01 d0                	add    %edx,%eax
    8f47:	c1 e0 03             	shl    $0x3,%eax
    8f4a:	89 c2                	mov    %eax,%edx
    8f4c:	8b 45 08             	mov    0x8(%ebp),%eax
    8f4f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8f52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8f55:	8d 48 02             	lea    0x2(%eax),%ecx
    8f58:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f5d:	89 c8                	mov    %ecx,%eax
    8f5f:	f7 ea                	imul   %edx
    8f61:	c1 fa 02             	sar    $0x2,%edx
    8f64:	89 c8                	mov    %ecx,%eax
    8f66:	c1 f8 1f             	sar    $0x1f,%eax
    8f69:	29 c2                	sub    %eax,%edx
    8f6b:	89 d0                	mov    %edx,%eax
    8f6d:	c1 e0 03             	shl    $0x3,%eax
    8f70:	01 d0                	add    %edx,%eax
    8f72:	01 c0                	add    %eax,%eax
    8f74:	29 c1                	sub    %eax,%ecx
    8f76:	89 ca                	mov    %ecx,%edx
    8f78:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8f7b:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    8f7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8f81:	8d 48 03             	lea    0x3(%eax),%ecx
    8f84:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f89:	89 c8                	mov    %ecx,%eax
    8f8b:	f7 ea                	imul   %edx
    8f8d:	c1 fa 02             	sar    $0x2,%edx
    8f90:	89 c8                	mov    %ecx,%eax
    8f92:	c1 f8 1f             	sar    $0x1f,%eax
    8f95:	29 c2                	sub    %eax,%edx
    8f97:	89 d0                	mov    %edx,%eax
    8f99:	89 c2                	mov    %eax,%edx
    8f9b:	89 d0                	mov    %edx,%eax
    8f9d:	c1 e0 03             	shl    $0x3,%eax
    8fa0:	01 d0                	add    %edx,%eax
    8fa2:	c1 e0 03             	shl    $0x3,%eax
    8fa5:	89 c2                	mov    %eax,%edx
    8fa7:	8b 45 08             	mov    0x8(%ebp),%eax
    8faa:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8fad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8fb0:	8d 48 03             	lea    0x3(%eax),%ecx
    8fb3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8fb8:	89 c8                	mov    %ecx,%eax
    8fba:	f7 ea                	imul   %edx
    8fbc:	c1 fa 02             	sar    $0x2,%edx
    8fbf:	89 c8                	mov    %ecx,%eax
    8fc1:	c1 f8 1f             	sar    $0x1f,%eax
    8fc4:	29 c2                	sub    %eax,%edx
    8fc6:	89 d0                	mov    %edx,%eax
    8fc8:	c1 e0 03             	shl    $0x3,%eax
    8fcb:	01 d0                	add    %edx,%eax
    8fcd:	01 c0                	add    %eax,%eax
    8fcf:	29 c1                	sub    %eax,%ecx
    8fd1:	89 ca                	mov    %ecx,%edx
    8fd3:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8fd6:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    8fd9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    8fdd:	e8 5b d3 ff ff       	call   633d <hsstell>
    8fe2:	89 c3                	mov    %eax,%ebx
    8fe4:	8b 75 0c             	mov    0xc(%ebp),%esi
    8fe7:	8b 45 14             	mov    0x14(%ebp),%eax
    8fea:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8fed:	89 c2                	mov    %eax,%edx
    8fef:	c1 e2 03             	shl    $0x3,%edx
    8ff2:	01 c2                	add    %eax,%edx
    8ff4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8ffb:	89 c2                	mov    %eax,%edx
    8ffd:	89 c8                	mov    %ecx,%eax
    8fff:	c1 e0 02             	shl    $0x2,%eax
    9002:	01 c8                	add    %ecx,%eax
    9004:	c1 e0 05             	shl    $0x5,%eax
    9007:	01 d0                	add    %edx,%eax
    9009:	01 f0                	add    %esi,%eax
    900b:	83 c0 18             	add    $0x18,%eax
    900e:	8b 10                	mov    (%eax),%edx
    9010:	8b 45 18             	mov    0x18(%ebp),%eax
    9013:	01 d0                	add    %edx,%eax
    9015:	39 c3                	cmp    %eax,%ebx
    9017:	73 0d                	jae    9026 <III_hufman_decode+0x55f>
    9019:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    9020:	0f 8e 26 fe ff ff    	jle    8e4c <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    9026:	e8 12 d3 ff ff       	call   633d <hsstell>
    902b:	89 c3                	mov    %eax,%ebx
    902d:	8b 75 0c             	mov    0xc(%ebp),%esi
    9030:	8b 45 14             	mov    0x14(%ebp),%eax
    9033:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9036:	89 c2                	mov    %eax,%edx
    9038:	c1 e2 03             	shl    $0x3,%edx
    903b:	01 c2                	add    %eax,%edx
    903d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9044:	89 c2                	mov    %eax,%edx
    9046:	89 c8                	mov    %ecx,%eax
    9048:	c1 e0 02             	shl    $0x2,%eax
    904b:	01 c8                	add    %ecx,%eax
    904d:	c1 e0 05             	shl    $0x5,%eax
    9050:	01 d0                	add    %edx,%eax
    9052:	01 f0                	add    %esi,%eax
    9054:	83 c0 18             	add    $0x18,%eax
    9057:	8b 10                	mov    (%eax),%edx
    9059:	8b 45 18             	mov    0x18(%ebp),%eax
    905c:	01 d0                	add    %edx,%eax
    905e:	39 c3                	cmp    %eax,%ebx
    9060:	76 48                	jbe    90aa <III_hufman_decode+0x5e3>
   {  i -=4;
    9062:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    9066:	e8 d2 d2 ff ff       	call   633d <hsstell>
    906b:	8b 55 18             	mov    0x18(%ebp),%edx
    906e:	29 d0                	sub    %edx,%eax
    9070:	89 c6                	mov    %eax,%esi
    9072:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9075:	8b 45 14             	mov    0x14(%ebp),%eax
    9078:	8b 4d 10             	mov    0x10(%ebp),%ecx
    907b:	89 c2                	mov    %eax,%edx
    907d:	c1 e2 03             	shl    $0x3,%edx
    9080:	01 c2                	add    %eax,%edx
    9082:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9089:	89 c2                	mov    %eax,%edx
    908b:	89 c8                	mov    %ecx,%eax
    908d:	c1 e0 02             	shl    $0x2,%eax
    9090:	01 c8                	add    %ecx,%eax
    9092:	c1 e0 05             	shl    $0x5,%eax
    9095:	01 d0                	add    %edx,%eax
    9097:	01 d8                	add    %ebx,%eax
    9099:	83 c0 18             	add    $0x18,%eax
    909c:	8b 00                	mov    (%eax),%eax
    909e:	29 c6                	sub    %eax,%esi
    90a0:	89 f0                	mov    %esi,%eax
    90a2:	89 04 24             	mov    %eax,(%esp)
    90a5:	e8 de d2 ff ff       	call   6388 <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    90aa:	e8 8e d2 ff ff       	call   633d <hsstell>
    90af:	89 c3                	mov    %eax,%ebx
    90b1:	8b 75 0c             	mov    0xc(%ebp),%esi
    90b4:	8b 45 14             	mov    0x14(%ebp),%eax
    90b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    90ba:	89 c2                	mov    %eax,%edx
    90bc:	c1 e2 03             	shl    $0x3,%edx
    90bf:	01 c2                	add    %eax,%edx
    90c1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    90c8:	89 c2                	mov    %eax,%edx
    90ca:	89 c8                	mov    %ecx,%eax
    90cc:	c1 e0 02             	shl    $0x2,%eax
    90cf:	01 c8                	add    %ecx,%eax
    90d1:	c1 e0 05             	shl    $0x5,%eax
    90d4:	01 d0                	add    %edx,%eax
    90d6:	01 f0                	add    %esi,%eax
    90d8:	83 c0 18             	add    $0x18,%eax
    90db:	8b 10                	mov    (%eax),%edx
    90dd:	8b 45 18             	mov    0x18(%ebp),%eax
    90e0:	01 d0                	add    %edx,%eax
    90e2:	39 c3                	cmp    %eax,%ebx
    90e4:	73 45                	jae    912b <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    90e6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    90e9:	8b 45 14             	mov    0x14(%ebp),%eax
    90ec:	8b 4d 10             	mov    0x10(%ebp),%ecx
    90ef:	89 c2                	mov    %eax,%edx
    90f1:	c1 e2 03             	shl    $0x3,%edx
    90f4:	01 c2                	add    %eax,%edx
    90f6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    90fd:	89 c2                	mov    %eax,%edx
    90ff:	89 c8                	mov    %ecx,%eax
    9101:	c1 e0 02             	shl    $0x2,%eax
    9104:	01 c8                	add    %ecx,%eax
    9106:	c1 e0 05             	shl    $0x5,%eax
    9109:	01 d0                	add    %edx,%eax
    910b:	01 d8                	add    %ebx,%eax
    910d:	83 c0 18             	add    $0x18,%eax
    9110:	8b 10                	mov    (%eax),%edx
    9112:	8b 45 18             	mov    0x18(%ebp),%eax
    9115:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9118:	e8 20 d2 ff ff       	call   633d <hsstell>
    911d:	29 c3                	sub    %eax,%ebx
    911f:	89 d8                	mov    %ebx,%eax
    9121:	89 04 24             	mov    %eax,(%esp)
    9124:	e8 30 d2 ff ff       	call   6359 <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9129:	eb 5c                	jmp    9187 <III_hufman_decode+0x6c0>
    912b:	eb 5a                	jmp    9187 <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    912d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9130:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9135:	89 c8                	mov    %ecx,%eax
    9137:	f7 ea                	imul   %edx
    9139:	c1 fa 02             	sar    $0x2,%edx
    913c:	89 c8                	mov    %ecx,%eax
    913e:	c1 f8 1f             	sar    $0x1f,%eax
    9141:	29 c2                	sub    %eax,%edx
    9143:	89 d0                	mov    %edx,%eax
    9145:	89 c2                	mov    %eax,%edx
    9147:	89 d0                	mov    %edx,%eax
    9149:	c1 e0 03             	shl    $0x3,%eax
    914c:	01 d0                	add    %edx,%eax
    914e:	c1 e0 03             	shl    $0x3,%eax
    9151:	89 c2                	mov    %eax,%edx
    9153:	8b 45 08             	mov    0x8(%ebp),%eax
    9156:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9159:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    915c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9161:	89 c8                	mov    %ecx,%eax
    9163:	f7 ea                	imul   %edx
    9165:	c1 fa 02             	sar    $0x2,%edx
    9168:	89 c8                	mov    %ecx,%eax
    916a:	c1 f8 1f             	sar    $0x1f,%eax
    916d:	29 c2                	sub    %eax,%edx
    916f:	89 d0                	mov    %edx,%eax
    9171:	c1 e0 03             	shl    $0x3,%eax
    9174:	01 d0                	add    %edx,%eax
    9176:	01 c0                	add    %eax,%eax
    9178:	29 c1                	sub    %eax,%ecx
    917a:	89 ca                	mov    %ecx,%edx
    917c:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9183:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9187:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    918e:	7e 9d                	jle    912d <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    9190:	83 c4 4c             	add    $0x4c,%esp
    9193:	5b                   	pop    %ebx
    9194:	5e                   	pop    %esi
    9195:	5f                   	pop    %edi
    9196:	5d                   	pop    %ebp
    9197:	c3                   	ret    

00009198 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    9198:	55                   	push   %ebp
    9199:	89 e5                	mov    %esp,%ebp
    919b:	56                   	push   %esi
    919c:	53                   	push   %ebx
    919d:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    91a0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    91a7:	8b 45 1c             	mov    0x1c(%ebp),%eax
    91aa:	8b 00                	mov    (%eax),%eax
    91ac:	8b 40 10             	mov    0x10(%eax),%eax
    91af:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    91b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    91b9:	8b 45 14             	mov    0x14(%ebp),%eax
    91bc:	8b 40 10             	mov    0x10(%eax),%eax
    91bf:	85 c0                	test   %eax,%eax
    91c1:	74 61                	je     9224 <III_dequantize_sample+0x8c>
    91c3:	8b 45 14             	mov    0x14(%ebp),%eax
    91c6:	8b 40 14             	mov    0x14(%eax),%eax
    91c9:	83 f8 02             	cmp    $0x2,%eax
    91cc:	75 56                	jne    9224 <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    91ce:	8b 45 14             	mov    0x14(%ebp),%eax
    91d1:	8b 40 18             	mov    0x18(%eax),%eax
    91d4:	85 c0                	test   %eax,%eax
    91d6:	74 15                	je     91ed <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    91d8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    91db:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    91e1:	05 04 02 01 00       	add    $0x10204,%eax
    91e6:	8b 00                	mov    (%eax),%eax
    91e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    91eb:	eb 4a                	jmp    9237 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    91ed:	8b 45 dc             	mov    -0x24(%ebp),%eax
    91f0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    91f6:	05 54 02 01 00       	add    $0x10254,%eax
    91fb:	8b 50 0c             	mov    0xc(%eax),%edx
    91fe:	89 d0                	mov    %edx,%eax
    9200:	01 c0                	add    %eax,%eax
    9202:	01 d0                	add    %edx,%eax
    9204:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    9207:	8b 45 dc             	mov    -0x24(%ebp),%eax
    920a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9210:	05 54 02 01 00       	add    $0x10254,%eax
    9215:	8b 40 0c             	mov    0xc(%eax),%eax
    9218:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    921b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9222:	eb 13                	jmp    9237 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9224:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9227:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    922d:	05 04 02 01 00       	add    $0x10204,%eax
    9232:	8b 00                	mov    (%eax),%eax
    9234:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    9237:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    923e:	e9 3d 06 00 00       	jmp    9880 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    9243:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    924a:	e9 23 06 00 00       	jmp    9872 <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    924f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9252:	89 d0                	mov    %edx,%eax
    9254:	c1 e0 03             	shl    $0x3,%eax
    9257:	01 d0                	add    %edx,%eax
    9259:	01 c0                	add    %eax,%eax
    925b:	89 c2                	mov    %eax,%edx
    925d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9260:	01 d0                	add    %edx,%eax
    9262:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9265:	0f 85 9e 02 00 00    	jne    9509 <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    926b:	8b 45 14             	mov    0x14(%ebp),%eax
    926e:	8b 40 10             	mov    0x10(%eax),%eax
    9271:	85 c0                	test   %eax,%eax
    9273:	0f 84 6b 02 00 00    	je     94e4 <III_dequantize_sample+0x34c>
    9279:	8b 45 14             	mov    0x14(%ebp),%eax
    927c:	8b 40 14             	mov    0x14(%eax),%eax
    927f:	83 f8 02             	cmp    $0x2,%eax
    9282:	0f 85 5c 02 00 00    	jne    94e4 <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    9288:	8b 45 14             	mov    0x14(%ebp),%eax
    928b:	8b 40 18             	mov    0x18(%eax),%eax
    928e:	85 c0                	test   %eax,%eax
    9290:	0f 84 af 01 00 00    	je     9445 <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    9296:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9299:	89 d0                	mov    %edx,%eax
    929b:	c1 e0 03             	shl    $0x3,%eax
    929e:	01 d0                	add    %edx,%eax
    92a0:	01 c0                	add    %eax,%eax
    92a2:	89 c2                	mov    %eax,%edx
    92a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92a7:	01 c2                	add    %eax,%edx
    92a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    92ac:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    92b2:	05 20 02 01 00       	add    $0x10220,%eax
    92b7:	8b 00                	mov    (%eax),%eax
    92b9:	39 c2                	cmp    %eax,%edx
    92bb:	0f 85 93 00 00 00    	jne    9354 <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    92c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    92c4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    92ca:	05 60 02 01 00       	add    $0x10260,%eax
    92cf:	8b 50 0c             	mov    0xc(%eax),%edx
    92d2:	89 d0                	mov    %edx,%eax
    92d4:	01 c0                	add    %eax,%eax
    92d6:	01 d0                	add    %edx,%eax
    92d8:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    92db:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    92e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    92e5:	8d 48 01             	lea    0x1(%eax),%ecx
    92e8:	8b 55 dc             	mov    -0x24(%ebp),%edx
    92eb:	89 d0                	mov    %edx,%eax
    92ed:	c1 e0 03             	shl    $0x3,%eax
    92f0:	01 d0                	add    %edx,%eax
    92f2:	c1 e0 02             	shl    $0x2,%eax
    92f5:	01 d0                	add    %edx,%eax
    92f7:	01 c8                	add    %ecx,%eax
    92f9:	83 c0 14             	add    $0x14,%eax
    92fc:	8b 0c 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    9303:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9306:	89 d0                	mov    %edx,%eax
    9308:	c1 e0 03             	shl    $0x3,%eax
    930b:	01 d0                	add    %edx,%eax
    930d:	c1 e0 02             	shl    $0x2,%eax
    9310:	01 d0                	add    %edx,%eax
    9312:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9315:	01 d0                	add    %edx,%eax
    9317:	83 c0 14             	add    $0x14,%eax
    931a:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9321:	29 c1                	sub    %eax,%ecx
    9323:	89 c8                	mov    %ecx,%eax
    9325:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9328:	8b 55 dc             	mov    -0x24(%ebp),%edx
    932b:	89 d0                	mov    %edx,%eax
    932d:	c1 e0 03             	shl    $0x3,%eax
    9330:	01 d0                	add    %edx,%eax
    9332:	c1 e0 02             	shl    $0x2,%eax
    9335:	01 d0                	add    %edx,%eax
    9337:	8b 55 ec             	mov    -0x14(%ebp),%edx
    933a:	01 d0                	add    %edx,%eax
    933c:	83 c0 14             	add    $0x14,%eax
    933f:	8b 14 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%edx
    9346:	89 d0                	mov    %edx,%eax
    9348:	01 c0                	add    %eax,%eax
    934a:	01 d0                	add    %edx,%eax
    934c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    934f:	e9 8e 01 00 00       	jmp    94e2 <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    9354:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9357:	89 d0                	mov    %edx,%eax
    9359:	c1 e0 03             	shl    $0x3,%eax
    935c:	01 d0                	add    %edx,%eax
    935e:	01 c0                	add    %eax,%eax
    9360:	89 c2                	mov    %eax,%edx
    9362:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9365:	01 c2                	add    %eax,%edx
    9367:	8b 45 dc             	mov    -0x24(%ebp),%eax
    936a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9370:	05 20 02 01 00       	add    $0x10220,%eax
    9375:	8b 00                	mov    (%eax),%eax
    9377:	39 c2                	cmp    %eax,%edx
    9379:	7d 2a                	jge    93a5 <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    937b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    937f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9382:	8d 48 01             	lea    0x1(%eax),%ecx
    9385:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9388:	89 d0                	mov    %edx,%eax
    938a:	c1 e0 03             	shl    $0x3,%eax
    938d:	01 d0                	add    %edx,%eax
    938f:	c1 e0 02             	shl    $0x2,%eax
    9392:	01 d0                	add    %edx,%eax
    9394:	01 c8                	add    %ecx,%eax
    9396:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    939d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    93a0:	e9 3d 01 00 00       	jmp    94e2 <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    93a5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    93a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    93ac:	8d 48 01             	lea    0x1(%eax),%ecx
    93af:	8b 55 dc             	mov    -0x24(%ebp),%edx
    93b2:	89 d0                	mov    %edx,%eax
    93b4:	c1 e0 03             	shl    $0x3,%eax
    93b7:	01 d0                	add    %edx,%eax
    93b9:	c1 e0 02             	shl    $0x2,%eax
    93bc:	01 d0                	add    %edx,%eax
    93be:	01 c8                	add    %ecx,%eax
    93c0:	83 c0 14             	add    $0x14,%eax
    93c3:	8b 14 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%edx
    93ca:	89 d0                	mov    %edx,%eax
    93cc:	01 c0                	add    %eax,%eax
    93ce:	01 d0                	add    %edx,%eax
    93d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    93d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    93d6:	8d 48 01             	lea    0x1(%eax),%ecx
    93d9:	8b 55 dc             	mov    -0x24(%ebp),%edx
    93dc:	89 d0                	mov    %edx,%eax
    93de:	c1 e0 03             	shl    $0x3,%eax
    93e1:	01 d0                	add    %edx,%eax
    93e3:	c1 e0 02             	shl    $0x2,%eax
    93e6:	01 d0                	add    %edx,%eax
    93e8:	01 c8                	add    %ecx,%eax
    93ea:	83 c0 14             	add    $0x14,%eax
    93ed:	8b 0c 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    93f4:	8b 55 dc             	mov    -0x24(%ebp),%edx
    93f7:	89 d0                	mov    %edx,%eax
    93f9:	c1 e0 03             	shl    $0x3,%eax
    93fc:	01 d0                	add    %edx,%eax
    93fe:	c1 e0 02             	shl    $0x2,%eax
    9401:	01 d0                	add    %edx,%eax
    9403:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9406:	01 d0                	add    %edx,%eax
    9408:	83 c0 14             	add    $0x14,%eax
    940b:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9412:	29 c1                	sub    %eax,%ecx
    9414:	89 c8                	mov    %ecx,%eax
    9416:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9419:	8b 55 dc             	mov    -0x24(%ebp),%edx
    941c:	89 d0                	mov    %edx,%eax
    941e:	c1 e0 03             	shl    $0x3,%eax
    9421:	01 d0                	add    %edx,%eax
    9423:	c1 e0 02             	shl    $0x2,%eax
    9426:	01 d0                	add    %edx,%eax
    9428:	8b 55 ec             	mov    -0x14(%ebp),%edx
    942b:	01 d0                	add    %edx,%eax
    942d:	83 c0 14             	add    $0x14,%eax
    9430:	8b 14 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%edx
    9437:	89 d0                	mov    %edx,%eax
    9439:	01 c0                	add    %eax,%eax
    943b:	01 d0                	add    %edx,%eax
    943d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    9440:	e9 c4 00 00 00       	jmp    9509 <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    9445:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9449:	8b 45 ec             	mov    -0x14(%ebp),%eax
    944c:	8d 48 01             	lea    0x1(%eax),%ecx
    944f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9452:	89 d0                	mov    %edx,%eax
    9454:	c1 e0 03             	shl    $0x3,%eax
    9457:	01 d0                	add    %edx,%eax
    9459:	c1 e0 02             	shl    $0x2,%eax
    945c:	01 d0                	add    %edx,%eax
    945e:	01 c8                	add    %ecx,%eax
    9460:	83 c0 14             	add    $0x14,%eax
    9463:	8b 14 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%edx
    946a:	89 d0                	mov    %edx,%eax
    946c:	01 c0                	add    %eax,%eax
    946e:	01 d0                	add    %edx,%eax
    9470:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    9473:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9476:	8d 48 01             	lea    0x1(%eax),%ecx
    9479:	8b 55 dc             	mov    -0x24(%ebp),%edx
    947c:	89 d0                	mov    %edx,%eax
    947e:	c1 e0 03             	shl    $0x3,%eax
    9481:	01 d0                	add    %edx,%eax
    9483:	c1 e0 02             	shl    $0x2,%eax
    9486:	01 d0                	add    %edx,%eax
    9488:	01 c8                	add    %ecx,%eax
    948a:	83 c0 14             	add    $0x14,%eax
    948d:	8b 0c 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    9494:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9497:	89 d0                	mov    %edx,%eax
    9499:	c1 e0 03             	shl    $0x3,%eax
    949c:	01 d0                	add    %edx,%eax
    949e:	c1 e0 02             	shl    $0x2,%eax
    94a1:	01 d0                	add    %edx,%eax
    94a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    94a6:	01 d0                	add    %edx,%eax
    94a8:	83 c0 14             	add    $0x14,%eax
    94ab:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    94b2:	29 c1                	sub    %eax,%ecx
    94b4:	89 c8                	mov    %ecx,%eax
    94b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    94b9:	8b 55 dc             	mov    -0x24(%ebp),%edx
    94bc:	89 d0                	mov    %edx,%eax
    94be:	c1 e0 03             	shl    $0x3,%eax
    94c1:	01 d0                	add    %edx,%eax
    94c3:	c1 e0 02             	shl    $0x2,%eax
    94c6:	01 d0                	add    %edx,%eax
    94c8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    94cb:	01 d0                	add    %edx,%eax
    94cd:	83 c0 14             	add    $0x14,%eax
    94d0:	8b 14 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%edx
    94d7:	89 d0                	mov    %edx,%eax
    94d9:	01 c0                	add    %eax,%eax
    94db:	01 d0                	add    %edx,%eax
    94dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    94e0:	eb 27                	jmp    9509 <III_dequantize_sample+0x371>
    94e2:	eb 25                	jmp    9509 <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    94e4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    94e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    94eb:	8d 48 01             	lea    0x1(%eax),%ecx
    94ee:	8b 55 dc             	mov    -0x24(%ebp),%edx
    94f1:	89 d0                	mov    %edx,%eax
    94f3:	c1 e0 03             	shl    $0x3,%eax
    94f6:	01 d0                	add    %edx,%eax
    94f8:	c1 e0 02             	shl    $0x2,%eax
    94fb:	01 d0                	add    %edx,%eax
    94fd:	01 c8                	add    %ecx,%eax
    94ff:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    9506:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    9509:	8b 55 f0             	mov    -0x10(%ebp),%edx
    950c:	89 d0                	mov    %edx,%eax
    950e:	c1 e0 03             	shl    $0x3,%eax
    9511:	01 d0                	add    %edx,%eax
    9513:	c1 e0 04             	shl    $0x4,%eax
    9516:	89 c2                	mov    %eax,%edx
    9518:	8b 45 0c             	mov    0xc(%ebp),%eax
    951b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    951e:	8b 45 14             	mov    0x14(%ebp),%eax
    9521:	8b 40 08             	mov    0x8(%eax),%eax
    9524:	ba 00 00 00 00       	mov    $0x0,%edx
    9529:	89 45 c8             	mov    %eax,-0x38(%ebp)
    952c:	89 55 cc             	mov    %edx,-0x34(%ebp)
    952f:	df 6d c8             	fildll -0x38(%ebp)
    9532:	dd 05 30 e6 00 00    	fldl   0xe630
    9538:	de e9                	fsubrp %st,%st(1)
    953a:	dd 05 38 e6 00 00    	fldl   0xe638
    9540:	de c9                	fmulp  %st,%st(1)
    9542:	dd 5c 24 08          	fstpl  0x8(%esp)
    9546:	dd 05 40 e6 00 00    	fldl   0xe640
    954c:	dd 1c 24             	fstpl  (%esp)
    954f:	e8 0c c1 ff ff       	call   5660 <pow>
    9554:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9557:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    955a:	8b 45 14             	mov    0x14(%ebp),%eax
    955d:	8b 40 10             	mov    0x10(%eax),%eax
    9560:	85 c0                	test   %eax,%eax
    9562:	0f 84 86 01 00 00    	je     96ee <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9568:	8b 45 14             	mov    0x14(%ebp),%eax
    956b:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    956e:	83 f8 02             	cmp    $0x2,%eax
    9571:	75 0a                	jne    957d <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9573:	8b 45 14             	mov    0x14(%ebp),%eax
    9576:	8b 40 18             	mov    0x18(%eax),%eax
    9579:	85 c0                	test   %eax,%eax
    957b:	74 27                	je     95a4 <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    957d:	8b 45 14             	mov    0x14(%ebp),%eax
    9580:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9583:	83 f8 02             	cmp    $0x2,%eax
    9586:	0f 85 62 01 00 00    	jne    96ee <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    958c:	8b 45 14             	mov    0x14(%ebp),%eax
    958f:	8b 40 18             	mov    0x18(%eax),%eax
    9592:	85 c0                	test   %eax,%eax
    9594:	0f 84 54 01 00 00    	je     96ee <III_dequantize_sample+0x556>
    959a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    959e:	0f 8e 4a 01 00 00    	jle    96ee <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    95a4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    95a7:	89 d0                	mov    %edx,%eax
    95a9:	c1 e0 03             	shl    $0x3,%eax
    95ac:	01 d0                	add    %edx,%eax
    95ae:	c1 e0 04             	shl    $0x4,%eax
    95b1:	89 c2                	mov    %eax,%edx
    95b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    95b6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    95b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    95bc:	89 d0                	mov    %edx,%eax
    95be:	c1 e0 03             	shl    $0x3,%eax
    95c1:	01 d0                	add    %edx,%eax
    95c3:	c1 e0 04             	shl    $0x4,%eax
    95c6:	89 c2                	mov    %eax,%edx
    95c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    95cb:	01 c2                	add    %eax,%edx
    95cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95d0:	dd 04 c2             	fldl   (%edx,%eax,8)
    95d3:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    95d6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    95d9:	89 d0                	mov    %edx,%eax
    95db:	c1 e0 03             	shl    $0x3,%eax
    95de:	01 d0                	add    %edx,%eax
    95e0:	01 c0                	add    %eax,%eax
    95e2:	89 c2                	mov    %eax,%edx
    95e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95e7:	01 d0                	add    %edx,%eax
    95e9:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    95ec:	99                   	cltd   
    95ed:	f7 7d e0             	idivl  -0x20(%ebp)
    95f0:	89 c2                	mov    %eax,%edx
    95f2:	8b 45 14             	mov    0x14(%ebp),%eax
    95f5:	83 c2 08             	add    $0x8,%edx
    95f8:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    95fc:	ba 00 00 00 00       	mov    $0x0,%edx
    9601:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9604:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9607:	df 6d c8             	fildll -0x38(%ebp)
    960a:	dd 05 48 e6 00 00    	fldl   0xe648
    9610:	de c9                	fmulp  %st,%st(1)
    9612:	dd 5c 24 08          	fstpl  0x8(%esp)
    9616:	dd 05 40 e6 00 00    	fldl   0xe640
    961c:	dd 1c 24             	fstpl  (%esp)
    961f:	e8 3c c0 ff ff       	call   5660 <pow>
    9624:	dc 4d c0             	fmull  -0x40(%ebp)
    9627:	8b 45 f4             	mov    -0xc(%ebp),%eax
    962a:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    962d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9630:	89 d0                	mov    %edx,%eax
    9632:	c1 e0 03             	shl    $0x3,%eax
    9635:	01 d0                	add    %edx,%eax
    9637:	c1 e0 04             	shl    $0x4,%eax
    963a:	89 c2                	mov    %eax,%edx
    963c:	8b 45 0c             	mov    0xc(%ebp),%eax
    963f:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9642:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9645:	89 d0                	mov    %edx,%eax
    9647:	c1 e0 03             	shl    $0x3,%eax
    964a:	01 d0                	add    %edx,%eax
    964c:	c1 e0 04             	shl    $0x4,%eax
    964f:	89 c2                	mov    %eax,%edx
    9651:	8b 45 0c             	mov    0xc(%ebp),%eax
    9654:	01 c2                	add    %eax,%edx
    9656:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9659:	dd 04 c2             	fldl   (%edx,%eax,8)
    965c:	dd 5d c0             	fstpl  -0x40(%ebp)
    965f:	8b 45 14             	mov    0x14(%ebp),%eax
    9662:	8b 40 40             	mov    0x40(%eax),%eax
    9665:	ba 00 00 00 00       	mov    $0x0,%edx
    966a:	89 45 c8             	mov    %eax,-0x38(%ebp)
    966d:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9670:	df 6d c8             	fildll -0x38(%ebp)
    9673:	d9 e8                	fld1   
    9675:	de c1                	faddp  %st,%st(1)
    9677:	dd 05 50 e6 00 00    	fldl   0xe650
    967d:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    967f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9682:	89 d0                	mov    %edx,%eax
    9684:	c1 e0 03             	shl    $0x3,%eax
    9687:	01 d0                	add    %edx,%eax
    9689:	01 c0                	add    %eax,%eax
    968b:	89 c2                	mov    %eax,%edx
    968d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9690:	01 d0                	add    %edx,%eax
    9692:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    9695:	99                   	cltd   
    9696:	f7 7d e0             	idivl  -0x20(%ebp)
    9699:	89 c2                	mov    %eax,%edx
    969b:	8b 5d 10             	mov    0x10(%ebp),%ebx
    969e:	8b 4d 18             	mov    0x18(%ebp),%ecx
    96a1:	89 d0                	mov    %edx,%eax
    96a3:	01 c0                	add    %eax,%eax
    96a5:	01 d0                	add    %edx,%eax
    96a7:	c1 e0 02             	shl    $0x2,%eax
    96aa:	01 d0                	add    %edx,%eax
    96ac:	89 ca                	mov    %ecx,%edx
    96ae:	01 d2                	add    %edx,%edx
    96b0:	89 d1                	mov    %edx,%ecx
    96b2:	c1 e1 05             	shl    $0x5,%ecx
    96b5:	29 d1                	sub    %edx,%ecx
    96b7:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    96ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    96bd:	01 d0                	add    %edx,%eax
    96bf:	83 c0 14             	add    $0x14,%eax
    96c2:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    96c6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    96c9:	db 45 d4             	fildl  -0x2c(%ebp)
    96cc:	de c9                	fmulp  %st,%st(1)
    96ce:	dd 5c 24 08          	fstpl  0x8(%esp)
    96d2:	dd 05 40 e6 00 00    	fldl   0xe640
    96d8:	dd 1c 24             	fstpl  (%esp)
    96db:	e8 80 bf ff ff       	call   5660 <pow>
    96e0:	dc 4d c0             	fmull  -0x40(%ebp)
    96e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    96e6:	dd 1c c6             	fstpl  (%esi,%eax,8)
    96e9:	e9 ab 00 00 00       	jmp    9799 <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    96ee:	8b 55 f0             	mov    -0x10(%ebp),%edx
    96f1:	89 d0                	mov    %edx,%eax
    96f3:	c1 e0 03             	shl    $0x3,%eax
    96f6:	01 d0                	add    %edx,%eax
    96f8:	c1 e0 04             	shl    $0x4,%eax
    96fb:	89 c2                	mov    %eax,%edx
    96fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    9700:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9703:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9706:	89 d0                	mov    %edx,%eax
    9708:	c1 e0 03             	shl    $0x3,%eax
    970b:	01 d0                	add    %edx,%eax
    970d:	c1 e0 04             	shl    $0x4,%eax
    9710:	89 c2                	mov    %eax,%edx
    9712:	8b 45 0c             	mov    0xc(%ebp),%eax
    9715:	01 c2                	add    %eax,%edx
    9717:	8b 45 f4             	mov    -0xc(%ebp),%eax
    971a:	dd 04 c2             	fldl   (%edx,%eax,8)
    971d:	dd 5d c0             	fstpl  -0x40(%ebp)
    9720:	8b 45 14             	mov    0x14(%ebp),%eax
    9723:	8b 40 40             	mov    0x40(%eax),%eax
    9726:	ba 00 00 00 00       	mov    $0x0,%edx
    972b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    972e:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9731:	df 6d c8             	fildll -0x38(%ebp)
    9734:	d9 e8                	fld1   
    9736:	de c1                	faddp  %st,%st(1)
    9738:	dd 05 50 e6 00 00    	fldl   0xe650
    973e:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    9740:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9743:	8b 45 18             	mov    0x18(%ebp),%eax
    9746:	01 c0                	add    %eax,%eax
    9748:	89 c2                	mov    %eax,%edx
    974a:	c1 e2 05             	shl    $0x5,%edx
    974d:	29 c2                	sub    %eax,%edx
    974f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9752:	01 d0                	add    %edx,%eax
    9754:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    9757:	89 c2                	mov    %eax,%edx
    9759:	8b 45 14             	mov    0x14(%ebp),%eax
    975c:	8b 48 3c             	mov    0x3c(%eax),%ecx
    975f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9762:	8b 04 85 c0 03 01 00 	mov    0x103c0(,%eax,4),%eax
    9769:	0f af c1             	imul   %ecx,%eax
    976c:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    976e:	ba 00 00 00 00       	mov    $0x0,%edx
    9773:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9776:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9779:	df 6d c8             	fildll -0x38(%ebp)
    977c:	de c9                	fmulp  %st,%st(1)
    977e:	dd 5c 24 08          	fstpl  0x8(%esp)
    9782:	dd 05 40 e6 00 00    	fldl   0xe640
    9788:	dd 1c 24             	fstpl  (%esp)
    978b:	e8 d0 be ff ff       	call   5660 <pow>
    9790:	dc 4d c0             	fmull  -0x40(%ebp)
    9793:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9796:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    9799:	8b 55 f0             	mov    -0x10(%ebp),%edx
    979c:	89 d0                	mov    %edx,%eax
    979e:	c1 e0 03             	shl    $0x3,%eax
    97a1:	01 d0                	add    %edx,%eax
    97a3:	c1 e0 03             	shl    $0x3,%eax
    97a6:	89 c2                	mov    %eax,%edx
    97a8:	8b 45 08             	mov    0x8(%ebp),%eax
    97ab:	01 c2                	add    %eax,%edx
    97ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97b0:	8b 04 82             	mov    (%edx,%eax,4),%eax
    97b3:	c1 e8 1f             	shr    $0x1f,%eax
    97b6:	0f b6 c0             	movzbl %al,%eax
    97b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    97bc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97bf:	89 d0                	mov    %edx,%eax
    97c1:	c1 e0 03             	shl    $0x3,%eax
    97c4:	01 d0                	add    %edx,%eax
    97c6:	c1 e0 04             	shl    $0x4,%eax
    97c9:	89 c2                	mov    %eax,%edx
    97cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    97ce:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    97d1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97d4:	89 d0                	mov    %edx,%eax
    97d6:	c1 e0 03             	shl    $0x3,%eax
    97d9:	01 d0                	add    %edx,%eax
    97db:	c1 e0 04             	shl    $0x4,%eax
    97de:	89 c2                	mov    %eax,%edx
    97e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    97e3:	01 c2                	add    %eax,%edx
    97e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97e8:	dd 04 c2             	fldl   (%edx,%eax,8)
    97eb:	dd 5d c0             	fstpl  -0x40(%ebp)
    97ee:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97f1:	89 d0                	mov    %edx,%eax
    97f3:	c1 e0 03             	shl    $0x3,%eax
    97f6:	01 d0                	add    %edx,%eax
    97f8:	c1 e0 03             	shl    $0x3,%eax
    97fb:	89 c2                	mov    %eax,%edx
    97fd:	8b 45 08             	mov    0x8(%ebp),%eax
    9800:	01 c2                	add    %eax,%edx
    9802:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9805:	8b 04 82             	mov    (%edx,%eax,4),%eax
    9808:	89 04 24             	mov    %eax,(%esp)
    980b:	e8 47 bd ff ff       	call   5557 <abs>
    9810:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    9813:	db 45 d4             	fildl  -0x2c(%ebp)
    9816:	dd 05 58 e6 00 00    	fldl   0xe658
    981c:	dd 5c 24 08          	fstpl  0x8(%esp)
    9820:	dd 1c 24             	fstpl  (%esp)
    9823:	e8 38 be ff ff       	call   5660 <pow>
    9828:	dc 4d c0             	fmull  -0x40(%ebp)
    982b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    982e:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    9831:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    9835:	74 37                	je     986e <III_dequantize_sample+0x6d6>
    9837:	8b 55 f0             	mov    -0x10(%ebp),%edx
    983a:	89 d0                	mov    %edx,%eax
    983c:	c1 e0 03             	shl    $0x3,%eax
    983f:	01 d0                	add    %edx,%eax
    9841:	c1 e0 04             	shl    $0x4,%eax
    9844:	89 c2                	mov    %eax,%edx
    9846:	8b 45 0c             	mov    0xc(%ebp),%eax
    9849:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    984c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    984f:	89 d0                	mov    %edx,%eax
    9851:	c1 e0 03             	shl    $0x3,%eax
    9854:	01 d0                	add    %edx,%eax
    9856:	c1 e0 04             	shl    $0x4,%eax
    9859:	89 c2                	mov    %eax,%edx
    985b:	8b 45 0c             	mov    0xc(%ebp),%eax
    985e:	01 c2                	add    %eax,%edx
    9860:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9863:	dd 04 c2             	fldl   (%edx,%eax,8)
    9866:	d9 e0                	fchs   
    9868:	8b 45 f4             	mov    -0xc(%ebp),%eax
    986b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    986e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9872:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9876:	0f 8e d3 f9 ff ff    	jle    924f <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    987c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9880:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    9884:	0f 8e b9 f9 ff ff    	jle    9243 <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    988a:	83 c4 50             	add    $0x50,%esp
    988d:	5b                   	pop    %ebx
    988e:	5e                   	pop    %esi
    988f:	5d                   	pop    %ebp
    9890:	c3                   	ret    

00009891 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9891:	55                   	push   %ebp
    9892:	89 e5                	mov    %esp,%ebp
    9894:	57                   	push   %edi
    9895:	56                   	push   %esi
    9896:	53                   	push   %ebx
    9897:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    989a:	8b 45 14             	mov    0x14(%ebp),%eax
    989d:	8b 00                	mov    (%eax),%eax
    989f:	8b 40 10             	mov    0x10(%eax),%eax
    98a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    98a5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    98ac:	eb 33                	jmp    98e1 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    98ae:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    98b5:	eb 20                	jmp    98d7 <III_reorder+0x46>
         ro[sb][ss] = 0;
    98b7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    98ba:	89 d0                	mov    %edx,%eax
    98bc:	c1 e0 03             	shl    $0x3,%eax
    98bf:	01 d0                	add    %edx,%eax
    98c1:	c1 e0 04             	shl    $0x4,%eax
    98c4:	89 c2                	mov    %eax,%edx
    98c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    98c9:	01 c2                	add    %eax,%edx
    98cb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    98ce:	d9 ee                	fldz   
    98d0:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    98d3:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    98d7:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    98db:	7e da                	jle    98b7 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    98dd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    98e1:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    98e5:	7e c7                	jle    98ae <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    98e7:	8b 45 10             	mov    0x10(%ebp),%eax
    98ea:	8b 40 10             	mov    0x10(%eax),%eax
    98ed:	85 c0                	test   %eax,%eax
    98ef:	0f 84 af 03 00 00    	je     9ca4 <III_reorder+0x413>
    98f5:	8b 45 10             	mov    0x10(%ebp),%eax
    98f8:	8b 40 14             	mov    0x14(%eax),%eax
    98fb:	83 f8 02             	cmp    $0x2,%eax
    98fe:	0f 85 a0 03 00 00    	jne    9ca4 <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    9904:	8b 45 10             	mov    0x10(%ebp),%eax
    9907:	8b 40 18             	mov    0x18(%eax),%eax
    990a:	85 c0                	test   %eax,%eax
    990c:	0f 84 00 02 00 00    	je     9b12 <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    9912:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9919:	eb 4c                	jmp    9967 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    991b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9922:	eb 39                	jmp    995d <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    9924:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9927:	89 d0                	mov    %edx,%eax
    9929:	c1 e0 03             	shl    $0x3,%eax
    992c:	01 d0                	add    %edx,%eax
    992e:	c1 e0 04             	shl    $0x4,%eax
    9931:	89 c2                	mov    %eax,%edx
    9933:	8b 45 0c             	mov    0xc(%ebp),%eax
    9936:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9939:	8b 55 e0             	mov    -0x20(%ebp),%edx
    993c:	89 d0                	mov    %edx,%eax
    993e:	c1 e0 03             	shl    $0x3,%eax
    9941:	01 d0                	add    %edx,%eax
    9943:	c1 e0 04             	shl    $0x4,%eax
    9946:	89 c2                	mov    %eax,%edx
    9948:	8b 45 08             	mov    0x8(%ebp),%eax
    994b:	01 c2                	add    %eax,%edx
    994d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9950:	dd 04 c2             	fldl   (%edx,%eax,8)
    9953:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9956:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    9959:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    995d:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9961:	7e c1                	jle    9924 <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    9963:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9967:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    996b:	7e ae                	jle    991b <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    996d:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    9974:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9977:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    997d:	05 5c 02 01 00       	add    $0x1025c,%eax
    9982:	8b 40 0c             	mov    0xc(%eax),%eax
    9985:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    9988:	8b 45 d0             	mov    -0x30(%ebp),%eax
    998b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9991:	05 60 02 01 00       	add    $0x10260,%eax
    9996:	8b 40 0c             	mov    0xc(%eax),%eax
    9999:	2b 45 e8             	sub    -0x18(%ebp),%eax
    999c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    999f:	e9 5f 01 00 00       	jmp    9b03 <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    99a4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    99ab:	e9 fd 00 00 00       	jmp    9aad <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    99b0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    99b7:	e9 e1 00 00 00       	jmp    9a9d <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    99bc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    99bf:	89 d0                	mov    %edx,%eax
    99c1:	01 c0                	add    %eax,%eax
    99c3:	01 c2                	add    %eax,%edx
    99c5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    99c8:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    99cc:	01 c2                	add    %eax,%edx
    99ce:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    99d1:	01 d0                	add    %edx,%eax
    99d3:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    99d6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    99d9:	89 d0                	mov    %edx,%eax
    99db:	01 c0                	add    %eax,%eax
    99dd:	01 c2                	add    %eax,%edx
    99df:	8b 45 d8             	mov    -0x28(%ebp),%eax
    99e2:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    99e5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    99e8:	89 d0                	mov    %edx,%eax
    99ea:	01 c0                	add    %eax,%eax
    99ec:	01 d0                	add    %edx,%eax
    99ee:	01 c8                	add    %ecx,%eax
    99f0:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    99f3:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    99f6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    99fb:	89 c8                	mov    %ecx,%eax
    99fd:	f7 ea                	imul   %edx
    99ff:	c1 fa 02             	sar    $0x2,%edx
    9a02:	89 c8                	mov    %ecx,%eax
    9a04:	c1 f8 1f             	sar    $0x1f,%eax
    9a07:	29 c2                	sub    %eax,%edx
    9a09:	89 d0                	mov    %edx,%eax
    9a0b:	89 c2                	mov    %eax,%edx
    9a0d:	89 d0                	mov    %edx,%eax
    9a0f:	c1 e0 03             	shl    $0x3,%eax
    9a12:	01 d0                	add    %edx,%eax
    9a14:	c1 e0 04             	shl    $0x4,%eax
    9a17:	89 c2                	mov    %eax,%edx
    9a19:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a1c:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9a1f:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    9a22:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a27:	89 d8                	mov    %ebx,%eax
    9a29:	f7 ea                	imul   %edx
    9a2b:	c1 fa 02             	sar    $0x2,%edx
    9a2e:	89 d8                	mov    %ebx,%eax
    9a30:	c1 f8 1f             	sar    $0x1f,%eax
    9a33:	89 d1                	mov    %edx,%ecx
    9a35:	29 c1                	sub    %eax,%ecx
    9a37:	89 c8                	mov    %ecx,%eax
    9a39:	c1 e0 03             	shl    $0x3,%eax
    9a3c:	01 c8                	add    %ecx,%eax
    9a3e:	01 c0                	add    %eax,%eax
    9a40:	29 c3                	sub    %eax,%ebx
    9a42:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    9a44:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9a47:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a4c:	89 d8                	mov    %ebx,%eax
    9a4e:	f7 ea                	imul   %edx
    9a50:	c1 fa 02             	sar    $0x2,%edx
    9a53:	89 d8                	mov    %ebx,%eax
    9a55:	c1 f8 1f             	sar    $0x1f,%eax
    9a58:	29 c2                	sub    %eax,%edx
    9a5a:	89 d0                	mov    %edx,%eax
    9a5c:	89 c2                	mov    %eax,%edx
    9a5e:	89 d0                	mov    %edx,%eax
    9a60:	c1 e0 03             	shl    $0x3,%eax
    9a63:	01 d0                	add    %edx,%eax
    9a65:	c1 e0 04             	shl    $0x4,%eax
    9a68:	89 c2                	mov    %eax,%edx
    9a6a:	8b 45 08             	mov    0x8(%ebp),%eax
    9a6d:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9a70:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9a73:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a78:	89 d8                	mov    %ebx,%eax
    9a7a:	f7 ea                	imul   %edx
    9a7c:	c1 fa 02             	sar    $0x2,%edx
    9a7f:	89 d8                	mov    %ebx,%eax
    9a81:	c1 f8 1f             	sar    $0x1f,%eax
    9a84:	29 c2                	sub    %eax,%edx
    9a86:	89 d0                	mov    %edx,%eax
    9a88:	c1 e0 03             	shl    $0x3,%eax
    9a8b:	01 d0                	add    %edx,%eax
    9a8d:	01 c0                	add    %eax,%eax
    9a8f:	29 c3                	sub    %eax,%ebx
    9a91:	89 da                	mov    %ebx,%edx
    9a93:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9a96:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9a99:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9a9d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9aa0:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9aa3:	0f 8c 13 ff ff ff    	jl     99bc <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9aa9:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9aad:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9ab1:	0f 8e f9 fe ff ff    	jle    99b0 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9ab7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9abb:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9abe:	89 d0                	mov    %edx,%eax
    9ac0:	c1 e0 03             	shl    $0x3,%eax
    9ac3:	01 d0                	add    %edx,%eax
    9ac5:	c1 e0 02             	shl    $0x2,%eax
    9ac8:	01 d0                	add    %edx,%eax
    9aca:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9acd:	01 d0                	add    %edx,%eax
    9acf:	83 c0 14             	add    $0x14,%eax
    9ad2:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
    9ad9:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9adc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9adf:	8d 48 01             	lea    0x1(%eax),%ecx
    9ae2:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9ae5:	89 d0                	mov    %edx,%eax
    9ae7:	c1 e0 03             	shl    $0x3,%eax
    9aea:	01 d0                	add    %edx,%eax
    9aec:	c1 e0 02             	shl    $0x2,%eax
    9aef:	01 d0                	add    %edx,%eax
    9af1:	01 c8                	add    %ecx,%eax
    9af3:	83 c0 14             	add    $0x14,%eax
    9af6:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
    9afd:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9b00:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9b03:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9b07:	0f 8e 97 fe ff ff    	jle    99a4 <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9b0d:	e9 ed 01 00 00       	jmp    9cff <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    9b12:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9b19:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9b20:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9b23:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b29:	05 54 02 01 00       	add    $0x10254,%eax
    9b2e:	8b 40 0c             	mov    0xc(%eax),%eax
    9b31:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    9b34:	e9 5f 01 00 00       	jmp    9c98 <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9b39:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    9b40:	e9 fd 00 00 00       	jmp    9c42 <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    9b45:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    9b4c:	e9 e1 00 00 00       	jmp    9c32 <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    9b51:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b54:	89 d0                	mov    %edx,%eax
    9b56:	01 c0                	add    %eax,%eax
    9b58:	01 c2                	add    %eax,%edx
    9b5a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9b5d:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    9b61:	01 c2                	add    %eax,%edx
    9b63:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9b66:	01 d0                	add    %edx,%eax
    9b68:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    9b6b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b6e:	89 d0                	mov    %edx,%eax
    9b70:	01 c0                	add    %eax,%eax
    9b72:	01 c2                	add    %eax,%edx
    9b74:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9b77:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9b7a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    9b7d:	89 d0                	mov    %edx,%eax
    9b7f:	01 c0                	add    %eax,%eax
    9b81:	01 d0                	add    %edx,%eax
    9b83:	01 c8                	add    %ecx,%eax
    9b85:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9b88:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    9b8b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9b90:	89 c8                	mov    %ecx,%eax
    9b92:	f7 ea                	imul   %edx
    9b94:	c1 fa 02             	sar    $0x2,%edx
    9b97:	89 c8                	mov    %ecx,%eax
    9b99:	c1 f8 1f             	sar    $0x1f,%eax
    9b9c:	29 c2                	sub    %eax,%edx
    9b9e:	89 d0                	mov    %edx,%eax
    9ba0:	89 c2                	mov    %eax,%edx
    9ba2:	89 d0                	mov    %edx,%eax
    9ba4:	c1 e0 03             	shl    $0x3,%eax
    9ba7:	01 d0                	add    %edx,%eax
    9ba9:	c1 e0 04             	shl    $0x4,%eax
    9bac:	89 c2                	mov    %eax,%edx
    9bae:	8b 45 0c             	mov    0xc(%ebp),%eax
    9bb1:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9bb4:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    9bb7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9bbc:	89 d8                	mov    %ebx,%eax
    9bbe:	f7 ea                	imul   %edx
    9bc0:	c1 fa 02             	sar    $0x2,%edx
    9bc3:	89 d8                	mov    %ebx,%eax
    9bc5:	c1 f8 1f             	sar    $0x1f,%eax
    9bc8:	89 d1                	mov    %edx,%ecx
    9bca:	29 c1                	sub    %eax,%ecx
    9bcc:	89 c8                	mov    %ecx,%eax
    9bce:	c1 e0 03             	shl    $0x3,%eax
    9bd1:	01 c8                	add    %ecx,%eax
    9bd3:	01 c0                	add    %eax,%eax
    9bd5:	29 c3                	sub    %eax,%ebx
    9bd7:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    9bd9:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9bdc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9be1:	89 d8                	mov    %ebx,%eax
    9be3:	f7 ea                	imul   %edx
    9be5:	c1 fa 02             	sar    $0x2,%edx
    9be8:	89 d8                	mov    %ebx,%eax
    9bea:	c1 f8 1f             	sar    $0x1f,%eax
    9bed:	29 c2                	sub    %eax,%edx
    9bef:	89 d0                	mov    %edx,%eax
    9bf1:	89 c2                	mov    %eax,%edx
    9bf3:	89 d0                	mov    %edx,%eax
    9bf5:	c1 e0 03             	shl    $0x3,%eax
    9bf8:	01 d0                	add    %edx,%eax
    9bfa:	c1 e0 04             	shl    $0x4,%eax
    9bfd:	89 c2                	mov    %eax,%edx
    9bff:	8b 45 08             	mov    0x8(%ebp),%eax
    9c02:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9c05:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9c08:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9c0d:	89 d8                	mov    %ebx,%eax
    9c0f:	f7 ea                	imul   %edx
    9c11:	c1 fa 02             	sar    $0x2,%edx
    9c14:	89 d8                	mov    %ebx,%eax
    9c16:	c1 f8 1f             	sar    $0x1f,%eax
    9c19:	29 c2                	sub    %eax,%edx
    9c1b:	89 d0                	mov    %edx,%eax
    9c1d:	c1 e0 03             	shl    $0x3,%eax
    9c20:	01 d0                	add    %edx,%eax
    9c22:	01 c0                	add    %eax,%eax
    9c24:	29 c3                	sub    %eax,%ebx
    9c26:	89 da                	mov    %ebx,%edx
    9c28:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9c2b:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9c2e:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9c32:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9c35:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9c38:	0f 8c 13 ff ff ff    	jl     9b51 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9c3e:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9c42:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9c46:	0f 8e f9 fe ff ff    	jle    9b45 <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9c4c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9c50:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9c53:	89 d0                	mov    %edx,%eax
    9c55:	c1 e0 03             	shl    $0x3,%eax
    9c58:	01 d0                	add    %edx,%eax
    9c5a:	c1 e0 02             	shl    $0x2,%eax
    9c5d:	01 d0                	add    %edx,%eax
    9c5f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9c62:	01 d0                	add    %edx,%eax
    9c64:	83 c0 14             	add    $0x14,%eax
    9c67:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
    9c6e:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9c71:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9c74:	8d 48 01             	lea    0x1(%eax),%ecx
    9c77:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9c7a:	89 d0                	mov    %edx,%eax
    9c7c:	c1 e0 03             	shl    $0x3,%eax
    9c7f:	01 d0                	add    %edx,%eax
    9c81:	c1 e0 02             	shl    $0x2,%eax
    9c84:	01 d0                	add    %edx,%eax
    9c86:	01 c8                	add    %ecx,%eax
    9c88:	83 c0 14             	add    $0x14,%eax
    9c8b:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
    9c92:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9c95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    9c98:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9c9c:	0f 8e 97 fe ff ff    	jle    9b39 <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9ca2:	eb 5b                	jmp    9cff <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9ca4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9cab:	eb 4c                	jmp    9cf9 <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9cad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9cb4:	eb 39                	jmp    9cef <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    9cb6:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9cb9:	89 d0                	mov    %edx,%eax
    9cbb:	c1 e0 03             	shl    $0x3,%eax
    9cbe:	01 d0                	add    %edx,%eax
    9cc0:	c1 e0 04             	shl    $0x4,%eax
    9cc3:	89 c2                	mov    %eax,%edx
    9cc5:	8b 45 0c             	mov    0xc(%ebp),%eax
    9cc8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9ccb:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9cce:	89 d0                	mov    %edx,%eax
    9cd0:	c1 e0 03             	shl    $0x3,%eax
    9cd3:	01 d0                	add    %edx,%eax
    9cd5:	c1 e0 04             	shl    $0x4,%eax
    9cd8:	89 c2                	mov    %eax,%edx
    9cda:	8b 45 08             	mov    0x8(%ebp),%eax
    9cdd:	01 c2                	add    %eax,%edx
    9cdf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9ce2:	dd 04 c2             	fldl   (%edx,%eax,8)
    9ce5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9ce8:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9ceb:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9cef:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9cf3:	7e c1                	jle    9cb6 <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9cf5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9cf9:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    9cfd:	7e ae                	jle    9cad <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    9cff:	83 c4 34             	add    $0x34,%esp
    9d02:	5b                   	pop    %ebx
    9d03:	5e                   	pop    %esi
    9d04:	5f                   	pop    %edi
    9d05:	5d                   	pop    %ebp
    9d06:	c3                   	ret    

00009d07 <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9d07:	55                   	push   %ebp
    9d08:	89 e5                	mov    %esp,%ebp
    9d0a:	56                   	push   %esi
    9d0b:	53                   	push   %ebx
    9d0c:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    9d12:	8b 45 18             	mov    0x18(%ebp),%eax
    9d15:	8b 00                	mov    (%eax),%eax
    9d17:	8b 40 10             	mov    0x10(%eax),%eax
    9d1a:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    9d1d:	8b 45 18             	mov    0x18(%ebp),%eax
    9d20:	8b 40 08             	mov    0x8(%eax),%eax
    9d23:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9d26:	8b 45 18             	mov    0x18(%ebp),%eax
    9d29:	8b 00                	mov    (%eax),%eax
    9d2b:	8b 40 1c             	mov    0x1c(%eax),%eax
    9d2e:	83 f8 01             	cmp    $0x1,%eax
    9d31:	75 16                	jne    9d49 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    9d33:	8b 45 18             	mov    0x18(%ebp),%eax
    9d36:	8b 00                	mov    (%eax),%eax
    9d38:	8b 40 20             	mov    0x20(%eax),%eax
    9d3b:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9d3e:	85 c0                	test   %eax,%eax
    9d40:	74 07                	je     9d49 <III_stereo+0x42>
    9d42:	b8 01 00 00 00       	mov    $0x1,%eax
    9d47:	eb 05                	jmp    9d4e <III_stereo+0x47>
    9d49:	b8 00 00 00 00       	mov    $0x0,%eax
    9d4e:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9d51:	8b 45 18             	mov    0x18(%ebp),%eax
    9d54:	8b 00                	mov    (%eax),%eax
    9d56:	8b 40 1c             	mov    0x1c(%eax),%eax
    9d59:	83 f8 01             	cmp    $0x1,%eax
    9d5c:	75 16                	jne    9d74 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    9d5e:	8b 45 18             	mov    0x18(%ebp),%eax
    9d61:	8b 00                	mov    (%eax),%eax
    9d63:	8b 40 20             	mov    0x20(%eax),%eax
    9d66:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9d69:	85 c0                	test   %eax,%eax
    9d6b:	74 07                	je     9d74 <III_stereo+0x6d>
    9d6d:	b8 01 00 00 00       	mov    $0x1,%eax
    9d72:	eb 05                	jmp    9d79 <III_stereo+0x72>
    9d74:	b8 00 00 00 00       	mov    $0x0,%eax
    9d79:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9d7c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9d83:	eb 12                	jmp    9d97 <III_stereo+0x90>
      is_pos[i] = 7;
    9d85:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d88:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    9d8f:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9d93:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9d97:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    9d9e:	7e e5                	jle    9d85 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    9da0:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9da4:	0f 85 18 0a 00 00    	jne    a7c2 <III_stereo+0xabb>
    9daa:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9dae:	0f 84 0e 0a 00 00    	je     a7c2 <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    9db4:	8b 45 14             	mov    0x14(%ebp),%eax
    9db7:	8b 40 10             	mov    0x10(%eax),%eax
    9dba:	85 c0                	test   %eax,%eax
    9dbc:	0f 84 10 08 00 00    	je     a5d2 <III_stereo+0x8cb>
    9dc2:	8b 45 14             	mov    0x14(%ebp),%eax
    9dc5:	8b 40 14             	mov    0x14(%eax),%eax
    9dc8:	83 f8 02             	cmp    $0x2,%eax
    9dcb:	0f 85 01 08 00 00    	jne    a5d2 <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    9dd1:	8b 45 14             	mov    0x14(%ebp),%eax
    9dd4:	8b 40 18             	mov    0x18(%eax),%eax
    9dd7:	85 c0                	test   %eax,%eax
    9dd9:	0f 84 d0 04 00 00    	je     a2af <III_stereo+0x5a8>
         {  int max_sfb = 0;
    9ddf:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    9de6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9ded:	e9 1b 03 00 00       	jmp    a10d <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    9df2:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    9df9:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9e00:	e9 0f 01 00 00       	jmp    9f14 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9e05:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e08:	8d 48 01             	lea    0x1(%eax),%ecx
    9e0b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9e0e:	89 d0                	mov    %edx,%eax
    9e10:	c1 e0 03             	shl    $0x3,%eax
    9e13:	01 d0                	add    %edx,%eax
    9e15:	c1 e0 02             	shl    $0x2,%eax
    9e18:	01 d0                	add    %edx,%eax
    9e1a:	01 c8                	add    %ecx,%eax
    9e1c:	83 c0 14             	add    $0x14,%eax
    9e1f:	8b 0c 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%ecx
    9e26:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9e29:	89 d0                	mov    %edx,%eax
    9e2b:	c1 e0 03             	shl    $0x3,%eax
    9e2e:	01 d0                	add    %edx,%eax
    9e30:	c1 e0 02             	shl    $0x2,%eax
    9e33:	01 d0                	add    %edx,%eax
    9e35:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9e38:	01 d0                	add    %edx,%eax
    9e3a:	83 c0 14             	add    $0x14,%eax
    9e3d:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
    9e44:	29 c1                	sub    %eax,%ecx
    9e46:	89 c8                	mov    %ecx,%eax
    9e48:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9e4b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9e4e:	89 d0                	mov    %edx,%eax
    9e50:	c1 e0 03             	shl    $0x3,%eax
    9e53:	01 d0                	add    %edx,%eax
    9e55:	c1 e0 02             	shl    $0x2,%eax
    9e58:	01 d0                	add    %edx,%eax
    9e5a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9e5d:	01 d0                	add    %edx,%eax
    9e5f:	83 c0 14             	add    $0x14,%eax
    9e62:	8b 14 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%edx
    9e69:	89 d0                	mov    %edx,%eax
    9e6b:	01 c0                	add    %eax,%eax
    9e6d:	01 c2                	add    %eax,%edx
    9e6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e72:	83 c0 01             	add    $0x1,%eax
    9e75:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    9e79:	01 d0                	add    %edx,%eax
    9e7b:	83 e8 01             	sub    $0x1,%eax
    9e7e:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9e81:	e9 80 00 00 00       	jmp    9f06 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9e86:	8b 45 08             	mov    0x8(%ebp),%eax
    9e89:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9e8f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9e92:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9e97:	89 c8                	mov    %ecx,%eax
    9e99:	f7 ea                	imul   %edx
    9e9b:	c1 fa 02             	sar    $0x2,%edx
    9e9e:	89 c8                	mov    %ecx,%eax
    9ea0:	c1 f8 1f             	sar    $0x1f,%eax
    9ea3:	89 d3                	mov    %edx,%ebx
    9ea5:	29 c3                	sub    %eax,%ebx
    9ea7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9eaa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9eaf:	89 c8                	mov    %ecx,%eax
    9eb1:	f7 ea                	imul   %edx
    9eb3:	c1 fa 02             	sar    $0x2,%edx
    9eb6:	89 c8                	mov    %ecx,%eax
    9eb8:	c1 f8 1f             	sar    $0x1f,%eax
    9ebb:	29 c2                	sub    %eax,%edx
    9ebd:	89 d0                	mov    %edx,%eax
    9ebf:	c1 e0 03             	shl    $0x3,%eax
    9ec2:	01 d0                	add    %edx,%eax
    9ec4:	01 c0                	add    %eax,%eax
    9ec6:	29 c1                	sub    %eax,%ecx
    9ec8:	89 ca                	mov    %ecx,%edx
    9eca:	89 d8                	mov    %ebx,%eax
    9ecc:	c1 e0 03             	shl    $0x3,%eax
    9ecf:	01 d8                	add    %ebx,%eax
    9ed1:	01 c0                	add    %eax,%eax
    9ed3:	01 d0                	add    %edx,%eax
    9ed5:	dd 04 c6             	fldl   (%esi,%eax,8)
    9ed8:	d9 ee                	fldz   
    9eda:	df e9                	fucomip %st(1),%st
    9edc:	7a 0a                	jp     9ee8 <III_stereo+0x1e1>
    9ede:	d9 ee                	fldz   
    9ee0:	df e9                	fucomip %st(1),%st
    9ee2:	dd d8                	fstp   %st(0)
    9ee4:	74 18                	je     9efe <III_stereo+0x1f7>
    9ee6:	eb 02                	jmp    9eea <III_stereo+0x1e3>
    9ee8:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    9eea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9eed:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    9ef0:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9ef7:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    9efe:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    9f02:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    9f06:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    9f0a:	0f 8f 76 ff ff ff    	jg     9e86 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    9f10:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    9f14:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    9f18:	0f 8f e7 fe ff ff    	jg     9e05 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    9f1e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9f21:	83 c0 01             	add    $0x1,%eax
    9f24:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    9f27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f2a:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9f2d:	7e 0b                	jle    9f3a <III_stereo+0x233>
                  max_sfb = sfb;
    9f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f32:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    9f35:	e9 f5 00 00 00       	jmp    a02f <III_stereo+0x328>
    9f3a:	e9 f0 00 00 00       	jmp    a02f <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f42:	8d 48 01             	lea    0x1(%eax),%ecx
    9f45:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9f48:	89 d0                	mov    %edx,%eax
    9f4a:	c1 e0 03             	shl    $0x3,%eax
    9f4d:	01 d0                	add    %edx,%eax
    9f4f:	c1 e0 02             	shl    $0x2,%eax
    9f52:	01 d0                	add    %edx,%eax
    9f54:	01 c8                	add    %ecx,%eax
    9f56:	83 c0 14             	add    $0x14,%eax
    9f59:	8b 0c 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%ecx
    9f60:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9f63:	89 d0                	mov    %edx,%eax
    9f65:	c1 e0 03             	shl    $0x3,%eax
    9f68:	01 d0                	add    %edx,%eax
    9f6a:	c1 e0 02             	shl    $0x2,%eax
    9f6d:	01 d0                	add    %edx,%eax
    9f6f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9f72:	01 d0                	add    %edx,%eax
    9f74:	83 c0 14             	add    $0x14,%eax
    9f77:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
    9f7e:	29 c1                	sub    %eax,%ecx
    9f80:	89 c8                	mov    %ecx,%eax
    9f82:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9f85:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9f88:	89 d0                	mov    %edx,%eax
    9f8a:	c1 e0 03             	shl    $0x3,%eax
    9f8d:	01 d0                	add    %edx,%eax
    9f8f:	c1 e0 02             	shl    $0x2,%eax
    9f92:	01 d0                	add    %edx,%eax
    9f94:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9f97:	01 d0                	add    %edx,%eax
    9f99:	83 c0 14             	add    $0x14,%eax
    9f9c:	8b 14 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%edx
    9fa3:	89 d0                	mov    %edx,%eax
    9fa5:	01 c0                	add    %eax,%eax
    9fa7:	01 c2                	add    %eax,%edx
    9fa9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9fac:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9fb0:	01 d0                	add    %edx,%eax
    9fb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9fb5:	eb 6e                	jmp    a025 <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9fb7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9fba:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9fbd:	89 d0                	mov    %edx,%eax
    9fbf:	01 c0                	add    %eax,%eax
    9fc1:	01 d0                	add    %edx,%eax
    9fc3:	c1 e0 02             	shl    $0x2,%eax
    9fc6:	01 d0                	add    %edx,%eax
    9fc8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9fcb:	01 d0                	add    %edx,%eax
    9fcd:	83 c0 52             	add    $0x52,%eax
    9fd0:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    9fd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9fd7:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    9fde:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9fe1:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9fe8:	83 f8 07             	cmp    $0x7,%eax
    9feb:	74 30                	je     a01d <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9fed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ff0:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9ff7:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9ffd:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a003:	dd 05 60 e6 00 00    	fldl   0xe660
    a009:	de c9                	fmulp  %st,%st(1)
    a00b:	dd 1c 24             	fstpl  (%esp)
    a00e:	e8 1d b6 ff ff       	call   5630 <tan>
    a013:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a016:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    a01d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    a021:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a025:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a029:	7f 8c                	jg     9fb7 <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    a02b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    a02f:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a033:	0f 8e 06 ff ff ff    	jle    9f3f <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    a039:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a03c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a042:	05 7c 02 01 00       	add    $0x1027c,%eax
    a047:	8b 50 0c             	mov    0xc(%eax),%edx
    a04a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a04d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a053:	05 78 02 01 00       	add    $0x10278,%eax
    a058:	8b 40 0c             	mov    0xc(%eax),%eax
    a05b:	29 c2                	sub    %eax,%edx
    a05d:	89 d0                	mov    %edx,%eax
    a05f:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    a062:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a065:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a06b:	05 78 02 01 00       	add    $0x10278,%eax
    a070:	8b 50 0c             	mov    0xc(%eax),%edx
    a073:	89 d0                	mov    %edx,%eax
    a075:	01 c0                	add    %eax,%eax
    a077:	01 c2                	add    %eax,%edx
    a079:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a07c:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a080:	01 d0                	add    %edx,%eax
    a082:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    a085:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a088:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a08e:	05 80 02 01 00       	add    $0x10280,%eax
    a093:	8b 50 0c             	mov    0xc(%eax),%edx
    a096:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a099:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a09f:	05 7c 02 01 00       	add    $0x1027c,%eax
    a0a4:	8b 40 0c             	mov    0xc(%eax),%eax
    a0a7:	29 c2                	sub    %eax,%edx
    a0a9:	89 d0                	mov    %edx,%eax
    a0ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    a0ae:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a0b1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a0b7:	05 7c 02 01 00       	add    $0x1027c,%eax
    a0bc:	8b 50 0c             	mov    0xc(%eax),%edx
    a0bf:	89 d0                	mov    %edx,%eax
    a0c1:	01 c0                	add    %eax,%eax
    a0c3:	01 c2                	add    %eax,%edx
    a0c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a0c8:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a0cc:	01 d0                	add    %edx,%eax
    a0ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    a0d1:	eb 30                	jmp    a103 <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    a0d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0d6:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a0dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a0e0:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    a0e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0ea:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a0f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a0f4:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    a0fb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    a0ff:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a103:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a107:	7f ca                	jg     a0d3 <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    a109:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a10d:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    a111:	0f 8e db fc ff ff    	jle    9df2 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    a117:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    a11b:	0f 8f 89 01 00 00    	jg     a2aa <III_stereo+0x5a3>
             {  i = 2;
    a121:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    a128:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    a12f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    a136:	eb 63                	jmp    a19b <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    a138:	8b 45 08             	mov    0x8(%ebp),%eax
    a13b:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a141:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a144:	89 d0                	mov    %edx,%eax
    a146:	c1 e0 03             	shl    $0x3,%eax
    a149:	01 d0                	add    %edx,%eax
    a14b:	01 c0                	add    %eax,%eax
    a14d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a150:	01 d0                	add    %edx,%eax
    a152:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a155:	d9 ee                	fldz   
    a157:	df e9                	fucomip %st(1),%st
    a159:	7a 0a                	jp     a165 <III_stereo+0x45e>
    a15b:	d9 ee                	fldz   
    a15d:	df e9                	fucomip %st(1),%st
    a15f:	dd d8                	fstp   %st(0)
    a161:	74 23                	je     a186 <III_stereo+0x47f>
    a163:	eb 02                	jmp    a167 <III_stereo+0x460>
    a165:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    a167:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a16a:	89 d0                	mov    %edx,%eax
    a16c:	c1 e0 03             	shl    $0x3,%eax
    a16f:	01 d0                	add    %edx,%eax
    a171:	01 c0                	add    %eax,%eax
    a173:	89 c2                	mov    %eax,%edx
    a175:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a178:	01 d0                	add    %edx,%eax
    a17a:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    a17d:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    a184:	eb 15                	jmp    a19b <III_stereo+0x494>
                   } else
                   {  ss--;
    a186:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    a18a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    a18e:	79 0b                	jns    a19b <III_stereo+0x494>
                      {  i--;
    a190:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    a194:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    a19b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    a19f:	79 97                	jns    a138 <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    a1a1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    a1a8:	eb 04                	jmp    a1ae <III_stereo+0x4a7>
                   i++;
    a1aa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    a1ae:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a1b1:	89 d0                	mov    %edx,%eax
    a1b3:	c1 e0 03             	shl    $0x3,%eax
    a1b6:	01 d0                	add    %edx,%eax
    a1b8:	c1 e0 02             	shl    $0x2,%eax
    a1bb:	01 d0                	add    %edx,%eax
    a1bd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a1c0:	01 d0                	add    %edx,%eax
    a1c2:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    a1c9:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    a1cc:	7e dc                	jle    a1aa <III_stereo+0x4a3>
                   i++;
                sfb = i;
    a1ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a1d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    a1d4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a1d7:	89 d0                	mov    %edx,%eax
    a1d9:	c1 e0 03             	shl    $0x3,%eax
    a1dc:	01 d0                	add    %edx,%eax
    a1de:	c1 e0 02             	shl    $0x2,%eax
    a1e1:	01 d0                	add    %edx,%eax
    a1e3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a1e6:	01 d0                	add    %edx,%eax
    a1e8:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    a1ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    a1f2:	e9 a9 00 00 00       	jmp    a2a0 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    a1f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a1fa:	8d 48 01             	lea    0x1(%eax),%ecx
    a1fd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a200:	89 d0                	mov    %edx,%eax
    a202:	c1 e0 03             	shl    $0x3,%eax
    a205:	01 d0                	add    %edx,%eax
    a207:	c1 e0 02             	shl    $0x2,%eax
    a20a:	01 d0                	add    %edx,%eax
    a20c:	01 c8                	add    %ecx,%eax
    a20e:	8b 0c 85 00 02 01 00 	mov    0x10200(,%eax,4),%ecx
    a215:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a218:	89 d0                	mov    %edx,%eax
    a21a:	c1 e0 03             	shl    $0x3,%eax
    a21d:	01 d0                	add    %edx,%eax
    a21f:	c1 e0 02             	shl    $0x2,%eax
    a222:	01 d0                	add    %edx,%eax
    a224:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a227:	01 d0                	add    %edx,%eax
    a229:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    a230:	29 c1                	sub    %eax,%ecx
    a232:	89 c8                	mov    %ecx,%eax
    a234:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    a237:	eb 5d                	jmp    a296 <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    a239:	8b 45 10             	mov    0x10(%ebp),%eax
    a23c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a23f:	83 c2 3e             	add    $0x3e,%edx
    a242:	8b 14 90             	mov    (%eax,%edx,4),%edx
    a245:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a248:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    a24f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a252:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a259:	83 f8 07             	cmp    $0x7,%eax
    a25c:	74 30                	je     a28e <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a25e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a261:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a268:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a26e:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a274:	dd 05 60 e6 00 00    	fldl   0xe660
    a27a:	de c9                	fmulp  %st,%st(1)
    a27c:	dd 1c 24             	fstpl  (%esp)
    a27f:	e8 ac b3 ff ff       	call   5630 <tan>
    a284:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a287:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    a28e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    a292:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a296:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a29a:	7f 9d                	jg     a239 <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    a29c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a2a0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    a2a4:	0f 8e 4d ff ff ff    	jle    a1f7 <III_stereo+0x4f0>
    a2aa:	e9 1e 03 00 00       	jmp    a5cd <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    a2af:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a2b6:	e9 08 03 00 00       	jmp    a5c3 <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    a2bb:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    a2c2:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a2c9:	e9 0f 01 00 00       	jmp    a3dd <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a2ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2d1:	8d 48 01             	lea    0x1(%eax),%ecx
    a2d4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a2d7:	89 d0                	mov    %edx,%eax
    a2d9:	c1 e0 03             	shl    $0x3,%eax
    a2dc:	01 d0                	add    %edx,%eax
    a2de:	c1 e0 02             	shl    $0x2,%eax
    a2e1:	01 d0                	add    %edx,%eax
    a2e3:	01 c8                	add    %ecx,%eax
    a2e5:	83 c0 14             	add    $0x14,%eax
    a2e8:	8b 0c 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%ecx
    a2ef:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a2f2:	89 d0                	mov    %edx,%eax
    a2f4:	c1 e0 03             	shl    $0x3,%eax
    a2f7:	01 d0                	add    %edx,%eax
    a2f9:	c1 e0 02             	shl    $0x2,%eax
    a2fc:	01 d0                	add    %edx,%eax
    a2fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a301:	01 d0                	add    %edx,%eax
    a303:	83 c0 14             	add    $0x14,%eax
    a306:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
    a30d:	29 c1                	sub    %eax,%ecx
    a30f:	89 c8                	mov    %ecx,%eax
    a311:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    a314:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a317:	89 d0                	mov    %edx,%eax
    a319:	c1 e0 03             	shl    $0x3,%eax
    a31c:	01 d0                	add    %edx,%eax
    a31e:	c1 e0 02             	shl    $0x2,%eax
    a321:	01 d0                	add    %edx,%eax
    a323:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a326:	01 d0                	add    %edx,%eax
    a328:	83 c0 14             	add    $0x14,%eax
    a32b:	8b 14 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%edx
    a332:	89 d0                	mov    %edx,%eax
    a334:	01 c0                	add    %eax,%eax
    a336:	01 c2                	add    %eax,%edx
    a338:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a33b:	83 c0 01             	add    $0x1,%eax
    a33e:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    a342:	01 d0                	add    %edx,%eax
    a344:	83 e8 01             	sub    $0x1,%eax
    a347:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    a34a:	e9 80 00 00 00       	jmp    a3cf <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    a34f:	8b 45 08             	mov    0x8(%ebp),%eax
    a352:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    a358:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a35b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a360:	89 c8                	mov    %ecx,%eax
    a362:	f7 ea                	imul   %edx
    a364:	c1 fa 02             	sar    $0x2,%edx
    a367:	89 c8                	mov    %ecx,%eax
    a369:	c1 f8 1f             	sar    $0x1f,%eax
    a36c:	89 d3                	mov    %edx,%ebx
    a36e:	29 c3                	sub    %eax,%ebx
    a370:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a373:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a378:	89 c8                	mov    %ecx,%eax
    a37a:	f7 ea                	imul   %edx
    a37c:	c1 fa 02             	sar    $0x2,%edx
    a37f:	89 c8                	mov    %ecx,%eax
    a381:	c1 f8 1f             	sar    $0x1f,%eax
    a384:	29 c2                	sub    %eax,%edx
    a386:	89 d0                	mov    %edx,%eax
    a388:	c1 e0 03             	shl    $0x3,%eax
    a38b:	01 d0                	add    %edx,%eax
    a38d:	01 c0                	add    %eax,%eax
    a38f:	29 c1                	sub    %eax,%ecx
    a391:	89 ca                	mov    %ecx,%edx
    a393:	89 d8                	mov    %ebx,%eax
    a395:	c1 e0 03             	shl    $0x3,%eax
    a398:	01 d8                	add    %ebx,%eax
    a39a:	01 c0                	add    %eax,%eax
    a39c:	01 d0                	add    %edx,%eax
    a39e:	dd 04 c6             	fldl   (%esi,%eax,8)
    a3a1:	d9 ee                	fldz   
    a3a3:	df e9                	fucomip %st(1),%st
    a3a5:	7a 0a                	jp     a3b1 <III_stereo+0x6aa>
    a3a7:	d9 ee                	fldz   
    a3a9:	df e9                	fucomip %st(1),%st
    a3ab:	dd d8                	fstp   %st(0)
    a3ad:	74 18                	je     a3c7 <III_stereo+0x6c0>
    a3af:	eb 02                	jmp    a3b3 <III_stereo+0x6ac>
    a3b1:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    a3b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a3b6:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    a3b9:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    a3c0:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    a3c7:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    a3cb:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    a3cf:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    a3d3:	0f 8f 76 ff ff ff    	jg     a34f <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    a3d9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    a3dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    a3e1:	0f 89 e7 fe ff ff    	jns    a2ce <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    a3e7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a3ea:	83 c0 01             	add    $0x1,%eax
    a3ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    a3f0:	e9 f0 00 00 00       	jmp    a4e5 <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a3f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a3f8:	8d 48 01             	lea    0x1(%eax),%ecx
    a3fb:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a3fe:	89 d0                	mov    %edx,%eax
    a400:	c1 e0 03             	shl    $0x3,%eax
    a403:	01 d0                	add    %edx,%eax
    a405:	c1 e0 02             	shl    $0x2,%eax
    a408:	01 d0                	add    %edx,%eax
    a40a:	01 c8                	add    %ecx,%eax
    a40c:	83 c0 14             	add    $0x14,%eax
    a40f:	8b 0c 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%ecx
    a416:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a419:	89 d0                	mov    %edx,%eax
    a41b:	c1 e0 03             	shl    $0x3,%eax
    a41e:	01 d0                	add    %edx,%eax
    a420:	c1 e0 02             	shl    $0x2,%eax
    a423:	01 d0                	add    %edx,%eax
    a425:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a428:	01 d0                	add    %edx,%eax
    a42a:	83 c0 14             	add    $0x14,%eax
    a42d:	8b 04 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%eax
    a434:	29 c1                	sub    %eax,%ecx
    a436:	89 c8                	mov    %ecx,%eax
    a438:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    a43b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a43e:	89 d0                	mov    %edx,%eax
    a440:	c1 e0 03             	shl    $0x3,%eax
    a443:	01 d0                	add    %edx,%eax
    a445:	c1 e0 02             	shl    $0x2,%eax
    a448:	01 d0                	add    %edx,%eax
    a44a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a44d:	01 d0                	add    %edx,%eax
    a44f:	83 c0 14             	add    $0x14,%eax
    a452:	8b 14 85 0c 02 01 00 	mov    0x1020c(,%eax,4),%edx
    a459:	89 d0                	mov    %edx,%eax
    a45b:	01 c0                	add    %eax,%eax
    a45d:	01 c2                	add    %eax,%edx
    a45f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a462:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a466:	01 d0                	add    %edx,%eax
    a468:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    a46b:	eb 6e                	jmp    a4db <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    a46d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a470:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a473:	89 d0                	mov    %edx,%eax
    a475:	01 c0                	add    %eax,%eax
    a477:	01 d0                	add    %edx,%eax
    a479:	c1 e0 02             	shl    $0x2,%eax
    a47c:	01 d0                	add    %edx,%eax
    a47e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a481:	01 d0                	add    %edx,%eax
    a483:	83 c0 52             	add    $0x52,%eax
    a486:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    a48a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a48d:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    a494:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a497:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a49e:	83 f8 07             	cmp    $0x7,%eax
    a4a1:	74 30                	je     a4d3 <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a4a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a4a6:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a4ad:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a4b3:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a4b9:	dd 05 60 e6 00 00    	fldl   0xe660
    a4bf:	de c9                	fmulp  %st,%st(1)
    a4c1:	dd 1c 24             	fstpl  (%esp)
    a4c4:	e8 67 b1 ff ff       	call   5630 <tan>
    a4c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a4cc:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    a4d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    a4d7:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a4db:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a4df:	7f 8c                	jg     a46d <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    a4e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    a4e5:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a4e9:	0f 8e 06 ff ff ff    	jle    a3f5 <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    a4ef:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a4f2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a4f8:	05 7c 02 01 00       	add    $0x1027c,%eax
    a4fd:	8b 50 0c             	mov    0xc(%eax),%edx
    a500:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a503:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a509:	05 78 02 01 00       	add    $0x10278,%eax
    a50e:	8b 40 0c             	mov    0xc(%eax),%eax
    a511:	29 c2                	sub    %eax,%edx
    a513:	89 d0                	mov    %edx,%eax
    a515:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    a518:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a51b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a521:	05 78 02 01 00       	add    $0x10278,%eax
    a526:	8b 50 0c             	mov    0xc(%eax),%edx
    a529:	89 d0                	mov    %edx,%eax
    a52b:	01 c0                	add    %eax,%eax
    a52d:	01 c2                	add    %eax,%edx
    a52f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a532:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a536:	01 d0                	add    %edx,%eax
    a538:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    a53b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a53e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a544:	05 80 02 01 00       	add    $0x10280,%eax
    a549:	8b 50 0c             	mov    0xc(%eax),%edx
    a54c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a54f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a555:	05 7c 02 01 00       	add    $0x1027c,%eax
    a55a:	8b 40 0c             	mov    0xc(%eax),%eax
    a55d:	29 c2                	sub    %eax,%edx
    a55f:	89 d0                	mov    %edx,%eax
    a561:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    a564:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a567:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a56d:	05 7c 02 01 00       	add    $0x1027c,%eax
    a572:	8b 50 0c             	mov    0xc(%eax),%edx
    a575:	89 d0                	mov    %edx,%eax
    a577:	01 c0                	add    %eax,%eax
    a579:	01 c2                	add    %eax,%edx
    a57b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a57e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a582:	01 d0                	add    %edx,%eax
    a584:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    a587:	eb 30                	jmp    a5b9 <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    a589:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a58c:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a593:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a596:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    a59d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a5a0:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a5a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a5aa:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    a5b1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    a5b5:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a5b9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a5bd:	7f ca                	jg     a589 <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    a5bf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a5c3:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    a5c7:	0f 8e ee fc ff ff    	jle    a2bb <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    a5cd:	e9 f0 01 00 00       	jmp    a7c2 <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    a5d2:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    a5d9:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    a5e0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    a5e7:	eb 63                	jmp    a64c <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    a5e9:	8b 45 08             	mov    0x8(%ebp),%eax
    a5ec:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a5f2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a5f5:	89 d0                	mov    %edx,%eax
    a5f7:	c1 e0 03             	shl    $0x3,%eax
    a5fa:	01 d0                	add    %edx,%eax
    a5fc:	01 c0                	add    %eax,%eax
    a5fe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a601:	01 d0                	add    %edx,%eax
    a603:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a606:	d9 ee                	fldz   
    a608:	df e9                	fucomip %st(1),%st
    a60a:	7a 0a                	jp     a616 <III_stereo+0x90f>
    a60c:	d9 ee                	fldz   
    a60e:	df e9                	fucomip %st(1),%st
    a610:	dd d8                	fstp   %st(0)
    a612:	74 23                	je     a637 <III_stereo+0x930>
    a614:	eb 02                	jmp    a618 <III_stereo+0x911>
    a616:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    a618:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a61b:	89 d0                	mov    %edx,%eax
    a61d:	c1 e0 03             	shl    $0x3,%eax
    a620:	01 d0                	add    %edx,%eax
    a622:	01 c0                	add    %eax,%eax
    a624:	89 c2                	mov    %eax,%edx
    a626:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a629:	01 d0                	add    %edx,%eax
    a62b:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    a62e:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    a635:	eb 15                	jmp    a64c <III_stereo+0x945>
            } else
            {  ss--;
    a637:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    a63b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    a63f:	79 0b                	jns    a64c <III_stereo+0x945>
               {  i--;
    a641:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    a645:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    a64c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    a650:	79 97                	jns    a5e9 <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    a652:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a659:	eb 04                	jmp    a65f <III_stereo+0x958>
            i++;
    a65b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    a65f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a662:	89 d0                	mov    %edx,%eax
    a664:	c1 e0 03             	shl    $0x3,%eax
    a667:	01 d0                	add    %edx,%eax
    a669:	c1 e0 02             	shl    $0x2,%eax
    a66c:	01 d0                	add    %edx,%eax
    a66e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a671:	01 d0                	add    %edx,%eax
    a673:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    a67a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    a67d:	7e dc                	jle    a65b <III_stereo+0x954>
            i++;
         sfb = i;
    a67f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a682:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    a685:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a688:	89 d0                	mov    %edx,%eax
    a68a:	c1 e0 03             	shl    $0x3,%eax
    a68d:	01 d0                	add    %edx,%eax
    a68f:	c1 e0 02             	shl    $0x2,%eax
    a692:	01 d0                	add    %edx,%eax
    a694:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a697:	01 d0                	add    %edx,%eax
    a699:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    a6a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    a6a3:	e9 a9 00 00 00       	jmp    a751 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    a6a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a6ab:	8d 48 01             	lea    0x1(%eax),%ecx
    a6ae:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a6b1:	89 d0                	mov    %edx,%eax
    a6b3:	c1 e0 03             	shl    $0x3,%eax
    a6b6:	01 d0                	add    %edx,%eax
    a6b8:	c1 e0 02             	shl    $0x2,%eax
    a6bb:	01 d0                	add    %edx,%eax
    a6bd:	01 c8                	add    %ecx,%eax
    a6bf:	8b 0c 85 00 02 01 00 	mov    0x10200(,%eax,4),%ecx
    a6c6:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a6c9:	89 d0                	mov    %edx,%eax
    a6cb:	c1 e0 03             	shl    $0x3,%eax
    a6ce:	01 d0                	add    %edx,%eax
    a6d0:	c1 e0 02             	shl    $0x2,%eax
    a6d3:	01 d0                	add    %edx,%eax
    a6d5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a6d8:	01 d0                	add    %edx,%eax
    a6da:	8b 04 85 00 02 01 00 	mov    0x10200(,%eax,4),%eax
    a6e1:	29 c1                	sub    %eax,%ecx
    a6e3:	89 c8                	mov    %ecx,%eax
    a6e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    a6e8:	eb 5d                	jmp    a747 <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    a6ea:	8b 45 10             	mov    0x10(%ebp),%eax
    a6ed:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a6f0:	83 c2 3e             	add    $0x3e,%edx
    a6f3:	8b 14 90             	mov    (%eax,%edx,4),%edx
    a6f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a6f9:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    a700:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a703:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a70a:	83 f8 07             	cmp    $0x7,%eax
    a70d:	74 30                	je     a73f <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    a70f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a712:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a719:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    a71f:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    a725:	dd 05 60 e6 00 00    	fldl   0xe660
    a72b:	de c9                	fmulp  %st,%st(1)
    a72d:	dd 1c 24             	fstpl  (%esp)
    a730:	e8 fb ae ff ff       	call   5630 <tan>
    a735:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a738:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    a73f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    a743:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a747:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a74b:	7f 9d                	jg     a6ea <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    a74d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a751:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    a755:	0f 8e 4d ff ff ff    	jle    a6a8 <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    a75b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a75e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a764:	05 50 02 01 00       	add    $0x10250,%eax
    a769:	8b 00                	mov    (%eax),%eax
    a76b:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a76e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a771:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a777:	05 54 02 01 00       	add    $0x10254,%eax
    a77c:	8b 00                	mov    (%eax),%eax
    a77e:	ba 40 02 00 00       	mov    $0x240,%edx
    a783:	29 c2                	sub    %eax,%edx
    a785:	89 d0                	mov    %edx,%eax
    a787:	89 45 e8             	mov    %eax,-0x18(%ebp)
    a78a:	eb 30                	jmp    a7bc <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    a78c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a78f:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a796:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a799:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    a7a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a7a3:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a7aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a7ad:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    a7b4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a7b8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a7bc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a7c0:	7f ca                	jg     a78c <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a7c2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a7c9:	eb 55                	jmp    a820 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    a7cb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a7d2:	eb 42                	jmp    a816 <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    a7d4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a7db:	eb 2f                	jmp    a80c <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    a7dd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a7e0:	89 d0                	mov    %edx,%eax
    a7e2:	c1 e0 03             	shl    $0x3,%eax
    a7e5:	01 d0                	add    %edx,%eax
    a7e7:	c1 e0 09             	shl    $0x9,%eax
    a7ea:	89 c2                	mov    %eax,%edx
    a7ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    a7ef:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a7f2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a7f5:	89 d0                	mov    %edx,%eax
    a7f7:	c1 e0 03             	shl    $0x3,%eax
    a7fa:	01 d0                	add    %edx,%eax
    a7fc:	01 c0                	add    %eax,%eax
    a7fe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a801:	01 d0                	add    %edx,%eax
    a803:	d9 ee                	fldz   
    a805:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a808:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a80c:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a810:	7e cb                	jle    a7dd <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    a812:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a816:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a81a:	7e b8                	jle    a7d4 <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a81c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a820:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    a824:	7e a5                	jle    a7cb <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    a826:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    a82a:	0f 85 3d 02 00 00    	jne    aa6d <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    a830:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a837:	e9 25 02 00 00       	jmp    aa61 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    a83c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a843:	e9 0b 02 00 00       	jmp    aa53 <III_stereo+0xd4c>
            i = (sb*18)+ss;
    a848:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a84b:	89 d0                	mov    %edx,%eax
    a84d:	c1 e0 03             	shl    $0x3,%eax
    a850:	01 d0                	add    %edx,%eax
    a852:	01 c0                	add    %eax,%eax
    a854:	89 c2                	mov    %eax,%edx
    a856:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a859:	01 d0                	add    %edx,%eax
    a85b:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    a85e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a861:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a868:	83 f8 07             	cmp    $0x7,%eax
    a86b:	0f 85 2c 01 00 00    	jne    a99d <III_stereo+0xc96>
               if ( ms_stereo ) {
    a871:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    a875:	0f 84 b5 00 00 00    	je     a930 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    a87b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a87e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a881:	89 d0                	mov    %edx,%eax
    a883:	c1 e0 03             	shl    $0x3,%eax
    a886:	01 d0                	add    %edx,%eax
    a888:	01 c0                	add    %eax,%eax
    a88a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a88d:	01 d0                	add    %edx,%eax
    a88f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a892:	8b 45 08             	mov    0x8(%ebp),%eax
    a895:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a89b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a89e:	89 d0                	mov    %edx,%eax
    a8a0:	c1 e0 03             	shl    $0x3,%eax
    a8a3:	01 d0                	add    %edx,%eax
    a8a5:	01 c0                	add    %eax,%eax
    a8a7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a8aa:	01 d0                	add    %edx,%eax
    a8ac:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a8af:	de c1                	faddp  %st,%st(1)
    a8b1:	dd 05 68 e6 00 00    	fldl   0xe668
    a8b7:	de f9                	fdivrp %st,%st(1)
    a8b9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a8bc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a8bf:	89 d0                	mov    %edx,%eax
    a8c1:	c1 e0 03             	shl    $0x3,%eax
    a8c4:	01 d0                	add    %edx,%eax
    a8c6:	01 c0                	add    %eax,%eax
    a8c8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a8cb:	01 d0                	add    %edx,%eax
    a8cd:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    a8d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    a8d3:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a8d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a8dc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a8df:	89 d0                	mov    %edx,%eax
    a8e1:	c1 e0 03             	shl    $0x3,%eax
    a8e4:	01 d0                	add    %edx,%eax
    a8e6:	01 c0                	add    %eax,%eax
    a8e8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a8eb:	01 d0                	add    %edx,%eax
    a8ed:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a8f0:	8b 45 08             	mov    0x8(%ebp),%eax
    a8f3:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a8f9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a8fc:	89 d0                	mov    %edx,%eax
    a8fe:	c1 e0 03             	shl    $0x3,%eax
    a901:	01 d0                	add    %edx,%eax
    a903:	01 c0                	add    %eax,%eax
    a905:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a908:	01 d0                	add    %edx,%eax
    a90a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a90d:	de e9                	fsubrp %st,%st(1)
    a90f:	dd 05 68 e6 00 00    	fldl   0xe668
    a915:	de f9                	fdivrp %st,%st(1)
    a917:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a91a:	89 d0                	mov    %edx,%eax
    a91c:	c1 e0 03             	shl    $0x3,%eax
    a91f:	01 d0                	add    %edx,%eax
    a921:	01 c0                	add    %eax,%eax
    a923:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a926:	01 d0                	add    %edx,%eax
    a928:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    a92b:	e9 1f 01 00 00       	jmp    aa4f <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    a930:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a933:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a936:	89 d0                	mov    %edx,%eax
    a938:	c1 e0 03             	shl    $0x3,%eax
    a93b:	01 d0                	add    %edx,%eax
    a93d:	01 c0                	add    %eax,%eax
    a93f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a942:	01 d0                	add    %edx,%eax
    a944:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a947:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a94a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a94d:	89 d0                	mov    %edx,%eax
    a94f:	c1 e0 03             	shl    $0x3,%eax
    a952:	01 d0                	add    %edx,%eax
    a954:	01 c0                	add    %eax,%eax
    a956:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a959:	01 d0                	add    %edx,%eax
    a95b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    a95e:	8b 45 0c             	mov    0xc(%ebp),%eax
    a961:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a967:	8b 45 08             	mov    0x8(%ebp),%eax
    a96a:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a970:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a973:	89 d0                	mov    %edx,%eax
    a975:	c1 e0 03             	shl    $0x3,%eax
    a978:	01 d0                	add    %edx,%eax
    a97a:	01 c0                	add    %eax,%eax
    a97c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a97f:	01 d0                	add    %edx,%eax
    a981:	dd 04 c3             	fldl   (%ebx,%eax,8)
    a984:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a987:	89 d0                	mov    %edx,%eax
    a989:	c1 e0 03             	shl    $0x3,%eax
    a98c:	01 d0                	add    %edx,%eax
    a98e:	01 c0                	add    %eax,%eax
    a990:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a993:	01 d0                	add    %edx,%eax
    a995:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    a998:	e9 b2 00 00 00       	jmp    aa4f <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    a99d:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    a9a1:	0f 84 94 00 00 00    	je     aa3b <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    a9a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a9aa:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a9ad:	89 d0                	mov    %edx,%eax
    a9af:	c1 e0 03             	shl    $0x3,%eax
    a9b2:	01 d0                	add    %edx,%eax
    a9b4:	01 c0                	add    %eax,%eax
    a9b6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a9b9:	01 d0                	add    %edx,%eax
    a9bb:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a9be:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a9c1:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a9c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a9cb:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a9d2:	d9 e8                	fld1   
    a9d4:	de c1                	faddp  %st,%st(1)
    a9d6:	de f9                	fdivrp %st,%st(1)
    a9d8:	de c9                	fmulp  %st,%st(1)
    a9da:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a9dd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a9e0:	89 d0                	mov    %edx,%eax
    a9e2:	c1 e0 03             	shl    $0x3,%eax
    a9e5:	01 d0                	add    %edx,%eax
    a9e7:	01 c0                	add    %eax,%eax
    a9e9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a9ec:	01 d0                	add    %edx,%eax
    a9ee:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    a9f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    a9f4:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a9fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a9fd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa00:	89 d0                	mov    %edx,%eax
    aa02:	c1 e0 03             	shl    $0x3,%eax
    aa05:	01 d0                	add    %edx,%eax
    aa07:	01 c0                	add    %eax,%eax
    aa09:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aa0c:	01 d0                	add    %edx,%eax
    aa0e:	dd 04 c1             	fldl   (%ecx,%eax,8)
    aa11:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa14:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    aa1b:	d9 e8                	fld1   
    aa1d:	de c1                	faddp  %st,%st(1)
    aa1f:	d9 e8                	fld1   
    aa21:	de f1                	fdivp  %st,%st(1)
    aa23:	de c9                	fmulp  %st,%st(1)
    aa25:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa28:	89 d0                	mov    %edx,%eax
    aa2a:	c1 e0 03             	shl    $0x3,%eax
    aa2d:	01 d0                	add    %edx,%eax
    aa2f:	01 c0                	add    %eax,%eax
    aa31:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aa34:	01 d0                	add    %edx,%eax
    aa36:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    aa39:	eb 14                	jmp    aa4f <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    aa3b:	c7 44 24 04 00 d6 00 	movl   $0xd600,0x4(%esp)
    aa42:	00 
    aa43:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    aa4a:	e8 3c a7 ff ff       	call   518b <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    aa4f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    aa53:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    aa57:	0f 8e eb fd ff ff    	jle    a848 <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    aa5d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    aa61:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    aa65:	0f 8e d1 fd ff ff    	jle    a83c <III_stereo+0xb35>
    aa6b:	eb 54                	jmp    aac1 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    aa6d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    aa74:	eb 45                	jmp    aabb <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    aa76:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    aa7d:	eb 32                	jmp    aab1 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    aa7f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    aa82:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa85:	89 d0                	mov    %edx,%eax
    aa87:	c1 e0 03             	shl    $0x3,%eax
    aa8a:	01 d0                	add    %edx,%eax
    aa8c:	01 c0                	add    %eax,%eax
    aa8e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aa91:	01 d0                	add    %edx,%eax
    aa93:	dd 04 c1             	fldl   (%ecx,%eax,8)
    aa96:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    aa99:	8b 55 e8             	mov    -0x18(%ebp),%edx
    aa9c:	89 d0                	mov    %edx,%eax
    aa9e:	c1 e0 03             	shl    $0x3,%eax
    aaa1:	01 d0                	add    %edx,%eax
    aaa3:	01 c0                	add    %eax,%eax
    aaa5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    aaa8:	01 d0                	add    %edx,%eax
    aaaa:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    aaad:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    aab1:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    aab5:	7e c8                	jle    aa7f <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    aab7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    aabb:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    aabf:	7e b5                	jle    aa76 <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    aac1:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    aac7:	5b                   	pop    %ebx
    aac8:	5e                   	pop    %esi
    aac9:	5d                   	pop    %ebp
    aaca:	c3                   	ret    

0000aacb <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    aacb:	55                   	push   %ebp
    aacc:	89 e5                	mov    %esp,%ebp
    aace:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    aad1:	a1 60 04 01 00       	mov    0x10460,%eax
    aad6:	85 c0                	test   %eax,%eax
    aad8:	74 68                	je     ab42 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    aada:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    aae1:	eb 4f                	jmp    ab32 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    aae3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    aae6:	dd 04 c5 20 04 01 00 	fldl   0x10420(,%eax,8)
    aaed:	8b 45 e8             	mov    -0x18(%ebp),%eax
    aaf0:	dd 04 c5 20 04 01 00 	fldl   0x10420(,%eax,8)
    aaf7:	de c9                	fmulp  %st,%st(1)
    aaf9:	d9 e8                	fld1   
    aafb:	de c1                	faddp  %st,%st(1)
    aafd:	dd 1c 24             	fstpl  (%esp)
    ab00:	e8 de ac ff ff       	call   57e3 <sqrt>
    ab05:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    ab08:	d9 e8                	fld1   
    ab0a:	dc 75 e0             	fdivl  -0x20(%ebp)
    ab0d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    ab10:	dd 1c c5 c0 04 01 00 	fstpl  0x104c0(,%eax,8)
         ca[i] = Ci[i]/sq;
    ab17:	8b 45 e8             	mov    -0x18(%ebp),%eax
    ab1a:	dd 04 c5 20 04 01 00 	fldl   0x10420(,%eax,8)
    ab21:	dc 75 e0             	fdivl  -0x20(%ebp)
    ab24:	8b 45 e8             	mov    -0x18(%ebp),%eax
    ab27:	dd 1c c5 00 05 01 00 	fstpl  0x10500(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    ab2e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    ab32:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    ab36:	7e ab                	jle    aae3 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    ab38:	c7 05 60 04 01 00 00 	movl   $0x0,0x10460
    ab3f:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    ab42:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    ab49:	eb 4c                	jmp    ab97 <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    ab4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ab52:	eb 39                	jmp    ab8d <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    ab54:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ab57:	89 d0                	mov    %edx,%eax
    ab59:	c1 e0 03             	shl    $0x3,%eax
    ab5c:	01 d0                	add    %edx,%eax
    ab5e:	c1 e0 04             	shl    $0x4,%eax
    ab61:	89 c2                	mov    %eax,%edx
    ab63:	8b 45 0c             	mov    0xc(%ebp),%eax
    ab66:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    ab69:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ab6c:	89 d0                	mov    %edx,%eax
    ab6e:	c1 e0 03             	shl    $0x3,%eax
    ab71:	01 d0                	add    %edx,%eax
    ab73:	c1 e0 04             	shl    $0x4,%eax
    ab76:	89 c2                	mov    %eax,%edx
    ab78:	8b 45 08             	mov    0x8(%ebp),%eax
    ab7b:	01 c2                	add    %eax,%edx
    ab7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab80:	dd 04 c2             	fldl   (%edx,%eax,8)
    ab83:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab86:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    ab89:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ab8d:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    ab91:	7e c1                	jle    ab54 <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    ab93:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    ab97:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    ab9b:	7e ae                	jle    ab4b <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    ab9d:	8b 45 10             	mov    0x10(%ebp),%eax
    aba0:	8b 40 10             	mov    0x10(%eax),%eax
    aba3:	85 c0                	test   %eax,%eax
    aba5:	74 1a                	je     abc1 <III_antialias+0xf6>
    aba7:	8b 45 10             	mov    0x10(%ebp),%eax
    abaa:	8b 40 14             	mov    0x14(%eax),%eax
    abad:	83 f8 02             	cmp    $0x2,%eax
    abb0:	75 0f                	jne    abc1 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    abb2:	8b 45 10             	mov    0x10(%ebp),%eax
    abb5:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    abb8:	85 c0                	test   %eax,%eax
    abba:	75 05                	jne    abc1 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    abbc:	e9 1c 01 00 00       	jmp    acdd <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    abc1:	8b 45 10             	mov    0x10(%ebp),%eax
    abc4:	8b 40 10             	mov    0x10(%eax),%eax
    abc7:	85 c0                	test   %eax,%eax
    abc9:	74 1e                	je     abe9 <III_antialias+0x11e>
    abcb:	8b 45 10             	mov    0x10(%ebp),%eax
    abce:	8b 40 18             	mov    0x18(%eax),%eax
    abd1:	85 c0                	test   %eax,%eax
    abd3:	74 14                	je     abe9 <III_antialias+0x11e>
     (gr_info->block_type == 2))
    abd5:	8b 45 10             	mov    0x10(%ebp),%eax
    abd8:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    abdb:	83 f8 02             	cmp    $0x2,%eax
    abde:	75 09                	jne    abe9 <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    abe0:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    abe7:	eb 07                	jmp    abf0 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    abe9:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    abf0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    abf7:	e9 d5 00 00 00       	jmp    acd1 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    abfc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ac03:	e9 bb 00 00 00       	jmp    acc3 <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    ac08:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ac0b:	89 d0                	mov    %edx,%eax
    ac0d:	c1 e0 03             	shl    $0x3,%eax
    ac10:	01 d0                	add    %edx,%eax
    ac12:	c1 e0 04             	shl    $0x4,%eax
    ac15:	89 c2                	mov    %eax,%edx
    ac17:	8b 45 08             	mov    0x8(%ebp),%eax
    ac1a:	01 c2                	add    %eax,%edx
    ac1c:	b8 11 00 00 00       	mov    $0x11,%eax
    ac21:	2b 45 f4             	sub    -0xc(%ebp),%eax
    ac24:	dd 04 c2             	fldl   (%edx,%eax,8)
    ac27:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    ac2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ac2d:	8d 50 01             	lea    0x1(%eax),%edx
    ac30:	89 d0                	mov    %edx,%eax
    ac32:	c1 e0 03             	shl    $0x3,%eax
    ac35:	01 d0                	add    %edx,%eax
    ac37:	c1 e0 04             	shl    $0x4,%eax
    ac3a:	89 c2                	mov    %eax,%edx
    ac3c:	8b 45 08             	mov    0x8(%ebp),%eax
    ac3f:	01 c2                	add    %eax,%edx
    ac41:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac44:	dd 04 c2             	fldl   (%edx,%eax,8)
    ac47:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    ac4a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ac4d:	89 d0                	mov    %edx,%eax
    ac4f:	c1 e0 03             	shl    $0x3,%eax
    ac52:	01 d0                	add    %edx,%eax
    ac54:	c1 e0 04             	shl    $0x4,%eax
    ac57:	89 c2                	mov    %eax,%edx
    ac59:	8b 45 0c             	mov    0xc(%ebp),%eax
    ac5c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    ac5f:	b8 11 00 00 00       	mov    $0x11,%eax
    ac64:	2b 45 f4             	sub    -0xc(%ebp),%eax
    ac67:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac6a:	dd 04 d5 c0 04 01 00 	fldl   0x104c0(,%edx,8)
    ac71:	dc 4d d8             	fmull  -0x28(%ebp)
    ac74:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac77:	dd 04 d5 00 05 01 00 	fldl   0x10500(,%edx,8)
    ac7e:	dc 4d d0             	fmull  -0x30(%ebp)
    ac81:	de e9                	fsubrp %st,%st(1)
    ac83:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    ac86:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ac89:	8d 50 01             	lea    0x1(%eax),%edx
    ac8c:	89 d0                	mov    %edx,%eax
    ac8e:	c1 e0 03             	shl    $0x3,%eax
    ac91:	01 d0                	add    %edx,%eax
    ac93:	c1 e0 04             	shl    $0x4,%eax
    ac96:	89 c2                	mov    %eax,%edx
    ac98:	8b 45 0c             	mov    0xc(%ebp),%eax
    ac9b:	01 c2                	add    %eax,%edx
    ac9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aca0:	dd 04 c5 c0 04 01 00 	fldl   0x104c0(,%eax,8)
    aca7:	dc 4d d0             	fmull  -0x30(%ebp)
    acaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    acad:	dd 04 c5 00 05 01 00 	fldl   0x10500(,%eax,8)
    acb4:	dc 4d d8             	fmull  -0x28(%ebp)
    acb7:	de c1                	faddp  %st,%st(1)
    acb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    acbc:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    acbf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    acc3:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    acc7:	0f 8e 3b ff ff ff    	jle    ac08 <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    accd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    acd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    acd4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    acd7:	0f 8c 1f ff ff ff    	jl     abfc <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    acdd:	c9                   	leave  
    acde:	c3                   	ret    

0000acdf <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    acdf:	55                   	push   %ebp
    ace0:	89 e5                	mov    %esp,%ebp
    ace2:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    ace8:	a1 40 05 01 00       	mov    0x10540,%eax
    aced:	85 c0                	test   %eax,%eax
    acef:	0f 85 59 02 00 00    	jne    af4e <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    acf5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    acfc:	eb 29                	jmp    ad27 <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    acfe:	db 45 f4             	fildl  -0xc(%ebp)
    ad01:	dd 05 70 e6 00 00    	fldl   0xe670
    ad07:	de c1                	faddp  %st,%st(1)
    ad09:	dd 05 78 e6 00 00    	fldl   0xe678
    ad0f:	de c9                	fmulp  %st,%st(1)
    ad11:	dd 1c 24             	fstpl  (%esp)
    ad14:	e8 53 a8 ff ff       	call   556c <sin>
    ad19:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad1c:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    ad23:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad27:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    ad2b:	7e d1                	jle    acfe <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    ad2d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ad34:	eb 2c                	jmp    ad62 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    ad36:	db 45 f4             	fildl  -0xc(%ebp)
    ad39:	dd 05 70 e6 00 00    	fldl   0xe670
    ad3f:	de c1                	faddp  %st,%st(1)
    ad41:	dd 05 78 e6 00 00    	fldl   0xe678
    ad47:	de c9                	fmulp  %st,%st(1)
    ad49:	dd 1c 24             	fstpl  (%esp)
    ad4c:	e8 1b a8 ff ff       	call   556c <sin>
    ad51:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad54:	83 c0 24             	add    $0x24,%eax
    ad57:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    ad5e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad62:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    ad66:	7e ce                	jle    ad36 <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    ad68:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    ad6f:	eb 13                	jmp    ad84 <inv_mdct+0xa5>
         win[1][i] = 1.0;
    ad71:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad74:	83 c0 24             	add    $0x24,%eax
    ad77:	d9 e8                	fld1   
    ad79:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    ad80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad84:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    ad88:	7e e7                	jle    ad71 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    ad8a:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    ad91:	eb 34                	jmp    adc7 <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    ad93:	db 45 f4             	fildl  -0xc(%ebp)
    ad96:	dd 05 70 e6 00 00    	fldl   0xe670
    ad9c:	de c1                	faddp  %st,%st(1)
    ad9e:	dd 05 80 e6 00 00    	fldl   0xe680
    ada4:	de e9                	fsubrp %st,%st(1)
    ada6:	dd 05 60 e6 00 00    	fldl   0xe660
    adac:	de c9                	fmulp  %st,%st(1)
    adae:	dd 1c 24             	fstpl  (%esp)
    adb1:	e8 b6 a7 ff ff       	call   556c <sin>
    adb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    adb9:	83 c0 24             	add    $0x24,%eax
    adbc:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    adc3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    adc7:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    adcb:	7e c6                	jle    ad93 <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    adcd:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    add4:	eb 13                	jmp    ade9 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    add6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    add9:	83 c0 24             	add    $0x24,%eax
    addc:	d9 ee                	fldz   
    adde:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    ade5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ade9:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    aded:	7e e7                	jle    add6 <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    adef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    adf6:	eb 13                	jmp    ae0b <inv_mdct+0x12c>
         win[3][i] = 0.0;
    adf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    adfb:	83 c0 6c             	add    $0x6c,%eax
    adfe:	d9 ee                	fldz   
    ae00:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    ae07:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ae0b:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    ae0f:	7e e7                	jle    adf8 <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    ae11:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    ae18:	eb 34                	jmp    ae4e <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    ae1a:	db 45 f4             	fildl  -0xc(%ebp)
    ae1d:	dd 05 70 e6 00 00    	fldl   0xe670
    ae23:	de c1                	faddp  %st,%st(1)
    ae25:	dd 05 88 e6 00 00    	fldl   0xe688
    ae2b:	de e9                	fsubrp %st,%st(1)
    ae2d:	dd 05 60 e6 00 00    	fldl   0xe660
    ae33:	de c9                	fmulp  %st,%st(1)
    ae35:	dd 1c 24             	fstpl  (%esp)
    ae38:	e8 2f a7 ff ff       	call   556c <sin>
    ae3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae40:	83 c0 6c             	add    $0x6c,%eax
    ae43:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    ae4a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ae4e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    ae52:	7e c6                	jle    ae1a <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    ae54:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    ae5b:	eb 13                	jmp    ae70 <inv_mdct+0x191>
         win[3][i] =1.0;
    ae5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae60:	83 c0 6c             	add    $0x6c,%eax
    ae63:	d9 e8                	fld1   
    ae65:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    ae6c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ae70:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    ae74:	7e e7                	jle    ae5d <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    ae76:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    ae7d:	eb 2c                	jmp    aeab <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    ae7f:	db 45 f4             	fildl  -0xc(%ebp)
    ae82:	dd 05 70 e6 00 00    	fldl   0xe670
    ae88:	de c1                	faddp  %st,%st(1)
    ae8a:	dd 05 78 e6 00 00    	fldl   0xe678
    ae90:	de c9                	fmulp  %st,%st(1)
    ae92:	dd 1c 24             	fstpl  (%esp)
    ae95:	e8 d2 a6 ff ff       	call   556c <sin>
    ae9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae9d:	83 c0 6c             	add    $0x6c,%eax
    aea0:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    aea7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aeab:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    aeaf:	7e ce                	jle    ae7f <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    aeb1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    aeb8:	eb 2c                	jmp    aee6 <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    aeba:	db 45 f4             	fildl  -0xc(%ebp)
    aebd:	dd 05 70 e6 00 00    	fldl   0xe670
    aec3:	de c1                	faddp  %st,%st(1)
    aec5:	dd 05 60 e6 00 00    	fldl   0xe660
    aecb:	de c9                	fmulp  %st,%st(1)
    aecd:	dd 1c 24             	fstpl  (%esp)
    aed0:	e8 97 a6 ff ff       	call   556c <sin>
    aed5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aed8:	83 c0 48             	add    $0x48,%eax
    aedb:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    aee2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aee6:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    aeea:	7e ce                	jle    aeba <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    aeec:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    aef3:	eb 13                	jmp    af08 <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    aef5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    aef8:	83 c0 48             	add    $0x48,%eax
    aefb:	d9 ee                	fldz   
    aefd:	dd 1c c5 60 05 01 00 	fstpl  0x10560(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    af04:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af08:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    af0c:	7e e7                	jle    aef5 <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    af0e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    af15:	eb 21                	jmp    af38 <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    af17:	db 45 f4             	fildl  -0xc(%ebp)
    af1a:	dd 05 90 e6 00 00    	fldl   0xe690
    af20:	de c9                	fmulp  %st,%st(1)
    af22:	dd 1c 24             	fstpl  (%esp)
    af25:	e8 e1 a6 ff ff       	call   560b <cos>
    af2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    af2d:	dd 1c c5 e0 09 01 00 	fstpl  0x109e0(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    af34:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af38:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    af3f:	7e d6                	jle    af17 <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    af41:	a1 40 05 01 00       	mov    0x10540,%eax
    af46:	83 c0 01             	add    $0x1,%eax
    af49:	a3 40 05 01 00       	mov    %eax,0x10540
    }

    for(i=0;i<36;i++)
    af4e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    af55:	eb 17                	jmp    af6e <inv_mdct+0x28f>
       out[i]=0;
    af57:	8b 45 f4             	mov    -0xc(%ebp),%eax
    af5a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    af61:	8b 45 0c             	mov    0xc(%ebp),%eax
    af64:	01 d0                	add    %edx,%eax
    af66:	d9 ee                	fldz   
    af68:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    af6a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    af6e:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    af72:	7e e3                	jle    af57 <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    af74:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    af78:	0f 85 85 01 00 00    	jne    b103 <inv_mdct+0x424>
       N=12;
    af7e:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    af85:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    af8c:	e9 63 01 00 00       	jmp    b0f4 <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    af91:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    af98:	e9 df 00 00 00       	jmp    b07c <inv_mdct+0x39d>
             sum = 0.0;
    af9d:	d9 ee                	fldz   
    af9f:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    afa2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    afa9:	e9 8f 00 00 00       	jmp    b03d <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    afae:	8b 55 f0             	mov    -0x10(%ebp),%edx
    afb1:	89 d0                	mov    %edx,%eax
    afb3:	01 c0                	add    %eax,%eax
    afb5:	01 c2                	add    %eax,%edx
    afb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    afba:	01 d0                	add    %edx,%eax
    afbc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    afc3:	8b 45 08             	mov    0x8(%ebp),%eax
    afc6:	01 d0                	add    %edx,%eax
    afc8:	dd 00                	fldl   (%eax)
    afca:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    afd0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    afd3:	01 c0                	add    %eax,%eax
    afd5:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    afdb:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    afe1:	dd 05 98 e6 00 00    	fldl   0xe698
    afe7:	de f1                	fdivp  %st,%st(1)
    afe9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    afec:	01 c0                	add    %eax,%eax
    afee:	8d 50 01             	lea    0x1(%eax),%edx
    aff1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    aff4:	89 c1                	mov    %eax,%ecx
    aff6:	c1 e9 1f             	shr    $0x1f,%ecx
    aff9:	01 c8                	add    %ecx,%eax
    affb:	d1 f8                	sar    %eax
    affd:	01 d0                	add    %edx,%eax
    afff:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    b005:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    b00b:	de c9                	fmulp  %st,%st(1)
    b00d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b010:	01 c0                	add    %eax,%eax
    b012:	83 c0 01             	add    $0x1,%eax
    b015:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    b01b:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    b021:	de c9                	fmulp  %st,%st(1)
    b023:	dd 1c 24             	fstpl  (%esp)
    b026:	e8 e0 a5 ff ff       	call   560b <cos>
    b02b:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    b031:	dd 45 e0             	fldl   -0x20(%ebp)
    b034:	de c1                	faddp  %st,%st(1)
    b036:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    b039:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b03d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b040:	89 c2                	mov    %eax,%edx
    b042:	c1 ea 1f             	shr    $0x1f,%edx
    b045:	01 d0                	add    %edx,%eax
    b047:	d1 f8                	sar    %eax
    b049:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b04c:	0f 8f 5c ff ff ff    	jg     afae <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    b052:	8b 55 10             	mov    0x10(%ebp),%edx
    b055:	89 d0                	mov    %edx,%eax
    b057:	c1 e0 03             	shl    $0x3,%eax
    b05a:	01 d0                	add    %edx,%eax
    b05c:	c1 e0 02             	shl    $0x2,%eax
    b05f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    b062:	01 d0                	add    %edx,%eax
    b064:	dd 04 c5 60 05 01 00 	fldl   0x10560(,%eax,8)
    b06b:	dc 4d e0             	fmull  -0x20(%ebp)
    b06e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b071:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    b078:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b07c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b07f:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b082:	0f 8c 15 ff ff ff    	jl     af9d <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    b088:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b08f:	eb 57                	jmp    b0e8 <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    b091:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b094:	89 d0                	mov    %edx,%eax
    b096:	01 c0                	add    %eax,%eax
    b098:	01 d0                	add    %edx,%eax
    b09a:	01 c0                	add    %eax,%eax
    b09c:	89 c2                	mov    %eax,%edx
    b09e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b0a1:	01 d0                	add    %edx,%eax
    b0a3:	83 c0 06             	add    $0x6,%eax
    b0a6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b0ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    b0b0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b0b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b0b6:	89 d0                	mov    %edx,%eax
    b0b8:	01 c0                	add    %eax,%eax
    b0ba:	01 d0                	add    %edx,%eax
    b0bc:	01 c0                	add    %eax,%eax
    b0be:	89 c2                	mov    %eax,%edx
    b0c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b0c3:	01 d0                	add    %edx,%eax
    b0c5:	83 c0 06             	add    $0x6,%eax
    b0c8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b0cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    b0d2:	01 d0                	add    %edx,%eax
    b0d4:	dd 00                	fldl   (%eax)
    b0d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b0d9:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    b0e0:	de c1                	faddp  %st,%st(1)
    b0e2:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    b0e4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b0e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b0eb:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b0ee:	7c a1                	jl     b091 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    b0f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b0f4:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    b0f8:	0f 8e 93 fe ff ff    	jle    af91 <inv_mdct+0x2b2>
    b0fe:	e9 da 00 00 00       	jmp    b1dd <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    b103:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    b10a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b111:	e9 bb 00 00 00       	jmp    b1d1 <inv_mdct+0x4f2>
         sum = 0.0;
    b116:	d9 ee                	fldz   
    b118:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    b11b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b122:	eb 6a                	jmp    b18e <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    b124:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b127:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b12e:	8b 45 08             	mov    0x8(%ebp),%eax
    b131:	01 d0                	add    %edx,%eax
    b133:	dd 00                	fldl   (%eax)
    b135:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b138:	01 c0                	add    %eax,%eax
    b13a:	8d 50 01             	lea    0x1(%eax),%edx
    b13d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b140:	89 c1                	mov    %eax,%ecx
    b142:	c1 e9 1f             	shr    $0x1f,%ecx
    b145:	01 c8                	add    %ecx,%eax
    b147:	d1 f8                	sar    %eax
    b149:	01 c2                	add    %eax,%edx
    b14b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b14e:	01 c0                	add    %eax,%eax
    b150:	83 c0 01             	add    $0x1,%eax
    b153:	89 d1                	mov    %edx,%ecx
    b155:	0f af c8             	imul   %eax,%ecx
    b158:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    b15d:	89 c8                	mov    %ecx,%eax
    b15f:	f7 ea                	imul   %edx
    b161:	c1 fa 05             	sar    $0x5,%edx
    b164:	89 c8                	mov    %ecx,%eax
    b166:	c1 f8 1f             	sar    $0x1f,%eax
    b169:	29 c2                	sub    %eax,%edx
    b16b:	89 d0                	mov    %edx,%eax
    b16d:	c1 e0 03             	shl    $0x3,%eax
    b170:	01 d0                	add    %edx,%eax
    b172:	c1 e0 04             	shl    $0x4,%eax
    b175:	29 c1                	sub    %eax,%ecx
    b177:	89 ca                	mov    %ecx,%edx
    b179:	dd 04 d5 e0 09 01 00 	fldl   0x109e0(,%edx,8)
    b180:	de c9                	fmulp  %st,%st(1)
    b182:	dd 45 e0             	fldl   -0x20(%ebp)
    b185:	de c1                	faddp  %st,%st(1)
    b187:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    b18a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b18e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    b191:	89 c2                	mov    %eax,%edx
    b193:	c1 ea 1f             	shr    $0x1f,%edx
    b196:	01 d0                	add    %edx,%eax
    b198:	d1 f8                	sar    %eax
    b19a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b19d:	7f 85                	jg     b124 <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    b19f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b1a2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b1a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    b1ac:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b1af:	8b 55 10             	mov    0x10(%ebp),%edx
    b1b2:	89 d0                	mov    %edx,%eax
    b1b4:	c1 e0 03             	shl    $0x3,%eax
    b1b7:	01 d0                	add    %edx,%eax
    b1b9:	c1 e0 02             	shl    $0x2,%eax
    b1bc:	8b 55 ec             	mov    -0x14(%ebp),%edx
    b1bf:	01 d0                	add    %edx,%eax
    b1c1:	dd 04 c5 60 05 01 00 	fldl   0x10560(,%eax,8)
    b1c8:	dc 4d e0             	fmull  -0x20(%ebp)
    b1cb:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    b1cd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b1d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b1d4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    b1d7:	0f 8c 39 ff ff ff    	jl     b116 <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    b1dd:	c9                   	leave  
    b1de:	c3                   	ret    

0000b1df <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    b1df:	55                   	push   %ebp
    b1e0:	89 e5                	mov    %esp,%ebp
    b1e2:	53                   	push   %ebx
    b1e3:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    b1e9:	a1 64 04 01 00       	mov    0x10464,%eax
    b1ee:	85 c0                	test   %eax,%eax
    b1f0:	74 6f                	je     b261 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    b1f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b1f9:	eb 56                	jmp    b251 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    b1fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b202:	eb 43                	jmp    b247 <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    b204:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b20b:	eb 30                	jmp    b23d <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    b20d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b210:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    b213:	89 c2                	mov    %eax,%edx
    b215:	c1 e2 03             	shl    $0x3,%edx
    b218:	01 c2                	add    %eax,%edx
    b21a:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b21d:	89 c2                	mov    %eax,%edx
    b21f:	89 c8                	mov    %ecx,%eax
    b221:	c1 e0 03             	shl    $0x3,%eax
    b224:	01 c8                	add    %ecx,%eax
    b226:	c1 e0 06             	shl    $0x6,%eax
    b229:	01 c2                	add    %eax,%edx
    b22b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b22e:	01 d0                	add    %edx,%eax
    b230:	d9 ee                	fldz   
    b232:	dd 1c c5 60 0e 01 00 	fstpl  0x10e60(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    b239:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b23d:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    b241:	7e ca                	jle    b20d <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    b243:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b247:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    b24b:	7e b7                	jle    b204 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    b24d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b251:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    b255:	7e a4                	jle    b1fb <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    b257:	c7 05 64 04 01 00 00 	movl   $0x0,0x10464
    b25e:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b261:	8b 45 18             	mov    0x18(%ebp),%eax
    b264:	8b 40 10             	mov    0x10(%eax),%eax
    b267:	85 c0                	test   %eax,%eax
    b269:	74 10                	je     b27b <III_hybrid+0x9c>
    b26b:	8b 45 18             	mov    0x18(%ebp),%eax
    b26e:	8b 40 18             	mov    0x18(%eax),%eax
    b271:	85 c0                	test   %eax,%eax
    b273:	74 06                	je     b27b <III_hybrid+0x9c>
    b275:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    b279:	7e 08                	jle    b283 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    b27b:	8b 45 18             	mov    0x18(%ebp),%eax
    b27e:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b281:	eb 05                	jmp    b288 <III_hybrid+0xa9>
    b283:	b8 00 00 00 00       	mov    $0x0,%eax
    b288:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    b28b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    b28e:	89 44 24 08          	mov    %eax,0x8(%esp)
    b292:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    b298:	89 44 24 04          	mov    %eax,0x4(%esp)
    b29c:	8b 45 08             	mov    0x8(%ebp),%eax
    b29f:	89 04 24             	mov    %eax,(%esp)
    b2a2:	e8 38 fa ff ff       	call   acdf <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    b2a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b2ae:	e9 83 00 00 00       	jmp    b336 <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    b2b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b2b6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
    b2c0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    b2c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b2c6:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    b2cd:	8b 45 10             	mov    0x10(%ebp),%eax
    b2d0:	8b 4d 14             	mov    0x14(%ebp),%ecx
    b2d3:	89 c2                	mov    %eax,%edx
    b2d5:	c1 e2 03             	shl    $0x3,%edx
    b2d8:	01 c2                	add    %eax,%edx
    b2da:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b2dd:	89 c2                	mov    %eax,%edx
    b2df:	89 c8                	mov    %ecx,%eax
    b2e1:	c1 e0 03             	shl    $0x3,%eax
    b2e4:	01 c8                	add    %ecx,%eax
    b2e6:	c1 e0 06             	shl    $0x6,%eax
    b2e9:	01 c2                	add    %eax,%edx
    b2eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b2ee:	01 d0                	add    %edx,%eax
    b2f0:	dd 04 c5 60 0e 01 00 	fldl   0x10e60(,%eax,8)
    b2f7:	de c1                	faddp  %st,%st(1)
    b2f9:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    b2fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b2fe:	83 c0 12             	add    $0x12,%eax
    b301:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    b308:	8b 45 10             	mov    0x10(%ebp),%eax
    b30b:	8b 4d 14             	mov    0x14(%ebp),%ecx
    b30e:	89 c2                	mov    %eax,%edx
    b310:	c1 e2 03             	shl    $0x3,%edx
    b313:	01 c2                	add    %eax,%edx
    b315:	8d 04 12             	lea    (%edx,%edx,1),%eax
    b318:	89 c2                	mov    %eax,%edx
    b31a:	89 c8                	mov    %ecx,%eax
    b31c:	c1 e0 03             	shl    $0x3,%eax
    b31f:	01 c8                	add    %ecx,%eax
    b321:	c1 e0 06             	shl    $0x6,%eax
    b324:	01 c2                	add    %eax,%edx
    b326:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b329:	01 d0                	add    %edx,%eax
    b32b:	dd 1c c5 60 0e 01 00 	fstpl  0x10e60(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    b332:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b336:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b33a:	0f 8e 73 ff ff ff    	jle    b2b3 <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    b340:	81 c4 54 01 00 00    	add    $0x154,%esp
    b346:	5b                   	pop    %ebx
    b347:	5d                   	pop    %ebp
    b348:	c3                   	ret    

0000b349 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    b349:	55                   	push   %ebp
    b34a:	89 e5                	mov    %esp,%ebp
    b34c:	57                   	push   %edi
    b34d:	56                   	push   %esi
    b34e:	53                   	push   %ebx
    b34f:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    b352:	be 00 00 00 00       	mov    $0x0,%esi
    b357:	e9 1c 01 00 00       	jmp    b478 <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    b35c:	bb 00 00 00 00       	mov    $0x0,%ebx
    b361:	e9 06 01 00 00       	jmp    b46c <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    b366:	89 f0                	mov    %esi,%eax
    b368:	c1 e0 08             	shl    $0x8,%eax
    b36b:	89 c2                	mov    %eax,%edx
    b36d:	8b 45 08             	mov    0x8(%ebp),%eax
    b370:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    b373:	89 75 e0             	mov    %esi,-0x20(%ebp)
    b376:	db 45 e0             	fildl  -0x20(%ebp)
    b379:	dd 05 a0 e6 00 00    	fldl   0xe6a0
    b37f:	de c9                	fmulp  %st,%st(1)
    b381:	dd 05 a8 e6 00 00    	fldl   0xe6a8
    b387:	de c1                	faddp  %st,%st(1)
    b389:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    b38c:	83 c0 01             	add    $0x1,%eax
    b38f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    b392:	db 45 e0             	fildl  -0x20(%ebp)
    b395:	de c9                	fmulp  %st,%st(1)
    b397:	dd 1c 24             	fstpl  (%esp)
    b39a:	e8 6c a2 ff ff       	call   560b <cos>
    b39f:	dd 05 b0 e6 00 00    	fldl   0xe6b0
    b3a5:	de c9                	fmulp  %st,%st(1)
    b3a7:	dd 1c df             	fstpl  (%edi,%ebx,8)
    b3aa:	dd 04 df             	fldl   (%edi,%ebx,8)
    b3ad:	d9 ee                	fldz   
    b3af:	d9 c9                	fxch   %st(1)
    b3b1:	df e9                	fucomip %st(1),%st
    b3b3:	dd d8                	fstp   %st(0)
    b3b5:	72 47                	jb     b3fe <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    b3b7:	89 f0                	mov    %esi,%eax
    b3b9:	c1 e0 08             	shl    $0x8,%eax
    b3bc:	89 c2                	mov    %eax,%edx
    b3be:	8b 45 08             	mov    0x8(%ebp),%eax
    b3c1:	01 c2                	add    %eax,%edx
    b3c3:	89 f0                	mov    %esi,%eax
    b3c5:	c1 e0 08             	shl    $0x8,%eax
    b3c8:	89 c1                	mov    %eax,%ecx
    b3ca:	8b 45 08             	mov    0x8(%ebp),%eax
    b3cd:	01 c8                	add    %ecx,%eax
    b3cf:	dd 04 d8             	fldl   (%eax,%ebx,8)
    b3d2:	dd 05 70 e6 00 00    	fldl   0xe670
    b3d8:	de c1                	faddp  %st,%st(1)
    b3da:	d9 7d e6             	fnstcw -0x1a(%ebp)
    b3dd:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    b3e1:	b4 0c                	mov    $0xc,%ah
    b3e3:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    b3e7:	d9 6d e4             	fldcw  -0x1c(%ebp)
    b3ea:	db 5d e0             	fistpl -0x20(%ebp)
    b3ed:	d9 6d e6             	fldcw  -0x1a(%ebp)
    b3f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b3f3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    b3f6:	db 45 e0             	fildl  -0x20(%ebp)
    b3f9:	dd 1c da             	fstpl  (%edx,%ebx,8)
    b3fc:	eb 45                	jmp    b443 <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    b3fe:	89 f0                	mov    %esi,%eax
    b400:	c1 e0 08             	shl    $0x8,%eax
    b403:	89 c2                	mov    %eax,%edx
    b405:	8b 45 08             	mov    0x8(%ebp),%eax
    b408:	01 c2                	add    %eax,%edx
    b40a:	89 f0                	mov    %esi,%eax
    b40c:	c1 e0 08             	shl    $0x8,%eax
    b40f:	89 c1                	mov    %eax,%ecx
    b411:	8b 45 08             	mov    0x8(%ebp),%eax
    b414:	01 c8                	add    %ecx,%eax
    b416:	dd 04 d8             	fldl   (%eax,%ebx,8)
    b419:	dd 05 70 e6 00 00    	fldl   0xe670
    b41f:	de e9                	fsubrp %st,%st(1)
    b421:	d9 7d e6             	fnstcw -0x1a(%ebp)
    b424:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    b428:	b4 0c                	mov    $0xc,%ah
    b42a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    b42e:	d9 6d e4             	fldcw  -0x1c(%ebp)
    b431:	db 5d e0             	fistpl -0x20(%ebp)
    b434:	d9 6d e6             	fldcw  -0x1a(%ebp)
    b437:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b43a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    b43d:	db 45 e0             	fildl  -0x20(%ebp)
    b440:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    b443:	89 f0                	mov    %esi,%eax
    b445:	c1 e0 08             	shl    $0x8,%eax
    b448:	89 c2                	mov    %eax,%edx
    b44a:	8b 45 08             	mov    0x8(%ebp),%eax
    b44d:	01 d0                	add    %edx,%eax
    b44f:	89 f2                	mov    %esi,%edx
    b451:	89 d1                	mov    %edx,%ecx
    b453:	c1 e1 08             	shl    $0x8,%ecx
    b456:	8b 55 08             	mov    0x8(%ebp),%edx
    b459:	01 ca                	add    %ecx,%edx
    b45b:	dd 04 da             	fldl   (%edx,%ebx,8)
    b45e:	dd 05 b8 e6 00 00    	fldl   0xe6b8
    b464:	de c9                	fmulp  %st,%st(1)
    b466:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    b469:	83 c3 01             	add    $0x1,%ebx
    b46c:	83 fb 1f             	cmp    $0x1f,%ebx
    b46f:	0f 8e f1 fe ff ff    	jle    b366 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    b475:	83 c6 01             	add    $0x1,%esi
    b478:	83 fe 3f             	cmp    $0x3f,%esi
    b47b:	0f 8e db fe ff ff    	jle    b35c <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    b481:	83 c4 1c             	add    $0x1c,%esp
    b484:	5b                   	pop    %ebx
    b485:	5e                   	pop    %esi
    b486:	5f                   	pop    %edi
    b487:	5d                   	pop    %ebp
    b488:	c3                   	ret    

0000b489 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    b489:	55                   	push   %ebp
    b48a:	89 e5                	mov    %esp,%ebp
    b48c:	57                   	push   %edi
    b48d:	56                   	push   %esi
    b48e:	53                   	push   %ebx
    b48f:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    b495:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    b49b:	bb 20 d6 00 00       	mov    $0xd620,%ebx
    b4a0:	b8 00 04 00 00       	mov    $0x400,%eax
    b4a5:	89 d7                	mov    %edx,%edi
    b4a7:	89 de                	mov    %ebx,%esi
    b4a9:	89 c1                	mov    %eax,%ecx
    b4ab:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    b4ad:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    b4b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    b4b6:	81 c4 14 10 00 00    	add    $0x1014,%esp
    b4bc:	5b                   	pop    %ebx
    b4bd:	5e                   	pop    %esi
    b4be:	5f                   	pop    %edi
    b4bf:	5d                   	pop    %ebp
    b4c0:	c3                   	ret    

0000b4c1 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    b4c1:	55                   	push   %ebp
    b4c2:	89 e5                	mov    %esp,%ebp
    b4c4:	57                   	push   %edi
    b4c5:	56                   	push   %esi
    b4c6:	53                   	push   %ebx
    b4c7:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    b4ca:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    b4d1:	a1 68 04 01 00       	mov    0x10468,%eax
    b4d6:	85 c0                	test   %eax,%eax
    b4d8:	74 6f                	je     b549 <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    b4da:	c7 44 24 04 20 e6 00 	movl   $0xe620,0x4(%esp)
    b4e1:	00 
    b4e2:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    b4e9:	e8 15 a8 ff ff       	call   5d03 <mem_alloc>
    b4ee:	a3 60 32 01 00       	mov    %eax,0x13260
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    b4f3:	c7 44 24 04 23 e6 00 	movl   $0xe623,0x4(%esp)
    b4fa:	00 
    b4fb:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    b502:	e8 fc a7 ff ff       	call   5d03 <mem_alloc>
    b507:	a3 64 32 01 00       	mov    %eax,0x13264
		create_syn_filter(*filter);
    b50c:	a1 64 32 01 00       	mov    0x13264,%eax
    b511:	89 04 24             	mov    %eax,(%esp)
    b514:	e8 30 fe ff ff       	call   b349 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    b519:	c7 44 24 04 26 e6 00 	movl   $0xe626,0x4(%esp)
    b520:	00 
    b521:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    b528:	e8 d6 a7 ff ff       	call   5d03 <mem_alloc>
    b52d:	a3 68 32 01 00       	mov    %eax,0x13268
		read_syn_window(window);
    b532:	a1 68 32 01 00       	mov    0x13268,%eax
    b537:	89 04 24             	mov    %eax,(%esp)
    b53a:	e8 4a ff ff ff       	call   b489 <read_syn_window>
		init = 0;
    b53f:	c7 05 68 04 01 00 00 	movl   $0x0,0x10468
    b546:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    b549:	8b 45 0c             	mov    0xc(%ebp),%eax
    b54c:	8b 04 85 6c 04 01 00 	mov    0x1046c(,%eax,4),%eax
    b553:	83 e8 40             	sub    $0x40,%eax
    b556:	25 ff 03 00 00       	and    $0x3ff,%eax
    b55b:	89 c2                	mov    %eax,%edx
    b55d:	8b 45 0c             	mov    0xc(%ebp),%eax
    b560:	89 14 85 6c 04 01 00 	mov    %edx,0x1046c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    b567:	8b 15 60 32 01 00    	mov    0x13260,%edx
    b56d:	8b 45 0c             	mov    0xc(%ebp),%eax
    b570:	8b 04 85 6c 04 01 00 	mov    0x1046c(,%eax,4),%eax
    b577:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b57a:	c1 e1 0a             	shl    $0xa,%ecx
    b57d:	01 c8                	add    %ecx,%eax
    b57f:	c1 e0 03             	shl    $0x3,%eax
    b582:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    b585:	bb 00 00 00 00       	mov    $0x0,%ebx
    b58a:	eb 40                	jmp    b5cc <SubBandSynthesis+0x10b>
		sum = 0;
    b58c:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    b58e:	be 00 00 00 00       	mov    $0x0,%esi
    b593:	eb 26                	jmp    b5bb <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    b595:	89 f0                	mov    %esi,%eax
    b597:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b59e:	8b 45 08             	mov    0x8(%ebp),%eax
    b5a1:	01 d0                	add    %edx,%eax
    b5a3:	dd 00                	fldl   (%eax)
    b5a5:	a1 64 32 01 00       	mov    0x13264,%eax
    b5aa:	89 da                	mov    %ebx,%edx
    b5ac:	c1 e2 05             	shl    $0x5,%edx
    b5af:	01 f2                	add    %esi,%edx
    b5b1:	dd 04 d0             	fldl   (%eax,%edx,8)
    b5b4:	de c9                	fmulp  %st,%st(1)
    b5b6:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    b5b8:	83 c6 01             	add    $0x1,%esi
    b5bb:	83 fe 1f             	cmp    $0x1f,%esi
    b5be:	7e d5                	jle    b595 <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    b5c0:	89 d8                	mov    %ebx,%eax
    b5c2:	c1 e0 03             	shl    $0x3,%eax
    b5c5:	01 f8                	add    %edi,%eax
    b5c7:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    b5c9:	83 c3 01             	add    $0x1,%ebx
    b5cc:	83 fb 3f             	cmp    $0x3f,%ebx
    b5cf:	7e bb                	jle    b58c <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b5d1:	bf 00 00 00 00       	mov    $0x0,%edi
    b5d6:	e9 c7 00 00 00       	jmp    b6a2 <SubBandSynthesis+0x1e1>
		sum = 0;
    b5db:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    b5dd:	bb 00 00 00 00       	mov    $0x0,%ebx
    b5e2:	eb 4c                	jmp    b630 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    b5e4:	89 d8                	mov    %ebx,%eax
    b5e6:	c1 e0 05             	shl    $0x5,%eax
    b5e9:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b5ec:	a1 68 32 01 00       	mov    0x13268,%eax
    b5f1:	89 f2                	mov    %esi,%edx
    b5f3:	c1 e2 03             	shl    $0x3,%edx
    b5f6:	01 d0                	add    %edx,%eax
    b5f8:	dd 00                	fldl   (%eax)
    b5fa:	a1 60 32 01 00       	mov    0x13260,%eax
    b5ff:	8d 53 01             	lea    0x1(%ebx),%edx
    b602:	d1 fa                	sar    %edx
    b604:	c1 e2 06             	shl    $0x6,%edx
    b607:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    b60a:	8b 55 0c             	mov    0xc(%ebp),%edx
    b60d:	8b 14 95 6c 04 01 00 	mov    0x1046c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b614:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    b616:	89 d1                	mov    %edx,%ecx
    b618:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    b61e:	8b 55 0c             	mov    0xc(%ebp),%edx
    b621:	c1 e2 0a             	shl    $0xa,%edx
    b624:	01 ca                	add    %ecx,%edx
    b626:	dd 04 d0             	fldl   (%eax,%edx,8)
    b629:	de c9                	fmulp  %st,%st(1)
    b62b:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    b62d:	83 c3 01             	add    $0x1,%ebx
    b630:	83 fb 0f             	cmp    $0xf,%ebx
    b633:	7e af                	jle    b5e4 <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    b635:	dd 05 c0 e6 00 00    	fldl   0xe6c0
    b63b:	de c9                	fmulp  %st,%st(1)
    b63d:	d9 7d d6             	fnstcw -0x2a(%ebp)
    b640:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    b644:	b4 0c                	mov    $0xc,%ah
    b646:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    b64a:	d9 6d d4             	fldcw  -0x2c(%ebp)
    b64d:	db 5d e0             	fistpl -0x20(%ebp)
    b650:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    b653:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    b65a:	7e 15                	jle    b671 <SubBandSynthesis+0x1b0>
    b65c:	89 f8                	mov    %edi,%eax
    b65e:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b661:	8b 45 10             	mov    0x10(%ebp),%eax
    b664:	01 d0                	add    %edx,%eax
    b666:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    b66b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b66f:	eb 2e                	jmp    b69f <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    b671:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    b678:	7d 15                	jge    b68f <SubBandSynthesis+0x1ce>
    b67a:	89 f8                	mov    %edi,%eax
    b67c:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b67f:	8b 45 10             	mov    0x10(%ebp),%eax
    b682:	01 d0                	add    %edx,%eax
    b684:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    b689:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b68d:	eb 10                	jmp    b69f <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    b68f:	89 f8                	mov    %edi,%eax
    b691:	8d 14 00             	lea    (%eax,%eax,1),%edx
    b694:	8b 45 10             	mov    0x10(%ebp),%eax
    b697:	01 c2                	add    %eax,%edx
    b699:	8b 45 e0             	mov    -0x20(%ebp),%eax
    b69c:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    b69f:	83 c7 01             	add    $0x1,%edi
    b6a2:	83 ff 1f             	cmp    $0x1f,%edi
    b6a5:	0f 8e 30 ff ff ff    	jle    b5db <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    b6ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    b6ae:	83 c4 2c             	add    $0x2c,%esp
    b6b1:	5b                   	pop    %ebx
    b6b2:	5e                   	pop    %esi
    b6b3:	5f                   	pop    %edi
    b6b4:	5d                   	pop    %ebp
    b6b5:	c3                   	ret    

0000b6b6 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    b6b6:	55                   	push   %ebp
    b6b7:	89 e5                	mov    %esp,%ebp
    b6b9:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    b6bc:	8b 45 10             	mov    0x10(%ebp),%eax
    b6bf:	8b 40 08             	mov    0x8(%eax),%eax
    b6c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b6c5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    b6cc:	eb 75                	jmp    b743 <out_fifo+0x8d>
    b6ce:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    b6d5:	eb 62                	jmp    b739 <out_fifo+0x83>
            (*psampFrames)++;
    b6d7:	8b 45 14             	mov    0x14(%ebp),%eax
    b6da:	8b 00                	mov    (%eax),%eax
    b6dc:	8d 50 01             	lea    0x1(%eax),%edx
    b6df:	8b 45 14             	mov    0x14(%ebp),%eax
    b6e2:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    b6e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b6eb:	eb 40                	jmp    b72d <out_fifo+0x77>
                if (!(k%1600) && k) {
    b6ed:	8b 0d 6c 32 01 00    	mov    0x1326c,%ecx
    b6f3:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    b6f8:	89 c8                	mov    %ecx,%eax
    b6fa:	f7 ea                	imul   %edx
    b6fc:	c1 fa 09             	sar    $0x9,%edx
    b6ff:	89 c8                	mov    %ecx,%eax
    b701:	c1 f8 1f             	sar    $0x1f,%eax
    b704:	29 c2                	sub    %eax,%edx
    b706:	89 d0                	mov    %edx,%eax
    b708:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    b70e:	29 c1                	sub    %eax,%ecx
    b710:	89 c8                	mov    %ecx,%eax
    b712:	85 c0                	test   %eax,%eax
    b714:	75 13                	jne    b729 <out_fifo+0x73>
    b716:	a1 6c 32 01 00       	mov    0x1326c,%eax
    b71b:	85 c0                	test   %eax,%eax
    b71d:	74 0a                	je     b729 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    b71f:	c7 05 6c 32 01 00 00 	movl   $0x0,0x1326c
    b726:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    b729:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b72d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b730:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b733:	7c b8                	jl     b6ed <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b735:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    b739:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    b73d:	7e 98                	jle    b6d7 <out_fifo+0x21>
    b73f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    b743:	8b 45 fc             	mov    -0x4(%ebp),%eax
    b746:	3b 45 0c             	cmp    0xc(%ebp),%eax
    b749:	7c 83                	jl     b6ce <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    b74b:	c9                   	leave  
    b74c:	c3                   	ret    

0000b74d <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    b74d:	55                   	push   %ebp
    b74e:	89 e5                	mov    %esp,%ebp
    b750:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    b753:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    b75a:	00 
    b75b:	8b 45 08             	mov    0x8(%ebp),%eax
    b75e:	89 04 24             	mov    %eax,(%esp)
    b761:	e8 8b a8 ff ff       	call   5ff1 <getbits>
    b766:	8b 55 0c             	mov    0xc(%ebp),%edx
    b769:	89 02                	mov    %eax,(%edx)
}
    b76b:	c9                   	leave  
    b76c:	c3                   	ret    

0000b76d <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    b76d:	55                   	push   %ebp
    b76e:	89 e5                	mov    %esp,%ebp
    b770:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b773:	8b 45 08             	mov    0x8(%ebp),%eax
    b776:	8b 40 0c             	mov    0xc(%eax),%eax
    b779:	83 c0 1e             	add    $0x1e,%eax
    b77c:	8b 14 85 c0 ff 00 00 	mov    0xffc0(,%eax,4),%edx
    b783:	89 d0                	mov    %edx,%eax
    b785:	c1 e0 03             	shl    $0x3,%eax
    b788:	01 d0                	add    %edx,%eax
    b78a:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    b78d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    b790:	db 45 ec             	fildl  -0x14(%ebp)
    b793:	8b 45 08             	mov    0x8(%ebp),%eax
    b796:	8b 40 10             	mov    0x10(%eax),%eax
    b799:	dd 04 c5 80 00 01 00 	fldl   0x10080(,%eax,8)
    b7a0:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b7a2:	d9 7d ea             	fnstcw -0x16(%ebp)
    b7a5:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    b7a9:	b4 0c                	mov    $0xc,%ah
    b7ab:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    b7af:	d9 6d e8             	fldcw  -0x18(%ebp)
    b7b2:	db 5d fc             	fistpl -0x4(%ebp)
    b7b5:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    b7b8:	8b 45 08             	mov    0x8(%ebp),%eax
    b7bb:	8b 40 14             	mov    0x14(%eax),%eax
    b7be:	85 c0                	test   %eax,%eax
    b7c0:	74 04                	je     b7c6 <main_data_slots+0x59>
    b7c2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    b7c6:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    b7ca:	8b 45 08             	mov    0x8(%ebp),%eax
    b7cd:	8b 40 08             	mov    0x8(%eax),%eax
    b7d0:	85 c0                	test   %eax,%eax
    b7d2:	74 04                	je     b7d8 <main_data_slots+0x6b>
		nSlots -= 2;
    b7d4:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    b7d8:	8b 45 10             	mov    0x10(%ebp),%eax
    b7db:	83 f8 01             	cmp    $0x1,%eax
    b7de:	75 06                	jne    b7e6 <main_data_slots+0x79>
		nSlots -= 17;
    b7e0:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    b7e4:	eb 04                	jmp    b7ea <main_data_slots+0x7d>
	else
		nSlots -=32;
    b7e6:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    b7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    b7ed:	c9                   	leave  
    b7ee:	c3                   	ret    
