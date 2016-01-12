
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
      7c:	05 4c 2e 01 00       	add    $0x12e4c,%eax
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
      8e:	c7 05 60 2e 01 00 00 	movl   $0x0,0x12e60
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
      9e:	83 ec 24             	sub    $0x24,%esp
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
      a1:	83 ec 0c             	sub    $0xc,%esp
      a4:	6a 30                	push   $0x30
      a6:	e8 f6 45 00 00       	call   46a1 <malloc>
      ab:	83 c4 10             	add    $0x10,%esp
      ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      b1:	83 ec 0c             	sub    $0xc,%esp
      b4:	6a 20                	push   $0x20
      b6:	e8 e6 45 00 00       	call   46a1 <malloc>
      bb:	83 c4 10             	add    $0x10,%esp
      be:	89 c2                	mov    %eax,%edx
      c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c3:	89 50 14             	mov    %edx,0x14(%eax)
	strcpy(temp->name, name);
      c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c9:	8b 40 14             	mov    0x14(%eax),%eax
      cc:	83 ec 08             	sub    $0x8,%esp
      cf:	ff 75 1c             	pushl  0x1c(%ebp)
      d2:	50                   	push   %eax
      d3:	e8 eb 3e 00 00       	call   3fc3 <strcpy>
      d8:	83 c4 10             	add    $0x10,%esp
//    for (i = 0; name[i] != 0; i++)
//    	{
//    		printf(0, "%d : %c\n", i, name[i]);
//    	}
	//printf(0, "copying name\n");
	temp->st = st;
      db:	8b 45 f4             	mov    -0xc(%ebp),%eax
      de:	8b 55 08             	mov    0x8(%ebp),%edx
      e1:	89 10                	mov    %edx,(%eax)
      e3:	8b 55 0c             	mov    0xc(%ebp),%edx
      e6:	89 50 04             	mov    %edx,0x4(%eax)
      e9:	8b 55 10             	mov    0x10(%ebp),%edx
      ec:	89 50 08             	mov    %edx,0x8(%eax)
      ef:	8b 55 14             	mov    0x14(%ebp),%edx
      f2:	89 50 0c             	mov    %edx,0xc(%eax)
      f5:	8b 55 18             	mov    0x18(%ebp),%edx
      f8:	89 50 10             	mov    %edx,0x10(%eax)
	temp->pos = getPos(context, itemCounter);
      fb:	8b 15 8c f7 00 00    	mov    0xf78c,%edx
     101:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     104:	8d 45 d8             	lea    -0x28(%ebp),%eax
     107:	83 ec 0c             	sub    $0xc,%esp
     10a:	52                   	push   %edx
     10b:	ff 35 48 2e 01 00    	pushl  0x12e48
     111:	ff 35 44 2e 01 00    	pushl  0x12e44
     117:	ff 35 40 2e 01 00    	pushl  0x12e40
     11d:	50                   	push   %eax
     11e:	e8 ea 0b 00 00       	call   d0d <getPos>
     123:	83 c4 1c             	add    $0x1c,%esp
     126:	8b 45 d8             	mov    -0x28(%ebp),%eax
     129:	89 43 18             	mov    %eax,0x18(%ebx)
     12c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     12f:	89 43 1c             	mov    %eax,0x1c(%ebx)
     132:	8b 45 e0             	mov    -0x20(%ebp),%eax
     135:	89 43 20             	mov    %eax,0x20(%ebx)
     138:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     13b:	89 43 24             	mov    %eax,0x24(%ebx)
	temp->next = fileItemList;
     13e:	8b 15 88 f7 00 00    	mov    0xf788,%edx
     144:	8b 45 f4             	mov    -0xc(%ebp),%eax
     147:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     14a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     14d:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     154:	8b 45 f4             	mov    -0xc(%ebp),%eax
     157:	a3 88 f7 00 00       	mov    %eax,0xf788
}
     15c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     15f:	c9                   	leave  
     160:	c3                   	ret    

00000161 <freeFileItemList>:

void freeFileItemList() {
     161:	55                   	push   %ebp
     162:	89 e5                	mov    %esp,%ebp
     164:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     167:	a1 88 f7 00 00       	mov    0xf788,%eax
     16c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     16f:	eb 2f                	jmp    1a0 <freeFileItemList+0x3f>
		temp = p;
     171:	8b 45 f4             	mov    -0xc(%ebp),%eax
     174:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     177:	8b 45 f4             	mov    -0xc(%ebp),%eax
     17a:	8b 40 2c             	mov    0x2c(%eax),%eax
     17d:	89 45 f4             	mov    %eax,-0xc(%ebp)
		free(temp->name);
     180:	8b 45 f0             	mov    -0x10(%ebp),%eax
     183:	8b 40 14             	mov    0x14(%eax),%eax
     186:	83 ec 0c             	sub    $0xc,%esp
     189:	50                   	push   %eax
     18a:	e8 d1 43 00 00       	call   4560 <free>
     18f:	83 c4 10             	add    $0x10,%esp
		free(temp);
     192:	83 ec 0c             	sub    $0xc,%esp
     195:	ff 75 f0             	pushl  -0x10(%ebp)
     198:	e8 c3 43 00 00       	call   4560 <free>
     19d:	83 c4 10             	add    $0x10,%esp
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     1a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     1a4:	75 cb                	jne    171 <freeFileItemList+0x10>
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
     1a6:	c7 05 88 f7 00 00 00 	movl   $0x0,0xf788
     1ad:	00 00 00 
}
     1b0:	c9                   	leave  
     1b1:	c3                   	ret    

000001b2 <fmtname>:

// 文件信息相关操作
char* fmtname(char *path) {
     1b2:	55                   	push   %ebp
     1b3:	89 e5                	mov    %esp,%ebp
     1b5:	83 ec 18             	sub    $0x18,%esp
	//static char buf[DIRSIZ+1];
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
     1b8:	83 ec 0c             	sub    $0xc,%esp
     1bb:	ff 75 08             	pushl  0x8(%ebp)
     1be:	e8 6f 3e 00 00       	call   4032 <strlen>
     1c3:	83 c4 10             	add    $0x10,%esp
     1c6:	89 c2                	mov    %eax,%edx
     1c8:	8b 45 08             	mov    0x8(%ebp),%eax
     1cb:	01 d0                	add    %edx,%eax
     1cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
     1d0:	eb 04                	jmp    1d6 <fmtname+0x24>
     1d2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1d9:	3b 45 08             	cmp    0x8(%ebp),%eax
     1dc:	72 0a                	jb     1e8 <fmtname+0x36>
     1de:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1e1:	0f b6 00             	movzbl (%eax),%eax
     1e4:	3c 2f                	cmp    $0x2f,%al
     1e6:	75 ea                	jne    1d2 <fmtname+0x20>
		;
	p++;
     1e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     1ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     1ef:	c9                   	leave  
     1f0:	c3                   	ret    

000001f1 <isListable>:

int isListable(char *name, short type) {
     1f1:	55                   	push   %ebp
     1f2:	89 e5                	mov    %esp,%ebp
     1f4:	83 ec 14             	sub    $0x14,%esp
     1f7:	8b 45 0c             	mov    0xc(%ebp),%eax
     1fa:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	char *p = name;
     1fe:	8b 45 08             	mov    0x8(%ebp),%eax
     201:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (*p == '.') return 0;
     204:	8b 45 fc             	mov    -0x4(%ebp),%eax
     207:	0f b6 00             	movzbl (%eax),%eax
     20a:	3c 2e                	cmp    $0x2e,%al
     20c:	75 07                	jne    215 <isListable+0x24>
     20e:	b8 00 00 00 00       	mov    $0x0,%eax
     213:	eb 34                	jmp    249 <isListable+0x58>
	if (type == T_DIR) return 1;
     215:	66 83 7d ec 01       	cmpw   $0x1,-0x14(%ebp)
     21a:	75 07                	jne    223 <isListable+0x32>
     21c:	b8 01 00 00 00       	mov    $0x1,%eax
     221:	eb 26                	jmp    249 <isListable+0x58>
	while (*p != 0) {
     223:	eb 15                	jmp    23a <isListable+0x49>
		if (*p == '.')
     225:	8b 45 fc             	mov    -0x4(%ebp),%eax
     228:	0f b6 00             	movzbl (%eax),%eax
     22b:	3c 2e                	cmp    $0x2e,%al
     22d:	75 07                	jne    236 <isListable+0x45>
			return 1;
     22f:	b8 01 00 00 00       	mov    $0x1,%eax
     234:	eb 13                	jmp    249 <isListable+0x58>
		p++;
     236:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
     23a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     23d:	0f b6 00             	movzbl (%eax),%eax
     240:	84 c0                	test   %al,%al
     242:	75 e1                	jne    225 <isListable+0x34>
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
     244:	b8 00 00 00 00       	mov    $0x0,%eax
}
     249:	c9                   	leave  
     24a:	c3                   	ret    

0000024b <list>:

void list(char *path) {
     24b:	55                   	push   %ebp
     24c:	89 e5                	mov    %esp,%ebp
     24e:	57                   	push   %edi
     24f:	56                   	push   %esi
     250:	53                   	push   %ebx
     251:	81 ec 4c 02 00 00    	sub    $0x24c,%esp
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
     257:	c7 05 8c f7 00 00 00 	movl   $0x0,0xf78c
     25e:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     261:	83 ec 08             	sub    $0x8,%esp
     264:	6a 00                	push   $0x0
     266:	ff 75 08             	pushl  0x8(%ebp)
     269:	e8 c5 3f 00 00       	call   4233 <open>
     26e:	83 c4 10             	add    $0x10,%esp
     271:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     274:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     278:	79 1a                	jns    294 <list+0x49>
		printf(2, "ls: cannot open %s\n", path);
     27a:	83 ec 04             	sub    $0x4,%esp
     27d:	ff 75 08             	pushl  0x8(%ebp)
     280:	68 80 aa 00 00       	push   $0xaa80
     285:	6a 02                	push   $0x2
     287:	e8 44 41 00 00       	call   43d0 <printf>
     28c:	83 c4 10             	add    $0x10,%esp
		return;
     28f:	e9 52 02 00 00       	jmp    4e6 <list+0x29b>
	}

	if (fstat(fd, &st) < 0) {
     294:	83 ec 08             	sub    $0x8,%esp
     297:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     29d:	50                   	push   %eax
     29e:	ff 75 e4             	pushl  -0x1c(%ebp)
     2a1:	e8 a5 3f 00 00       	call   424b <fstat>
     2a6:	83 c4 10             	add    $0x10,%esp
     2a9:	85 c0                	test   %eax,%eax
     2ab:	79 28                	jns    2d5 <list+0x8a>
		printf(2, "ls: cannot stat %s\n", path);
     2ad:	83 ec 04             	sub    $0x4,%esp
     2b0:	ff 75 08             	pushl  0x8(%ebp)
     2b3:	68 94 aa 00 00       	push   $0xaa94
     2b8:	6a 02                	push   $0x2
     2ba:	e8 11 41 00 00       	call   43d0 <printf>
     2bf:	83 c4 10             	add    $0x10,%esp
		close(fd);
     2c2:	83 ec 0c             	sub    $0xc,%esp
     2c5:	ff 75 e4             	pushl  -0x1c(%ebp)
     2c8:	e8 4e 3f 00 00       	call   421b <close>
     2cd:	83 c4 10             	add    $0x10,%esp
		return;
     2d0:	e9 11 02 00 00       	jmp    4e6 <list+0x29b>
	}

	switch (st.type) {
     2d5:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     2dc:	98                   	cwtl   
     2dd:	83 f8 01             	cmp    $0x1,%eax
     2e0:	74 48                	je     32a <list+0xdf>
     2e2:	83 f8 02             	cmp    $0x2,%eax
     2e5:	0f 85 ed 01 00 00    	jne    4d8 <list+0x28d>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     2eb:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     2f1:	8b b5 b4 fd ff ff    	mov    -0x24c(%ebp),%esi
     2f7:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     2fe:	0f bf d8             	movswl %ax,%ebx
     301:	83 ec 0c             	sub    $0xc,%esp
     304:	ff 75 08             	pushl  0x8(%ebp)
     307:	e8 a6 fe ff ff       	call   1b2 <fmtname>
     30c:	83 c4 10             	add    $0x10,%esp
     30f:	83 ec 08             	sub    $0x8,%esp
     312:	57                   	push   %edi
     313:	56                   	push   %esi
     314:	53                   	push   %ebx
     315:	50                   	push   %eax
     316:	68 a8 aa 00 00       	push   $0xaaa8
     31b:	6a 01                	push   $0x1
     31d:	e8 ae 40 00 00       	call   43d0 <printf>
     322:	83 c4 20             	add    $0x20,%esp
		break;
     325:	e9 ae 01 00 00       	jmp    4d8 <list+0x28d>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     32a:	83 ec 0c             	sub    $0xc,%esp
     32d:	ff 75 08             	pushl  0x8(%ebp)
     330:	e8 fd 3c 00 00       	call   4032 <strlen>
     335:	83 c4 10             	add    $0x10,%esp
     338:	83 c0 10             	add    $0x10,%eax
     33b:	3d 00 02 00 00       	cmp    $0x200,%eax
     340:	76 17                	jbe    359 <list+0x10e>
			printf(1, "ls: path too long\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 b5 aa 00 00       	push   $0xaab5
     34a:	6a 01                	push   $0x1
     34c:	e8 7f 40 00 00       	call   43d0 <printf>
     351:	83 c4 10             	add    $0x10,%esp
			break;
     354:	e9 7f 01 00 00       	jmp    4d8 <list+0x28d>
		}
		strcpy(buf, path);
     359:	83 ec 08             	sub    $0x8,%esp
     35c:	ff 75 08             	pushl  0x8(%ebp)
     35f:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     365:	50                   	push   %eax
     366:	e8 58 3c 00 00       	call   3fc3 <strcpy>
     36b:	83 c4 10             	add    $0x10,%esp
		p = buf + strlen(buf);
     36e:	83 ec 0c             	sub    $0xc,%esp
     371:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     377:	50                   	push   %eax
     378:	e8 b5 3c 00 00       	call   4032 <strlen>
     37d:	83 c4 10             	add    $0x10,%esp
     380:	89 c2                	mov    %eax,%edx
     382:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     388:	01 d0                	add    %edx,%eax
     38a:	89 45 e0             	mov    %eax,-0x20(%ebp)
		*p++ = '/';
     38d:	8b 45 e0             	mov    -0x20(%ebp),%eax
     390:	8d 50 01             	lea    0x1(%eax),%edx
     393:	89 55 e0             	mov    %edx,-0x20(%ebp)
     396:	c6 00 2f             	movb   $0x2f,(%eax)
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     399:	e9 19 01 00 00       	jmp    4b7 <list+0x26c>
			if (de.inum == 0)
     39e:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%ebp),%eax
     3a5:	66 85 c0             	test   %ax,%ax
     3a8:	75 05                	jne    3af <list+0x164>
				continue;
     3aa:	e9 08 01 00 00       	jmp    4b7 <list+0x26c>
			memmove(p, de.name, DIRSIZ);
     3af:	83 ec 04             	sub    $0x4,%esp
     3b2:	6a 0e                	push   $0xe
     3b4:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     3ba:	83 c0 02             	add    $0x2,%eax
     3bd:	50                   	push   %eax
     3be:	ff 75 e0             	pushl  -0x20(%ebp)
     3c1:	e8 e8 3d 00 00       	call   41ae <memmove>
     3c6:	83 c4 10             	add    $0x10,%esp
			p[DIRSIZ] = 0;
     3c9:	8b 45 e0             	mov    -0x20(%ebp),%eax
     3cc:	83 c0 0e             	add    $0xe,%eax
     3cf:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     3d2:	83 ec 08             	sub    $0x8,%esp
     3d5:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     3db:	50                   	push   %eax
     3dc:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3e2:	50                   	push   %eax
     3e3:	e8 2c 3d 00 00       	call   4114 <stat>
     3e8:	83 c4 10             	add    $0x10,%esp
     3eb:	85 c0                	test   %eax,%eax
     3ed:	79 1e                	jns    40d <list+0x1c2>
				printf(1, "ls: cannot stat %s\n", buf);
     3ef:	83 ec 04             	sub    $0x4,%esp
     3f2:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3f8:	50                   	push   %eax
     3f9:	68 94 aa 00 00       	push   $0xaa94
     3fe:	6a 01                	push   $0x1
     400:	e8 cb 3f 00 00       	call   43d0 <printf>
     405:	83 c4 10             	add    $0x10,%esp
				continue;
     408:	e9 aa 00 00 00       	jmp    4b7 <list+0x26c>
			}
			if (isListable(fmtname(buf), st.type)) {
     40d:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     414:	0f bf d8             	movswl %ax,%ebx
     417:	83 ec 0c             	sub    $0xc,%esp
     41a:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     420:	50                   	push   %eax
     421:	e8 8c fd ff ff       	call   1b2 <fmtname>
     426:	83 c4 10             	add    $0x10,%esp
     429:	83 ec 08             	sub    $0x8,%esp
     42c:	53                   	push   %ebx
     42d:	50                   	push   %eax
     42e:	e8 be fd ff ff       	call   1f1 <isListable>
     433:	83 c4 10             	add    $0x10,%esp
     436:	85 c0                	test   %eax,%eax
     438:	74 7d                	je     4b7 <list+0x26c>
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
     43a:	8b 15 8c f7 00 00    	mov    0xf78c,%edx
     440:	8d 45 d0             	lea    -0x30(%ebp),%eax
     443:	83 ec 0c             	sub    $0xc,%esp
     446:	52                   	push   %edx
     447:	ff 35 48 2e 01 00    	pushl  0x12e48
     44d:	ff 35 44 2e 01 00    	pushl  0x12e44
     453:	ff 35 40 2e 01 00    	pushl  0x12e40
     459:	50                   	push   %eax
     45a:	e8 ae 08 00 00       	call   d0d <getPos>
     45f:	83 c4 1c             	add    $0x1c,%esp
     462:	83 ec 0c             	sub    $0xc,%esp
     465:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     46b:	50                   	push   %eax
     46c:	e8 41 fd ff ff       	call   1b2 <fmtname>
     471:	83 c4 10             	add    $0x10,%esp
     474:	83 ec 08             	sub    $0x8,%esp
     477:	ff 75 dc             	pushl  -0x24(%ebp)
     47a:	ff 75 d8             	pushl  -0x28(%ebp)
     47d:	ff 75 d4             	pushl  -0x2c(%ebp)
     480:	ff 75 d0             	pushl  -0x30(%ebp)
     483:	50                   	push   %eax
     484:	ff b5 bc fd ff ff    	pushl  -0x244(%ebp)
     48a:	ff b5 b8 fd ff ff    	pushl  -0x248(%ebp)
     490:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
     496:	ff b5 b0 fd ff ff    	pushl  -0x250(%ebp)
     49c:	ff b5 ac fd ff ff    	pushl  -0x254(%ebp)
     4a2:	e8 f3 fb ff ff       	call   9a <addFileItem>
     4a7:	83 c4 30             	add    $0x30,%esp
				itemCounter++;
     4aa:	a1 8c f7 00 00       	mov    0xf78c,%eax
     4af:	83 c0 01             	add    $0x1,%eax
     4b2:	a3 8c f7 00 00       	mov    %eax,0xf78c
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     4b7:	83 ec 04             	sub    $0x4,%esp
     4ba:	6a 10                	push   $0x10
     4bc:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     4c2:	50                   	push   %eax
     4c3:	ff 75 e4             	pushl  -0x1c(%ebp)
     4c6:	e8 40 3d 00 00       	call   420b <read>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	83 f8 10             	cmp    $0x10,%eax
     4d1:	0f 84 c7 fe ff ff    	je     39e <list+0x153>
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
     4d7:	90                   	nop
	}
	close(fd);
     4d8:	83 ec 0c             	sub    $0xc,%esp
     4db:	ff 75 e4             	pushl  -0x1c(%ebp)
     4de:	e8 38 3d 00 00       	call   421b <close>
     4e3:	83 c4 10             	add    $0x10,%esp
}
     4e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4e9:	5b                   	pop    %ebx
     4ea:	5e                   	pop    %esi
     4eb:	5f                   	pop    %edi
     4ec:	5d                   	pop    %ebp
     4ed:	c3                   	ret    

000004ee <drawItem>:
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     4ee:	55                   	push   %ebp
     4ef:	89 e5                	mov    %esp,%ebp
     4f1:	53                   	push   %ebx
     4f2:	83 ec 14             	sub    $0x14,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0) 
     4f5:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     4f9:	75 08                	jne    503 <drawItem+0x15>
		nameColor = 0x0;
     4fb:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     501:	eb 32                	jmp    535 <drawItem+0x47>
	else 
	{
		nameColor = 0xFFFF;
     503:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     509:	8b 45 38             	mov    0x38(%ebp),%eax
     50c:	89 c3                	mov    %eax,%ebx
     50e:	8b 45 34             	mov    0x34(%ebp),%eax
     511:	89 c1                	mov    %eax,%ecx
     513:	8b 45 30             	mov    0x30(%ebp),%eax
     516:	89 c2                	mov    %eax,%edx
     518:	8b 45 2c             	mov    0x2c(%ebp),%eax
     51b:	68 10 21 00 00       	push   $0x2110
     520:	53                   	push   %ebx
     521:	51                   	push   %ecx
     522:	52                   	push   %edx
     523:	50                   	push   %eax
     524:	ff 75 10             	pushl  0x10(%ebp)
     527:	ff 75 0c             	pushl  0xc(%ebp)
     52a:	ff 75 08             	pushl  0x8(%ebp)
     52d:	e8 b2 23 00 00       	call   28e4 <fill_rect>
     532:	83 c4 20             	add    $0x20,%esp
	}
	if (style == ICON_STYLE) {
     535:	a1 84 ed 00 00       	mov    0xed84,%eax
     53a:	83 f8 01             	cmp    $0x1,%eax
     53d:	0f 85 d2 00 00 00    	jne    615 <drawItem+0x127>
		switch (st.type) {
     543:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     547:	98                   	cwtl   
     548:	83 f8 01             	cmp    $0x1,%eax
     54b:	74 38                	je     585 <drawItem+0x97>
     54d:	83 f8 02             	cmp    $0x2,%eax
     550:	75 65                	jne    5b7 <drawItem+0xc9>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     552:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     555:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     558:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     55b:	83 c0 19             	add    $0x19,%eax
     55e:	52                   	push   %edx
     55f:	50                   	push   %eax
     560:	ff 35 f0 ed 00 00    	pushl  0xedf0
     566:	ff 35 ec ed 00 00    	pushl  0xedec
     56c:	ff 35 e8 ed 00 00    	pushl  0xede8
     572:	ff 75 10             	pushl  0x10(%ebp)
     575:	ff 75 0c             	pushl  0xc(%ebp)
     578:	ff 75 08             	pushl  0x8(%ebp)
     57b:	e8 6e 29 00 00       	call   2eee <draw_picture>
     580:	83 c4 20             	add    $0x20,%esp
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     583:	eb 32                	jmp    5b7 <drawItem+0xc9>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     585:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     588:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     58b:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     58e:	83 c0 19             	add    $0x19,%eax
     591:	52                   	push   %edx
     592:	50                   	push   %eax
     593:	ff 35 58 ee 00 00    	pushl  0xee58
     599:	ff 35 54 ee 00 00    	pushl  0xee54
     59f:	ff 35 50 ee 00 00    	pushl  0xee50
     5a5:	ff 75 10             	pushl  0x10(%ebp)
     5a8:	ff 75 0c             	pushl  0xc(%ebp)
     5ab:	ff 75 08             	pushl  0x8(%ebp)
     5ae:	e8 3b 29 00 00       	call   2eee <draw_picture>
     5b3:	83 c4 20             	add    $0x20,%esp
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     5b6:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     5b7:	83 ec 0c             	sub    $0xc,%esp
     5ba:	ff 75 14             	pushl  0x14(%ebp)
     5bd:	e8 70 3a 00 00       	call   4032 <strlen>
     5c2:	83 c4 10             	add    $0x10,%esp
     5c5:	89 c2                	mov    %eax,%edx
     5c7:	b8 00 00 00 00       	mov    $0x0,%eax
     5cc:	29 d0                	sub    %edx,%eax
     5ce:	c1 e0 02             	shl    $0x2,%eax
     5d1:	83 c0 30             	add    $0x30,%eax
     5d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     5d7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     5db:	79 07                	jns    5e4 <drawItem+0xf6>
			indent = 0;
     5dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     5e4:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     5e7:	8d 48 46             	lea    0x46(%eax),%ecx
     5ea:	8b 55 2c             	mov    0x2c(%ebp),%edx
     5ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5f0:	01 c2                	add    %eax,%edx
     5f2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     5f6:	83 ec 04             	sub    $0x4,%esp
     5f9:	51                   	push   %ecx
     5fa:	52                   	push   %edx
     5fb:	50                   	push   %eax
     5fc:	ff 75 14             	pushl  0x14(%ebp)
     5ff:	ff 75 10             	pushl  0x10(%ebp)
     602:	ff 75 0c             	pushl  0xc(%ebp)
     605:	ff 75 08             	pushl  0x8(%ebp)
     608:	e8 32 28 00 00       	call   2e3f <puts_str>
     60d:	83 c4 20             	add    $0x20,%esp
     610:	e9 e1 00 00 00       	jmp    6f6 <drawItem+0x208>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     615:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     619:	98                   	cwtl   
     61a:	83 f8 01             	cmp    $0x1,%eax
     61d:	74 7b                	je     69a <drawItem+0x1ac>
     61f:	83 f8 02             	cmp    $0x2,%eax
     622:	0f 85 a4 00 00 00    	jne    6cc <drawItem+0x1de>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     628:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     62b:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     62e:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     631:	83 c0 08             	add    $0x8,%eax
     634:	52                   	push   %edx
     635:	50                   	push   %eax
     636:	ff 35 24 ee 00 00    	pushl  0xee24
     63c:	ff 35 20 ee 00 00    	pushl  0xee20
     642:	ff 35 1c ee 00 00    	pushl  0xee1c
     648:	ff 75 10             	pushl  0x10(%ebp)
     64b:	ff 75 0c             	pushl  0xc(%ebp)
     64e:	ff 75 08             	pushl  0x8(%ebp)
     651:	e8 98 28 00 00       	call   2eee <draw_picture>
     656:	83 c4 20             	add    $0x20,%esp
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     659:	8b 45 28             	mov    0x28(%ebp),%eax
     65c:	83 ec 0c             	sub    $0xc,%esp
     65f:	50                   	push   %eax
     660:	e8 96 00 00 00       	call   6fb <sizeFormat>
     665:	83 c4 10             	add    $0x10,%esp
     668:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     66b:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     66e:	8d 48 03             	lea    0x3(%eax),%ecx
     671:	8b 45 2c             	mov    0x2c(%ebp),%eax
     674:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     67a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     67e:	83 ec 04             	sub    $0x4,%esp
     681:	51                   	push   %ecx
     682:	52                   	push   %edx
     683:	50                   	push   %eax
     684:	ff 75 ec             	pushl  -0x14(%ebp)
     687:	ff 75 10             	pushl  0x10(%ebp)
     68a:	ff 75 0c             	pushl  0xc(%ebp)
     68d:	ff 75 08             	pushl  0x8(%ebp)
     690:	e8 aa 27 00 00       	call   2e3f <puts_str>
     695:	83 c4 20             	add    $0x20,%esp
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     698:	eb 32                	jmp    6cc <drawItem+0x1de>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     69a:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     69d:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6a0:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     6a3:	83 c0 08             	add    $0x8,%eax
     6a6:	52                   	push   %edx
     6a7:	50                   	push   %eax
     6a8:	ff 35 8c ee 00 00    	pushl  0xee8c
     6ae:	ff 35 88 ee 00 00    	pushl  0xee88
     6b4:	ff 35 84 ee 00 00    	pushl  0xee84
     6ba:	ff 75 10             	pushl  0x10(%ebp)
     6bd:	ff 75 0c             	pushl  0xc(%ebp)
     6c0:	ff 75 08             	pushl  0x8(%ebp)
     6c3:	e8 26 28 00 00       	call   2eee <draw_picture>
     6c8:	83 c4 20             	add    $0x20,%esp
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     6cb:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     6cc:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     6cf:	8d 48 03             	lea    0x3(%eax),%ecx
     6d2:	8b 45 2c             	mov    0x2c(%ebp),%eax
     6d5:	8d 50 28             	lea    0x28(%eax),%edx
     6d8:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     6dc:	83 ec 04             	sub    $0x4,%esp
     6df:	51                   	push   %ecx
     6e0:	52                   	push   %edx
     6e1:	50                   	push   %eax
     6e2:	ff 75 14             	pushl  0x14(%ebp)
     6e5:	ff 75 10             	pushl  0x10(%ebp)
     6e8:	ff 75 0c             	pushl  0xc(%ebp)
     6eb:	ff 75 08             	pushl  0x8(%ebp)
     6ee:	e8 4c 27 00 00       	call   2e3f <puts_str>
     6f3:	83 c4 20             	add    $0x20,%esp
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     6f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     6f9:	c9                   	leave  
     6fa:	c3                   	ret    

000006fb <sizeFormat>:

char *sizeFormat(uint size){
     6fb:	55                   	push   %ebp
     6fc:	89 e5                	mov    %esp,%ebp
     6fe:	53                   	push   %ebx
     6ff:	83 ec 14             	sub    $0x14,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     702:	83 ec 0c             	sub    $0xc,%esp
     705:	6a 0c                	push   $0xc
     707:	e8 95 3f 00 00       	call   46a1 <malloc>
     70c:	83 c4 10             	add    $0x10,%esp
     70f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     712:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     719:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     720:	0f 86 8b 00 00 00    	jbe    7b1 <sizeFormat+0xb6>
	{
		size = size / (0x400);
     726:	8b 45 08             	mov    0x8(%ebp),%eax
     729:	c1 e8 0a             	shr    $0xa,%eax
     72c:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     72f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     732:	8d 50 01             	lea    0x1(%eax),%edx
     735:	89 55 f4             	mov    %edx,-0xc(%ebp)
     738:	89 c2                	mov    %eax,%edx
     73a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     73d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     740:	8b 4d 08             	mov    0x8(%ebp),%ecx
     743:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     748:	89 c8                	mov    %ecx,%eax
     74a:	f7 e2                	mul    %edx
     74c:	c1 ea 03             	shr    $0x3,%edx
     74f:	89 d0                	mov    %edx,%eax
     751:	c1 e0 02             	shl    $0x2,%eax
     754:	01 d0                	add    %edx,%eax
     756:	01 c0                	add    %eax,%eax
     758:	29 c1                	sub    %eax,%ecx
     75a:	89 ca                	mov    %ecx,%edx
     75c:	89 d0                	mov    %edx,%eax
     75e:	83 c0 30             	add    $0x30,%eax
     761:	88 03                	mov    %al,(%ebx)
			size /= 10;
     763:	8b 45 08             	mov    0x8(%ebp),%eax
     766:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     76b:	f7 e2                	mul    %edx
     76d:	89 d0                	mov    %edx,%eax
     76f:	c1 e8 03             	shr    $0x3,%eax
     772:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     775:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     779:	75 b4                	jne    72f <sizeFormat+0x34>
		result[n++] = 'K';
     77b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     77e:	8d 50 01             	lea    0x1(%eax),%edx
     781:	89 55 f4             	mov    %edx,-0xc(%ebp)
     784:	89 c2                	mov    %eax,%edx
     786:	8b 45 f0             	mov    -0x10(%ebp),%eax
     789:	01 d0                	add    %edx,%eax
     78b:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     78e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     791:	8d 50 01             	lea    0x1(%eax),%edx
     794:	89 55 f4             	mov    %edx,-0xc(%ebp)
     797:	89 c2                	mov    %eax,%edx
     799:	8b 45 f0             	mov    -0x10(%ebp),%eax
     79c:	01 d0                	add    %edx,%eax
     79e:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     7a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
     7a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7a7:	01 d0                	add    %edx,%eax
     7a9:	c6 00 00             	movb   $0x0,(%eax)
     7ac:	e9 a3 00 00 00       	jmp    854 <sizeFormat+0x159>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     7b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7b4:	8d 50 01             	lea    0x1(%eax),%edx
     7b7:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7ba:	89 c2                	mov    %eax,%edx
     7bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7bf:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     7c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
     7c5:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     7ca:	89 c8                	mov    %ecx,%eax
     7cc:	f7 e2                	mul    %edx
     7ce:	c1 ea 03             	shr    $0x3,%edx
     7d1:	89 d0                	mov    %edx,%eax
     7d3:	c1 e0 02             	shl    $0x2,%eax
     7d6:	01 d0                	add    %edx,%eax
     7d8:	01 c0                	add    %eax,%eax
     7da:	29 c1                	sub    %eax,%ecx
     7dc:	89 ca                	mov    %ecx,%edx
     7de:	89 d0                	mov    %edx,%eax
     7e0:	83 c0 30             	add    $0x30,%eax
     7e3:	88 03                	mov    %al,(%ebx)
			size /= 10;
     7e5:	8b 45 08             	mov    0x8(%ebp),%eax
     7e8:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     7ed:	f7 e2                	mul    %edx
     7ef:	89 d0                	mov    %edx,%eax
     7f1:	c1 e8 03             	shr    $0x3,%eax
     7f4:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     7f7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     7fb:	75 b4                	jne    7b1 <sizeFormat+0xb6>
		result[n++] = 'b';
     7fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     800:	8d 50 01             	lea    0x1(%eax),%edx
     803:	89 55 f4             	mov    %edx,-0xc(%ebp)
     806:	89 c2                	mov    %eax,%edx
     808:	8b 45 f0             	mov    -0x10(%ebp),%eax
     80b:	01 d0                	add    %edx,%eax
     80d:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     810:	8b 45 f4             	mov    -0xc(%ebp),%eax
     813:	8d 50 01             	lea    0x1(%eax),%edx
     816:	89 55 f4             	mov    %edx,-0xc(%ebp)
     819:	89 c2                	mov    %eax,%edx
     81b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     81e:	01 d0                	add    %edx,%eax
     820:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     823:	8b 45 f4             	mov    -0xc(%ebp),%eax
     826:	8d 50 01             	lea    0x1(%eax),%edx
     829:	89 55 f4             	mov    %edx,-0xc(%ebp)
     82c:	89 c2                	mov    %eax,%edx
     82e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     831:	01 d0                	add    %edx,%eax
     833:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     836:	8b 45 f4             	mov    -0xc(%ebp),%eax
     839:	8d 50 01             	lea    0x1(%eax),%edx
     83c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     83f:	89 c2                	mov    %eax,%edx
     841:	8b 45 f0             	mov    -0x10(%ebp),%eax
     844:	01 d0                	add    %edx,%eax
     846:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     849:	8b 55 f4             	mov    -0xc(%ebp),%edx
     84c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     84f:	01 d0                	add    %edx,%eax
     851:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     854:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     857:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     85a:	c9                   	leave  
     85b:	c3                   	ret    

0000085c <drawFinderWnd>:
		9 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "blank.bmp",
		10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) } };

void drawFinderWnd(Context context) {
     85c:	55                   	push   %ebp
     85d:	89 e5                	mov    %esp,%ebp
     85f:	83 ec 08             	sub    $0x8,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     862:	8b 45 0c             	mov    0xc(%ebp),%eax
     865:	83 e8 01             	sub    $0x1,%eax
     868:	6a 00                	push   $0x0
     86a:	6a 00                	push   $0x0
     86c:	50                   	push   %eax
     86d:	6a 00                	push   $0x0
     86f:	6a 00                	push   $0x0
     871:	ff 75 10             	pushl  0x10(%ebp)
     874:	ff 75 0c             	pushl  0xc(%ebp)
     877:	ff 75 08             	pushl  0x8(%ebp)
     87a:	e8 2b 27 00 00       	call   2faa <draw_line>
     87f:	83 c4 20             	add    $0x20,%esp
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     882:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     885:	8d 48 ff             	lea    -0x1(%eax),%ecx
     888:	8b 45 0c             	mov    0xc(%ebp),%eax
     88b:	8d 50 ff             	lea    -0x1(%eax),%edx
     88e:	8b 45 0c             	mov    0xc(%ebp),%eax
     891:	83 e8 01             	sub    $0x1,%eax
     894:	6a 00                	push   $0x0
     896:	51                   	push   %ecx
     897:	52                   	push   %edx
     898:	6a 00                	push   $0x0
     89a:	50                   	push   %eax
     89b:	ff 75 10             	pushl  0x10(%ebp)
     89e:	ff 75 0c             	pushl  0xc(%ebp)
     8a1:	ff 75 08             	pushl  0x8(%ebp)
     8a4:	e8 01 27 00 00       	call   2faa <draw_line>
     8a9:	83 c4 20             	add    $0x20,%esp
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     8ac:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     8af:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     8b2:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     8b5:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     8b8:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     8bb:	83 e8 01             	sub    $0x1,%eax
     8be:	6a 00                	push   $0x0
     8c0:	51                   	push   %ecx
     8c1:	52                   	push   %edx
     8c2:	50                   	push   %eax
     8c3:	6a 00                	push   $0x0
     8c5:	ff 75 10             	pushl  0x10(%ebp)
     8c8:	ff 75 0c             	pushl  0xc(%ebp)
     8cb:	ff 75 08             	pushl  0x8(%ebp)
     8ce:	e8 d7 26 00 00       	call   2faa <draw_line>
     8d3:	83 c4 20             	add    $0x20,%esp
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     8d6:	8b 45 10             	mov    0x10(%ebp),%eax
     8d9:	83 e8 01             	sub    $0x1,%eax
     8dc:	6a 00                	push   $0x0
     8de:	6a 00                	push   $0x0
     8e0:	6a 00                	push   $0x0
     8e2:	50                   	push   %eax
     8e3:	6a 00                	push   $0x0
     8e5:	ff 75 10             	pushl  0x10(%ebp)
     8e8:	ff 75 0c             	pushl  0xc(%ebp)
     8eb:	ff 75 08             	pushl  0x8(%ebp)
     8ee:	e8 b7 26 00 00       	call   2faa <draw_line>
     8f3:	83 c4 20             	add    $0x20,%esp
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     8f6:	8b 45 0c             	mov    0xc(%ebp),%eax
     8f9:	83 e8 02             	sub    $0x2,%eax
     8fc:	68 18 c6 00 00       	push   $0xc618
     901:	6a 46                	push   $0x46
     903:	50                   	push   %eax
     904:	6a 01                	push   $0x1
     906:	6a 01                	push   $0x1
     908:	ff 75 10             	pushl  0x10(%ebp)
     90b:	ff 75 0c             	pushl  0xc(%ebp)
     90e:	ff 75 08             	pushl  0x8(%ebp)
     911:	e8 ce 1f 00 00       	call   28e4 <fill_rect>
     916:	83 c4 20             	add    $0x20,%esp
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     919:	83 ec 04             	sub    $0x4,%esp
     91c:	6a 03                	push   $0x3
     91e:	68 2c 01 00 00       	push   $0x12c
     923:	6a 00                	push   $0x0
     925:	68 c8 aa 00 00       	push   $0xaac8
     92a:	ff 75 10             	pushl  0x10(%ebp)
     92d:	ff 75 0c             	pushl  0xc(%ebp)
     930:	ff 75 08             	pushl  0x8(%ebp)
     933:	e8 07 25 00 00       	call   2e3f <puts_str>
     938:	83 c4 20             	add    $0x20,%esp
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     93b:	83 ec 0c             	sub    $0xc,%esp
     93e:	6a 0e                	push   $0xe
     940:	68 c0 ee 00 00       	push   $0xeec0
     945:	ff 75 10             	pushl  0x10(%ebp)
     948:	ff 75 0c             	pushl  0xc(%ebp)
     94b:	ff 75 08             	pushl  0x8(%ebp)
     94e:	e8 1c 29 00 00       	call   326f <draw_iconlist>
     953:	83 c4 20             	add    $0x20,%esp
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     956:	83 ec 04             	sub    $0x4,%esp
     959:	6a 23                	push   $0x23
     95b:	68 a4 01 00 00       	push   $0x1a4
     960:	6a 00                	push   $0x0
     962:	68 4c 2e 01 00       	push   $0x12e4c
     967:	ff 75 10             	pushl  0x10(%ebp)
     96a:	ff 75 0c             	pushl  0xc(%ebp)
     96d:	ff 75 08             	pushl  0x8(%ebp)
     970:	e8 ca 24 00 00       	call   2e3f <puts_str>
     975:	83 c4 20             	add    $0x20,%esp
				- (BUTTON_HEIGHT + 3) );


}
     978:	c9                   	leave  
     979:	c3                   	ret    

0000097a <drawFinderContent>:

void drawFinderContent(Context context) {
     97a:	55                   	push   %ebp
     97b:	89 e5                	mov    %esp,%ebp
     97d:	53                   	push   %ebx
     97e:	83 ec 24             	sub    $0x24,%esp
	struct fileItem *p;
	int tempItemCounter = 0;
     981:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     988:	c7 45 ec 46 00 00 00 	movl   $0x46,-0x14(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     98f:	a1 84 ed 00 00       	mov    0xed84,%eax
     994:	83 f8 02             	cmp    $0x2,%eax
     997:	75 04                	jne    99d <drawFinderContent+0x23>
     999:	83 45 ec 1c          	addl   $0x1c,-0x14(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     99d:	8b 45 10             	mov    0x10(%ebp),%eax
     9a0:	83 e8 48             	sub    $0x48,%eax
	int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     9a3:	89 c1                	mov    %eax,%ecx
     9a5:	8b 45 0c             	mov    0xc(%ebp),%eax
     9a8:	83 e8 02             	sub    $0x2,%eax
     9ab:	89 c2                	mov    %eax,%edx
     9ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
     9b0:	68 ff ff 00 00       	push   $0xffff
     9b5:	51                   	push   %ecx
     9b6:	52                   	push   %edx
     9b7:	50                   	push   %eax
     9b8:	6a 01                	push   $0x1
     9ba:	ff 75 10             	pushl  0x10(%ebp)
     9bd:	ff 75 0c             	pushl  0xc(%ebp)
     9c0:	ff 75 08             	pushl  0x8(%ebp)
     9c3:	e8 1c 1f 00 00       	call   28e4 <fill_rect>
     9c8:	83 c4 20             	add    $0x20,%esp
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     9cb:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     9ce:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     9d1:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     9d4:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     9d7:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     9da:	83 e8 01             	sub    $0x1,%eax
     9dd:	6a 00                	push   $0x0
     9df:	51                   	push   %ecx
     9e0:	52                   	push   %edx
     9e1:	50                   	push   %eax
     9e2:	6a 00                	push   $0x0
     9e4:	ff 75 10             	pushl  0x10(%ebp)
     9e7:	ff 75 0c             	pushl  0xc(%ebp)
     9ea:	ff 75 08             	pushl  0x8(%ebp)
     9ed:	e8 b8 25 00 00       	call   2faa <draw_line>
     9f2:	83 c4 20             	add    $0x20,%esp

	//printf(0, "listing complete!\n");
	//printItemList();
//	p = fileItemList;
//	q = 0;
	if (keyContent.length == 0) {
     9f5:	a1 60 2e 01 00       	mov    0x12e60,%eax
     9fa:	85 c0                	test   %eax,%eax
     9fc:	75 72                	jne    a70 <drawFinderContent+0xf6>
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
     9fe:	83 ec 08             	sub    $0x8,%esp
     a01:	68 d0 aa 00 00       	push   $0xaad0
     a06:	6a 00                	push   $0x0
     a08:	e8 c3 39 00 00       	call   43d0 <printf>
     a0d:	83 c4 10             	add    $0x10,%esp
//		freeFileItemList();
//		list(".");
		p = fileItemList;
     a10:	a1 88 f7 00 00       	mov    0xf788,%eax
     a15:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while (p != 0) {
     a18:	eb 4b                	jmp    a65 <drawFinderContent+0xeb>
			//printf(0, "draw item\n");
			drawItem(context, p->name, p->st, p->pos, p->chosen);
     a1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a1d:	8b 40 28             	mov    0x28(%eax),%eax
     a20:	8b 55 f4             	mov    -0xc(%ebp),%edx
     a23:	8b 52 14             	mov    0x14(%edx),%edx
     a26:	83 ec 08             	sub    $0x8,%esp
     a29:	50                   	push   %eax
     a2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a2d:	ff 70 24             	pushl  0x24(%eax)
     a30:	ff 70 20             	pushl  0x20(%eax)
     a33:	ff 70 1c             	pushl  0x1c(%eax)
     a36:	ff 70 18             	pushl  0x18(%eax)
     a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a3c:	ff 70 10             	pushl  0x10(%eax)
     a3f:	ff 70 0c             	pushl  0xc(%eax)
     a42:	ff 70 08             	pushl  0x8(%eax)
     a45:	ff 70 04             	pushl  0x4(%eax)
     a48:	ff 30                	pushl  (%eax)
     a4a:	52                   	push   %edx
     a4b:	ff 75 10             	pushl  0x10(%ebp)
     a4e:	ff 75 0c             	pushl  0xc(%ebp)
     a51:	ff 75 08             	pushl  0x8(%ebp)
     a54:	e8 95 fa ff ff       	call   4ee <drawItem>
     a59:	83 c4 40             	add    $0x40,%esp
			p = p->next;
     a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a5f:	8b 40 2c             	mov    0x2c(%eax),%eax
     a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (keyContent.length == 0) {
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
		while (p != 0) {
     a65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a69:	75 af                	jne    a1a <drawFinderContent+0xa0>
     a6b:	e9 c0 00 00 00       	jmp    b30 <drawFinderContent+0x1b6>
			drawItem(context, p->name, p->st, p->pos, p->chosen);
			p = p->next;
		}
	}
	else{
		p = fileItemList;
     a70:	a1 88 f7 00 00       	mov    0xf788,%eax
     a75:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while(p != 0) {
     a78:	e9 a9 00 00 00       	jmp    b26 <drawFinderContent+0x1ac>
			printf(0, "now you are searching!\n");
     a7d:	83 ec 08             	sub    $0x8,%esp
     a80:	68 29 ab 00 00       	push   $0xab29
     a85:	6a 00                	push   $0x0
     a87:	e8 44 39 00 00       	call   43d0 <printf>
     a8c:	83 c4 10             	add    $0x10,%esp
		   	if (strstr(p->name, keyContent.content)) {
     a8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a92:	8b 40 14             	mov    0x14(%eax),%eax
     a95:	83 ec 08             	sub    $0x8,%esp
     a98:	68 4c 2e 01 00       	push   $0x12e4c
     a9d:	50                   	push   %eax
     a9e:	e8 5d f5 ff ff       	call   0 <strstr>
     aa3:	83 c4 10             	add    $0x10,%esp
     aa6:	85 c0                	test   %eax,%eax
     aa8:	74 73                	je     b1d <drawFinderContent+0x1a3>
				drawItem(context, p->name, p->st, getPos(context, tempItemCounter++), p->chosen);
     aaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aad:	8b 58 28             	mov    0x28(%eax),%ebx
     ab0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ab3:	8d 50 01             	lea    0x1(%eax),%edx
     ab6:	89 55 f0             	mov    %edx,-0x10(%ebp)
     ab9:	8d 55 dc             	lea    -0x24(%ebp),%edx
     abc:	83 ec 0c             	sub    $0xc,%esp
     abf:	50                   	push   %eax
     ac0:	ff 75 10             	pushl  0x10(%ebp)
     ac3:	ff 75 0c             	pushl  0xc(%ebp)
     ac6:	ff 75 08             	pushl  0x8(%ebp)
     ac9:	52                   	push   %edx
     aca:	e8 3e 02 00 00       	call   d0d <getPos>
     acf:	83 c4 1c             	add    $0x1c,%esp
     ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ad5:	8b 50 14             	mov    0x14(%eax),%edx
     ad8:	83 ec 08             	sub    $0x8,%esp
     adb:	53                   	push   %ebx
     adc:	ff 75 e8             	pushl  -0x18(%ebp)
     adf:	ff 75 e4             	pushl  -0x1c(%ebp)
     ae2:	ff 75 e0             	pushl  -0x20(%ebp)
     ae5:	ff 75 dc             	pushl  -0x24(%ebp)
     ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aeb:	ff 70 10             	pushl  0x10(%eax)
     aee:	ff 70 0c             	pushl  0xc(%eax)
     af1:	ff 70 08             	pushl  0x8(%eax)
     af4:	ff 70 04             	pushl  0x4(%eax)
     af7:	ff 30                	pushl  (%eax)
     af9:	52                   	push   %edx
     afa:	ff 75 10             	pushl  0x10(%ebp)
     afd:	ff 75 0c             	pushl  0xc(%ebp)
     b00:	ff 75 08             	pushl  0x8(%ebp)
     b03:	e8 e6 f9 ff ff       	call   4ee <drawItem>
     b08:	83 c4 40             	add    $0x40,%esp
				printf(0, "now you are searching! printing\n");
     b0b:	83 ec 08             	sub    $0x8,%esp
     b0e:	68 44 ab 00 00       	push   $0xab44
     b13:	6a 00                	push   $0x0
     b15:	e8 b6 38 00 00       	call   43d0 <printf>
     b1a:	83 c4 10             	add    $0x10,%esp
		   	}
			p = p->next;
     b1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b20:	8b 40 2c             	mov    0x2c(%eax),%eax
     b23:	89 45 f4             	mov    %eax,-0xc(%ebp)
			p = p->next;
		}
	}
	else{
		p = fileItemList;
		while(p != 0) {
     b26:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b2a:	0f 85 4d ff ff ff    	jne    a7d <drawFinderContent+0x103>
			p = p->next;
			
		}
	}

	if (style == LIST_STYLE)
     b30:	a1 84 ed 00 00       	mov    0xed84,%eax
     b35:	83 f8 02             	cmp    $0x2,%eax
     b38:	0f 85 a8 00 00 00    	jne    be6 <drawFinderContent+0x26c>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     b3e:	68 14 a5 00 00       	push   $0xa514
     b43:	6a 1c                	push   $0x1c
     b45:	6a 26                	push   $0x26
     b47:	6a 47                	push   $0x47
     b49:	6a 01                	push   $0x1
     b4b:	ff 75 10             	pushl  0x10(%ebp)
     b4e:	ff 75 0c             	pushl  0xc(%ebp)
     b51:	ff 75 08             	pushl  0x8(%ebp)
     b54:	e8 8b 1d 00 00       	call   28e4 <fill_rect>
     b59:	83 c4 20             	add    $0x20,%esp
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     b5c:	68 14 a5 00 00       	push   $0xa514
     b61:	6a 1c                	push   $0x1c
     b63:	68 9f 00 00 00       	push   $0x9f
     b68:	6a 47                	push   $0x47
     b6a:	6a 28                	push   $0x28
     b6c:	ff 75 10             	pushl  0x10(%ebp)
     b6f:	ff 75 0c             	pushl  0xc(%ebp)
     b72:	ff 75 08             	pushl  0x8(%ebp)
     b75:	e8 6a 1d 00 00       	call   28e4 <fill_rect>
     b7a:	83 c4 20             	add    $0x20,%esp
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     b7d:	8b 45 0c             	mov    0xc(%ebp),%eax
     b80:	2d c9 00 00 00       	sub    $0xc9,%eax
     b85:	68 14 a5 00 00       	push   $0xa514
     b8a:	6a 1c                	push   $0x1c
     b8c:	50                   	push   %eax
     b8d:	6a 47                	push   $0x47
     b8f:	68 c8 00 00 00       	push   $0xc8
     b94:	ff 75 10             	pushl  0x10(%ebp)
     b97:	ff 75 0c             	pushl  0xc(%ebp)
     b9a:	ff 75 08             	pushl  0x8(%ebp)
     b9d:	e8 42 1d 00 00       	call   28e4 <fill_rect>
     ba2:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     ba5:	83 ec 04             	sub    $0x4,%esp
     ba8:	6a 50                	push   $0x50
     baa:	6a 2b                	push   $0x2b
     bac:	6a 00                	push   $0x0
     bae:	68 65 ab 00 00       	push   $0xab65
     bb3:	ff 75 10             	pushl  0x10(%ebp)
     bb6:	ff 75 0c             	pushl  0xc(%ebp)
     bb9:	ff 75 08             	pushl  0x8(%ebp)
     bbc:	e8 7e 22 00 00       	call   2e3f <puts_str>
     bc1:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     bc4:	83 ec 04             	sub    $0x4,%esp
     bc7:	6a 50                	push   $0x50
     bc9:	68 cb 00 00 00       	push   $0xcb
     bce:	6a 00                	push   $0x0
     bd0:	68 6a ab 00 00       	push   $0xab6a
     bd5:	ff 75 10             	pushl  0x10(%ebp)
     bd8:	ff 75 0c             	pushl  0xc(%ebp)
     bdb:	ff 75 08             	pushl  0x8(%ebp)
     bde:	e8 5c 22 00 00       	call   2e3f <puts_str>
     be3:	83 c4 20             	add    $0x20,%esp
		}
}
     be6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     be9:	c9                   	leave  
     bea:	c3                   	ret    

00000beb <int2str>:

char * int2str(int i)
{
     beb:	55                   	push   %ebp
     bec:	89 e5                	mov    %esp,%ebp
     bee:	53                   	push   %ebx
     bef:	83 ec 14             	sub    $0x14,%esp
	int j;
	int n = 0;
     bf2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     bf9:	83 ec 0c             	sub    $0xc,%esp
     bfc:	6a 04                	push   $0x4
     bfe:	e8 9e 3a 00 00       	call   46a1 <malloc>
     c03:	83 c4 10             	add    $0x10,%esp
     c06:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     c09:	83 ec 0c             	sub    $0xc,%esp
     c0c:	6a 04                	push   $0x4
     c0e:	e8 8e 3a 00 00       	call   46a1 <malloc>
     c13:	83 c4 10             	add    $0x10,%esp
     c16:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     c19:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c1c:	8d 50 01             	lea    0x1(%eax),%edx
     c1f:	89 55 f0             	mov    %edx,-0x10(%ebp)
     c22:	89 c2                	mov    %eax,%edx
     c24:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c27:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     c2a:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c2d:	ba 67 66 66 66       	mov    $0x66666667,%edx
     c32:	89 c8                	mov    %ecx,%eax
     c34:	f7 ea                	imul   %edx
     c36:	c1 fa 02             	sar    $0x2,%edx
     c39:	89 c8                	mov    %ecx,%eax
     c3b:	c1 f8 1f             	sar    $0x1f,%eax
     c3e:	29 c2                	sub    %eax,%edx
     c40:	89 d0                	mov    %edx,%eax
     c42:	c1 e0 02             	shl    $0x2,%eax
     c45:	01 d0                	add    %edx,%eax
     c47:	01 c0                	add    %eax,%eax
     c49:	29 c1                	sub    %eax,%ecx
     c4b:	89 ca                	mov    %ecx,%edx
     c4d:	89 d0                	mov    %edx,%eax
     c4f:	83 c0 30             	add    $0x30,%eax
     c52:	88 03                	mov    %al,(%ebx)
		i /= 10;
     c54:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c57:	ba 67 66 66 66       	mov    $0x66666667,%edx
     c5c:	89 c8                	mov    %ecx,%eax
     c5e:	f7 ea                	imul   %edx
     c60:	c1 fa 02             	sar    $0x2,%edx
     c63:	89 c8                	mov    %ecx,%eax
     c65:	c1 f8 1f             	sar    $0x1f,%eax
     c68:	29 c2                	sub    %eax,%edx
     c6a:	89 d0                	mov    %edx,%eax
     c6c:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     c6f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     c73:	75 a4                	jne    c19 <int2str+0x2e>
	result[n] = 0;
     c75:	8b 55 f0             	mov    -0x10(%ebp),%edx
     c78:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c7b:	01 d0                	add    %edx,%eax
     c7d:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     c80:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c87:	eb 21                	jmp    caa <int2str+0xbf>
	{
		temp[j] = result[n-1-j];
     c89:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c8f:	01 c2                	add    %eax,%edx
     c91:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c94:	83 e8 01             	sub    $0x1,%eax
     c97:	2b 45 f4             	sub    -0xc(%ebp),%eax
     c9a:	89 c1                	mov    %eax,%ecx
     c9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c9f:	01 c8                	add    %ecx,%eax
     ca1:	0f b6 00             	movzbl (%eax),%eax
     ca4:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
     ca6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     caa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cad:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     cb0:	7c d7                	jl     c89 <int2str+0x9e>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
     cb2:	8b 55 f0             	mov    -0x10(%ebp),%edx
     cb5:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cb8:	01 d0                	add    %edx,%eax
     cba:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
     cbd:	83 ec 0c             	sub    $0xc,%esp
     cc0:	ff 75 ec             	pushl  -0x14(%ebp)
     cc3:	e8 98 38 00 00       	call   4560 <free>
     cc8:	83 c4 10             	add    $0x10,%esp
	return temp;
     ccb:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
     cce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     cd1:	c9                   	leave  
     cd2:	c3                   	ret    

00000cd3 <printItemList>:

void printItemList() {
     cd3:	55                   	push   %ebp
     cd4:	89 e5                	mov    %esp,%ebp
     cd6:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p;
	p = fileItemList;
     cd9:	a1 88 f7 00 00       	mov    0xf788,%eax
     cde:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     ce1:	eb 22                	jmp    d05 <printItemList+0x32>
		printf(0, "%s\n", p->name);
     ce3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ce6:	8b 40 14             	mov    0x14(%eax),%eax
     ce9:	83 ec 04             	sub    $0x4,%esp
     cec:	50                   	push   %eax
     ced:	68 6f ab 00 00       	push   $0xab6f
     cf2:	6a 00                	push   $0x0
     cf4:	e8 d7 36 00 00       	call   43d0 <printf>
     cf9:	83 c4 10             	add    $0x10,%esp
		p = p->next;
     cfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cff:	8b 40 2c             	mov    0x2c(%eax),%eax
     d02:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
     d05:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d09:	75 d8                	jne    ce3 <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
     d0b:	c9                   	leave  
     d0c:	c3                   	ret    

00000d0d <getPos>:

Rect getPos(Context context, int n) {
     d0d:	55                   	push   %ebp
     d0e:	89 e5                	mov    %esp,%ebp
     d10:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
     d13:	a1 84 ed 00 00       	mov    0xed84,%eax
     d18:	83 f8 01             	cmp    $0x1,%eax
     d1b:	75 6e                	jne    d8b <getPos+0x7e>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     d1d:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d20:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
     d25:	89 c8                	mov    %ecx,%eax
     d27:	f7 ea                	imul   %edx
     d29:	c1 fa 06             	sar    $0x6,%edx
     d2c:	89 c8                	mov    %ecx,%eax
     d2e:	c1 f8 1f             	sar    $0x1f,%eax
     d31:	29 c2                	sub    %eax,%edx
     d33:	89 d0                	mov    %edx,%eax
     d35:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
     d38:	8b 45 18             	mov    0x18(%ebp),%eax
     d3b:	99                   	cltd   
     d3c:	f7 7d f4             	idivl  -0xc(%ebp)
     d3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
     d42:	8b 45 18             	mov    0x18(%ebp),%eax
     d45:	99                   	cltd   
     d46:	f7 7d f4             	idivl  -0xc(%ebp)
     d49:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
     d4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d4f:	6b c0 73             	imul   $0x73,%eax,%eax
     d52:	83 c0 5a             	add    $0x5a,%eax
     d55:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     d58:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d5b:	01 c0                	add    %eax,%eax
     d5d:	89 c2                	mov    %eax,%edx
     d5f:	c1 e2 06             	shl    $0x6,%edx
     d62:	01 d0                	add    %edx,%eax
     d64:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
     d67:	8b 15 80 f7 00 00    	mov    0xf780,%edx
     d6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d70:	01 c2                	add    %eax,%edx
     d72:	8b 45 08             	mov    0x8(%ebp),%eax
     d75:	83 ec 0c             	sub    $0xc,%esp
     d78:	6a 5f                	push   $0x5f
     d7a:	6a 64                	push   $0x64
     d7c:	52                   	push   %edx
     d7d:	ff 75 e4             	pushl  -0x1c(%ebp)
     d80:	50                   	push   %eax
     d81:	e8 a9 2c 00 00       	call   3a2f <initRect>
     d86:	83 c4 1c             	add    $0x1c,%esp
     d89:	eb 2c                	jmp    db7 <getPos+0xaa>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
     d8b:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d8e:	8b 55 18             	mov    0x18(%ebp),%edx
     d91:	89 d0                	mov    %edx,%eax
     d93:	c1 e0 05             	shl    $0x5,%eax
     d96:	29 d0                	sub    %edx,%eax
     d98:	8d 50 62             	lea    0x62(%eax),%edx
     d9b:	a1 80 f7 00 00       	mov    0xf780,%eax
     da0:	01 c2                	add    %eax,%edx
     da2:	8b 45 08             	mov    0x8(%ebp),%eax
     da5:	83 ec 0c             	sub    $0xc,%esp
     da8:	6a 1e                	push   $0x1e
     daa:	51                   	push   %ecx
     dab:	52                   	push   %edx
     dac:	6a 00                	push   $0x0
     dae:	50                   	push   %eax
     daf:	e8 7b 2c 00 00       	call   3a2f <initRect>
     db4:	83 c4 1c             	add    $0x1c,%esp
				LIST_ITEM_HEIGHT);
	}
}
     db7:	8b 45 08             	mov    0x8(%ebp),%eax
     dba:	c9                   	leave  
     dbb:	c2 04 00             	ret    $0x4

00000dbe <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
     dbe:	55                   	push   %ebp
     dbf:	89 e5                	mov    %esp,%ebp
     dc1:	83 ec 08             	sub    $0x8,%esp
	if (style == ICON_STYLE) {
     dc4:	a1 84 ed 00 00       	mov    0xed84,%eax
     dc9:	83 f8 01             	cmp    $0x1,%eax
     dcc:	75 0d                	jne    ddb <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
     dce:	8b 45 28             	mov    0x28(%ebp),%eax
     dd1:	83 f8 45             	cmp    $0x45,%eax
     dd4:	7f 12                	jg     de8 <addItemEvent+0x2a>
			return;
     dd6:	e9 95 00 00 00       	jmp    e70 <addItemEvent+0xb2>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
     ddb:	8b 45 28             	mov    0x28(%ebp),%eax
     dde:	83 f8 61             	cmp    $0x61,%eax
     de1:	7f 05                	jg     de8 <addItemEvent+0x2a>
			return;
     de3:	e9 88 00 00 00       	jmp    e70 <addItemEvent+0xb2>
	}
	switch (item.st.type) {
     de8:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
     dec:	98                   	cwtl   
     ded:	83 f8 01             	cmp    $0x1,%eax
     df0:	74 28                	je     e1a <addItemEvent+0x5c>
     df2:	83 f8 02             	cmp    $0x2,%eax
     df5:	75 67                	jne    e5e <addItemEvent+0xa0>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     df7:	83 ec 04             	sub    $0x4,%esp
     dfa:	68 03 20 00 00       	push   $0x2003
     dff:	6a 02                	push   $0x2
     e01:	ff 75 30             	pushl  0x30(%ebp)
     e04:	ff 75 2c             	pushl  0x2c(%ebp)
     e07:	ff 75 28             	pushl  0x28(%ebp)
     e0a:	ff 75 24             	pushl  0x24(%ebp)
     e0d:	ff 75 08             	pushl  0x8(%ebp)
     e10:	e8 fc 2c 00 00       	call   3b11 <createClickable>
     e15:	83 c4 20             	add    $0x20,%esp
		break;
     e18:	eb 56                	jmp    e70 <addItemEvent+0xb2>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     e1a:	83 ec 04             	sub    $0x4,%esp
     e1d:	68 03 20 00 00       	push   $0x2003
     e22:	6a 02                	push   $0x2
     e24:	ff 75 30             	pushl  0x30(%ebp)
     e27:	ff 75 2c             	pushl  0x2c(%ebp)
     e2a:	ff 75 28             	pushl  0x28(%ebp)
     e2d:	ff 75 24             	pushl  0x24(%ebp)
     e30:	ff 75 08             	pushl  0x8(%ebp)
     e33:	e8 d9 2c 00 00       	call   3b11 <createClickable>
     e38:	83 c4 20             	add    $0x20,%esp
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
     e3b:	83 ec 04             	sub    $0x4,%esp
     e3e:	68 42 14 00 00       	push   $0x1442
     e43:	6a 04                	push   $0x4
     e45:	ff 75 30             	pushl  0x30(%ebp)
     e48:	ff 75 2c             	pushl  0x2c(%ebp)
     e4b:	ff 75 28             	pushl  0x28(%ebp)
     e4e:	ff 75 24             	pushl  0x24(%ebp)
     e51:	ff 75 08             	pushl  0x8(%ebp)
     e54:	e8 b8 2c 00 00       	call   3b11 <createClickable>
     e59:	83 c4 20             	add    $0x20,%esp
		break;
     e5c:	eb 12                	jmp    e70 <addItemEvent+0xb2>
	default:
		printf(0, "unknown file type!");
     e5e:	83 ec 08             	sub    $0x8,%esp
     e61:	68 73 ab 00 00       	push   $0xab73
     e66:	6a 00                	push   $0x0
     e68:	e8 63 35 00 00       	call   43d0 <printf>
     e6d:	83 c4 10             	add    $0x10,%esp
	}
}
     e70:	c9                   	leave  
     e71:	c3                   	ret    

00000e72 <addListEvent>:

void addListEvent(ClickableManager *cm) {
     e72:	55                   	push   %ebp
     e73:	89 e5                	mov    %esp,%ebp
     e75:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     e78:	a1 88 f7 00 00       	mov    0xf788,%eax
     e7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     e80:	eb 43                	jmp    ec5 <addListEvent+0x53>
		temp = p;
     e82:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e85:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     e88:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e8b:	8b 40 2c             	mov    0x2c(%eax),%eax
     e8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
     e91:	83 ec 0c             	sub    $0xc,%esp
     e94:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e97:	ff 70 2c             	pushl  0x2c(%eax)
     e9a:	ff 70 28             	pushl  0x28(%eax)
     e9d:	ff 70 24             	pushl  0x24(%eax)
     ea0:	ff 70 20             	pushl  0x20(%eax)
     ea3:	ff 70 1c             	pushl  0x1c(%eax)
     ea6:	ff 70 18             	pushl  0x18(%eax)
     ea9:	ff 70 14             	pushl  0x14(%eax)
     eac:	ff 70 10             	pushl  0x10(%eax)
     eaf:	ff 70 0c             	pushl  0xc(%eax)
     eb2:	ff 70 08             	pushl  0x8(%eax)
     eb5:	ff 70 04             	pushl  0x4(%eax)
     eb8:	ff 30                	pushl  (%eax)
     eba:	ff 75 08             	pushl  0x8(%ebp)
     ebd:	e8 fc fe ff ff       	call   dbe <addItemEvent>
     ec2:	83 c4 40             	add    $0x40,%esp
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     ec5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ec9:	75 b7                	jne    e82 <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
     ecb:	c9                   	leave  
     ecc:	c3                   	ret    

00000ecd <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox};

void addWndEvent(ClickableManager *cm) {
     ecd:	55                   	push   %ebp
     ece:	89 e5                	mov    %esp,%ebp
     ed0:	57                   	push   %edi
     ed1:	56                   	push   %esi
     ed2:	53                   	push   %ebx
     ed3:	83 ec 2c             	sub    $0x2c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
     ed6:	c7 45 e0 0e 00 00 00 	movl   $0xe,-0x20(%ebp)
	for (i = 0; i < n; i++) {
     edd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     ee4:	e9 81 00 00 00       	jmp    f6a <addWndEvent+0x9d>
		createClickable(cm,
     ee9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     eec:	8b 1c 85 a0 f1 00 00 	mov    0xf1a0(,%eax,4),%ebx
     ef3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ef6:	6b c0 34             	imul   $0x34,%eax,%eax
     ef9:	83 c0 20             	add    $0x20,%eax
     efc:	05 c0 ee 00 00       	add    $0xeec0,%eax
     f01:	8b 78 10             	mov    0x10(%eax),%edi
     f04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f07:	6b c0 34             	imul   $0x34,%eax,%eax
     f0a:	83 c0 20             	add    $0x20,%eax
     f0d:	05 c0 ee 00 00       	add    $0xeec0,%eax
     f12:	8b 70 0c             	mov    0xc(%eax),%esi
     f15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f18:	6b c0 34             	imul   $0x34,%eax,%eax
     f1b:	83 c0 20             	add    $0x20,%eax
     f1e:	05 c0 ee 00 00       	add    $0xeec0,%eax
     f23:	8b 48 04             	mov    0x4(%eax),%ecx
     f26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f29:	6b c0 34             	imul   $0x34,%eax,%eax
     f2c:	83 c0 20             	add    $0x20,%eax
     f2f:	05 c0 ee 00 00       	add    $0xeec0,%eax
     f34:	8b 10                	mov    (%eax),%edx
     f36:	8d 45 d0             	lea    -0x30(%ebp),%eax
     f39:	83 ec 0c             	sub    $0xc,%esp
     f3c:	57                   	push   %edi
     f3d:	56                   	push   %esi
     f3e:	51                   	push   %ecx
     f3f:	52                   	push   %edx
     f40:	50                   	push   %eax
     f41:	e8 e9 2a 00 00       	call   3a2f <initRect>
     f46:	83 c4 1c             	add    $0x1c,%esp
     f49:	83 ec 04             	sub    $0x4,%esp
     f4c:	53                   	push   %ebx
     f4d:	6a 02                	push   $0x2
     f4f:	ff 75 dc             	pushl  -0x24(%ebp)
     f52:	ff 75 d8             	pushl  -0x28(%ebp)
     f55:	ff 75 d4             	pushl  -0x2c(%ebp)
     f58:	ff 75 d0             	pushl  -0x30(%ebp)
     f5b:	ff 75 08             	pushl  0x8(%ebp)
     f5e:	e8 ae 2b 00 00       	call   3b11 <createClickable>
     f63:	83 c4 20             	add    $0x20,%esp
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox};

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
     f66:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     f6a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f6d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
     f70:	0f 8c 73 ff ff ff    	jl     ee9 <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
     f76:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f79:	5b                   	pop    %ebx
     f7a:	5e                   	pop    %esi
     f7b:	5f                   	pop    %edi
     f7c:	5d                   	pop    %ebp
     f7d:	c3                   	ret    

00000f7e <getFileItem>:

struct fileItem * getFileItem(Point point) {
     f7e:	55                   	push   %ebp
     f7f:	89 e5                	mov    %esp,%ebp
     f81:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p = fileItemList;
     f84:	a1 88 f7 00 00       	mov    0xf788,%eax
     f89:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     f8c:	eb 32                	jmp    fc0 <getFileItem+0x42>
		if (isIn(point, p->pos)) {
     f8e:	83 ec 08             	sub    $0x8,%esp
     f91:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f94:	ff 70 24             	pushl  0x24(%eax)
     f97:	ff 70 20             	pushl  0x20(%eax)
     f9a:	ff 70 1c             	pushl  0x1c(%eax)
     f9d:	ff 70 18             	pushl  0x18(%eax)
     fa0:	ff 75 0c             	pushl  0xc(%ebp)
     fa3:	ff 75 08             	pushl  0x8(%ebp)
     fa6:	e8 d5 2a 00 00       	call   3a80 <isIn>
     fab:	83 c4 20             	add    $0x20,%esp
     fae:	85 c0                	test   %eax,%eax
     fb0:	74 05                	je     fb7 <getFileItem+0x39>
			return p;
     fb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb5:	eb 14                	jmp    fcb <getFileItem+0x4d>
		}
		p = p->next;
     fb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fba:	8b 40 2c             	mov    0x2c(%eax),%eax
     fbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
     fc0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     fc4:	75 c8                	jne    f8e <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
     fc6:	b8 00 00 00 00       	mov    $0x0,%eax
}
     fcb:	c9                   	leave  
     fcc:	c3                   	ret    

00000fcd <h_searchbox>:

void h_searchbox(Point p) {
     fcd:	55                   	push   %ebp
     fce:	89 e5                	mov    %esp,%ebp
	isSearching = 1;
     fd0:	c7 05 00 26 01 00 01 	movl   $0x1,0x12600
     fd7:	00 00 00 
}
     fda:	5d                   	pop    %ebp
     fdb:	c3                   	ret    

00000fdc <scrollDown>:

void scrollDown() {
     fdc:	55                   	push   %ebp
     fdd:	89 e5                	mov    %esp,%ebp
     fdf:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *q = fileItemList;
     fe2:	a1 88 f7 00 00       	mov    0xf788,%eax
     fe7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
     fea:	a1 84 ed 00 00       	mov    0xed84,%eax
     fef:	83 f8 01             	cmp    $0x1,%eax
     ff2:	75 44                	jne    1038 <scrollDown+0x5c>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
     ff4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ff7:	8b 40 1c             	mov    0x1c(%eax),%eax
     ffa:	3d 63 01 00 00       	cmp    $0x163,%eax
     fff:	7e 79                	jle    107a <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1001:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1004:	8b 40 1c             	mov    0x1c(%eax),%eax
    1007:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    100c:	7e 0f                	jle    101d <scrollDown+0x41>
				scrollOffset -= SCROLL_UNIT;
    100e:	a1 80 f7 00 00       	mov    0xf780,%eax
    1013:	83 e8 1e             	sub    $0x1e,%eax
    1016:	a3 80 f7 00 00       	mov    %eax,0xf780
    101b:	eb 5d                	jmp    107a <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
    101d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1020:	8b 40 1c             	mov    0x1c(%eax),%eax
    1023:	ba 63 01 00 00       	mov    $0x163,%edx
    1028:	29 c2                	sub    %eax,%edx
    102a:	a1 80 f7 00 00       	mov    0xf780,%eax
    102f:	01 d0                	add    %edx,%eax
    1031:	a3 80 f7 00 00       	mov    %eax,0xf780
    1036:	eb 42                	jmp    107a <scrollDown+0x9e>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
    1038:	8b 45 f4             	mov    -0xc(%ebp),%eax
    103b:	8b 40 1c             	mov    0x1c(%eax),%eax
    103e:	3d a4 01 00 00       	cmp    $0x1a4,%eax
    1043:	7e 35                	jle    107a <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1045:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1048:	8b 40 1c             	mov    0x1c(%eax),%eax
    104b:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1050:	7e 0f                	jle    1061 <scrollDown+0x85>
				scrollOffset -= SCROLL_UNIT;
    1052:	a1 80 f7 00 00       	mov    0xf780,%eax
    1057:	83 e8 1e             	sub    $0x1e,%eax
    105a:	a3 80 f7 00 00       	mov    %eax,0xf780
    105f:	eb 19                	jmp    107a <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    1061:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1064:	8b 40 1c             	mov    0x1c(%eax),%eax
    1067:	ba a4 01 00 00       	mov    $0x1a4,%edx
    106c:	29 c2                	sub    %eax,%edx
    106e:	a1 80 f7 00 00       	mov    0xf780,%eax
    1073:	01 d0                	add    %edx,%eax
    1075:	a3 80 f7 00 00       	mov    %eax,0xf780
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    107a:	a1 80 f7 00 00       	mov    0xf780,%eax
    107f:	83 ec 04             	sub    $0x4,%esp
    1082:	50                   	push   %eax
    1083:	68 88 ab 00 00       	push   $0xab88
    1088:	6a 00                	push   $0x0
    108a:	e8 41 33 00 00       	call   43d0 <printf>
    108f:	83 c4 10             	add    $0x10,%esp
}
    1092:	c9                   	leave  
    1093:	c3                   	ret    

00001094 <h_scrollDown>:

void h_scrollDown(Point p) {
    1094:	55                   	push   %ebp
    1095:	89 e5                	mov    %esp,%ebp
    1097:	83 ec 18             	sub    $0x18,%esp
	scrollDown();
    109a:	e8 3d ff ff ff       	call   fdc <scrollDown>
	freeFileItemList();
    109f:	e8 bd f0 ff ff       	call   161 <freeFileItemList>
	list(".");
    10a4:	83 ec 0c             	sub    $0xc,%esp
    10a7:	68 a7 ab 00 00       	push   $0xaba7
    10ac:	e8 9a f1 ff ff       	call   24b <list>
    10b1:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    10b4:	83 ec 04             	sub    $0x4,%esp
    10b7:	ff 35 48 2e 01 00    	pushl  0x12e48
    10bd:	ff 35 44 2e 01 00    	pushl  0x12e44
    10c3:	ff 35 40 2e 01 00    	pushl  0x12e40
    10c9:	e8 ac f8 ff ff       	call   97a <drawFinderContent>
    10ce:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    10d1:	83 ec 04             	sub    $0x4,%esp
    10d4:	ff 35 48 2e 01 00    	pushl  0x12e48
    10da:	ff 35 44 2e 01 00    	pushl  0x12e44
    10e0:	ff 35 40 2e 01 00    	pushl  0x12e40
    10e6:	e8 71 f7 ff ff       	call   85c <drawFinderWnd>
    10eb:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    10ee:	8d 45 e8             	lea    -0x18(%ebp),%eax
    10f1:	83 ec 0c             	sub    $0xc,%esp
    10f4:	68 58 02 00 00       	push   $0x258
    10f9:	68 20 03 00 00       	push   $0x320
    10fe:	6a 00                	push   $0x0
    1100:	6a 00                	push   $0x0
    1102:	50                   	push   %eax
    1103:	e8 27 29 00 00       	call   3a2f <initRect>
    1108:	83 c4 1c             	add    $0x1c,%esp
    110b:	83 ec 0c             	sub    $0xc,%esp
    110e:	ff 75 f4             	pushl  -0xc(%ebp)
    1111:	ff 75 f0             	pushl  -0x10(%ebp)
    1114:	ff 75 ec             	pushl  -0x14(%ebp)
    1117:	ff 75 e8             	pushl  -0x18(%ebp)
    111a:	68 80 2f 01 00       	push   $0x12f80
    111f:	e8 d0 2a 00 00       	call   3bf4 <deleteClickable>
    1124:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1127:	83 ec 0c             	sub    $0xc,%esp
    112a:	68 80 2f 01 00       	push   $0x12f80
    112f:	e8 99 fd ff ff       	call   ecd <addWndEvent>
    1134:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1137:	83 ec 0c             	sub    $0xc,%esp
    113a:	68 80 2f 01 00       	push   $0x12f80
    113f:	e8 2e fd ff ff       	call   e72 <addListEvent>
    1144:	83 c4 10             	add    $0x10,%esp
}
    1147:	c9                   	leave  
    1148:	c3                   	ret    

00001149 <scrollUp>:

void scrollUp() {
    1149:	55                   	push   %ebp
    114a:	89 e5                	mov    %esp,%ebp
    114c:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *q = fileItemList;
    114f:	a1 88 f7 00 00       	mov    0xf788,%eax
    1154:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
    1157:	eb 0f                	jmp    1168 <scrollUp+0x1f>
	{
		p = q;
    1159:	8b 45 f4             	mov    -0xc(%ebp),%eax
    115c:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
    115f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1162:	8b 40 2c             	mov    0x2c(%eax),%eax
    1165:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
    1168:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    116c:	75 eb                	jne    1159 <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	if (style == ICON_STYLE){
    116e:	a1 84 ed 00 00       	mov    0xed84,%eax
    1173:	83 f8 01             	cmp    $0x1,%eax
    1176:	75 40                	jne    11b8 <scrollUp+0x6f>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
    1178:	8b 45 f0             	mov    -0x10(%ebp),%eax
    117b:	8b 40 1c             	mov    0x1c(%eax),%eax
    117e:	83 f8 45             	cmp    $0x45,%eax
    1181:	7f 73                	jg     11f6 <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
    1183:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1186:	8b 40 1c             	mov    0x1c(%eax),%eax
    1189:	83 f8 e7             	cmp    $0xffffffe7,%eax
    118c:	7d 0f                	jge    119d <scrollUp+0x54>
				scrollOffset += SCROLL_UNIT;
    118e:	a1 80 f7 00 00       	mov    0xf780,%eax
    1193:	83 c0 1e             	add    $0x1e,%eax
    1196:	a3 80 f7 00 00       	mov    %eax,0xf780
    119b:	eb 59                	jmp    11f6 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
    119d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11a0:	8b 40 1c             	mov    0x1c(%eax),%eax
    11a3:	ba 46 00 00 00       	mov    $0x46,%edx
    11a8:	29 c2                	sub    %eax,%edx
    11aa:	a1 80 f7 00 00       	mov    0xf780,%eax
    11af:	01 d0                	add    %edx,%eax
    11b1:	a3 80 f7 00 00       	mov    %eax,0xf780
    11b6:	eb 3e                	jmp    11f6 <scrollUp+0xad>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    11b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11bb:	8b 40 1c             	mov    0x1c(%eax),%eax
    11be:	83 f8 61             	cmp    $0x61,%eax
    11c1:	7f 33                	jg     11f6 <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    11c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11c6:	8b 40 1c             	mov    0x1c(%eax),%eax
    11c9:	83 f8 43             	cmp    $0x43,%eax
    11cc:	7f 0f                	jg     11dd <scrollUp+0x94>
				scrollOffset += SCROLL_UNIT;
    11ce:	a1 80 f7 00 00       	mov    0xf780,%eax
    11d3:	83 c0 1e             	add    $0x1e,%eax
    11d6:	a3 80 f7 00 00       	mov    %eax,0xf780
    11db:	eb 19                	jmp    11f6 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    11dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11e0:	8b 40 1c             	mov    0x1c(%eax),%eax
    11e3:	ba 62 00 00 00       	mov    $0x62,%edx
    11e8:	29 c2                	sub    %eax,%edx
    11ea:	a1 80 f7 00 00       	mov    0xf780,%eax
    11ef:	01 d0                	add    %edx,%eax
    11f1:	a3 80 f7 00 00       	mov    %eax,0xf780
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    11f6:	a1 80 f7 00 00       	mov    0xf780,%eax
    11fb:	83 ec 04             	sub    $0x4,%esp
    11fe:	50                   	push   %eax
    11ff:	68 a9 ab 00 00       	push   $0xaba9
    1204:	6a 00                	push   $0x0
    1206:	e8 c5 31 00 00       	call   43d0 <printf>
    120b:	83 c4 10             	add    $0x10,%esp
}
    120e:	c9                   	leave  
    120f:	c3                   	ret    

00001210 <h_scrollUp>:

void h_scrollUp(Point p) {
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	83 ec 18             	sub    $0x18,%esp
	scrollUp();
    1216:	e8 2e ff ff ff       	call   1149 <scrollUp>
	freeFileItemList();
    121b:	e8 41 ef ff ff       	call   161 <freeFileItemList>
	list(".");
    1220:	83 ec 0c             	sub    $0xc,%esp
    1223:	68 a7 ab 00 00       	push   $0xaba7
    1228:	e8 1e f0 ff ff       	call   24b <list>
    122d:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1230:	83 ec 04             	sub    $0x4,%esp
    1233:	ff 35 48 2e 01 00    	pushl  0x12e48
    1239:	ff 35 44 2e 01 00    	pushl  0x12e44
    123f:	ff 35 40 2e 01 00    	pushl  0x12e40
    1245:	e8 30 f7 ff ff       	call   97a <drawFinderContent>
    124a:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    124d:	83 ec 04             	sub    $0x4,%esp
    1250:	ff 35 48 2e 01 00    	pushl  0x12e48
    1256:	ff 35 44 2e 01 00    	pushl  0x12e44
    125c:	ff 35 40 2e 01 00    	pushl  0x12e40
    1262:	e8 f5 f5 ff ff       	call   85c <drawFinderWnd>
    1267:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    126a:	8d 45 e8             	lea    -0x18(%ebp),%eax
    126d:	83 ec 0c             	sub    $0xc,%esp
    1270:	68 58 02 00 00       	push   $0x258
    1275:	68 20 03 00 00       	push   $0x320
    127a:	6a 00                	push   $0x0
    127c:	6a 00                	push   $0x0
    127e:	50                   	push   %eax
    127f:	e8 ab 27 00 00       	call   3a2f <initRect>
    1284:	83 c4 1c             	add    $0x1c,%esp
    1287:	83 ec 0c             	sub    $0xc,%esp
    128a:	ff 75 f4             	pushl  -0xc(%ebp)
    128d:	ff 75 f0             	pushl  -0x10(%ebp)
    1290:	ff 75 ec             	pushl  -0x14(%ebp)
    1293:	ff 75 e8             	pushl  -0x18(%ebp)
    1296:	68 80 2f 01 00       	push   $0x12f80
    129b:	e8 54 29 00 00       	call   3bf4 <deleteClickable>
    12a0:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    12a3:	83 ec 0c             	sub    $0xc,%esp
    12a6:	68 80 2f 01 00       	push   $0x12f80
    12ab:	e8 1d fc ff ff       	call   ecd <addWndEvent>
    12b0:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    12b3:	83 ec 0c             	sub    $0xc,%esp
    12b6:	68 80 2f 01 00       	push   $0x12f80
    12bb:	e8 b2 fb ff ff       	call   e72 <addListEvent>
    12c0:	83 c4 10             	add    $0x10,%esp
}
    12c3:	c9                   	leave  
    12c4:	c3                   	ret    

000012c5 <updatePath>:

void updatePath(char *name) {
    12c5:	55                   	push   %ebp
    12c6:	89 e5                	mov    %esp,%ebp
    12c8:	83 ec 18             	sub    $0x18,%esp
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    12cb:	83 ec 0c             	sub    $0xc,%esp
    12ce:	ff 75 08             	pushl  0x8(%ebp)
    12d1:	e8 5c 2d 00 00       	call   4032 <strlen>
    12d6:	83 c4 10             	add    $0x10,%esp
    12d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    12dc:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    12e0:	0f 85 90 00 00 00    	jne    1376 <updatePath+0xb1>
    12e6:	8b 45 08             	mov    0x8(%ebp),%eax
    12e9:	0f b6 00             	movzbl (%eax),%eax
    12ec:	3c 2e                	cmp    $0x2e,%al
    12ee:	0f 85 82 00 00 00    	jne    1376 <updatePath+0xb1>
    12f4:	8b 45 08             	mov    0x8(%ebp),%eax
    12f7:	83 c0 01             	add    $0x1,%eax
    12fa:	0f b6 00             	movzbl (%eax),%eax
    12fd:	3c 2e                	cmp    $0x2e,%al
    12ff:	75 75                	jne    1376 <updatePath+0xb1>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1301:	83 ec 0c             	sub    $0xc,%esp
    1304:	68 80 2e 01 00       	push   $0x12e80
    1309:	e8 24 2d 00 00       	call   4032 <strlen>
    130e:	83 c4 10             	add    $0x10,%esp
    1311:	83 f8 01             	cmp    $0x1,%eax
    1314:	75 0b                	jne    1321 <updatePath+0x5c>
    1316:	0f b6 05 80 2e 01 00 	movzbl 0x12e80,%eax
    131d:	3c 2f                	cmp    $0x2f,%al
    131f:	74 53                	je     1374 <updatePath+0xaf>
        {
            int tmpn = strlen(currentPath);
    1321:	83 ec 0c             	sub    $0xc,%esp
    1324:	68 80 2e 01 00       	push   $0x12e80
    1329:	e8 04 2d 00 00       	call   4032 <strlen>
    132e:	83 c4 10             	add    $0x10,%esp
    1331:	89 45 ec             	mov    %eax,-0x14(%ebp)
            currentPath[tmpn - 1] = '\0';
    1334:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1337:	83 e8 01             	sub    $0x1,%eax
    133a:	c6 80 80 2e 01 00 00 	movb   $0x0,0x12e80(%eax)
            for (i = tmpn - 2; i > 0; i--)
    1341:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1344:	83 e8 02             	sub    $0x2,%eax
    1347:	89 45 f4             	mov    %eax,-0xc(%ebp)
    134a:	eb 22                	jmp    136e <updatePath+0xa9>
            {
                if (currentPath[i] != '/')
    134c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    134f:	05 80 2e 01 00       	add    $0x12e80,%eax
    1354:	0f b6 00             	movzbl (%eax),%eax
    1357:	3c 2f                	cmp    $0x2f,%al
    1359:	74 0d                	je     1368 <updatePath+0xa3>
                    currentPath[i] = '\0';
    135b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    135e:	05 80 2e 01 00       	add    $0x12e80,%eax
    1363:	c6 00 00             	movb   $0x0,(%eax)
    1366:	eb 02                	jmp    136a <updatePath+0xa5>
                else
                    break;
    1368:	eb 0a                	jmp    1374 <updatePath+0xaf>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    136a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    136e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1372:	7f d8                	jg     134c <updatePath+0x87>
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1374:	eb 55                	jmp    13cb <updatePath+0x106>
            }
        }
    }
    else
    {
        int tmpn = strlen(currentPath);
    1376:	83 ec 0c             	sub    $0xc,%esp
    1379:	68 80 2e 01 00       	push   $0x12e80
    137e:	e8 af 2c 00 00       	call   4032 <strlen>
    1383:	83 c4 10             	add    $0x10,%esp
    1386:	89 45 e8             	mov    %eax,-0x18(%ebp)
        strcpy(currentPath + tmpn, name);
    1389:	8b 45 e8             	mov    -0x18(%ebp),%eax
    138c:	05 80 2e 01 00       	add    $0x12e80,%eax
    1391:	83 ec 08             	sub    $0x8,%esp
    1394:	ff 75 08             	pushl  0x8(%ebp)
    1397:	50                   	push   %eax
    1398:	e8 26 2c 00 00       	call   3fc3 <strcpy>
    139d:	83 c4 10             	add    $0x10,%esp
        tmpn = strlen(currentPath);
    13a0:	83 ec 0c             	sub    $0xc,%esp
    13a3:	68 80 2e 01 00       	push   $0x12e80
    13a8:	e8 85 2c 00 00       	call   4032 <strlen>
    13ad:	83 c4 10             	add    $0x10,%esp
    13b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
        currentPath[tmpn] = '/';
    13b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13b6:	05 80 2e 01 00       	add    $0x12e80,%eax
    13bb:	c6 00 2f             	movb   $0x2f,(%eax)
        currentPath[tmpn + 1] = '\0';
    13be:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13c1:	83 c0 01             	add    $0x1,%eax
    13c4:	c6 80 80 2e 01 00 00 	movb   $0x0,0x12e80(%eax)
    }
}
    13cb:	c9                   	leave  
    13cc:	c3                   	ret    

000013cd <enterDir>:

// Handlers
void enterDir(char *name) {
    13cd:	55                   	push   %ebp
    13ce:	89 e5                	mov    %esp,%ebp
    13d0:	83 ec 08             	sub    $0x8,%esp
	scrollOffset = 0;
    13d3:	c7 05 80 f7 00 00 00 	movl   $0x0,0xf780
    13da:	00 00 00 
	printf(0, "entering : %s\n", name);
    13dd:	83 ec 04             	sub    $0x4,%esp
    13e0:	ff 75 08             	pushl  0x8(%ebp)
    13e3:	68 c6 ab 00 00       	push   $0xabc6
    13e8:	6a 00                	push   $0x0
    13ea:	e8 e1 2f 00 00       	call   43d0 <printf>
    13ef:	83 c4 10             	add    $0x10,%esp
	if (chdir(name) < 0)
    13f2:	83 ec 0c             	sub    $0xc,%esp
    13f5:	ff 75 08             	pushl  0x8(%ebp)
    13f8:	e8 66 2e 00 00       	call   4263 <chdir>
    13fd:	83 c4 10             	add    $0x10,%esp
    1400:	85 c0                	test   %eax,%eax
    1402:	79 17                	jns    141b <enterDir+0x4e>
		printf(2, "cannot cd %s\n", name);
    1404:	83 ec 04             	sub    $0x4,%esp
    1407:	ff 75 08             	pushl  0x8(%ebp)
    140a:	68 d5 ab 00 00       	push   $0xabd5
    140f:	6a 02                	push   $0x2
    1411:	e8 ba 2f 00 00       	call   43d0 <printf>
    1416:	83 c4 10             	add    $0x10,%esp
    1419:	eb 0e                	jmp    1429 <enterDir+0x5c>
	else
		updatePath(name);
    141b:	83 ec 0c             	sub    $0xc,%esp
    141e:	ff 75 08             	pushl  0x8(%ebp)
    1421:	e8 9f fe ff ff       	call   12c5 <updatePath>
    1426:	83 c4 10             	add    $0x10,%esp
	printf(0, "currentPath: %s\n", currentPath);
    1429:	83 ec 04             	sub    $0x4,%esp
    142c:	68 80 2e 01 00       	push   $0x12e80
    1431:	68 e3 ab 00 00       	push   $0xabe3
    1436:	6a 00                	push   $0x0
    1438:	e8 93 2f 00 00       	call   43d0 <printf>
    143d:	83 c4 10             	add    $0x10,%esp
}
    1440:	c9                   	leave  
    1441:	c3                   	ret    

00001442 <h_enterDir>:

void h_enterDir(Point p) {
    1442:	55                   	push   %ebp
    1443:	89 e5                	mov    %esp,%ebp
    1445:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    1448:	83 ec 08             	sub    $0x8,%esp
    144b:	ff 75 0c             	pushl  0xc(%ebp)
    144e:	ff 75 08             	pushl  0x8(%ebp)
    1451:	e8 28 fb ff ff       	call   f7e <getFileItem>
    1456:	83 c4 10             	add    $0x10,%esp
    1459:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    145c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    145f:	8b 40 14             	mov    0x14(%eax),%eax
    1462:	83 ec 0c             	sub    $0xc,%esp
    1465:	50                   	push   %eax
    1466:	e8 62 ff ff ff       	call   13cd <enterDir>
    146b:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    146e:	e8 ee ec ff ff       	call   161 <freeFileItemList>
	list(".");
    1473:	83 ec 0c             	sub    $0xc,%esp
    1476:	68 a7 ab 00 00       	push   $0xaba7
    147b:	e8 cb ed ff ff       	call   24b <list>
    1480:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1483:	83 ec 04             	sub    $0x4,%esp
    1486:	ff 35 48 2e 01 00    	pushl  0x12e48
    148c:	ff 35 44 2e 01 00    	pushl  0x12e44
    1492:	ff 35 40 2e 01 00    	pushl  0x12e40
    1498:	e8 dd f4 ff ff       	call   97a <drawFinderContent>
    149d:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    14a0:	83 ec 04             	sub    $0x4,%esp
    14a3:	ff 35 48 2e 01 00    	pushl  0x12e48
    14a9:	ff 35 44 2e 01 00    	pushl  0x12e44
    14af:	ff 35 40 2e 01 00    	pushl  0x12e40
    14b5:	e8 a2 f3 ff ff       	call   85c <drawFinderWnd>
    14ba:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    14bd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    14c0:	83 ec 0c             	sub    $0xc,%esp
    14c3:	68 58 02 00 00       	push   $0x258
    14c8:	68 20 03 00 00       	push   $0x320
    14cd:	6a 00                	push   $0x0
    14cf:	6a 00                	push   $0x0
    14d1:	50                   	push   %eax
    14d2:	e8 58 25 00 00       	call   3a2f <initRect>
    14d7:	83 c4 1c             	add    $0x1c,%esp
    14da:	83 ec 0c             	sub    $0xc,%esp
    14dd:	ff 75 f0             	pushl  -0x10(%ebp)
    14e0:	ff 75 ec             	pushl  -0x14(%ebp)
    14e3:	ff 75 e8             	pushl  -0x18(%ebp)
    14e6:	ff 75 e4             	pushl  -0x1c(%ebp)
    14e9:	68 80 2f 01 00       	push   $0x12f80
    14ee:	e8 01 27 00 00       	call   3bf4 <deleteClickable>
    14f3:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    14f6:	83 ec 0c             	sub    $0xc,%esp
    14f9:	68 80 2f 01 00       	push   $0x12f80
    14fe:	e8 ca f9 ff ff       	call   ecd <addWndEvent>
    1503:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1506:	83 ec 0c             	sub    $0xc,%esp
    1509:	68 80 2f 01 00       	push   $0x12f80
    150e:	e8 5f f9 ff ff       	call   e72 <addListEvent>
    1513:	83 c4 10             	add    $0x10,%esp
}
    1516:	c9                   	leave  
    1517:	c3                   	ret    

00001518 <newFile>:

void newFile(char *name) {
    1518:	55                   	push   %ebp
    1519:	89 e5                	mov    %esp,%ebp
    151b:	83 ec 18             	sub    $0x18,%esp
	int fd;
	int n = strlen(name);
    151e:	83 ec 0c             	sub    $0xc,%esp
    1521:	ff 75 08             	pushl  0x8(%ebp)
    1524:	e8 09 2b 00 00       	call   4032 <strlen>
    1529:	83 c4 10             	add    $0x10,%esp
    152c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    152f:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    1536:	eb 70                	jmp    15a8 <newFile+0x90>
	{
		n = strlen(name);
    1538:	83 ec 0c             	sub    $0xc,%esp
    153b:	ff 75 08             	pushl  0x8(%ebp)
    153e:	e8 ef 2a 00 00       	call   4032 <strlen>
    1543:	83 c4 10             	add    $0x10,%esp
    1546:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1549:	8b 45 f0             	mov    -0x10(%ebp),%eax
    154c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    154f:	75 09                	jne    155a <newFile+0x42>
		{
			counter = 1;
    1551:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1558:	eb 1b                	jmp    1575 <newFile+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    155a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    155d:	8b 45 08             	mov    0x8(%ebp),%eax
    1560:	01 d0                	add    %edx,%eax
    1562:	83 ec 0c             	sub    $0xc,%esp
    1565:	50                   	push   %eax
    1566:	e8 f6 2b 00 00       	call   4161 <atoi>
    156b:	83 c4 10             	add    $0x10,%esp
    156e:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1571:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1575:	83 ec 0c             	sub    $0xc,%esp
    1578:	ff 75 f4             	pushl  -0xc(%ebp)
    157b:	e8 6b f6 ff ff       	call   beb <int2str>
    1580:	83 c4 10             	add    $0x10,%esp
    1583:	89 c1                	mov    %eax,%ecx
    1585:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1588:	8b 45 08             	mov    0x8(%ebp),%eax
    158b:	01 d0                	add    %edx,%eax
    158d:	83 ec 08             	sub    $0x8,%esp
    1590:	51                   	push   %ecx
    1591:	50                   	push   %eax
    1592:	e8 2c 2a 00 00       	call   3fc3 <strcpy>
    1597:	83 c4 10             	add    $0x10,%esp
		close(fd);
    159a:	83 ec 0c             	sub    $0xc,%esp
    159d:	ff 75 e8             	pushl  -0x18(%ebp)
    15a0:	e8 76 2c 00 00       	call   421b <close>
    15a5:	83 c4 10             	add    $0x10,%esp
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    15a8:	83 ec 08             	sub    $0x8,%esp
    15ab:	6a 00                	push   $0x0
    15ad:	ff 75 08             	pushl  0x8(%ebp)
    15b0:	e8 7e 2c 00 00       	call   4233 <open>
    15b5:	83 c4 10             	add    $0x10,%esp
    15b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
    15bb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    15bf:	0f 8f 73 ff ff ff    	jg     1538 <newFile+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    15c5:	83 ec 08             	sub    $0x8,%esp
    15c8:	68 00 02 00 00       	push   $0x200
    15cd:	ff 75 08             	pushl  0x8(%ebp)
    15d0:	e8 5e 2c 00 00       	call   4233 <open>
    15d5:	83 c4 10             	add    $0x10,%esp
    15d8:	89 45 e8             	mov    %eax,-0x18(%ebp)
    15db:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    15df:	79 1a                	jns    15fb <newFile+0xe3>
		printf(0, "cat: cannot open %s\n", name);
    15e1:	83 ec 04             	sub    $0x4,%esp
    15e4:	ff 75 08             	pushl  0x8(%ebp)
    15e7:	68 f4 ab 00 00       	push   $0xabf4
    15ec:	6a 00                	push   $0x0
    15ee:	e8 dd 2d 00 00       	call   43d0 <printf>
    15f3:	83 c4 10             	add    $0x10,%esp
		exit();
    15f6:	e8 f8 2b 00 00       	call   41f3 <exit>
	}
	close(fd);
    15fb:	83 ec 0c             	sub    $0xc,%esp
    15fe:	ff 75 e8             	pushl  -0x18(%ebp)
    1601:	e8 15 2c 00 00       	call   421b <close>
    1606:	83 c4 10             	add    $0x10,%esp
}
    1609:	c9                   	leave  
    160a:	c3                   	ret    

0000160b <h_newFile>:

void h_newFile(Point p) {
    160b:	55                   	push   %ebp
    160c:	89 e5                	mov    %esp,%ebp
    160e:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "file.txt";
    1611:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1618:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    161f:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    1626:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    162d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1634:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    163b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1642:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    1649:	83 ec 0c             	sub    $0xc,%esp
    164c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    164f:	50                   	push   %eax
    1650:	e8 c3 fe ff ff       	call   1518 <newFile>
    1655:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1658:	e8 04 eb ff ff       	call   161 <freeFileItemList>
	list(".");
    165d:	83 ec 0c             	sub    $0xc,%esp
    1660:	68 a7 ab 00 00       	push   $0xaba7
    1665:	e8 e1 eb ff ff       	call   24b <list>
    166a:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    166d:	83 ec 04             	sub    $0x4,%esp
    1670:	ff 35 48 2e 01 00    	pushl  0x12e48
    1676:	ff 35 44 2e 01 00    	pushl  0x12e44
    167c:	ff 35 40 2e 01 00    	pushl  0x12e40
    1682:	e8 f3 f2 ff ff       	call   97a <drawFinderContent>
    1687:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    168a:	83 ec 04             	sub    $0x4,%esp
    168d:	ff 35 48 2e 01 00    	pushl  0x12e48
    1693:	ff 35 44 2e 01 00    	pushl  0x12e44
    1699:	ff 35 40 2e 01 00    	pushl  0x12e40
    169f:	e8 b8 f1 ff ff       	call   85c <drawFinderWnd>
    16a4:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    16a7:	8d 45 e8             	lea    -0x18(%ebp),%eax
    16aa:	83 ec 0c             	sub    $0xc,%esp
    16ad:	68 58 02 00 00       	push   $0x258
    16b2:	68 20 03 00 00       	push   $0x320
    16b7:	6a 00                	push   $0x0
    16b9:	6a 00                	push   $0x0
    16bb:	50                   	push   %eax
    16bc:	e8 6e 23 00 00       	call   3a2f <initRect>
    16c1:	83 c4 1c             	add    $0x1c,%esp
    16c4:	83 ec 0c             	sub    $0xc,%esp
    16c7:	ff 75 f4             	pushl  -0xc(%ebp)
    16ca:	ff 75 f0             	pushl  -0x10(%ebp)
    16cd:	ff 75 ec             	pushl  -0x14(%ebp)
    16d0:	ff 75 e8             	pushl  -0x18(%ebp)
    16d3:	68 80 2f 01 00       	push   $0x12f80
    16d8:	e8 17 25 00 00       	call   3bf4 <deleteClickable>
    16dd:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    16e0:	83 ec 0c             	sub    $0xc,%esp
    16e3:	68 80 2f 01 00       	push   $0x12f80
    16e8:	e8 e0 f7 ff ff       	call   ecd <addWndEvent>
    16ed:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    16f0:	83 ec 0c             	sub    $0xc,%esp
    16f3:	68 80 2f 01 00       	push   $0x12f80
    16f8:	e8 75 f7 ff ff       	call   e72 <addListEvent>
    16fd:	83 c4 10             	add    $0x10,%esp
}
    1700:	c9                   	leave  
    1701:	c3                   	ret    

00001702 <newFolder>:

void newFolder(char *name) {
    1702:	55                   	push   %ebp
    1703:	89 e5                	mov    %esp,%ebp
    1705:	83 ec 18             	sub    $0x18,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1708:	83 ec 0c             	sub    $0xc,%esp
    170b:	ff 75 08             	pushl  0x8(%ebp)
    170e:	e8 1f 29 00 00       	call   4032 <strlen>
    1713:	83 c4 10             	add    $0x10,%esp
    1716:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    1719:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1720:	eb 62                	jmp    1784 <newFolder+0x82>
		n = strlen(name);
    1722:	83 ec 0c             	sub    $0xc,%esp
    1725:	ff 75 08             	pushl  0x8(%ebp)
    1728:	e8 05 29 00 00       	call   4032 <strlen>
    172d:	83 c4 10             	add    $0x10,%esp
    1730:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1733:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1736:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1739:	75 09                	jne    1744 <newFolder+0x42>
		{
			counter = 1;
    173b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1742:	eb 1b                	jmp    175f <newFolder+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1744:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1747:	8b 45 08             	mov    0x8(%ebp),%eax
    174a:	01 d0                	add    %edx,%eax
    174c:	83 ec 0c             	sub    $0xc,%esp
    174f:	50                   	push   %eax
    1750:	e8 0c 2a 00 00       	call   4161 <atoi>
    1755:	83 c4 10             	add    $0x10,%esp
    1758:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    175b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    175f:	83 ec 0c             	sub    $0xc,%esp
    1762:	ff 75 f4             	pushl  -0xc(%ebp)
    1765:	e8 81 f4 ff ff       	call   beb <int2str>
    176a:	83 c4 10             	add    $0x10,%esp
    176d:	89 c1                	mov    %eax,%ecx
    176f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1772:	8b 45 08             	mov    0x8(%ebp),%eax
    1775:	01 d0                	add    %edx,%eax
    1777:	83 ec 08             	sub    $0x8,%esp
    177a:	51                   	push   %ecx
    177b:	50                   	push   %eax
    177c:	e8 42 28 00 00       	call   3fc3 <strcpy>
    1781:	83 c4 10             	add    $0x10,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    1784:	83 ec 0c             	sub    $0xc,%esp
    1787:	ff 75 08             	pushl  0x8(%ebp)
    178a:	e8 cc 2a 00 00       	call   425b <mkdir>
    178f:	83 c4 10             	add    $0x10,%esp
    1792:	85 c0                	test   %eax,%eax
    1794:	78 8c                	js     1722 <newFolder+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    1796:	c9                   	leave  
    1797:	c3                   	ret    

00001798 <h_newFolder>:

void h_newFolder(Point p) {
    1798:	55                   	push   %ebp
    1799:	89 e5                	mov    %esp,%ebp
    179b:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "newFolder";
    179e:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    17a5:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    17ac:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    17b3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    17ba:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    17c1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    17c8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    17cf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    17d6:	83 ec 0c             	sub    $0xc,%esp
    17d9:	8d 45 c8             	lea    -0x38(%ebp),%eax
    17dc:	50                   	push   %eax
    17dd:	e8 20 ff ff ff       	call   1702 <newFolder>
    17e2:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    17e5:	e8 77 e9 ff ff       	call   161 <freeFileItemList>
	printf(0, "new folder!\n");
    17ea:	83 ec 08             	sub    $0x8,%esp
    17ed:	68 09 ac 00 00       	push   $0xac09
    17f2:	6a 00                	push   $0x0
    17f4:	e8 d7 2b 00 00       	call   43d0 <printf>
    17f9:	83 c4 10             	add    $0x10,%esp
	list(".");
    17fc:	83 ec 0c             	sub    $0xc,%esp
    17ff:	68 a7 ab 00 00       	push   $0xaba7
    1804:	e8 42 ea ff ff       	call   24b <list>
    1809:	83 c4 10             	add    $0x10,%esp
	printItemList();
    180c:	e8 c2 f4 ff ff       	call   cd3 <printItemList>
	drawFinderContent(context);
    1811:	83 ec 04             	sub    $0x4,%esp
    1814:	ff 35 48 2e 01 00    	pushl  0x12e48
    181a:	ff 35 44 2e 01 00    	pushl  0x12e44
    1820:	ff 35 40 2e 01 00    	pushl  0x12e40
    1826:	e8 4f f1 ff ff       	call   97a <drawFinderContent>
    182b:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    182e:	83 ec 04             	sub    $0x4,%esp
    1831:	ff 35 48 2e 01 00    	pushl  0x12e48
    1837:	ff 35 44 2e 01 00    	pushl  0x12e44
    183d:	ff 35 40 2e 01 00    	pushl  0x12e40
    1843:	e8 14 f0 ff ff       	call   85c <drawFinderWnd>
    1848:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    184b:	8d 45 e8             	lea    -0x18(%ebp),%eax
    184e:	83 ec 0c             	sub    $0xc,%esp
    1851:	68 58 02 00 00       	push   $0x258
    1856:	68 20 03 00 00       	push   $0x320
    185b:	6a 00                	push   $0x0
    185d:	6a 00                	push   $0x0
    185f:	50                   	push   %eax
    1860:	e8 ca 21 00 00       	call   3a2f <initRect>
    1865:	83 c4 1c             	add    $0x1c,%esp
    1868:	83 ec 0c             	sub    $0xc,%esp
    186b:	ff 75 f4             	pushl  -0xc(%ebp)
    186e:	ff 75 f0             	pushl  -0x10(%ebp)
    1871:	ff 75 ec             	pushl  -0x14(%ebp)
    1874:	ff 75 e8             	pushl  -0x18(%ebp)
    1877:	68 80 2f 01 00       	push   $0x12f80
    187c:	e8 73 23 00 00       	call   3bf4 <deleteClickable>
    1881:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1884:	83 ec 0c             	sub    $0xc,%esp
    1887:	68 80 2f 01 00       	push   $0x12f80
    188c:	e8 3c f6 ff ff       	call   ecd <addWndEvent>
    1891:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1894:	83 ec 0c             	sub    $0xc,%esp
    1897:	68 80 2f 01 00       	push   $0x12f80
    189c:	e8 d1 f5 ff ff       	call   e72 <addListEvent>
    18a1:	83 c4 10             	add    $0x10,%esp
}
    18a4:	c9                   	leave  
    18a5:	c3                   	ret    

000018a6 <deleteFile>:

void deleteFile(char *name)
{
    18a6:	55                   	push   %ebp
    18a7:	89 e5                	mov    %esp,%ebp
    18a9:	83 ec 18             	sub    $0x18,%esp
	printf(0, "currently having sex with %s\n", name);
    18ac:	83 ec 04             	sub    $0x4,%esp
    18af:	ff 75 08             	pushl  0x8(%ebp)
    18b2:	68 16 ac 00 00       	push   $0xac16
    18b7:	6a 00                	push   $0x0
    18b9:	e8 12 2b 00 00       	call   43d0 <printf>
    18be:	83 c4 10             	add    $0x10,%esp
	if(unlink(name) < 0){
    18c1:	83 ec 0c             	sub    $0xc,%esp
    18c4:	ff 75 08             	pushl  0x8(%ebp)
    18c7:	e8 77 29 00 00       	call   4243 <unlink>
    18cc:	83 c4 10             	add    $0x10,%esp
    18cf:	85 c0                	test   %eax,%eax
    18d1:	0f 89 b3 00 00 00    	jns    198a <deleteFile+0xe4>
		if (chdir(name) < 0){
    18d7:	83 ec 0c             	sub    $0xc,%esp
    18da:	ff 75 08             	pushl  0x8(%ebp)
    18dd:	e8 81 29 00 00       	call   4263 <chdir>
    18e2:	83 c4 10             	add    $0x10,%esp
    18e5:	85 c0                	test   %eax,%eax
    18e7:	79 1a                	jns    1903 <deleteFile+0x5d>
			printf(2, "rm: %s failed to delete\n", name);
    18e9:	83 ec 04             	sub    $0x4,%esp
    18ec:	ff 75 08             	pushl  0x8(%ebp)
    18ef:	68 34 ac 00 00       	push   $0xac34
    18f4:	6a 02                	push   $0x2
    18f6:	e8 d5 2a 00 00       	call   43d0 <printf>
    18fb:	83 c4 10             	add    $0x10,%esp
    18fe:	e9 87 00 00 00       	jmp    198a <deleteFile+0xe4>
		}
		else{
			freeFileItemList();
    1903:	e8 59 e8 ff ff       	call   161 <freeFileItemList>
			list(".");
    1908:	83 ec 0c             	sub    $0xc,%esp
    190b:	68 a7 ab 00 00       	push   $0xaba7
    1910:	e8 36 e9 ff ff       	call   24b <list>
    1915:	83 c4 10             	add    $0x10,%esp
			struct fileItem *p;
			p = fileItemList;
    1918:	a1 88 f7 00 00       	mov    0xf788,%eax
    191d:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    1920:	eb 2f                	jmp    1951 <deleteFile+0xab>
				deleteFile(p->name);
    1922:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1925:	8b 40 14             	mov    0x14(%eax),%eax
    1928:	83 ec 0c             	sub    $0xc,%esp
    192b:	50                   	push   %eax
    192c:	e8 75 ff ff ff       	call   18a6 <deleteFile>
    1931:	83 c4 10             	add    $0x10,%esp
				freeFileItemList();
    1934:	e8 28 e8 ff ff       	call   161 <freeFileItemList>
				list(".");
    1939:	83 ec 0c             	sub    $0xc,%esp
    193c:	68 a7 ab 00 00       	push   $0xaba7
    1941:	e8 05 e9 ff ff       	call   24b <list>
    1946:	83 c4 10             	add    $0x10,%esp
				p = fileItemList;
    1949:	a1 88 f7 00 00       	mov    0xf788,%eax
    194e:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else{
			freeFileItemList();
			list(".");
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    1951:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1955:	75 cb                	jne    1922 <deleteFile+0x7c>
				deleteFile(p->name);
				freeFileItemList();
				list(".");
				p = fileItemList;
			}
			chdir("..");
    1957:	83 ec 0c             	sub    $0xc,%esp
    195a:	68 4d ac 00 00       	push   $0xac4d
    195f:	e8 ff 28 00 00       	call   4263 <chdir>
    1964:	83 c4 10             	add    $0x10,%esp
			freeFileItemList();
    1967:	e8 f5 e7 ff ff       	call   161 <freeFileItemList>
			list(".");
    196c:	83 ec 0c             	sub    $0xc,%esp
    196f:	68 a7 ab 00 00       	push   $0xaba7
    1974:	e8 d2 e8 ff ff       	call   24b <list>
    1979:	83 c4 10             	add    $0x10,%esp
			unlink(name);
    197c:	83 ec 0c             	sub    $0xc,%esp
    197f:	ff 75 08             	pushl  0x8(%ebp)
    1982:	e8 bc 28 00 00       	call   4243 <unlink>
    1987:	83 c4 10             	add    $0x10,%esp
		}
	}
}
    198a:	c9                   	leave  
    198b:	c3                   	ret    

0000198c <h_deleteFile>:
void h_deleteFile(Point p) {
    198c:	55                   	push   %ebp
    198d:	89 e5                	mov    %esp,%ebp
    198f:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    1992:	a1 88 f7 00 00       	mov    0xf788,%eax
    1997:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    199a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    19a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    19a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    19a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    19ad:	83 ec 08             	sub    $0x8,%esp
    19b0:	68 50 ac 00 00       	push   $0xac50
    19b5:	6a 00                	push   $0x0
    19b7:	e8 14 2a 00 00       	call   43d0 <printf>
    19bc:	83 c4 10             	add    $0x10,%esp
	while (q != 0)
    19bf:	e9 90 00 00 00       	jmp    1a54 <h_deleteFile+0xc8>
	{
		printf(0, "hi2\n");
    19c4:	83 ec 08             	sub    $0x8,%esp
    19c7:	68 55 ac 00 00       	push   $0xac55
    19cc:	6a 00                	push   $0x0
    19ce:	e8 fd 29 00 00       	call   43d0 <printf>
    19d3:	83 c4 10             	add    $0x10,%esp
		if (q->chosen)
    19d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19d9:	8b 40 28             	mov    0x28(%eax),%eax
    19dc:	85 c0                	test   %eax,%eax
    19de:	74 6b                	je     1a4b <h_deleteFile+0xbf>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    19e0:	83 ec 0c             	sub    $0xc,%esp
    19e3:	6a 30                	push   $0x30
    19e5:	e8 b7 2c 00 00       	call   46a1 <malloc>
    19ea:	83 c4 10             	add    $0x10,%esp
    19ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    19f0:	83 ec 0c             	sub    $0xc,%esp
    19f3:	6a 20                	push   $0x20
    19f5:	e8 a7 2c 00 00       	call   46a1 <malloc>
    19fa:	83 c4 10             	add    $0x10,%esp
    19fd:	89 c2                	mov    %eax,%edx
    19ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a02:	89 50 14             	mov    %edx,0x14(%eax)
			strcpy(p1->name, q->name);
    1a05:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a08:	8b 50 14             	mov    0x14(%eax),%edx
    1a0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a0e:	8b 40 14             	mov    0x14(%eax),%eax
    1a11:	83 ec 08             	sub    $0x8,%esp
    1a14:	52                   	push   %edx
    1a15:	50                   	push   %eax
    1a16:	e8 a8 25 00 00       	call   3fc3 <strcpy>
    1a1b:	83 c4 10             	add    $0x10,%esp
			if(head == 0)
    1a1e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a22:	75 0e                	jne    1a32 <h_deleteFile+0xa6>
			{
				head = p1;
    1a24:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a27:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    1a2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a2d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1a30:	eb 0f                	jmp    1a41 <h_deleteFile+0xb5>
			} else {
				p2->next = p1;
    1a32:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a35:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1a38:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    1a3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a3e:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    1a41:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a44:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    1a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a4e:	8b 40 2c             	mov    0x2c(%eax),%eax
    1a51:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    1a54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a58:	0f 85 66 ff ff ff    	jne    19c4 <h_deleteFile+0x38>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    1a5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a61:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    1a64:	83 ec 08             	sub    $0x8,%esp
    1a67:	68 5c ac 00 00       	push   $0xac5c
    1a6c:	6a 00                	push   $0x0
    1a6e:	e8 5d 29 00 00       	call   43d0 <printf>
    1a73:	83 c4 10             	add    $0x10,%esp
	while (p1 != 0)
    1a76:	eb 1b                	jmp    1a93 <h_deleteFile+0x107>
	{
		deleteFile(p1->name);
    1a78:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a7b:	8b 40 14             	mov    0x14(%eax),%eax
    1a7e:	83 ec 0c             	sub    $0xc,%esp
    1a81:	50                   	push   %eax
    1a82:	e8 1f fe ff ff       	call   18a6 <deleteFile>
    1a87:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    1a8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a8d:	8b 40 2c             	mov    0x2c(%eax),%eax
    1a90:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    1a93:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a97:	75 df                	jne    1a78 <h_deleteFile+0xec>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    1a99:	83 ec 08             	sub    $0x8,%esp
    1a9c:	68 c4 ac 00 00       	push   $0xacc4
    1aa1:	6a 00                	push   $0x0
    1aa3:	e8 28 29 00 00       	call   43d0 <printf>
    1aa8:	83 c4 10             	add    $0x10,%esp
	p1 = head;
    1aab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1aae:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    1ab1:	eb 48                	jmp    1afb <h_deleteFile+0x16f>
		p2 = p1;
    1ab3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ab6:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    1ab9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1abc:	8b 40 14             	mov    0x14(%eax),%eax
    1abf:	83 ec 04             	sub    $0x4,%esp
    1ac2:	50                   	push   %eax
    1ac3:	68 da ac 00 00       	push   $0xacda
    1ac8:	6a 00                	push   $0x0
    1aca:	e8 01 29 00 00       	call   43d0 <printf>
    1acf:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    1ad2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ad5:	8b 40 2c             	mov    0x2c(%eax),%eax
    1ad8:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    1adb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ade:	8b 40 14             	mov    0x14(%eax),%eax
    1ae1:	83 ec 0c             	sub    $0xc,%esp
    1ae4:	50                   	push   %eax
    1ae5:	e8 76 2a 00 00       	call   4560 <free>
    1aea:	83 c4 10             	add    $0x10,%esp
		free(p2);
    1aed:	83 ec 0c             	sub    $0xc,%esp
    1af0:	ff 75 e8             	pushl  -0x18(%ebp)
    1af3:	e8 68 2a 00 00       	call   4560 <free>
    1af8:	83 c4 10             	add    $0x10,%esp
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    1afb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1aff:	75 b2                	jne    1ab3 <h_deleteFile+0x127>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    1b01:	83 ec 08             	sub    $0x8,%esp
    1b04:	68 e6 ac 00 00       	push   $0xace6
    1b09:	6a 00                	push   $0x0
    1b0b:	e8 c0 28 00 00       	call   43d0 <printf>
    1b10:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1b13:	e8 49 e6 ff ff       	call   161 <freeFileItemList>
	list(".");
    1b18:	83 ec 0c             	sub    $0xc,%esp
    1b1b:	68 a7 ab 00 00       	push   $0xaba7
    1b20:	e8 26 e7 ff ff       	call   24b <list>
    1b25:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1b28:	e8 a6 f1 ff ff       	call   cd3 <printItemList>
	drawFinderContent(context);
    1b2d:	83 ec 04             	sub    $0x4,%esp
    1b30:	ff 35 48 2e 01 00    	pushl  0x12e48
    1b36:	ff 35 44 2e 01 00    	pushl  0x12e44
    1b3c:	ff 35 40 2e 01 00    	pushl  0x12e40
    1b42:	e8 33 ee ff ff       	call   97a <drawFinderContent>
    1b47:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1b4a:	83 ec 04             	sub    $0x4,%esp
    1b4d:	ff 35 48 2e 01 00    	pushl  0x12e48
    1b53:	ff 35 44 2e 01 00    	pushl  0x12e44
    1b59:	ff 35 40 2e 01 00    	pushl  0x12e40
    1b5f:	e8 f8 ec ff ff       	call   85c <drawFinderWnd>
    1b64:	83 c4 10             	add    $0x10,%esp
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1b67:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1b6a:	83 ec 0c             	sub    $0xc,%esp
    1b6d:	68 58 02 00 00       	push   $0x258
    1b72:	68 20 03 00 00       	push   $0x320
    1b77:	6a 00                	push   $0x0
    1b79:	6a 00                	push   $0x0
    1b7b:	50                   	push   %eax
    1b7c:	e8 ae 1e 00 00       	call   3a2f <initRect>
    1b81:	83 c4 1c             	add    $0x1c,%esp
    1b84:	83 ec 0c             	sub    $0xc,%esp
    1b87:	ff 75 e4             	pushl  -0x1c(%ebp)
    1b8a:	ff 75 e0             	pushl  -0x20(%ebp)
    1b8d:	ff 75 dc             	pushl  -0x24(%ebp)
    1b90:	ff 75 d8             	pushl  -0x28(%ebp)
    1b93:	68 80 2f 01 00       	push   $0x12f80
    1b98:	e8 57 20 00 00       	call   3bf4 <deleteClickable>
    1b9d:	83 c4 20             	add    $0x20,%esp
		addWndEvent(&cm);
    1ba0:	83 ec 0c             	sub    $0xc,%esp
    1ba3:	68 80 2f 01 00       	push   $0x12f80
    1ba8:	e8 20 f3 ff ff       	call   ecd <addWndEvent>
    1bad:	83 c4 10             	add    $0x10,%esp
		addListEvent(&cm);
    1bb0:	83 ec 0c             	sub    $0xc,%esp
    1bb3:	68 80 2f 01 00       	push   $0x12f80
    1bb8:	e8 b5 f2 ff ff       	call   e72 <addListEvent>
    1bbd:	83 c4 10             	add    $0x10,%esp
}
    1bc0:	c9                   	leave  
    1bc1:	c3                   	ret    

00001bc2 <copyFile>:

void copyFile(){
    1bc2:	55                   	push   %ebp
    1bc3:	89 e5                	mov    %esp,%ebp
    1bc5:	56                   	push   %esi
    1bc6:	53                   	push   %ebx
    1bc7:	83 ec 10             	sub    $0x10,%esp
	int fd;
	struct fileItem *p = fileItemList;
    1bca:	a1 88 f7 00 00       	mov    0xf788,%eax
    1bcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    1bd2:	e9 07 01 00 00       	jmp    1cde <copyFile+0x11c>
		if (p->chosen == 1){
    1bd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bda:	8b 40 28             	mov    0x28(%eax),%eax
    1bdd:	83 f8 01             	cmp    $0x1,%eax
    1be0:	0f 85 ef 00 00 00    	jne    1cd5 <copyFile+0x113>
			if(lenOfWaited >= MAX_COPY_SIZE){
    1be6:	a1 94 2f 01 00       	mov    0x12f94,%eax
    1beb:	83 f8 07             	cmp    $0x7,%eax
    1bee:	7e 1d                	jle    1c0d <copyFile+0x4b>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    1bf0:	a1 94 2f 01 00       	mov    0x12f94,%eax
    1bf5:	83 ec 04             	sub    $0x4,%esp
    1bf8:	50                   	push   %eax
    1bf9:	68 f8 ac 00 00       	push   $0xacf8
    1bfe:	6a 00                	push   $0x0
    1c00:	e8 cb 27 00 00       	call   43d0 <printf>
    1c05:	83 c4 10             	add    $0x10,%esp
    1c08:	e9 c8 00 00 00       	jmp    1cd5 <copyFile+0x113>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    1c0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c10:	8b 40 14             	mov    0x14(%eax),%eax
    1c13:	83 ec 08             	sub    $0x8,%esp
    1c16:	6a 00                	push   $0x0
    1c18:	50                   	push   %eax
    1c19:	e8 15 26 00 00       	call   4233 <open>
    1c1e:	83 c4 10             	add    $0x10,%esp
    1c21:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1c24:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1c28:	0f 88 8e 00 00 00    	js     1cbc <copyFile+0xfa>
					strcpy(filesWaited[lenOfWaited], currentPath);
    1c2e:	a1 94 2f 01 00       	mov    0x12f94,%eax
    1c33:	c1 e0 08             	shl    $0x8,%eax
    1c36:	05 40 26 01 00       	add    $0x12640,%eax
    1c3b:	83 ec 08             	sub    $0x8,%esp
    1c3e:	68 80 2e 01 00       	push   $0x12e80
    1c43:	50                   	push   %eax
    1c44:	e8 7a 23 00 00       	call   3fc3 <strcpy>
    1c49:	83 c4 10             	add    $0x10,%esp
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    1c4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c4f:	8b 58 14             	mov    0x14(%eax),%ebx
    1c52:	a1 94 2f 01 00       	mov    0x12f94,%eax
    1c57:	c1 e0 08             	shl    $0x8,%eax
    1c5a:	8d b0 40 26 01 00    	lea    0x12640(%eax),%esi
    1c60:	83 ec 0c             	sub    $0xc,%esp
    1c63:	68 80 2e 01 00       	push   $0x12e80
    1c68:	e8 c5 23 00 00       	call   4032 <strlen>
    1c6d:	83 c4 10             	add    $0x10,%esp
    1c70:	01 f0                	add    %esi,%eax
    1c72:	83 ec 08             	sub    $0x8,%esp
    1c75:	53                   	push   %ebx
    1c76:	50                   	push   %eax
    1c77:	e8 47 23 00 00       	call   3fc3 <strcpy>
    1c7c:	83 c4 10             	add    $0x10,%esp
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    1c7f:	a1 94 2f 01 00       	mov    0x12f94,%eax
    1c84:	c1 e0 08             	shl    $0x8,%eax
    1c87:	05 40 26 01 00       	add    $0x12640,%eax
    1c8c:	83 ec 04             	sub    $0x4,%esp
    1c8f:	50                   	push   %eax
    1c90:	68 13 ad 00 00       	push   $0xad13
    1c95:	6a 00                	push   $0x0
    1c97:	e8 34 27 00 00       	call   43d0 <printf>
    1c9c:	83 c4 10             	add    $0x10,%esp
					lenOfWaited++;
    1c9f:	a1 94 2f 01 00       	mov    0x12f94,%eax
    1ca4:	83 c0 01             	add    $0x1,%eax
    1ca7:	a3 94 2f 01 00       	mov    %eax,0x12f94
					close(fd);
    1cac:	83 ec 0c             	sub    $0xc,%esp
    1caf:	ff 75 f0             	pushl  -0x10(%ebp)
    1cb2:	e8 64 25 00 00       	call   421b <close>
    1cb7:	83 c4 10             	add    $0x10,%esp
    1cba:	eb 19                	jmp    1cd5 <copyFile+0x113>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    1cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cbf:	8b 40 14             	mov    0x14(%eax),%eax
    1cc2:	83 ec 04             	sub    $0x4,%esp
    1cc5:	50                   	push   %eax
    1cc6:	68 29 ad 00 00       	push   $0xad29
    1ccb:	6a 00                	push   $0x0
    1ccd:	e8 fe 26 00 00       	call   43d0 <printf>
    1cd2:	83 c4 10             	add    $0x10,%esp
				}
			}
		}
		p = p->next;
    1cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cd8:	8b 40 2c             	mov    0x2c(%eax),%eax
    1cdb:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    1cde:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ce2:	0f 85 ef fe ff ff    	jne    1bd7 <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    1ce8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1ceb:	5b                   	pop    %ebx
    1cec:	5e                   	pop    %esi
    1ced:	5d                   	pop    %ebp
    1cee:	c3                   	ret    

00001cef <h_copyFile>:

void h_copyFile(Point p){
    1cef:	55                   	push   %ebp
    1cf0:	89 e5                	mov    %esp,%ebp
    1cf2:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    1cf5:	c7 05 84 f7 00 00 00 	movl   $0x0,0xf784
    1cfc:	00 00 00 
	lenOfWaited = 0;
    1cff:	c7 05 94 2f 01 00 00 	movl   $0x0,0x12f94
    1d06:	00 00 00 
	copyFile();
    1d09:	e8 b4 fe ff ff       	call   1bc2 <copyFile>
}
    1d0e:	c9                   	leave  
    1d0f:	c3                   	ret    

00001d10 <moveFile>:

void moveFile(){
    1d10:	55                   	push   %ebp
    1d11:	89 e5                	mov    %esp,%ebp
    1d13:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    1d16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d1d:	eb 1b                	jmp    1d3a <moveFile+0x2a>
		deleteFile(filesWaited[i]);
    1d1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d22:	c1 e0 08             	shl    $0x8,%eax
    1d25:	05 40 26 01 00       	add    $0x12640,%eax
    1d2a:	83 ec 0c             	sub    $0xc,%esp
    1d2d:	50                   	push   %eax
    1d2e:	e8 73 fb ff ff       	call   18a6 <deleteFile>
    1d33:	83 c4 10             	add    $0x10,%esp
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    1d36:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d3a:	a1 94 2f 01 00       	mov    0x12f94,%eax
    1d3f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1d42:	7c db                	jl     1d1f <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    1d44:	c7 05 94 2f 01 00 00 	movl   $0x0,0x12f94
    1d4b:	00 00 00 
}
    1d4e:	c9                   	leave  
    1d4f:	c3                   	ret    

00001d50 <h_cutFile>:

void h_cutFile(Point p){
    1d50:	55                   	push   %ebp
    1d51:	89 e5                	mov    %esp,%ebp
    1d53:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    1d56:	c7 05 84 f7 00 00 01 	movl   $0x1,0xf784
    1d5d:	00 00 00 
	lenOfWaited = 0;
    1d60:	c7 05 94 2f 01 00 00 	movl   $0x0,0x12f94
    1d67:	00 00 00 
	copyFile();
    1d6a:	e8 53 fe ff ff       	call   1bc2 <copyFile>
}
    1d6f:	c9                   	leave  
    1d70:	c3                   	ret    

00001d71 <pasteFile>:

void pasteFile(){
    1d71:	55                   	push   %ebp
    1d72:	89 e5                	mov    %esp,%ebp
    1d74:	83 ec 28             	sub    $0x28,%esp
	int file_src, file_dest;
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
    1d77:	83 ec 0c             	sub    $0xc,%esp
    1d7a:	68 00 10 00 00       	push   $0x1000
    1d7f:	e8 1d 29 00 00       	call   46a1 <malloc>
    1d84:	83 c4 10             	add    $0x10,%esp
    1d87:	89 45 e8             	mov    %eax,-0x18(%ebp)
	memset(buff, 0, 4096);
    1d8a:	83 ec 04             	sub    $0x4,%esp
    1d8d:	68 00 10 00 00       	push   $0x1000
    1d92:	6a 00                	push   $0x0
    1d94:	ff 75 e8             	pushl  -0x18(%ebp)
    1d97:	e8 bd 22 00 00       	call   4059 <memset>
    1d9c:	83 c4 10             	add    $0x10,%esp
    int size = 0;
    1d9f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i = 0; i < lenOfWaited; i++){
    1da6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1dad:	e9 6f 01 00 00       	jmp    1f21 <pasteFile+0x1b0>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    1db2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1db5:	c1 e0 08             	shl    $0x8,%eax
    1db8:	05 40 26 01 00       	add    $0x12640,%eax
    1dbd:	50                   	push   %eax
    1dbe:	ff 75 f4             	pushl  -0xc(%ebp)
    1dc1:	68 3e ad 00 00       	push   $0xad3e
    1dc6:	6a 00                	push   $0x0
    1dc8:	e8 03 26 00 00       	call   43d0 <printf>
    1dcd:	83 c4 10             	add    $0x10,%esp
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    1dd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1dd3:	c1 e0 08             	shl    $0x8,%eax
    1dd6:	05 40 26 01 00       	add    $0x12640,%eax
    1ddb:	83 ec 0c             	sub    $0xc,%esp
    1dde:	50                   	push   %eax
    1ddf:	e8 4e 22 00 00       	call   4032 <strlen>
    1de4:	83 c4 10             	add    $0x10,%esp
    1de7:	83 e8 01             	sub    $0x1,%eax
    1dea:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1ded:	eb 35                	jmp    1e24 <pasteFile+0xb3>
        	if (*(filesWaited[i]+j) == '/'){
    1def:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1df2:	c1 e0 08             	shl    $0x8,%eax
    1df5:	8d 90 40 26 01 00    	lea    0x12640(%eax),%edx
    1dfb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1dfe:	01 d0                	add    %edx,%eax
    1e00:	0f b6 00             	movzbl (%eax),%eax
    1e03:	3c 2f                	cmp    $0x2f,%al
    1e05:	75 19                	jne    1e20 <pasteFile+0xaf>
        		filename = filesWaited[i] + j + 1;
    1e07:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e0a:	c1 e0 08             	shl    $0x8,%eax
    1e0d:	8d 90 40 26 01 00    	lea    0x12640(%eax),%edx
    1e13:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e16:	83 c0 01             	add    $0x1,%eax
    1e19:	01 d0                	add    %edx,%eax
    1e1b:	89 45 ec             	mov    %eax,-0x14(%ebp)
        		break;
    1e1e:	eb 0a                	jmp    1e2a <pasteFile+0xb9>
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    1e20:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    1e24:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e28:	79 c5                	jns    1def <pasteFile+0x7e>
        	if (*(filesWaited[i]+j) == '/'){
        		filename = filesWaited[i] + j + 1;
        		break;
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
    1e2a:	ff 75 ec             	pushl  -0x14(%ebp)
    1e2d:	ff 75 f4             	pushl  -0xc(%ebp)
    1e30:	68 5b ad 00 00       	push   $0xad5b
    1e35:	6a 00                	push   $0x0
    1e37:	e8 94 25 00 00       	call   43d0 <printf>
    1e3c:	83 c4 10             	add    $0x10,%esp
        file_src = open(filesWaited[i], O_RDONLY);
    1e3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e42:	c1 e0 08             	shl    $0x8,%eax
    1e45:	05 40 26 01 00       	add    $0x12640,%eax
    1e4a:	83 ec 08             	sub    $0x8,%esp
    1e4d:	6a 00                	push   $0x0
    1e4f:	50                   	push   %eax
    1e50:	e8 de 23 00 00       	call   4233 <open>
    1e55:	83 c4 10             	add    $0x10,%esp
    1e58:	89 45 e0             	mov    %eax,-0x20(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    1e5b:	83 ec 08             	sub    $0x8,%esp
    1e5e:	6a 00                	push   $0x0
    1e60:	ff 75 ec             	pushl  -0x14(%ebp)
    1e63:	e8 cb 23 00 00       	call   4233 <open>
    1e68:	83 c4 10             	add    $0x10,%esp
    1e6b:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1e6e:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1e72:	78 25                	js     1e99 <pasteFile+0x128>
			printf(0, "NO.%d file %s already exist\n", i, filename);
    1e74:	ff 75 ec             	pushl  -0x14(%ebp)
    1e77:	ff 75 f4             	pushl  -0xc(%ebp)
    1e7a:	68 73 ad 00 00       	push   $0xad73
    1e7f:	6a 00                	push   $0x0
    1e81:	e8 4a 25 00 00       	call   43d0 <printf>
    1e86:	83 c4 10             	add    $0x10,%esp
			close(file_dest);
    1e89:	83 ec 0c             	sub    $0xc,%esp
    1e8c:	ff 75 dc             	pushl  -0x24(%ebp)
    1e8f:	e8 87 23 00 00       	call   421b <close>
    1e94:	83 c4 10             	add    $0x10,%esp
    1e97:	eb 76                	jmp    1f0f <pasteFile+0x19e>
		}
		else{
			file_dest = open(filename, O_CREATE);
    1e99:	83 ec 08             	sub    $0x8,%esp
    1e9c:	68 00 02 00 00       	push   $0x200
    1ea1:	ff 75 ec             	pushl  -0x14(%ebp)
    1ea4:	e8 8a 23 00 00       	call   4233 <open>
    1ea9:	83 c4 10             	add    $0x10,%esp
    1eac:	89 45 dc             	mov    %eax,-0x24(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    1eaf:	eb 14                	jmp    1ec5 <pasteFile+0x154>
                write(file_dest, buff, size);
    1eb1:	83 ec 04             	sub    $0x4,%esp
    1eb4:	ff 75 e4             	pushl  -0x1c(%ebp)
    1eb7:	ff 75 e8             	pushl  -0x18(%ebp)
    1eba:	ff 75 dc             	pushl  -0x24(%ebp)
    1ebd:	e8 51 23 00 00       	call   4213 <write>
    1ec2:	83 c4 10             	add    $0x10,%esp
			printf(0, "NO.%d file %s already exist\n", i, filename);
			close(file_dest);
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    1ec5:	83 ec 04             	sub    $0x4,%esp
    1ec8:	68 00 10 00 00       	push   $0x1000
    1ecd:	ff 75 e8             	pushl  -0x18(%ebp)
    1ed0:	ff 75 e0             	pushl  -0x20(%ebp)
    1ed3:	e8 33 23 00 00       	call   420b <read>
    1ed8:	83 c4 10             	add    $0x10,%esp
    1edb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1ede:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1ee2:	7f cd                	jg     1eb1 <pasteFile+0x140>
                write(file_dest, buff, size);
	        if(size < 0)
    1ee4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1ee8:	79 17                	jns    1f01 <pasteFile+0x190>
	        {
	            //printf(2, "copy file error!!!\r\n");
	            printf(0, "NO.%d file %s error\n", i, filename);
    1eea:	ff 75 ec             	pushl  -0x14(%ebp)
    1eed:	ff 75 f4             	pushl  -0xc(%ebp)
    1ef0:	68 90 ad 00 00       	push   $0xad90
    1ef5:	6a 00                	push   $0x0
    1ef7:	e8 d4 24 00 00       	call   43d0 <printf>
    1efc:	83 c4 10             	add    $0x10,%esp
	            return;
    1eff:	eb 3c                	jmp    1f3d <pasteFile+0x1cc>
	        }
	        close(file_dest);
    1f01:	83 ec 0c             	sub    $0xc,%esp
    1f04:	ff 75 dc             	pushl  -0x24(%ebp)
    1f07:	e8 0f 23 00 00       	call   421b <close>
    1f0c:	83 c4 10             	add    $0x10,%esp
		}
		close(file_src);
    1f0f:	83 ec 0c             	sub    $0xc,%esp
    1f12:	ff 75 e0             	pushl  -0x20(%ebp)
    1f15:	e8 01 23 00 00       	call   421b <close>
    1f1a:	83 c4 10             	add    $0x10,%esp
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
    1f1d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1f21:	a1 94 2f 01 00       	mov    0x12f94,%eax
    1f26:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1f29:	0f 8c 83 fe ff ff    	jl     1db2 <pasteFile+0x41>
	        }
	        close(file_dest);
		}
		close(file_src);
	}
    free(buff);
    1f2f:	83 ec 0c             	sub    $0xc,%esp
    1f32:	ff 75 e8             	pushl  -0x18(%ebp)
    1f35:	e8 26 26 00 00       	call   4560 <free>
    1f3a:	83 c4 10             	add    $0x10,%esp
}
    1f3d:	c9                   	leave  
    1f3e:	c3                   	ret    

00001f3f <h_pasteFile>:

void h_pasteFile(Point p){
    1f3f:	55                   	push   %ebp
    1f40:	89 e5                	mov    %esp,%ebp
    1f42:	83 ec 18             	sub    $0x18,%esp
	pasteFile();
    1f45:	e8 27 fe ff ff       	call   1d71 <pasteFile>
	if(copyOrCut == 1)
    1f4a:	a1 84 f7 00 00       	mov    0xf784,%eax
    1f4f:	83 f8 01             	cmp    $0x1,%eax
    1f52:	75 05                	jne    1f59 <h_pasteFile+0x1a>
		moveFile();
    1f54:	e8 b7 fd ff ff       	call   1d10 <moveFile>
    freeFileItemList();
    1f59:	e8 03 e2 ff ff       	call   161 <freeFileItemList>
	list(".");
    1f5e:	83 ec 0c             	sub    $0xc,%esp
    1f61:	68 a7 ab 00 00       	push   $0xaba7
    1f66:	e8 e0 e2 ff ff       	call   24b <list>
    1f6b:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1f6e:	83 ec 04             	sub    $0x4,%esp
    1f71:	ff 35 48 2e 01 00    	pushl  0x12e48
    1f77:	ff 35 44 2e 01 00    	pushl  0x12e44
    1f7d:	ff 35 40 2e 01 00    	pushl  0x12e40
    1f83:	e8 f2 e9 ff ff       	call   97a <drawFinderContent>
    1f88:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1f8b:	83 ec 04             	sub    $0x4,%esp
    1f8e:	ff 35 48 2e 01 00    	pushl  0x12e48
    1f94:	ff 35 44 2e 01 00    	pushl  0x12e44
    1f9a:	ff 35 40 2e 01 00    	pushl  0x12e40
    1fa0:	e8 b7 e8 ff ff       	call   85c <drawFinderWnd>
    1fa5:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1fa8:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1fab:	83 ec 0c             	sub    $0xc,%esp
    1fae:	68 58 02 00 00       	push   $0x258
    1fb3:	68 20 03 00 00       	push   $0x320
    1fb8:	6a 00                	push   $0x0
    1fba:	6a 00                	push   $0x0
    1fbc:	50                   	push   %eax
    1fbd:	e8 6d 1a 00 00       	call   3a2f <initRect>
    1fc2:	83 c4 1c             	add    $0x1c,%esp
    1fc5:	83 ec 0c             	sub    $0xc,%esp
    1fc8:	ff 75 f4             	pushl  -0xc(%ebp)
    1fcb:	ff 75 f0             	pushl  -0x10(%ebp)
    1fce:	ff 75 ec             	pushl  -0x14(%ebp)
    1fd1:	ff 75 e8             	pushl  -0x18(%ebp)
    1fd4:	68 80 2f 01 00       	push   $0x12f80
    1fd9:	e8 16 1c 00 00       	call   3bf4 <deleteClickable>
    1fde:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1fe1:	83 ec 0c             	sub    $0xc,%esp
    1fe4:	68 80 2f 01 00       	push   $0x12f80
    1fe9:	e8 df ee ff ff       	call   ecd <addWndEvent>
    1fee:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1ff1:	83 ec 0c             	sub    $0xc,%esp
    1ff4:	68 80 2f 01 00       	push   $0x12f80
    1ff9:	e8 74 ee ff ff       	call   e72 <addListEvent>
    1ffe:	83 c4 10             	add    $0x10,%esp
}
    2001:	c9                   	leave  
    2002:	c3                   	ret    

00002003 <h_chooseFile>:

void h_chooseFile(Point p) {
    2003:	55                   	push   %ebp
    2004:	89 e5                	mov    %esp,%ebp
    2006:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *temp = getFileItem(p);
    2009:	83 ec 08             	sub    $0x8,%esp
    200c:	ff 75 0c             	pushl  0xc(%ebp)
    200f:	ff 75 08             	pushl  0x8(%ebp)
    2012:	e8 67 ef ff ff       	call   f7e <getFileItem>
    2017:	83 c4 10             	add    $0x10,%esp
    201a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    201d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2020:	8b 40 28             	mov    0x28(%eax),%eax
    2023:	85 c0                	test   %eax,%eax
    2025:	74 1e                	je     2045 <h_chooseFile+0x42>
	{
		printf(0, "chooseFile!\n");
    2027:	83 ec 08             	sub    $0x8,%esp
    202a:	68 a5 ad 00 00       	push   $0xada5
    202f:	6a 00                	push   $0x0
    2031:	e8 9a 23 00 00       	call   43d0 <printf>
    2036:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 0;
    2039:	8b 45 f4             	mov    -0xc(%ebp),%eax
    203c:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    2043:	eb 1c                	jmp    2061 <h_chooseFile+0x5e>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    2045:	83 ec 08             	sub    $0x8,%esp
    2048:	68 b2 ad 00 00       	push   $0xadb2
    204d:	6a 00                	push   $0x0
    204f:	e8 7c 23 00 00       	call   43d0 <printf>
    2054:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 1;
    2057:	8b 45 f4             	mov    -0xc(%ebp),%eax
    205a:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    2061:	83 ec 04             	sub    $0x4,%esp
    2064:	ff 35 48 2e 01 00    	pushl  0x12e48
    206a:	ff 35 44 2e 01 00    	pushl  0x12e44
    2070:	ff 35 40 2e 01 00    	pushl  0x12e40
    2076:	e8 ff e8 ff ff       	call   97a <drawFinderContent>
    207b:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    207e:	83 ec 04             	sub    $0x4,%esp
    2081:	ff 35 48 2e 01 00    	pushl  0x12e48
    2087:	ff 35 44 2e 01 00    	pushl  0x12e44
    208d:	ff 35 40 2e 01 00    	pushl  0x12e40
    2093:	e8 c4 e7 ff ff       	call   85c <drawFinderWnd>
    2098:	83 c4 10             	add    $0x10,%esp
}
    209b:	c9                   	leave  
    209c:	c3                   	ret    

0000209d <h_closeWnd>:

void h_closeWnd(Point p) {
    209d:	55                   	push   %ebp
    209e:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    20a0:	c7 05 80 ed 00 00 00 	movl   $0x0,0xed80
    20a7:	00 00 00 
}
    20aa:	5d                   	pop    %ebp
    20ab:	c3                   	ret    

000020ac <h_chvm1>:

void h_chvm1(Point p) {
    20ac:	55                   	push   %ebp
    20ad:	89 e5                	mov    %esp,%ebp
    20af:	83 ec 18             	sub    $0x18,%esp
	style = ICON_STYLE;
    20b2:	c7 05 84 ed 00 00 01 	movl   $0x1,0xed84
    20b9:	00 00 00 
	freeFileItemList();
    20bc:	e8 a0 e0 ff ff       	call   161 <freeFileItemList>
		list(".");
    20c1:	83 ec 0c             	sub    $0xc,%esp
    20c4:	68 a7 ab 00 00       	push   $0xaba7
    20c9:	e8 7d e1 ff ff       	call   24b <list>
    20ce:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    20d1:	83 ec 04             	sub    $0x4,%esp
    20d4:	ff 35 48 2e 01 00    	pushl  0x12e48
    20da:	ff 35 44 2e 01 00    	pushl  0x12e44
    20e0:	ff 35 40 2e 01 00    	pushl  0x12e40
    20e6:	e8 8f e8 ff ff       	call   97a <drawFinderContent>
    20eb:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    20ee:	83 ec 04             	sub    $0x4,%esp
    20f1:	ff 35 48 2e 01 00    	pushl  0x12e48
    20f7:	ff 35 44 2e 01 00    	pushl  0x12e44
    20fd:	ff 35 40 2e 01 00    	pushl  0x12e40
    2103:	e8 54 e7 ff ff       	call   85c <drawFinderWnd>
    2108:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    210b:	8d 45 e8             	lea    -0x18(%ebp),%eax
    210e:	83 ec 0c             	sub    $0xc,%esp
    2111:	68 58 02 00 00       	push   $0x258
    2116:	68 20 03 00 00       	push   $0x320
    211b:	6a 00                	push   $0x0
    211d:	6a 00                	push   $0x0
    211f:	50                   	push   %eax
    2120:	e8 0a 19 00 00       	call   3a2f <initRect>
    2125:	83 c4 1c             	add    $0x1c,%esp
    2128:	83 ec 0c             	sub    $0xc,%esp
    212b:	ff 75 f4             	pushl  -0xc(%ebp)
    212e:	ff 75 f0             	pushl  -0x10(%ebp)
    2131:	ff 75 ec             	pushl  -0x14(%ebp)
    2134:	ff 75 e8             	pushl  -0x18(%ebp)
    2137:	68 80 2f 01 00       	push   $0x12f80
    213c:	e8 b3 1a 00 00       	call   3bf4 <deleteClickable>
    2141:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    2144:	83 ec 0c             	sub    $0xc,%esp
    2147:	68 80 2f 01 00       	push   $0x12f80
    214c:	e8 7c ed ff ff       	call   ecd <addWndEvent>
    2151:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    2154:	83 ec 0c             	sub    $0xc,%esp
    2157:	68 80 2f 01 00       	push   $0x12f80
    215c:	e8 11 ed ff ff       	call   e72 <addListEvent>
    2161:	83 c4 10             	add    $0x10,%esp
}
    2164:	c9                   	leave  
    2165:	c3                   	ret    

00002166 <h_chvm2>:

void h_chvm2(Point p) {
    2166:	55                   	push   %ebp
    2167:	89 e5                	mov    %esp,%ebp
    2169:	83 ec 18             	sub    $0x18,%esp
	style = LIST_STYLE;
    216c:	c7 05 84 ed 00 00 02 	movl   $0x2,0xed84
    2173:	00 00 00 
	freeFileItemList();
    2176:	e8 e6 df ff ff       	call   161 <freeFileItemList>
		list(".");
    217b:	83 ec 0c             	sub    $0xc,%esp
    217e:	68 a7 ab 00 00       	push   $0xaba7
    2183:	e8 c3 e0 ff ff       	call   24b <list>
    2188:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    218b:	83 ec 04             	sub    $0x4,%esp
    218e:	ff 35 48 2e 01 00    	pushl  0x12e48
    2194:	ff 35 44 2e 01 00    	pushl  0x12e44
    219a:	ff 35 40 2e 01 00    	pushl  0x12e40
    21a0:	e8 d5 e7 ff ff       	call   97a <drawFinderContent>
    21a5:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    21a8:	83 ec 04             	sub    $0x4,%esp
    21ab:	ff 35 48 2e 01 00    	pushl  0x12e48
    21b1:	ff 35 44 2e 01 00    	pushl  0x12e44
    21b7:	ff 35 40 2e 01 00    	pushl  0x12e40
    21bd:	e8 9a e6 ff ff       	call   85c <drawFinderWnd>
    21c2:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    21c5:	8d 45 e8             	lea    -0x18(%ebp),%eax
    21c8:	83 ec 0c             	sub    $0xc,%esp
    21cb:	68 58 02 00 00       	push   $0x258
    21d0:	68 20 03 00 00       	push   $0x320
    21d5:	6a 00                	push   $0x0
    21d7:	6a 00                	push   $0x0
    21d9:	50                   	push   %eax
    21da:	e8 50 18 00 00       	call   3a2f <initRect>
    21df:	83 c4 1c             	add    $0x1c,%esp
    21e2:	83 ec 0c             	sub    $0xc,%esp
    21e5:	ff 75 f4             	pushl  -0xc(%ebp)
    21e8:	ff 75 f0             	pushl  -0x10(%ebp)
    21eb:	ff 75 ec             	pushl  -0x14(%ebp)
    21ee:	ff 75 e8             	pushl  -0x18(%ebp)
    21f1:	68 80 2f 01 00       	push   $0x12f80
    21f6:	e8 f9 19 00 00       	call   3bf4 <deleteClickable>
    21fb:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    21fe:	83 ec 0c             	sub    $0xc,%esp
    2201:	68 80 2f 01 00       	push   $0x12f80
    2206:	e8 c2 ec ff ff       	call   ecd <addWndEvent>
    220b:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    220e:	83 ec 0c             	sub    $0xc,%esp
    2211:	68 80 2f 01 00       	push   $0x12f80
    2216:	e8 57 ec ff ff       	call   e72 <addListEvent>
    221b:	83 c4 10             	add    $0x10,%esp
}
    221e:	c9                   	leave  
    221f:	c3                   	ret    

00002220 <h_goUp>:

void h_goUp(Point p) {
    2220:	55                   	push   %ebp
    2221:	89 e5                	mov    %esp,%ebp
    2223:	83 ec 18             	sub    $0x18,%esp
	enterDir("..");
    2226:	83 ec 0c             	sub    $0xc,%esp
    2229:	68 4d ac 00 00       	push   $0xac4d
    222e:	e8 9a f1 ff ff       	call   13cd <enterDir>
    2233:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2236:	e8 26 df ff ff       	call   161 <freeFileItemList>
	list(".");
    223b:	83 ec 0c             	sub    $0xc,%esp
    223e:	68 a7 ab 00 00       	push   $0xaba7
    2243:	e8 03 e0 ff ff       	call   24b <list>
    2248:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    224b:	83 ec 04             	sub    $0x4,%esp
    224e:	ff 35 48 2e 01 00    	pushl  0x12e48
    2254:	ff 35 44 2e 01 00    	pushl  0x12e44
    225a:	ff 35 40 2e 01 00    	pushl  0x12e40
    2260:	e8 15 e7 ff ff       	call   97a <drawFinderContent>
    2265:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2268:	83 ec 04             	sub    $0x4,%esp
    226b:	ff 35 48 2e 01 00    	pushl  0x12e48
    2271:	ff 35 44 2e 01 00    	pushl  0x12e44
    2277:	ff 35 40 2e 01 00    	pushl  0x12e40
    227d:	e8 da e5 ff ff       	call   85c <drawFinderWnd>
    2282:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2285:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2288:	83 ec 0c             	sub    $0xc,%esp
    228b:	68 58 02 00 00       	push   $0x258
    2290:	68 20 03 00 00       	push   $0x320
    2295:	6a 00                	push   $0x0
    2297:	6a 00                	push   $0x0
    2299:	50                   	push   %eax
    229a:	e8 90 17 00 00       	call   3a2f <initRect>
    229f:	83 c4 1c             	add    $0x1c,%esp
    22a2:	83 ec 0c             	sub    $0xc,%esp
    22a5:	ff 75 f4             	pushl  -0xc(%ebp)
    22a8:	ff 75 f0             	pushl  -0x10(%ebp)
    22ab:	ff 75 ec             	pushl  -0x14(%ebp)
    22ae:	ff 75 e8             	pushl  -0x18(%ebp)
    22b1:	68 80 2f 01 00       	push   $0x12f80
    22b6:	e8 39 19 00 00       	call   3bf4 <deleteClickable>
    22bb:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    22be:	83 ec 0c             	sub    $0xc,%esp
    22c1:	68 80 2f 01 00       	push   $0x12f80
    22c6:	e8 02 ec ff ff       	call   ecd <addWndEvent>
    22cb:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    22ce:	83 ec 0c             	sub    $0xc,%esp
    22d1:	68 80 2f 01 00       	push   $0x12f80
    22d6:	e8 97 eb ff ff       	call   e72 <addListEvent>
    22db:	83 c4 10             	add    $0x10,%esp
}
    22de:	c9                   	leave  
    22df:	c3                   	ret    

000022e0 <h_empty>:

void h_empty(Point p) {
    22e0:	55                   	push   %ebp
    22e1:	89 e5                	mov    %esp,%ebp

}
    22e3:	5d                   	pop    %ebp
    22e4:	c3                   	ret    

000022e5 <main>:

int main(int argc, char *argv[]) {
    22e5:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    22e9:	83 e4 f0             	and    $0xfffffff0,%esp
    22ec:	ff 71 fc             	pushl  -0x4(%ecx)
    22ef:	55                   	push   %ebp
    22f0:	89 e5                	mov    %esp,%ebp
    22f2:	56                   	push   %esi
    22f3:	53                   	push   %ebx
    22f4:	51                   	push   %ecx
    22f5:	83 ec 7c             	sub    $0x7c,%esp
	struct Msg msg;
	char key;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    22f8:	83 ec 04             	sub    $0x4,%esp
    22fb:	68 c2 01 00 00       	push   $0x1c2
    2300:	68 58 02 00 00       	push   $0x258
    2305:	68 40 2e 01 00       	push   $0x12e40
    230a:	e8 f1 04 00 00       	call   2800 <init_context>
    230f:	83 c4 10             	add    $0x10,%esp
    2312:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    2315:	8d 45 88             	lea    -0x78(%ebp),%eax
    2318:	ff 35 48 2e 01 00    	pushl  0x12e48
    231e:	ff 35 44 2e 01 00    	pushl  0x12e44
    2324:	ff 35 40 2e 01 00    	pushl  0x12e40
    232a:	50                   	push   %eax
    232b:	e8 93 17 00 00       	call   3ac3 <initClickManager>
    2330:	83 c4 0c             	add    $0xc,%esp
    2333:	8b 45 88             	mov    -0x78(%ebp),%eax
    2336:	a3 80 2f 01 00       	mov    %eax,0x12f80
    233b:	8b 45 8c             	mov    -0x74(%ebp),%eax
    233e:	a3 84 2f 01 00       	mov    %eax,0x12f84
    2343:	8b 45 90             	mov    -0x70(%ebp),%eax
    2346:	a3 88 2f 01 00       	mov    %eax,0x12f88
    234b:	8b 45 94             	mov    -0x6c(%ebp),%eax
    234e:	a3 8c 2f 01 00       	mov    %eax,0x12f8c
    2353:	8b 45 98             	mov    -0x68(%ebp),%eax
    2356:	a3 90 2f 01 00       	mov    %eax,0x12f90
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    235b:	83 ec 08             	sub    $0x8,%esp
    235e:	6a 0e                	push   $0xe
    2360:	68 c0 ee 00 00       	push   $0xeec0
    2365:	e8 c0 0e 00 00       	call   322a <load_iconlist>
    236a:	83 c4 10             	add    $0x10,%esp
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    236d:	83 ec 08             	sub    $0x8,%esp
    2370:	6a 04                	push   $0x4
    2372:	68 c0 ed 00 00       	push   $0xedc0
    2377:	e8 ae 0e 00 00       	call   322a <load_iconlist>
    237c:	83 c4 10             	add    $0x10,%esp
	//testHandlers();
	strcpy(currentPath, "/");
    237f:	83 ec 08             	sub    $0x8,%esp
    2382:	68 c1 ad 00 00       	push   $0xadc1
    2387:	68 80 2e 01 00       	push   $0x12e80
    238c:	e8 32 1c 00 00       	call   3fc3 <strcpy>
    2391:	83 c4 10             	add    $0x10,%esp
	mkdir("userfolder");
    2394:	83 ec 0c             	sub    $0xc,%esp
    2397:	68 c3 ad 00 00       	push   $0xadc3
    239c:	e8 ba 1e 00 00       	call   425b <mkdir>
    23a1:	83 c4 10             	add    $0x10,%esp
	enterDir("userfolder");
    23a4:	83 ec 0c             	sub    $0xc,%esp
    23a7:	68 c3 ad 00 00       	push   $0xadc3
    23ac:	e8 1c f0 ff ff       	call   13cd <enterDir>
    23b1:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    23b4:	e8 a8 dd ff ff       	call   161 <freeFileItemList>
	list(".");
    23b9:	83 ec 0c             	sub    $0xc,%esp
    23bc:	68 a7 ab 00 00       	push   $0xaba7
    23c1:	e8 85 de ff ff       	call   24b <list>
    23c6:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    23c9:	8d 45 d0             	lea    -0x30(%ebp),%eax
    23cc:	83 ec 0c             	sub    $0xc,%esp
    23cf:	68 58 02 00 00       	push   $0x258
    23d4:	68 20 03 00 00       	push   $0x320
    23d9:	6a 00                	push   $0x0
    23db:	6a 00                	push   $0x0
    23dd:	50                   	push   %eax
    23de:	e8 4c 16 00 00       	call   3a2f <initRect>
    23e3:	83 c4 1c             	add    $0x1c,%esp
    23e6:	83 ec 0c             	sub    $0xc,%esp
    23e9:	ff 75 dc             	pushl  -0x24(%ebp)
    23ec:	ff 75 d8             	pushl  -0x28(%ebp)
    23ef:	ff 75 d4             	pushl  -0x2c(%ebp)
    23f2:	ff 75 d0             	pushl  -0x30(%ebp)
    23f5:	68 80 2f 01 00       	push   $0x12f80
    23fa:	e8 f5 17 00 00       	call   3bf4 <deleteClickable>
    23ff:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2402:	83 ec 0c             	sub    $0xc,%esp
    2405:	68 80 2f 01 00       	push   $0x12f80
    240a:	e8 be ea ff ff       	call   ecd <addWndEvent>
    240f:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2412:	83 ec 0c             	sub    $0xc,%esp
    2415:	68 80 2f 01 00       	push   $0x12f80
    241a:	e8 53 ea ff ff       	call   e72 <addListEvent>
    241f:	83 c4 10             	add    $0x10,%esp
	lenOfWaited = 0;
    2422:	c7 05 94 2f 01 00 00 	movl   $0x0,0x12f94
    2429:	00 00 00 
	while (isRun) {
    242c:	e9 91 02 00 00       	jmp    26c2 <main+0x3dd>
		getMsg(&msg);
    2431:	83 ec 0c             	sub    $0xc,%esp
    2434:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2437:	50                   	push   %eax
    2438:	e8 56 1e 00 00       	call   4293 <getMsg>
    243d:	83 c4 10             	add    $0x10,%esp
		switch (msg.msg_type) {
    2440:	8b 45 b8             	mov    -0x48(%ebp),%eax
    2443:	83 f8 08             	cmp    $0x8,%eax
    2446:	0f 87 75 02 00 00    	ja     26c1 <main+0x3dc>
    244c:	8b 04 85 d0 ad 00 00 	mov    0xadd0(,%eax,4),%eax
    2453:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2455:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2458:	8b 55 bc             	mov    -0x44(%ebp),%edx
    245b:	8d 45 b0             	lea    -0x50(%ebp),%eax
    245e:	83 ec 04             	sub    $0x4,%esp
    2461:	51                   	push   %ecx
    2462:	52                   	push   %edx
    2463:	50                   	push   %eax
    2464:	e8 9f 15 00 00       	call   3a08 <initPoint>
    2469:	83 c4 0c             	add    $0xc,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    246c:	a1 84 2f 01 00       	mov    0x12f84,%eax
    2471:	83 ec 04             	sub    $0x4,%esp
    2474:	ff 75 b4             	pushl  -0x4c(%ebp)
    2477:	ff 75 b0             	pushl  -0x50(%ebp)
    247a:	50                   	push   %eax
    247b:	e8 46 18 00 00       	call   3cc6 <executeHandler>
    2480:	83 c4 10             	add    $0x10,%esp
    2483:	85 c0                	test   %eax,%eax
    2485:	74 14                	je     249b <main+0x1b6>
				updateWindow(winid, context.addr);
    2487:	a1 40 2e 01 00       	mov    0x12e40,%eax
    248c:	83 ec 08             	sub    $0x8,%esp
    248f:	50                   	push   %eax
    2490:	ff 75 e4             	pushl  -0x1c(%ebp)
    2493:	e8 13 1e 00 00       	call   42ab <updateWindow>
    2498:	83 c4 10             	add    $0x10,%esp
			}
			break;
    249b:	e9 22 02 00 00       	jmp    26c2 <main+0x3dd>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    24a0:	83 ec 04             	sub    $0x4,%esp
    24a3:	ff 35 48 2e 01 00    	pushl  0x12e48
    24a9:	ff 35 44 2e 01 00    	pushl  0x12e44
    24af:	ff 35 40 2e 01 00    	pushl  0x12e40
    24b5:	e8 c0 e4 ff ff       	call   97a <drawFinderContent>
    24ba:	83 c4 10             	add    $0x10,%esp
			drawFinderWnd(context);
    24bd:	83 ec 04             	sub    $0x4,%esp
    24c0:	ff 35 48 2e 01 00    	pushl  0x12e48
    24c6:	ff 35 44 2e 01 00    	pushl  0x12e44
    24cc:	ff 35 40 2e 01 00    	pushl  0x12e40
    24d2:	e8 85 e3 ff ff       	call   85c <drawFinderWnd>
    24d7:	83 c4 10             	add    $0x10,%esp
			updateWindow(winid, context.addr);
    24da:	a1 40 2e 01 00       	mov    0x12e40,%eax
    24df:	83 ec 08             	sub    $0x8,%esp
    24e2:	50                   	push   %eax
    24e3:	ff 75 e4             	pushl  -0x1c(%ebp)
    24e6:	e8 c0 1d 00 00       	call   42ab <updateWindow>
    24eb:	83 c4 10             	add    $0x10,%esp
			break;
    24ee:	e9 cf 01 00 00       	jmp    26c2 <main+0x3dd>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    24f3:	8b 75 c8             	mov    -0x38(%ebp),%esi
    24f6:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
    24f9:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    24fc:	8b 55 bc             	mov    -0x44(%ebp),%edx
    24ff:	a1 40 2e 01 00       	mov    0x12e40,%eax
    2504:	83 ec 08             	sub    $0x8,%esp
    2507:	56                   	push   %esi
    2508:	53                   	push   %ebx
    2509:	51                   	push   %ecx
    250a:	52                   	push   %edx
    250b:	50                   	push   %eax
    250c:	ff 75 e4             	pushl  -0x1c(%ebp)
    250f:	e8 9f 1d 00 00       	call   42b3 <updatePartialWindow>
    2514:	83 c4 20             	add    $0x20,%esp
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    2517:	e9 a6 01 00 00       	jmp    26c2 <main+0x3dd>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    251c:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    251f:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2522:	8d 45 80             	lea    -0x80(%ebp),%eax
    2525:	83 ec 04             	sub    $0x4,%esp
    2528:	51                   	push   %ecx
    2529:	52                   	push   %edx
    252a:	50                   	push   %eax
    252b:	e8 d8 14 00 00       	call   3a08 <initPoint>
    2530:	83 c4 0c             	add    $0xc,%esp
    2533:	8b 45 80             	mov    -0x80(%ebp),%eax
    2536:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2539:	89 45 b0             	mov    %eax,-0x50(%ebp)
    253c:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    253f:	a1 80 2f 01 00       	mov    0x12f80,%eax
    2544:	83 ec 04             	sub    $0x4,%esp
    2547:	ff 75 b4             	pushl  -0x4c(%ebp)
    254a:	ff 75 b0             	pushl  -0x50(%ebp)
    254d:	50                   	push   %eax
    254e:	e8 73 17 00 00       	call   3cc6 <executeHandler>
    2553:	83 c4 10             	add    $0x10,%esp
    2556:	85 c0                	test   %eax,%eax
    2558:	74 14                	je     256e <main+0x289>

				updateWindow(winid, context.addr);
    255a:	a1 40 2e 01 00       	mov    0x12e40,%eax
    255f:	83 ec 08             	sub    $0x8,%esp
    2562:	50                   	push   %eax
    2563:	ff 75 e4             	pushl  -0x1c(%ebp)
    2566:	e8 40 1d 00 00       	call   42ab <updateWindow>
    256b:	83 c4 10             	add    $0x10,%esp
			}
			break;
    256e:	e9 4f 01 00 00       	jmp    26c2 <main+0x3dd>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2573:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2576:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2579:	8d 45 80             	lea    -0x80(%ebp),%eax
    257c:	83 ec 04             	sub    $0x4,%esp
    257f:	51                   	push   %ecx
    2580:	52                   	push   %edx
    2581:	50                   	push   %eax
    2582:	e8 81 14 00 00       	call   3a08 <initPoint>
    2587:	83 c4 0c             	add    $0xc,%esp
    258a:	8b 45 80             	mov    -0x80(%ebp),%eax
    258d:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2590:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2593:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    2596:	a1 88 2f 01 00       	mov    0x12f88,%eax
    259b:	83 ec 04             	sub    $0x4,%esp
    259e:	ff 75 b4             	pushl  -0x4c(%ebp)
    25a1:	ff 75 b0             	pushl  -0x50(%ebp)
    25a4:	50                   	push   %eax
    25a5:	e8 1c 17 00 00       	call   3cc6 <executeHandler>
    25aa:	83 c4 10             	add    $0x10,%esp
    25ad:	85 c0                	test   %eax,%eax
    25af:	74 14                	je     25c5 <main+0x2e0>
				updateWindow(winid, context.addr);
    25b1:	a1 40 2e 01 00       	mov    0x12e40,%eax
    25b6:	83 ec 08             	sub    $0x8,%esp
    25b9:	50                   	push   %eax
    25ba:	ff 75 e4             	pushl  -0x1c(%ebp)
    25bd:	e8 e9 1c 00 00       	call   42ab <updateWindow>
    25c2:	83 c4 10             	add    $0x10,%esp
			}
			break;
    25c5:	e9 f8 00 00 00       	jmp    26c2 <main+0x3dd>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    25ca:	0f b6 45 bc          	movzbl -0x44(%ebp),%eax
    25ce:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    25d1:	a1 00 26 01 00       	mov    0x12600,%eax
    25d6:	85 c0                	test   %eax,%eax
    25d8:	0f 84 e1 00 00 00    	je     26bf <main+0x3da>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    25de:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    25e2:	74 2a                	je     260e <main+0x329>
    25e4:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    25e8:	74 24                	je     260e <main+0x329>
    25ea:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    25ee:	7e 06                	jle    25f6 <main+0x311>
    25f0:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    25f4:	7e 18                	jle    260e <main+0x329>
    25f6:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    25fa:	7e 06                	jle    2602 <main+0x31d>
    25fc:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    2600:	7e 0c                	jle    260e <main+0x329>
    2602:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    2606:	7e 41                	jle    2649 <main+0x364>
    2608:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    260c:	7f 3b                	jg     2649 <main+0x364>
    260e:	a1 60 2e 01 00       	mov    0x12e60,%eax
    2613:	83 f8 13             	cmp    $0x13,%eax
    2616:	7f 31                	jg     2649 <main+0x364>
					keyContent.content[keyContent.length++] = key;
    2618:	a1 60 2e 01 00       	mov    0x12e60,%eax
    261d:	8d 50 01             	lea    0x1(%eax),%edx
    2620:	89 15 60 2e 01 00    	mov    %edx,0x12e60
    2626:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    262a:	88 90 4c 2e 01 00    	mov    %dl,0x12e4c(%eax)
					printf(0, "%s\n", keyContent.content);
    2630:	83 ec 04             	sub    $0x4,%esp
    2633:	68 4c 2e 01 00       	push   $0x12e4c
    2638:	68 6f ab 00 00       	push   $0xab6f
    263d:	6a 00                	push   $0x0
    263f:	e8 8c 1d 00 00       	call   43d0 <printf>
    2644:	83 c4 10             	add    $0x10,%esp
    2647:	eb 28                	jmp    2671 <main+0x38c>
				}
				else if (key == 8 && keyContent.length > 0) {
    2649:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    264d:	75 22                	jne    2671 <main+0x38c>
    264f:	a1 60 2e 01 00       	mov    0x12e60,%eax
    2654:	85 c0                	test   %eax,%eax
    2656:	7e 19                	jle    2671 <main+0x38c>
					keyContent.content[--keyContent.length] = 0;
    2658:	a1 60 2e 01 00       	mov    0x12e60,%eax
    265d:	83 e8 01             	sub    $0x1,%eax
    2660:	a3 60 2e 01 00       	mov    %eax,0x12e60
    2665:	a1 60 2e 01 00       	mov    0x12e60,%eax
    266a:	c6 80 4c 2e 01 00 00 	movb   $0x0,0x12e4c(%eax)
				}
				drawFinderContent(context);
    2671:	83 ec 04             	sub    $0x4,%esp
    2674:	ff 35 48 2e 01 00    	pushl  0x12e48
    267a:	ff 35 44 2e 01 00    	pushl  0x12e44
    2680:	ff 35 40 2e 01 00    	pushl  0x12e40
    2686:	e8 ef e2 ff ff       	call   97a <drawFinderContent>
    268b:	83 c4 10             	add    $0x10,%esp
				drawFinderWnd(context);
    268e:	83 ec 04             	sub    $0x4,%esp
    2691:	ff 35 48 2e 01 00    	pushl  0x12e48
    2697:	ff 35 44 2e 01 00    	pushl  0x12e44
    269d:	ff 35 40 2e 01 00    	pushl  0x12e40
    26a3:	e8 b4 e1 ff ff       	call   85c <drawFinderWnd>
    26a8:	83 c4 10             	add    $0x10,%esp
				updateWindow(winid, context.addr);
    26ab:	a1 40 2e 01 00       	mov    0x12e40,%eax
    26b0:	83 ec 08             	sub    $0x8,%esp
    26b3:	50                   	push   %eax
    26b4:	ff 75 e4             	pushl  -0x1c(%ebp)
    26b7:	e8 ef 1b 00 00       	call   42ab <updateWindow>
    26bc:	83 c4 10             	add    $0x10,%esp
			}
			break;
    26bf:	eb 01                	jmp    26c2 <main+0x3dd>
		default:
			break;
    26c1:	90                   	nop
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    26c2:	a1 80 ed 00 00       	mov    0xed80,%eax
    26c7:	85 c0                	test   %eax,%eax
    26c9:	0f 85 62 fd ff ff    	jne    2431 <main+0x14c>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    26cf:	83 ec 08             	sub    $0x8,%esp
    26d2:	ff 75 e4             	pushl  -0x1c(%ebp)
    26d5:	68 40 2e 01 00       	push   $0x12e40
    26da:	e8 95 01 00 00       	call   2874 <free_context>
    26df:	83 c4 10             	add    $0x10,%esp
	exit();
    26e2:	e8 0c 1b 00 00       	call   41f3 <exit>

000026e7 <testHandlers>:
}

void testHandlers() {
    26e7:	55                   	push   %ebp
    26e8:	89 e5                	mov    %esp,%ebp
    26ea:	83 ec 08             	sub    $0x8,%esp

	list(".");
    26ed:	83 ec 0c             	sub    $0xc,%esp
    26f0:	68 a7 ab 00 00       	push   $0xaba7
    26f5:	e8 51 db ff ff       	call   24b <list>
    26fa:	83 c4 10             	add    $0x10,%esp
	printf(0, "original list:\n");
    26fd:	83 ec 08             	sub    $0x8,%esp
    2700:	68 f4 ad 00 00       	push   $0xadf4
    2705:	6a 00                	push   $0x0
    2707:	e8 c4 1c 00 00       	call   43d0 <printf>
    270c:	83 c4 10             	add    $0x10,%esp
	printItemList();
    270f:	e8 bf e5 ff ff       	call   cd3 <printItemList>
	printf(0, "\n");
    2714:	83 ec 08             	sub    $0x8,%esp
    2717:	68 04 ae 00 00       	push   $0xae04
    271c:	6a 00                	push   $0x0
    271e:	e8 ad 1c 00 00       	call   43d0 <printf>
    2723:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a folder:\n");
    2726:	83 ec 08             	sub    $0x8,%esp
    2729:	68 06 ae 00 00       	push   $0xae06
    272e:	6a 00                	push   $0x0
    2730:	e8 9b 1c 00 00       	call   43d0 <printf>
    2735:	83 c4 10             	add    $0x10,%esp
	newFolder("newfolder");
    2738:	83 ec 0c             	sub    $0xc,%esp
    273b:	68 15 ae 00 00       	push   $0xae15
    2740:	e8 bd ef ff ff       	call   1702 <newFolder>
    2745:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2748:	e8 14 da ff ff       	call   161 <freeFileItemList>
	list(".");
    274d:	83 ec 0c             	sub    $0xc,%esp
    2750:	68 a7 ab 00 00       	push   $0xaba7
    2755:	e8 f1 da ff ff       	call   24b <list>
    275a:	83 c4 10             	add    $0x10,%esp
	printItemList();
    275d:	e8 71 e5 ff ff       	call   cd3 <printItemList>
	printf(0, "\n");
    2762:	83 ec 08             	sub    $0x8,%esp
    2765:	68 04 ae 00 00       	push   $0xae04
    276a:	6a 00                	push   $0x0
    276c:	e8 5f 1c 00 00       	call   43d0 <printf>
    2771:	83 c4 10             	add    $0x10,%esp
	printf(0, "enter new folder:\n");
    2774:	83 ec 08             	sub    $0x8,%esp
    2777:	68 1f ae 00 00       	push   $0xae1f
    277c:	6a 00                	push   $0x0
    277e:	e8 4d 1c 00 00       	call   43d0 <printf>
    2783:	83 c4 10             	add    $0x10,%esp
	enterDir("newfolder");
    2786:	83 ec 0c             	sub    $0xc,%esp
    2789:	68 15 ae 00 00       	push   $0xae15
    278e:	e8 3a ec ff ff       	call   13cd <enterDir>
    2793:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2796:	e8 c6 d9 ff ff       	call   161 <freeFileItemList>
	list(".");
    279b:	83 ec 0c             	sub    $0xc,%esp
    279e:	68 a7 ab 00 00       	push   $0xaba7
    27a3:	e8 a3 da ff ff       	call   24b <list>
    27a8:	83 c4 10             	add    $0x10,%esp
	printItemList();
    27ab:	e8 23 e5 ff ff       	call   cd3 <printItemList>
	printf(0, "\n");
    27b0:	83 ec 08             	sub    $0x8,%esp
    27b3:	68 04 ae 00 00       	push   $0xae04
    27b8:	6a 00                	push   $0x0
    27ba:	e8 11 1c 00 00       	call   43d0 <printf>
    27bf:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a file:\n");
    27c2:	83 ec 08             	sub    $0x8,%esp
    27c5:	68 32 ae 00 00       	push   $0xae32
    27ca:	6a 00                	push   $0x0
    27cc:	e8 ff 1b 00 00       	call   43d0 <printf>
    27d1:	83 c4 10             	add    $0x10,%esp
	newFile("newfile.txt");
    27d4:	83 ec 0c             	sub    $0xc,%esp
    27d7:	68 3f ae 00 00       	push   $0xae3f
    27dc:	e8 37 ed ff ff       	call   1518 <newFile>
    27e1:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    27e4:	e8 78 d9 ff ff       	call   161 <freeFileItemList>
	list(".");
    27e9:	83 ec 0c             	sub    $0xc,%esp
    27ec:	68 a7 ab 00 00       	push   $0xaba7
    27f1:	e8 55 da ff ff       	call   24b <list>
    27f6:	83 c4 10             	add    $0x10,%esp
	printItemList();
    27f9:	e8 d5 e4 ff ff       	call   cd3 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    27fe:	c9                   	leave  
    27ff:	c3                   	ret    

00002800 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    2800:	55                   	push   %ebp
    2801:	89 e5                	mov    %esp,%ebp
    2803:	83 ec 08             	sub    $0x8,%esp
    context_ptr->width = width;
    2806:	8b 45 08             	mov    0x8(%ebp),%eax
    2809:	8b 55 0c             	mov    0xc(%ebp),%edx
    280c:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    280f:	8b 45 08             	mov    0x8(%ebp),%eax
    2812:	8b 55 10             	mov    0x10(%ebp),%edx
    2815:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    2818:	8b 55 0c             	mov    0xc(%ebp),%edx
    281b:	8b 45 10             	mov    0x10(%ebp),%eax
    281e:	0f af c2             	imul   %edx,%eax
    2821:	01 c0                	add    %eax,%eax
    2823:	83 ec 0c             	sub    $0xc,%esp
    2826:	50                   	push   %eax
    2827:	e8 75 1e 00 00       	call   46a1 <malloc>
    282c:	83 c4 10             	add    $0x10,%esp
    282f:	89 c2                	mov    %eax,%edx
    2831:	8b 45 08             	mov    0x8(%ebp),%eax
    2834:	89 10                	mov    %edx,(%eax)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    2836:	8b 55 0c             	mov    0xc(%ebp),%edx
    2839:	8b 45 10             	mov    0x10(%ebp),%eax
    283c:	0f af c2             	imul   %edx,%eax
    283f:	8d 14 00             	lea    (%eax,%eax,1),%edx
    2842:	8b 45 08             	mov    0x8(%ebp),%eax
    2845:	8b 00                	mov    (%eax),%eax
    2847:	83 ec 04             	sub    $0x4,%esp
    284a:	52                   	push   %edx
    284b:	6a 00                	push   $0x0
    284d:	50                   	push   %eax
    284e:	e8 06 18 00 00       	call   4059 <memset>
    2853:	83 c4 10             	add    $0x10,%esp
    initializeASCII();
    2856:	e8 73 01 00 00       	call   29ce <initializeASCII>
    initializeGBK();
    285b:	e8 f4 02 00 00       	call   2b54 <initializeGBK>
    return createWindow(0, 0, width, height);
    2860:	ff 75 10             	pushl  0x10(%ebp)
    2863:	ff 75 0c             	pushl  0xc(%ebp)
    2866:	6a 00                	push   $0x0
    2868:	6a 00                	push   $0x0
    286a:	e8 2c 1a 00 00       	call   429b <createWindow>
    286f:	83 c4 10             	add    $0x10,%esp
}
    2872:	c9                   	leave  
    2873:	c3                   	ret    

00002874 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    2874:	55                   	push   %ebp
    2875:	89 e5                	mov    %esp,%ebp
    2877:	83 ec 08             	sub    $0x8,%esp
    free(context_ptr->addr);
    287a:	8b 45 08             	mov    0x8(%ebp),%eax
    287d:	8b 00                	mov    (%eax),%eax
    287f:	83 ec 0c             	sub    $0xc,%esp
    2882:	50                   	push   %eax
    2883:	e8 d8 1c 00 00       	call   4560 <free>
    2888:	83 c4 10             	add    $0x10,%esp
    freeASCII();
    288b:	e8 ab 02 00 00       	call   2b3b <freeASCII>
    freeGBK();
    2890:	e8 60 03 00 00       	call   2bf5 <freeGBK>
    destroyWindow(winid);
    2895:	83 ec 0c             	sub    $0xc,%esp
    2898:	ff 75 0c             	pushl  0xc(%ebp)
    289b:	e8 03 1a 00 00       	call   42a3 <destroyWindow>
    28a0:	83 c4 10             	add    $0x10,%esp
}
    28a3:	c9                   	leave  
    28a4:	c3                   	ret    

000028a5 <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    28a5:	55                   	push   %ebp
    28a6:	89 e5                	mov    %esp,%ebp
    28a8:	83 ec 04             	sub    $0x4,%esp
    28ab:	8b 45 1c             	mov    0x1c(%ebp),%eax
    28ae:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    28b2:	8b 45 0c             	mov    0xc(%ebp),%eax
    28b5:	3b 45 14             	cmp    0x14(%ebp),%eax
    28b8:	77 02                	ja     28bc <draw_point+0x17>
    return;
    28ba:	eb 26                	jmp    28e2 <draw_point+0x3d>
  if(y >= c.height)
    28bc:	8b 45 10             	mov    0x10(%ebp),%eax
    28bf:	3b 45 18             	cmp    0x18(%ebp),%eax
    28c2:	77 02                	ja     28c6 <draw_point+0x21>
    return;
    28c4:	eb 1c                	jmp    28e2 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    28c6:	8b 45 08             	mov    0x8(%ebp),%eax
    28c9:	8b 55 0c             	mov    0xc(%ebp),%edx
    28cc:	89 d1                	mov    %edx,%ecx
    28ce:	0f af 4d 18          	imul   0x18(%ebp),%ecx
    28d2:	8b 55 14             	mov    0x14(%ebp),%edx
    28d5:	01 ca                	add    %ecx,%edx
    28d7:	01 d2                	add    %edx,%edx
    28d9:	01 c2                	add    %eax,%edx
    28db:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    28df:	66 89 02             	mov    %ax,(%edx)
}
    28e2:	c9                   	leave  
    28e3:	c3                   	ret    

000028e4 <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    28e4:	55                   	push   %ebp
    28e5:	89 e5                	mov    %esp,%ebp
    28e7:	83 ec 14             	sub    $0x14,%esp
    28ea:	8b 45 24             	mov    0x24(%ebp),%eax
    28ed:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    28f1:	8b 55 14             	mov    0x14(%ebp),%edx
    28f4:	8b 45 1c             	mov    0x1c(%ebp),%eax
    28f7:	01 d0                	add    %edx,%eax
    28f9:	8b 55 0c             	mov    0xc(%ebp),%edx
    28fc:	39 d0                	cmp    %edx,%eax
    28fe:	0f 47 c2             	cmova  %edx,%eax
    2901:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    2904:	8b 55 18             	mov    0x18(%ebp),%edx
    2907:	8b 45 20             	mov    0x20(%ebp),%eax
    290a:	01 d0                	add    %edx,%eax
    290c:	8b 55 10             	mov    0x10(%ebp),%edx
    290f:	39 d0                	cmp    %edx,%eax
    2911:	0f 47 c2             	cmova  %edx,%eax
    2914:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    2917:	8b 45 18             	mov    0x18(%ebp),%eax
    291a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    291d:	eb 36                	jmp    2955 <fill_rect+0x71>
	{
		for (x = bx; x < mx; x++)
    291f:	8b 45 14             	mov    0x14(%ebp),%eax
    2922:	89 45 fc             	mov    %eax,-0x4(%ebp)
    2925:	eb 22                	jmp    2949 <fill_rect+0x65>
		{
			draw_point(c, x, y, color);
    2927:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    292b:	8b 55 f8             	mov    -0x8(%ebp),%edx
    292e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2931:	51                   	push   %ecx
    2932:	52                   	push   %edx
    2933:	50                   	push   %eax
    2934:	ff 75 10             	pushl  0x10(%ebp)
    2937:	ff 75 0c             	pushl  0xc(%ebp)
    293a:	ff 75 08             	pushl  0x8(%ebp)
    293d:	e8 63 ff ff ff       	call   28a5 <draw_point>
    2942:	83 c4 18             	add    $0x18,%esp
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    2945:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2949:	8b 45 fc             	mov    -0x4(%ebp),%eax
    294c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    294f:	7c d6                	jl     2927 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    2951:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2955:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2958:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    295b:	7c c2                	jl     291f <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    295d:	c9                   	leave  
    295e:	c3                   	ret    

0000295f <printBinary>:

void printBinary(char c)
{
    295f:	55                   	push   %ebp
    2960:	89 e5                	mov    %esp,%ebp
    2962:	83 ec 28             	sub    $0x28,%esp
    2965:	8b 45 08             	mov    0x8(%ebp),%eax
    2968:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    296b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2972:	eb 40                	jmp    29b4 <printBinary+0x55>
	{
		if(((c << i) & 0x80) != 0)
    2974:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    2978:	8b 45 f4             	mov    -0xc(%ebp),%eax
    297b:	89 c1                	mov    %eax,%ecx
    297d:	d3 e2                	shl    %cl,%edx
    297f:	89 d0                	mov    %edx,%eax
    2981:	25 80 00 00 00       	and    $0x80,%eax
    2986:	85 c0                	test   %eax,%eax
    2988:	74 14                	je     299e <printBinary+0x3f>
		{
			printf(0, "1");
    298a:	83 ec 08             	sub    $0x8,%esp
    298d:	68 4b ae 00 00       	push   $0xae4b
    2992:	6a 00                	push   $0x0
    2994:	e8 37 1a 00 00       	call   43d0 <printf>
    2999:	83 c4 10             	add    $0x10,%esp
    299c:	eb 12                	jmp    29b0 <printBinary+0x51>
		}
		else
		{
			printf(0, "0");
    299e:	83 ec 08             	sub    $0x8,%esp
    29a1:	68 4d ae 00 00       	push   $0xae4d
    29a6:	6a 00                	push   $0x0
    29a8:	e8 23 1a 00 00       	call   43d0 <printf>
    29ad:	83 c4 10             	add    $0x10,%esp
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    29b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    29b4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    29b8:	7e ba                	jle    2974 <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    29ba:	83 ec 08             	sub    $0x8,%esp
    29bd:	68 4f ae 00 00       	push   $0xae4f
    29c2:	6a 00                	push   $0x0
    29c4:	e8 07 1a 00 00       	call   43d0 <printf>
    29c9:	83 c4 10             	add    $0x10,%esp
}
    29cc:	c9                   	leave  
    29cd:	c3                   	ret    

000029ce <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    29ce:	55                   	push   %ebp
    29cf:	89 e5                	mov    %esp,%ebp
    29d1:	56                   	push   %esi
    29d2:	53                   	push   %ebx
    29d3:	83 ec 20             	sub    $0x20,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    29d6:	83 ec 08             	sub    $0x8,%esp
    29d9:	68 51 ae 00 00       	push   $0xae51
    29de:	6a 00                	push   $0x0
    29e0:	e8 eb 19 00 00       	call   43d0 <printf>
    29e5:	83 c4 10             	add    $0x10,%esp
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    29e8:	83 ec 08             	sub    $0x8,%esp
    29eb:	6a 00                	push   $0x0
    29ed:	68 64 ae 00 00       	push   $0xae64
    29f2:	e8 3c 18 00 00       	call   4233 <open>
    29f7:	83 c4 10             	add    $0x10,%esp
    29fa:	89 45 e8             	mov    %eax,-0x18(%ebp)
    29fd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2a01:	79 1c                	jns    2a1f <initializeASCII+0x51>
	  printf(0,"cannot open %s\n", HANKAKU);
    2a03:	83 ec 04             	sub    $0x4,%esp
    2a06:	68 64 ae 00 00       	push   $0xae64
    2a0b:	68 70 ae 00 00       	push   $0xae70
    2a10:	6a 00                	push   $0x0
    2a12:	e8 b9 19 00 00       	call   43d0 <printf>
    2a17:	83 c4 10             	add    $0x10,%esp
	  return;
    2a1a:	e9 15 01 00 00       	jmp    2b34 <initializeASCII+0x166>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    2a1f:	83 ec 0c             	sub    $0xc,%esp
    2a22:	68 00 10 00 00       	push   $0x1000
    2a27:	e8 75 1c 00 00       	call   46a1 <malloc>
    2a2c:	83 c4 10             	add    $0x10,%esp
    2a2f:	a3 c0 2f 01 00       	mov    %eax,0x12fc0
	for (i = 0; i < ASCII_NUM; i++)
    2a34:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a3b:	eb 12                	jmp    2a4f <initializeASCII+0x81>
	{
		hankaku[i] = 0;
    2a3d:	8b 15 c0 2f 01 00    	mov    0x12fc0,%edx
    2a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a46:	01 d0                	add    %edx,%eax
    2a48:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    2a4b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a4f:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    2a56:	7e e5                	jle    2a3d <initializeASCII+0x6f>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    2a58:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    2a5f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2a66:	e9 84 00 00 00       	jmp    2aef <initializeASCII+0x121>
	{
		for (i = 0; i < n; i++){
    2a6b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a72:	eb 73                	jmp    2ae7 <initializeASCII+0x119>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    2a74:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a77:	05 00 30 01 00       	add    $0x13000,%eax
    2a7c:	0f b6 00             	movzbl (%eax),%eax
    2a7f:	3c 2a                	cmp    $0x2a,%al
    2a81:	74 0f                	je     2a92 <initializeASCII+0xc4>
    2a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a86:	05 00 30 01 00       	add    $0x13000,%eax
    2a8b:	0f b6 00             	movzbl (%eax),%eax
    2a8e:	3c 2e                	cmp    $0x2e,%al
    2a90:	75 51                	jne    2ae3 <initializeASCII+0x115>
			{
				if (buf[i] == '*')
    2a92:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a95:	05 00 30 01 00       	add    $0x13000,%eax
    2a9a:	0f b6 00             	movzbl (%eax),%eax
    2a9d:	3c 2a                	cmp    $0x2a,%al
    2a9f:	75 2d                	jne    2ace <initializeASCII+0x100>
				{
					hankaku[y] |= (0x80 >> x);
    2aa1:	8b 15 c0 2f 01 00    	mov    0x12fc0,%edx
    2aa7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2aaa:	01 c2                	add    %eax,%edx
    2aac:	8b 0d c0 2f 01 00    	mov    0x12fc0,%ecx
    2ab2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ab5:	01 c8                	add    %ecx,%eax
    2ab7:	0f b6 00             	movzbl (%eax),%eax
    2aba:	89 c3                	mov    %eax,%ebx
    2abc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2abf:	be 80 00 00 00       	mov    $0x80,%esi
    2ac4:	89 c1                	mov    %eax,%ecx
    2ac6:	d3 fe                	sar    %cl,%esi
    2ac8:	89 f0                	mov    %esi,%eax
    2aca:	09 d8                	or     %ebx,%eax
    2acc:	88 02                	mov    %al,(%edx)
				}
				x ++;
    2ace:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    2ad2:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    2ad6:	7e 0b                	jle    2ae3 <initializeASCII+0x115>
				{
					x = 0;
    2ad8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    2adf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    2ae3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2ae7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2aea:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    2aed:	7c 85                	jl     2a74 <initializeASCII+0xa6>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2aef:	83 ec 04             	sub    $0x4,%esp
    2af2:	68 00 02 00 00       	push   $0x200
    2af7:	68 00 30 01 00       	push   $0x13000
    2afc:	ff 75 e8             	pushl  -0x18(%ebp)
    2aff:	e8 07 17 00 00       	call   420b <read>
    2b04:	83 c4 10             	add    $0x10,%esp
    2b07:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2b0a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2b0e:	0f 8f 57 ff ff ff    	jg     2a6b <initializeASCII+0x9d>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    2b14:	83 ec 08             	sub    $0x8,%esp
    2b17:	68 80 ae 00 00       	push   $0xae80
    2b1c:	6a 00                	push   $0x0
    2b1e:	e8 ad 18 00 00       	call   43d0 <printf>
    2b23:	83 c4 10             	add    $0x10,%esp
	close(fd);
    2b26:	83 ec 0c             	sub    $0xc,%esp
    2b29:	ff 75 e8             	pushl  -0x18(%ebp)
    2b2c:	e8 ea 16 00 00       	call   421b <close>
    2b31:	83 c4 10             	add    $0x10,%esp
}
    2b34:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2b37:	5b                   	pop    %ebx
    2b38:	5e                   	pop    %esi
    2b39:	5d                   	pop    %ebp
    2b3a:	c3                   	ret    

00002b3b <freeASCII>:

void freeASCII(){
    2b3b:	55                   	push   %ebp
    2b3c:	89 e5                	mov    %esp,%ebp
    2b3e:	83 ec 08             	sub    $0x8,%esp
	free(hankaku);
    2b41:	a1 c0 2f 01 00       	mov    0x12fc0,%eax
    2b46:	83 ec 0c             	sub    $0xc,%esp
    2b49:	50                   	push   %eax
    2b4a:	e8 11 1a 00 00       	call   4560 <free>
    2b4f:	83 c4 10             	add    $0x10,%esp
}
    2b52:	c9                   	leave  
    2b53:	c3                   	ret    

00002b54 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    2b54:	55                   	push   %ebp
    2b55:	89 e5                	mov    %esp,%ebp
    2b57:	83 ec 18             	sub    $0x18,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    2b5a:	83 ec 08             	sub    $0x8,%esp
    2b5d:	68 9d ae 00 00       	push   $0xae9d
    2b62:	6a 00                	push   $0x0
    2b64:	e8 67 18 00 00       	call   43d0 <printf>
    2b69:	83 c4 10             	add    $0x10,%esp
	if((fd = open(HZK16, 0)) < 0){
    2b6c:	83 ec 08             	sub    $0x8,%esp
    2b6f:	6a 00                	push   $0x0
    2b71:	68 ae ae 00 00       	push   $0xaeae
    2b76:	e8 b8 16 00 00       	call   4233 <open>
    2b7b:	83 c4 10             	add    $0x10,%esp
    2b7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b81:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b85:	79 19                	jns    2ba0 <initializeGBK+0x4c>
		printf(0,"cannot open %s\n", HZK16);
    2b87:	83 ec 04             	sub    $0x4,%esp
    2b8a:	68 ae ae 00 00       	push   $0xaeae
    2b8f:	68 70 ae 00 00       	push   $0xae70
    2b94:	6a 00                	push   $0x0
    2b96:	e8 35 18 00 00       	call   43d0 <printf>
    2b9b:	83 c4 10             	add    $0x10,%esp
		return;
    2b9e:	eb 53                	jmp    2bf3 <initializeGBK+0x9f>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    2ba0:	83 ec 0c             	sub    $0xc,%esp
    2ba3:	68 78 69 00 00       	push   $0x6978
    2ba8:	e8 f4 1a 00 00       	call   46a1 <malloc>
    2bad:	83 c4 10             	add    $0x10,%esp
    2bb0:	a3 c4 2f 01 00       	mov    %eax,0x12fc4
	fontFile.size = read(fd, fontFile.buf, 27000);
    2bb5:	a1 c4 2f 01 00       	mov    0x12fc4,%eax
    2bba:	83 ec 04             	sub    $0x4,%esp
    2bbd:	68 78 69 00 00       	push   $0x6978
    2bc2:	50                   	push   %eax
    2bc3:	ff 75 f4             	pushl  -0xc(%ebp)
    2bc6:	e8 40 16 00 00       	call   420b <read>
    2bcb:	83 c4 10             	add    $0x10,%esp
    2bce:	a3 c8 2f 01 00       	mov    %eax,0x12fc8
	printf(0,"initialzing gbk complete!\n");
    2bd3:	83 ec 08             	sub    $0x8,%esp
    2bd6:	68 b8 ae 00 00       	push   $0xaeb8
    2bdb:	6a 00                	push   $0x0
    2bdd:	e8 ee 17 00 00       	call   43d0 <printf>
    2be2:	83 c4 10             	add    $0x10,%esp
	close(fd);
    2be5:	83 ec 0c             	sub    $0xc,%esp
    2be8:	ff 75 f4             	pushl  -0xc(%ebp)
    2beb:	e8 2b 16 00 00       	call   421b <close>
    2bf0:	83 c4 10             	add    $0x10,%esp
}
    2bf3:	c9                   	leave  
    2bf4:	c3                   	ret    

00002bf5 <freeGBK>:

void freeGBK(){
    2bf5:	55                   	push   %ebp
    2bf6:	89 e5                	mov    %esp,%ebp
    2bf8:	83 ec 08             	sub    $0x8,%esp
	free(fontFile.buf);
    2bfb:	a1 c4 2f 01 00       	mov    0x12fc4,%eax
    2c00:	83 ec 0c             	sub    $0xc,%esp
    2c03:	50                   	push   %eax
    2c04:	e8 57 19 00 00       	call   4560 <free>
    2c09:	83 c4 10             	add    $0x10,%esp
}
    2c0c:	c9                   	leave  
    2c0d:	c3                   	ret    

00002c0e <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    2c0e:	55                   	push   %ebp
    2c0f:	89 e5                	mov    %esp,%ebp
    2c11:	53                   	push   %ebx
    2c12:	83 ec 18             	sub    $0x18,%esp
    2c15:	8b 55 14             	mov    0x14(%ebp),%edx
    2c18:	8b 45 18             	mov    0x18(%ebp),%eax
    2c1b:	88 55 e8             	mov    %dl,-0x18(%ebp)
    2c1e:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2c22:	8b 45 20             	mov    0x20(%ebp),%eax
    2c25:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c28:	eb 6b                	jmp    2c95 <put_ascii+0x87>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2c2a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2c31:	eb 58                	jmp    2c8b <put_ascii+0x7d>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    2c33:	8b 15 c0 2f 01 00    	mov    0x12fc0,%edx
    2c39:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
    2c3d:	c1 e0 04             	shl    $0x4,%eax
    2c40:	89 c1                	mov    %eax,%ecx
    2c42:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c45:	2b 45 20             	sub    0x20(%ebp),%eax
    2c48:	01 c8                	add    %ecx,%eax
    2c4a:	01 d0                	add    %edx,%eax
    2c4c:	0f b6 00             	movzbl (%eax),%eax
    2c4f:	0f b6 d0             	movzbl %al,%edx
    2c52:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2c55:	89 c1                	mov    %eax,%ecx
    2c57:	d3 e2                	shl    %cl,%edx
    2c59:	89 d0                	mov    %edx,%eax
    2c5b:	25 80 00 00 00       	and    $0x80,%eax
    2c60:	85 c0                	test   %eax,%eax
    2c62:	74 23                	je     2c87 <put_ascii+0x79>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    2c64:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c6b:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2c6e:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2c71:	01 d9                	add    %ebx,%ecx
    2c73:	52                   	push   %edx
    2c74:	50                   	push   %eax
    2c75:	51                   	push   %ecx
    2c76:	ff 75 10             	pushl  0x10(%ebp)
    2c79:	ff 75 0c             	pushl  0xc(%ebp)
    2c7c:	ff 75 08             	pushl  0x8(%ebp)
    2c7f:	e8 21 fc ff ff       	call   28a5 <draw_point>
    2c84:	83 c4 18             	add    $0x18,%esp
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2c87:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2c8b:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2c8f:	7e a2                	jle    2c33 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2c91:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2c95:	8b 45 20             	mov    0x20(%ebp),%eax
    2c98:	83 c0 10             	add    $0x10,%eax
    2c9b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2c9e:	7f 8a                	jg     2c2a <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    2ca0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ca3:	c9                   	leave  
    2ca4:	c3                   	ret    

00002ca5 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    2ca5:	55                   	push   %ebp
    2ca6:	89 e5                	mov    %esp,%ebp
    2ca8:	53                   	push   %ebx
    2ca9:	83 ec 18             	sub    $0x18,%esp
    2cac:	8b 55 14             	mov    0x14(%ebp),%edx
    2caf:	8b 45 18             	mov    0x18(%ebp),%eax
    2cb2:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    2cb6:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2cba:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2cbe:	0f b6 c0             	movzbl %al,%eax
    2cc1:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2cc6:	0f 8e 1e 01 00 00    	jle    2dea <put_gbk+0x145>
    2ccc:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2cd0:	66 c1 f8 08          	sar    $0x8,%ax
    2cd4:	98                   	cwtl   
    2cd5:	0f b6 c0             	movzbl %al,%eax
    2cd8:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2cdd:	0f 8e 07 01 00 00    	jle    2dea <put_gbk+0x145>
		hzk16Base = fontFile.buf;
    2ce3:	a1 c4 2f 01 00       	mov    0x12fc4,%eax
    2ce8:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    2ceb:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2cef:	0f b6 c0             	movzbl %al,%eax
    2cf2:	2d a1 00 00 00       	sub    $0xa1,%eax
    2cf7:	6b c0 5e             	imul   $0x5e,%eax,%eax
    2cfa:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    2cfe:	66 c1 fa 08          	sar    $0x8,%dx
    2d02:	0f bf d2             	movswl %dx,%edx
    2d05:	0f b6 d2             	movzbl %dl,%edx
    2d08:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    2d0e:	01 d0                	add    %edx,%eax
    2d10:	c1 e0 05             	shl    $0x5,%eax
    2d13:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2d16:	8b 45 20             	mov    0x20(%ebp),%eax
    2d19:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2d1c:	e9 b8 00 00 00       	jmp    2dd9 <put_gbk+0x134>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2d21:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2d28:	eb 47                	jmp    2d71 <put_gbk+0xcc>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2d2a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2d2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d30:	01 d0                	add    %edx,%eax
    2d32:	0f b6 00             	movzbl (%eax),%eax
    2d35:	0f b6 d0             	movzbl %al,%edx
    2d38:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2d3b:	89 c1                	mov    %eax,%ecx
    2d3d:	d3 e2                	shl    %cl,%edx
    2d3f:	89 d0                	mov    %edx,%eax
    2d41:	25 80 00 00 00       	and    $0x80,%eax
    2d46:	85 c0                	test   %eax,%eax
    2d48:	74 23                	je     2d6d <put_gbk+0xc8>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2d4a:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2d4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d51:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2d54:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2d57:	01 d9                	add    %ebx,%ecx
    2d59:	52                   	push   %edx
    2d5a:	50                   	push   %eax
    2d5b:	51                   	push   %ecx
    2d5c:	ff 75 10             	pushl  0x10(%ebp)
    2d5f:	ff 75 0c             	pushl  0xc(%ebp)
    2d62:	ff 75 08             	pushl  0x8(%ebp)
    2d65:	e8 3b fb ff ff       	call   28a5 <draw_point>
    2d6a:	83 c4 18             	add    $0x18,%esp
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2d6d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2d71:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2d75:	7e b3                	jle    2d2a <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    2d77:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2d7b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2d82:	eb 47                	jmp    2dcb <put_gbk+0x126>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2d84:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2d87:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d8a:	01 d0                	add    %edx,%eax
    2d8c:	0f b6 00             	movzbl (%eax),%eax
    2d8f:	0f b6 d0             	movzbl %al,%edx
    2d92:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2d95:	89 c1                	mov    %eax,%ecx
    2d97:	d3 e2                	shl    %cl,%edx
    2d99:	89 d0                	mov    %edx,%eax
    2d9b:	25 80 00 00 00       	and    $0x80,%eax
    2da0:	85 c0                	test   %eax,%eax
    2da2:	74 23                	je     2dc7 <put_gbk+0x122>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2da4:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2da8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dab:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2dae:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2db1:	01 d9                	add    %ebx,%ecx
    2db3:	52                   	push   %edx
    2db4:	50                   	push   %eax
    2db5:	51                   	push   %ecx
    2db6:	ff 75 10             	pushl  0x10(%ebp)
    2db9:	ff 75 0c             	pushl  0xc(%ebp)
    2dbc:	ff 75 08             	pushl  0x8(%ebp)
    2dbf:	e8 e1 fa ff ff       	call   28a5 <draw_point>
    2dc4:	83 c4 18             	add    $0x18,%esp
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2dc7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2dcb:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2dcf:	7e b3                	jle    2d84 <put_gbk+0xdf>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    2dd1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2dd5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2dd9:	8b 45 20             	mov    0x20(%ebp),%eax
    2ddc:	83 c0 10             	add    $0x10,%eax
    2ddf:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2de2:	0f 8f 39 ff ff ff    	jg     2d21 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2de8:	eb 50                	jmp    2e3a <put_gbk+0x195>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    2dea:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2dee:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2df2:	0f b6 c0             	movzbl %al,%eax
    2df5:	ff 75 20             	pushl  0x20(%ebp)
    2df8:	ff 75 1c             	pushl  0x1c(%ebp)
    2dfb:	52                   	push   %edx
    2dfc:	50                   	push   %eax
    2dfd:	ff 75 10             	pushl  0x10(%ebp)
    2e00:	ff 75 0c             	pushl  0xc(%ebp)
    2e03:	ff 75 08             	pushl  0x8(%ebp)
    2e06:	e8 03 fe ff ff       	call   2c0e <put_ascii>
    2e0b:	83 c4 1c             	add    $0x1c,%esp
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    2e0e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2e11:	8d 48 08             	lea    0x8(%eax),%ecx
    2e14:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2e18:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2e1c:	66 c1 f8 08          	sar    $0x8,%ax
    2e20:	0f b6 c0             	movzbl %al,%eax
    2e23:	ff 75 20             	pushl  0x20(%ebp)
    2e26:	51                   	push   %ecx
    2e27:	52                   	push   %edx
    2e28:	50                   	push   %eax
    2e29:	ff 75 10             	pushl  0x10(%ebp)
    2e2c:	ff 75 0c             	pushl  0xc(%ebp)
    2e2f:	ff 75 08             	pushl  0x8(%ebp)
    2e32:	e8 d7 fd ff ff       	call   2c0e <put_ascii>
    2e37:	83 c4 1c             	add    $0x1c,%esp
	}
}
    2e3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2e3d:	c9                   	leave  
    2e3e:	c3                   	ret    

00002e3f <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    2e3f:	55                   	push   %ebp
    2e40:	89 e5                	mov    %esp,%ebp
    2e42:	83 ec 28             	sub    $0x28,%esp
    2e45:	8b 45 18             	mov    0x18(%ebp),%eax
    2e48:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    2e4c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    2e53:	83 ec 0c             	sub    $0xc,%esp
    2e56:	ff 75 14             	pushl  0x14(%ebp)
    2e59:	e8 d4 11 00 00       	call   4032 <strlen>
    2e5e:	83 c4 10             	add    $0x10,%esp
    2e61:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2e64:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2e6b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2e6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2e71:	eb 36                	jmp    2ea9 <puts_str+0x6a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    2e73:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2e77:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2e7a:	8b 45 14             	mov    0x14(%ebp),%eax
    2e7d:	01 c8                	add    %ecx,%eax
    2e7f:	0f b6 00             	movzbl (%eax),%eax
    2e82:	0f b6 c0             	movzbl %al,%eax
    2e85:	83 ec 04             	sub    $0x4,%esp
    2e88:	ff 75 20             	pushl  0x20(%ebp)
    2e8b:	ff 75 f0             	pushl  -0x10(%ebp)
    2e8e:	52                   	push   %edx
    2e8f:	50                   	push   %eax
    2e90:	ff 75 10             	pushl  0x10(%ebp)
    2e93:	ff 75 0c             	pushl  0xc(%ebp)
    2e96:	ff 75 08             	pushl  0x8(%ebp)
    2e99:	e8 70 fd ff ff       	call   2c0e <put_ascii>
    2e9e:	83 c4 20             	add    $0x20,%esp
			xTmp += 8;
    2ea1:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    2ea5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2ea9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2eac:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2eaf:	72 c2                	jb     2e73 <puts_str+0x34>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    2eb1:	c9                   	leave  
    2eb2:	c3                   	ret    

00002eb3 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    2eb3:	55                   	push   %ebp
    2eb4:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    2eb6:	8b 45 10             	mov    0x10(%ebp),%eax
    2eb9:	8d 50 07             	lea    0x7(%eax),%edx
    2ebc:	85 c0                	test   %eax,%eax
    2ebe:	0f 48 c2             	cmovs  %edx,%eax
    2ec1:	c1 f8 03             	sar    $0x3,%eax
    2ec4:	89 c1                	mov    %eax,%ecx
    2ec6:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ec9:	8d 50 03             	lea    0x3(%eax),%edx
    2ecc:	85 c0                	test   %eax,%eax
    2ece:	0f 48 c2             	cmovs  %edx,%eax
    2ed1:	c1 f8 02             	sar    $0x2,%eax
    2ed4:	c1 e0 05             	shl    $0x5,%eax
    2ed7:	01 c1                	add    %eax,%ecx
    2ed9:	8b 45 08             	mov    0x8(%ebp),%eax
    2edc:	8d 50 07             	lea    0x7(%eax),%edx
    2edf:	85 c0                	test   %eax,%eax
    2ee1:	0f 48 c2             	cmovs  %edx,%eax
    2ee4:	c1 f8 03             	sar    $0x3,%eax
    2ee7:	c1 e0 0b             	shl    $0xb,%eax
    2eea:	01 c8                	add    %ecx,%eax
}
    2eec:	5d                   	pop    %ebp
    2eed:	c3                   	ret    

00002eee <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    2eee:	55                   	push   %ebp
    2eef:	89 e5                	mov    %esp,%ebp
    2ef1:	53                   	push   %ebx
    2ef2:	83 ec 10             	sub    $0x10,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2ef5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2efc:	e9 98 00 00 00       	jmp    2f99 <draw_picture+0xab>
	{
		for (j = 0; j < pic.width; j++)
    2f01:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f08:	eb 7f                	jmp    2f89 <draw_picture+0x9b>
		{
			rgb = pic.data[i*pic.width+j];
    2f0a:	8b 55 14             	mov    0x14(%ebp),%edx
    2f0d:	8b 45 18             	mov    0x18(%ebp),%eax
    2f10:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    2f14:	89 c1                	mov    %eax,%ecx
    2f16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f19:	01 c8                	add    %ecx,%eax
    2f1b:	c1 e0 02             	shl    $0x2,%eax
    2f1e:	01 d0                	add    %edx,%eax
    2f20:	8b 00                	mov    (%eax),%eax
    2f22:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    2f25:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    2f29:	3c 01                	cmp    $0x1,%al
    2f2b:	75 02                	jne    2f2f <draw_picture+0x41>
    2f2d:	eb 56                	jmp    2f85 <draw_picture+0x97>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    2f2f:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    2f33:	0f b6 c8             	movzbl %al,%ecx
    2f36:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    2f3a:	0f b6 d0             	movzbl %al,%edx
    2f3d:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    2f41:	0f b6 c0             	movzbl %al,%eax
    2f44:	51                   	push   %ecx
    2f45:	52                   	push   %edx
    2f46:	50                   	push   %eax
    2f47:	e8 67 ff ff ff       	call   2eb3 <_RGB16BIT565>
    2f4c:	83 c4 0c             	add    $0xc,%esp
    2f4f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    2f53:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
    2f57:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2f5a:	83 ea 01             	sub    $0x1,%edx
    2f5d:	89 d1                	mov    %edx,%ecx
    2f5f:	2b 4d f8             	sub    -0x8(%ebp),%ecx
    2f62:	8b 55 24             	mov    0x24(%ebp),%edx
    2f65:	01 ca                	add    %ecx,%edx
    2f67:	89 d3                	mov    %edx,%ebx
    2f69:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2f6c:	8b 55 20             	mov    0x20(%ebp),%edx
    2f6f:	01 ca                	add    %ecx,%edx
    2f71:	50                   	push   %eax
    2f72:	53                   	push   %ebx
    2f73:	52                   	push   %edx
    2f74:	ff 75 10             	pushl  0x10(%ebp)
    2f77:	ff 75 0c             	pushl  0xc(%ebp)
    2f7a:	ff 75 08             	pushl  0x8(%ebp)
    2f7d:	e8 23 f9 ff ff       	call   28a5 <draw_point>
    2f82:	83 c4 18             	add    $0x18,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    2f85:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2f89:	8b 45 18             	mov    0x18(%ebp),%eax
    2f8c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2f8f:	0f 8f 75 ff ff ff    	jg     2f0a <draw_picture+0x1c>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2f95:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2f99:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2f9c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2f9f:	0f 8f 5c ff ff ff    	jg     2f01 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    2fa5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2fa8:	c9                   	leave  
    2fa9:	c3                   	ret    

00002faa <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    2faa:	55                   	push   %ebp
    2fab:	89 e5                	mov    %esp,%ebp
    2fad:	83 ec 24             	sub    $0x24,%esp
    2fb0:	8b 45 24             	mov    0x24(%ebp),%eax
    2fb3:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    2fb7:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2fba:	2b 45 14             	sub    0x14(%ebp),%eax
    2fbd:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    2fc0:	8b 45 20             	mov    0x20(%ebp),%eax
    2fc3:	2b 45 18             	sub    0x18(%ebp),%eax
    2fc6:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    2fc9:	8b 45 14             	mov    0x14(%ebp),%eax
    2fcc:	c1 e0 0a             	shl    $0xa,%eax
    2fcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    2fd2:	8b 45 18             	mov    0x18(%ebp),%eax
    2fd5:	c1 e0 0a             	shl    $0xa,%eax
    2fd8:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    2fdb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2fde:	c1 f8 1f             	sar    $0x1f,%eax
    2fe1:	31 45 fc             	xor    %eax,-0x4(%ebp)
    2fe4:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    2fe7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2fea:	c1 f8 1f             	sar    $0x1f,%eax
    2fed:	31 45 f8             	xor    %eax,-0x8(%ebp)
    2ff0:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    2ff3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2ff6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2ff9:	7c 4f                	jl     304a <draw_line+0xa0>
		len = dx + 1;
    2ffb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2ffe:	83 c0 01             	add    $0x1,%eax
    3001:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    3004:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3007:	3b 45 14             	cmp    0x14(%ebp),%eax
    300a:	7e 07                	jle    3013 <draw_line+0x69>
    300c:	b8 00 04 00 00       	mov    $0x400,%eax
    3011:	eb 05                	jmp    3018 <draw_line+0x6e>
    3013:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3018:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    301b:	8b 45 20             	mov    0x20(%ebp),%eax
    301e:	3b 45 18             	cmp    0x18(%ebp),%eax
    3021:	7c 12                	jl     3035 <draw_line+0x8b>
    3023:	8b 45 20             	mov    0x20(%ebp),%eax
    3026:	2b 45 18             	sub    0x18(%ebp),%eax
    3029:	83 c0 01             	add    $0x1,%eax
    302c:	c1 e0 0a             	shl    $0xa,%eax
    302f:	99                   	cltd   
    3030:	f7 7d ec             	idivl  -0x14(%ebp)
    3033:	eb 10                	jmp    3045 <draw_line+0x9b>
    3035:	8b 45 20             	mov    0x20(%ebp),%eax
    3038:	2b 45 18             	sub    0x18(%ebp),%eax
    303b:	83 e8 01             	sub    $0x1,%eax
    303e:	c1 e0 0a             	shl    $0xa,%eax
    3041:	99                   	cltd   
    3042:	f7 7d ec             	idivl  -0x14(%ebp)
    3045:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3048:	eb 4d                	jmp    3097 <draw_line+0xed>
	}
	else {
		len = dy + 1;
    304a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    304d:	83 c0 01             	add    $0x1,%eax
    3050:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    3053:	8b 45 20             	mov    0x20(%ebp),%eax
    3056:	3b 45 18             	cmp    0x18(%ebp),%eax
    3059:	7e 07                	jle    3062 <draw_line+0xb8>
    305b:	b8 00 04 00 00       	mov    $0x400,%eax
    3060:	eb 05                	jmp    3067 <draw_line+0xbd>
    3062:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3067:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    306a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    306d:	3b 45 14             	cmp    0x14(%ebp),%eax
    3070:	7c 12                	jl     3084 <draw_line+0xda>
    3072:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3075:	2b 45 14             	sub    0x14(%ebp),%eax
    3078:	83 c0 01             	add    $0x1,%eax
    307b:	c1 e0 0a             	shl    $0xa,%eax
    307e:	99                   	cltd   
    307f:	f7 7d ec             	idivl  -0x14(%ebp)
    3082:	eb 10                	jmp    3094 <draw_line+0xea>
    3084:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3087:	2b 45 14             	sub    0x14(%ebp),%eax
    308a:	83 e8 01             	sub    $0x1,%eax
    308d:	c1 e0 0a             	shl    $0xa,%eax
    3090:	99                   	cltd   
    3091:	f7 7d ec             	idivl  -0x14(%ebp)
    3094:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    3097:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    309e:	eb 36                	jmp    30d6 <draw_line+0x12c>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    30a0:	0f b7 45 dc          	movzwl -0x24(%ebp),%eax
    30a4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    30a7:	c1 fa 0a             	sar    $0xa,%edx
    30aa:	89 d1                	mov    %edx,%ecx
    30ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
    30af:	c1 fa 0a             	sar    $0xa,%edx
    30b2:	50                   	push   %eax
    30b3:	51                   	push   %ecx
    30b4:	52                   	push   %edx
    30b5:	ff 75 10             	pushl  0x10(%ebp)
    30b8:	ff 75 0c             	pushl  0xc(%ebp)
    30bb:	ff 75 08             	pushl  0x8(%ebp)
    30be:	e8 e2 f7 ff ff       	call   28a5 <draw_point>
    30c3:	83 c4 18             	add    $0x18,%esp
		y += dy;
    30c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    30c9:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    30cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    30cf:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    30d2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    30d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    30d9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    30dc:	7c c2                	jl     30a0 <draw_line+0xf6>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    30de:	c9                   	leave  
    30df:	c3                   	ret    

000030e0 <draw_window>:

void
draw_window(Context c, char *title)
{
    30e0:	55                   	push   %ebp
    30e1:	89 e5                	mov    %esp,%ebp
    30e3:	83 ec 18             	sub    $0x18,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    30e6:	8b 45 0c             	mov    0xc(%ebp),%eax
    30e9:	83 e8 01             	sub    $0x1,%eax
    30ec:	6a 00                	push   $0x0
    30ee:	6a 00                	push   $0x0
    30f0:	50                   	push   %eax
    30f1:	6a 00                	push   $0x0
    30f3:	6a 00                	push   $0x0
    30f5:	ff 75 10             	pushl  0x10(%ebp)
    30f8:	ff 75 0c             	pushl  0xc(%ebp)
    30fb:	ff 75 08             	pushl  0x8(%ebp)
    30fe:	e8 a7 fe ff ff       	call   2faa <draw_line>
    3103:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    3106:	8b 45 10             	mov    0x10(%ebp),%eax
    3109:	8d 48 ff             	lea    -0x1(%eax),%ecx
    310c:	8b 45 0c             	mov    0xc(%ebp),%eax
    310f:	8d 50 ff             	lea    -0x1(%eax),%edx
    3112:	8b 45 0c             	mov    0xc(%ebp),%eax
    3115:	83 e8 01             	sub    $0x1,%eax
    3118:	6a 00                	push   $0x0
    311a:	51                   	push   %ecx
    311b:	52                   	push   %edx
    311c:	6a 00                	push   $0x0
    311e:	50                   	push   %eax
    311f:	ff 75 10             	pushl  0x10(%ebp)
    3122:	ff 75 0c             	pushl  0xc(%ebp)
    3125:	ff 75 08             	pushl  0x8(%ebp)
    3128:	e8 7d fe ff ff       	call   2faa <draw_line>
    312d:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    3130:	8b 45 10             	mov    0x10(%ebp),%eax
    3133:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3136:	8b 45 10             	mov    0x10(%ebp),%eax
    3139:	8d 50 ff             	lea    -0x1(%eax),%edx
    313c:	8b 45 0c             	mov    0xc(%ebp),%eax
    313f:	83 e8 01             	sub    $0x1,%eax
    3142:	6a 00                	push   $0x0
    3144:	51                   	push   %ecx
    3145:	6a 00                	push   $0x0
    3147:	52                   	push   %edx
    3148:	50                   	push   %eax
    3149:	ff 75 10             	pushl  0x10(%ebp)
    314c:	ff 75 0c             	pushl  0xc(%ebp)
    314f:	ff 75 08             	pushl  0x8(%ebp)
    3152:	e8 53 fe ff ff       	call   2faa <draw_line>
    3157:	83 c4 20             	add    $0x20,%esp
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    315a:	8b 45 10             	mov    0x10(%ebp),%eax
    315d:	83 e8 01             	sub    $0x1,%eax
    3160:	6a 00                	push   $0x0
    3162:	6a 00                	push   $0x0
    3164:	6a 00                	push   $0x0
    3166:	50                   	push   %eax
    3167:	6a 00                	push   $0x0
    3169:	ff 75 10             	pushl  0x10(%ebp)
    316c:	ff 75 0c             	pushl  0xc(%ebp)
    316f:	ff 75 08             	pushl  0x8(%ebp)
    3172:	e8 33 fe ff ff       	call   2faa <draw_line>
    3177:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    317a:	8b 45 0c             	mov    0xc(%ebp),%eax
    317d:	83 e8 02             	sub    $0x2,%eax
    3180:	68 cb 5a 00 00       	push   $0x5acb
    3185:	6a 14                	push   $0x14
    3187:	50                   	push   %eax
    3188:	6a 01                	push   $0x1
    318a:	6a 01                	push   $0x1
    318c:	ff 75 10             	pushl  0x10(%ebp)
    318f:	ff 75 0c             	pushl  0xc(%ebp)
    3192:	ff 75 08             	pushl  0x8(%ebp)
    3195:	e8 4a f7 ff ff       	call   28e4 <fill_rect>
    319a:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    319d:	8b 45 0c             	mov    0xc(%ebp),%eax
    31a0:	83 e8 02             	sub    $0x2,%eax
    31a3:	89 c2                	mov    %eax,%edx
    31a5:	8b 45 10             	mov    0x10(%ebp),%eax
    31a8:	83 e8 15             	sub    $0x15,%eax
    31ab:	68 cb 5a 00 00       	push   $0x5acb
    31b0:	6a 14                	push   $0x14
    31b2:	52                   	push   %edx
    31b3:	50                   	push   %eax
    31b4:	6a 01                	push   $0x1
    31b6:	ff 75 10             	pushl  0x10(%ebp)
    31b9:	ff 75 0c             	pushl  0xc(%ebp)
    31bc:	ff 75 08             	pushl  0x8(%ebp)
    31bf:	e8 20 f7 ff ff       	call   28e4 <fill_rect>
    31c4:	83 c4 20             	add    $0x20,%esp

  loadBitmap(&pic, "close.bmp");
    31c7:	83 ec 08             	sub    $0x8,%esp
    31ca:	68 d3 ae 00 00       	push   $0xaed3
    31cf:	8d 45 ec             	lea    -0x14(%ebp),%eax
    31d2:	50                   	push   %eax
    31d3:	e8 fb 00 00 00       	call   32d3 <loadBitmap>
    31d8:	83 c4 10             	add    $0x10,%esp
  draw_picture(c, pic, 3, 3);
    31db:	6a 03                	push   $0x3
    31dd:	6a 03                	push   $0x3
    31df:	ff 75 f4             	pushl  -0xc(%ebp)
    31e2:	ff 75 f0             	pushl  -0x10(%ebp)
    31e5:	ff 75 ec             	pushl  -0x14(%ebp)
    31e8:	ff 75 10             	pushl  0x10(%ebp)
    31eb:	ff 75 0c             	pushl  0xc(%ebp)
    31ee:	ff 75 08             	pushl  0x8(%ebp)
    31f1:	e8 f8 fc ff ff       	call   2eee <draw_picture>
    31f6:	83 c4 20             	add    $0x20,%esp
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    31f9:	83 ec 04             	sub    $0x4,%esp
    31fc:	6a 02                	push   $0x2
    31fe:	6a 19                	push   $0x19
    3200:	68 ff ff 00 00       	push   $0xffff
    3205:	ff 75 14             	pushl  0x14(%ebp)
    3208:	ff 75 10             	pushl  0x10(%ebp)
    320b:	ff 75 0c             	pushl  0xc(%ebp)
    320e:	ff 75 08             	pushl  0x8(%ebp)
    3211:	e8 29 fc ff ff       	call   2e3f <puts_str>
    3216:	83 c4 20             	add    $0x20,%esp
  freepic(&pic);
    3219:	83 ec 0c             	sub    $0xc,%esp
    321c:	8d 45 ec             	lea    -0x14(%ebp),%eax
    321f:	50                   	push   %eax
    3220:	e8 cd 05 00 00       	call   37f2 <freepic>
    3225:	83 c4 10             	add    $0x10,%esp
}
    3228:	c9                   	leave  
    3229:	c3                   	ret    

0000322a <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    322a:	55                   	push   %ebp
    322b:	89 e5                	mov    %esp,%ebp
    322d:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < len; i++)
    3230:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3237:	eb 2c                	jmp    3265 <load_iconlist+0x3b>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    3239:	8b 45 f4             	mov    -0xc(%ebp),%eax
    323c:	6b d0 34             	imul   $0x34,%eax,%edx
    323f:	8b 45 08             	mov    0x8(%ebp),%eax
    3242:	01 d0                	add    %edx,%eax
    3244:	89 c1                	mov    %eax,%ecx
    3246:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3249:	6b d0 34             	imul   $0x34,%eax,%edx
    324c:	8b 45 08             	mov    0x8(%ebp),%eax
    324f:	01 d0                	add    %edx,%eax
    3251:	83 c0 28             	add    $0x28,%eax
    3254:	83 ec 08             	sub    $0x8,%esp
    3257:	51                   	push   %ecx
    3258:	50                   	push   %eax
    3259:	e8 75 00 00 00       	call   32d3 <loadBitmap>
    325e:	83 c4 10             	add    $0x10,%esp
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    3261:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3265:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3268:	3b 45 0c             	cmp    0xc(%ebp),%eax
    326b:	7c cc                	jl     3239 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    326d:	c9                   	leave  
    326e:	c3                   	ret    

0000326f <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    326f:	55                   	push   %ebp
    3270:	89 e5                	mov    %esp,%ebp
    3272:	53                   	push   %ebx
    3273:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; i < len; i++)
    3276:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    327d:	eb 47                	jmp    32c6 <draw_iconlist+0x57>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    327f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3282:	6b d0 34             	imul   $0x34,%eax,%edx
    3285:	8b 45 14             	mov    0x14(%ebp),%eax
    3288:	01 d0                	add    %edx,%eax
    328a:	8b 48 24             	mov    0x24(%eax),%ecx
    328d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3290:	6b d0 34             	imul   $0x34,%eax,%edx
    3293:	8b 45 14             	mov    0x14(%ebp),%eax
    3296:	01 d0                	add    %edx,%eax
    3298:	8b 50 20             	mov    0x20(%eax),%edx
    329b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    329e:	6b d8 34             	imul   $0x34,%eax,%ebx
    32a1:	8b 45 14             	mov    0x14(%ebp),%eax
    32a4:	01 d8                	add    %ebx,%eax
    32a6:	51                   	push   %ecx
    32a7:	52                   	push   %edx
    32a8:	ff 70 30             	pushl  0x30(%eax)
    32ab:	ff 70 2c             	pushl  0x2c(%eax)
    32ae:	ff 70 28             	pushl  0x28(%eax)
    32b1:	ff 75 10             	pushl  0x10(%ebp)
    32b4:	ff 75 0c             	pushl  0xc(%ebp)
    32b7:	ff 75 08             	pushl  0x8(%ebp)
    32ba:	e8 2f fc ff ff       	call   2eee <draw_picture>
    32bf:	83 c4 20             	add    $0x20,%esp
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    32c2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    32c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    32c9:	3b 45 18             	cmp    0x18(%ebp),%eax
    32cc:	7c b1                	jl     327f <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    32ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    32d1:	c9                   	leave  
    32d2:	c3                   	ret    

000032d3 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    32d3:	55                   	push   %ebp
    32d4:	89 e5                	mov    %esp,%ebp
    32d6:	81 ec 88 00 00 00    	sub    $0x88,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    32dc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    32e3:	83 ec 08             	sub    $0x8,%esp
    32e6:	6a 00                	push   $0x0
    32e8:	ff 75 0c             	pushl  0xc(%ebp)
    32eb:	e8 43 0f 00 00       	call   4233 <open>
    32f0:	83 c4 10             	add    $0x10,%esp
    32f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    32f6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    32fa:	79 1a                	jns    3316 <loadBitmap+0x43>
		printf(0, "cannot open %s\n", pic_name);
    32fc:	83 ec 04             	sub    $0x4,%esp
    32ff:	ff 75 0c             	pushl  0xc(%ebp)
    3302:	68 e0 ae 00 00       	push   $0xaee0
    3307:	6a 00                	push   $0x0
    3309:	e8 c2 10 00 00       	call   43d0 <printf>
    330e:	83 c4 10             	add    $0x10,%esp
		return;
    3311:	e9 ca 02 00 00       	jmp    35e0 <loadBitmap+0x30d>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    3316:	83 ec 04             	sub    $0x4,%esp
    3319:	ff 75 0c             	pushl  0xc(%ebp)
    331c:	68 f0 ae 00 00       	push   $0xaef0
    3321:	6a 00                	push   $0x0
    3323:	e8 a8 10 00 00       	call   43d0 <printf>
    3328:	83 c4 10             	add    $0x10,%esp
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    332b:	83 ec 0c             	sub    $0xc,%esp
    332e:	6a 0e                	push   $0xe
    3330:	e8 6c 13 00 00       	call   46a1 <malloc>
    3335:	83 c4 10             	add    $0x10,%esp
    3338:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    333b:	83 ec 04             	sub    $0x4,%esp
    333e:	6a 0e                	push   $0xe
    3340:	ff 75 e4             	pushl  -0x1c(%ebp)
    3343:	ff 75 e8             	pushl  -0x18(%ebp)
    3346:	e8 c0 0e 00 00       	call   420b <read>
    334b:	83 c4 10             	add    $0x10,%esp
    334e:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    3351:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3354:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    3357:	8b 45 dc             	mov    -0x24(%ebp),%eax
    335a:	0f b7 00             	movzwl (%eax),%eax
    335d:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    3361:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    3365:	66 3d 42 4d          	cmp    $0x4d42,%ax
    3369:	74 17                	je     3382 <loadBitmap+0xaf>
		printf(0, "file is not .bmp file!");
    336b:	83 ec 08             	sub    $0x8,%esp
    336e:	68 04 af 00 00       	push   $0xaf04
    3373:	6a 00                	push   $0x0
    3375:	e8 56 10 00 00       	call   43d0 <printf>
    337a:	83 c4 10             	add    $0x10,%esp
		return;
    337d:	e9 5e 02 00 00       	jmp    35e0 <loadBitmap+0x30d>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    3382:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3385:	83 c0 02             	add    $0x2,%eax
    3388:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    338b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    338e:	8b 00                	mov    (%eax),%eax
    3390:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3393:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3396:	83 c0 06             	add    $0x6,%eax
    3399:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    339c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    339f:	0f b7 00             	movzwl (%eax),%eax
    33a2:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    33a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    33a9:	83 c0 08             	add    $0x8,%eax
    33ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    33af:	8b 45 dc             	mov    -0x24(%ebp),%eax
    33b2:	0f b7 00             	movzwl (%eax),%eax
    33b5:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    33b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    33bc:	83 c0 0a             	add    $0xa,%eax
    33bf:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    33c2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    33c5:	8b 00                	mov    (%eax),%eax
    33c7:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    33ca:	83 ec 04             	sub    $0x4,%esp
    33cd:	6a 28                	push   $0x28
    33cf:	8d 45 84             	lea    -0x7c(%ebp),%eax
    33d2:	50                   	push   %eax
    33d3:	ff 75 e8             	pushl  -0x18(%ebp)
    33d6:	e8 30 0e 00 00       	call   420b <read>
    33db:	83 c4 10             	add    $0x10,%esp
	width = bitInfoHead.biWidth;
    33de:	8b 45 88             	mov    -0x78(%ebp),%eax
    33e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    33e4:	8b 45 8c             	mov    -0x74(%ebp),%eax
    33e7:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    33ea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    33ed:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    33f1:	c1 e0 02             	shl    $0x2,%eax
    33f4:	83 ec 0c             	sub    $0xc,%esp
    33f7:	50                   	push   %eax
    33f8:	ff 75 d0             	pushl  -0x30(%ebp)
    33fb:	ff 75 d4             	pushl  -0x2c(%ebp)
    33fe:	68 1c af 00 00       	push   $0xaf1c
    3403:	6a 00                	push   $0x0
    3405:	e8 c6 0f 00 00       	call   43d0 <printf>
    340a:	83 c4 20             	add    $0x20,%esp
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    340d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3411:	75 12                	jne    3425 <loadBitmap+0x152>
		printf(0, "0");
    3413:	83 ec 08             	sub    $0x8,%esp
    3416:	68 41 af 00 00       	push   $0xaf41
    341b:	6a 00                	push   $0x0
    341d:	e8 ae 0f 00 00       	call   43d0 <printf>
    3422:	83 c4 10             	add    $0x10,%esp
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    3425:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3429:	0f b7 c0             	movzwl %ax,%eax
    342c:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    3430:	83 c0 1f             	add    $0x1f,%eax
    3433:	8d 50 1f             	lea    0x1f(%eax),%edx
    3436:	85 c0                	test   %eax,%eax
    3438:	0f 48 c2             	cmovs  %edx,%eax
    343b:	c1 f8 05             	sar    $0x5,%eax
    343e:	c1 e0 02             	shl    $0x2,%eax
    3441:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    3444:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3447:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    344b:	83 ec 0c             	sub    $0xc,%esp
    344e:	50                   	push   %eax
    344f:	e8 4d 12 00 00       	call   46a1 <malloc>
    3454:	83 c4 10             	add    $0x10,%esp
    3457:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    345a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    345d:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3460:	0f af c2             	imul   %edx,%eax
    3463:	83 ec 04             	sub    $0x4,%esp
    3466:	50                   	push   %eax
    3467:	6a 00                	push   $0x0
    3469:	ff 75 c8             	pushl  -0x38(%ebp)
    346c:	e8 e8 0b 00 00       	call   4059 <memset>
    3471:	83 c4 10             	add    $0x10,%esp
	long nData = height * l_width;
    3474:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3477:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    347b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    347e:	83 ec 04             	sub    $0x4,%esp
    3481:	ff 75 c4             	pushl  -0x3c(%ebp)
    3484:	ff 75 c8             	pushl  -0x38(%ebp)
    3487:	ff 75 e8             	pushl  -0x18(%ebp)
    348a:	e8 7c 0d 00 00       	call   420b <read>
    348f:	83 c4 10             	add    $0x10,%esp

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    3492:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3495:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    3499:	c1 e0 02             	shl    $0x2,%eax
    349c:	83 ec 0c             	sub    $0xc,%esp
    349f:	50                   	push   %eax
    34a0:	e8 fc 11 00 00       	call   46a1 <malloc>
    34a5:	83 c4 10             	add    $0x10,%esp
    34a8:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    34ab:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    34ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
    34b1:	0f af c2             	imul   %edx,%eax
    34b4:	c1 e0 02             	shl    $0x2,%eax
    34b7:	83 ec 04             	sub    $0x4,%esp
    34ba:	50                   	push   %eax
    34bb:	6a 00                	push   $0x0
    34bd:	ff 75 c0             	pushl  -0x40(%ebp)
    34c0:	e8 94 0b 00 00       	call   4059 <memset>
    34c5:	83 c4 10             	add    $0x10,%esp
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    34c8:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    34cc:	66 83 f8 17          	cmp    $0x17,%ax
    34d0:	77 17                	ja     34e9 <loadBitmap+0x216>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    34d2:	83 ec 08             	sub    $0x8,%esp
    34d5:	68 44 af 00 00       	push   $0xaf44
    34da:	6a 00                	push   $0x0
    34dc:	e8 ef 0e 00 00       	call   43d0 <printf>
    34e1:	83 c4 10             	add    $0x10,%esp
		return;
    34e4:	e9 f7 00 00 00       	jmp    35e0 <loadBitmap+0x30d>
	} else	//位图为24位真彩色
	{
		index = 0;
    34e9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    34f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    34f7:	e9 94 00 00 00       	jmp    3590 <loadBitmap+0x2bd>
			for (j = 0; j < width; j++) {
    34fc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3503:	eb 7b                	jmp    3580 <loadBitmap+0x2ad>
				k = i * l_width + j * 3;
    3505:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3508:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    350c:	89 c1                	mov    %eax,%ecx
    350e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3511:	89 d0                	mov    %edx,%eax
    3513:	01 c0                	add    %eax,%eax
    3515:	01 d0                	add    %edx,%eax
    3517:	01 c8                	add    %ecx,%eax
    3519:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    351c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    351f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3526:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3529:	01 c2                	add    %eax,%edx
    352b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    352e:	8d 48 02             	lea    0x2(%eax),%ecx
    3531:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3534:	01 c8                	add    %ecx,%eax
    3536:	0f b6 00             	movzbl (%eax),%eax
    3539:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    353c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    353f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3546:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3549:	01 c2                	add    %eax,%edx
    354b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    354e:	8d 48 01             	lea    0x1(%eax),%ecx
    3551:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3554:	01 c8                	add    %ecx,%eax
    3556:	0f b6 00             	movzbl (%eax),%eax
    3559:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    355c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    355f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3566:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3569:	01 c2                	add    %eax,%edx
    356b:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    356e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3571:	01 c8                	add    %ecx,%eax
    3573:	0f b6 00             	movzbl (%eax),%eax
    3576:	88 02                	mov    %al,(%edx)
				index++;
    3578:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    357c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3580:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3583:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    3586:	0f 8c 79 ff ff ff    	jl     3505 <loadBitmap+0x232>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    358c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3590:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3593:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    3596:	0f 8c 60 ff ff ff    	jl     34fc <loadBitmap+0x229>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    359c:	83 ec 0c             	sub    $0xc,%esp
    359f:	ff 75 e8             	pushl  -0x18(%ebp)
    35a2:	e8 74 0c 00 00       	call   421b <close>
    35a7:	83 c4 10             	add    $0x10,%esp

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    35aa:	8b 45 08             	mov    0x8(%ebp),%eax
    35ad:	8b 55 c0             	mov    -0x40(%ebp),%edx
    35b0:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    35b2:	8b 45 08             	mov    0x8(%ebp),%eax
    35b5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    35b8:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    35bb:	8b 45 08             	mov    0x8(%ebp),%eax
    35be:	8b 55 d0             	mov    -0x30(%ebp),%edx
    35c1:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    35c4:	83 ec 0c             	sub    $0xc,%esp
    35c7:	ff 75 c8             	pushl  -0x38(%ebp)
    35ca:	e8 91 0f 00 00       	call   4560 <free>
    35cf:	83 c4 10             	add    $0x10,%esp
	free(BmpFileHeader);
    35d2:	83 ec 0c             	sub    $0xc,%esp
    35d5:	ff 75 e4             	pushl  -0x1c(%ebp)
    35d8:	e8 83 0f 00 00       	call   4560 <free>
    35dd:	83 c4 10             	add    $0x10,%esp
	//printf("\n");
}
    35e0:	c9                   	leave  
    35e1:	c3                   	ret    

000035e2 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    35e2:	55                   	push   %ebp
    35e3:	89 e5                	mov    %esp,%ebp
    35e5:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图文件头:\n");
    35e8:	83 ec 08             	sub    $0x8,%esp
    35eb:	68 64 af 00 00       	push   $0xaf64
    35f0:	6a 00                	push   $0x0
    35f2:	e8 d9 0d 00 00       	call   43d0 <printf>
    35f7:	83 c4 10             	add    $0x10,%esp
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    35fa:	8b 45 08             	mov    0x8(%ebp),%eax
    35fd:	0f b7 00             	movzwl (%eax),%eax
    3600:	0f b7 c0             	movzwl %ax,%eax
    3603:	83 ec 04             	sub    $0x4,%esp
    3606:	50                   	push   %eax
    3607:	68 76 af 00 00       	push   $0xaf76
    360c:	6a 00                	push   $0x0
    360e:	e8 bd 0d 00 00       	call   43d0 <printf>
    3613:	83 c4 10             	add    $0x10,%esp
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    3616:	8b 45 08             	mov    0x8(%ebp),%eax
    3619:	8b 40 04             	mov    0x4(%eax),%eax
    361c:	83 ec 04             	sub    $0x4,%esp
    361f:	50                   	push   %eax
    3620:	68 94 af 00 00       	push   $0xaf94
    3625:	6a 00                	push   $0x0
    3627:	e8 a4 0d 00 00       	call   43d0 <printf>
    362c:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    362f:	8b 45 08             	mov    0x8(%ebp),%eax
    3632:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    3636:	0f b7 c0             	movzwl %ax,%eax
    3639:	83 ec 04             	sub    $0x4,%esp
    363c:	50                   	push   %eax
    363d:	68 a5 af 00 00       	push   $0xafa5
    3642:	6a 00                	push   $0x0
    3644:	e8 87 0d 00 00       	call   43d0 <printf>
    3649:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    364c:	8b 45 08             	mov    0x8(%ebp),%eax
    364f:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    3653:	0f b7 c0             	movzwl %ax,%eax
    3656:	83 ec 04             	sub    $0x4,%esp
    3659:	50                   	push   %eax
    365a:	68 a5 af 00 00       	push   $0xafa5
    365f:	6a 00                	push   $0x0
    3661:	e8 6a 0d 00 00       	call   43d0 <printf>
    3666:	83 c4 10             	add    $0x10,%esp
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    3669:	8b 45 08             	mov    0x8(%ebp),%eax
    366c:	8b 40 0c             	mov    0xc(%eax),%eax
    366f:	83 ec 04             	sub    $0x4,%esp
    3672:	50                   	push   %eax
    3673:	68 b4 af 00 00       	push   $0xafb4
    3678:	6a 00                	push   $0x0
    367a:	e8 51 0d 00 00       	call   43d0 <printf>
    367f:	83 c4 10             	add    $0x10,%esp
}
    3682:	c9                   	leave  
    3683:	c3                   	ret    

00003684 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    3684:	55                   	push   %ebp
    3685:	89 e5                	mov    %esp,%ebp
    3687:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图信息头:\n");
    368a:	83 ec 08             	sub    $0x8,%esp
    368d:	68 dd af 00 00       	push   $0xafdd
    3692:	6a 00                	push   $0x0
    3694:	e8 37 0d 00 00       	call   43d0 <printf>
    3699:	83 c4 10             	add    $0x10,%esp
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    369c:	8b 45 08             	mov    0x8(%ebp),%eax
    369f:	8b 00                	mov    (%eax),%eax
    36a1:	83 ec 04             	sub    $0x4,%esp
    36a4:	50                   	push   %eax
    36a5:	68 ef af 00 00       	push   $0xafef
    36aa:	6a 00                	push   $0x0
    36ac:	e8 1f 0d 00 00       	call   43d0 <printf>
    36b1:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    36b4:	8b 45 08             	mov    0x8(%ebp),%eax
    36b7:	8b 40 04             	mov    0x4(%eax),%eax
    36ba:	83 ec 04             	sub    $0x4,%esp
    36bd:	50                   	push   %eax
    36be:	68 06 b0 00 00       	push   $0xb006
    36c3:	6a 00                	push   $0x0
    36c5:	e8 06 0d 00 00       	call   43d0 <printf>
    36ca:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    36cd:	8b 45 08             	mov    0x8(%ebp),%eax
    36d0:	8b 40 08             	mov    0x8(%eax),%eax
    36d3:	83 ec 04             	sub    $0x4,%esp
    36d6:	50                   	push   %eax
    36d7:	68 14 b0 00 00       	push   $0xb014
    36dc:	6a 00                	push   $0x0
    36de:	e8 ed 0c 00 00       	call   43d0 <printf>
    36e3:	83 c4 10             	add    $0x10,%esp
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    36e6:	8b 45 08             	mov    0x8(%ebp),%eax
    36e9:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    36ed:	0f b7 c0             	movzwl %ax,%eax
    36f0:	83 ec 04             	sub    $0x4,%esp
    36f3:	50                   	push   %eax
    36f4:	68 22 b0 00 00       	push   $0xb022
    36f9:	6a 00                	push   $0x0
    36fb:	e8 d0 0c 00 00       	call   43d0 <printf>
    3700:	83 c4 10             	add    $0x10,%esp
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    3703:	8b 45 08             	mov    0x8(%ebp),%eax
    3706:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    370a:	0f b7 c0             	movzwl %ax,%eax
    370d:	83 ec 04             	sub    $0x4,%esp
    3710:	50                   	push   %eax
    3711:	68 38 b0 00 00       	push   $0xb038
    3716:	6a 00                	push   $0x0
    3718:	e8 b3 0c 00 00       	call   43d0 <printf>
    371d:	83 c4 10             	add    $0x10,%esp
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    3720:	8b 45 08             	mov    0x8(%ebp),%eax
    3723:	8b 40 10             	mov    0x10(%eax),%eax
    3726:	83 ec 04             	sub    $0x4,%esp
    3729:	50                   	push   %eax
    372a:	68 59 b0 00 00       	push   $0xb059
    372f:	6a 00                	push   $0x0
    3731:	e8 9a 0c 00 00       	call   43d0 <printf>
    3736:	83 c4 10             	add    $0x10,%esp
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    3739:	8b 45 08             	mov    0x8(%ebp),%eax
    373c:	8b 40 14             	mov    0x14(%eax),%eax
    373f:	83 ec 04             	sub    $0x4,%esp
    3742:	50                   	push   %eax
    3743:	68 6c b0 00 00       	push   $0xb06c
    3748:	6a 00                	push   $0x0
    374a:	e8 81 0c 00 00       	call   43d0 <printf>
    374f:	83 c4 10             	add    $0x10,%esp
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    3752:	8b 45 08             	mov    0x8(%ebp),%eax
    3755:	8b 40 18             	mov    0x18(%eax),%eax
    3758:	83 ec 04             	sub    $0x4,%esp
    375b:	50                   	push   %eax
    375c:	68 a0 b0 00 00       	push   $0xb0a0
    3761:	6a 00                	push   $0x0
    3763:	e8 68 0c 00 00       	call   43d0 <printf>
    3768:	83 c4 10             	add    $0x10,%esp
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    376b:	8b 45 08             	mov    0x8(%ebp),%eax
    376e:	8b 40 1c             	mov    0x1c(%eax),%eax
    3771:	83 ec 04             	sub    $0x4,%esp
    3774:	50                   	push   %eax
    3775:	68 b5 b0 00 00       	push   $0xb0b5
    377a:	6a 00                	push   $0x0
    377c:	e8 4f 0c 00 00       	call   43d0 <printf>
    3781:	83 c4 10             	add    $0x10,%esp
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    3784:	8b 45 08             	mov    0x8(%ebp),%eax
    3787:	8b 40 20             	mov    0x20(%eax),%eax
    378a:	83 ec 04             	sub    $0x4,%esp
    378d:	50                   	push   %eax
    378e:	68 ca b0 00 00       	push   $0xb0ca
    3793:	6a 00                	push   $0x0
    3795:	e8 36 0c 00 00       	call   43d0 <printf>
    379a:	83 c4 10             	add    $0x10,%esp
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    379d:	8b 45 08             	mov    0x8(%ebp),%eax
    37a0:	8b 40 24             	mov    0x24(%eax),%eax
    37a3:	83 ec 04             	sub    $0x4,%esp
    37a6:	50                   	push   %eax
    37a7:	68 e1 b0 00 00       	push   $0xb0e1
    37ac:	6a 00                	push   $0x0
    37ae:	e8 1d 0c 00 00       	call   43d0 <printf>
    37b3:	83 c4 10             	add    $0x10,%esp
}
    37b6:	c9                   	leave  
    37b7:	c3                   	ret    

000037b8 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    37b8:	55                   	push   %ebp
    37b9:	89 e5                	mov    %esp,%ebp
    37bb:	83 ec 08             	sub    $0x8,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    37be:	8b 45 08             	mov    0x8(%ebp),%eax
    37c1:	0f b6 00             	movzbl (%eax),%eax
    37c4:	0f b6 c8             	movzbl %al,%ecx
    37c7:	8b 45 08             	mov    0x8(%ebp),%eax
    37ca:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    37ce:	0f b6 d0             	movzbl %al,%edx
    37d1:	8b 45 08             	mov    0x8(%ebp),%eax
    37d4:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    37d8:	0f b6 c0             	movzbl %al,%eax
    37db:	83 ec 0c             	sub    $0xc,%esp
    37de:	51                   	push   %ecx
    37df:	52                   	push   %edx
    37e0:	50                   	push   %eax
    37e1:	68 f5 b0 00 00       	push   $0xb0f5
    37e6:	6a 00                	push   $0x0
    37e8:	e8 e3 0b 00 00       	call   43d0 <printf>
    37ed:	83 c4 20             	add    $0x20,%esp
}
    37f0:	c9                   	leave  
    37f1:	c3                   	ret    

000037f2 <freepic>:

void freepic(PICNODE *pic) {
    37f2:	55                   	push   %ebp
    37f3:	89 e5                	mov    %esp,%ebp
    37f5:	83 ec 08             	sub    $0x8,%esp
	free(pic->data);
    37f8:	8b 45 08             	mov    0x8(%ebp),%eax
    37fb:	8b 00                	mov    (%eax),%eax
    37fd:	83 ec 0c             	sub    $0xc,%esp
    3800:	50                   	push   %eax
    3801:	e8 5a 0d 00 00       	call   4560 <free>
    3806:	83 c4 10             	add    $0x10,%esp
}
    3809:	c9                   	leave  
    380a:	c3                   	ret    

0000380b <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    380b:	55                   	push   %ebp
    380c:	89 e5                	mov    %esp,%ebp
    380e:	83 ec 68             	sub    $0x68,%esp
	int W = 15;
    3811:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    3818:	8d 45 dc             	lea    -0x24(%ebp),%eax
    381b:	83 ec 0c             	sub    $0xc,%esp
    381e:	ff 75 ec             	pushl  -0x14(%ebp)
    3821:	ff 75 ec             	pushl  -0x14(%ebp)
    3824:	6a 00                	push   $0x0
    3826:	6a 00                	push   $0x0
    3828:	50                   	push   %eax
    3829:	e8 01 02 00 00       	call   3a2f <initRect>
    382e:	83 c4 1c             	add    $0x1c,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    3831:	8b 45 08             	mov    0x8(%ebp),%eax
    3834:	8b 40 04             	mov    0x4(%eax),%eax
    3837:	2b 45 ec             	sub    -0x14(%ebp),%eax
    383a:	89 c2                	mov    %eax,%edx
    383c:	8d 45 cc             	lea    -0x34(%ebp),%eax
    383f:	83 ec 0c             	sub    $0xc,%esp
    3842:	ff 75 ec             	pushl  -0x14(%ebp)
    3845:	ff 75 ec             	pushl  -0x14(%ebp)
    3848:	6a 00                	push   $0x0
    384a:	52                   	push   %edx
    384b:	50                   	push   %eax
    384c:	e8 de 01 00 00       	call   3a2f <initRect>
    3851:	83 c4 1c             	add    $0x1c,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    3854:	8b 45 08             	mov    0x8(%ebp),%eax
    3857:	8b 40 08             	mov    0x8(%eax),%eax
    385a:	2b 45 ec             	sub    -0x14(%ebp),%eax
    385d:	89 c1                	mov    %eax,%ecx
    385f:	8b 45 08             	mov    0x8(%ebp),%eax
    3862:	8b 40 04             	mov    0x4(%eax),%eax
    3865:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3868:	89 c2                	mov    %eax,%edx
    386a:	8d 45 bc             	lea    -0x44(%ebp),%eax
    386d:	83 ec 0c             	sub    $0xc,%esp
    3870:	ff 75 ec             	pushl  -0x14(%ebp)
    3873:	ff 75 ec             	pushl  -0x14(%ebp)
    3876:	51                   	push   %ecx
    3877:	52                   	push   %edx
    3878:	50                   	push   %eax
    3879:	e8 b1 01 00 00       	call   3a2f <initRect>
    387e:	83 c4 1c             	add    $0x1c,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    3881:	8b 45 08             	mov    0x8(%ebp),%eax
    3884:	8b 40 08             	mov    0x8(%eax),%eax
    3887:	2b 45 ec             	sub    -0x14(%ebp),%eax
    388a:	89 c2                	mov    %eax,%edx
    388c:	8d 45 ac             	lea    -0x54(%ebp),%eax
    388f:	83 ec 0c             	sub    $0xc,%esp
    3892:	ff 75 ec             	pushl  -0x14(%ebp)
    3895:	ff 75 ec             	pushl  -0x14(%ebp)
    3898:	52                   	push   %edx
    3899:	6a 00                	push   $0x0
    389b:	50                   	push   %eax
    389c:	e8 8e 01 00 00       	call   3a2f <initRect>
    38a1:	83 c4 1c             	add    $0x1c,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    38a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    38ab:	e9 47 01 00 00       	jmp    39f7 <set_icon_alpha+0x1ec>
		for (j = 0; j < pic->height; j++) {
    38b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    38b7:	e9 28 01 00 00       	jmp    39e4 <set_icon_alpha+0x1d9>
			p = initPoint(i, j);
    38bc:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    38bf:	83 ec 04             	sub    $0x4,%esp
    38c2:	ff 75 f0             	pushl  -0x10(%ebp)
    38c5:	ff 75 f4             	pushl  -0xc(%ebp)
    38c8:	50                   	push   %eax
    38c9:	e8 3a 01 00 00       	call   3a08 <initPoint>
    38ce:	83 c4 0c             	add    $0xc,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    38d1:	83 ec 08             	sub    $0x8,%esp
    38d4:	ff 75 e8             	pushl  -0x18(%ebp)
    38d7:	ff 75 e4             	pushl  -0x1c(%ebp)
    38da:	ff 75 e0             	pushl  -0x20(%ebp)
    38dd:	ff 75 dc             	pushl  -0x24(%ebp)
    38e0:	ff 75 a8             	pushl  -0x58(%ebp)
    38e3:	ff 75 a4             	pushl  -0x5c(%ebp)
    38e6:	e8 95 01 00 00       	call   3a80 <isIn>
    38eb:	83 c4 20             	add    $0x20,%esp
    38ee:	85 c0                	test   %eax,%eax
    38f0:	75 67                	jne    3959 <set_icon_alpha+0x14e>
    38f2:	83 ec 08             	sub    $0x8,%esp
    38f5:	ff 75 d8             	pushl  -0x28(%ebp)
    38f8:	ff 75 d4             	pushl  -0x2c(%ebp)
    38fb:	ff 75 d0             	pushl  -0x30(%ebp)
    38fe:	ff 75 cc             	pushl  -0x34(%ebp)
    3901:	ff 75 a8             	pushl  -0x58(%ebp)
    3904:	ff 75 a4             	pushl  -0x5c(%ebp)
    3907:	e8 74 01 00 00       	call   3a80 <isIn>
    390c:	83 c4 20             	add    $0x20,%esp
    390f:	85 c0                	test   %eax,%eax
    3911:	75 46                	jne    3959 <set_icon_alpha+0x14e>
    3913:	83 ec 08             	sub    $0x8,%esp
    3916:	ff 75 c8             	pushl  -0x38(%ebp)
    3919:	ff 75 c4             	pushl  -0x3c(%ebp)
    391c:	ff 75 c0             	pushl  -0x40(%ebp)
    391f:	ff 75 bc             	pushl  -0x44(%ebp)
    3922:	ff 75 a8             	pushl  -0x58(%ebp)
    3925:	ff 75 a4             	pushl  -0x5c(%ebp)
    3928:	e8 53 01 00 00       	call   3a80 <isIn>
    392d:	83 c4 20             	add    $0x20,%esp
    3930:	85 c0                	test   %eax,%eax
    3932:	75 25                	jne    3959 <set_icon_alpha+0x14e>
    3934:	83 ec 08             	sub    $0x8,%esp
    3937:	ff 75 b8             	pushl  -0x48(%ebp)
    393a:	ff 75 b4             	pushl  -0x4c(%ebp)
    393d:	ff 75 b0             	pushl  -0x50(%ebp)
    3940:	ff 75 ac             	pushl  -0x54(%ebp)
    3943:	ff 75 a8             	pushl  -0x58(%ebp)
    3946:	ff 75 a4             	pushl  -0x5c(%ebp)
    3949:	e8 32 01 00 00       	call   3a80 <isIn>
    394e:	83 c4 20             	add    $0x20,%esp
    3951:	85 c0                	test   %eax,%eax
    3953:	0f 84 87 00 00 00    	je     39e0 <set_icon_alpha+0x1d5>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    3959:	8b 45 08             	mov    0x8(%ebp),%eax
    395c:	8b 10                	mov    (%eax),%edx
    395e:	8b 45 08             	mov    0x8(%ebp),%eax
    3961:	8b 40 04             	mov    0x4(%eax),%eax
    3964:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3968:	89 c1                	mov    %eax,%ecx
    396a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    396d:	01 c8                	add    %ecx,%eax
    396f:	c1 e0 02             	shl    $0x2,%eax
    3972:	01 d0                	add    %edx,%eax
    3974:	0f b6 00             	movzbl (%eax),%eax
    3977:	3c ff                	cmp    $0xff,%al
    3979:	75 65                	jne    39e0 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    397b:	8b 45 08             	mov    0x8(%ebp),%eax
    397e:	8b 10                	mov    (%eax),%edx
    3980:	8b 45 08             	mov    0x8(%ebp),%eax
    3983:	8b 40 04             	mov    0x4(%eax),%eax
    3986:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    398a:	89 c1                	mov    %eax,%ecx
    398c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    398f:	01 c8                	add    %ecx,%eax
    3991:	c1 e0 02             	shl    $0x2,%eax
    3994:	01 d0                	add    %edx,%eax
    3996:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    399a:	3c ff                	cmp    $0xff,%al
    399c:	75 42                	jne    39e0 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    399e:	8b 45 08             	mov    0x8(%ebp),%eax
    39a1:	8b 10                	mov    (%eax),%edx
    39a3:	8b 45 08             	mov    0x8(%ebp),%eax
    39a6:	8b 40 04             	mov    0x4(%eax),%eax
    39a9:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    39ad:	89 c1                	mov    %eax,%ecx
    39af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39b2:	01 c8                	add    %ecx,%eax
    39b4:	c1 e0 02             	shl    $0x2,%eax
    39b7:	01 d0                	add    %edx,%eax
    39b9:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    39bd:	3c ff                	cmp    $0xff,%al
    39bf:	75 1f                	jne    39e0 <set_icon_alpha+0x1d5>
					pic->data[j * pic->width + i].rgbReserved = 1;
    39c1:	8b 45 08             	mov    0x8(%ebp),%eax
    39c4:	8b 10                	mov    (%eax),%edx
    39c6:	8b 45 08             	mov    0x8(%ebp),%eax
    39c9:	8b 40 04             	mov    0x4(%eax),%eax
    39cc:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    39d0:	89 c1                	mov    %eax,%ecx
    39d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39d5:	01 c8                	add    %ecx,%eax
    39d7:	c1 e0 02             	shl    $0x2,%eax
    39da:	01 d0                	add    %edx,%eax
    39dc:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    39e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    39e4:	8b 45 08             	mov    0x8(%ebp),%eax
    39e7:	8b 40 08             	mov    0x8(%eax),%eax
    39ea:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    39ed:	0f 8f c9 fe ff ff    	jg     38bc <set_icon_alpha+0xb1>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    39f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    39f7:	8b 45 08             	mov    0x8(%ebp),%eax
    39fa:	8b 40 04             	mov    0x4(%eax),%eax
    39fd:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3a00:	0f 8f aa fe ff ff    	jg     38b0 <set_icon_alpha+0xa5>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    3a06:	c9                   	leave  
    3a07:	c3                   	ret    

00003a08 <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    3a08:	55                   	push   %ebp
    3a09:	89 e5                	mov    %esp,%ebp
    3a0b:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    3a0e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a11:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    3a14:	8b 45 10             	mov    0x10(%ebp),%eax
    3a17:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    3a1a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3a1d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3a20:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3a23:	89 01                	mov    %eax,(%ecx)
    3a25:	89 51 04             	mov    %edx,0x4(%ecx)
}
    3a28:	8b 45 08             	mov    0x8(%ebp),%eax
    3a2b:	c9                   	leave  
    3a2c:	c2 04 00             	ret    $0x4

00003a2f <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    3a2f:	55                   	push   %ebp
    3a30:	89 e5                	mov    %esp,%ebp
    3a32:	83 ec 18             	sub    $0x18,%esp
	Rect r;
	r.start = initPoint(x, y);
    3a35:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3a38:	ff 75 10             	pushl  0x10(%ebp)
    3a3b:	ff 75 0c             	pushl  0xc(%ebp)
    3a3e:	50                   	push   %eax
    3a3f:	e8 c4 ff ff ff       	call   3a08 <initPoint>
    3a44:	83 c4 08             	add    $0x8,%esp
    3a47:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3a4a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3a4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3a50:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    3a53:	8b 45 14             	mov    0x14(%ebp),%eax
    3a56:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    3a59:	8b 45 18             	mov    0x18(%ebp),%eax
    3a5c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    3a5f:	8b 45 08             	mov    0x8(%ebp),%eax
    3a62:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3a65:	89 10                	mov    %edx,(%eax)
    3a67:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3a6a:	89 50 04             	mov    %edx,0x4(%eax)
    3a6d:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3a70:	89 50 08             	mov    %edx,0x8(%eax)
    3a73:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3a76:	89 50 0c             	mov    %edx,0xc(%eax)
}
    3a79:	8b 45 08             	mov    0x8(%ebp),%eax
    3a7c:	c9                   	leave  
    3a7d:	c2 04 00             	ret    $0x4

00003a80 <isIn>:

int isIn(Point p, Rect r)
{
    3a80:	55                   	push   %ebp
    3a81:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3a83:	8b 55 08             	mov    0x8(%ebp),%edx
    3a86:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3a89:	39 c2                	cmp    %eax,%edx
    3a8b:	7c 2f                	jl     3abc <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3a8d:	8b 45 08             	mov    0x8(%ebp),%eax
    3a90:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3a93:	8b 55 18             	mov    0x18(%ebp),%edx
    3a96:	01 ca                	add    %ecx,%edx
    3a98:	39 d0                	cmp    %edx,%eax
    3a9a:	7d 20                	jge    3abc <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3a9c:	8b 55 0c             	mov    0xc(%ebp),%edx
    3a9f:	8b 45 14             	mov    0x14(%ebp),%eax
    3aa2:	39 c2                	cmp    %eax,%edx
    3aa4:	7c 16                	jl     3abc <isIn+0x3c>
    3aa6:	8b 45 0c             	mov    0xc(%ebp),%eax
    3aa9:	8b 4d 14             	mov    0x14(%ebp),%ecx
    3aac:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3aaf:	01 ca                	add    %ecx,%edx
    3ab1:	39 d0                	cmp    %edx,%eax
    3ab3:	7d 07                	jge    3abc <isIn+0x3c>
    3ab5:	b8 01 00 00 00       	mov    $0x1,%eax
    3aba:	eb 05                	jmp    3ac1 <isIn+0x41>
    3abc:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3ac1:	5d                   	pop    %ebp
    3ac2:	c3                   	ret    

00003ac3 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    3ac3:	55                   	push   %ebp
    3ac4:	89 e5                	mov    %esp,%ebp
    3ac6:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    3ac9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    3ad0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    3ad7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    3ade:	8b 45 10             	mov    0x10(%ebp),%eax
    3ae1:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    3ae4:	8b 45 14             	mov    0x14(%ebp),%eax
    3ae7:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    3aea:	8b 45 08             	mov    0x8(%ebp),%eax
    3aed:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3af0:	89 10                	mov    %edx,(%eax)
    3af2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3af5:	89 50 04             	mov    %edx,0x4(%eax)
    3af8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3afb:	89 50 08             	mov    %edx,0x8(%eax)
    3afe:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3b01:	89 50 0c             	mov    %edx,0xc(%eax)
    3b04:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3b07:	89 50 10             	mov    %edx,0x10(%eax)
}
    3b0a:	8b 45 08             	mov    0x8(%ebp),%eax
    3b0d:	c9                   	leave  
    3b0e:	c2 04 00             	ret    $0x4

00003b11 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    3b11:	55                   	push   %ebp
    3b12:	89 e5                	mov    %esp,%ebp
    3b14:	83 ec 08             	sub    $0x8,%esp
	switch (MsgType)
    3b17:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3b1a:	83 f8 03             	cmp    $0x3,%eax
    3b1d:	74 4f                	je     3b6e <createClickable+0x5d>
    3b1f:	83 f8 04             	cmp    $0x4,%eax
    3b22:	74 07                	je     3b2b <createClickable+0x1a>
    3b24:	83 f8 02             	cmp    $0x2,%eax
    3b27:	74 25                	je     3b4e <createClickable+0x3d>
    3b29:	eb 66                	jmp    3b91 <createClickable+0x80>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    3b2b:	8b 45 08             	mov    0x8(%ebp),%eax
    3b2e:	83 c0 04             	add    $0x4,%eax
    3b31:	83 ec 08             	sub    $0x8,%esp
    3b34:	ff 75 20             	pushl  0x20(%ebp)
    3b37:	ff 75 18             	pushl  0x18(%ebp)
    3b3a:	ff 75 14             	pushl  0x14(%ebp)
    3b3d:	ff 75 10             	pushl  0x10(%ebp)
    3b40:	ff 75 0c             	pushl  0xc(%ebp)
    3b43:	50                   	push   %eax
    3b44:	e8 5d 00 00 00       	call   3ba6 <addClickable>
    3b49:	83 c4 20             	add    $0x20,%esp
	        break;
    3b4c:	eb 56                	jmp    3ba4 <createClickable+0x93>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    3b4e:	8b 45 08             	mov    0x8(%ebp),%eax
    3b51:	83 ec 08             	sub    $0x8,%esp
    3b54:	ff 75 20             	pushl  0x20(%ebp)
    3b57:	ff 75 18             	pushl  0x18(%ebp)
    3b5a:	ff 75 14             	pushl  0x14(%ebp)
    3b5d:	ff 75 10             	pushl  0x10(%ebp)
    3b60:	ff 75 0c             	pushl  0xc(%ebp)
    3b63:	50                   	push   %eax
    3b64:	e8 3d 00 00 00       	call   3ba6 <addClickable>
    3b69:	83 c4 20             	add    $0x20,%esp
	    	break;
    3b6c:	eb 36                	jmp    3ba4 <createClickable+0x93>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    3b6e:	8b 45 08             	mov    0x8(%ebp),%eax
    3b71:	83 c0 08             	add    $0x8,%eax
    3b74:	83 ec 08             	sub    $0x8,%esp
    3b77:	ff 75 20             	pushl  0x20(%ebp)
    3b7a:	ff 75 18             	pushl  0x18(%ebp)
    3b7d:	ff 75 14             	pushl  0x14(%ebp)
    3b80:	ff 75 10             	pushl  0x10(%ebp)
    3b83:	ff 75 0c             	pushl  0xc(%ebp)
    3b86:	50                   	push   %eax
    3b87:	e8 1a 00 00 00       	call   3ba6 <addClickable>
    3b8c:	83 c4 20             	add    $0x20,%esp
	    	break;
    3b8f:	eb 13                	jmp    3ba4 <createClickable+0x93>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    3b91:	83 ec 08             	sub    $0x8,%esp
    3b94:	68 04 b1 00 00       	push   $0xb104
    3b99:	6a 00                	push   $0x0
    3b9b:	e8 30 08 00 00       	call   43d0 <printf>
    3ba0:	83 c4 10             	add    $0x10,%esp
	    	break;
    3ba3:	90                   	nop
	}
}
    3ba4:	c9                   	leave  
    3ba5:	c3                   	ret    

00003ba6 <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    3ba6:	55                   	push   %ebp
    3ba7:	89 e5                	mov    %esp,%ebp
    3ba9:	83 ec 18             	sub    $0x18,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    3bac:	83 ec 0c             	sub    $0xc,%esp
    3baf:	6a 18                	push   $0x18
    3bb1:	e8 eb 0a 00 00       	call   46a1 <malloc>
    3bb6:	83 c4 10             	add    $0x10,%esp
    3bb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    3bbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bbf:	8b 55 0c             	mov    0xc(%ebp),%edx
    3bc2:	89 10                	mov    %edx,(%eax)
    3bc4:	8b 55 10             	mov    0x10(%ebp),%edx
    3bc7:	89 50 04             	mov    %edx,0x4(%eax)
    3bca:	8b 55 14             	mov    0x14(%ebp),%edx
    3bcd:	89 50 08             	mov    %edx,0x8(%eax)
    3bd0:	8b 55 18             	mov    0x18(%ebp),%edx
    3bd3:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    3bd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bd9:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3bdc:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    3bdf:	8b 45 08             	mov    0x8(%ebp),%eax
    3be2:	8b 10                	mov    (%eax),%edx
    3be4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3be7:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    3bea:	8b 45 08             	mov    0x8(%ebp),%eax
    3bed:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3bf0:	89 10                	mov    %edx,(%eax)
}
    3bf2:	c9                   	leave  
    3bf3:	c3                   	ret    

00003bf4 <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    3bf4:	55                   	push   %ebp
    3bf5:	89 e5                	mov    %esp,%ebp
    3bf7:	83 ec 18             	sub    $0x18,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    3bfa:	8b 45 08             	mov    0x8(%ebp),%eax
    3bfd:	8b 00                	mov    (%eax),%eax
    3bff:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3c02:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c05:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3c08:	e9 ad 00 00 00       	jmp    3cba <deleteClickable+0xc6>
	{
		if (isIn(cur->area.start, region))
    3c0d:	ff 75 18             	pushl  0x18(%ebp)
    3c10:	ff 75 14             	pushl  0x14(%ebp)
    3c13:	ff 75 10             	pushl  0x10(%ebp)
    3c16:	ff 75 0c             	pushl  0xc(%ebp)
    3c19:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c1c:	ff 70 04             	pushl  0x4(%eax)
    3c1f:	ff 30                	pushl  (%eax)
    3c21:	e8 5a fe ff ff       	call   3a80 <isIn>
    3c26:	83 c4 18             	add    $0x18,%esp
    3c29:	85 c0                	test   %eax,%eax
    3c2b:	74 66                	je     3c93 <deleteClickable+0x9f>
		{
			//如果当前指针指向头部
			if (cur == *head)
    3c2d:	8b 45 08             	mov    0x8(%ebp),%eax
    3c30:	8b 00                	mov    (%eax),%eax
    3c32:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3c35:	75 31                	jne    3c68 <deleteClickable+0x74>
			{
				//删除头节点
				temp = *head;
    3c37:	8b 45 08             	mov    0x8(%ebp),%eax
    3c3a:	8b 00                	mov    (%eax),%eax
    3c3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    3c3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c42:	8b 50 14             	mov    0x14(%eax),%edx
    3c45:	8b 45 08             	mov    0x8(%ebp),%eax
    3c48:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    3c4a:	8b 45 08             	mov    0x8(%ebp),%eax
    3c4d:	8b 00                	mov    (%eax),%eax
    3c4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3c52:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c55:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3c58:	83 ec 0c             	sub    $0xc,%esp
    3c5b:	ff 75 ec             	pushl  -0x14(%ebp)
    3c5e:	e8 fd 08 00 00       	call   4560 <free>
    3c63:	83 c4 10             	add    $0x10,%esp
    3c66:	eb 52                	jmp    3cba <deleteClickable+0xc6>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    3c68:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c6b:	8b 50 14             	mov    0x14(%eax),%edx
    3c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c71:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    3c74:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c77:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    3c7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c7d:	8b 40 14             	mov    0x14(%eax),%eax
    3c80:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3c83:	83 ec 0c             	sub    $0xc,%esp
    3c86:	ff 75 ec             	pushl  -0x14(%ebp)
    3c89:	e8 d2 08 00 00       	call   4560 <free>
    3c8e:	83 c4 10             	add    $0x10,%esp
    3c91:	eb 27                	jmp    3cba <deleteClickable+0xc6>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    3c93:	8b 45 08             	mov    0x8(%ebp),%eax
    3c96:	8b 00                	mov    (%eax),%eax
    3c98:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3c9b:	75 0b                	jne    3ca8 <deleteClickable+0xb4>
			{
				cur = cur->next;
    3c9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ca0:	8b 40 14             	mov    0x14(%eax),%eax
    3ca3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3ca6:	eb 12                	jmp    3cba <deleteClickable+0xc6>
			}
			else
			{
				cur = cur->next;
    3ca8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3cab:	8b 40 14             	mov    0x14(%eax),%eax
    3cae:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    3cb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cb4:	8b 40 14             	mov    0x14(%eax),%eax
    3cb7:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    3cba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3cbe:	0f 85 49 ff ff ff    	jne    3c0d <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    3cc4:	c9                   	leave  
    3cc5:	c3                   	ret    

00003cc6 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    3cc6:	55                   	push   %ebp
    3cc7:	89 e5                	mov    %esp,%ebp
    3cc9:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    3ccc:	8b 45 08             	mov    0x8(%ebp),%eax
    3ccf:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3cd2:	eb 4e                	jmp    3d22 <executeHandler+0x5c>
	{
		if (isIn(click, cur->area))
    3cd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cd7:	ff 70 0c             	pushl  0xc(%eax)
    3cda:	ff 70 08             	pushl  0x8(%eax)
    3cdd:	ff 70 04             	pushl  0x4(%eax)
    3ce0:	ff 30                	pushl  (%eax)
    3ce2:	ff 75 10             	pushl  0x10(%ebp)
    3ce5:	ff 75 0c             	pushl  0xc(%ebp)
    3ce8:	e8 93 fd ff ff       	call   3a80 <isIn>
    3ced:	83 c4 18             	add    $0x18,%esp
    3cf0:	85 c0                	test   %eax,%eax
    3cf2:	74 25                	je     3d19 <executeHandler+0x53>
		{
			isSearching = 0;
    3cf4:	c7 05 00 26 01 00 00 	movl   $0x0,0x12600
    3cfb:	00 00 00 
			cur->handler(click);
    3cfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d01:	8b 40 10             	mov    0x10(%eax),%eax
    3d04:	83 ec 08             	sub    $0x8,%esp
    3d07:	ff 75 10             	pushl  0x10(%ebp)
    3d0a:	ff 75 0c             	pushl  0xc(%ebp)
    3d0d:	ff d0                	call   *%eax
    3d0f:	83 c4 10             	add    $0x10,%esp
			return 1;
    3d12:	b8 01 00 00 00       	mov    $0x1,%eax
    3d17:	eb 30                	jmp    3d49 <executeHandler+0x83>
		}
		cur = cur->next;
    3d19:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d1c:	8b 40 14             	mov    0x14(%eax),%eax
    3d1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    3d22:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3d26:	75 ac                	jne    3cd4 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    3d28:	c7 05 00 26 01 00 00 	movl   $0x0,0x12600
    3d2f:	00 00 00 
	printf(0, "execute: none!\n");
    3d32:	83 ec 08             	sub    $0x8,%esp
    3d35:	68 32 b1 00 00       	push   $0xb132
    3d3a:	6a 00                	push   $0x0
    3d3c:	e8 8f 06 00 00       	call   43d0 <printf>
    3d41:	83 c4 10             	add    $0x10,%esp
	return 0;
    3d44:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3d49:	c9                   	leave  
    3d4a:	c3                   	ret    

00003d4b <printClickable>:

void printClickable(Clickable *c)
{
    3d4b:	55                   	push   %ebp
    3d4c:	89 e5                	mov    %esp,%ebp
    3d4e:	53                   	push   %ebx
    3d4f:	83 ec 04             	sub    $0x4,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    3d52:	8b 45 08             	mov    0x8(%ebp),%eax
    3d55:	8b 58 0c             	mov    0xc(%eax),%ebx
    3d58:	8b 45 08             	mov    0x8(%ebp),%eax
    3d5b:	8b 48 08             	mov    0x8(%eax),%ecx
    3d5e:	8b 45 08             	mov    0x8(%ebp),%eax
    3d61:	8b 50 04             	mov    0x4(%eax),%edx
    3d64:	8b 45 08             	mov    0x8(%ebp),%eax
    3d67:	8b 00                	mov    (%eax),%eax
    3d69:	83 ec 08             	sub    $0x8,%esp
    3d6c:	53                   	push   %ebx
    3d6d:	51                   	push   %ecx
    3d6e:	52                   	push   %edx
    3d6f:	50                   	push   %eax
    3d70:	68 42 b1 00 00       	push   $0xb142
    3d75:	6a 00                	push   $0x0
    3d77:	e8 54 06 00 00       	call   43d0 <printf>
    3d7c:	83 c4 20             	add    $0x20,%esp
}
    3d7f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3d82:	c9                   	leave  
    3d83:	c3                   	ret    

00003d84 <printClickableList>:

void printClickableList(Clickable *head)
{
    3d84:	55                   	push   %ebp
    3d85:	89 e5                	mov    %esp,%ebp
    3d87:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    3d8a:	8b 45 08             	mov    0x8(%ebp),%eax
    3d8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    3d90:	83 ec 08             	sub    $0x8,%esp
    3d93:	68 54 b1 00 00       	push   $0xb154
    3d98:	6a 00                	push   $0x0
    3d9a:	e8 31 06 00 00       	call   43d0 <printf>
    3d9f:	83 c4 10             	add    $0x10,%esp
	while(cur != 0)
    3da2:	eb 17                	jmp    3dbb <printClickableList+0x37>
	{
		printClickable(cur);
    3da4:	83 ec 0c             	sub    $0xc,%esp
    3da7:	ff 75 f4             	pushl  -0xc(%ebp)
    3daa:	e8 9c ff ff ff       	call   3d4b <printClickable>
    3daf:	83 c4 10             	add    $0x10,%esp
		cur = cur->next;
    3db2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3db5:	8b 40 14             	mov    0x14(%eax),%eax
    3db8:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    3dbb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3dbf:	75 e3                	jne    3da4 <printClickableList+0x20>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    3dc1:	83 ec 08             	sub    $0x8,%esp
    3dc4:	68 65 b1 00 00       	push   $0xb165
    3dc9:	6a 00                	push   $0x0
    3dcb:	e8 00 06 00 00       	call   43d0 <printf>
    3dd0:	83 c4 10             	add    $0x10,%esp
}
    3dd3:	c9                   	leave  
    3dd4:	c3                   	ret    

00003dd5 <testHanler>:

void testHanler(struct Point p)
{
    3dd5:	55                   	push   %ebp
    3dd6:	89 e5                	mov    %esp,%ebp
    3dd8:	83 ec 08             	sub    $0x8,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    3ddb:	8b 55 0c             	mov    0xc(%ebp),%edx
    3dde:	8b 45 08             	mov    0x8(%ebp),%eax
    3de1:	52                   	push   %edx
    3de2:	50                   	push   %eax
    3de3:	68 67 b1 00 00       	push   $0xb167
    3de8:	6a 00                	push   $0x0
    3dea:	e8 e1 05 00 00       	call   43d0 <printf>
    3def:	83 c4 10             	add    $0x10,%esp
}
    3df2:	c9                   	leave  
    3df3:	c3                   	ret    

00003df4 <testClickable>:
void testClickable(struct Context c)
{
    3df4:	55                   	push   %ebp
    3df5:	89 e5                	mov    %esp,%ebp
    3df7:	83 ec 78             	sub    $0x78,%esp
	ClickableManager cm = initClickManager(c);
    3dfa:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3dfd:	ff 75 10             	pushl  0x10(%ebp)
    3e00:	ff 75 0c             	pushl  0xc(%ebp)
    3e03:	ff 75 08             	pushl  0x8(%ebp)
    3e06:	50                   	push   %eax
    3e07:	e8 b7 fc ff ff       	call   3ac3 <initClickManager>
    3e0c:	83 c4 0c             	add    $0xc,%esp

	Rect r1 = initRect(5,5,20,20);
    3e0f:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    3e12:	83 ec 04             	sub    $0x4,%esp
    3e15:	6a 14                	push   $0x14
    3e17:	6a 14                	push   $0x14
    3e19:	6a 05                	push   $0x5
    3e1b:	6a 05                	push   $0x5
    3e1d:	50                   	push   %eax
    3e1e:	e8 0c fc ff ff       	call   3a2f <initRect>
    3e23:	83 c4 14             	add    $0x14,%esp
	Rect r2 = initRect(20,20,20,20);
    3e26:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    3e29:	83 ec 04             	sub    $0x4,%esp
    3e2c:	6a 14                	push   $0x14
    3e2e:	6a 14                	push   $0x14
    3e30:	6a 14                	push   $0x14
    3e32:	6a 14                	push   $0x14
    3e34:	50                   	push   %eax
    3e35:	e8 f5 fb ff ff       	call   3a2f <initRect>
    3e3a:	83 c4 14             	add    $0x14,%esp
	Rect r3 = initRect(50,50,15,15);
    3e3d:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    3e40:	83 ec 04             	sub    $0x4,%esp
    3e43:	6a 0f                	push   $0xf
    3e45:	6a 0f                	push   $0xf
    3e47:	6a 32                	push   $0x32
    3e49:	6a 32                	push   $0x32
    3e4b:	50                   	push   %eax
    3e4c:	e8 de fb ff ff       	call   3a2f <initRect>
    3e51:	83 c4 14             	add    $0x14,%esp
	Rect r4 = initRect(0,0,30,30);
    3e54:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3e57:	83 ec 04             	sub    $0x4,%esp
    3e5a:	6a 1e                	push   $0x1e
    3e5c:	6a 1e                	push   $0x1e
    3e5e:	6a 00                	push   $0x0
    3e60:	6a 00                	push   $0x0
    3e62:	50                   	push   %eax
    3e63:	e8 c7 fb ff ff       	call   3a2f <initRect>
    3e68:	83 c4 14             	add    $0x14,%esp
	Point p1 = initPoint(23, 23);
    3e6b:	8d 45 9c             	lea    -0x64(%ebp),%eax
    3e6e:	83 ec 04             	sub    $0x4,%esp
    3e71:	6a 17                	push   $0x17
    3e73:	6a 17                	push   $0x17
    3e75:	50                   	push   %eax
    3e76:	e8 8d fb ff ff       	call   3a08 <initPoint>
    3e7b:	83 c4 0c             	add    $0xc,%esp
	Point p2 = initPoint(70, 70);
    3e7e:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3e81:	83 ec 04             	sub    $0x4,%esp
    3e84:	6a 46                	push   $0x46
    3e86:	6a 46                	push   $0x46
    3e88:	50                   	push   %eax
    3e89:	e8 7a fb ff ff       	call   3a08 <initPoint>
    3e8e:	83 c4 0c             	add    $0xc,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    3e91:	83 ec 04             	sub    $0x4,%esp
    3e94:	68 d5 3d 00 00       	push   $0x3dd5
    3e99:	6a 02                	push   $0x2
    3e9b:	ff 75 e0             	pushl  -0x20(%ebp)
    3e9e:	ff 75 dc             	pushl  -0x24(%ebp)
    3ea1:	ff 75 d8             	pushl  -0x28(%ebp)
    3ea4:	ff 75 d4             	pushl  -0x2c(%ebp)
    3ea7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3eaa:	50                   	push   %eax
    3eab:	e8 61 fc ff ff       	call   3b11 <createClickable>
    3eb0:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3eb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3eb6:	83 ec 04             	sub    $0x4,%esp
    3eb9:	50                   	push   %eax
    3eba:	68 7b b1 00 00       	push   $0xb17b
    3ebf:	6a 00                	push   $0x0
    3ec1:	e8 0a 05 00 00       	call   43d0 <printf>
    3ec6:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    3ec9:	83 ec 04             	sub    $0x4,%esp
    3ecc:	68 d5 3d 00 00       	push   $0x3dd5
    3ed1:	6a 02                	push   $0x2
    3ed3:	ff 75 d0             	pushl  -0x30(%ebp)
    3ed6:	ff 75 cc             	pushl  -0x34(%ebp)
    3ed9:	ff 75 c8             	pushl  -0x38(%ebp)
    3edc:	ff 75 c4             	pushl  -0x3c(%ebp)
    3edf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3ee2:	50                   	push   %eax
    3ee3:	e8 29 fc ff ff       	call   3b11 <createClickable>
    3ee8:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3eeb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3eee:	83 ec 04             	sub    $0x4,%esp
    3ef1:	50                   	push   %eax
    3ef2:	68 7b b1 00 00       	push   $0xb17b
    3ef7:	6a 00                	push   $0x0
    3ef9:	e8 d2 04 00 00       	call   43d0 <printf>
    3efe:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    3f01:	83 ec 04             	sub    $0x4,%esp
    3f04:	68 d5 3d 00 00       	push   $0x3dd5
    3f09:	6a 02                	push   $0x2
    3f0b:	ff 75 c0             	pushl  -0x40(%ebp)
    3f0e:	ff 75 bc             	pushl  -0x44(%ebp)
    3f11:	ff 75 b8             	pushl  -0x48(%ebp)
    3f14:	ff 75 b4             	pushl  -0x4c(%ebp)
    3f17:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3f1a:	50                   	push   %eax
    3f1b:	e8 f1 fb ff ff       	call   3b11 <createClickable>
    3f20:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3f23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f26:	83 ec 04             	sub    $0x4,%esp
    3f29:	50                   	push   %eax
    3f2a:	68 7b b1 00 00       	push   $0xb17b
    3f2f:	6a 00                	push   $0x0
    3f31:	e8 9a 04 00 00       	call   43d0 <printf>
    3f36:	83 c4 10             	add    $0x10,%esp
	printClickableList(cm.left_click);
    3f39:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f3c:	83 ec 0c             	sub    $0xc,%esp
    3f3f:	50                   	push   %eax
    3f40:	e8 3f fe ff ff       	call   3d84 <printClickableList>
    3f45:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p1);
    3f48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f4b:	83 ec 04             	sub    $0x4,%esp
    3f4e:	ff 75 a0             	pushl  -0x60(%ebp)
    3f51:	ff 75 9c             	pushl  -0x64(%ebp)
    3f54:	50                   	push   %eax
    3f55:	e8 6c fd ff ff       	call   3cc6 <executeHandler>
    3f5a:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p2);
    3f5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f60:	83 ec 04             	sub    $0x4,%esp
    3f63:	ff 75 98             	pushl  -0x68(%ebp)
    3f66:	ff 75 94             	pushl  -0x6c(%ebp)
    3f69:	50                   	push   %eax
    3f6a:	e8 57 fd ff ff       	call   3cc6 <executeHandler>
    3f6f:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, r4);
    3f72:	83 ec 0c             	sub    $0xc,%esp
    3f75:	ff 75 b0             	pushl  -0x50(%ebp)
    3f78:	ff 75 ac             	pushl  -0x54(%ebp)
    3f7b:	ff 75 a8             	pushl  -0x58(%ebp)
    3f7e:	ff 75 a4             	pushl  -0x5c(%ebp)
    3f81:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3f84:	50                   	push   %eax
    3f85:	e8 6a fc ff ff       	call   3bf4 <deleteClickable>
    3f8a:	83 c4 20             	add    $0x20,%esp
	printClickableList(cm.left_click);
    3f8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f90:	83 ec 0c             	sub    $0xc,%esp
    3f93:	50                   	push   %eax
    3f94:	e8 eb fd ff ff       	call   3d84 <printClickableList>
    3f99:	83 c4 10             	add    $0x10,%esp
}
    3f9c:	c9                   	leave  
    3f9d:	c3                   	ret    

00003f9e <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3f9e:	55                   	push   %ebp
    3f9f:	89 e5                	mov    %esp,%ebp
    3fa1:	57                   	push   %edi
    3fa2:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3fa3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3fa6:	8b 55 10             	mov    0x10(%ebp),%edx
    3fa9:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fac:	89 cb                	mov    %ecx,%ebx
    3fae:	89 df                	mov    %ebx,%edi
    3fb0:	89 d1                	mov    %edx,%ecx
    3fb2:	fc                   	cld    
    3fb3:	f3 aa                	rep stos %al,%es:(%edi)
    3fb5:	89 ca                	mov    %ecx,%edx
    3fb7:	89 fb                	mov    %edi,%ebx
    3fb9:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3fbc:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3fbf:	5b                   	pop    %ebx
    3fc0:	5f                   	pop    %edi
    3fc1:	5d                   	pop    %ebp
    3fc2:	c3                   	ret    

00003fc3 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3fc3:	55                   	push   %ebp
    3fc4:	89 e5                	mov    %esp,%ebp
    3fc6:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3fc9:	8b 45 08             	mov    0x8(%ebp),%eax
    3fcc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3fcf:	90                   	nop
    3fd0:	8b 45 08             	mov    0x8(%ebp),%eax
    3fd3:	8d 50 01             	lea    0x1(%eax),%edx
    3fd6:	89 55 08             	mov    %edx,0x8(%ebp)
    3fd9:	8b 55 0c             	mov    0xc(%ebp),%edx
    3fdc:	8d 4a 01             	lea    0x1(%edx),%ecx
    3fdf:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3fe2:	0f b6 12             	movzbl (%edx),%edx
    3fe5:	88 10                	mov    %dl,(%eax)
    3fe7:	0f b6 00             	movzbl (%eax),%eax
    3fea:	84 c0                	test   %al,%al
    3fec:	75 e2                	jne    3fd0 <strcpy+0xd>
    ;
  return os;
    3fee:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3ff1:	c9                   	leave  
    3ff2:	c3                   	ret    

00003ff3 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3ff3:	55                   	push   %ebp
    3ff4:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3ff6:	eb 08                	jmp    4000 <strcmp+0xd>
    p++, q++;
    3ff8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3ffc:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    4000:	8b 45 08             	mov    0x8(%ebp),%eax
    4003:	0f b6 00             	movzbl (%eax),%eax
    4006:	84 c0                	test   %al,%al
    4008:	74 10                	je     401a <strcmp+0x27>
    400a:	8b 45 08             	mov    0x8(%ebp),%eax
    400d:	0f b6 10             	movzbl (%eax),%edx
    4010:	8b 45 0c             	mov    0xc(%ebp),%eax
    4013:	0f b6 00             	movzbl (%eax),%eax
    4016:	38 c2                	cmp    %al,%dl
    4018:	74 de                	je     3ff8 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    401a:	8b 45 08             	mov    0x8(%ebp),%eax
    401d:	0f b6 00             	movzbl (%eax),%eax
    4020:	0f b6 d0             	movzbl %al,%edx
    4023:	8b 45 0c             	mov    0xc(%ebp),%eax
    4026:	0f b6 00             	movzbl (%eax),%eax
    4029:	0f b6 c0             	movzbl %al,%eax
    402c:	29 c2                	sub    %eax,%edx
    402e:	89 d0                	mov    %edx,%eax
}
    4030:	5d                   	pop    %ebp
    4031:	c3                   	ret    

00004032 <strlen>:

uint
strlen(char *s)
{
    4032:	55                   	push   %ebp
    4033:	89 e5                	mov    %esp,%ebp
    4035:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    4038:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    403f:	eb 04                	jmp    4045 <strlen+0x13>
    4041:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    4045:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4048:	8b 45 08             	mov    0x8(%ebp),%eax
    404b:	01 d0                	add    %edx,%eax
    404d:	0f b6 00             	movzbl (%eax),%eax
    4050:	84 c0                	test   %al,%al
    4052:	75 ed                	jne    4041 <strlen+0xf>
    ;
  return n;
    4054:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4057:	c9                   	leave  
    4058:	c3                   	ret    

00004059 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4059:	55                   	push   %ebp
    405a:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    405c:	8b 45 10             	mov    0x10(%ebp),%eax
    405f:	50                   	push   %eax
    4060:	ff 75 0c             	pushl  0xc(%ebp)
    4063:	ff 75 08             	pushl  0x8(%ebp)
    4066:	e8 33 ff ff ff       	call   3f9e <stosb>
    406b:	83 c4 0c             	add    $0xc,%esp
  return dst;
    406e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4071:	c9                   	leave  
    4072:	c3                   	ret    

00004073 <strchr>:

char*
strchr(const char *s, char c)
{
    4073:	55                   	push   %ebp
    4074:	89 e5                	mov    %esp,%ebp
    4076:	83 ec 04             	sub    $0x4,%esp
    4079:	8b 45 0c             	mov    0xc(%ebp),%eax
    407c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    407f:	eb 14                	jmp    4095 <strchr+0x22>
    if(*s == c)
    4081:	8b 45 08             	mov    0x8(%ebp),%eax
    4084:	0f b6 00             	movzbl (%eax),%eax
    4087:	3a 45 fc             	cmp    -0x4(%ebp),%al
    408a:	75 05                	jne    4091 <strchr+0x1e>
      return (char*)s;
    408c:	8b 45 08             	mov    0x8(%ebp),%eax
    408f:	eb 13                	jmp    40a4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    4091:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4095:	8b 45 08             	mov    0x8(%ebp),%eax
    4098:	0f b6 00             	movzbl (%eax),%eax
    409b:	84 c0                	test   %al,%al
    409d:	75 e2                	jne    4081 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    409f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    40a4:	c9                   	leave  
    40a5:	c3                   	ret    

000040a6 <gets>:

char*
gets(char *buf, int max)
{
    40a6:	55                   	push   %ebp
    40a7:	89 e5                	mov    %esp,%ebp
    40a9:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    40ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    40b3:	eb 44                	jmp    40f9 <gets+0x53>
    cc = read(0, &c, 1);
    40b5:	83 ec 04             	sub    $0x4,%esp
    40b8:	6a 01                	push   $0x1
    40ba:	8d 45 ef             	lea    -0x11(%ebp),%eax
    40bd:	50                   	push   %eax
    40be:	6a 00                	push   $0x0
    40c0:	e8 46 01 00 00       	call   420b <read>
    40c5:	83 c4 10             	add    $0x10,%esp
    40c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    40cb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    40cf:	7f 02                	jg     40d3 <gets+0x2d>
      break;
    40d1:	eb 31                	jmp    4104 <gets+0x5e>
    buf[i++] = c;
    40d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40d6:	8d 50 01             	lea    0x1(%eax),%edx
    40d9:	89 55 f4             	mov    %edx,-0xc(%ebp)
    40dc:	89 c2                	mov    %eax,%edx
    40de:	8b 45 08             	mov    0x8(%ebp),%eax
    40e1:	01 c2                	add    %eax,%edx
    40e3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    40e7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    40e9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    40ed:	3c 0a                	cmp    $0xa,%al
    40ef:	74 13                	je     4104 <gets+0x5e>
    40f1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    40f5:	3c 0d                	cmp    $0xd,%al
    40f7:	74 0b                	je     4104 <gets+0x5e>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    40f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40fc:	83 c0 01             	add    $0x1,%eax
    40ff:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4102:	7c b1                	jl     40b5 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    4104:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4107:	8b 45 08             	mov    0x8(%ebp),%eax
    410a:	01 d0                	add    %edx,%eax
    410c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    410f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4112:	c9                   	leave  
    4113:	c3                   	ret    

00004114 <stat>:

int
stat(char *n, struct stat *st)
{
    4114:	55                   	push   %ebp
    4115:	89 e5                	mov    %esp,%ebp
    4117:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    411a:	83 ec 08             	sub    $0x8,%esp
    411d:	6a 00                	push   $0x0
    411f:	ff 75 08             	pushl  0x8(%ebp)
    4122:	e8 0c 01 00 00       	call   4233 <open>
    4127:	83 c4 10             	add    $0x10,%esp
    412a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    412d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4131:	79 07                	jns    413a <stat+0x26>
    return -1;
    4133:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4138:	eb 25                	jmp    415f <stat+0x4b>
  r = fstat(fd, st);
    413a:	83 ec 08             	sub    $0x8,%esp
    413d:	ff 75 0c             	pushl  0xc(%ebp)
    4140:	ff 75 f4             	pushl  -0xc(%ebp)
    4143:	e8 03 01 00 00       	call   424b <fstat>
    4148:	83 c4 10             	add    $0x10,%esp
    414b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    414e:	83 ec 0c             	sub    $0xc,%esp
    4151:	ff 75 f4             	pushl  -0xc(%ebp)
    4154:	e8 c2 00 00 00       	call   421b <close>
    4159:	83 c4 10             	add    $0x10,%esp
  return r;
    415c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    415f:	c9                   	leave  
    4160:	c3                   	ret    

00004161 <atoi>:

int
atoi(const char *s)
{
    4161:	55                   	push   %ebp
    4162:	89 e5                	mov    %esp,%ebp
    4164:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    4167:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    416e:	eb 25                	jmp    4195 <atoi+0x34>
    n = n*10 + *s++ - '0';
    4170:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4173:	89 d0                	mov    %edx,%eax
    4175:	c1 e0 02             	shl    $0x2,%eax
    4178:	01 d0                	add    %edx,%eax
    417a:	01 c0                	add    %eax,%eax
    417c:	89 c1                	mov    %eax,%ecx
    417e:	8b 45 08             	mov    0x8(%ebp),%eax
    4181:	8d 50 01             	lea    0x1(%eax),%edx
    4184:	89 55 08             	mov    %edx,0x8(%ebp)
    4187:	0f b6 00             	movzbl (%eax),%eax
    418a:	0f be c0             	movsbl %al,%eax
    418d:	01 c8                	add    %ecx,%eax
    418f:	83 e8 30             	sub    $0x30,%eax
    4192:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4195:	8b 45 08             	mov    0x8(%ebp),%eax
    4198:	0f b6 00             	movzbl (%eax),%eax
    419b:	3c 2f                	cmp    $0x2f,%al
    419d:	7e 0a                	jle    41a9 <atoi+0x48>
    419f:	8b 45 08             	mov    0x8(%ebp),%eax
    41a2:	0f b6 00             	movzbl (%eax),%eax
    41a5:	3c 39                	cmp    $0x39,%al
    41a7:	7e c7                	jle    4170 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    41a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    41ac:	c9                   	leave  
    41ad:	c3                   	ret    

000041ae <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    41ae:	55                   	push   %ebp
    41af:	89 e5                	mov    %esp,%ebp
    41b1:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    41b4:	8b 45 08             	mov    0x8(%ebp),%eax
    41b7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    41ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    41bd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    41c0:	eb 17                	jmp    41d9 <memmove+0x2b>
    *dst++ = *src++;
    41c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    41c5:	8d 50 01             	lea    0x1(%eax),%edx
    41c8:	89 55 fc             	mov    %edx,-0x4(%ebp)
    41cb:	8b 55 f8             	mov    -0x8(%ebp),%edx
    41ce:	8d 4a 01             	lea    0x1(%edx),%ecx
    41d1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    41d4:	0f b6 12             	movzbl (%edx),%edx
    41d7:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    41d9:	8b 45 10             	mov    0x10(%ebp),%eax
    41dc:	8d 50 ff             	lea    -0x1(%eax),%edx
    41df:	89 55 10             	mov    %edx,0x10(%ebp)
    41e2:	85 c0                	test   %eax,%eax
    41e4:	7f dc                	jg     41c2 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    41e6:	8b 45 08             	mov    0x8(%ebp),%eax
}
    41e9:	c9                   	leave  
    41ea:	c3                   	ret    

000041eb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    41eb:	b8 01 00 00 00       	mov    $0x1,%eax
    41f0:	cd 40                	int    $0x40
    41f2:	c3                   	ret    

000041f3 <exit>:
SYSCALL(exit)
    41f3:	b8 02 00 00 00       	mov    $0x2,%eax
    41f8:	cd 40                	int    $0x40
    41fa:	c3                   	ret    

000041fb <wait>:
SYSCALL(wait)
    41fb:	b8 03 00 00 00       	mov    $0x3,%eax
    4200:	cd 40                	int    $0x40
    4202:	c3                   	ret    

00004203 <pipe>:
SYSCALL(pipe)
    4203:	b8 04 00 00 00       	mov    $0x4,%eax
    4208:	cd 40                	int    $0x40
    420a:	c3                   	ret    

0000420b <read>:
SYSCALL(read)
    420b:	b8 05 00 00 00       	mov    $0x5,%eax
    4210:	cd 40                	int    $0x40
    4212:	c3                   	ret    

00004213 <write>:
SYSCALL(write)
    4213:	b8 10 00 00 00       	mov    $0x10,%eax
    4218:	cd 40                	int    $0x40
    421a:	c3                   	ret    

0000421b <close>:
SYSCALL(close)
    421b:	b8 15 00 00 00       	mov    $0x15,%eax
    4220:	cd 40                	int    $0x40
    4222:	c3                   	ret    

00004223 <kill>:
SYSCALL(kill)
    4223:	b8 06 00 00 00       	mov    $0x6,%eax
    4228:	cd 40                	int    $0x40
    422a:	c3                   	ret    

0000422b <exec>:
SYSCALL(exec)
    422b:	b8 07 00 00 00       	mov    $0x7,%eax
    4230:	cd 40                	int    $0x40
    4232:	c3                   	ret    

00004233 <open>:
SYSCALL(open)
    4233:	b8 0f 00 00 00       	mov    $0xf,%eax
    4238:	cd 40                	int    $0x40
    423a:	c3                   	ret    

0000423b <mknod>:
SYSCALL(mknod)
    423b:	b8 11 00 00 00       	mov    $0x11,%eax
    4240:	cd 40                	int    $0x40
    4242:	c3                   	ret    

00004243 <unlink>:
SYSCALL(unlink)
    4243:	b8 12 00 00 00       	mov    $0x12,%eax
    4248:	cd 40                	int    $0x40
    424a:	c3                   	ret    

0000424b <fstat>:
SYSCALL(fstat)
    424b:	b8 08 00 00 00       	mov    $0x8,%eax
    4250:	cd 40                	int    $0x40
    4252:	c3                   	ret    

00004253 <link>:
SYSCALL(link)
    4253:	b8 13 00 00 00       	mov    $0x13,%eax
    4258:	cd 40                	int    $0x40
    425a:	c3                   	ret    

0000425b <mkdir>:
SYSCALL(mkdir)
    425b:	b8 14 00 00 00       	mov    $0x14,%eax
    4260:	cd 40                	int    $0x40
    4262:	c3                   	ret    

00004263 <chdir>:
SYSCALL(chdir)
    4263:	b8 09 00 00 00       	mov    $0x9,%eax
    4268:	cd 40                	int    $0x40
    426a:	c3                   	ret    

0000426b <dup>:
SYSCALL(dup)
    426b:	b8 0a 00 00 00       	mov    $0xa,%eax
    4270:	cd 40                	int    $0x40
    4272:	c3                   	ret    

00004273 <getpid>:
SYSCALL(getpid)
    4273:	b8 0b 00 00 00       	mov    $0xb,%eax
    4278:	cd 40                	int    $0x40
    427a:	c3                   	ret    

0000427b <sbrk>:
SYSCALL(sbrk)
    427b:	b8 0c 00 00 00       	mov    $0xc,%eax
    4280:	cd 40                	int    $0x40
    4282:	c3                   	ret    

00004283 <sleep>:
SYSCALL(sleep)
    4283:	b8 0d 00 00 00       	mov    $0xd,%eax
    4288:	cd 40                	int    $0x40
    428a:	c3                   	ret    

0000428b <uptime>:
SYSCALL(uptime)
    428b:	b8 0e 00 00 00       	mov    $0xe,%eax
    4290:	cd 40                	int    $0x40
    4292:	c3                   	ret    

00004293 <getMsg>:
SYSCALL(getMsg)
    4293:	b8 16 00 00 00       	mov    $0x16,%eax
    4298:	cd 40                	int    $0x40
    429a:	c3                   	ret    

0000429b <createWindow>:
SYSCALL(createWindow)
    429b:	b8 17 00 00 00       	mov    $0x17,%eax
    42a0:	cd 40                	int    $0x40
    42a2:	c3                   	ret    

000042a3 <destroyWindow>:
SYSCALL(destroyWindow)
    42a3:	b8 18 00 00 00       	mov    $0x18,%eax
    42a8:	cd 40                	int    $0x40
    42aa:	c3                   	ret    

000042ab <updateWindow>:
SYSCALL(updateWindow)
    42ab:	b8 19 00 00 00       	mov    $0x19,%eax
    42b0:	cd 40                	int    $0x40
    42b2:	c3                   	ret    

000042b3 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    42b3:	b8 1a 00 00 00       	mov    $0x1a,%eax
    42b8:	cd 40                	int    $0x40
    42ba:	c3                   	ret    

000042bb <kwrite>:
SYSCALL(kwrite)
    42bb:	b8 1c 00 00 00       	mov    $0x1c,%eax
    42c0:	cd 40                	int    $0x40
    42c2:	c3                   	ret    

000042c3 <setSampleRate>:
SYSCALL(setSampleRate)
    42c3:	b8 1b 00 00 00       	mov    $0x1b,%eax
    42c8:	cd 40                	int    $0x40
    42ca:	c3                   	ret    

000042cb <pause>:
SYSCALL(pause)
    42cb:	b8 1d 00 00 00       	mov    $0x1d,%eax
    42d0:	cd 40                	int    $0x40
    42d2:	c3                   	ret    

000042d3 <wavdecode>:
SYSCALL(wavdecode)
    42d3:	b8 1e 00 00 00       	mov    $0x1e,%eax
    42d8:	cd 40                	int    $0x40
    42da:	c3                   	ret    

000042db <beginDecode>:
SYSCALL(beginDecode)
    42db:	b8 1f 00 00 00       	mov    $0x1f,%eax
    42e0:	cd 40                	int    $0x40
    42e2:	c3                   	ret    

000042e3 <waitForDecode>:
SYSCALL(waitForDecode)
    42e3:	b8 20 00 00 00       	mov    $0x20,%eax
    42e8:	cd 40                	int    $0x40
    42ea:	c3                   	ret    

000042eb <endDecode>:
SYSCALL(endDecode)
    42eb:	b8 21 00 00 00       	mov    $0x21,%eax
    42f0:	cd 40                	int    $0x40
    42f2:	c3                   	ret    

000042f3 <getCoreBuf>:
    42f3:	b8 22 00 00 00       	mov    $0x22,%eax
    42f8:	cd 40                	int    $0x40
    42fa:	c3                   	ret    

000042fb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    42fb:	55                   	push   %ebp
    42fc:	89 e5                	mov    %esp,%ebp
    42fe:	83 ec 18             	sub    $0x18,%esp
    4301:	8b 45 0c             	mov    0xc(%ebp),%eax
    4304:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    4307:	83 ec 04             	sub    $0x4,%esp
    430a:	6a 01                	push   $0x1
    430c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    430f:	50                   	push   %eax
    4310:	ff 75 08             	pushl  0x8(%ebp)
    4313:	e8 fb fe ff ff       	call   4213 <write>
    4318:	83 c4 10             	add    $0x10,%esp
}
    431b:	c9                   	leave  
    431c:	c3                   	ret    

0000431d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    431d:	55                   	push   %ebp
    431e:	89 e5                	mov    %esp,%ebp
    4320:	53                   	push   %ebx
    4321:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    4324:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    432b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    432f:	74 17                	je     4348 <printint+0x2b>
    4331:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4335:	79 11                	jns    4348 <printint+0x2b>
    neg = 1;
    4337:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    433e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4341:	f7 d8                	neg    %eax
    4343:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4346:	eb 06                	jmp    434e <printint+0x31>
  } else {
    x = xx;
    4348:	8b 45 0c             	mov    0xc(%ebp),%eax
    434b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    434e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    4355:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    4358:	8d 41 01             	lea    0x1(%ecx),%eax
    435b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    435e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4361:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4364:	ba 00 00 00 00       	mov    $0x0,%edx
    4369:	f7 f3                	div    %ebx
    436b:	89 d0                	mov    %edx,%eax
    436d:	0f b6 80 d8 f1 00 00 	movzbl 0xf1d8(%eax),%eax
    4374:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    4378:	8b 5d 10             	mov    0x10(%ebp),%ebx
    437b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    437e:	ba 00 00 00 00       	mov    $0x0,%edx
    4383:	f7 f3                	div    %ebx
    4385:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4388:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    438c:	75 c7                	jne    4355 <printint+0x38>
  if(neg)
    438e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4392:	74 0e                	je     43a2 <printint+0x85>
    buf[i++] = '-';
    4394:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4397:	8d 50 01             	lea    0x1(%eax),%edx
    439a:	89 55 f4             	mov    %edx,-0xc(%ebp)
    439d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    43a2:	eb 1d                	jmp    43c1 <printint+0xa4>
    putc(fd, buf[i]);
    43a4:	8d 55 dc             	lea    -0x24(%ebp),%edx
    43a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43aa:	01 d0                	add    %edx,%eax
    43ac:	0f b6 00             	movzbl (%eax),%eax
    43af:	0f be c0             	movsbl %al,%eax
    43b2:	83 ec 08             	sub    $0x8,%esp
    43b5:	50                   	push   %eax
    43b6:	ff 75 08             	pushl  0x8(%ebp)
    43b9:	e8 3d ff ff ff       	call   42fb <putc>
    43be:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    43c1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    43c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    43c9:	79 d9                	jns    43a4 <printint+0x87>
    putc(fd, buf[i]);
}
    43cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    43ce:	c9                   	leave  
    43cf:	c3                   	ret    

000043d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    43d0:	55                   	push   %ebp
    43d1:	89 e5                	mov    %esp,%ebp
    43d3:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    43d6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    43dd:	8d 45 0c             	lea    0xc(%ebp),%eax
    43e0:	83 c0 04             	add    $0x4,%eax
    43e3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    43e6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    43ed:	e9 59 01 00 00       	jmp    454b <printf+0x17b>
    c = fmt[i] & 0xff;
    43f2:	8b 55 0c             	mov    0xc(%ebp),%edx
    43f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43f8:	01 d0                	add    %edx,%eax
    43fa:	0f b6 00             	movzbl (%eax),%eax
    43fd:	0f be c0             	movsbl %al,%eax
    4400:	25 ff 00 00 00       	and    $0xff,%eax
    4405:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    4408:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    440c:	75 2c                	jne    443a <printf+0x6a>
      if(c == '%'){
    440e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4412:	75 0c                	jne    4420 <printf+0x50>
        state = '%';
    4414:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    441b:	e9 27 01 00 00       	jmp    4547 <printf+0x177>
      } else {
        putc(fd, c);
    4420:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4423:	0f be c0             	movsbl %al,%eax
    4426:	83 ec 08             	sub    $0x8,%esp
    4429:	50                   	push   %eax
    442a:	ff 75 08             	pushl  0x8(%ebp)
    442d:	e8 c9 fe ff ff       	call   42fb <putc>
    4432:	83 c4 10             	add    $0x10,%esp
    4435:	e9 0d 01 00 00       	jmp    4547 <printf+0x177>
      }
    } else if(state == '%'){
    443a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    443e:	0f 85 03 01 00 00    	jne    4547 <printf+0x177>
      if(c == 'd'){
    4444:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    4448:	75 1e                	jne    4468 <printf+0x98>
        printint(fd, *ap, 10, 1);
    444a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    444d:	8b 00                	mov    (%eax),%eax
    444f:	6a 01                	push   $0x1
    4451:	6a 0a                	push   $0xa
    4453:	50                   	push   %eax
    4454:	ff 75 08             	pushl  0x8(%ebp)
    4457:	e8 c1 fe ff ff       	call   431d <printint>
    445c:	83 c4 10             	add    $0x10,%esp
        ap++;
    445f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4463:	e9 d8 00 00 00       	jmp    4540 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    4468:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    446c:	74 06                	je     4474 <printf+0xa4>
    446e:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    4472:	75 1e                	jne    4492 <printf+0xc2>
        printint(fd, *ap, 16, 0);
    4474:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4477:	8b 00                	mov    (%eax),%eax
    4479:	6a 00                	push   $0x0
    447b:	6a 10                	push   $0x10
    447d:	50                   	push   %eax
    447e:	ff 75 08             	pushl  0x8(%ebp)
    4481:	e8 97 fe ff ff       	call   431d <printint>
    4486:	83 c4 10             	add    $0x10,%esp
        ap++;
    4489:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    448d:	e9 ae 00 00 00       	jmp    4540 <printf+0x170>
      } else if(c == 's'){
    4492:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    4496:	75 43                	jne    44db <printf+0x10b>
        s = (char*)*ap;
    4498:	8b 45 e8             	mov    -0x18(%ebp),%eax
    449b:	8b 00                	mov    (%eax),%eax
    449d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    44a0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    44a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    44a8:	75 07                	jne    44b1 <printf+0xe1>
          s = "(null)";
    44aa:	c7 45 f4 8b b1 00 00 	movl   $0xb18b,-0xc(%ebp)
        while(*s != 0){
    44b1:	eb 1c                	jmp    44cf <printf+0xff>
          putc(fd, *s);
    44b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44b6:	0f b6 00             	movzbl (%eax),%eax
    44b9:	0f be c0             	movsbl %al,%eax
    44bc:	83 ec 08             	sub    $0x8,%esp
    44bf:	50                   	push   %eax
    44c0:	ff 75 08             	pushl  0x8(%ebp)
    44c3:	e8 33 fe ff ff       	call   42fb <putc>
    44c8:	83 c4 10             	add    $0x10,%esp
          s++;
    44cb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    44cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44d2:	0f b6 00             	movzbl (%eax),%eax
    44d5:	84 c0                	test   %al,%al
    44d7:	75 da                	jne    44b3 <printf+0xe3>
    44d9:	eb 65                	jmp    4540 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    44db:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    44df:	75 1d                	jne    44fe <printf+0x12e>
        putc(fd, *ap);
    44e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    44e4:	8b 00                	mov    (%eax),%eax
    44e6:	0f be c0             	movsbl %al,%eax
    44e9:	83 ec 08             	sub    $0x8,%esp
    44ec:	50                   	push   %eax
    44ed:	ff 75 08             	pushl  0x8(%ebp)
    44f0:	e8 06 fe ff ff       	call   42fb <putc>
    44f5:	83 c4 10             	add    $0x10,%esp
        ap++;
    44f8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    44fc:	eb 42                	jmp    4540 <printf+0x170>
      } else if(c == '%'){
    44fe:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4502:	75 17                	jne    451b <printf+0x14b>
        putc(fd, c);
    4504:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4507:	0f be c0             	movsbl %al,%eax
    450a:	83 ec 08             	sub    $0x8,%esp
    450d:	50                   	push   %eax
    450e:	ff 75 08             	pushl  0x8(%ebp)
    4511:	e8 e5 fd ff ff       	call   42fb <putc>
    4516:	83 c4 10             	add    $0x10,%esp
    4519:	eb 25                	jmp    4540 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    451b:	83 ec 08             	sub    $0x8,%esp
    451e:	6a 25                	push   $0x25
    4520:	ff 75 08             	pushl  0x8(%ebp)
    4523:	e8 d3 fd ff ff       	call   42fb <putc>
    4528:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    452b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    452e:	0f be c0             	movsbl %al,%eax
    4531:	83 ec 08             	sub    $0x8,%esp
    4534:	50                   	push   %eax
    4535:	ff 75 08             	pushl  0x8(%ebp)
    4538:	e8 be fd ff ff       	call   42fb <putc>
    453d:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    4540:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4547:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    454b:	8b 55 0c             	mov    0xc(%ebp),%edx
    454e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4551:	01 d0                	add    %edx,%eax
    4553:	0f b6 00             	movzbl (%eax),%eax
    4556:	84 c0                	test   %al,%al
    4558:	0f 85 94 fe ff ff    	jne    43f2 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    455e:	c9                   	leave  
    455f:	c3                   	ret    

00004560 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4560:	55                   	push   %ebp
    4561:	89 e5                	mov    %esp,%ebp
    4563:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4566:	8b 45 08             	mov    0x8(%ebp),%eax
    4569:	83 e8 08             	sub    $0x8,%eax
    456c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    456f:	a1 98 f7 00 00       	mov    0xf798,%eax
    4574:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4577:	eb 24                	jmp    459d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4579:	8b 45 fc             	mov    -0x4(%ebp),%eax
    457c:	8b 00                	mov    (%eax),%eax
    457e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4581:	77 12                	ja     4595 <free+0x35>
    4583:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4586:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4589:	77 24                	ja     45af <free+0x4f>
    458b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    458e:	8b 00                	mov    (%eax),%eax
    4590:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4593:	77 1a                	ja     45af <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4595:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4598:	8b 00                	mov    (%eax),%eax
    459a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    459d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45a0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    45a3:	76 d4                	jbe    4579 <free+0x19>
    45a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45a8:	8b 00                	mov    (%eax),%eax
    45aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    45ad:	76 ca                	jbe    4579 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    45af:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45b2:	8b 40 04             	mov    0x4(%eax),%eax
    45b5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    45bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45bf:	01 c2                	add    %eax,%edx
    45c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45c4:	8b 00                	mov    (%eax),%eax
    45c6:	39 c2                	cmp    %eax,%edx
    45c8:	75 24                	jne    45ee <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    45ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45cd:	8b 50 04             	mov    0x4(%eax),%edx
    45d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45d3:	8b 00                	mov    (%eax),%eax
    45d5:	8b 40 04             	mov    0x4(%eax),%eax
    45d8:	01 c2                	add    %eax,%edx
    45da:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45dd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    45e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45e3:	8b 00                	mov    (%eax),%eax
    45e5:	8b 10                	mov    (%eax),%edx
    45e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45ea:	89 10                	mov    %edx,(%eax)
    45ec:	eb 0a                	jmp    45f8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    45ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45f1:	8b 10                	mov    (%eax),%edx
    45f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45f6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    45f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45fb:	8b 40 04             	mov    0x4(%eax),%eax
    45fe:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4605:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4608:	01 d0                	add    %edx,%eax
    460a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    460d:	75 20                	jne    462f <free+0xcf>
    p->s.size += bp->s.size;
    460f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4612:	8b 50 04             	mov    0x4(%eax),%edx
    4615:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4618:	8b 40 04             	mov    0x4(%eax),%eax
    461b:	01 c2                	add    %eax,%edx
    461d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4620:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4623:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4626:	8b 10                	mov    (%eax),%edx
    4628:	8b 45 fc             	mov    -0x4(%ebp),%eax
    462b:	89 10                	mov    %edx,(%eax)
    462d:	eb 08                	jmp    4637 <free+0xd7>
  } else
    p->s.ptr = bp;
    462f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4632:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4635:	89 10                	mov    %edx,(%eax)
  freep = p;
    4637:	8b 45 fc             	mov    -0x4(%ebp),%eax
    463a:	a3 98 f7 00 00       	mov    %eax,0xf798
}
    463f:	c9                   	leave  
    4640:	c3                   	ret    

00004641 <morecore>:

static Header*
morecore(uint nu)
{
    4641:	55                   	push   %ebp
    4642:	89 e5                	mov    %esp,%ebp
    4644:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4647:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    464e:	77 07                	ja     4657 <morecore+0x16>
    nu = 4096;
    4650:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4657:	8b 45 08             	mov    0x8(%ebp),%eax
    465a:	c1 e0 03             	shl    $0x3,%eax
    465d:	83 ec 0c             	sub    $0xc,%esp
    4660:	50                   	push   %eax
    4661:	e8 15 fc ff ff       	call   427b <sbrk>
    4666:	83 c4 10             	add    $0x10,%esp
    4669:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    466c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4670:	75 07                	jne    4679 <morecore+0x38>
    return 0;
    4672:	b8 00 00 00 00       	mov    $0x0,%eax
    4677:	eb 26                	jmp    469f <morecore+0x5e>
  hp = (Header*)p;
    4679:	8b 45 f4             	mov    -0xc(%ebp),%eax
    467c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    467f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4682:	8b 55 08             	mov    0x8(%ebp),%edx
    4685:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4688:	8b 45 f0             	mov    -0x10(%ebp),%eax
    468b:	83 c0 08             	add    $0x8,%eax
    468e:	83 ec 0c             	sub    $0xc,%esp
    4691:	50                   	push   %eax
    4692:	e8 c9 fe ff ff       	call   4560 <free>
    4697:	83 c4 10             	add    $0x10,%esp
  return freep;
    469a:	a1 98 f7 00 00       	mov    0xf798,%eax
}
    469f:	c9                   	leave  
    46a0:	c3                   	ret    

000046a1 <malloc>:

void*
malloc(uint nbytes)
{
    46a1:	55                   	push   %ebp
    46a2:	89 e5                	mov    %esp,%ebp
    46a4:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    46a7:	8b 45 08             	mov    0x8(%ebp),%eax
    46aa:	83 c0 07             	add    $0x7,%eax
    46ad:	c1 e8 03             	shr    $0x3,%eax
    46b0:	83 c0 01             	add    $0x1,%eax
    46b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    46b6:	a1 98 f7 00 00       	mov    0xf798,%eax
    46bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    46be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    46c2:	75 23                	jne    46e7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    46c4:	c7 45 f0 90 f7 00 00 	movl   $0xf790,-0x10(%ebp)
    46cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46ce:	a3 98 f7 00 00       	mov    %eax,0xf798
    46d3:	a1 98 f7 00 00       	mov    0xf798,%eax
    46d8:	a3 90 f7 00 00       	mov    %eax,0xf790
    base.s.size = 0;
    46dd:	c7 05 94 f7 00 00 00 	movl   $0x0,0xf794
    46e4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    46e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46ea:	8b 00                	mov    (%eax),%eax
    46ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    46ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46f2:	8b 40 04             	mov    0x4(%eax),%eax
    46f5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    46f8:	72 4d                	jb     4747 <malloc+0xa6>
      if(p->s.size == nunits)
    46fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46fd:	8b 40 04             	mov    0x4(%eax),%eax
    4700:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4703:	75 0c                	jne    4711 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    4705:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4708:	8b 10                	mov    (%eax),%edx
    470a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    470d:	89 10                	mov    %edx,(%eax)
    470f:	eb 26                	jmp    4737 <malloc+0x96>
      else {
        p->s.size -= nunits;
    4711:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4714:	8b 40 04             	mov    0x4(%eax),%eax
    4717:	2b 45 ec             	sub    -0x14(%ebp),%eax
    471a:	89 c2                	mov    %eax,%edx
    471c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    471f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    4722:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4725:	8b 40 04             	mov    0x4(%eax),%eax
    4728:	c1 e0 03             	shl    $0x3,%eax
    472b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    472e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4731:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4734:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    4737:	8b 45 f0             	mov    -0x10(%ebp),%eax
    473a:	a3 98 f7 00 00       	mov    %eax,0xf798
      return (void*)(p + 1);
    473f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4742:	83 c0 08             	add    $0x8,%eax
    4745:	eb 3b                	jmp    4782 <malloc+0xe1>
    }
    if(p == freep)
    4747:	a1 98 f7 00 00       	mov    0xf798,%eax
    474c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    474f:	75 1e                	jne    476f <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    4751:	83 ec 0c             	sub    $0xc,%esp
    4754:	ff 75 ec             	pushl  -0x14(%ebp)
    4757:	e8 e5 fe ff ff       	call   4641 <morecore>
    475c:	83 c4 10             	add    $0x10,%esp
    475f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4762:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4766:	75 07                	jne    476f <malloc+0xce>
        return 0;
    4768:	b8 00 00 00 00       	mov    $0x0,%eax
    476d:	eb 13                	jmp    4782 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    476f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4772:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4775:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4778:	8b 00                	mov    (%eax),%eax
    477a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    477d:	e9 6d ff ff ff       	jmp    46ef <malloc+0x4e>
}
    4782:	c9                   	leave  
    4783:	c3                   	ret    

00004784 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    4784:	55                   	push   %ebp
    4785:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    4787:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    478b:	79 07                	jns    4794 <abs+0x10>
		return x * -1;
    478d:	8b 45 08             	mov    0x8(%ebp),%eax
    4790:	f7 d8                	neg    %eax
    4792:	eb 03                	jmp    4797 <abs+0x13>
	else
		return x;
    4794:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4797:	5d                   	pop    %ebp
    4798:	c3                   	ret    

00004799 <sin>:
double sin(double x)  
{  
    4799:	55                   	push   %ebp
    479a:	89 e5                	mov    %esp,%ebp
    479c:	83 ec 40             	sub    $0x40,%esp
    479f:	8b 45 08             	mov    0x8(%ebp),%eax
    47a2:	89 45 c8             	mov    %eax,-0x38(%ebp)
    47a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    47a8:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    47ab:	dd 45 c8             	fldl   -0x38(%ebp)
    47ae:	dd 5d f8             	fstpl  -0x8(%ebp)
    47b1:	d9 e8                	fld1   
    47b3:	dd 5d f0             	fstpl  -0x10(%ebp)
    47b6:	dd 45 c8             	fldl   -0x38(%ebp)
    47b9:	dd 5d e8             	fstpl  -0x18(%ebp)
    47bc:	dd 45 c8             	fldl   -0x38(%ebp)
    47bf:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    47c2:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    47c9:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    47d0:	eb 50                	jmp    4822 <sin+0x89>
	{  
		n = n+1;  
    47d2:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    47d6:	db 45 dc             	fildl  -0x24(%ebp)
    47d9:	dc 4d f0             	fmull  -0x10(%ebp)
    47dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47df:	83 c0 01             	add    $0x1,%eax
    47e2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    47e5:	db 45 c4             	fildl  -0x3c(%ebp)
    47e8:	de c9                	fmulp  %st,%st(1)
    47ea:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    47ed:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    47f1:	dd 45 c8             	fldl   -0x38(%ebp)
    47f4:	dc 4d c8             	fmull  -0x38(%ebp)
    47f7:	dd 45 e8             	fldl   -0x18(%ebp)
    47fa:	de c9                	fmulp  %st,%st(1)
    47fc:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    47ff:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    4802:	dd 45 e8             	fldl   -0x18(%ebp)
    4805:	dc 75 f0             	fdivl  -0x10(%ebp)
    4808:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    480b:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    480f:	7e 08                	jle    4819 <sin+0x80>
    4811:	dd 45 f8             	fldl   -0x8(%ebp)
    4814:	dc 45 e0             	faddl  -0x20(%ebp)
    4817:	eb 06                	jmp    481f <sin+0x86>
    4819:	dd 45 f8             	fldl   -0x8(%ebp)
    481c:	dc 65 e0             	fsubl  -0x20(%ebp)
    481f:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    4822:	dd 45 e0             	fldl   -0x20(%ebp)
    4825:	dd 05 98 b1 00 00    	fldl   0xb198
    482b:	d9 c9                	fxch   %st(1)
    482d:	df e9                	fucomip %st(1),%st
    482f:	dd d8                	fstp   %st(0)
    4831:	77 9f                	ja     47d2 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    4833:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    4836:	c9                   	leave  
    4837:	c3                   	ret    

00004838 <cos>:
double cos(double x)  
{  
    4838:	55                   	push   %ebp
    4839:	89 e5                	mov    %esp,%ebp
    483b:	83 ec 08             	sub    $0x8,%esp
    483e:	8b 45 08             	mov    0x8(%ebp),%eax
    4841:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4844:	8b 45 0c             	mov    0xc(%ebp),%eax
    4847:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    484a:	dd 05 a0 b1 00 00    	fldl   0xb1a0
    4850:	dc 65 f8             	fsubl  -0x8(%ebp)
    4853:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4857:	dd 1c 24             	fstpl  (%esp)
    485a:	e8 3a ff ff ff       	call   4799 <sin>
    485f:	83 c4 08             	add    $0x8,%esp
}  
    4862:	c9                   	leave  
    4863:	c3                   	ret    

00004864 <tan>:
double tan(double x)  
{  
    4864:	55                   	push   %ebp
    4865:	89 e5                	mov    %esp,%ebp
    4867:	83 ec 10             	sub    $0x10,%esp
    486a:	8b 45 08             	mov    0x8(%ebp),%eax
    486d:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4870:	8b 45 0c             	mov    0xc(%ebp),%eax
    4873:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    4876:	ff 75 fc             	pushl  -0x4(%ebp)
    4879:	ff 75 f8             	pushl  -0x8(%ebp)
    487c:	e8 18 ff ff ff       	call   4799 <sin>
    4881:	83 c4 08             	add    $0x8,%esp
    4884:	dd 5d f0             	fstpl  -0x10(%ebp)
    4887:	ff 75 fc             	pushl  -0x4(%ebp)
    488a:	ff 75 f8             	pushl  -0x8(%ebp)
    488d:	e8 a6 ff ff ff       	call   4838 <cos>
    4892:	83 c4 08             	add    $0x8,%esp
    4895:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    4898:	c9                   	leave  
    4899:	c3                   	ret    

0000489a <pow>:

double pow(double x, double y)
{
    489a:	55                   	push   %ebp
    489b:	89 e5                	mov    %esp,%ebp
    489d:	83 ec 38             	sub    $0x38,%esp
    48a0:	8b 45 08             	mov    0x8(%ebp),%eax
    48a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    48a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    48a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    48ac:	8b 45 10             	mov    0x10(%ebp),%eax
    48af:	89 45 d8             	mov    %eax,-0x28(%ebp)
    48b2:	8b 45 14             	mov    0x14(%ebp),%eax
    48b5:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    48b8:	dd 45 e0             	fldl   -0x20(%ebp)
    48bb:	d9 ee                	fldz   
    48bd:	df e9                	fucomip %st(1),%st
    48bf:	dd d8                	fstp   %st(0)
    48c1:	7a 28                	jp     48eb <pow+0x51>
    48c3:	dd 45 e0             	fldl   -0x20(%ebp)
    48c6:	d9 ee                	fldz   
    48c8:	df e9                	fucomip %st(1),%st
    48ca:	dd d8                	fstp   %st(0)
    48cc:	75 1d                	jne    48eb <pow+0x51>
    48ce:	dd 45 d8             	fldl   -0x28(%ebp)
    48d1:	d9 ee                	fldz   
    48d3:	df e9                	fucomip %st(1),%st
    48d5:	dd d8                	fstp   %st(0)
    48d7:	7a 0b                	jp     48e4 <pow+0x4a>
    48d9:	dd 45 d8             	fldl   -0x28(%ebp)
    48dc:	d9 ee                	fldz   
    48de:	df e9                	fucomip %st(1),%st
    48e0:	dd d8                	fstp   %st(0)
    48e2:	74 07                	je     48eb <pow+0x51>
    48e4:	d9 ee                	fldz   
    48e6:	e9 3a 01 00 00       	jmp    4a25 <pow+0x18b>
	else if(x==0 && y==0) return 1;
    48eb:	dd 45 e0             	fldl   -0x20(%ebp)
    48ee:	d9 ee                	fldz   
    48f0:	df e9                	fucomip %st(1),%st
    48f2:	dd d8                	fstp   %st(0)
    48f4:	7a 28                	jp     491e <pow+0x84>
    48f6:	dd 45 e0             	fldl   -0x20(%ebp)
    48f9:	d9 ee                	fldz   
    48fb:	df e9                	fucomip %st(1),%st
    48fd:	dd d8                	fstp   %st(0)
    48ff:	75 1d                	jne    491e <pow+0x84>
    4901:	dd 45 d8             	fldl   -0x28(%ebp)
    4904:	d9 ee                	fldz   
    4906:	df e9                	fucomip %st(1),%st
    4908:	dd d8                	fstp   %st(0)
    490a:	7a 12                	jp     491e <pow+0x84>
    490c:	dd 45 d8             	fldl   -0x28(%ebp)
    490f:	d9 ee                	fldz   
    4911:	df e9                	fucomip %st(1),%st
    4913:	dd d8                	fstp   %st(0)
    4915:	75 07                	jne    491e <pow+0x84>
    4917:	d9 e8                	fld1   
    4919:	e9 07 01 00 00       	jmp    4a25 <pow+0x18b>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    491e:	d9 ee                	fldz   
    4920:	dd 45 d8             	fldl   -0x28(%ebp)
    4923:	d9 c9                	fxch   %st(1)
    4925:	df e9                	fucomip %st(1),%st
    4927:	dd d8                	fstp   %st(0)
    4929:	76 23                	jbe    494e <pow+0xb4>
    492b:	dd 45 d8             	fldl   -0x28(%ebp)
    492e:	d9 e0                	fchs   
    4930:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4934:	dd 1c 24             	fstpl  (%esp)
    4937:	ff 75 e4             	pushl  -0x1c(%ebp)
    493a:	ff 75 e0             	pushl  -0x20(%ebp)
    493d:	e8 58 ff ff ff       	call   489a <pow>
    4942:	83 c4 10             	add    $0x10,%esp
    4945:	d9 e8                	fld1   
    4947:	de f1                	fdivp  %st,%st(1)
    4949:	e9 d7 00 00 00       	jmp    4a25 <pow+0x18b>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    494e:	d9 ee                	fldz   
    4950:	dd 45 e0             	fldl   -0x20(%ebp)
    4953:	d9 c9                	fxch   %st(1)
    4955:	df e9                	fucomip %st(1),%st
    4957:	dd d8                	fstp   %st(0)
    4959:	76 3a                	jbe    4995 <pow+0xfb>
    495b:	dd 45 d8             	fldl   -0x28(%ebp)
    495e:	d9 7d d6             	fnstcw -0x2a(%ebp)
    4961:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4965:	b4 0c                	mov    $0xc,%ah
    4967:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    496b:	d9 6d d4             	fldcw  -0x2c(%ebp)
    496e:	db 5d cc             	fistpl -0x34(%ebp)
    4971:	d9 6d d6             	fldcw  -0x2a(%ebp)
    4974:	db 45 cc             	fildl  -0x34(%ebp)
    4977:	dd 45 d8             	fldl   -0x28(%ebp)
    497a:	de e1                	fsubp  %st,%st(1)
    497c:	d9 ee                	fldz   
    497e:	df e9                	fucomip %st(1),%st
    4980:	7a 0a                	jp     498c <pow+0xf2>
    4982:	d9 ee                	fldz   
    4984:	df e9                	fucomip %st(1),%st
    4986:	dd d8                	fstp   %st(0)
    4988:	74 0b                	je     4995 <pow+0xfb>
    498a:	eb 02                	jmp    498e <pow+0xf4>
    498c:	dd d8                	fstp   %st(0)
    498e:	d9 ee                	fldz   
    4990:	e9 90 00 00 00       	jmp    4a25 <pow+0x18b>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    4995:	d9 ee                	fldz   
    4997:	dd 45 e0             	fldl   -0x20(%ebp)
    499a:	d9 c9                	fxch   %st(1)
    499c:	df e9                	fucomip %st(1),%st
    499e:	dd d8                	fstp   %st(0)
    49a0:	76 5d                	jbe    49ff <pow+0x165>
    49a2:	dd 45 d8             	fldl   -0x28(%ebp)
    49a5:	d9 7d d6             	fnstcw -0x2a(%ebp)
    49a8:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    49ac:	b4 0c                	mov    $0xc,%ah
    49ae:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    49b2:	d9 6d d4             	fldcw  -0x2c(%ebp)
    49b5:	db 5d cc             	fistpl -0x34(%ebp)
    49b8:	d9 6d d6             	fldcw  -0x2a(%ebp)
    49bb:	db 45 cc             	fildl  -0x34(%ebp)
    49be:	dd 45 d8             	fldl   -0x28(%ebp)
    49c1:	de e1                	fsubp  %st,%st(1)
    49c3:	d9 ee                	fldz   
    49c5:	df e9                	fucomip %st(1),%st
    49c7:	7a 34                	jp     49fd <pow+0x163>
    49c9:	d9 ee                	fldz   
    49cb:	df e9                	fucomip %st(1),%st
    49cd:	dd d8                	fstp   %st(0)
    49cf:	75 2e                	jne    49ff <pow+0x165>
	{
		double powint=1;
    49d1:	d9 e8                	fld1   
    49d3:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    49d6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    49dd:	eb 0d                	jmp    49ec <pow+0x152>
    49df:	dd 45 f0             	fldl   -0x10(%ebp)
    49e2:	dc 4d e0             	fmull  -0x20(%ebp)
    49e5:	dd 5d f0             	fstpl  -0x10(%ebp)
    49e8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    49ec:	db 45 ec             	fildl  -0x14(%ebp)
    49ef:	dd 45 d8             	fldl   -0x28(%ebp)
    49f2:	df e9                	fucomip %st(1),%st
    49f4:	dd d8                	fstp   %st(0)
    49f6:	73 e7                	jae    49df <pow+0x145>
		return powint;
    49f8:	dd 45 f0             	fldl   -0x10(%ebp)
    49fb:	eb 28                	jmp    4a25 <pow+0x18b>
    49fd:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    49ff:	83 ec 08             	sub    $0x8,%esp
    4a02:	ff 75 e4             	pushl  -0x1c(%ebp)
    4a05:	ff 75 e0             	pushl  -0x20(%ebp)
    4a08:	e8 49 00 00 00       	call   4a56 <ln>
    4a0d:	83 c4 10             	add    $0x10,%esp
    4a10:	dc 4d d8             	fmull  -0x28(%ebp)
    4a13:	83 ec 08             	sub    $0x8,%esp
    4a16:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4a1a:	dd 1c 24             	fstpl  (%esp)
    4a1d:	e8 2a 02 00 00       	call   4c4c <exp>
    4a22:	83 c4 10             	add    $0x10,%esp
}
    4a25:	c9                   	leave  
    4a26:	c3                   	ret    

00004a27 <sqrt>:
// 求根
double sqrt(double x)
{
    4a27:	55                   	push   %ebp
    4a28:	89 e5                	mov    %esp,%ebp
    4a2a:	83 ec 18             	sub    $0x18,%esp
    4a2d:	8b 45 08             	mov    0x8(%ebp),%eax
    4a30:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4a33:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a36:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    4a39:	dd 05 a8 b1 00 00    	fldl   0xb1a8
    4a3f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4a43:	dd 1c 24             	fstpl  (%esp)
    4a46:	ff 75 f4             	pushl  -0xc(%ebp)
    4a49:	ff 75 f0             	pushl  -0x10(%ebp)
    4a4c:	e8 49 fe ff ff       	call   489a <pow>
    4a51:	83 c4 10             	add    $0x10,%esp
}
    4a54:	c9                   	leave  
    4a55:	c3                   	ret    

00004a56 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    4a56:	55                   	push   %ebp
    4a57:	89 e5                	mov    %esp,%ebp
    4a59:	83 ec 78             	sub    $0x78,%esp
    4a5c:	8b 45 08             	mov    0x8(%ebp),%eax
    4a5f:	89 45 90             	mov    %eax,-0x70(%ebp)
    4a62:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a65:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    4a68:	dd 45 90             	fldl   -0x70(%ebp)
    4a6b:	d9 e8                	fld1   
    4a6d:	de e9                	fsubrp %st,%st(1)
    4a6f:	dd 5d c0             	fstpl  -0x40(%ebp)
    4a72:	d9 ee                	fldz   
    4a74:	dd 5d f0             	fstpl  -0x10(%ebp)
    4a77:	d9 ee                	fldz   
    4a79:	dd 5d b8             	fstpl  -0x48(%ebp)
    4a7c:	d9 ee                	fldz   
    4a7e:	dd 5d b0             	fstpl  -0x50(%ebp)
    4a81:	d9 ee                	fldz   
    4a83:	dd 5d e8             	fstpl  -0x18(%ebp)
    4a86:	d9 e8                	fld1   
    4a88:	dd 5d e0             	fstpl  -0x20(%ebp)
    4a8b:	d9 e8                	fld1   
    4a8d:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    4a90:	dd 45 90             	fldl   -0x70(%ebp)
    4a93:	d9 e8                	fld1   
    4a95:	df e9                	fucomip %st(1),%st
    4a97:	dd d8                	fstp   %st(0)
    4a99:	7a 12                	jp     4aad <ln+0x57>
    4a9b:	dd 45 90             	fldl   -0x70(%ebp)
    4a9e:	d9 e8                	fld1   
    4aa0:	df e9                	fucomip %st(1),%st
    4aa2:	dd d8                	fstp   %st(0)
    4aa4:	75 07                	jne    4aad <ln+0x57>
    4aa6:	d9 ee                	fldz   
    4aa8:	e9 9d 01 00 00       	jmp    4c4a <ln+0x1f4>
	else if(x>2) return -ln(1/x);
    4aad:	dd 45 90             	fldl   -0x70(%ebp)
    4ab0:	dd 05 b0 b1 00 00    	fldl   0xb1b0
    4ab6:	d9 c9                	fxch   %st(1)
    4ab8:	df e9                	fucomip %st(1),%st
    4aba:	dd d8                	fstp   %st(0)
    4abc:	76 1e                	jbe    4adc <ln+0x86>
    4abe:	d9 e8                	fld1   
    4ac0:	dc 75 90             	fdivl  -0x70(%ebp)
    4ac3:	83 ec 08             	sub    $0x8,%esp
    4ac6:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4aca:	dd 1c 24             	fstpl  (%esp)
    4acd:	e8 84 ff ff ff       	call   4a56 <ln>
    4ad2:	83 c4 10             	add    $0x10,%esp
    4ad5:	d9 e0                	fchs   
    4ad7:	e9 6e 01 00 00       	jmp    4c4a <ln+0x1f4>
	else if(x<.1)
    4adc:	dd 05 b8 b1 00 00    	fldl   0xb1b8
    4ae2:	dd 45 90             	fldl   -0x70(%ebp)
    4ae5:	d9 c9                	fxch   %st(1)
    4ae7:	df e9                	fucomip %st(1),%st
    4ae9:	dd d8                	fstp   %st(0)
    4aeb:	76 65                	jbe    4b52 <ln+0xfc>
	{
		double n=-1;
    4aed:	d9 e8                	fld1   
    4aef:	d9 e0                	fchs   
    4af1:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    4af4:	dd 45 c8             	fldl   -0x38(%ebp)
    4af7:	dd 05 c0 b1 00 00    	fldl   0xb1c0
    4afd:	de e9                	fsubrp %st,%st(1)
    4aff:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    4b02:	83 ec 08             	sub    $0x8,%esp
    4b05:	ff 75 cc             	pushl  -0x34(%ebp)
    4b08:	ff 75 c8             	pushl  -0x38(%ebp)
    4b0b:	e8 3c 01 00 00       	call   4c4c <exp>
    4b10:	83 c4 10             	add    $0x10,%esp
    4b13:	dd 45 90             	fldl   -0x70(%ebp)
    4b16:	de f1                	fdivp  %st,%st(1)
    4b18:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    4b1b:	dd 45 a0             	fldl   -0x60(%ebp)
    4b1e:	dd 05 b0 b1 00 00    	fldl   0xb1b0
    4b24:	d9 c9                	fxch   %st(1)
    4b26:	df e9                	fucomip %st(1),%st
    4b28:	dd d8                	fstp   %st(0)
    4b2a:	77 c8                	ja     4af4 <ln+0x9e>
    4b2c:	d9 e8                	fld1   
    4b2e:	dd 45 a0             	fldl   -0x60(%ebp)
    4b31:	d9 c9                	fxch   %st(1)
    4b33:	df e9                	fucomip %st(1),%st
    4b35:	dd d8                	fstp   %st(0)
    4b37:	77 bb                	ja     4af4 <ln+0x9e>
		return ln(a)+n;
    4b39:	83 ec 08             	sub    $0x8,%esp
    4b3c:	ff 75 a4             	pushl  -0x5c(%ebp)
    4b3f:	ff 75 a0             	pushl  -0x60(%ebp)
    4b42:	e8 0f ff ff ff       	call   4a56 <ln>
    4b47:	83 c4 10             	add    $0x10,%esp
    4b4a:	dc 45 c8             	faddl  -0x38(%ebp)
    4b4d:	e9 f8 00 00 00       	jmp    4c4a <ln+0x1f4>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4b52:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    4b59:	d9 e8                	fld1   
    4b5b:	dd 5d d8             	fstpl  -0x28(%ebp)
    4b5e:	e9 b6 00 00 00       	jmp    4c19 <ln+0x1c3>
	{
		ln_tmp=ln_px;
    4b63:	dd 45 e8             	fldl   -0x18(%ebp)
    4b66:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    4b69:	dd 45 d8             	fldl   -0x28(%ebp)
    4b6c:	dc 4d c0             	fmull  -0x40(%ebp)
    4b6f:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    4b72:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    4b76:	75 0d                	jne    4b85 <ln+0x12f>
    4b78:	db 45 d4             	fildl  -0x2c(%ebp)
    4b7b:	dd 45 d8             	fldl   -0x28(%ebp)
    4b7e:	de f1                	fdivp  %st,%st(1)
    4b80:	dd 5d d8             	fstpl  -0x28(%ebp)
    4b83:	eb 13                	jmp    4b98 <ln+0x142>
		else tmp=tmp/-l;
    4b85:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4b88:	f7 d8                	neg    %eax
    4b8a:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4b8d:	db 45 8c             	fildl  -0x74(%ebp)
    4b90:	dd 45 d8             	fldl   -0x28(%ebp)
    4b93:	de f1                	fdivp  %st,%st(1)
    4b95:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    4b98:	dd 45 f0             	fldl   -0x10(%ebp)
    4b9b:	dc 45 d8             	faddl  -0x28(%ebp)
    4b9e:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    4ba1:	dd 45 d8             	fldl   -0x28(%ebp)
    4ba4:	d9 e0                	fchs   
    4ba6:	dc 4d c0             	fmull  -0x40(%ebp)
    4ba9:	db 45 d4             	fildl  -0x2c(%ebp)
    4bac:	de c9                	fmulp  %st,%st(1)
    4bae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4bb1:	83 c0 01             	add    $0x1,%eax
    4bb4:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4bb7:	db 45 8c             	fildl  -0x74(%ebp)
    4bba:	de f9                	fdivrp %st,%st(1)
    4bbc:	dc 45 f0             	faddl  -0x10(%ebp)
    4bbf:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    4bc2:	dd 45 d8             	fldl   -0x28(%ebp)
    4bc5:	dc 4d c0             	fmull  -0x40(%ebp)
    4bc8:	dc 4d c0             	fmull  -0x40(%ebp)
    4bcb:	db 45 d4             	fildl  -0x2c(%ebp)
    4bce:	de c9                	fmulp  %st,%st(1)
    4bd0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4bd3:	83 c0 02             	add    $0x2,%eax
    4bd6:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4bd9:	db 45 8c             	fildl  -0x74(%ebp)
    4bdc:	de f9                	fdivrp %st,%st(1)
    4bde:	dc 45 b8             	faddl  -0x48(%ebp)
    4be1:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    4be4:	dd 45 b0             	fldl   -0x50(%ebp)
    4be7:	dc 65 b8             	fsubl  -0x48(%ebp)
    4bea:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    4bed:	dd 45 a8             	fldl   -0x58(%ebp)
    4bf0:	dc 4d a8             	fmull  -0x58(%ebp)
    4bf3:	dd 45 b8             	fldl   -0x48(%ebp)
    4bf6:	d8 c0                	fadd   %st(0),%st
    4bf8:	dd 45 b0             	fldl   -0x50(%ebp)
    4bfb:	de e1                	fsubp  %st,%st(1)
    4bfd:	dc 45 f0             	faddl  -0x10(%ebp)
    4c00:	de f9                	fdivrp %st,%st(1)
    4c02:	dd 45 b0             	fldl   -0x50(%ebp)
    4c05:	de e1                	fsubp  %st,%st(1)
    4c07:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    4c0a:	db 45 d4             	fildl  -0x2c(%ebp)
    4c0d:	dd 45 d8             	fldl   -0x28(%ebp)
    4c10:	de c9                	fmulp  %st,%st(1)
    4c12:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4c15:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    4c19:	dd 45 e8             	fldl   -0x18(%ebp)
    4c1c:	dc 65 e0             	fsubl  -0x20(%ebp)
    4c1f:	dd 05 c8 b1 00 00    	fldl   0xb1c8
    4c25:	d9 c9                	fxch   %st(1)
    4c27:	df e9                	fucomip %st(1),%st
    4c29:	dd d8                	fstp   %st(0)
    4c2b:	0f 87 32 ff ff ff    	ja     4b63 <ln+0x10d>
    4c31:	dd 45 e8             	fldl   -0x18(%ebp)
    4c34:	dc 65 e0             	fsubl  -0x20(%ebp)
    4c37:	dd 05 d0 b1 00 00    	fldl   0xb1d0
    4c3d:	df e9                	fucomip %st(1),%st
    4c3f:	dd d8                	fstp   %st(0)
    4c41:	0f 87 1c ff ff ff    	ja     4b63 <ln+0x10d>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    4c47:	dd 45 e8             	fldl   -0x18(%ebp)
}
    4c4a:	c9                   	leave  
    4c4b:	c3                   	ret    

00004c4c <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    4c4c:	55                   	push   %ebp
    4c4d:	89 e5                	mov    %esp,%ebp
    4c4f:	83 ec 68             	sub    $0x68,%esp
    4c52:	8b 45 08             	mov    0x8(%ebp),%eax
    4c55:	89 45 a0             	mov    %eax,-0x60(%ebp)
    4c58:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c5b:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    4c5e:	dd 45 a0             	fldl   -0x60(%ebp)
    4c61:	dd 5d c0             	fstpl  -0x40(%ebp)
    4c64:	d9 ee                	fldz   
    4c66:	dd 5d f0             	fstpl  -0x10(%ebp)
    4c69:	d9 ee                	fldz   
    4c6b:	dd 5d b8             	fstpl  -0x48(%ebp)
    4c6e:	d9 ee                	fldz   
    4c70:	dd 5d b0             	fstpl  -0x50(%ebp)
    4c73:	d9 ee                	fldz   
    4c75:	dd 5d e8             	fstpl  -0x18(%ebp)
    4c78:	d9 e8                	fld1   
    4c7a:	dd 5d e0             	fstpl  -0x20(%ebp)
    4c7d:	d9 e8                	fld1   
    4c7f:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    4c82:	dd 45 a0             	fldl   -0x60(%ebp)
    4c85:	d9 ee                	fldz   
    4c87:	df e9                	fucomip %st(1),%st
    4c89:	dd d8                	fstp   %st(0)
    4c8b:	7a 12                	jp     4c9f <exp+0x53>
    4c8d:	dd 45 a0             	fldl   -0x60(%ebp)
    4c90:	d9 ee                	fldz   
    4c92:	df e9                	fucomip %st(1),%st
    4c94:	dd d8                	fstp   %st(0)
    4c96:	75 07                	jne    4c9f <exp+0x53>
    4c98:	d9 e8                	fld1   
    4c9a:	e9 12 01 00 00       	jmp    4db1 <exp+0x165>
	if(x<0) return 1/exp(-x); 
    4c9f:	d9 ee                	fldz   
    4ca1:	dd 45 a0             	fldl   -0x60(%ebp)
    4ca4:	d9 c9                	fxch   %st(1)
    4ca6:	df e9                	fucomip %st(1),%st
    4ca8:	dd d8                	fstp   %st(0)
    4caa:	76 20                	jbe    4ccc <exp+0x80>
    4cac:	dd 45 a0             	fldl   -0x60(%ebp)
    4caf:	d9 e0                	fchs   
    4cb1:	83 ec 08             	sub    $0x8,%esp
    4cb4:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4cb8:	dd 1c 24             	fstpl  (%esp)
    4cbb:	e8 8c ff ff ff       	call   4c4c <exp>
    4cc0:	83 c4 10             	add    $0x10,%esp
    4cc3:	d9 e8                	fld1   
    4cc5:	de f1                	fdivp  %st,%st(1)
    4cc7:	e9 e5 00 00 00       	jmp    4db1 <exp+0x165>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4ccc:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    4cd3:	d9 e8                	fld1   
    4cd5:	dd 5d d0             	fstpl  -0x30(%ebp)
    4cd8:	e9 92 00 00 00       	jmp    4d6f <exp+0x123>
	{
		ex_tmp=ex_px;
    4cdd:	dd 45 e8             	fldl   -0x18(%ebp)
    4ce0:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    4ce3:	dd 45 d0             	fldl   -0x30(%ebp)
    4ce6:	dc 4d c0             	fmull  -0x40(%ebp)
    4ce9:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    4cec:	db 45 cc             	fildl  -0x34(%ebp)
    4cef:	dd 45 d0             	fldl   -0x30(%ebp)
    4cf2:	de f1                	fdivp  %st,%st(1)
    4cf4:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    4cf7:	dd 45 f0             	fldl   -0x10(%ebp)
    4cfa:	dc 45 d0             	faddl  -0x30(%ebp)
    4cfd:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    4d00:	dd 45 d0             	fldl   -0x30(%ebp)
    4d03:	dc 4d c0             	fmull  -0x40(%ebp)
    4d06:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4d09:	83 c0 01             	add    $0x1,%eax
    4d0c:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4d0f:	db 45 9c             	fildl  -0x64(%ebp)
    4d12:	de f9                	fdivrp %st,%st(1)
    4d14:	dc 45 f0             	faddl  -0x10(%ebp)
    4d17:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    4d1a:	dd 45 d0             	fldl   -0x30(%ebp)
    4d1d:	dc 4d c0             	fmull  -0x40(%ebp)
    4d20:	dc 4d c0             	fmull  -0x40(%ebp)
    4d23:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4d26:	83 c0 01             	add    $0x1,%eax
    4d29:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4d2c:	db 45 9c             	fildl  -0x64(%ebp)
    4d2f:	de f9                	fdivrp %st,%st(1)
    4d31:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4d34:	83 c0 02             	add    $0x2,%eax
    4d37:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4d3a:	db 45 9c             	fildl  -0x64(%ebp)
    4d3d:	de f9                	fdivrp %st,%st(1)
    4d3f:	dc 45 b8             	faddl  -0x48(%ebp)
    4d42:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    4d45:	dd 45 b0             	fldl   -0x50(%ebp)
    4d48:	dc 65 b8             	fsubl  -0x48(%ebp)
    4d4b:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    4d4e:	dd 45 d8             	fldl   -0x28(%ebp)
    4d51:	dc 4d d8             	fmull  -0x28(%ebp)
    4d54:	dd 45 b8             	fldl   -0x48(%ebp)
    4d57:	d8 c0                	fadd   %st(0),%st
    4d59:	dd 45 b0             	fldl   -0x50(%ebp)
    4d5c:	de e1                	fsubp  %st,%st(1)
    4d5e:	dc 45 f0             	faddl  -0x10(%ebp)
    4d61:	de f9                	fdivrp %st,%st(1)
    4d63:	dd 45 b0             	fldl   -0x50(%ebp)
    4d66:	de e1                	fsubp  %st,%st(1)
    4d68:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4d6b:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    4d6f:	dd 45 e8             	fldl   -0x18(%ebp)
    4d72:	dc 65 e0             	fsubl  -0x20(%ebp)
    4d75:	dd 05 d8 b1 00 00    	fldl   0xb1d8
    4d7b:	d9 c9                	fxch   %st(1)
    4d7d:	df e9                	fucomip %st(1),%st
    4d7f:	dd d8                	fstp   %st(0)
    4d81:	77 12                	ja     4d95 <exp+0x149>
    4d83:	dd 45 e8             	fldl   -0x18(%ebp)
    4d86:	dc 65 e0             	fsubl  -0x20(%ebp)
    4d89:	dd 05 e0 b1 00 00    	fldl   0xb1e0
    4d8f:	df e9                	fucomip %st(1),%st
    4d91:	dd d8                	fstp   %st(0)
    4d93:	76 15                	jbe    4daa <exp+0x15e>
    4d95:	dd 45 d8             	fldl   -0x28(%ebp)
    4d98:	dd 05 d8 b1 00 00    	fldl   0xb1d8
    4d9e:	d9 c9                	fxch   %st(1)
    4da0:	df e9                	fucomip %st(1),%st
    4da2:	dd d8                	fstp   %st(0)
    4da4:	0f 87 33 ff ff ff    	ja     4cdd <exp+0x91>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    4daa:	dd 45 e8             	fldl   -0x18(%ebp)
    4dad:	d9 e8                	fld1   
    4daf:	de c1                	faddp  %st,%st(1)
    4db1:	c9                   	leave  
    4db2:	c3                   	ret    

00004db3 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    4db3:	55                   	push   %ebp
    4db4:	89 e5                	mov    %esp,%ebp
    4db6:	83 ec 68             	sub    $0x68,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    4db9:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    4dbd:	83 ec 08             	sub    $0x8,%esp
    4dc0:	ff 75 08             	pushl  0x8(%ebp)
    4dc3:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4dc6:	50                   	push   %eax
    4dc7:	e8 f7 f1 ff ff       	call   3fc3 <strcpy>
    4dcc:	83 c4 10             	add    $0x10,%esp
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    4dcf:	83 ec 08             	sub    $0x8,%esp
    4dd2:	6a 02                	push   $0x2
    4dd4:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4dd7:	50                   	push   %eax
    4dd8:	e8 56 f4 ff ff       	call   4233 <open>
    4ddd:	83 c4 10             	add    $0x10,%esp
    4de0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4de3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4de7:	75 16                	jne    4dff <OpenTableFile+0x4c>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    4de9:	83 ec 04             	sub    $0x4,%esp
    4dec:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4def:	50                   	push   %eax
    4df0:	68 14 b2 00 00       	push   $0xb214
    4df5:	6a 00                	push   $0x0
    4df7:	e8 d4 f5 ff ff       	call   43d0 <printf>
    4dfc:	83 c4 10             	add    $0x10,%esp
    }
    return f;
    4dff:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4e02:	c9                   	leave  
    4e03:	c3                   	ret    

00004e04 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    4e04:	55                   	push   %ebp
    4e05:	89 e5                	mov    %esp,%ebp
    4e07:	57                   	push   %edi
    4e08:	56                   	push   %esi
    4e09:	53                   	push   %ebx
    4e0a:	83 ec 1c             	sub    $0x1c,%esp
	layer *info = fr_ps->header;
    4e0d:	8b 45 08             	mov    0x8(%ebp),%eax
    4e10:	8b 00                	mov    (%eax),%eax
    4e12:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4e15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e18:	8b 78 14             	mov    0x14(%eax),%edi
    4e1b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e1e:	8b 70 10             	mov    0x10(%eax),%esi
    4e21:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e24:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    4e27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e2a:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4e2d:	85 c0                	test   %eax,%eax
    4e2f:	0f 94 c0             	sete   %al
    4e32:	0f b6 c8             	movzbl %al,%ecx
    4e35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e38:	8b 50 04             	mov    0x4(%eax),%edx
    4e3b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e3e:	8b 00                	mov    (%eax),%eax
    4e40:	57                   	push   %edi
    4e41:	56                   	push   %esi
    4e42:	53                   	push   %ebx
    4e43:	51                   	push   %ecx
    4e44:	52                   	push   %edx
    4e45:	50                   	push   %eax
    4e46:	68 34 b2 00 00       	push   $0xb234
    4e4b:	6a 00                	push   $0x0
    4e4d:	e8 7e f5 ff ff       	call   43d0 <printf>
    4e52:	83 c4 20             	add    $0x20,%esp
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    4e55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e58:	8b 78 2c             	mov    0x2c(%eax),%edi
    4e5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e5e:	8b 70 28             	mov    0x28(%eax),%esi
    4e61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e64:	8b 58 24             	mov    0x24(%eax),%ebx
    4e67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e6a:	8b 48 20             	mov    0x20(%eax),%ecx
    4e6d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e70:	8b 50 1c             	mov    0x1c(%eax),%edx
    4e73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e76:	8b 40 18             	mov    0x18(%eax),%eax
    4e79:	57                   	push   %edi
    4e7a:	56                   	push   %esi
    4e7b:	53                   	push   %ebx
    4e7c:	51                   	push   %ecx
    4e7d:	52                   	push   %edx
    4e7e:	50                   	push   %eax
    4e7f:	68 74 b2 00 00       	push   $0xb274
    4e84:	6a 00                	push   $0x0
    4e86:	e8 45 f5 ff ff       	call   43d0 <printf>
    4e8b:	83 c4 20             	add    $0x20,%esp
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4e8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e91:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4e94:	8b 0c 85 20 f3 00 00 	mov    0xf320(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4e9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e9e:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4ea1:	dd 04 c5 00 f3 00 00 	fldl   0xf300(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4ea8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4eab:	8b 40 04             	mov    0x4(%eax),%eax
    4eae:	8d 50 ff             	lea    -0x1(%eax),%edx
    4eb1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4eb4:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4eb7:	89 d0                	mov    %edx,%eax
    4eb9:	c1 e0 04             	shl    $0x4,%eax
    4ebc:	29 d0                	sub    %edx,%eax
    4ebe:	01 d8                	add    %ebx,%eax
    4ec0:	8b 14 85 40 f2 00 00 	mov    0xf240(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4ec7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4eca:	8b 40 04             	mov    0x4(%eax),%eax
    4ecd:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4ed0:	8b 04 85 00 f2 00 00 	mov    0xf200(,%eax,4),%eax
    4ed7:	83 ec 04             	sub    $0x4,%esp
    4eda:	51                   	push   %ecx
    4edb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4edf:	dd 1c 24             	fstpl  (%esp)
    4ee2:	52                   	push   %edx
    4ee3:	50                   	push   %eax
    4ee4:	68 9c b2 00 00       	push   $0xb29c
    4ee9:	6a 00                	push   $0x0
    4eeb:	e8 e0 f4 ff ff       	call   43d0 <printf>
    4ef0:	83 c4 20             	add    $0x20,%esp
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    4ef3:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef6:	8b 48 08             	mov    0x8(%eax),%ecx
    4ef9:	8b 45 08             	mov    0x8(%ebp),%eax
    4efc:	8b 50 0c             	mov    0xc(%eax),%edx
    4eff:	8b 45 08             	mov    0x8(%ebp),%eax
    4f02:	8b 40 10             	mov    0x10(%eax),%eax
    4f05:	83 ec 0c             	sub    $0xc,%esp
    4f08:	51                   	push   %ecx
    4f09:	52                   	push   %edx
    4f0a:	50                   	push   %eax
    4f0b:	68 cb b2 00 00       	push   $0xb2cb
    4f10:	6a 00                	push   $0x0
    4f12:	e8 b9 f4 ff ff       	call   43d0 <printf>
    4f17:	83 c4 20             	add    $0x20,%esp
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    4f1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4f1d:	5b                   	pop    %ebx
    4f1e:	5e                   	pop    %esi
    4f1f:	5f                   	pop    %edi
    4f20:	5d                   	pop    %ebp
    4f21:	c3                   	ret    

00004f22 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    4f22:	55                   	push   %ebp
    4f23:	89 e5                	mov    %esp,%ebp
    4f25:	83 ec 18             	sub    $0x18,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    4f28:	83 ec 0c             	sub    $0xc,%esp
    4f2b:	ff 75 08             	pushl  0x8(%ebp)
    4f2e:	e8 6e f7 ff ff       	call   46a1 <malloc>
    4f33:	83 c4 10             	add    $0x10,%esp
    4f36:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    4f39:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4f3d:	74 15                	je     4f54 <mem_alloc+0x32>
		memset(ptr, 0, block);
    4f3f:	83 ec 04             	sub    $0x4,%esp
    4f42:	ff 75 08             	pushl  0x8(%ebp)
    4f45:	6a 00                	push   $0x0
    4f47:	ff 75 f4             	pushl  -0xc(%ebp)
    4f4a:	e8 0a f1 ff ff       	call   4059 <memset>
    4f4f:	83 c4 10             	add    $0x10,%esp
    4f52:	eb 1a                	jmp    4f6e <mem_alloc+0x4c>
	else{
		printf(0, "Unable to allocate %s\n", item);
    4f54:	83 ec 04             	sub    $0x4,%esp
    4f57:	ff 75 0c             	pushl  0xc(%ebp)
    4f5a:	68 e5 b2 00 00       	push   $0xb2e5
    4f5f:	6a 00                	push   $0x0
    4f61:	e8 6a f4 ff ff       	call   43d0 <printf>
    4f66:	83 c4 10             	add    $0x10,%esp
		exit();
    4f69:	e8 85 f2 ff ff       	call   41f3 <exit>
	}
	return ptr;
    4f6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4f71:	c9                   	leave  
    4f72:	c3                   	ret    

00004f73 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    4f73:	55                   	push   %ebp
    4f74:	89 e5                	mov    %esp,%ebp
    4f76:	83 ec 08             	sub    $0x8,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    4f79:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f7c:	83 ec 08             	sub    $0x8,%esp
    4f7f:	68 fc b2 00 00       	push   $0xb2fc
    4f84:	50                   	push   %eax
    4f85:	e8 98 ff ff ff       	call   4f22 <mem_alloc>
    4f8a:	83 c4 10             	add    $0x10,%esp
    4f8d:	89 c2                	mov    %eax,%edx
    4f8f:	8b 45 08             	mov    0x8(%ebp),%eax
    4f92:	89 50 04             	mov    %edx,0x4(%eax)
	bs->buf_size = size;
    4f95:	8b 45 08             	mov    0x8(%ebp),%eax
    4f98:	8b 55 0c             	mov    0xc(%ebp),%edx
    4f9b:	89 50 08             	mov    %edx,0x8(%eax)
}
    4f9e:	c9                   	leave  
    4f9f:	c3                   	ret    

00004fa0 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    4fa0:	55                   	push   %ebp
    4fa1:	89 e5                	mov    %esp,%ebp
    4fa3:	83 ec 08             	sub    $0x8,%esp
	free(bs->buf);
    4fa6:	8b 45 08             	mov    0x8(%ebp),%eax
    4fa9:	8b 40 04             	mov    0x4(%eax),%eax
    4fac:	83 ec 0c             	sub    $0xc,%esp
    4faf:	50                   	push   %eax
    4fb0:	e8 ab f5 ff ff       	call   4560 <free>
    4fb5:	83 c4 10             	add    $0x10,%esp
}
    4fb8:	c9                   	leave  
    4fb9:	c3                   	ret    

00004fba <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    4fba:	55                   	push   %ebp
    4fbb:	89 e5                	mov    %esp,%ebp
    4fbd:	83 ec 08             	sub    $0x8,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    4fc0:	83 ec 08             	sub    $0x8,%esp
    4fc3:	6a 02                	push   $0x2
    4fc5:	ff 75 0c             	pushl  0xc(%ebp)
    4fc8:	e8 66 f2 ff ff       	call   4233 <open>
    4fcd:	83 c4 10             	add    $0x10,%esp
    4fd0:	89 c2                	mov    %eax,%edx
    4fd2:	8b 45 08             	mov    0x8(%ebp),%eax
    4fd5:	89 10                	mov    %edx,(%eax)
    4fd7:	8b 45 08             	mov    0x8(%ebp),%eax
    4fda:	8b 00                	mov    (%eax),%eax
    4fdc:	83 f8 ff             	cmp    $0xffffffff,%eax
    4fdf:	75 1a                	jne    4ffb <open_bit_stream_r+0x41>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    4fe1:	83 ec 04             	sub    $0x4,%esp
    4fe4:	ff 75 0c             	pushl  0xc(%ebp)
    4fe7:	68 03 b3 00 00       	push   $0xb303
    4fec:	6a 00                	push   $0x0
    4fee:	e8 dd f3 ff ff       	call   43d0 <printf>
    4ff3:	83 c4 10             	add    $0x10,%esp
		exit();
    4ff6:	e8 f8 f1 ff ff       	call   41f3 <exit>
	}

	bs->format = BINARY;
    4ffb:	8b 45 08             	mov    0x8(%ebp),%eax
    4ffe:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    5002:	83 ec 08             	sub    $0x8,%esp
    5005:	ff 75 10             	pushl  0x10(%ebp)
    5008:	ff 75 08             	pushl  0x8(%ebp)
    500b:	e8 63 ff ff ff       	call   4f73 <alloc_buffer>
    5010:	83 c4 10             	add    $0x10,%esp
	bs->buf_byte_idx=0;
    5013:	8b 45 08             	mov    0x8(%ebp),%eax
    5016:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    501d:	8b 45 08             	mov    0x8(%ebp),%eax
    5020:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    5027:	8b 45 08             	mov    0x8(%ebp),%eax
    502a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    5031:	8b 45 08             	mov    0x8(%ebp),%eax
    5034:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    503b:	8b 45 08             	mov    0x8(%ebp),%eax
    503e:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    5045:	8b 45 08             	mov    0x8(%ebp),%eax
    5048:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    504f:	c9                   	leave  
    5050:	c3                   	ret    

00005051 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    5051:	55                   	push   %ebp
    5052:	89 e5                	mov    %esp,%ebp
    5054:	83 ec 08             	sub    $0x8,%esp
	close(bs->pt);
    5057:	8b 45 08             	mov    0x8(%ebp),%eax
    505a:	8b 00                	mov    (%eax),%eax
    505c:	83 ec 0c             	sub    $0xc,%esp
    505f:	50                   	push   %eax
    5060:	e8 b6 f1 ff ff       	call   421b <close>
    5065:	83 c4 10             	add    $0x10,%esp
	desalloc_buffer(bs);
    5068:	83 ec 0c             	sub    $0xc,%esp
    506b:	ff 75 08             	pushl  0x8(%ebp)
    506e:	e8 2d ff ff ff       	call   4fa0 <desalloc_buffer>
    5073:	83 c4 10             	add    $0x10,%esp
}
    5076:	c9                   	leave  
    5077:	c3                   	ret    

00005078 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    5078:	55                   	push   %ebp
    5079:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    507b:	8b 45 08             	mov    0x8(%ebp),%eax
    507e:	8b 40 20             	mov    0x20(%eax),%eax
}
    5081:	5d                   	pop    %ebp
    5082:	c3                   	ret    

00005083 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    5083:	55                   	push   %ebp
    5084:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    5086:	8b 45 08             	mov    0x8(%ebp),%eax
    5089:	8b 40 0c             	mov    0xc(%eax),%eax
}
    508c:	5d                   	pop    %ebp
    508d:	c3                   	ret    

0000508e <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    508e:	55                   	push   %ebp
    508f:	89 e5                	mov    %esp,%ebp
    5091:	56                   	push   %esi
    5092:	53                   	push   %ebx
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    5093:	8b 45 08             	mov    0x8(%ebp),%eax
    5096:	8b 40 08             	mov    0x8(%eax),%eax
    5099:	8d 50 fe             	lea    -0x2(%eax),%edx
    509c:	8b 45 08             	mov    0x8(%ebp),%eax
    509f:	8b 40 10             	mov    0x10(%eax),%eax
    50a2:	89 d3                	mov    %edx,%ebx
    50a4:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    50a6:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    50ab:	eb 30                	jmp    50dd <refill_buffer+0x4f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    50ad:	8b 45 08             	mov    0x8(%ebp),%eax
    50b0:	8b 50 04             	mov    0x4(%eax),%edx
    50b3:	89 d8                	mov    %ebx,%eax
    50b5:	8d 58 ff             	lea    -0x1(%eax),%ebx
    50b8:	01 c2                	add    %eax,%edx
    50ba:	8b 45 08             	mov    0x8(%ebp),%eax
    50bd:	8b 00                	mov    (%eax),%eax
    50bf:	83 ec 04             	sub    $0x4,%esp
    50c2:	6a 01                	push   $0x1
    50c4:	52                   	push   %edx
    50c5:	50                   	push   %eax
    50c6:	e8 40 f1 ff ff       	call   420b <read>
    50cb:	83 c4 10             	add    $0x10,%esp
    50ce:	89 c6                	mov    %eax,%esi
		if (!n)
    50d0:	85 f6                	test   %esi,%esi
    50d2:	75 09                	jne    50dd <refill_buffer+0x4f>
		bs->eob= i+1;
    50d4:	8d 53 01             	lea    0x1(%ebx),%edx
    50d7:	8b 45 08             	mov    0x8(%ebp),%eax
    50da:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    50dd:	85 db                	test   %ebx,%ebx
    50df:	78 0a                	js     50eb <refill_buffer+0x5d>
    50e1:	8b 45 08             	mov    0x8(%ebp),%eax
    50e4:	8b 40 1c             	mov    0x1c(%eax),%eax
    50e7:	85 c0                	test   %eax,%eax
    50e9:	74 c2                	je     50ad <refill_buffer+0x1f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    50eb:	8d 65 f8             	lea    -0x8(%ebp),%esp
    50ee:	5b                   	pop    %ebx
    50ef:	5e                   	pop    %esi
    50f0:	5d                   	pop    %ebp
    50f1:	c3                   	ret    

000050f2 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    50f2:	55                   	push   %ebp
    50f3:	89 e5                	mov    %esp,%ebp
    50f5:	53                   	push   %ebx
    50f6:	83 ec 14             	sub    $0x14,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    50f9:	8b 45 08             	mov    0x8(%ebp),%eax
    50fc:	8b 40 0c             	mov    0xc(%eax),%eax
    50ff:	8d 50 01             	lea    0x1(%eax),%edx
    5102:	8b 45 08             	mov    0x8(%ebp),%eax
    5105:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    5108:	8b 45 08             	mov    0x8(%ebp),%eax
    510b:	8b 40 14             	mov    0x14(%eax),%eax
    510e:	85 c0                	test   %eax,%eax
    5110:	0f 85 a2 00 00 00    	jne    51b8 <get1bit+0xc6>
        bs->buf_bit_idx = 8;
    5116:	8b 45 08             	mov    0x8(%ebp),%eax
    5119:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    5120:	8b 45 08             	mov    0x8(%ebp),%eax
    5123:	8b 40 10             	mov    0x10(%eax),%eax
    5126:	8d 50 ff             	lea    -0x1(%eax),%edx
    5129:	8b 45 08             	mov    0x8(%ebp),%eax
    512c:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    512f:	8b 45 08             	mov    0x8(%ebp),%eax
    5132:	8b 40 10             	mov    0x10(%eax),%eax
    5135:	83 f8 03             	cmp    $0x3,%eax
    5138:	7e 10                	jle    514a <get1bit+0x58>
    513a:	8b 45 08             	mov    0x8(%ebp),%eax
    513d:	8b 50 10             	mov    0x10(%eax),%edx
    5140:	8b 45 08             	mov    0x8(%ebp),%eax
    5143:	8b 40 1c             	mov    0x1c(%eax),%eax
    5146:	39 c2                	cmp    %eax,%edx
    5148:	7d 6e                	jge    51b8 <get1bit+0xc6>
             if (bs->eob)
    514a:	8b 45 08             	mov    0x8(%ebp),%eax
    514d:	8b 40 1c             	mov    0x1c(%eax),%eax
    5150:	85 c0                	test   %eax,%eax
    5152:	74 0c                	je     5160 <get1bit+0x6e>
                bs->eobs = TRUE;
    5154:	8b 45 08             	mov    0x8(%ebp),%eax
    5157:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    515e:	eb 58                	jmp    51b8 <get1bit+0xc6>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5160:	8b 45 08             	mov    0x8(%ebp),%eax
    5163:	8b 58 10             	mov    0x10(%eax),%ebx
    5166:	eb 2f                	jmp    5197 <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5168:	8b 45 08             	mov    0x8(%ebp),%eax
    516b:	8b 50 04             	mov    0x4(%eax),%edx
    516e:	8b 45 08             	mov    0x8(%ebp),%eax
    5171:	8b 40 08             	mov    0x8(%eax),%eax
    5174:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5177:	8b 45 08             	mov    0x8(%ebp),%eax
    517a:	8b 40 10             	mov    0x10(%eax),%eax
    517d:	29 c1                	sub    %eax,%ecx
    517f:	89 c8                	mov    %ecx,%eax
    5181:	01 d8                	add    %ebx,%eax
    5183:	01 c2                	add    %eax,%edx
    5185:	8b 45 08             	mov    0x8(%ebp),%eax
    5188:	8b 40 04             	mov    0x4(%eax),%eax
    518b:	89 d9                	mov    %ebx,%ecx
    518d:	01 c8                	add    %ecx,%eax
    518f:	0f b6 00             	movzbl (%eax),%eax
    5192:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5194:	83 eb 01             	sub    $0x1,%ebx
    5197:	85 db                	test   %ebx,%ebx
    5199:	79 cd                	jns    5168 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    519b:	83 ec 0c             	sub    $0xc,%esp
    519e:	ff 75 08             	pushl  0x8(%ebp)
    51a1:	e8 e8 fe ff ff       	call   508e <refill_buffer>
    51a6:	83 c4 10             	add    $0x10,%esp
                bs->buf_byte_idx = bs->buf_size-1;
    51a9:	8b 45 08             	mov    0x8(%ebp),%eax
    51ac:	8b 40 08             	mov    0x8(%eax),%eax
    51af:	8d 50 ff             	lea    -0x1(%eax),%edx
    51b2:	8b 45 08             	mov    0x8(%ebp),%eax
    51b5:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    51b8:	8b 45 08             	mov    0x8(%ebp),%eax
    51bb:	8b 50 04             	mov    0x4(%eax),%edx
    51be:	8b 45 08             	mov    0x8(%ebp),%eax
    51c1:	8b 40 10             	mov    0x10(%eax),%eax
    51c4:	01 d0                	add    %edx,%eax
    51c6:	0f b6 00             	movzbl (%eax),%eax
    51c9:	0f b6 d0             	movzbl %al,%edx
    51cc:	8b 45 08             	mov    0x8(%ebp),%eax
    51cf:	8b 40 14             	mov    0x14(%eax),%eax
    51d2:	83 e8 01             	sub    $0x1,%eax
    51d5:	8b 04 85 40 f3 00 00 	mov    0xf340(,%eax,4),%eax
    51dc:	21 d0                	and    %edx,%eax
    51de:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    51e1:	8b 45 08             	mov    0x8(%ebp),%eax
    51e4:	8b 40 14             	mov    0x14(%eax),%eax
    51e7:	83 e8 01             	sub    $0x1,%eax
    51ea:	89 c1                	mov    %eax,%ecx
    51ec:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    51ef:	8b 45 08             	mov    0x8(%ebp),%eax
    51f2:	8b 40 14             	mov    0x14(%eax),%eax
    51f5:	8d 50 ff             	lea    -0x1(%eax),%edx
    51f8:	8b 45 08             	mov    0x8(%ebp),%eax
    51fb:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    51fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5201:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5204:	c9                   	leave  
    5205:	c3                   	ret    

00005206 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    5206:	55                   	push   %ebp
    5207:	89 e5                	mov    %esp,%ebp
    5209:	57                   	push   %edi
    520a:	56                   	push   %esi
    520b:	53                   	push   %ebx
    520c:	83 ec 1c             	sub    $0x1c,%esp
	unsigned long val=0;
    520f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    5216:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    5219:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    521d:	7e 14                	jle    5233 <getbits+0x2d>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    521f:	83 ec 04             	sub    $0x4,%esp
    5222:	6a 20                	push   $0x20
    5224:	68 1c b3 00 00       	push   $0xb31c
    5229:	6a 00                	push   $0x0
    522b:	e8 a0 f1 ff ff       	call   43d0 <printf>
    5230:	83 c4 10             	add    $0x10,%esp

	bs->totbit += N;
    5233:	8b 45 08             	mov    0x8(%ebp),%eax
    5236:	8b 50 0c             	mov    0xc(%eax),%edx
    5239:	8b 45 0c             	mov    0xc(%ebp),%eax
    523c:	01 c2                	add    %eax,%edx
    523e:	8b 45 08             	mov    0x8(%ebp),%eax
    5241:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    5244:	e9 0d 01 00 00       	jmp    5356 <getbits+0x150>
		if (!bs->buf_bit_idx) {
    5249:	8b 45 08             	mov    0x8(%ebp),%eax
    524c:	8b 40 14             	mov    0x14(%eax),%eax
    524f:	85 c0                	test   %eax,%eax
    5251:	0f 85 a2 00 00 00    	jne    52f9 <getbits+0xf3>
			bs->buf_bit_idx = 8;
    5257:	8b 45 08             	mov    0x8(%ebp),%eax
    525a:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    5261:	8b 45 08             	mov    0x8(%ebp),%eax
    5264:	8b 40 10             	mov    0x10(%eax),%eax
    5267:	8d 50 ff             	lea    -0x1(%eax),%edx
    526a:	8b 45 08             	mov    0x8(%ebp),%eax
    526d:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    5270:	8b 45 08             	mov    0x8(%ebp),%eax
    5273:	8b 40 10             	mov    0x10(%eax),%eax
    5276:	83 f8 03             	cmp    $0x3,%eax
    5279:	7e 10                	jle    528b <getbits+0x85>
    527b:	8b 45 08             	mov    0x8(%ebp),%eax
    527e:	8b 50 10             	mov    0x10(%eax),%edx
    5281:	8b 45 08             	mov    0x8(%ebp),%eax
    5284:	8b 40 1c             	mov    0x1c(%eax),%eax
    5287:	39 c2                	cmp    %eax,%edx
    5289:	7d 6e                	jge    52f9 <getbits+0xf3>
				if (bs->eob)
    528b:	8b 45 08             	mov    0x8(%ebp),%eax
    528e:	8b 40 1c             	mov    0x1c(%eax),%eax
    5291:	85 c0                	test   %eax,%eax
    5293:	74 0c                	je     52a1 <getbits+0x9b>
					bs->eobs = TRUE;
    5295:	8b 45 08             	mov    0x8(%ebp),%eax
    5298:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    529f:	eb 58                	jmp    52f9 <getbits+0xf3>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    52a1:	8b 45 08             	mov    0x8(%ebp),%eax
    52a4:	8b 70 10             	mov    0x10(%eax),%esi
    52a7:	eb 2f                	jmp    52d8 <getbits+0xd2>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    52a9:	8b 45 08             	mov    0x8(%ebp),%eax
    52ac:	8b 50 04             	mov    0x4(%eax),%edx
    52af:	8b 45 08             	mov    0x8(%ebp),%eax
    52b2:	8b 40 08             	mov    0x8(%eax),%eax
    52b5:	8d 48 ff             	lea    -0x1(%eax),%ecx
    52b8:	8b 45 08             	mov    0x8(%ebp),%eax
    52bb:	8b 40 10             	mov    0x10(%eax),%eax
    52be:	29 c1                	sub    %eax,%ecx
    52c0:	89 c8                	mov    %ecx,%eax
    52c2:	01 f0                	add    %esi,%eax
    52c4:	01 c2                	add    %eax,%edx
    52c6:	8b 45 08             	mov    0x8(%ebp),%eax
    52c9:	8b 40 04             	mov    0x4(%eax),%eax
    52cc:	89 f1                	mov    %esi,%ecx
    52ce:	01 c8                	add    %ecx,%eax
    52d0:	0f b6 00             	movzbl (%eax),%eax
    52d3:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    52d5:	83 ee 01             	sub    $0x1,%esi
    52d8:	85 f6                	test   %esi,%esi
    52da:	79 cd                	jns    52a9 <getbits+0xa3>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    52dc:	83 ec 0c             	sub    $0xc,%esp
    52df:	ff 75 08             	pushl  0x8(%ebp)
    52e2:	e8 a7 fd ff ff       	call   508e <refill_buffer>
    52e7:	83 c4 10             	add    $0x10,%esp
					bs->buf_byte_idx = bs->buf_size-1;
    52ea:	8b 45 08             	mov    0x8(%ebp),%eax
    52ed:	8b 40 08             	mov    0x8(%eax),%eax
    52f0:	8d 50 ff             	lea    -0x1(%eax),%edx
    52f3:	8b 45 08             	mov    0x8(%ebp),%eax
    52f6:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    52f9:	8b 45 08             	mov    0x8(%ebp),%eax
    52fc:	8b 40 14             	mov    0x14(%eax),%eax
    52ff:	39 d8                	cmp    %ebx,%eax
    5301:	0f 4f c3             	cmovg  %ebx,%eax
    5304:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    5306:	8b 45 08             	mov    0x8(%ebp),%eax
    5309:	8b 50 04             	mov    0x4(%eax),%edx
    530c:	8b 45 08             	mov    0x8(%ebp),%eax
    530f:	8b 40 10             	mov    0x10(%eax),%eax
    5312:	01 d0                	add    %edx,%eax
    5314:	0f b6 00             	movzbl (%eax),%eax
    5317:	0f b6 d0             	movzbl %al,%edx
    531a:	8b 45 08             	mov    0x8(%ebp),%eax
    531d:	8b 40 14             	mov    0x14(%eax),%eax
    5320:	8b 04 85 60 f3 00 00 	mov    0xf360(,%eax,4),%eax
    5327:	89 d7                	mov    %edx,%edi
    5329:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    532b:	8b 45 08             	mov    0x8(%ebp),%eax
    532e:	8b 40 14             	mov    0x14(%eax),%eax
    5331:	29 f0                	sub    %esi,%eax
    5333:	89 c1                	mov    %eax,%ecx
    5335:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    5337:	89 d8                	mov    %ebx,%eax
    5339:	29 f0                	sub    %esi,%eax
    533b:	89 c1                	mov    %eax,%ecx
    533d:	d3 e7                	shl    %cl,%edi
    533f:	89 f8                	mov    %edi,%eax
    5341:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    5344:	8b 45 08             	mov    0x8(%ebp),%eax
    5347:	8b 40 14             	mov    0x14(%eax),%eax
    534a:	29 f0                	sub    %esi,%eax
    534c:	89 c2                	mov    %eax,%edx
    534e:	8b 45 08             	mov    0x8(%ebp),%eax
    5351:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    5354:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    5356:	85 db                	test   %ebx,%ebx
    5358:	0f 8f eb fe ff ff    	jg     5249 <getbits+0x43>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    535e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    5361:	8d 65 f4             	lea    -0xc(%ebp),%esp
    5364:	5b                   	pop    %ebx
    5365:	5e                   	pop    %esi
    5366:	5f                   	pop    %edi
    5367:	5d                   	pop    %ebp
    5368:	c3                   	ret    

00005369 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    5369:	55                   	push   %ebp
    536a:	89 e5                	mov    %esp,%ebp
    536c:	83 ec 28             	sub    $0x28,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    536f:	db 45 10             	fildl  0x10(%ebp)
    5372:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5376:	dd 1c 24             	fstpl  (%esp)
    5379:	dd 05 88 b3 00 00    	fldl   0xb388
    537f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5383:	dd 1c 24             	fstpl  (%esp)
    5386:	e8 0f f5 ff ff       	call   489a <pow>
    538b:	83 c4 10             	add    $0x10,%esp
    538e:	d9 7d e6             	fnstcw -0x1a(%ebp)
    5391:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    5395:	b4 0c                	mov    $0xc,%ah
    5397:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    539b:	d9 6d e4             	fldcw  -0x1c(%ebp)
    539e:	db 5d e0             	fistpl -0x20(%ebp)
    53a1:	d9 6d e6             	fldcw  -0x1a(%ebp)
    53a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    53a7:	83 e8 01             	sub    $0x1,%eax
    53aa:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    53ad:	83 ec 0c             	sub    $0xc,%esp
    53b0:	ff 75 08             	pushl  0x8(%ebp)
    53b3:	e8 cb fc ff ff       	call   5083 <sstell>
    53b8:	83 c4 10             	add    $0x10,%esp
    53bb:	83 e0 07             	and    $0x7,%eax
    53be:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    53c1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    53c5:	74 17                	je     53de <seek_sync+0x75>
		getbits(bs, (int)(ALIGNING-aligning));
    53c7:	b8 08 00 00 00       	mov    $0x8,%eax
    53cc:	2b 45 ec             	sub    -0x14(%ebp),%eax
    53cf:	83 ec 08             	sub    $0x8,%esp
    53d2:	50                   	push   %eax
    53d3:	ff 75 08             	pushl  0x8(%ebp)
    53d6:	e8 2b fe ff ff       	call   5206 <getbits>
    53db:	83 c4 10             	add    $0x10,%esp

	val = getbits(bs, N);
    53de:	83 ec 08             	sub    $0x8,%esp
    53e1:	ff 75 10             	pushl  0x10(%ebp)
    53e4:	ff 75 08             	pushl  0x8(%ebp)
    53e7:	e8 1a fe ff ff       	call   5206 <getbits>
    53ec:	83 c4 10             	add    $0x10,%esp
    53ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    53f2:	eb 17                	jmp    540b <seek_sync+0xa2>
		val <<= ALIGNING;
    53f4:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    53f8:	83 ec 08             	sub    $0x8,%esp
    53fb:	6a 08                	push   $0x8
    53fd:	ff 75 08             	pushl  0x8(%ebp)
    5400:	e8 01 fe ff ff       	call   5206 <getbits>
    5405:	83 c4 10             	add    $0x10,%esp
    5408:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    540b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    540e:	23 45 f4             	and    -0xc(%ebp),%eax
    5411:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5414:	74 12                	je     5428 <seek_sync+0xbf>
    5416:	83 ec 0c             	sub    $0xc,%esp
    5419:	ff 75 08             	pushl  0x8(%ebp)
    541c:	e8 57 fc ff ff       	call   5078 <end_bs>
    5421:	83 c4 10             	add    $0x10,%esp
    5424:	85 c0                	test   %eax,%eax
    5426:	74 cc                	je     53f4 <seek_sync+0x8b>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    5428:	83 ec 0c             	sub    $0xc,%esp
    542b:	ff 75 08             	pushl  0x8(%ebp)
    542e:	e8 45 fc ff ff       	call   5078 <end_bs>
    5433:	83 c4 10             	add    $0x10,%esp
    5436:	85 c0                	test   %eax,%eax
    5438:	74 07                	je     5441 <seek_sync+0xd8>
		return(0);
    543a:	b8 00 00 00 00       	mov    $0x0,%eax
    543f:	eb 05                	jmp    5446 <seek_sync+0xdd>
	else
		return(1);
    5441:	b8 01 00 00 00       	mov    $0x1,%eax
}
    5446:	c9                   	leave  
    5447:	c3                   	ret    

00005448 <js_bound>:

int js_bound(int lay, int m_ext)
{
    5448:	55                   	push   %ebp
    5449:	89 e5                	mov    %esp,%ebp
    544b:	83 ec 08             	sub    $0x8,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    544e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5452:	7e 12                	jle    5466 <js_bound+0x1e>
    5454:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    5458:	7f 0c                	jg     5466 <js_bound+0x1e>
    545a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    545e:	78 06                	js     5466 <js_bound+0x1e>
    5460:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    5464:	7e 1a                	jle    5480 <js_bound+0x38>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    5466:	ff 75 0c             	pushl  0xc(%ebp)
    5469:	ff 75 08             	pushl  0x8(%ebp)
    546c:	68 50 b3 00 00       	push   $0xb350
    5471:	6a 00                	push   $0x0
    5473:	e8 58 ef ff ff       	call   43d0 <printf>
    5478:	83 c4 10             	add    $0x10,%esp
        exit();
    547b:	e8 73 ed ff ff       	call   41f3 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    5480:	8b 45 08             	mov    0x8(%ebp),%eax
    5483:	83 e8 01             	sub    $0x1,%eax
    5486:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    548d:	8b 45 0c             	mov    0xc(%ebp),%eax
    5490:	01 d0                	add    %edx,%eax
    5492:	8b 04 85 a0 f3 00 00 	mov    0xf3a0(,%eax,4),%eax
}
    5499:	c9                   	leave  
    549a:	c3                   	ret    

0000549b <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    549b:	55                   	push   %ebp
    549c:	89 e5                	mov    %esp,%ebp
    549e:	83 ec 18             	sub    $0x18,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    54a1:	8b 45 08             	mov    0x8(%ebp),%eax
    54a4:	8b 00                	mov    (%eax),%eax
    54a6:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    54a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54ac:	8b 50 1c             	mov    0x1c(%eax),%edx
    54af:	8b 45 08             	mov    0x8(%ebp),%eax
    54b2:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    54b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54b8:	8b 40 1c             	mov    0x1c(%eax),%eax
    54bb:	83 f8 03             	cmp    $0x3,%eax
    54be:	75 07                	jne    54c7 <hdr_to_frps+0x2c>
    54c0:	ba 01 00 00 00       	mov    $0x1,%edx
    54c5:	eb 05                	jmp    54cc <hdr_to_frps+0x31>
    54c7:	ba 02 00 00 00       	mov    $0x2,%edx
    54cc:	8b 45 08             	mov    0x8(%ebp),%eax
    54cf:	89 50 08             	mov    %edx,0x8(%eax)
	fr_ps->sblimit = SBLIMIT;
    54d2:	8b 45 08             	mov    0x8(%ebp),%eax
    54d5:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    54dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54df:	8b 40 1c             	mov    0x1c(%eax),%eax
    54e2:	83 f8 01             	cmp    $0x1,%eax
    54e5:	75 23                	jne    550a <hdr_to_frps+0x6f>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    54e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54ea:	8b 50 20             	mov    0x20(%eax),%edx
    54ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54f0:	8b 40 04             	mov    0x4(%eax),%eax
    54f3:	83 ec 08             	sub    $0x8,%esp
    54f6:	52                   	push   %edx
    54f7:	50                   	push   %eax
    54f8:	e8 4b ff ff ff       	call   5448 <js_bound>
    54fd:	83 c4 10             	add    $0x10,%esp
    5500:	89 c2                	mov    %eax,%edx
    5502:	8b 45 08             	mov    0x8(%ebp),%eax
    5505:	89 50 0c             	mov    %edx,0xc(%eax)
    5508:	eb 0c                	jmp    5516 <hdr_to_frps+0x7b>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    550a:	8b 45 08             	mov    0x8(%ebp),%eax
    550d:	8b 50 10             	mov    0x10(%eax),%edx
    5510:	8b 45 08             	mov    0x8(%ebp),%eax
    5513:	89 50 0c             	mov    %edx,0xc(%eax)
}
    5516:	c9                   	leave  
    5517:	c3                   	ret    

00005518 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    5518:	55                   	push   %ebp
    5519:	89 e5                	mov    %esp,%ebp
    551b:	83 ec 08             	sub    $0x8,%esp
	if (N != 8) {
    551e:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    5522:	74 17                	je     553b <hputbuf+0x23>
		printf(0,"Not Supported yet!!\n");
    5524:	83 ec 08             	sub    $0x8,%esp
    5527:	68 73 b3 00 00       	push   $0xb373
    552c:	6a 00                	push   $0x0
    552e:	e8 9d ee ff ff       	call   43d0 <printf>
    5533:	83 c4 10             	add    $0x10,%esp
		exit();
    5536:	e8 b8 ec ff ff       	call   41f3 <exit>
	}
	getCoreBuf(1, val);
    553b:	83 ec 08             	sub    $0x8,%esp
    553e:	ff 75 08             	pushl  0x8(%ebp)
    5541:	6a 01                	push   $0x1
    5543:	e8 ab ed ff ff       	call   42f3 <getCoreBuf>
    5548:	83 c4 10             	add    $0x10,%esp
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    554b:	c9                   	leave  
    554c:	c3                   	ret    

0000554d <hsstell>:

unsigned long hsstell()
{
    554d:	55                   	push   %ebp
    554e:	89 e5                	mov    %esp,%ebp
    5550:	83 ec 08             	sub    $0x8,%esp
	return getCoreBuf(2, 0);
    5553:	83 ec 08             	sub    $0x8,%esp
    5556:	6a 00                	push   $0x0
    5558:	6a 02                	push   $0x2
    555a:	e8 94 ed ff ff       	call   42f3 <getCoreBuf>
    555f:	83 c4 10             	add    $0x10,%esp
//	return(totbit);
}
    5562:	c9                   	leave  
    5563:	c3                   	ret    

00005564 <hgetbits>:

unsigned long hgetbits(int N)
{
    5564:	55                   	push   %ebp
    5565:	89 e5                	mov    %esp,%ebp
    5567:	83 ec 08             	sub    $0x8,%esp

	return getCoreBuf(3, N);
    556a:	83 ec 08             	sub    $0x8,%esp
    556d:	ff 75 08             	pushl  0x8(%ebp)
    5570:	6a 03                	push   $0x3
    5572:	e8 7c ed ff ff       	call   42f3 <getCoreBuf>
    5577:	83 c4 10             	add    $0x10,%esp
}
    557a:	c9                   	leave  
    557b:	c3                   	ret    

0000557c <hget1bit>:


unsigned int hget1bit()
{
    557c:	55                   	push   %ebp
    557d:	89 e5                	mov    %esp,%ebp
    557f:	83 ec 08             	sub    $0x8,%esp
	return(hgetbits(1));
    5582:	83 ec 0c             	sub    $0xc,%esp
    5585:	6a 01                	push   $0x1
    5587:	e8 d8 ff ff ff       	call   5564 <hgetbits>
    558c:	83 c4 10             	add    $0x10,%esp
}
    558f:	c9                   	leave  
    5590:	c3                   	ret    

00005591 <rewindNbits>:


void rewindNbits(int N)
{
    5591:	55                   	push   %ebp
    5592:	89 e5                	mov    %esp,%ebp
    5594:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(4, N);
    5597:	83 ec 08             	sub    $0x8,%esp
    559a:	ff 75 08             	pushl  0x8(%ebp)
    559d:	6a 04                	push   $0x4
    559f:	e8 4f ed ff ff       	call   42f3 <getCoreBuf>
    55a4:	83 c4 10             	add    $0x10,%esp
}
    55a7:	c9                   	leave  
    55a8:	c3                   	ret    

000055a9 <rewindNbytes>:


void rewindNbytes(int N)
{
    55a9:	55                   	push   %ebp
    55aa:	89 e5                	mov    %esp,%ebp
    55ac:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(5, N);
    55af:	83 ec 08             	sub    $0x8,%esp
    55b2:	ff 75 08             	pushl  0x8(%ebp)
    55b5:	6a 05                	push   $0x5
    55b7:	e8 37 ed ff ff       	call   42f3 <getCoreBuf>
    55bc:	83 c4 10             	add    $0x10,%esp
}
    55bf:	c9                   	leave  
    55c0:	c3                   	ret    

000055c1 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    55c1:	55                   	push   %ebp
    55c2:	89 e5                	mov    %esp,%ebp
    55c4:	57                   	push   %edi
    55c5:	56                   	push   %esi
    55c6:	53                   	push   %ebx
    55c7:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    55cd:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    55d1:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    55d5:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    55d9:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    55dd:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    55e1:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    55e5:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    55e9:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    55ed:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    55f1:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    55f5:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    55f9:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    55fd:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    5601:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5605:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    5609:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    560d:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    5611:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    5615:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    5619:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    561d:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    5621:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    5625:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    5629:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    562d:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    5631:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    5635:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    5639:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    563d:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    5641:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    5645:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    5649:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    564d:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    5651:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    5655:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    5659:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    565d:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    5661:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    5665:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    5669:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    566d:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    5671:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    5675:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    5679:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    567d:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    5681:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    5685:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    5689:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    568d:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    5691:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    5695:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    5699:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    569d:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    56a1:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    56a5:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    56a9:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    56ad:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    56b1:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    56b5:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    56b9:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    56bd:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    56c1:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    56c5:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    56c9:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    56cd:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    56d1:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    56d5:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    56d9:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    56dd:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    56e1:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    56e5:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    56e9:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    56ed:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    56f1:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    56f5:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    56f9:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    56fd:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    5701:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    5705:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    5709:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    570d:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    5711:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    5715:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    571c:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    5723:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    572a:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    5731:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    5738:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    573f:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    5746:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    574d:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    5754:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    575b:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    5762:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    5769:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    5770:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    5777:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    577e:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    5785:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    578c:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    5793:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    579a:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    57a1:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    57a8:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    57af:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    57b6:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    57bd:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    57c4:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    57cb:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    57d2:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    57d9:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    57dd:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    57e1:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    57e5:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    57e9:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    57ed:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    57f1:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    57f5:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    57f9:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    57fd:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    5801:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    5805:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    5809:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    580d:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    5811:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    5815:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    5819:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    581d:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    5821:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    5825:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    5829:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    582d:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    5831:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    5835:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    5839:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    583d:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    5841:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    5845:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    5849:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    584d:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    5851:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    5855:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    5859:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    585d:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    5861:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    5868:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    586f:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    5876:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    587d:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    5884:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    588b:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    5892:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    5899:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    58a0:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    58a7:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    58ae:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    58b5:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    58bc:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    58c3:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    58ca:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    58d1:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    58d8:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    58df:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    58e6:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    58ed:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    58f4:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    58fb:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    5902:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    5909:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    5910:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    5917:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    591e:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    5925:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    592c:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    5933:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    593a:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    5941:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    5948:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    594f:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    5956:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    595d:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    5964:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    596b:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    5972:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    5979:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    5980:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    5987:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    598e:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    5995:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    599c:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    59a3:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    59aa:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    59b1:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    59b8:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    59bf:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    59c6:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    59cd:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    59d4:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    59db:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    59e2:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    59e9:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    59f0:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    59f7:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    59fe:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    5a05:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    5a0c:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5a13:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    5a19:	ba c0 b3 00 00       	mov    $0xb3c0,%edx
    5a1e:	b9 23 00 00 00       	mov    $0x23,%ecx
    5a23:	89 c7                	mov    %eax,%edi
    5a25:	89 d6                	mov    %edx,%esi
    5a27:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5a29:	89 f2                	mov    %esi,%edx
    5a2b:	89 f8                	mov    %edi,%eax
    5a2d:	0f b7 0a             	movzwl (%edx),%ecx
    5a30:	66 89 08             	mov    %cx,(%eax)
    5a33:	8d 40 02             	lea    0x2(%eax),%eax
    5a36:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    5a39:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5a3f:	bb 80 b4 00 00       	mov    $0xb480,%ebx
    5a44:	ba 8e 00 00 00       	mov    $0x8e,%edx
    5a49:	8b 0b                	mov    (%ebx),%ecx
    5a4b:	89 08                	mov    %ecx,(%eax)
    5a4d:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5a51:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5a55:	8d 78 04             	lea    0x4(%eax),%edi
    5a58:	83 e7 fc             	and    $0xfffffffc,%edi
    5a5b:	29 f8                	sub    %edi,%eax
    5a5d:	29 c3                	sub    %eax,%ebx
    5a5f:	01 c2                	add    %eax,%edx
    5a61:	83 e2 fc             	and    $0xfffffffc,%edx
    5a64:	89 d0                	mov    %edx,%eax
    5a66:	c1 e8 02             	shr    $0x2,%eax
    5a69:	89 de                	mov    %ebx,%esi
    5a6b:	89 c1                	mov    %eax,%ecx
    5a6d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5a6f:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    5a75:	ba 40 b5 00 00       	mov    $0xb540,%edx
    5a7a:	b9 23 00 00 00       	mov    $0x23,%ecx
    5a7f:	89 c7                	mov    %eax,%edi
    5a81:	89 d6                	mov    %edx,%esi
    5a83:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5a85:	89 f2                	mov    %esi,%edx
    5a87:	89 f8                	mov    %edi,%eax
    5a89:	0f b7 0a             	movzwl (%edx),%ecx
    5a8c:	66 89 08             	mov    %cx,(%eax)
    5a8f:	8d 40 02             	lea    0x2(%eax),%eax
    5a92:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5a95:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    5a9b:	bb 00 b6 00 00       	mov    $0xb600,%ebx
    5aa0:	ba fe 00 00 00       	mov    $0xfe,%edx
    5aa5:	8b 0b                	mov    (%ebx),%ecx
    5aa7:	89 08                	mov    %ecx,(%eax)
    5aa9:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5aad:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5ab1:	8d 78 04             	lea    0x4(%eax),%edi
    5ab4:	83 e7 fc             	and    $0xfffffffc,%edi
    5ab7:	29 f8                	sub    %edi,%eax
    5ab9:	29 c3                	sub    %eax,%ebx
    5abb:	01 c2                	add    %eax,%edx
    5abd:	83 e2 fc             	and    $0xfffffffc,%edx
    5ac0:	89 d0                	mov    %edx,%eax
    5ac2:	c1 e8 02             	shr    $0x2,%eax
    5ac5:	89 de                	mov    %ebx,%esi
    5ac7:	89 c1                	mov    %eax,%ecx
    5ac9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5acb:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    5ad1:	ba 00 b7 00 00       	mov    $0xb700,%edx
    5ad6:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    5adb:	89 c7                	mov    %eax,%edi
    5add:	89 d6                	mov    %edx,%esi
    5adf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5ae1:	89 f2                	mov    %esi,%edx
    5ae3:	89 f8                	mov    %edi,%eax
    5ae5:	0f b7 0a             	movzwl (%edx),%ecx
    5ae8:	66 89 08             	mov    %cx,(%eax)
    5aeb:	8d 40 02             	lea    0x2(%eax),%eax
    5aee:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5af1:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    5af7:	bb 00 b8 00 00       	mov    $0xb800,%ebx
    5afc:	ba fe 00 00 00       	mov    $0xfe,%edx
    5b01:	8b 0b                	mov    (%ebx),%ecx
    5b03:	89 08                	mov    %ecx,(%eax)
    5b05:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5b09:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5b0d:	8d 78 04             	lea    0x4(%eax),%edi
    5b10:	83 e7 fc             	and    $0xfffffffc,%edi
    5b13:	29 f8                	sub    %edi,%eax
    5b15:	29 c3                	sub    %eax,%ebx
    5b17:	01 c2                	add    %eax,%edx
    5b19:	83 e2 fc             	and    $0xfffffffc,%edx
    5b1c:	89 d0                	mov    %edx,%eax
    5b1e:	c1 e8 02             	shr    $0x2,%eax
    5b21:	89 de                	mov    %ebx,%esi
    5b23:	89 c1                	mov    %eax,%ecx
    5b25:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    5b27:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    5b2d:	ba 00 b9 00 00       	mov    $0xb900,%edx
    5b32:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5b37:	89 c7                	mov    %eax,%edi
    5b39:	89 d6                	mov    %edx,%esi
    5b3b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5b3d:	89 f2                	mov    %esi,%edx
    5b3f:	89 f8                	mov    %edi,%eax
    5b41:	0f b7 0a             	movzwl (%edx),%ecx
    5b44:	66 89 08             	mov    %cx,(%eax)
    5b47:	8d 40 02             	lea    0x2(%eax),%eax
    5b4a:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    5b4d:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5b53:	bb 00 bd 00 00       	mov    $0xbd00,%ebx
    5b58:	ba fe 03 00 00       	mov    $0x3fe,%edx
    5b5d:	8b 0b                	mov    (%ebx),%ecx
    5b5f:	89 08                	mov    %ecx,(%eax)
    5b61:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5b65:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5b69:	8d 78 04             	lea    0x4(%eax),%edi
    5b6c:	83 e7 fc             	and    $0xfffffffc,%edi
    5b6f:	29 f8                	sub    %edi,%eax
    5b71:	29 c3                	sub    %eax,%ebx
    5b73:	01 c2                	add    %eax,%edx
    5b75:	83 e2 fc             	and    $0xfffffffc,%edx
    5b78:	89 d0                	mov    %edx,%eax
    5b7a:	c1 e8 02             	shr    $0x2,%eax
    5b7d:	89 de                	mov    %ebx,%esi
    5b7f:	89 c1                	mov    %eax,%ecx
    5b81:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5b83:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5b89:	ba 00 c1 00 00       	mov    $0xc100,%edx
    5b8e:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5b93:	89 c7                	mov    %eax,%edi
    5b95:	89 d6                	mov    %edx,%esi
    5b97:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5b99:	89 f2                	mov    %esi,%edx
    5b9b:	89 f8                	mov    %edi,%eax
    5b9d:	0f b7 0a             	movzwl (%edx),%ecx
    5ba0:	66 89 08             	mov    %cx,(%eax)
    5ba3:	8d 40 02             	lea    0x2(%eax),%eax
    5ba6:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5ba9:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5baf:	bb 00 c5 00 00       	mov    $0xc500,%ebx
    5bb4:	ba 00 01 00 00       	mov    $0x100,%edx
    5bb9:	89 c7                	mov    %eax,%edi
    5bbb:	89 de                	mov    %ebx,%esi
    5bbd:	89 d1                	mov    %edx,%ecx
    5bbf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    5bc1:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    5bc8:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    5bcf:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    5bd6:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    5bdd:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    5be4:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    5beb:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    5bf2:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    5bf9:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    5c00:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    5c07:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    5c0e:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    5c15:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    5c1c:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    5c23:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    5c2a:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    5c31:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    5c38:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    5c3f:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    5c46:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    5c4d:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    5c54:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    5c5b:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    5c62:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    5c69:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    5c70:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    5c77:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    5c7e:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    5c85:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    5c8c:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    5c93:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    5c9a:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    5ca1:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    5ca8:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    5caf:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    5cb6:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    5cbd:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    5cc4:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    5ccb:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    5cd2:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    5cd9:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    5ce0:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    5ce7:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    5cee:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    5cf5:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    5cfc:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    5d03:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    5d0a:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    5d11:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    5d18:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    5d1f:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    5d26:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    5d2d:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    5d34:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    5d3b:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    5d42:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    5d49:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    5d50:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    5d57:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    5d5e:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    5d65:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    5d6c:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    5d73:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    5d7a:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    5d81:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    5d88:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    5d8f:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    5d96:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    5d9d:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    5da4:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    5dab:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    5db2:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    5db9:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    5dc0:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    5dc7:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    5dce:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    5dd5:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    5ddc:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    5de3:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    5dea:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    5df1:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    5df8:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    5dff:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    5e06:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    5e0d:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    5e14:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    5e1b:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    5e22:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    5e29:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    5e30:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    5e37:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    5e3e:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    5e45:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    5e4c:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    5e53:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    5e5a:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    5e61:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    5e68:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    5e6f:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    5e76:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    5e7d:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    5e84:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    5e8b:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    5e92:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    5e99:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    5ea0:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    5ea7:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    5eae:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    5eb5:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    5ebc:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    5ec3:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    5eca:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    5ed1:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    5ed8:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    5edf:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    5ee6:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    5eed:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    5ef4:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    5efb:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    5f02:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    5f09:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    5f10:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    5f17:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    5f1e:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    5f25:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    5f2c:	30 00 
    5f2e:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    5f35:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    5f3c:	00 00 00 
    5f3f:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    5f46:	00 00 00 
    5f49:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    5f50:	00 00 00 
    5f53:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    5f5a:	00 00 00 
    5f5d:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    5f64:	ff ff ff 
    5f67:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    5f6e:	00 00 00 
    5f71:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    5f78:	00 00 00 
    5f7b:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    5f82:	00 00 00 
    5f85:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    5f8c:	00 00 00 
    5f8f:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    5f96:	31 00 
    5f98:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    5f9f:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    5fa6:	00 00 00 
    5fa9:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    5fb0:	00 00 00 
    5fb3:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    5fba:	00 00 00 
    5fbd:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    5fc4:	00 00 00 
    5fc7:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    5fce:	ff ff ff 
    5fd1:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    5fd8:	00 00 00 
    5fdb:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    5fe2:	00 00 00 
    5fe5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    5fe8:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    5fee:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    5ff5:	00 00 00 
    5ff8:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    5fff:	32 00 
    6001:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    6008:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    600f:	00 00 00 
    6012:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    6019:	00 00 00 
    601c:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    6023:	00 00 00 
    6026:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    602d:	00 00 00 
    6030:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    6037:	ff ff ff 
    603a:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    6041:	00 00 00 
    6044:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    604b:	00 00 00 
    604e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    6051:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    6057:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    605e:	00 00 00 
    6061:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    6068:	33 00 
    606a:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    6071:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    6078:	00 00 00 
    607b:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    6082:	00 00 00 
    6085:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    608c:	00 00 00 
    608f:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    6096:	00 00 00 
    6099:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    60a0:	ff ff ff 
    60a3:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    60aa:	00 00 00 
    60ad:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    60b4:	00 00 00 
    60b7:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    60ba:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    60c0:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    60c7:	00 00 00 
    60ca:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    60d1:	34 00 
    60d3:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    60da:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    60e1:	00 00 00 
    60e4:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    60eb:	00 00 00 
    60ee:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    60f5:	00 00 00 
    60f8:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    60ff:	00 00 00 
    6102:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    6109:	ff ff ff 
    610c:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    6113:	00 00 00 
    6116:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    611d:	00 00 00 
    6120:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    6127:	00 00 00 
    612a:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    6131:	00 00 00 
    6134:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    613b:	35 00 
    613d:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    6144:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    614b:	00 00 00 
    614e:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    6155:	00 00 00 
    6158:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    615f:	00 00 00 
    6162:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    6169:	00 00 00 
    616c:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    6173:	ff ff ff 
    6176:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    617d:	00 00 00 
    6180:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    6187:	00 00 00 
    618a:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    6190:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    6196:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    619d:	00 00 00 
    61a0:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    61a7:	36 00 
    61a9:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    61b0:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    61b7:	00 00 00 
    61ba:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    61c1:	00 00 00 
    61c4:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    61cb:	00 00 00 
    61ce:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    61d5:	00 00 00 
    61d8:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    61df:	ff ff ff 
    61e2:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    61e9:	00 00 00 
    61ec:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    61f3:	00 00 00 
    61f6:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    61fc:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    6202:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    6209:	00 00 00 
    620c:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    6213:	37 00 
    6215:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    621c:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    6223:	00 00 00 
    6226:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    622d:	00 00 00 
    6230:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    6237:	00 00 00 
    623a:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    6241:	00 00 00 
    6244:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    624b:	ff ff ff 
    624e:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    6255:	00 00 00 
    6258:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    625f:	00 00 00 
    6262:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    6268:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    626e:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    6275:	00 00 00 
    6278:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    627f:	38 00 
    6281:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    6288:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    628f:	00 00 00 
    6292:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    6299:	00 00 00 
    629c:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    62a3:	00 00 00 
    62a6:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    62ad:	00 00 00 
    62b0:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    62b7:	ff ff ff 
    62ba:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    62c1:	00 00 00 
    62c4:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    62cb:	00 00 00 
    62ce:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    62d4:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    62da:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    62e1:	00 00 00 
    62e4:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    62eb:	39 00 
    62ed:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    62f4:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    62fb:	00 00 00 
    62fe:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    6305:	00 00 00 
    6308:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    630f:	00 00 00 
    6312:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    6319:	00 00 00 
    631c:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    6323:	ff ff ff 
    6326:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    632d:	00 00 00 
    6330:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    6337:	00 00 00 
    633a:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    6340:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    6346:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    634d:	00 00 00 
    6350:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    6357:	31 30 
    6359:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    6360:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    6367:	00 00 00 
    636a:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    6371:	00 00 00 
    6374:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    637b:	00 00 00 
    637e:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    6385:	00 00 00 
    6388:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    638f:	ff ff ff 
    6392:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    6399:	00 00 00 
    639c:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    63a3:	00 00 00 
    63a6:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    63ac:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    63b2:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    63b9:	00 00 00 
    63bc:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    63c3:	31 31 
    63c5:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    63cc:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    63d3:	00 00 00 
    63d6:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    63dd:	00 00 00 
    63e0:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    63e7:	00 00 00 
    63ea:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    63f1:	00 00 00 
    63f4:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    63fb:	ff ff ff 
    63fe:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    6405:	00 00 00 
    6408:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    640f:	00 00 00 
    6412:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    6418:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    641e:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    6425:	00 00 00 
    6428:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    642f:	31 32 
    6431:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    6438:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    643f:	00 00 00 
    6442:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    6449:	00 00 00 
    644c:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    6453:	00 00 00 
    6456:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    645d:	00 00 00 
    6460:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    6467:	ff ff ff 
    646a:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    6471:	00 00 00 
    6474:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    647b:	00 00 00 
    647e:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    6484:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    648a:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    6491:	00 00 00 
    6494:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    649b:	31 33 
    649d:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    64a4:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    64ab:	00 00 00 
    64ae:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    64b5:	00 00 00 
    64b8:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    64bf:	00 00 00 
    64c2:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    64c9:	00 00 00 
    64cc:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    64d3:	ff ff ff 
    64d6:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    64dd:	00 00 00 
    64e0:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    64e7:	00 00 00 
    64ea:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    64f0:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    64f6:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    64fd:	01 00 00 
    6500:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    6507:	31 34 
    6509:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    6510:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    6517:	00 00 00 
    651a:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    6521:	00 00 00 
    6524:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    652b:	00 00 00 
    652e:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    6535:	00 00 00 
    6538:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    653f:	ff ff ff 
    6542:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    6549:	00 00 00 
    654c:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    6553:	00 00 00 
    6556:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    655d:	00 00 00 
    6560:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    6567:	00 00 00 
    656a:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    6571:	31 35 
    6573:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    657a:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    6581:	00 00 00 
    6584:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    658b:	00 00 00 
    658e:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    6595:	00 00 00 
    6598:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    659f:	00 00 00 
    65a2:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    65a9:	ff ff ff 
    65ac:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    65b3:	00 00 00 
    65b6:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    65bd:	00 00 00 
    65c0:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    65c6:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    65cc:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    65d3:	01 00 00 
    65d6:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    65dd:	31 36 
    65df:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    65e6:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    65ed:	00 00 00 
    65f0:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    65f7:	00 00 00 
    65fa:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    6601:	00 00 00 
    6604:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    660b:	00 00 00 
    660e:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    6615:	ff ff ff 
    6618:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    661f:	00 00 00 
    6622:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    6629:	00 00 00 
    662c:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6632:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    6638:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    663f:	01 00 00 
    6642:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    6649:	31 37 
    664b:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    6652:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    6659:	00 00 00 
    665c:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    6663:	00 00 00 
    6666:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    666d:	00 00 00 
    6670:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    6677:	00 00 00 
    667a:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    6681:	00 00 00 
    6684:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    668b:	00 00 00 
    668e:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    6695:	00 00 00 
    6698:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    669e:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    66a4:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    66ab:	01 00 00 
    66ae:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    66b5:	31 38 
    66b7:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    66be:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    66c5:	00 00 00 
    66c8:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    66cf:	00 00 00 
    66d2:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    66d9:	00 00 00 
    66dc:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    66e3:	00 00 00 
    66e6:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    66ed:	00 00 00 
    66f0:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    66f7:	00 00 00 
    66fa:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    6701:	00 00 00 
    6704:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    670a:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    6710:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    6717:	01 00 00 
    671a:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    6721:	31 39 
    6723:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    672a:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    6731:	00 00 00 
    6734:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    673b:	00 00 00 
    673e:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    6745:	00 00 00 
    6748:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    674f:	00 00 00 
    6752:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    6759:	00 00 00 
    675c:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    6763:	00 00 00 
    6766:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    676d:	00 00 00 
    6770:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6776:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    677c:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    6783:	01 00 00 
    6786:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    678d:	32 30 
    678f:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    6796:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    679d:	00 00 00 
    67a0:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    67a7:	00 00 00 
    67aa:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    67b1:	00 00 00 
    67b4:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    67bb:	00 00 00 
    67be:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    67c5:	00 00 00 
    67c8:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    67cf:	00 00 00 
    67d2:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    67d9:	00 00 00 
    67dc:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    67e2:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    67e8:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    67ef:	01 00 00 
    67f2:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    67f9:	32 31 
    67fb:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    6802:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    6809:	00 00 00 
    680c:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    6813:	00 00 00 
    6816:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    681d:	00 00 00 
    6820:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    6827:	00 00 00 
    682a:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    6831:	00 00 00 
    6834:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    683b:	00 00 00 
    683e:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    6845:	00 00 00 
    6848:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    684e:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    6854:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    685b:	01 00 00 
    685e:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    6865:	32 32 
    6867:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    686e:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    6875:	00 00 00 
    6878:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    687f:	00 00 00 
    6882:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    6889:	00 00 00 
    688c:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    6893:	03 00 00 
    6896:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    689d:	00 00 00 
    68a0:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    68a7:	00 00 00 
    68aa:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    68b1:	00 00 00 
    68b4:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    68ba:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    68c0:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    68c7:	01 00 00 
    68ca:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    68d1:	32 33 
    68d3:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    68da:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    68e1:	00 00 00 
    68e4:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    68eb:	00 00 00 
    68ee:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    68f5:	00 00 00 
    68f8:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    68ff:	1f 00 00 
    6902:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    6909:	00 00 00 
    690c:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    6913:	00 00 00 
    6916:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    691d:	00 00 00 
    6920:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6926:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    692c:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    6933:	01 00 00 
    6936:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    693d:	32 34 
    693f:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    6946:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    694d:	00 00 00 
    6950:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    6957:	00 00 00 
    695a:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    6961:	00 00 00 
    6964:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    696b:	00 00 00 
    696e:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    6975:	ff ff ff 
    6978:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    697f:	00 00 00 
    6982:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    6989:	00 00 00 
    698c:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6992:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    6998:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    699f:	02 00 00 
    69a2:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    69a9:	32 35 
    69ab:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    69b2:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    69b9:	00 00 00 
    69bc:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    69c3:	00 00 00 
    69c6:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    69cd:	00 00 00 
    69d0:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    69d7:	00 00 00 
    69da:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    69e1:	00 00 00 
    69e4:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    69eb:	00 00 00 
    69ee:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    69f5:	00 00 00 
    69f8:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    69fe:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    6a04:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    6a0b:	02 00 00 
    6a0e:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    6a15:	32 36 
    6a17:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    6a1e:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    6a25:	00 00 00 
    6a28:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    6a2f:	00 00 00 
    6a32:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    6a39:	00 00 00 
    6a3c:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    6a43:	00 00 00 
    6a46:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    6a4d:	00 00 00 
    6a50:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    6a57:	00 00 00 
    6a5a:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    6a61:	00 00 00 
    6a64:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6a6a:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    6a70:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    6a77:	02 00 00 
    6a7a:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    6a81:	32 37 
    6a83:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    6a8a:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    6a91:	00 00 00 
    6a94:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    6a9b:	00 00 00 
    6a9e:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    6aa5:	00 00 00 
    6aa8:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    6aaf:	00 00 00 
    6ab2:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    6ab9:	00 00 00 
    6abc:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    6ac3:	00 00 00 
    6ac6:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    6acd:	00 00 00 
    6ad0:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6ad6:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    6adc:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    6ae3:	02 00 00 
    6ae6:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    6aed:	32 38 
    6aef:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    6af6:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    6afd:	00 00 00 
    6b00:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    6b07:	00 00 00 
    6b0a:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    6b11:	00 00 00 
    6b14:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    6b1b:	00 00 00 
    6b1e:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    6b25:	00 00 00 
    6b28:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    6b2f:	00 00 00 
    6b32:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    6b39:	00 00 00 
    6b3c:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6b42:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    6b48:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    6b4f:	02 00 00 
    6b52:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    6b59:	32 39 
    6b5b:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    6b62:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    6b69:	00 00 00 
    6b6c:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    6b73:	00 00 00 
    6b76:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    6b7d:	00 00 00 
    6b80:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    6b87:	01 00 00 
    6b8a:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    6b91:	00 00 00 
    6b94:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    6b9b:	00 00 00 
    6b9e:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    6ba5:	00 00 00 
    6ba8:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6bae:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    6bb4:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    6bbb:	02 00 00 
    6bbe:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    6bc5:	33 30 
    6bc7:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    6bce:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    6bd5:	00 00 00 
    6bd8:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    6bdf:	00 00 00 
    6be2:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    6be9:	00 00 00 
    6bec:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    6bf3:	07 00 00 
    6bf6:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    6bfd:	00 00 00 
    6c00:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    6c07:	00 00 00 
    6c0a:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    6c11:	00 00 00 
    6c14:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6c1a:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    6c20:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    6c27:	02 00 00 
    6c2a:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    6c31:	33 31 
    6c33:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    6c3a:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    6c41:	00 00 00 
    6c44:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    6c4b:	00 00 00 
    6c4e:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    6c55:	00 00 00 
    6c58:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    6c5f:	1f 00 00 
    6c62:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    6c69:	00 00 00 
    6c6c:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    6c73:	00 00 00 
    6c76:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    6c7d:	00 00 00 
    6c80:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6c86:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    6c8c:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    6c93:	02 00 00 
    6c96:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    6c9d:	33 32 
    6c9f:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    6ca6:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    6cad:	00 00 00 
    6cb0:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    6cb7:	00 00 00 
    6cba:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    6cc1:	00 00 00 
    6cc4:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    6ccb:	00 00 00 
    6cce:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    6cd5:	ff ff ff 
    6cd8:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    6cdf:	00 00 00 
    6ce2:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    6ce9:	00 00 00 
    6cec:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    6cf2:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    6cf8:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    6cff:	00 00 00 
    6d02:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    6d09:	33 33 
    6d0b:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    6d12:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    6d19:	00 00 00 
    6d1c:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    6d23:	00 00 00 
    6d26:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    6d2d:	00 00 00 
    6d30:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    6d37:	00 00 00 
    6d3a:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    6d41:	ff ff ff 
    6d44:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    6d4b:	00 00 00 
    6d4e:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    6d55:	00 00 00 
    6d58:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    6d5e:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    6d64:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    6d6b:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    6d6e:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    6d74:	5b                   	pop    %ebx
    6d75:	5e                   	pop    %esi
    6d76:	5f                   	pop    %edi
    6d77:	5d                   	pop    %ebp
    6d78:	c3                   	ret    

00006d79 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    6d79:	55                   	push   %ebp
    6d7a:	89 e5                	mov    %esp,%ebp
    6d7c:	83 ec 18             	sub    $0x18,%esp
  HUFFBITS level;
  int point = 0;
    6d7f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    6d86:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    6d8d:	a1 d0 f3 00 00       	mov    0xf3d0,%eax
    6d92:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    6d95:	8b 45 08             	mov    0x8(%ebp),%eax
    6d98:	8b 40 20             	mov    0x20(%eax),%eax
    6d9b:	85 c0                	test   %eax,%eax
    6d9d:	75 0a                	jne    6da9 <huffman_decoder+0x30>
    6d9f:	b8 02 00 00 00       	mov    $0x2,%eax
    6da4:	e9 15 03 00 00       	jmp    70be <huffman_decoder+0x345>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    6da9:	8b 45 08             	mov    0x8(%ebp),%eax
    6dac:	8b 40 24             	mov    0x24(%eax),%eax
    6daf:	85 c0                	test   %eax,%eax
    6db1:	75 1d                	jne    6dd0 <huffman_decoder+0x57>
  {  *x = *y = 0;
    6db3:	8b 45 10             	mov    0x10(%ebp),%eax
    6db6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    6dbc:	8b 45 10             	mov    0x10(%ebp),%eax
    6dbf:	8b 10                	mov    (%eax),%edx
    6dc1:	8b 45 0c             	mov    0xc(%ebp),%eax
    6dc4:	89 10                	mov    %edx,(%eax)
     return 0;
    6dc6:	b8 00 00 00 00       	mov    $0x0,%eax
    6dcb:	e9 ee 02 00 00       	jmp    70be <huffman_decoder+0x345>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    6dd0:	8b 45 08             	mov    0x8(%ebp),%eax
    6dd3:	8b 40 20             	mov    0x20(%eax),%eax
    6dd6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6dd9:	01 d2                	add    %edx,%edx
    6ddb:	01 d0                	add    %edx,%eax
    6ddd:	0f b6 00             	movzbl (%eax),%eax
    6de0:	84 c0                	test   %al,%al
    6de2:	75 46                	jne    6e2a <huffman_decoder+0xb1>
      *x = h->val[point][1] >> 4;
    6de4:	8b 45 08             	mov    0x8(%ebp),%eax
    6de7:	8b 40 20             	mov    0x20(%eax),%eax
    6dea:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6ded:	01 d2                	add    %edx,%edx
    6def:	01 d0                	add    %edx,%eax
    6df1:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6df5:	c0 e8 04             	shr    $0x4,%al
    6df8:	0f b6 d0             	movzbl %al,%edx
    6dfb:	8b 45 0c             	mov    0xc(%ebp),%eax
    6dfe:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    6e00:	8b 45 08             	mov    0x8(%ebp),%eax
    6e03:	8b 40 20             	mov    0x20(%eax),%eax
    6e06:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e09:	01 d2                	add    %edx,%edx
    6e0b:	01 d0                	add    %edx,%eax
    6e0d:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e11:	0f b6 c0             	movzbl %al,%eax
    6e14:	83 e0 0f             	and    $0xf,%eax
    6e17:	89 c2                	mov    %eax,%edx
    6e19:	8b 45 10             	mov    0x10(%ebp),%eax
    6e1c:	89 10                	mov    %edx,(%eax)

      error = 0;
    6e1e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    6e25:	e9 af 00 00 00       	jmp    6ed9 <huffman_decoder+0x160>
    } 
    if (hget1bit()) {
    6e2a:	e8 4d e7 ff ff       	call   557c <hget1bit>
    6e2f:	85 c0                	test   %eax,%eax
    6e31:	74 47                	je     6e7a <huffman_decoder+0x101>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    6e33:	eb 17                	jmp    6e4c <huffman_decoder+0xd3>
    6e35:	8b 45 08             	mov    0x8(%ebp),%eax
    6e38:	8b 40 20             	mov    0x20(%eax),%eax
    6e3b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e3e:	01 d2                	add    %edx,%edx
    6e40:	01 d0                	add    %edx,%eax
    6e42:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e46:	0f b6 c0             	movzbl %al,%eax
    6e49:	01 45 f0             	add    %eax,-0x10(%ebp)
    6e4c:	8b 45 08             	mov    0x8(%ebp),%eax
    6e4f:	8b 40 20             	mov    0x20(%eax),%eax
    6e52:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e55:	01 d2                	add    %edx,%edx
    6e57:	01 d0                	add    %edx,%eax
    6e59:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e5d:	3c f9                	cmp    $0xf9,%al
    6e5f:	77 d4                	ja     6e35 <huffman_decoder+0xbc>
      point += h->val[point][1];
    6e61:	8b 45 08             	mov    0x8(%ebp),%eax
    6e64:	8b 40 20             	mov    0x20(%eax),%eax
    6e67:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e6a:	01 d2                	add    %edx,%edx
    6e6c:	01 d0                	add    %edx,%eax
    6e6e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e72:	0f b6 c0             	movzbl %al,%eax
    6e75:	01 45 f0             	add    %eax,-0x10(%ebp)
    6e78:	eb 42                	jmp    6ebc <huffman_decoder+0x143>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    6e7a:	eb 16                	jmp    6e92 <huffman_decoder+0x119>
    6e7c:	8b 45 08             	mov    0x8(%ebp),%eax
    6e7f:	8b 40 20             	mov    0x20(%eax),%eax
    6e82:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e85:	01 d2                	add    %edx,%edx
    6e87:	01 d0                	add    %edx,%eax
    6e89:	0f b6 00             	movzbl (%eax),%eax
    6e8c:	0f b6 c0             	movzbl %al,%eax
    6e8f:	01 45 f0             	add    %eax,-0x10(%ebp)
    6e92:	8b 45 08             	mov    0x8(%ebp),%eax
    6e95:	8b 40 20             	mov    0x20(%eax),%eax
    6e98:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e9b:	01 d2                	add    %edx,%edx
    6e9d:	01 d0                	add    %edx,%eax
    6e9f:	0f b6 00             	movzbl (%eax),%eax
    6ea2:	3c f9                	cmp    $0xf9,%al
    6ea4:	77 d6                	ja     6e7c <huffman_decoder+0x103>
      point += h->val[point][0];
    6ea6:	8b 45 08             	mov    0x8(%ebp),%eax
    6ea9:	8b 40 20             	mov    0x20(%eax),%eax
    6eac:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6eaf:	01 d2                	add    %edx,%edx
    6eb1:	01 d0                	add    %edx,%eax
    6eb3:	0f b6 00             	movzbl (%eax),%eax
    6eb6:	0f b6 c0             	movzbl %al,%eax
    6eb9:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    6ebc:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    6ebf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6ec3:	0f 85 07 ff ff ff    	jne    6dd0 <huffman_decoder+0x57>
    6ec9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6ecc:	a1 24 32 01 00       	mov    0x13224,%eax
    6ed1:	39 c2                	cmp    %eax,%edx
    6ed3:	0f 82 f7 fe ff ff    	jb     6dd0 <huffman_decoder+0x57>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    6ed9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6edd:	74 24                	je     6f03 <huffman_decoder+0x18a>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    6edf:	8b 45 08             	mov    0x8(%ebp),%eax
    6ee2:	8b 40 04             	mov    0x4(%eax),%eax
    6ee5:	83 e8 01             	sub    $0x1,%eax
    6ee8:	01 c0                	add    %eax,%eax
    6eea:	89 c2                	mov    %eax,%edx
    6eec:	8b 45 0c             	mov    0xc(%ebp),%eax
    6eef:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    6ef1:	8b 45 08             	mov    0x8(%ebp),%eax
    6ef4:	8b 40 08             	mov    0x8(%eax),%eax
    6ef7:	83 e8 01             	sub    $0x1,%eax
    6efa:	01 c0                	add    %eax,%eax
    6efc:	89 c2                	mov    %eax,%edx
    6efe:	8b 45 10             	mov    0x10(%ebp),%eax
    6f01:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    6f03:	8b 45 08             	mov    0x8(%ebp),%eax
    6f06:	0f b6 00             	movzbl (%eax),%eax
    6f09:	3c 33                	cmp    $0x33,%al
    6f0b:	0f 85 ec 00 00 00    	jne    6ffd <huffman_decoder+0x284>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    6f11:	8b 45 08             	mov    0x8(%ebp),%eax
    6f14:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6f18:	3c 32                	cmp    $0x32,%al
    6f1a:	74 0f                	je     6f2b <huffman_decoder+0x1b2>
    6f1c:	8b 45 08             	mov    0x8(%ebp),%eax
    6f1f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6f23:	3c 33                	cmp    $0x33,%al
    6f25:	0f 85 d2 00 00 00    	jne    6ffd <huffman_decoder+0x284>
     *v = (*y>>3) & 1;
    6f2b:	8b 45 10             	mov    0x10(%ebp),%eax
    6f2e:	8b 00                	mov    (%eax),%eax
    6f30:	c1 f8 03             	sar    $0x3,%eax
    6f33:	83 e0 01             	and    $0x1,%eax
    6f36:	89 c2                	mov    %eax,%edx
    6f38:	8b 45 14             	mov    0x14(%ebp),%eax
    6f3b:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    6f3d:	8b 45 10             	mov    0x10(%ebp),%eax
    6f40:	8b 00                	mov    (%eax),%eax
    6f42:	c1 f8 02             	sar    $0x2,%eax
    6f45:	83 e0 01             	and    $0x1,%eax
    6f48:	89 c2                	mov    %eax,%edx
    6f4a:	8b 45 18             	mov    0x18(%ebp),%eax
    6f4d:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    6f4f:	8b 45 10             	mov    0x10(%ebp),%eax
    6f52:	8b 00                	mov    (%eax),%eax
    6f54:	d1 f8                	sar    %eax
    6f56:	83 e0 01             	and    $0x1,%eax
    6f59:	89 c2                	mov    %eax,%edx
    6f5b:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f5e:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    6f60:	8b 45 10             	mov    0x10(%ebp),%eax
    6f63:	8b 00                	mov    (%eax),%eax
    6f65:	83 e0 01             	and    $0x1,%eax
    6f68:	89 c2                	mov    %eax,%edx
    6f6a:	8b 45 10             	mov    0x10(%ebp),%eax
    6f6d:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    6f6f:	8b 45 14             	mov    0x14(%ebp),%eax
    6f72:	8b 00                	mov    (%eax),%eax
    6f74:	85 c0                	test   %eax,%eax
    6f76:	74 18                	je     6f90 <huffman_decoder+0x217>
        if (hget1bit() == 1) *v = -*v;
    6f78:	e8 ff e5 ff ff       	call   557c <hget1bit>
    6f7d:	83 f8 01             	cmp    $0x1,%eax
    6f80:	75 0e                	jne    6f90 <huffman_decoder+0x217>
    6f82:	8b 45 14             	mov    0x14(%ebp),%eax
    6f85:	8b 00                	mov    (%eax),%eax
    6f87:	f7 d8                	neg    %eax
    6f89:	89 c2                	mov    %eax,%edx
    6f8b:	8b 45 14             	mov    0x14(%ebp),%eax
    6f8e:	89 10                	mov    %edx,(%eax)
     if (*w)
    6f90:	8b 45 18             	mov    0x18(%ebp),%eax
    6f93:	8b 00                	mov    (%eax),%eax
    6f95:	85 c0                	test   %eax,%eax
    6f97:	74 18                	je     6fb1 <huffman_decoder+0x238>
        if (hget1bit() == 1) *w = -*w;
    6f99:	e8 de e5 ff ff       	call   557c <hget1bit>
    6f9e:	83 f8 01             	cmp    $0x1,%eax
    6fa1:	75 0e                	jne    6fb1 <huffman_decoder+0x238>
    6fa3:	8b 45 18             	mov    0x18(%ebp),%eax
    6fa6:	8b 00                	mov    (%eax),%eax
    6fa8:	f7 d8                	neg    %eax
    6faa:	89 c2                	mov    %eax,%edx
    6fac:	8b 45 18             	mov    0x18(%ebp),%eax
    6faf:	89 10                	mov    %edx,(%eax)
     if (*x)
    6fb1:	8b 45 0c             	mov    0xc(%ebp),%eax
    6fb4:	8b 00                	mov    (%eax),%eax
    6fb6:	85 c0                	test   %eax,%eax
    6fb8:	74 18                	je     6fd2 <huffman_decoder+0x259>
        if (hget1bit() == 1) *x = -*x;
    6fba:	e8 bd e5 ff ff       	call   557c <hget1bit>
    6fbf:	83 f8 01             	cmp    $0x1,%eax
    6fc2:	75 0e                	jne    6fd2 <huffman_decoder+0x259>
    6fc4:	8b 45 0c             	mov    0xc(%ebp),%eax
    6fc7:	8b 00                	mov    (%eax),%eax
    6fc9:	f7 d8                	neg    %eax
    6fcb:	89 c2                	mov    %eax,%edx
    6fcd:	8b 45 0c             	mov    0xc(%ebp),%eax
    6fd0:	89 10                	mov    %edx,(%eax)
     if (*y)
    6fd2:	8b 45 10             	mov    0x10(%ebp),%eax
    6fd5:	8b 00                	mov    (%eax),%eax
    6fd7:	85 c0                	test   %eax,%eax
    6fd9:	74 1d                	je     6ff8 <huffman_decoder+0x27f>
        if (hget1bit() == 1) *y = -*y;
    6fdb:	e8 9c e5 ff ff       	call   557c <hget1bit>
    6fe0:	83 f8 01             	cmp    $0x1,%eax
    6fe3:	75 13                	jne    6ff8 <huffman_decoder+0x27f>
    6fe5:	8b 45 10             	mov    0x10(%ebp),%eax
    6fe8:	8b 00                	mov    (%eax),%eax
    6fea:	f7 d8                	neg    %eax
    6fec:	89 c2                	mov    %eax,%edx
    6fee:	8b 45 10             	mov    0x10(%ebp),%eax
    6ff1:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    6ff3:	e9 c3 00 00 00       	jmp    70bb <huffman_decoder+0x342>
    6ff8:	e9 be 00 00 00       	jmp    70bb <huffman_decoder+0x342>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    6ffd:	8b 45 08             	mov    0x8(%ebp),%eax
    7000:	8b 40 0c             	mov    0xc(%eax),%eax
    7003:	85 c0                	test   %eax,%eax
    7005:	74 34                	je     703b <huffman_decoder+0x2c2>
       if ((h->xlen-1) == *x) 
    7007:	8b 45 08             	mov    0x8(%ebp),%eax
    700a:	8b 40 04             	mov    0x4(%eax),%eax
    700d:	8d 50 ff             	lea    -0x1(%eax),%edx
    7010:	8b 45 0c             	mov    0xc(%ebp),%eax
    7013:	8b 00                	mov    (%eax),%eax
    7015:	39 c2                	cmp    %eax,%edx
    7017:	75 22                	jne    703b <huffman_decoder+0x2c2>
         *x += hgetbits(h->linbits);
    7019:	8b 45 08             	mov    0x8(%ebp),%eax
    701c:	8b 40 0c             	mov    0xc(%eax),%eax
    701f:	83 ec 0c             	sub    $0xc,%esp
    7022:	50                   	push   %eax
    7023:	e8 3c e5 ff ff       	call   5564 <hgetbits>
    7028:	83 c4 10             	add    $0x10,%esp
    702b:	89 c2                	mov    %eax,%edx
    702d:	8b 45 0c             	mov    0xc(%ebp),%eax
    7030:	8b 00                	mov    (%eax),%eax
    7032:	01 d0                	add    %edx,%eax
    7034:	89 c2                	mov    %eax,%edx
    7036:	8b 45 0c             	mov    0xc(%ebp),%eax
    7039:	89 10                	mov    %edx,(%eax)
     if (*x)
    703b:	8b 45 0c             	mov    0xc(%ebp),%eax
    703e:	8b 00                	mov    (%eax),%eax
    7040:	85 c0                	test   %eax,%eax
    7042:	74 18                	je     705c <huffman_decoder+0x2e3>
        if (hget1bit() == 1) *x = -*x;
    7044:	e8 33 e5 ff ff       	call   557c <hget1bit>
    7049:	83 f8 01             	cmp    $0x1,%eax
    704c:	75 0e                	jne    705c <huffman_decoder+0x2e3>
    704e:	8b 45 0c             	mov    0xc(%ebp),%eax
    7051:	8b 00                	mov    (%eax),%eax
    7053:	f7 d8                	neg    %eax
    7055:	89 c2                	mov    %eax,%edx
    7057:	8b 45 0c             	mov    0xc(%ebp),%eax
    705a:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    705c:	8b 45 08             	mov    0x8(%ebp),%eax
    705f:	8b 40 0c             	mov    0xc(%eax),%eax
    7062:	85 c0                	test   %eax,%eax
    7064:	74 34                	je     709a <huffman_decoder+0x321>
       if ((h->ylen-1) == *y)
    7066:	8b 45 08             	mov    0x8(%ebp),%eax
    7069:	8b 40 08             	mov    0x8(%eax),%eax
    706c:	8d 50 ff             	lea    -0x1(%eax),%edx
    706f:	8b 45 10             	mov    0x10(%ebp),%eax
    7072:	8b 00                	mov    (%eax),%eax
    7074:	39 c2                	cmp    %eax,%edx
    7076:	75 22                	jne    709a <huffman_decoder+0x321>
         *y += hgetbits(h->linbits);
    7078:	8b 45 08             	mov    0x8(%ebp),%eax
    707b:	8b 40 0c             	mov    0xc(%eax),%eax
    707e:	83 ec 0c             	sub    $0xc,%esp
    7081:	50                   	push   %eax
    7082:	e8 dd e4 ff ff       	call   5564 <hgetbits>
    7087:	83 c4 10             	add    $0x10,%esp
    708a:	89 c2                	mov    %eax,%edx
    708c:	8b 45 10             	mov    0x10(%ebp),%eax
    708f:	8b 00                	mov    (%eax),%eax
    7091:	01 d0                	add    %edx,%eax
    7093:	89 c2                	mov    %eax,%edx
    7095:	8b 45 10             	mov    0x10(%ebp),%eax
    7098:	89 10                	mov    %edx,(%eax)
     if (*y)
    709a:	8b 45 10             	mov    0x10(%ebp),%eax
    709d:	8b 00                	mov    (%eax),%eax
    709f:	85 c0                	test   %eax,%eax
    70a1:	74 18                	je     70bb <huffman_decoder+0x342>
        if (hget1bit() == 1) *y = -*y;
    70a3:	e8 d4 e4 ff ff       	call   557c <hget1bit>
    70a8:	83 f8 01             	cmp    $0x1,%eax
    70ab:	75 0e                	jne    70bb <huffman_decoder+0x342>
    70ad:	8b 45 10             	mov    0x10(%ebp),%eax
    70b0:	8b 00                	mov    (%eax),%eax
    70b2:	f7 d8                	neg    %eax
    70b4:	89 c2                	mov    %eax,%edx
    70b6:	8b 45 10             	mov    0x10(%ebp),%eax
    70b9:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    70bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    70be:	c9                   	leave  
    70bf:	c3                   	ret    

000070c0 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    70c0:	55                   	push   %ebp
    70c1:	89 e5                	mov    %esp,%ebp
    70c3:	83 ec 18             	sub    $0x18,%esp
    layer *hdr = fr_ps->header;
    70c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    70c9:	8b 00                	mov    (%eax),%eax
    70cb:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    70ce:	83 ec 0c             	sub    $0xc,%esp
    70d1:	ff 75 08             	pushl  0x8(%ebp)
    70d4:	e8 19 e0 ff ff       	call   50f2 <get1bit>
    70d9:	83 c4 10             	add    $0x10,%esp
    70dc:	89 c2                	mov    %eax,%edx
    70de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    70e1:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    70e3:	83 ec 08             	sub    $0x8,%esp
    70e6:	6a 02                	push   $0x2
    70e8:	ff 75 08             	pushl  0x8(%ebp)
    70eb:	e8 16 e1 ff ff       	call   5206 <getbits>
    70f0:	83 c4 10             	add    $0x10,%esp
    70f3:	ba 04 00 00 00       	mov    $0x4,%edx
    70f8:	29 c2                	sub    %eax,%edx
    70fa:	89 d0                	mov    %edx,%eax
    70fc:	89 c2                	mov    %eax,%edx
    70fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7101:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    7104:	83 ec 0c             	sub    $0xc,%esp
    7107:	ff 75 08             	pushl  0x8(%ebp)
    710a:	e8 e3 df ff ff       	call   50f2 <get1bit>
    710f:	83 c4 10             	add    $0x10,%esp
    7112:	85 c0                	test   %eax,%eax
    7114:	0f 94 c0             	sete   %al
    7117:	0f b6 d0             	movzbl %al,%edx
    711a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    711d:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    7120:	83 ec 08             	sub    $0x8,%esp
    7123:	6a 04                	push   $0x4
    7125:	ff 75 08             	pushl  0x8(%ebp)
    7128:	e8 d9 e0 ff ff       	call   5206 <getbits>
    712d:	83 c4 10             	add    $0x10,%esp
    7130:	89 c2                	mov    %eax,%edx
    7132:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7135:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    7138:	83 ec 08             	sub    $0x8,%esp
    713b:	6a 02                	push   $0x2
    713d:	ff 75 08             	pushl  0x8(%ebp)
    7140:	e8 c1 e0 ff ff       	call   5206 <getbits>
    7145:	83 c4 10             	add    $0x10,%esp
    7148:	89 c2                	mov    %eax,%edx
    714a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    714d:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    7150:	83 ec 0c             	sub    $0xc,%esp
    7153:	ff 75 08             	pushl  0x8(%ebp)
    7156:	e8 97 df ff ff       	call   50f2 <get1bit>
    715b:	83 c4 10             	add    $0x10,%esp
    715e:	89 c2                	mov    %eax,%edx
    7160:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7163:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    7166:	83 ec 0c             	sub    $0xc,%esp
    7169:	ff 75 08             	pushl  0x8(%ebp)
    716c:	e8 81 df ff ff       	call   50f2 <get1bit>
    7171:	83 c4 10             	add    $0x10,%esp
    7174:	89 c2                	mov    %eax,%edx
    7176:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7179:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    717c:	83 ec 08             	sub    $0x8,%esp
    717f:	6a 02                	push   $0x2
    7181:	ff 75 08             	pushl  0x8(%ebp)
    7184:	e8 7d e0 ff ff       	call   5206 <getbits>
    7189:	83 c4 10             	add    $0x10,%esp
    718c:	89 c2                	mov    %eax,%edx
    718e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7191:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    7194:	83 ec 08             	sub    $0x8,%esp
    7197:	6a 02                	push   $0x2
    7199:	ff 75 08             	pushl  0x8(%ebp)
    719c:	e8 65 e0 ff ff       	call   5206 <getbits>
    71a1:	83 c4 10             	add    $0x10,%esp
    71a4:	89 c2                	mov    %eax,%edx
    71a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71a9:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    71ac:	83 ec 0c             	sub    $0xc,%esp
    71af:	ff 75 08             	pushl  0x8(%ebp)
    71b2:	e8 3b df ff ff       	call   50f2 <get1bit>
    71b7:	83 c4 10             	add    $0x10,%esp
    71ba:	89 c2                	mov    %eax,%edx
    71bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71bf:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    71c2:	83 ec 0c             	sub    $0xc,%esp
    71c5:	ff 75 08             	pushl  0x8(%ebp)
    71c8:	e8 25 df ff ff       	call   50f2 <get1bit>
    71cd:	83 c4 10             	add    $0x10,%esp
    71d0:	89 c2                	mov    %eax,%edx
    71d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71d5:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    71d8:	83 ec 08             	sub    $0x8,%esp
    71db:	6a 02                	push   $0x2
    71dd:	ff 75 08             	pushl  0x8(%ebp)
    71e0:	e8 21 e0 ff ff       	call   5206 <getbits>
    71e5:	83 c4 10             	add    $0x10,%esp
    71e8:	89 c2                	mov    %eax,%edx
    71ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71ed:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    71f0:	c9                   	leave  
    71f1:	c3                   	ret    

000071f2 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    71f2:	55                   	push   %ebp
    71f3:	89 e5                	mov    %esp,%ebp
    71f5:	56                   	push   %esi
    71f6:	53                   	push   %ebx
    71f7:	83 ec 10             	sub    $0x10,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    71fa:	8b 45 10             	mov    0x10(%ebp),%eax
    71fd:	8b 40 08             	mov    0x8(%eax),%eax
    7200:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    7203:	83 ec 08             	sub    $0x8,%esp
    7206:	6a 09                	push   $0x9
    7208:	ff 75 08             	pushl  0x8(%ebp)
    720b:	e8 f6 df ff ff       	call   5206 <getbits>
    7210:	83 c4 10             	add    $0x10,%esp
    7213:	89 c2                	mov    %eax,%edx
    7215:	8b 45 0c             	mov    0xc(%ebp),%eax
    7218:	89 10                	mov    %edx,(%eax)
	if (stereo == 1)
    721a:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    721e:	75 1a                	jne    723a <III_get_side_info+0x48>
		si->private_bits = getbits(bs,5);
    7220:	83 ec 08             	sub    $0x8,%esp
    7223:	6a 05                	push   $0x5
    7225:	ff 75 08             	pushl  0x8(%ebp)
    7228:	e8 d9 df ff ff       	call   5206 <getbits>
    722d:	83 c4 10             	add    $0x10,%esp
    7230:	89 c2                	mov    %eax,%edx
    7232:	8b 45 0c             	mov    0xc(%ebp),%eax
    7235:	89 50 04             	mov    %edx,0x4(%eax)
    7238:	eb 18                	jmp    7252 <III_get_side_info+0x60>
	else
		si->private_bits = getbits(bs,3);
    723a:	83 ec 08             	sub    $0x8,%esp
    723d:	6a 03                	push   $0x3
    723f:	ff 75 08             	pushl  0x8(%ebp)
    7242:	e8 bf df ff ff       	call   5206 <getbits>
    7247:	83 c4 10             	add    $0x10,%esp
    724a:	89 c2                	mov    %eax,%edx
    724c:	8b 45 0c             	mov    0xc(%ebp),%eax
    724f:	89 50 04             	mov    %edx,0x4(%eax)

	for (ch=0; ch<stereo; ch++)
    7252:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7259:	eb 40                	jmp    729b <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    725b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7262:	eb 2d                	jmp    7291 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    7264:	83 ec 0c             	sub    $0xc,%esp
    7267:	ff 75 08             	pushl  0x8(%ebp)
    726a:	e8 83 de ff ff       	call   50f2 <get1bit>
    726f:	83 c4 10             	add    $0x10,%esp
    7272:	89 c3                	mov    %eax,%ebx
    7274:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7277:	8b 55 f4             	mov    -0xc(%ebp),%edx
    727a:	89 d0                	mov    %edx,%eax
    727c:	c1 e0 02             	shl    $0x2,%eax
    727f:	01 d0                	add    %edx,%eax
    7281:	c1 e0 03             	shl    $0x3,%eax
    7284:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7287:	01 d0                	add    %edx,%eax
    7289:	89 5c 81 08          	mov    %ebx,0x8(%ecx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    728d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7291:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    7295:	7e cd                	jle    7264 <III_get_side_info+0x72>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    7297:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    729b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    729e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    72a1:	7c b8                	jl     725b <III_get_side_info+0x69>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    72a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    72aa:	e9 cb 05 00 00       	jmp    787a <III_get_side_info+0x688>
		for (ch=0; ch<stereo; ch++) {
    72af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    72b6:	e9 af 05 00 00       	jmp    786a <III_get_side_info+0x678>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    72bb:	83 ec 08             	sub    $0x8,%esp
    72be:	6a 0c                	push   $0xc
    72c0:	ff 75 08             	pushl  0x8(%ebp)
    72c3:	e8 3e df ff ff       	call   5206 <getbits>
    72c8:	83 c4 10             	add    $0x10,%esp
    72cb:	89 c6                	mov    %eax,%esi
    72cd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    72d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    72d3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    72d6:	89 c2                	mov    %eax,%edx
    72d8:	c1 e2 03             	shl    $0x3,%edx
    72db:	01 c2                	add    %eax,%edx
    72dd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    72e4:	89 c2                	mov    %eax,%edx
    72e6:	89 c8                	mov    %ecx,%eax
    72e8:	c1 e0 02             	shl    $0x2,%eax
    72eb:	01 c8                	add    %ecx,%eax
    72ed:	c1 e0 05             	shl    $0x5,%eax
    72f0:	01 d0                	add    %edx,%eax
    72f2:	01 d8                	add    %ebx,%eax
    72f4:	83 c0 10             	add    $0x10,%eax
    72f7:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    72fa:	83 ec 08             	sub    $0x8,%esp
    72fd:	6a 09                	push   $0x9
    72ff:	ff 75 08             	pushl  0x8(%ebp)
    7302:	e8 ff de ff ff       	call   5206 <getbits>
    7307:	83 c4 10             	add    $0x10,%esp
    730a:	89 c6                	mov    %eax,%esi
    730c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    730f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7312:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7315:	89 c2                	mov    %eax,%edx
    7317:	c1 e2 03             	shl    $0x3,%edx
    731a:	01 c2                	add    %eax,%edx
    731c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7323:	89 c2                	mov    %eax,%edx
    7325:	89 c8                	mov    %ecx,%eax
    7327:	c1 e0 02             	shl    $0x2,%eax
    732a:	01 c8                	add    %ecx,%eax
    732c:	c1 e0 05             	shl    $0x5,%eax
    732f:	01 d0                	add    %edx,%eax
    7331:	01 d8                	add    %ebx,%eax
    7333:	83 c0 10             	add    $0x10,%eax
    7336:	89 70 0c             	mov    %esi,0xc(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    7339:	83 ec 08             	sub    $0x8,%esp
    733c:	6a 08                	push   $0x8
    733e:	ff 75 08             	pushl  0x8(%ebp)
    7341:	e8 c0 de ff ff       	call   5206 <getbits>
    7346:	83 c4 10             	add    $0x10,%esp
    7349:	89 c6                	mov    %eax,%esi
    734b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    734e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7351:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7354:	89 c2                	mov    %eax,%edx
    7356:	c1 e2 03             	shl    $0x3,%edx
    7359:	01 c2                	add    %eax,%edx
    735b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7362:	89 c2                	mov    %eax,%edx
    7364:	89 c8                	mov    %ecx,%eax
    7366:	c1 e0 02             	shl    $0x2,%eax
    7369:	01 c8                	add    %ecx,%eax
    736b:	c1 e0 05             	shl    $0x5,%eax
    736e:	01 d0                	add    %edx,%eax
    7370:	01 d8                	add    %ebx,%eax
    7372:	83 c0 10             	add    $0x10,%eax
    7375:	89 70 10             	mov    %esi,0x10(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    7378:	83 ec 08             	sub    $0x8,%esp
    737b:	6a 04                	push   $0x4
    737d:	ff 75 08             	pushl  0x8(%ebp)
    7380:	e8 81 de ff ff       	call   5206 <getbits>
    7385:	83 c4 10             	add    $0x10,%esp
    7388:	89 c6                	mov    %eax,%esi
    738a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    738d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7390:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7393:	89 c2                	mov    %eax,%edx
    7395:	c1 e2 03             	shl    $0x3,%edx
    7398:	01 c2                	add    %eax,%edx
    739a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    73a1:	89 c2                	mov    %eax,%edx
    73a3:	89 c8                	mov    %ecx,%eax
    73a5:	c1 e0 02             	shl    $0x2,%eax
    73a8:	01 c8                	add    %ecx,%eax
    73aa:	c1 e0 05             	shl    $0x5,%eax
    73ad:	01 d0                	add    %edx,%eax
    73af:	01 d8                	add    %ebx,%eax
    73b1:	83 c0 10             	add    $0x10,%eax
    73b4:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    73b7:	83 ec 0c             	sub    $0xc,%esp
    73ba:	ff 75 08             	pushl  0x8(%ebp)
    73bd:	e8 30 dd ff ff       	call   50f2 <get1bit>
    73c2:	83 c4 10             	add    $0x10,%esp
    73c5:	89 c6                	mov    %eax,%esi
    73c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    73ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73cd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    73d0:	89 c2                	mov    %eax,%edx
    73d2:	c1 e2 03             	shl    $0x3,%edx
    73d5:	01 c2                	add    %eax,%edx
    73d7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    73de:	89 c2                	mov    %eax,%edx
    73e0:	89 c8                	mov    %ecx,%eax
    73e2:	c1 e0 02             	shl    $0x2,%eax
    73e5:	01 c8                	add    %ecx,%eax
    73e7:	c1 e0 05             	shl    $0x5,%eax
    73ea:	01 d0                	add    %edx,%eax
    73ec:	01 d8                	add    %ebx,%eax
    73ee:	83 c0 20             	add    $0x20,%eax
    73f1:	89 70 08             	mov    %esi,0x8(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    73f4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    73f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73fa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    73fd:	89 c2                	mov    %eax,%edx
    73ff:	c1 e2 03             	shl    $0x3,%edx
    7402:	01 c2                	add    %eax,%edx
    7404:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    740b:	89 c2                	mov    %eax,%edx
    740d:	89 c8                	mov    %ecx,%eax
    740f:	c1 e0 02             	shl    $0x2,%eax
    7412:	01 c8                	add    %ecx,%eax
    7414:	c1 e0 05             	shl    $0x5,%eax
    7417:	01 d0                	add    %edx,%eax
    7419:	01 d8                	add    %ebx,%eax
    741b:	83 c0 20             	add    $0x20,%eax
    741e:	8b 40 08             	mov    0x8(%eax),%eax
    7421:	85 c0                	test   %eax,%eax
    7423:	0f 84 85 02 00 00    	je     76ae <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    7429:	83 ec 08             	sub    $0x8,%esp
    742c:	6a 02                	push   $0x2
    742e:	ff 75 08             	pushl  0x8(%ebp)
    7431:	e8 d0 dd ff ff       	call   5206 <getbits>
    7436:	83 c4 10             	add    $0x10,%esp
    7439:	89 c6                	mov    %eax,%esi
    743b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    743e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7441:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7444:	89 c2                	mov    %eax,%edx
    7446:	c1 e2 03             	shl    $0x3,%edx
    7449:	01 c2                	add    %eax,%edx
    744b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7452:	89 c2                	mov    %eax,%edx
    7454:	89 c8                	mov    %ecx,%eax
    7456:	c1 e0 02             	shl    $0x2,%eax
    7459:	01 c8                	add    %ecx,%eax
    745b:	c1 e0 05             	shl    $0x5,%eax
    745e:	01 d0                	add    %edx,%eax
    7460:	01 d8                	add    %ebx,%eax
    7462:	83 c0 20             	add    $0x20,%eax
    7465:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    7468:	83 ec 0c             	sub    $0xc,%esp
    746b:	ff 75 08             	pushl  0x8(%ebp)
    746e:	e8 7f dc ff ff       	call   50f2 <get1bit>
    7473:	83 c4 10             	add    $0x10,%esp
    7476:	89 c6                	mov    %eax,%esi
    7478:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    747b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    747e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7481:	89 c2                	mov    %eax,%edx
    7483:	c1 e2 03             	shl    $0x3,%edx
    7486:	01 c2                	add    %eax,%edx
    7488:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    748f:	89 c2                	mov    %eax,%edx
    7491:	89 c8                	mov    %ecx,%eax
    7493:	c1 e0 02             	shl    $0x2,%eax
    7496:	01 c8                	add    %ecx,%eax
    7498:	c1 e0 05             	shl    $0x5,%eax
    749b:	01 d0                	add    %edx,%eax
    749d:	01 d8                	add    %ebx,%eax
    749f:	83 c0 20             	add    $0x20,%eax
    74a2:	89 70 10             	mov    %esi,0x10(%eax)
				for (i=0; i<2; i++)
    74a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    74ac:	eb 43                	jmp    74f1 <III_get_side_info+0x2ff>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    74ae:	83 ec 08             	sub    $0x8,%esp
    74b1:	6a 05                	push   $0x5
    74b3:	ff 75 08             	pushl  0x8(%ebp)
    74b6:	e8 4b dd ff ff       	call   5206 <getbits>
    74bb:	83 c4 10             	add    $0x10,%esp
    74be:	89 c6                	mov    %eax,%esi
    74c0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    74c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    74c6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    74c9:	89 c2                	mov    %eax,%edx
    74cb:	c1 e2 03             	shl    $0x3,%edx
    74ce:	01 c2                	add    %eax,%edx
    74d0:	8d 04 12             	lea    (%edx,%edx,1),%eax
    74d3:	89 c2                	mov    %eax,%edx
    74d5:	89 c8                	mov    %ecx,%eax
    74d7:	c1 e0 02             	shl    $0x2,%eax
    74da:	01 c8                	add    %ecx,%eax
    74dc:	c1 e0 03             	shl    $0x3,%eax
    74df:	01 c2                	add    %eax,%edx
    74e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    74e4:	01 d0                	add    %edx,%eax
    74e6:	83 c0 08             	add    $0x8,%eax
    74e9:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    74ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    74f1:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    74f5:	7e b7                	jle    74ae <III_get_side_info+0x2bc>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    74f7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    74fe:	eb 43                	jmp    7543 <III_get_side_info+0x351>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    7500:	83 ec 08             	sub    $0x8,%esp
    7503:	6a 03                	push   $0x3
    7505:	ff 75 08             	pushl  0x8(%ebp)
    7508:	e8 f9 dc ff ff       	call   5206 <getbits>
    750d:	83 c4 10             	add    $0x10,%esp
    7510:	89 c6                	mov    %eax,%esi
    7512:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7515:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7518:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    751b:	89 c2                	mov    %eax,%edx
    751d:	c1 e2 03             	shl    $0x3,%edx
    7520:	01 c2                	add    %eax,%edx
    7522:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7525:	89 c2                	mov    %eax,%edx
    7527:	89 c8                	mov    %ecx,%eax
    7529:	c1 e0 02             	shl    $0x2,%eax
    752c:	01 c8                	add    %ecx,%eax
    752e:	c1 e0 03             	shl    $0x3,%eax
    7531:	01 c2                	add    %eax,%edx
    7533:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7536:	01 d0                	add    %edx,%eax
    7538:	83 c0 0c             	add    $0xc,%eax
    753b:	89 74 83 10          	mov    %esi,0x10(%ebx,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    753f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7543:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7547:	7e b7                	jle    7500 <III_get_side_info+0x30e>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    7549:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    754c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    754f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7552:	89 c2                	mov    %eax,%edx
    7554:	c1 e2 03             	shl    $0x3,%edx
    7557:	01 c2                	add    %eax,%edx
    7559:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7560:	89 c2                	mov    %eax,%edx
    7562:	89 c8                	mov    %ecx,%eax
    7564:	c1 e0 02             	shl    $0x2,%eax
    7567:	01 c8                	add    %ecx,%eax
    7569:	c1 e0 05             	shl    $0x5,%eax
    756c:	01 d0                	add    %edx,%eax
    756e:	01 d8                	add    %ebx,%eax
    7570:	83 c0 20             	add    $0x20,%eax
    7573:	8b 40 0c             	mov    0xc(%eax),%eax
    7576:	85 c0                	test   %eax,%eax
    7578:	75 05                	jne    757f <III_get_side_info+0x38d>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    757a:	e8 74 cc ff ff       	call   41f3 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    757f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7582:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7585:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7588:	89 c2                	mov    %eax,%edx
    758a:	c1 e2 03             	shl    $0x3,%edx
    758d:	01 c2                	add    %eax,%edx
    758f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7596:	89 c2                	mov    %eax,%edx
    7598:	89 c8                	mov    %ecx,%eax
    759a:	c1 e0 02             	shl    $0x2,%eax
    759d:	01 c8                	add    %ecx,%eax
    759f:	c1 e0 05             	shl    $0x5,%eax
    75a2:	01 d0                	add    %edx,%eax
    75a4:	01 d8                	add    %ebx,%eax
    75a6:	83 c0 20             	add    $0x20,%eax
    75a9:	8b 40 0c             	mov    0xc(%eax),%eax
    75ac:	83 f8 02             	cmp    $0x2,%eax
    75af:	75 64                	jne    7615 <III_get_side_info+0x423>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    75b1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    75b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75b7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    75ba:	89 c2                	mov    %eax,%edx
    75bc:	c1 e2 03             	shl    $0x3,%edx
    75bf:	01 c2                	add    %eax,%edx
    75c1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    75c8:	89 c2                	mov    %eax,%edx
    75ca:	89 c8                	mov    %ecx,%eax
    75cc:	c1 e0 02             	shl    $0x2,%eax
    75cf:	01 c8                	add    %ecx,%eax
    75d1:	c1 e0 05             	shl    $0x5,%eax
    75d4:	01 d0                	add    %edx,%eax
    75d6:	01 d8                	add    %ebx,%eax
    75d8:	83 c0 20             	add    $0x20,%eax
    75db:	8b 40 10             	mov    0x10(%eax),%eax
    75de:	85 c0                	test   %eax,%eax
    75e0:	75 33                	jne    7615 <III_get_side_info+0x423>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    75e2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    75e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75e8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    75eb:	89 c2                	mov    %eax,%edx
    75ed:	c1 e2 03             	shl    $0x3,%edx
    75f0:	01 c2                	add    %eax,%edx
    75f2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    75f9:	89 c2                	mov    %eax,%edx
    75fb:	89 c8                	mov    %ecx,%eax
    75fd:	c1 e0 02             	shl    $0x2,%eax
    7600:	01 c8                	add    %ecx,%eax
    7602:	c1 e0 05             	shl    $0x5,%eax
    7605:	01 d0                	add    %edx,%eax
    7607:	01 d8                	add    %ebx,%eax
    7609:	83 c0 40             	add    $0x40,%eax
    760c:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
    7613:	eb 31                	jmp    7646 <III_get_side_info+0x454>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    7615:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7618:	8b 45 f0             	mov    -0x10(%ebp),%eax
    761b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    761e:	89 c2                	mov    %eax,%edx
    7620:	c1 e2 03             	shl    $0x3,%edx
    7623:	01 c2                	add    %eax,%edx
    7625:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    762c:	89 c2                	mov    %eax,%edx
    762e:	89 c8                	mov    %ecx,%eax
    7630:	c1 e0 02             	shl    $0x2,%eax
    7633:	01 c8                	add    %ecx,%eax
    7635:	c1 e0 05             	shl    $0x5,%eax
    7638:	01 d0                	add    %edx,%eax
    763a:	01 d8                	add    %ebx,%eax
    763c:	83 c0 40             	add    $0x40,%eax
    763f:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    7646:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7649:	8b 45 f0             	mov    -0x10(%ebp),%eax
    764c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    764f:	89 c2                	mov    %eax,%edx
    7651:	c1 e2 03             	shl    $0x3,%edx
    7654:	01 c2                	add    %eax,%edx
    7656:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    765d:	89 c2                	mov    %eax,%edx
    765f:	89 c8                	mov    %ecx,%eax
    7661:	c1 e0 02             	shl    $0x2,%eax
    7664:	01 c8                	add    %ecx,%eax
    7666:	c1 e0 05             	shl    $0x5,%eax
    7669:	01 d0                	add    %edx,%eax
    766b:	01 d8                	add    %ebx,%eax
    766d:	83 c0 40             	add    $0x40,%eax
    7670:	8b 40 0c             	mov    0xc(%eax),%eax
    7673:	ba 14 00 00 00       	mov    $0x14,%edx
    7678:	89 d3                	mov    %edx,%ebx
    767a:	29 c3                	sub    %eax,%ebx
    767c:	8b 75 0c             	mov    0xc(%ebp),%esi
    767f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7682:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7685:	89 c2                	mov    %eax,%edx
    7687:	c1 e2 03             	shl    $0x3,%edx
    768a:	01 c2                	add    %eax,%edx
    768c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7693:	89 c2                	mov    %eax,%edx
    7695:	89 c8                	mov    %ecx,%eax
    7697:	c1 e0 02             	shl    $0x2,%eax
    769a:	01 c8                	add    %ecx,%eax
    769c:	c1 e0 05             	shl    $0x5,%eax
    769f:	01 d0                	add    %edx,%eax
    76a1:	01 f0                	add    %esi,%eax
    76a3:	83 c0 40             	add    $0x40,%eax
    76a6:	89 58 10             	mov    %ebx,0x10(%eax)
    76a9:	e9 01 01 00 00       	jmp    77af <III_get_side_info+0x5bd>
			}
			else {
				for (i=0; i<3; i++)
    76ae:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    76b5:	eb 43                	jmp    76fa <III_get_side_info+0x508>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    76b7:	83 ec 08             	sub    $0x8,%esp
    76ba:	6a 05                	push   $0x5
    76bc:	ff 75 08             	pushl  0x8(%ebp)
    76bf:	e8 42 db ff ff       	call   5206 <getbits>
    76c4:	83 c4 10             	add    $0x10,%esp
    76c7:	89 c6                	mov    %eax,%esi
    76c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    76cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    76cf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    76d2:	89 c2                	mov    %eax,%edx
    76d4:	c1 e2 03             	shl    $0x3,%edx
    76d7:	01 c2                	add    %eax,%edx
    76d9:	8d 04 12             	lea    (%edx,%edx,1),%eax
    76dc:	89 c2                	mov    %eax,%edx
    76de:	89 c8                	mov    %ecx,%eax
    76e0:	c1 e0 02             	shl    $0x2,%eax
    76e3:	01 c8                	add    %ecx,%eax
    76e5:	c1 e0 03             	shl    $0x3,%eax
    76e8:	01 c2                	add    %eax,%edx
    76ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
    76ed:	01 d0                	add    %edx,%eax
    76ef:	83 c0 08             	add    $0x8,%eax
    76f2:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    76f6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    76fa:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    76fe:	7e b7                	jle    76b7 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    7700:	83 ec 08             	sub    $0x8,%esp
    7703:	6a 04                	push   $0x4
    7705:	ff 75 08             	pushl  0x8(%ebp)
    7708:	e8 f9 da ff ff       	call   5206 <getbits>
    770d:	83 c4 10             	add    $0x10,%esp
    7710:	89 c6                	mov    %eax,%esi
    7712:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7715:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7718:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    771b:	89 c2                	mov    %eax,%edx
    771d:	c1 e2 03             	shl    $0x3,%edx
    7720:	01 c2                	add    %eax,%edx
    7722:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7729:	89 c2                	mov    %eax,%edx
    772b:	89 c8                	mov    %ecx,%eax
    772d:	c1 e0 02             	shl    $0x2,%eax
    7730:	01 c8                	add    %ecx,%eax
    7732:	c1 e0 05             	shl    $0x5,%eax
    7735:	01 d0                	add    %edx,%eax
    7737:	01 d8                	add    %ebx,%eax
    7739:	83 c0 40             	add    $0x40,%eax
    773c:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    773f:	83 ec 08             	sub    $0x8,%esp
    7742:	6a 03                	push   $0x3
    7744:	ff 75 08             	pushl  0x8(%ebp)
    7747:	e8 ba da ff ff       	call   5206 <getbits>
    774c:	83 c4 10             	add    $0x10,%esp
    774f:	89 c6                	mov    %eax,%esi
    7751:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7754:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7757:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    775a:	89 c2                	mov    %eax,%edx
    775c:	c1 e2 03             	shl    $0x3,%edx
    775f:	01 c2                	add    %eax,%edx
    7761:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7768:	89 c2                	mov    %eax,%edx
    776a:	89 c8                	mov    %ecx,%eax
    776c:	c1 e0 02             	shl    $0x2,%eax
    776f:	01 c8                	add    %ecx,%eax
    7771:	c1 e0 05             	shl    $0x5,%eax
    7774:	01 d0                	add    %edx,%eax
    7776:	01 d8                	add    %ebx,%eax
    7778:	83 c0 40             	add    $0x40,%eax
    777b:	89 70 10             	mov    %esi,0x10(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    777e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7781:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7784:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7787:	89 c2                	mov    %eax,%edx
    7789:	c1 e2 03             	shl    $0x3,%edx
    778c:	01 c2                	add    %eax,%edx
    778e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7795:	89 c2                	mov    %eax,%edx
    7797:	89 c8                	mov    %ecx,%eax
    7799:	c1 e0 02             	shl    $0x2,%eax
    779c:	01 c8                	add    %ecx,%eax
    779e:	c1 e0 05             	shl    $0x5,%eax
    77a1:	01 d0                	add    %edx,%eax
    77a3:	01 d8                	add    %ebx,%eax
    77a5:	83 c0 20             	add    $0x20,%eax
    77a8:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    77af:	83 ec 0c             	sub    $0xc,%esp
    77b2:	ff 75 08             	pushl  0x8(%ebp)
    77b5:	e8 38 d9 ff ff       	call   50f2 <get1bit>
    77ba:	83 c4 10             	add    $0x10,%esp
    77bd:	89 c6                	mov    %eax,%esi
    77bf:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    77c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    77c5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    77c8:	89 c2                	mov    %eax,%edx
    77ca:	c1 e2 03             	shl    $0x3,%edx
    77cd:	01 c2                	add    %eax,%edx
    77cf:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    77d6:	89 c2                	mov    %eax,%edx
    77d8:	89 c8                	mov    %ecx,%eax
    77da:	c1 e0 02             	shl    $0x2,%eax
    77dd:	01 c8                	add    %ecx,%eax
    77df:	c1 e0 05             	shl    $0x5,%eax
    77e2:	01 d0                	add    %edx,%eax
    77e4:	01 d8                	add    %ebx,%eax
    77e6:	83 c0 40             	add    $0x40,%eax
    77e9:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    77ec:	83 ec 0c             	sub    $0xc,%esp
    77ef:	ff 75 08             	pushl  0x8(%ebp)
    77f2:	e8 fb d8 ff ff       	call   50f2 <get1bit>
    77f7:	83 c4 10             	add    $0x10,%esp
    77fa:	89 c6                	mov    %eax,%esi
    77fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    77ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7802:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7805:	89 c2                	mov    %eax,%edx
    7807:	c1 e2 03             	shl    $0x3,%edx
    780a:	01 c2                	add    %eax,%edx
    780c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7813:	89 c2                	mov    %eax,%edx
    7815:	89 c8                	mov    %ecx,%eax
    7817:	c1 e0 02             	shl    $0x2,%eax
    781a:	01 c8                	add    %ecx,%eax
    781c:	c1 e0 05             	shl    $0x5,%eax
    781f:	01 d0                	add    %edx,%eax
    7821:	01 d8                	add    %ebx,%eax
    7823:	83 c0 50             	add    $0x50,%eax
    7826:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    7829:	83 ec 0c             	sub    $0xc,%esp
    782c:	ff 75 08             	pushl  0x8(%ebp)
    782f:	e8 be d8 ff ff       	call   50f2 <get1bit>
    7834:	83 c4 10             	add    $0x10,%esp
    7837:	89 c6                	mov    %eax,%esi
    7839:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    783c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    783f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7842:	89 c2                	mov    %eax,%edx
    7844:	c1 e2 03             	shl    $0x3,%edx
    7847:	01 c2                	add    %eax,%edx
    7849:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7850:	89 c2                	mov    %eax,%edx
    7852:	89 c8                	mov    %ecx,%eax
    7854:	c1 e0 02             	shl    $0x2,%eax
    7857:	01 c8                	add    %ecx,%eax
    7859:	c1 e0 05             	shl    $0x5,%eax
    785c:	01 d0                	add    %edx,%eax
    785e:	01 d8                	add    %ebx,%eax
    7860:	83 c0 50             	add    $0x50,%eax
    7863:	89 70 0c             	mov    %esi,0xc(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    7866:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    786a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    786d:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7870:	0f 8c 45 fa ff ff    	jl     72bb <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    7876:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    787a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    787e:	0f 8e 2b fa ff ff    	jle    72af <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    7884:	8d 65 f8             	lea    -0x8(%ebp),%esp
    7887:	5b                   	pop    %ebx
    7888:	5e                   	pop    %esi
    7889:	5d                   	pop    %ebp
    788a:	c3                   	ret    

0000788b <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    788b:	55                   	push   %ebp
    788c:	89 e5                	mov    %esp,%ebp
    788e:	56                   	push   %esi
    788f:	53                   	push   %ebx
    7890:	83 ec 10             	sub    $0x10,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    7893:	8b 45 10             	mov    0x10(%ebp),%eax
    7896:	89 c2                	mov    %eax,%edx
    7898:	c1 e2 03             	shl    $0x3,%edx
    789b:	01 c2                	add    %eax,%edx
    789d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    78a4:	89 c2                	mov    %eax,%edx
    78a6:	8b 4d 14             	mov    0x14(%ebp),%ecx
    78a9:	89 c8                	mov    %ecx,%eax
    78ab:	c1 e0 02             	shl    $0x2,%eax
    78ae:	01 c8                	add    %ecx,%eax
    78b0:	c1 e0 05             	shl    $0x5,%eax
    78b3:	01 d0                	add    %edx,%eax
    78b5:	8d 50 10             	lea    0x10(%eax),%edx
    78b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    78bb:	01 d0                	add    %edx,%eax
    78bd:	83 c0 08             	add    $0x8,%eax
    78c0:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    78c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    78c6:	8b 40 10             	mov    0x10(%eax),%eax
    78c9:	85 c0                	test   %eax,%eax
    78cb:	0f 84 93 02 00 00    	je     7b64 <III_get_scale_factors+0x2d9>
    78d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    78d4:	8b 40 14             	mov    0x14(%eax),%eax
    78d7:	83 f8 02             	cmp    $0x2,%eax
    78da:	0f 85 84 02 00 00    	jne    7b64 <III_get_scale_factors+0x2d9>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    78e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    78e3:	8b 40 18             	mov    0x18(%eax),%eax
    78e6:	85 c0                	test   %eax,%eax
    78e8:	0f 84 7c 01 00 00    	je     7a6a <III_get_scale_factors+0x1df>
			for (sfb = 0; sfb < 8; sfb++)
    78ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    78f5:	eb 3b                	jmp    7932 <III_get_scale_factors+0xa7>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    78f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    78fa:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    78fd:	8b 04 85 40 f4 00 00 	mov    0xf440(,%eax,4),%eax
    7904:	83 ec 0c             	sub    $0xc,%esp
    7907:	50                   	push   %eax
    7908:	e8 57 dc ff ff       	call   5564 <hgetbits>
    790d:	83 c4 10             	add    $0x10,%esp
    7910:	89 c3                	mov    %eax,%ebx
    7912:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7915:	8b 45 14             	mov    0x14(%ebp),%eax
    7918:	89 c2                	mov    %eax,%edx
    791a:	8d 04 12             	lea    (%edx,%edx,1),%eax
    791d:	89 c2                	mov    %eax,%edx
    791f:	89 d0                	mov    %edx,%eax
    7921:	c1 e0 05             	shl    $0x5,%eax
    7924:	29 d0                	sub    %edx,%eax
    7926:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7929:	01 d0                	add    %edx,%eax
    792b:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    792e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7932:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7936:	7e bf                	jle    78f7 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    7938:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    793f:	eb 60                	jmp    79a1 <III_get_scale_factors+0x116>
				for (window=0; window<3; window++)
    7941:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7948:	eb 4d                	jmp    7997 <III_get_scale_factors+0x10c>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    794a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    794d:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7950:	8b 04 85 40 f4 00 00 	mov    0xf440(,%eax,4),%eax
    7957:	83 ec 0c             	sub    $0xc,%esp
    795a:	50                   	push   %eax
    795b:	e8 04 dc ff ff       	call   5564 <hgetbits>
    7960:	83 c4 10             	add    $0x10,%esp
    7963:	89 c6                	mov    %eax,%esi
    7965:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7968:	8b 55 ec             	mov    -0x14(%ebp),%edx
    796b:	8b 4d 14             	mov    0x14(%ebp),%ecx
    796e:	89 d0                	mov    %edx,%eax
    7970:	01 c0                	add    %eax,%eax
    7972:	01 d0                	add    %edx,%eax
    7974:	c1 e0 02             	shl    $0x2,%eax
    7977:	01 d0                	add    %edx,%eax
    7979:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    797c:	89 d1                	mov    %edx,%ecx
    797e:	89 ca                	mov    %ecx,%edx
    7980:	c1 e2 05             	shl    $0x5,%edx
    7983:	29 ca                	sub    %ecx,%edx
    7985:	01 c2                	add    %eax,%edx
    7987:	8b 45 f4             	mov    -0xc(%ebp),%eax
    798a:	01 d0                	add    %edx,%eax
    798c:	83 c0 14             	add    $0x14,%eax
    798f:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    7993:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7997:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    799b:	7e ad                	jle    794a <III_get_scale_factors+0xbf>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    799d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    79a1:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    79a5:	7e 9a                	jle    7941 <III_get_scale_factors+0xb6>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    79a7:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    79ae:	eb 63                	jmp    7a13 <III_get_scale_factors+0x188>
				for (window=0; window<3; window++)
    79b0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    79b7:	eb 50                	jmp    7a09 <III_get_scale_factors+0x17e>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    79b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    79bc:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    79bf:	83 c0 10             	add    $0x10,%eax
    79c2:	8b 04 85 40 f4 00 00 	mov    0xf440(,%eax,4),%eax
    79c9:	83 ec 0c             	sub    $0xc,%esp
    79cc:	50                   	push   %eax
    79cd:	e8 92 db ff ff       	call   5564 <hgetbits>
    79d2:	83 c4 10             	add    $0x10,%esp
    79d5:	89 c6                	mov    %eax,%esi
    79d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    79da:	8b 55 ec             	mov    -0x14(%ebp),%edx
    79dd:	8b 4d 14             	mov    0x14(%ebp),%ecx
    79e0:	89 d0                	mov    %edx,%eax
    79e2:	01 c0                	add    %eax,%eax
    79e4:	01 d0                	add    %edx,%eax
    79e6:	c1 e0 02             	shl    $0x2,%eax
    79e9:	01 d0                	add    %edx,%eax
    79eb:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    79ee:	89 d1                	mov    %edx,%ecx
    79f0:	89 ca                	mov    %ecx,%edx
    79f2:	c1 e2 05             	shl    $0x5,%edx
    79f5:	29 ca                	sub    %ecx,%edx
    79f7:	01 c2                	add    %eax,%edx
    79f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    79fc:	01 d0                	add    %edx,%eax
    79fe:	83 c0 14             	add    $0x14,%eax
    7a01:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    7a05:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7a09:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7a0d:	7e aa                	jle    79b9 <III_get_scale_factors+0x12e>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    7a0f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7a13:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7a17:	7e 97                	jle    79b0 <III_get_scale_factors+0x125>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    7a19:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7a20:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7a27:	eb 36                	jmp    7a5f <III_get_scale_factors+0x1d4>
				(*scalefac)[ch].s[window][sfb] = 0;
    7a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7a2c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7a2f:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7a32:	89 d0                	mov    %edx,%eax
    7a34:	01 c0                	add    %eax,%eax
    7a36:	01 d0                	add    %edx,%eax
    7a38:	c1 e0 02             	shl    $0x2,%eax
    7a3b:	01 d0                	add    %edx,%eax
    7a3d:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7a40:	89 d1                	mov    %edx,%ecx
    7a42:	89 ca                	mov    %ecx,%edx
    7a44:	c1 e2 05             	shl    $0x5,%edx
    7a47:	29 ca                	sub    %ecx,%edx
    7a49:	01 c2                	add    %eax,%edx
    7a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7a4e:	01 d0                	add    %edx,%eax
    7a50:	83 c0 14             	add    $0x14,%eax
    7a53:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7a5a:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    7a5b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7a5f:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7a63:	7e c4                	jle    7a29 <III_get_scale_factors+0x19e>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7a65:	e9 bf 01 00 00       	jmp    7c29 <III_get_scale_factors+0x39e>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7a6a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7a71:	e9 93 00 00 00       	jmp    7b09 <III_get_scale_factors+0x27e>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    7a76:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a79:	83 c0 04             	add    $0x4,%eax
    7a7c:	8b 04 85 04 f4 00 00 	mov    0xf404(,%eax,4),%eax
    7a83:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7a86:	eb 68                	jmp    7af0 <III_get_scale_factors+0x265>
					for (window=0; window<3; window++)
    7a88:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7a8f:	eb 55                	jmp    7ae6 <III_get_scale_factors+0x25b>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    7a91:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7a94:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    7a97:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7a9a:	c1 e2 04             	shl    $0x4,%edx
    7a9d:	01 d0                	add    %edx,%eax
    7a9f:	8b 04 85 40 f4 00 00 	mov    0xf440(,%eax,4),%eax
    7aa6:	83 ec 0c             	sub    $0xc,%esp
    7aa9:	50                   	push   %eax
    7aaa:	e8 b5 da ff ff       	call   5564 <hgetbits>
    7aaf:	83 c4 10             	add    $0x10,%esp
    7ab2:	89 c6                	mov    %eax,%esi
    7ab4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7ab7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7aba:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7abd:	89 d0                	mov    %edx,%eax
    7abf:	01 c0                	add    %eax,%eax
    7ac1:	01 d0                	add    %edx,%eax
    7ac3:	c1 e0 02             	shl    $0x2,%eax
    7ac6:	01 d0                	add    %edx,%eax
    7ac8:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7acb:	89 d1                	mov    %edx,%ecx
    7acd:	89 ca                	mov    %ecx,%edx
    7acf:	c1 e2 05             	shl    $0x5,%edx
    7ad2:	29 ca                	sub    %ecx,%edx
    7ad4:	01 c2                	add    %eax,%edx
    7ad6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ad9:	01 d0                	add    %edx,%eax
    7adb:	83 c0 14             	add    $0x14,%eax
    7ade:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    7ae2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7ae6:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7aea:	7e a5                	jle    7a91 <III_get_scale_factors+0x206>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    7aec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7af0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7af3:	83 c0 01             	add    $0x1,%eax
    7af6:	83 c0 04             	add    $0x4,%eax
    7af9:	8b 04 85 04 f4 00 00 	mov    0xf404(,%eax,4),%eax
    7b00:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7b03:	7f 83                	jg     7a88 <III_get_scale_factors+0x1fd>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7b05:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7b09:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7b0d:	0f 8e 63 ff ff ff    	jle    7a76 <III_get_scale_factors+0x1eb>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7b13:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7b1a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7b21:	eb 36                	jmp    7b59 <III_get_scale_factors+0x2ce>
					(*scalefac)[ch].s[window][sfb] = 0;
    7b23:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7b26:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7b29:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7b2c:	89 d0                	mov    %edx,%eax
    7b2e:	01 c0                	add    %eax,%eax
    7b30:	01 d0                	add    %edx,%eax
    7b32:	c1 e0 02             	shl    $0x2,%eax
    7b35:	01 d0                	add    %edx,%eax
    7b37:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7b3a:	89 d1                	mov    %edx,%ecx
    7b3c:	89 ca                	mov    %ecx,%edx
    7b3e:	c1 e2 05             	shl    $0x5,%edx
    7b41:	29 ca                	sub    %ecx,%edx
    7b43:	01 c2                	add    %eax,%edx
    7b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b48:	01 d0                	add    %edx,%eax
    7b4a:	83 c0 14             	add    $0x14,%eax
    7b4d:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7b54:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7b55:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7b59:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7b5d:	7e c4                	jle    7b23 <III_get_scale_factors+0x298>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7b5f:	e9 c5 00 00 00       	jmp    7c29 <III_get_scale_factors+0x39e>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7b64:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7b6b:	e9 92 00 00 00       	jmp    7c02 <III_get_scale_factors+0x377>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    7b70:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7b73:	8b 55 14             	mov    0x14(%ebp),%edx
    7b76:	89 d0                	mov    %edx,%eax
    7b78:	c1 e0 02             	shl    $0x2,%eax
    7b7b:	01 d0                	add    %edx,%eax
    7b7d:	c1 e0 03             	shl    $0x3,%eax
    7b80:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b83:	01 d0                	add    %edx,%eax
    7b85:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    7b89:	85 c0                	test   %eax,%eax
    7b8b:	74 06                	je     7b93 <III_get_scale_factors+0x308>
    7b8d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    7b91:	75 6b                	jne    7bfe <III_get_scale_factors+0x373>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7b93:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b96:	8b 04 85 00 f4 00 00 	mov    0xf400(,%eax,4),%eax
    7b9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7ba0:	eb 4a                	jmp    7bec <III_get_scale_factors+0x361>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    7ba2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7ba6:	0f 9f c0             	setg   %al
    7ba9:	0f b6 d0             	movzbl %al,%edx
    7bac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7baf:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    7bb2:	c1 e2 04             	shl    $0x4,%edx
    7bb5:	01 d0                	add    %edx,%eax
    7bb7:	8b 04 85 40 f4 00 00 	mov    0xf440(,%eax,4),%eax
    7bbe:	83 ec 0c             	sub    $0xc,%esp
    7bc1:	50                   	push   %eax
    7bc2:	e8 9d d9 ff ff       	call   5564 <hgetbits>
    7bc7:	83 c4 10             	add    $0x10,%esp
    7bca:	89 c3                	mov    %eax,%ebx
    7bcc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7bcf:	8b 45 14             	mov    0x14(%ebp),%eax
    7bd2:	89 c2                	mov    %eax,%edx
    7bd4:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7bd7:	89 c2                	mov    %eax,%edx
    7bd9:	89 d0                	mov    %edx,%eax
    7bdb:	c1 e0 05             	shl    $0x5,%eax
    7bde:	29 d0                	sub    %edx,%eax
    7be0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7be3:	01 d0                	add    %edx,%eax
    7be5:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7be8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7bec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7bef:	83 c0 01             	add    $0x1,%eax
    7bf2:	8b 04 85 00 f4 00 00 	mov    0xf400(,%eax,4),%eax
    7bf9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7bfc:	7f a4                	jg     7ba2 <III_get_scale_factors+0x317>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7bfe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7c02:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7c06:	0f 8e 64 ff ff ff    	jle    7b70 <III_get_scale_factors+0x2e5>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    7c0c:	8b 55 08             	mov    0x8(%ebp),%edx
    7c0f:	8b 45 14             	mov    0x14(%ebp),%eax
    7c12:	c1 e0 03             	shl    $0x3,%eax
    7c15:	89 c1                	mov    %eax,%ecx
    7c17:	c1 e1 05             	shl    $0x5,%ecx
    7c1a:	29 c1                	sub    %eax,%ecx
    7c1c:	89 c8                	mov    %ecx,%eax
    7c1e:	83 c0 58             	add    $0x58,%eax
    7c21:	01 d0                	add    %edx,%eax
    7c23:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    7c29:	8d 65 f8             	lea    -0x8(%ebp),%esp
    7c2c:	5b                   	pop    %ebx
    7c2d:	5e                   	pop    %esi
    7c2e:	5d                   	pop    %ebp
    7c2f:	c3                   	ret    

00007c30 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    7c30:	55                   	push   %ebp
    7c31:	89 e5                	mov    %esp,%ebp
    7c33:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    7c36:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    7c3b:	85 c0                	test   %eax,%eax
    7c3d:	74 02                	je     7c41 <initialize_huffman+0x11>
    7c3f:	eb 0f                	jmp    7c50 <initialize_huffman+0x20>
	read_decoder_table();
    7c41:	e8 7b d9 ff ff       	call   55c1 <read_decoder_table>
	huffman_initialized = TRUE;
    7c46:	c7 05 c0 f7 00 00 01 	movl   $0x1,0xf7c0
    7c4d:	00 00 00 
}
    7c50:	c9                   	leave  
    7c51:	c3                   	ret    

00007c52 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    7c52:	55                   	push   %ebp
    7c53:	89 e5                	mov    %esp,%ebp
    7c55:	57                   	push   %edi
    7c56:	56                   	push   %esi
    7c57:	53                   	push   %ebx
    7c58:	83 ec 2c             	sub    $0x2c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    7c5b:	e8 d0 ff ff ff       	call   7c30 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7c60:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7c63:	8b 45 14             	mov    0x14(%ebp),%eax
    7c66:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7c69:	89 c2                	mov    %eax,%edx
    7c6b:	c1 e2 03             	shl    $0x3,%edx
    7c6e:	01 c2                	add    %eax,%edx
    7c70:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c77:	89 c2                	mov    %eax,%edx
    7c79:	89 c8                	mov    %ecx,%eax
    7c7b:	c1 e0 02             	shl    $0x2,%eax
    7c7e:	01 c8                	add    %ecx,%eax
    7c80:	c1 e0 05             	shl    $0x5,%eax
    7c83:	01 d0                	add    %edx,%eax
    7c85:	01 d8                	add    %ebx,%eax
    7c87:	83 c0 20             	add    $0x20,%eax
    7c8a:	8b 40 08             	mov    0x8(%eax),%eax
    7c8d:	85 c0                	test   %eax,%eax
    7c8f:	74 45                	je     7cd6 <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    7c91:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7c94:	8b 45 14             	mov    0x14(%ebp),%eax
    7c97:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7c9a:	89 c2                	mov    %eax,%edx
    7c9c:	c1 e2 03             	shl    $0x3,%edx
    7c9f:	01 c2                	add    %eax,%edx
    7ca1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ca8:	89 c2                	mov    %eax,%edx
    7caa:	89 c8                	mov    %ecx,%eax
    7cac:	c1 e0 02             	shl    $0x2,%eax
    7caf:	01 c8                	add    %ecx,%eax
    7cb1:	c1 e0 05             	shl    $0x5,%eax
    7cb4:	01 d0                	add    %edx,%eax
    7cb6:	01 d8                	add    %ebx,%eax
    7cb8:	83 c0 20             	add    $0x20,%eax
    7cbb:	8b 40 0c             	mov    0xc(%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7cbe:	83 f8 02             	cmp    $0x2,%eax
    7cc1:	75 13                	jne    7cd6 <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    7cc3:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    7cca:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    7cd1:	e9 cf 00 00 00       	jmp    7da5 <III_hufman_decode+0x153>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7cd6:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7cd9:	8b 00                	mov    (%eax),%eax
    7cdb:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    7cde:	8b 75 0c             	mov    0xc(%ebp),%esi
    7ce1:	8b 45 14             	mov    0x14(%ebp),%eax
    7ce4:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7ce7:	89 c2                	mov    %eax,%edx
    7ce9:	c1 e2 03             	shl    $0x3,%edx
    7cec:	01 c2                	add    %eax,%edx
    7cee:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7cf5:	89 c2                	mov    %eax,%edx
    7cf7:	89 d8                	mov    %ebx,%eax
    7cf9:	c1 e0 02             	shl    $0x2,%eax
    7cfc:	01 d8                	add    %ebx,%eax
    7cfe:	c1 e0 05             	shl    $0x5,%eax
    7d01:	01 d0                	add    %edx,%eax
    7d03:	01 f0                	add    %esi,%eax
    7d05:	83 c0 40             	add    $0x40,%eax
    7d08:	8b 40 0c             	mov    0xc(%eax),%eax
    7d0b:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7d0e:	89 c8                	mov    %ecx,%eax
    7d10:	c1 e0 03             	shl    $0x3,%eax
    7d13:	01 c8                	add    %ecx,%eax
    7d15:	c1 e0 02             	shl    $0x2,%eax
    7d18:	01 c8                	add    %ecx,%eax
    7d1a:	01 d0                	add    %edx,%eax
    7d1c:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    7d23:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7d26:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7d29:	8b 00                	mov    (%eax),%eax
    7d2b:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7d2e:	8b 75 0c             	mov    0xc(%ebp),%esi
    7d31:	8b 45 14             	mov    0x14(%ebp),%eax
    7d34:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7d37:	89 c2                	mov    %eax,%edx
    7d39:	c1 e2 03             	shl    $0x3,%edx
    7d3c:	01 c2                	add    %eax,%edx
    7d3e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d45:	89 c2                	mov    %eax,%edx
    7d47:	89 d8                	mov    %ebx,%eax
    7d49:	c1 e0 02             	shl    $0x2,%eax
    7d4c:	01 d8                	add    %ebx,%eax
    7d4e:	c1 e0 05             	shl    $0x5,%eax
    7d51:	01 d0                	add    %edx,%eax
    7d53:	01 f0                	add    %esi,%eax
    7d55:	83 c0 40             	add    $0x40,%eax
    7d58:	8b 70 0c             	mov    0xc(%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    7d5b:	8b 7d 0c             	mov    0xc(%ebp),%edi
    7d5e:	8b 45 14             	mov    0x14(%ebp),%eax
    7d61:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7d64:	89 c2                	mov    %eax,%edx
    7d66:	c1 e2 03             	shl    $0x3,%edx
    7d69:	01 c2                	add    %eax,%edx
    7d6b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d72:	89 c2                	mov    %eax,%edx
    7d74:	89 d8                	mov    %ebx,%eax
    7d76:	c1 e0 02             	shl    $0x2,%eax
    7d79:	01 d8                	add    %ebx,%eax
    7d7b:	c1 e0 05             	shl    $0x5,%eax
    7d7e:	01 d0                	add    %edx,%eax
    7d80:	01 f8                	add    %edi,%eax
    7d82:	83 c0 40             	add    $0x40,%eax
    7d85:	8b 40 10             	mov    0x10(%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7d88:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    7d8a:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7d8d:	89 c8                	mov    %ecx,%eax
    7d8f:	c1 e0 03             	shl    $0x3,%eax
    7d92:	01 c8                	add    %ecx,%eax
    7d94:	c1 e0 02             	shl    $0x2,%eax
    7d97:	01 c8                	add    %ecx,%eax
    7d99:	01 d0                	add    %edx,%eax
    7d9b:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    7da2:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7da5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7dac:	e9 a6 01 00 00       	jmp    7f57 <III_hufman_decode+0x305>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    7db1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7db4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    7db7:	7d 44                	jge    7dfd <III_hufman_decode+0x1ab>
    7db9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7dbc:	8b 45 14             	mov    0x14(%ebp),%eax
    7dbf:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7dc2:	89 c2                	mov    %eax,%edx
    7dc4:	c1 e2 03             	shl    $0x3,%edx
    7dc7:	01 c2                	add    %eax,%edx
    7dc9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7dd0:	89 c2                	mov    %eax,%edx
    7dd2:	89 c8                	mov    %ecx,%eax
    7dd4:	c1 e0 02             	shl    $0x2,%eax
    7dd7:	01 c8                	add    %ecx,%eax
    7dd9:	c1 e0 05             	shl    $0x5,%eax
    7ddc:	01 d0                	add    %edx,%eax
    7dde:	01 d8                	add    %ebx,%eax
    7de0:	83 c0 20             	add    $0x20,%eax
    7de3:	8b 50 14             	mov    0x14(%eax),%edx
    7de6:	89 d0                	mov    %edx,%eax
    7de8:	c1 e0 02             	shl    $0x2,%eax
    7deb:	01 d0                	add    %edx,%eax
    7ded:	c1 e0 03             	shl    $0x3,%eax
    7df0:	05 00 32 01 00       	add    $0x13200,%eax
    7df5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7df8:	e9 88 00 00 00       	jmp    7e85 <III_hufman_decode+0x233>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    7dfd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7e00:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    7e03:	7d 41                	jge    7e46 <III_hufman_decode+0x1f4>
    7e05:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e08:	8b 45 14             	mov    0x14(%ebp),%eax
    7e0b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7e0e:	89 c2                	mov    %eax,%edx
    7e10:	c1 e2 03             	shl    $0x3,%edx
    7e13:	01 c2                	add    %eax,%edx
    7e15:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7e1c:	89 c2                	mov    %eax,%edx
    7e1e:	89 c8                	mov    %ecx,%eax
    7e20:	c1 e0 02             	shl    $0x2,%eax
    7e23:	01 c8                	add    %ecx,%eax
    7e25:	c1 e0 05             	shl    $0x5,%eax
    7e28:	01 d0                	add    %edx,%eax
    7e2a:	01 d8                	add    %ebx,%eax
    7e2c:	83 c0 24             	add    $0x24,%eax
    7e2f:	8b 50 14             	mov    0x14(%eax),%edx
    7e32:	89 d0                	mov    %edx,%eax
    7e34:	c1 e0 02             	shl    $0x2,%eax
    7e37:	01 d0                	add    %edx,%eax
    7e39:	c1 e0 03             	shl    $0x3,%eax
    7e3c:	05 00 32 01 00       	add    $0x13200,%eax
    7e41:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7e44:	eb 3f                	jmp    7e85 <III_hufman_decode+0x233>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    7e46:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e49:	8b 45 14             	mov    0x14(%ebp),%eax
    7e4c:	8b 4d 10             	mov    0x10(%ebp),%ecx
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
    7e70:	8b 50 14             	mov    0x14(%eax),%edx
    7e73:	89 d0                	mov    %edx,%eax
    7e75:	c1 e0 02             	shl    $0x2,%eax
    7e78:	01 d0                	add    %edx,%eax
    7e7a:	c1 e0 03             	shl    $0x3,%eax
    7e7d:	05 00 32 01 00       	add    $0x13200,%eax
    7e82:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    7e85:	83 ec 0c             	sub    $0xc,%esp
    7e88:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7e8b:	50                   	push   %eax
    7e8c:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7e8f:	50                   	push   %eax
    7e90:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7e93:	50                   	push   %eax
    7e94:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    7e97:	50                   	push   %eax
    7e98:	ff 75 e0             	pushl  -0x20(%ebp)
    7e9b:	e8 d9 ee ff ff       	call   6d79 <huffman_decoder>
    7ea0:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = x;
    7ea3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7ea6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7eab:	89 c8                	mov    %ecx,%eax
    7ead:	f7 ea                	imul   %edx
    7eaf:	c1 fa 02             	sar    $0x2,%edx
    7eb2:	89 c8                	mov    %ecx,%eax
    7eb4:	c1 f8 1f             	sar    $0x1f,%eax
    7eb7:	29 c2                	sub    %eax,%edx
    7eb9:	89 d0                	mov    %edx,%eax
    7ebb:	89 c2                	mov    %eax,%edx
    7ebd:	89 d0                	mov    %edx,%eax
    7ebf:	c1 e0 03             	shl    $0x3,%eax
    7ec2:	01 d0                	add    %edx,%eax
    7ec4:	c1 e0 03             	shl    $0x3,%eax
    7ec7:	89 c2                	mov    %eax,%edx
    7ec9:	8b 45 08             	mov    0x8(%ebp),%eax
    7ecc:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7ecf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7ed2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7ed7:	89 c8                	mov    %ecx,%eax
    7ed9:	f7 ea                	imul   %edx
    7edb:	c1 fa 02             	sar    $0x2,%edx
    7ede:	89 c8                	mov    %ecx,%eax
    7ee0:	c1 f8 1f             	sar    $0x1f,%eax
    7ee3:	29 c2                	sub    %eax,%edx
    7ee5:	89 d0                	mov    %edx,%eax
    7ee7:	c1 e0 03             	shl    $0x3,%eax
    7eea:	01 d0                	add    %edx,%eax
    7eec:	01 c0                	add    %eax,%eax
    7eee:	29 c1                	sub    %eax,%ecx
    7ef0:	89 ca                	mov    %ecx,%edx
    7ef2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7ef5:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    7ef8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7efb:	8d 48 01             	lea    0x1(%eax),%ecx
    7efe:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7f03:	89 c8                	mov    %ecx,%eax
    7f05:	f7 ea                	imul   %edx
    7f07:	c1 fa 02             	sar    $0x2,%edx
    7f0a:	89 c8                	mov    %ecx,%eax
    7f0c:	c1 f8 1f             	sar    $0x1f,%eax
    7f0f:	29 c2                	sub    %eax,%edx
    7f11:	89 d0                	mov    %edx,%eax
    7f13:	89 c2                	mov    %eax,%edx
    7f15:	89 d0                	mov    %edx,%eax
    7f17:	c1 e0 03             	shl    $0x3,%eax
    7f1a:	01 d0                	add    %edx,%eax
    7f1c:	c1 e0 03             	shl    $0x3,%eax
    7f1f:	89 c2                	mov    %eax,%edx
    7f21:	8b 45 08             	mov    0x8(%ebp),%eax
    7f24:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7f27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7f2a:	8d 48 01             	lea    0x1(%eax),%ecx
    7f2d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7f32:	89 c8                	mov    %ecx,%eax
    7f34:	f7 ea                	imul   %edx
    7f36:	c1 fa 02             	sar    $0x2,%edx
    7f39:	89 c8                	mov    %ecx,%eax
    7f3b:	c1 f8 1f             	sar    $0x1f,%eax
    7f3e:	29 c2                	sub    %eax,%edx
    7f40:	89 d0                	mov    %edx,%eax
    7f42:	c1 e0 03             	shl    $0x3,%eax
    7f45:	01 d0                	add    %edx,%eax
    7f47:	01 c0                	add    %eax,%eax
    7f49:	29 c1                	sub    %eax,%ecx
    7f4b:	89 ca                	mov    %ecx,%edx
    7f4d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7f50:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7f53:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    7f57:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    7f5a:	8b 75 0c             	mov    0xc(%ebp),%esi
    7f5d:	8b 45 14             	mov    0x14(%ebp),%eax
    7f60:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7f63:	89 c2                	mov    %eax,%edx
    7f65:	c1 e2 03             	shl    $0x3,%edx
    7f68:	01 c2                	add    %eax,%edx
    7f6a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7f71:	89 c2                	mov    %eax,%edx
    7f73:	89 c8                	mov    %ecx,%eax
    7f75:	c1 e0 02             	shl    $0x2,%eax
    7f78:	01 c8                	add    %ecx,%eax
    7f7a:	c1 e0 05             	shl    $0x5,%eax
    7f7d:	01 d0                	add    %edx,%eax
    7f7f:	01 f0                	add    %esi,%eax
    7f81:	83 c0 10             	add    $0x10,%eax
    7f84:	8b 40 0c             	mov    0xc(%eax),%eax
    7f87:	01 c0                	add    %eax,%eax
    7f89:	39 c3                	cmp    %eax,%ebx
    7f8b:	0f 82 20 fe ff ff    	jb     7db1 <III_hufman_decode+0x15f>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    7f91:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7f94:	8b 45 14             	mov    0x14(%ebp),%eax
    7f97:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7f9a:	89 c2                	mov    %eax,%edx
    7f9c:	c1 e2 03             	shl    $0x3,%edx
    7f9f:	01 c2                	add    %eax,%edx
    7fa1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7fa8:	89 c2                	mov    %eax,%edx
    7faa:	89 c8                	mov    %ecx,%eax
    7fac:	c1 e0 02             	shl    $0x2,%eax
    7faf:	01 c8                	add    %ecx,%eax
    7fb1:	c1 e0 05             	shl    $0x5,%eax
    7fb4:	01 d0                	add    %edx,%eax
    7fb6:	01 d8                	add    %ebx,%eax
    7fb8:	83 c0 50             	add    $0x50,%eax
    7fbb:	8b 40 0c             	mov    0xc(%eax),%eax
    7fbe:	8d 50 20             	lea    0x20(%eax),%edx
    7fc1:	89 d0                	mov    %edx,%eax
    7fc3:	c1 e0 02             	shl    $0x2,%eax
    7fc6:	01 d0                	add    %edx,%eax
    7fc8:	c1 e0 03             	shl    $0x3,%eax
    7fcb:	05 00 32 01 00       	add    $0x13200,%eax
    7fd0:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    7fd3:	e9 88 01 00 00       	jmp    8160 <III_hufman_decode+0x50e>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    7fd8:	83 ec 0c             	sub    $0xc,%esp
    7fdb:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7fde:	50                   	push   %eax
    7fdf:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7fe2:	50                   	push   %eax
    7fe3:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7fe6:	50                   	push   %eax
    7fe7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    7fea:	50                   	push   %eax
    7feb:	ff 75 e0             	pushl  -0x20(%ebp)
    7fee:	e8 86 ed ff ff       	call   6d79 <huffman_decoder>
    7ff3:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = v;
    7ff6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7ff9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7ffe:	89 c8                	mov    %ecx,%eax
    8000:	f7 ea                	imul   %edx
    8002:	c1 fa 02             	sar    $0x2,%edx
    8005:	89 c8                	mov    %ecx,%eax
    8007:	c1 f8 1f             	sar    $0x1f,%eax
    800a:	29 c2                	sub    %eax,%edx
    800c:	89 d0                	mov    %edx,%eax
    800e:	89 c2                	mov    %eax,%edx
    8010:	89 d0                	mov    %edx,%eax
    8012:	c1 e0 03             	shl    $0x3,%eax
    8015:	01 d0                	add    %edx,%eax
    8017:	c1 e0 03             	shl    $0x3,%eax
    801a:	89 c2                	mov    %eax,%edx
    801c:	8b 45 08             	mov    0x8(%ebp),%eax
    801f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8022:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8025:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    802a:	89 c8                	mov    %ecx,%eax
    802c:	f7 ea                	imul   %edx
    802e:	c1 fa 02             	sar    $0x2,%edx
    8031:	89 c8                	mov    %ecx,%eax
    8033:	c1 f8 1f             	sar    $0x1f,%eax
    8036:	29 c2                	sub    %eax,%edx
    8038:	89 d0                	mov    %edx,%eax
    803a:	c1 e0 03             	shl    $0x3,%eax
    803d:	01 d0                	add    %edx,%eax
    803f:	01 c0                	add    %eax,%eax
    8041:	29 c1                	sub    %eax,%ecx
    8043:	89 ca                	mov    %ecx,%edx
    8045:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8048:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    804b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    804e:	8d 48 01             	lea    0x1(%eax),%ecx
    8051:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8056:	89 c8                	mov    %ecx,%eax
    8058:	f7 ea                	imul   %edx
    805a:	c1 fa 02             	sar    $0x2,%edx
    805d:	89 c8                	mov    %ecx,%eax
    805f:	c1 f8 1f             	sar    $0x1f,%eax
    8062:	29 c2                	sub    %eax,%edx
    8064:	89 d0                	mov    %edx,%eax
    8066:	89 c2                	mov    %eax,%edx
    8068:	89 d0                	mov    %edx,%eax
    806a:	c1 e0 03             	shl    $0x3,%eax
    806d:	01 d0                	add    %edx,%eax
    806f:	c1 e0 03             	shl    $0x3,%eax
    8072:	89 c2                	mov    %eax,%edx
    8074:	8b 45 08             	mov    0x8(%ebp),%eax
    8077:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    807a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    807d:	8d 48 01             	lea    0x1(%eax),%ecx
    8080:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8085:	89 c8                	mov    %ecx,%eax
    8087:	f7 ea                	imul   %edx
    8089:	c1 fa 02             	sar    $0x2,%edx
    808c:	89 c8                	mov    %ecx,%eax
    808e:	c1 f8 1f             	sar    $0x1f,%eax
    8091:	29 c2                	sub    %eax,%edx
    8093:	89 d0                	mov    %edx,%eax
    8095:	c1 e0 03             	shl    $0x3,%eax
    8098:	01 d0                	add    %edx,%eax
    809a:	01 c0                	add    %eax,%eax
    809c:	29 c1                	sub    %eax,%ecx
    809e:	89 ca                	mov    %ecx,%edx
    80a0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    80a3:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    80a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    80a9:	8d 48 02             	lea    0x2(%eax),%ecx
    80ac:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    80b1:	89 c8                	mov    %ecx,%eax
    80b3:	f7 ea                	imul   %edx
    80b5:	c1 fa 02             	sar    $0x2,%edx
    80b8:	89 c8                	mov    %ecx,%eax
    80ba:	c1 f8 1f             	sar    $0x1f,%eax
    80bd:	29 c2                	sub    %eax,%edx
    80bf:	89 d0                	mov    %edx,%eax
    80c1:	89 c2                	mov    %eax,%edx
    80c3:	89 d0                	mov    %edx,%eax
    80c5:	c1 e0 03             	shl    $0x3,%eax
    80c8:	01 d0                	add    %edx,%eax
    80ca:	c1 e0 03             	shl    $0x3,%eax
    80cd:	89 c2                	mov    %eax,%edx
    80cf:	8b 45 08             	mov    0x8(%ebp),%eax
    80d2:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    80d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    80d8:	8d 48 02             	lea    0x2(%eax),%ecx
    80db:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    80e0:	89 c8                	mov    %ecx,%eax
    80e2:	f7 ea                	imul   %edx
    80e4:	c1 fa 02             	sar    $0x2,%edx
    80e7:	89 c8                	mov    %ecx,%eax
    80e9:	c1 f8 1f             	sar    $0x1f,%eax
    80ec:	29 c2                	sub    %eax,%edx
    80ee:	89 d0                	mov    %edx,%eax
    80f0:	c1 e0 03             	shl    $0x3,%eax
    80f3:	01 d0                	add    %edx,%eax
    80f5:	01 c0                	add    %eax,%eax
    80f7:	29 c1                	sub    %eax,%ecx
    80f9:	89 ca                	mov    %ecx,%edx
    80fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    80fe:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    8101:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8104:	8d 48 03             	lea    0x3(%eax),%ecx
    8107:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    810c:	89 c8                	mov    %ecx,%eax
    810e:	f7 ea                	imul   %edx
    8110:	c1 fa 02             	sar    $0x2,%edx
    8113:	89 c8                	mov    %ecx,%eax
    8115:	c1 f8 1f             	sar    $0x1f,%eax
    8118:	29 c2                	sub    %eax,%edx
    811a:	89 d0                	mov    %edx,%eax
    811c:	89 c2                	mov    %eax,%edx
    811e:	89 d0                	mov    %edx,%eax
    8120:	c1 e0 03             	shl    $0x3,%eax
    8123:	01 d0                	add    %edx,%eax
    8125:	c1 e0 03             	shl    $0x3,%eax
    8128:	89 c2                	mov    %eax,%edx
    812a:	8b 45 08             	mov    0x8(%ebp),%eax
    812d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8130:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8133:	8d 48 03             	lea    0x3(%eax),%ecx
    8136:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    813b:	89 c8                	mov    %ecx,%eax
    813d:	f7 ea                	imul   %edx
    813f:	c1 fa 02             	sar    $0x2,%edx
    8142:	89 c8                	mov    %ecx,%eax
    8144:	c1 f8 1f             	sar    $0x1f,%eax
    8147:	29 c2                	sub    %eax,%edx
    8149:	89 d0                	mov    %edx,%eax
    814b:	c1 e0 03             	shl    $0x3,%eax
    814e:	01 d0                	add    %edx,%eax
    8150:	01 c0                	add    %eax,%eax
    8152:	29 c1                	sub    %eax,%ecx
    8154:	89 ca                	mov    %ecx,%edx
    8156:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8159:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    815c:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    8160:	e8 e8 d3 ff ff       	call   554d <hsstell>
    8165:	89 c6                	mov    %eax,%esi
    8167:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    816a:	8b 45 14             	mov    0x14(%ebp),%eax
    816d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8170:	89 c2                	mov    %eax,%edx
    8172:	c1 e2 03             	shl    $0x3,%edx
    8175:	01 c2                	add    %eax,%edx
    8177:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    817e:	89 c2                	mov    %eax,%edx
    8180:	89 c8                	mov    %ecx,%eax
    8182:	c1 e0 02             	shl    $0x2,%eax
    8185:	01 c8                	add    %ecx,%eax
    8187:	c1 e0 05             	shl    $0x5,%eax
    818a:	01 d0                	add    %edx,%eax
    818c:	01 d8                	add    %ebx,%eax
    818e:	83 c0 10             	add    $0x10,%eax
    8191:	8b 50 08             	mov    0x8(%eax),%edx
    8194:	8b 45 18             	mov    0x18(%ebp),%eax
    8197:	01 d0                	add    %edx,%eax
    8199:	39 c6                	cmp    %eax,%esi
    819b:	73 0d                	jae    81aa <III_hufman_decode+0x558>
    819d:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    81a4:	0f 8e 2e fe ff ff    	jle    7fd8 <III_hufman_decode+0x386>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    81aa:	e8 9e d3 ff ff       	call   554d <hsstell>
    81af:	89 c6                	mov    %eax,%esi
    81b1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    81b4:	8b 45 14             	mov    0x14(%ebp),%eax
    81b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    81ba:	89 c2                	mov    %eax,%edx
    81bc:	c1 e2 03             	shl    $0x3,%edx
    81bf:	01 c2                	add    %eax,%edx
    81c1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    81c8:	89 c2                	mov    %eax,%edx
    81ca:	89 c8                	mov    %ecx,%eax
    81cc:	c1 e0 02             	shl    $0x2,%eax
    81cf:	01 c8                	add    %ecx,%eax
    81d1:	c1 e0 05             	shl    $0x5,%eax
    81d4:	01 d0                	add    %edx,%eax
    81d6:	01 d8                	add    %ebx,%eax
    81d8:	83 c0 10             	add    $0x10,%eax
    81db:	8b 50 08             	mov    0x8(%eax),%edx
    81de:	8b 45 18             	mov    0x18(%ebp),%eax
    81e1:	01 d0                	add    %edx,%eax
    81e3:	39 c6                	cmp    %eax,%esi
    81e5:	76 4f                	jbe    8236 <III_hufman_decode+0x5e4>
   {  i -=4;
    81e7:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    81eb:	e8 5d d3 ff ff       	call   554d <hsstell>
    81f0:	89 c2                	mov    %eax,%edx
    81f2:	8b 45 18             	mov    0x18(%ebp),%eax
    81f5:	89 d6                	mov    %edx,%esi
    81f7:	29 c6                	sub    %eax,%esi
    81f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    81fc:	8b 45 14             	mov    0x14(%ebp),%eax
    81ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8202:	89 c2                	mov    %eax,%edx
    8204:	c1 e2 03             	shl    $0x3,%edx
    8207:	01 c2                	add    %eax,%edx
    8209:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8210:	89 c2                	mov    %eax,%edx
    8212:	89 c8                	mov    %ecx,%eax
    8214:	c1 e0 02             	shl    $0x2,%eax
    8217:	01 c8                	add    %ecx,%eax
    8219:	c1 e0 05             	shl    $0x5,%eax
    821c:	01 d0                	add    %edx,%eax
    821e:	01 d8                	add    %ebx,%eax
    8220:	83 c0 10             	add    $0x10,%eax
    8223:	8b 40 08             	mov    0x8(%eax),%eax
    8226:	29 c6                	sub    %eax,%esi
    8228:	89 f0                	mov    %esi,%eax
    822a:	83 ec 0c             	sub    $0xc,%esp
    822d:	50                   	push   %eax
    822e:	e8 5e d3 ff ff       	call   5591 <rewindNbits>
    8233:	83 c4 10             	add    $0x10,%esp
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    8236:	e8 12 d3 ff ff       	call   554d <hsstell>
    823b:	89 c6                	mov    %eax,%esi
    823d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8240:	8b 45 14             	mov    0x14(%ebp),%eax
    8243:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8246:	89 c2                	mov    %eax,%edx
    8248:	c1 e2 03             	shl    $0x3,%edx
    824b:	01 c2                	add    %eax,%edx
    824d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8254:	89 c2                	mov    %eax,%edx
    8256:	89 c8                	mov    %ecx,%eax
    8258:	c1 e0 02             	shl    $0x2,%eax
    825b:	01 c8                	add    %ecx,%eax
    825d:	c1 e0 05             	shl    $0x5,%eax
    8260:	01 d0                	add    %edx,%eax
    8262:	01 d8                	add    %ebx,%eax
    8264:	83 c0 10             	add    $0x10,%eax
    8267:	8b 50 08             	mov    0x8(%eax),%edx
    826a:	8b 45 18             	mov    0x18(%ebp),%eax
    826d:	01 d0                	add    %edx,%eax
    826f:	39 c6                	cmp    %eax,%esi
    8271:	73 48                	jae    82bb <III_hufman_decode+0x669>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    8273:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8276:	8b 45 14             	mov    0x14(%ebp),%eax
    8279:	8b 4d 10             	mov    0x10(%ebp),%ecx
    827c:	89 c2                	mov    %eax,%edx
    827e:	c1 e2 03             	shl    $0x3,%edx
    8281:	01 c2                	add    %eax,%edx
    8283:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    828a:	89 c2                	mov    %eax,%edx
    828c:	89 c8                	mov    %ecx,%eax
    828e:	c1 e0 02             	shl    $0x2,%eax
    8291:	01 c8                	add    %ecx,%eax
    8293:	c1 e0 05             	shl    $0x5,%eax
    8296:	01 d0                	add    %edx,%eax
    8298:	01 d8                	add    %ebx,%eax
    829a:	83 c0 10             	add    $0x10,%eax
    829d:	8b 50 08             	mov    0x8(%eax),%edx
    82a0:	8b 45 18             	mov    0x18(%ebp),%eax
    82a3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    82a6:	e8 a2 d2 ff ff       	call   554d <hsstell>
    82ab:	29 c3                	sub    %eax,%ebx
    82ad:	89 d8                	mov    %ebx,%eax
    82af:	83 ec 0c             	sub    $0xc,%esp
    82b2:	50                   	push   %eax
    82b3:	e8 ac d2 ff ff       	call   5564 <hgetbits>
    82b8:	83 c4 10             	add    $0x10,%esp

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    82bb:	eb 5a                	jmp    8317 <III_hufman_decode+0x6c5>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    82bd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    82c0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    82c5:	89 c8                	mov    %ecx,%eax
    82c7:	f7 ea                	imul   %edx
    82c9:	c1 fa 02             	sar    $0x2,%edx
    82cc:	89 c8                	mov    %ecx,%eax
    82ce:	c1 f8 1f             	sar    $0x1f,%eax
    82d1:	29 c2                	sub    %eax,%edx
    82d3:	89 d0                	mov    %edx,%eax
    82d5:	89 c2                	mov    %eax,%edx
    82d7:	89 d0                	mov    %edx,%eax
    82d9:	c1 e0 03             	shl    $0x3,%eax
    82dc:	01 d0                	add    %edx,%eax
    82de:	c1 e0 03             	shl    $0x3,%eax
    82e1:	89 c2                	mov    %eax,%edx
    82e3:	8b 45 08             	mov    0x8(%ebp),%eax
    82e6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    82e9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    82ec:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    82f1:	89 c8                	mov    %ecx,%eax
    82f3:	f7 ea                	imul   %edx
    82f5:	c1 fa 02             	sar    $0x2,%edx
    82f8:	89 c8                	mov    %ecx,%eax
    82fa:	c1 f8 1f             	sar    $0x1f,%eax
    82fd:	29 c2                	sub    %eax,%edx
    82ff:	89 d0                	mov    %edx,%eax
    8301:	c1 e0 03             	shl    $0x3,%eax
    8304:	01 d0                	add    %edx,%eax
    8306:	01 c0                	add    %eax,%eax
    8308:	29 c1                	sub    %eax,%ecx
    830a:	89 ca                	mov    %ecx,%edx
    830c:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    8313:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    8317:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    831e:	7e 9d                	jle    82bd <III_hufman_decode+0x66b>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    8320:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8323:	5b                   	pop    %ebx
    8324:	5e                   	pop    %esi
    8325:	5f                   	pop    %edi
    8326:	5d                   	pop    %ebp
    8327:	c3                   	ret    

00008328 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    8328:	55                   	push   %ebp
    8329:	89 e5                	mov    %esp,%ebp
    832b:	53                   	push   %ebx
    832c:	83 ec 34             	sub    $0x34,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    832f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8336:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8339:	8b 00                	mov    (%eax),%eax
    833b:	8b 40 10             	mov    0x10(%eax),%eax
    833e:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    8341:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    8348:	8b 45 14             	mov    0x14(%ebp),%eax
    834b:	8b 40 10             	mov    0x10(%eax),%eax
    834e:	85 c0                	test   %eax,%eax
    8350:	74 6a                	je     83bc <III_dequantize_sample+0x94>
    8352:	8b 45 14             	mov    0x14(%ebp),%eax
    8355:	8b 40 14             	mov    0x14(%eax),%eax
    8358:	83 f8 02             	cmp    $0x2,%eax
    835b:	75 5f                	jne    83bc <III_dequantize_sample+0x94>
		if (gr_info->mixed_block_flag)
    835d:	8b 45 14             	mov    0x14(%ebp),%eax
    8360:	8b 40 18             	mov    0x18(%eax),%eax
    8363:	85 c0                	test   %eax,%eax
    8365:	74 18                	je     837f <III_dequantize_sample+0x57>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    8367:	8b 45 dc             	mov    -0x24(%ebp),%eax
    836a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8370:	83 c0 04             	add    $0x4,%eax
    8373:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    8378:	8b 00                	mov    (%eax),%eax
    837a:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    837d:	eb 53                	jmp    83d2 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    837f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8382:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8388:	83 c0 54             	add    $0x54,%eax
    838b:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    8390:	8b 50 0c             	mov    0xc(%eax),%edx
    8393:	89 d0                	mov    %edx,%eax
    8395:	01 c0                	add    %eax,%eax
    8397:	01 d0                	add    %edx,%eax
    8399:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    839c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    839f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    83a5:	83 c0 54             	add    $0x54,%eax
    83a8:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    83ad:	8b 40 0c             	mov    0xc(%eax),%eax
    83b0:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    83b3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    83ba:	eb 16                	jmp    83d2 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    83bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    83bf:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    83c5:	83 c0 04             	add    $0x4,%eax
    83c8:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    83cd:	8b 00                	mov    (%eax),%eax
    83cf:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    83d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    83d9:	e9 8a 06 00 00       	jmp    8a68 <III_dequantize_sample+0x740>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    83de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    83e5:	e9 70 06 00 00       	jmp    8a5a <III_dequantize_sample+0x732>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    83ea:	8b 55 f0             	mov    -0x10(%ebp),%edx
    83ed:	89 d0                	mov    %edx,%eax
    83ef:	c1 e0 03             	shl    $0x3,%eax
    83f2:	01 d0                	add    %edx,%eax
    83f4:	01 c0                	add    %eax,%eax
    83f6:	89 c2                	mov    %eax,%edx
    83f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83fb:	01 d0                	add    %edx,%eax
    83fd:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8400:	0f 85 a7 02 00 00    	jne    86ad <III_dequantize_sample+0x385>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8406:	8b 45 14             	mov    0x14(%ebp),%eax
    8409:	8b 40 10             	mov    0x10(%eax),%eax
    840c:	85 c0                	test   %eax,%eax
    840e:	0f 84 74 02 00 00    	je     8688 <III_dequantize_sample+0x360>
    8414:	8b 45 14             	mov    0x14(%ebp),%eax
    8417:	8b 40 14             	mov    0x14(%eax),%eax
    841a:	83 f8 02             	cmp    $0x2,%eax
    841d:	0f 85 65 02 00 00    	jne    8688 <III_dequantize_sample+0x360>
					if (gr_info->mixed_block_flag) {
    8423:	8b 45 14             	mov    0x14(%ebp),%eax
    8426:	8b 40 18             	mov    0x18(%eax),%eax
    8429:	85 c0                	test   %eax,%eax
    842b:	0f 84 b8 01 00 00    	je     85e9 <III_dequantize_sample+0x2c1>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    8431:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8434:	89 d0                	mov    %edx,%eax
    8436:	c1 e0 03             	shl    $0x3,%eax
    8439:	01 d0                	add    %edx,%eax
    843b:	01 c0                	add    %eax,%eax
    843d:	89 c2                	mov    %eax,%edx
    843f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8442:	01 c2                	add    %eax,%edx
    8444:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8447:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    844d:	83 c0 20             	add    $0x20,%eax
    8450:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    8455:	8b 00                	mov    (%eax),%eax
    8457:	39 c2                	cmp    %eax,%edx
    8459:	0f 85 96 00 00 00    	jne    84f5 <III_dequantize_sample+0x1cd>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    845f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8462:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8468:	83 c0 60             	add    $0x60,%eax
    846b:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    8470:	8b 50 0c             	mov    0xc(%eax),%edx
    8473:	89 d0                	mov    %edx,%eax
    8475:	01 c0                	add    %eax,%eax
    8477:	01 d0                	add    %edx,%eax
    8479:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    847c:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8483:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8486:	8d 48 01             	lea    0x1(%eax),%ecx
    8489:	8b 55 dc             	mov    -0x24(%ebp),%edx
    848c:	89 d0                	mov    %edx,%eax
    848e:	c1 e0 03             	shl    $0x3,%eax
    8491:	01 d0                	add    %edx,%eax
    8493:	c1 e0 02             	shl    $0x2,%eax
    8496:	01 d0                	add    %edx,%eax
    8498:	01 c8                	add    %ecx,%eax
    849a:	83 c0 14             	add    $0x14,%eax
    849d:	8b 0c 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    84a4:	8b 55 dc             	mov    -0x24(%ebp),%edx
    84a7:	89 d0                	mov    %edx,%eax
    84a9:	c1 e0 03             	shl    $0x3,%eax
    84ac:	01 d0                	add    %edx,%eax
    84ae:	c1 e0 02             	shl    $0x2,%eax
    84b1:	01 d0                	add    %edx,%eax
    84b3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    84b6:	01 d0                	add    %edx,%eax
    84b8:	83 c0 14             	add    $0x14,%eax
    84bb:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    84c2:	29 c1                	sub    %eax,%ecx
    84c4:	89 c8                	mov    %ecx,%eax
    84c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    84c9:	8b 55 dc             	mov    -0x24(%ebp),%edx
    84cc:	89 d0                	mov    %edx,%eax
    84ce:	c1 e0 03             	shl    $0x3,%eax
    84d1:	01 d0                	add    %edx,%eax
    84d3:	c1 e0 02             	shl    $0x2,%eax
    84d6:	01 d0                	add    %edx,%eax
    84d8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    84db:	01 d0                	add    %edx,%eax
    84dd:	83 c0 14             	add    $0x14,%eax
    84e0:	8b 14 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%edx
    84e7:	89 d0                	mov    %edx,%eax
    84e9:	01 c0                	add    %eax,%eax
    84eb:	01 d0                	add    %edx,%eax
    84ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    84f0:	e9 91 01 00 00       	jmp    8686 <III_dequantize_sample+0x35e>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    84f5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    84f8:	89 d0                	mov    %edx,%eax
    84fa:	c1 e0 03             	shl    $0x3,%eax
    84fd:	01 d0                	add    %edx,%eax
    84ff:	01 c0                	add    %eax,%eax
    8501:	89 c2                	mov    %eax,%edx
    8503:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8506:	01 c2                	add    %eax,%edx
    8508:	8b 45 dc             	mov    -0x24(%ebp),%eax
    850b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8511:	83 c0 20             	add    $0x20,%eax
    8514:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    8519:	8b 00                	mov    (%eax),%eax
    851b:	39 c2                	cmp    %eax,%edx
    851d:	7d 2a                	jge    8549 <III_dequantize_sample+0x221>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    851f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8523:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8526:	8d 48 01             	lea    0x1(%eax),%ecx
    8529:	8b 55 dc             	mov    -0x24(%ebp),%edx
    852c:	89 d0                	mov    %edx,%eax
    852e:	c1 e0 03             	shl    $0x3,%eax
    8531:	01 d0                	add    %edx,%eax
    8533:	c1 e0 02             	shl    $0x2,%eax
    8536:	01 d0                	add    %edx,%eax
    8538:	01 c8                	add    %ecx,%eax
    853a:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    8541:	89 45 e8             	mov    %eax,-0x18(%ebp)
    8544:	e9 3d 01 00 00       	jmp    8686 <III_dequantize_sample+0x35e>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8549:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    854d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8550:	8d 48 01             	lea    0x1(%eax),%ecx
    8553:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8556:	89 d0                	mov    %edx,%eax
    8558:	c1 e0 03             	shl    $0x3,%eax
    855b:	01 d0                	add    %edx,%eax
    855d:	c1 e0 02             	shl    $0x2,%eax
    8560:	01 d0                	add    %edx,%eax
    8562:	01 c8                	add    %ecx,%eax
    8564:	83 c0 14             	add    $0x14,%eax
    8567:	8b 14 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%edx
    856e:	89 d0                	mov    %edx,%eax
    8570:	01 c0                	add    %eax,%eax
    8572:	01 d0                	add    %edx,%eax
    8574:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8577:	8b 45 ec             	mov    -0x14(%ebp),%eax
    857a:	8d 48 01             	lea    0x1(%eax),%ecx
    857d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8580:	89 d0                	mov    %edx,%eax
    8582:	c1 e0 03             	shl    $0x3,%eax
    8585:	01 d0                	add    %edx,%eax
    8587:	c1 e0 02             	shl    $0x2,%eax
    858a:	01 d0                	add    %edx,%eax
    858c:	01 c8                	add    %ecx,%eax
    858e:	83 c0 14             	add    $0x14,%eax
    8591:	8b 0c 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    8598:	8b 55 dc             	mov    -0x24(%ebp),%edx
    859b:	89 d0                	mov    %edx,%eax
    859d:	c1 e0 03             	shl    $0x3,%eax
    85a0:	01 d0                	add    %edx,%eax
    85a2:	c1 e0 02             	shl    $0x2,%eax
    85a5:	01 d0                	add    %edx,%eax
    85a7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    85aa:	01 d0                	add    %edx,%eax
    85ac:	83 c0 14             	add    $0x14,%eax
    85af:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    85b6:	29 c1                	sub    %eax,%ecx
    85b8:	89 c8                	mov    %ecx,%eax
    85ba:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    85bd:	8b 55 dc             	mov    -0x24(%ebp),%edx
    85c0:	89 d0                	mov    %edx,%eax
    85c2:	c1 e0 03             	shl    $0x3,%eax
    85c5:	01 d0                	add    %edx,%eax
    85c7:	c1 e0 02             	shl    $0x2,%eax
    85ca:	01 d0                	add    %edx,%eax
    85cc:	8b 55 ec             	mov    -0x14(%ebp),%edx
    85cf:	01 d0                	add    %edx,%eax
    85d1:	83 c0 14             	add    $0x14,%eax
    85d4:	8b 14 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%edx
    85db:	89 d0                	mov    %edx,%eax
    85dd:	01 c0                	add    %eax,%eax
    85df:	01 d0                	add    %edx,%eax
    85e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    85e4:	e9 c4 00 00 00       	jmp    86ad <III_dequantize_sample+0x385>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    85e9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    85ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    85f0:	8d 48 01             	lea    0x1(%eax),%ecx
    85f3:	8b 55 dc             	mov    -0x24(%ebp),%edx
    85f6:	89 d0                	mov    %edx,%eax
    85f8:	c1 e0 03             	shl    $0x3,%eax
    85fb:	01 d0                	add    %edx,%eax
    85fd:	c1 e0 02             	shl    $0x2,%eax
    8600:	01 d0                	add    %edx,%eax
    8602:	01 c8                	add    %ecx,%eax
    8604:	83 c0 14             	add    $0x14,%eax
    8607:	8b 14 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%edx
    860e:	89 d0                	mov    %edx,%eax
    8610:	01 c0                	add    %eax,%eax
    8612:	01 d0                	add    %edx,%eax
    8614:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8617:	8b 45 ec             	mov    -0x14(%ebp),%eax
    861a:	8d 48 01             	lea    0x1(%eax),%ecx
    861d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8620:	89 d0                	mov    %edx,%eax
    8622:	c1 e0 03             	shl    $0x3,%eax
    8625:	01 d0                	add    %edx,%eax
    8627:	c1 e0 02             	shl    $0x2,%eax
    862a:	01 d0                	add    %edx,%eax
    862c:	01 c8                	add    %ecx,%eax
    862e:	83 c0 14             	add    $0x14,%eax
    8631:	8b 0c 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    8638:	8b 55 dc             	mov    -0x24(%ebp),%edx
    863b:	89 d0                	mov    %edx,%eax
    863d:	c1 e0 03             	shl    $0x3,%eax
    8640:	01 d0                	add    %edx,%eax
    8642:	c1 e0 02             	shl    $0x2,%eax
    8645:	01 d0                	add    %edx,%eax
    8647:	8b 55 ec             	mov    -0x14(%ebp),%edx
    864a:	01 d0                	add    %edx,%eax
    864c:	83 c0 14             	add    $0x14,%eax
    864f:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8656:	29 c1                	sub    %eax,%ecx
    8658:	89 c8                	mov    %ecx,%eax
    865a:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    865d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8660:	89 d0                	mov    %edx,%eax
    8662:	c1 e0 03             	shl    $0x3,%eax
    8665:	01 d0                	add    %edx,%eax
    8667:	c1 e0 02             	shl    $0x2,%eax
    866a:	01 d0                	add    %edx,%eax
    866c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    866f:	01 d0                	add    %edx,%eax
    8671:	83 c0 14             	add    $0x14,%eax
    8674:	8b 14 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%edx
    867b:	89 d0                	mov    %edx,%eax
    867d:	01 c0                	add    %eax,%eax
    867f:	01 d0                	add    %edx,%eax
    8681:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8684:	eb 27                	jmp    86ad <III_dequantize_sample+0x385>
    8686:	eb 25                	jmp    86ad <III_dequantize_sample+0x385>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    8688:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    868c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    868f:	8d 48 01             	lea    0x1(%eax),%ecx
    8692:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8695:	89 d0                	mov    %edx,%eax
    8697:	c1 e0 03             	shl    $0x3,%eax
    869a:	01 d0                	add    %edx,%eax
    869c:	c1 e0 02             	shl    $0x2,%eax
    869f:	01 d0                	add    %edx,%eax
    86a1:	01 c8                	add    %ecx,%eax
    86a3:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    86aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    86ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86b0:	89 d0                	mov    %edx,%eax
    86b2:	c1 e0 03             	shl    $0x3,%eax
    86b5:	01 d0                	add    %edx,%eax
    86b7:	c1 e0 04             	shl    $0x4,%eax
    86ba:	89 c2                	mov    %eax,%edx
    86bc:	8b 45 0c             	mov    0xc(%ebp),%eax
    86bf:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    86c2:	8b 45 14             	mov    0x14(%ebp),%eax
    86c5:	8b 40 08             	mov    0x8(%eax),%eax
    86c8:	89 45 c8             	mov    %eax,-0x38(%ebp)
    86cb:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    86d2:	df 6d c8             	fildll -0x38(%ebp)
    86d5:	dd 5d d0             	fstpl  -0x30(%ebp)
    86d8:	dd 45 d0             	fldl   -0x30(%ebp)
    86db:	dd 05 50 d9 00 00    	fldl   0xd950
    86e1:	de e9                	fsubrp %st,%st(1)
    86e3:	dd 05 58 d9 00 00    	fldl   0xd958
    86e9:	de c9                	fmulp  %st,%st(1)
    86eb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    86ef:	dd 1c 24             	fstpl  (%esp)
    86f2:	dd 05 60 d9 00 00    	fldl   0xd960
    86f8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    86fc:	dd 1c 24             	fstpl  (%esp)
    86ff:	e8 96 c1 ff ff       	call   489a <pow>
    8704:	83 c4 10             	add    $0x10,%esp
    8707:	8b 45 f4             	mov    -0xc(%ebp),%eax
    870a:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    870d:	8b 45 14             	mov    0x14(%ebp),%eax
    8710:	8b 40 10             	mov    0x10(%eax),%eax
    8713:	85 c0                	test   %eax,%eax
    8715:	0f 84 9c 01 00 00    	je     88b7 <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    871b:	8b 45 14             	mov    0x14(%ebp),%eax
    871e:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8721:	83 f8 02             	cmp    $0x2,%eax
    8724:	75 0a                	jne    8730 <III_dequantize_sample+0x408>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8726:	8b 45 14             	mov    0x14(%ebp),%eax
    8729:	8b 40 18             	mov    0x18(%eax),%eax
    872c:	85 c0                	test   %eax,%eax
    872e:	74 27                	je     8757 <III_dequantize_sample+0x42f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8730:	8b 45 14             	mov    0x14(%ebp),%eax
    8733:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8736:	83 f8 02             	cmp    $0x2,%eax
    8739:	0f 85 78 01 00 00    	jne    88b7 <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    873f:	8b 45 14             	mov    0x14(%ebp),%eax
    8742:	8b 40 18             	mov    0x18(%eax),%eax
    8745:	85 c0                	test   %eax,%eax
    8747:	0f 84 6a 01 00 00    	je     88b7 <III_dequantize_sample+0x58f>
    874d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8751:	0f 8e 60 01 00 00    	jle    88b7 <III_dequantize_sample+0x58f>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    8757:	8b 55 f0             	mov    -0x10(%ebp),%edx
    875a:	89 d0                	mov    %edx,%eax
    875c:	c1 e0 03             	shl    $0x3,%eax
    875f:	01 d0                	add    %edx,%eax
    8761:	01 c0                	add    %eax,%eax
    8763:	89 c2                	mov    %eax,%edx
    8765:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8768:	01 d0                	add    %edx,%eax
    876a:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    876d:	99                   	cltd   
    876e:	f7 7d e0             	idivl  -0x20(%ebp)
    8771:	89 c2                	mov    %eax,%edx
    8773:	8b 45 14             	mov    0x14(%ebp),%eax
    8776:	83 c2 08             	add    $0x8,%edx
    8779:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    877d:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8780:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8787:	df 6d c8             	fildll -0x38(%ebp)
    878a:	dd 5d d0             	fstpl  -0x30(%ebp)
    878d:	dd 45 d0             	fldl   -0x30(%ebp)
    8790:	dd 05 68 d9 00 00    	fldl   0xd968
    8796:	de c9                	fmulp  %st,%st(1)
    8798:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    879c:	dd 1c 24             	fstpl  (%esp)
    879f:	dd 05 60 d9 00 00    	fldl   0xd960
    87a5:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    87a9:	dd 1c 24             	fstpl  (%esp)
    87ac:	e8 e9 c0 ff ff       	call   489a <pow>
    87b1:	83 c4 10             	add    $0x10,%esp
    87b4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    87b7:	89 d0                	mov    %edx,%eax
    87b9:	c1 e0 03             	shl    $0x3,%eax
    87bc:	01 d0                	add    %edx,%eax
    87be:	c1 e0 04             	shl    $0x4,%eax
    87c1:	89 c2                	mov    %eax,%edx
    87c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    87c6:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    87c9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    87cc:	89 d0                	mov    %edx,%eax
    87ce:	c1 e0 03             	shl    $0x3,%eax
    87d1:	01 d0                	add    %edx,%eax
    87d3:	c1 e0 04             	shl    $0x4,%eax
    87d6:	89 c2                	mov    %eax,%edx
    87d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    87db:	01 c2                	add    %eax,%edx
    87dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87e0:	dd 04 c2             	fldl   (%edx,%eax,8)
    87e3:	de c9                	fmulp  %st,%st(1)
    87e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87e8:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    87eb:	8b 45 14             	mov    0x14(%ebp),%eax
    87ee:	8b 40 40             	mov    0x40(%eax),%eax
    87f1:	89 45 c8             	mov    %eax,-0x38(%ebp)
    87f4:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    87fb:	df 6d c8             	fildll -0x38(%ebp)
    87fe:	dd 5d d0             	fstpl  -0x30(%ebp)
    8801:	dd 45 d0             	fldl   -0x30(%ebp)
    8804:	d9 e8                	fld1   
    8806:	de c1                	faddp  %st,%st(1)
    8808:	dd 05 70 d9 00 00    	fldl   0xd970
    880e:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    8810:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8813:	89 d0                	mov    %edx,%eax
    8815:	c1 e0 03             	shl    $0x3,%eax
    8818:	01 d0                	add    %edx,%eax
    881a:	01 c0                	add    %eax,%eax
    881c:	89 c2                	mov    %eax,%edx
    881e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8821:	01 d0                	add    %edx,%eax
    8823:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8826:	99                   	cltd   
    8827:	f7 7d e0             	idivl  -0x20(%ebp)
    882a:	89 c2                	mov    %eax,%edx
    882c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    882f:	8b 4d 18             	mov    0x18(%ebp),%ecx
    8832:	89 d0                	mov    %edx,%eax
    8834:	01 c0                	add    %eax,%eax
    8836:	01 d0                	add    %edx,%eax
    8838:	c1 e0 02             	shl    $0x2,%eax
    883b:	01 d0                	add    %edx,%eax
    883d:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    8840:	89 d1                	mov    %edx,%ecx
    8842:	89 ca                	mov    %ecx,%edx
    8844:	c1 e2 05             	shl    $0x5,%edx
    8847:	29 ca                	sub    %ecx,%edx
    8849:	01 c2                	add    %eax,%edx
    884b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    884e:	01 d0                	add    %edx,%eax
    8850:	83 c0 14             	add    $0x14,%eax
    8853:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    8857:	89 45 c8             	mov    %eax,-0x38(%ebp)
    885a:	db 45 c8             	fildl  -0x38(%ebp)
    885d:	de c9                	fmulp  %st,%st(1)
    885f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8863:	dd 1c 24             	fstpl  (%esp)
    8866:	dd 05 60 d9 00 00    	fldl   0xd960
    886c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8870:	dd 1c 24             	fstpl  (%esp)
    8873:	e8 22 c0 ff ff       	call   489a <pow>
    8878:	83 c4 10             	add    $0x10,%esp
    887b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    887e:	89 d0                	mov    %edx,%eax
    8880:	c1 e0 03             	shl    $0x3,%eax
    8883:	01 d0                	add    %edx,%eax
    8885:	c1 e0 04             	shl    $0x4,%eax
    8888:	89 c2                	mov    %eax,%edx
    888a:	8b 45 0c             	mov    0xc(%ebp),%eax
    888d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8890:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8893:	89 d0                	mov    %edx,%eax
    8895:	c1 e0 03             	shl    $0x3,%eax
    8898:	01 d0                	add    %edx,%eax
    889a:	c1 e0 04             	shl    $0x4,%eax
    889d:	89 c2                	mov    %eax,%edx
    889f:	8b 45 0c             	mov    0xc(%ebp),%eax
    88a2:	01 c2                	add    %eax,%edx
    88a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88a7:	dd 04 c2             	fldl   (%edx,%eax,8)
    88aa:	de c9                	fmulp  %st,%st(1)
    88ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88af:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    88b2:	e9 c0 00 00 00       	jmp    8977 <III_dequantize_sample+0x64f>
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    88b7:	8b 45 14             	mov    0x14(%ebp),%eax
    88ba:	8b 40 40             	mov    0x40(%eax),%eax
    88bd:	89 45 c8             	mov    %eax,-0x38(%ebp)
    88c0:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    88c7:	df 6d c8             	fildll -0x38(%ebp)
    88ca:	dd 5d d0             	fstpl  -0x30(%ebp)
    88cd:	dd 45 d0             	fldl   -0x30(%ebp)
    88d0:	d9 e8                	fld1   
    88d2:	de c1                	faddp  %st,%st(1)
    88d4:	dd 05 70 d9 00 00    	fldl   0xd970
    88da:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    88dc:	8b 4d 10             	mov    0x10(%ebp),%ecx
    88df:	8b 45 18             	mov    0x18(%ebp),%eax
    88e2:	89 c2                	mov    %eax,%edx
    88e4:	8d 04 12             	lea    (%edx,%edx,1),%eax
    88e7:	89 c2                	mov    %eax,%edx
    88e9:	89 d0                	mov    %edx,%eax
    88eb:	c1 e0 05             	shl    $0x5,%eax
    88ee:	29 d0                	sub    %edx,%eax
    88f0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    88f3:	01 d0                	add    %edx,%eax
    88f5:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    88f8:	89 c1                	mov    %eax,%ecx
    88fa:	8b 45 14             	mov    0x14(%ebp),%eax
    88fd:	8b 50 3c             	mov    0x3c(%eax),%edx
    8900:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8903:	8b 04 85 80 f6 00 00 	mov    0xf680(,%eax,4),%eax
    890a:	0f af c2             	imul   %edx,%eax
    890d:	01 c8                	add    %ecx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    890f:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8912:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8919:	df 6d c8             	fildll -0x38(%ebp)
    891c:	dd 5d d0             	fstpl  -0x30(%ebp)
    891f:	dd 45 d0             	fldl   -0x30(%ebp)
    8922:	de c9                	fmulp  %st,%st(1)
    8924:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8928:	dd 1c 24             	fstpl  (%esp)
    892b:	dd 05 60 d9 00 00    	fldl   0xd960
    8931:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8935:	dd 1c 24             	fstpl  (%esp)
    8938:	e8 5d bf ff ff       	call   489a <pow>
    893d:	83 c4 10             	add    $0x10,%esp
    8940:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8943:	89 d0                	mov    %edx,%eax
    8945:	c1 e0 03             	shl    $0x3,%eax
    8948:	01 d0                	add    %edx,%eax
    894a:	c1 e0 04             	shl    $0x4,%eax
    894d:	89 c2                	mov    %eax,%edx
    894f:	8b 45 0c             	mov    0xc(%ebp),%eax
    8952:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8955:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8958:	89 d0                	mov    %edx,%eax
    895a:	c1 e0 03             	shl    $0x3,%eax
    895d:	01 d0                	add    %edx,%eax
    895f:	c1 e0 04             	shl    $0x4,%eax
    8962:	89 c2                	mov    %eax,%edx
    8964:	8b 45 0c             	mov    0xc(%ebp),%eax
    8967:	01 c2                	add    %eax,%edx
    8969:	8b 45 f4             	mov    -0xc(%ebp),%eax
    896c:	dd 04 c2             	fldl   (%edx,%eax,8)
    896f:	de c9                	fmulp  %st,%st(1)
    8971:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8974:	dd 1c c1             	fstpl  (%ecx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    8977:	8b 55 f0             	mov    -0x10(%ebp),%edx
    897a:	89 d0                	mov    %edx,%eax
    897c:	c1 e0 03             	shl    $0x3,%eax
    897f:	01 d0                	add    %edx,%eax
    8981:	c1 e0 03             	shl    $0x3,%eax
    8984:	89 c2                	mov    %eax,%edx
    8986:	8b 45 08             	mov    0x8(%ebp),%eax
    8989:	01 c2                	add    %eax,%edx
    898b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    898e:	8b 04 82             	mov    (%edx,%eax,4),%eax
    8991:	c1 e8 1f             	shr    $0x1f,%eax
    8994:	0f b6 c0             	movzbl %al,%eax
    8997:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    899a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    899d:	89 d0                	mov    %edx,%eax
    899f:	c1 e0 03             	shl    $0x3,%eax
    89a2:	01 d0                	add    %edx,%eax
    89a4:	c1 e0 03             	shl    $0x3,%eax
    89a7:	89 c2                	mov    %eax,%edx
    89a9:	8b 45 08             	mov    0x8(%ebp),%eax
    89ac:	01 c2                	add    %eax,%edx
    89ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89b1:	8b 04 82             	mov    (%edx,%eax,4),%eax
    89b4:	83 ec 0c             	sub    $0xc,%esp
    89b7:	50                   	push   %eax
    89b8:	e8 c7 bd ff ff       	call   4784 <abs>
    89bd:	83 c4 10             	add    $0x10,%esp
    89c0:	89 45 c8             	mov    %eax,-0x38(%ebp)
    89c3:	db 45 c8             	fildl  -0x38(%ebp)
    89c6:	dd 05 78 d9 00 00    	fldl   0xd978
    89cc:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    89d0:	dd 1c 24             	fstpl  (%esp)
    89d3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    89d7:	dd 1c 24             	fstpl  (%esp)
    89da:	e8 bb be ff ff       	call   489a <pow>
    89df:	83 c4 10             	add    $0x10,%esp
    89e2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89e5:	89 d0                	mov    %edx,%eax
    89e7:	c1 e0 03             	shl    $0x3,%eax
    89ea:	01 d0                	add    %edx,%eax
    89ec:	c1 e0 04             	shl    $0x4,%eax
    89ef:	89 c2                	mov    %eax,%edx
    89f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    89f4:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    89f7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89fa:	89 d0                	mov    %edx,%eax
    89fc:	c1 e0 03             	shl    $0x3,%eax
    89ff:	01 d0                	add    %edx,%eax
    8a01:	c1 e0 04             	shl    $0x4,%eax
    8a04:	89 c2                	mov    %eax,%edx
    8a06:	8b 45 0c             	mov    0xc(%ebp),%eax
    8a09:	01 c2                	add    %eax,%edx
    8a0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a0e:	dd 04 c2             	fldl   (%edx,%eax,8)
    8a11:	de c9                	fmulp  %st,%st(1)
    8a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a16:	dd 1c c1             	fstpl  (%ecx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    8a19:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    8a1d:	74 37                	je     8a56 <III_dequantize_sample+0x72e>
    8a1f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a22:	89 d0                	mov    %edx,%eax
    8a24:	c1 e0 03             	shl    $0x3,%eax
    8a27:	01 d0                	add    %edx,%eax
    8a29:	c1 e0 04             	shl    $0x4,%eax
    8a2c:	89 c2                	mov    %eax,%edx
    8a2e:	8b 45 0c             	mov    0xc(%ebp),%eax
    8a31:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8a34:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a37:	89 d0                	mov    %edx,%eax
    8a39:	c1 e0 03             	shl    $0x3,%eax
    8a3c:	01 d0                	add    %edx,%eax
    8a3e:	c1 e0 04             	shl    $0x4,%eax
    8a41:	89 c2                	mov    %eax,%edx
    8a43:	8b 45 0c             	mov    0xc(%ebp),%eax
    8a46:	01 c2                	add    %eax,%edx
    8a48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a4b:	dd 04 c2             	fldl   (%edx,%eax,8)
    8a4e:	d9 e0                	fchs   
    8a50:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a53:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    8a56:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8a5a:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8a5e:	0f 8e 86 f9 ff ff    	jle    83ea <III_dequantize_sample+0xc2>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    8a64:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8a68:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8a6c:	0f 8e 6c f9 ff ff    	jle    83de <III_dequantize_sample+0xb6>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    8a72:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    8a75:	c9                   	leave  
    8a76:	c3                   	ret    

00008a77 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    8a77:	55                   	push   %ebp
    8a78:	89 e5                	mov    %esp,%ebp
    8a7a:	57                   	push   %edi
    8a7b:	56                   	push   %esi
    8a7c:	53                   	push   %ebx
    8a7d:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    8a80:	8b 45 14             	mov    0x14(%ebp),%eax
    8a83:	8b 00                	mov    (%eax),%eax
    8a85:	8b 40 10             	mov    0x10(%eax),%eax
    8a88:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8a8b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8a92:	eb 33                	jmp    8ac7 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    8a94:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8a9b:	eb 20                	jmp    8abd <III_reorder+0x46>
         ro[sb][ss] = 0;
    8a9d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8aa0:	89 d0                	mov    %edx,%eax
    8aa2:	c1 e0 03             	shl    $0x3,%eax
    8aa5:	01 d0                	add    %edx,%eax
    8aa7:	c1 e0 04             	shl    $0x4,%eax
    8aaa:	89 c2                	mov    %eax,%edx
    8aac:	8b 45 0c             	mov    0xc(%ebp),%eax
    8aaf:	01 c2                	add    %eax,%edx
    8ab1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8ab4:	d9 ee                	fldz   
    8ab6:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    8ab9:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8abd:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8ac1:	7e da                	jle    8a9d <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8ac3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8ac7:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    8acb:	7e c7                	jle    8a94 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8acd:	8b 45 10             	mov    0x10(%ebp),%eax
    8ad0:	8b 40 10             	mov    0x10(%eax),%eax
    8ad3:	85 c0                	test   %eax,%eax
    8ad5:	0f 84 b8 03 00 00    	je     8e93 <III_reorder+0x41c>
    8adb:	8b 45 10             	mov    0x10(%ebp),%eax
    8ade:	8b 40 14             	mov    0x14(%eax),%eax
    8ae1:	83 f8 02             	cmp    $0x2,%eax
    8ae4:	0f 85 a9 03 00 00    	jne    8e93 <III_reorder+0x41c>
      if (gr_info->mixed_block_flag) {
    8aea:	8b 45 10             	mov    0x10(%ebp),%eax
    8aed:	8b 40 18             	mov    0x18(%eax),%eax
    8af0:	85 c0                	test   %eax,%eax
    8af2:	0f 84 06 02 00 00    	je     8cfe <III_reorder+0x287>
         for (sb=0 ; sb < 2 ; sb++)
    8af8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8aff:	eb 4c                	jmp    8b4d <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8b01:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8b08:	eb 39                	jmp    8b43 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    8b0a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8b0d:	89 d0                	mov    %edx,%eax
    8b0f:	c1 e0 03             	shl    $0x3,%eax
    8b12:	01 d0                	add    %edx,%eax
    8b14:	c1 e0 04             	shl    $0x4,%eax
    8b17:	89 c2                	mov    %eax,%edx
    8b19:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b1c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8b1f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8b22:	89 d0                	mov    %edx,%eax
    8b24:	c1 e0 03             	shl    $0x3,%eax
    8b27:	01 d0                	add    %edx,%eax
    8b29:	c1 e0 04             	shl    $0x4,%eax
    8b2c:	89 c2                	mov    %eax,%edx
    8b2e:	8b 45 08             	mov    0x8(%ebp),%eax
    8b31:	01 c2                	add    %eax,%edx
    8b33:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8b36:	dd 04 c2             	fldl   (%edx,%eax,8)
    8b39:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8b3c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8b3f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8b43:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8b47:	7e c1                	jle    8b0a <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    8b49:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8b4d:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    8b51:	7e ae                	jle    8b01 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8b53:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    8b5a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8b5d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8b63:	83 c0 5c             	add    $0x5c,%eax
    8b66:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    8b6b:	8b 40 0c             	mov    0xc(%eax),%eax
    8b6e:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    8b71:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8b74:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8b7a:	83 c0 60             	add    $0x60,%eax
    8b7d:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    8b82:	8b 40 0c             	mov    0xc(%eax),%eax
    8b85:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8b88:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8b8b:	e9 5f 01 00 00       	jmp    8cef <III_reorder+0x278>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8b90:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8b97:	e9 fd 00 00 00       	jmp    8c99 <III_reorder+0x222>
                  for(freq=0;freq<sfb_lines;freq++) {
    8b9c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8ba3:	e9 e1 00 00 00       	jmp    8c89 <III_reorder+0x212>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8ba8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8bab:	89 d0                	mov    %edx,%eax
    8bad:	01 c0                	add    %eax,%eax
    8baf:	01 c2                	add    %eax,%edx
    8bb1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8bb4:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8bb8:	01 c2                	add    %eax,%edx
    8bba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8bbd:	01 d0                	add    %edx,%eax
    8bbf:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8bc2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8bc5:	89 d0                	mov    %edx,%eax
    8bc7:	01 c0                	add    %eax,%eax
    8bc9:	01 c2                	add    %eax,%edx
    8bcb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8bce:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8bd1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8bd4:	89 d0                	mov    %edx,%eax
    8bd6:	01 c0                	add    %eax,%eax
    8bd8:	01 d0                	add    %edx,%eax
    8bda:	01 c8                	add    %ecx,%eax
    8bdc:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8bdf:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8be2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8be7:	89 c8                	mov    %ecx,%eax
    8be9:	f7 ea                	imul   %edx
    8beb:	c1 fa 02             	sar    $0x2,%edx
    8bee:	89 c8                	mov    %ecx,%eax
    8bf0:	c1 f8 1f             	sar    $0x1f,%eax
    8bf3:	29 c2                	sub    %eax,%edx
    8bf5:	89 d0                	mov    %edx,%eax
    8bf7:	89 c2                	mov    %eax,%edx
    8bf9:	89 d0                	mov    %edx,%eax
    8bfb:	c1 e0 03             	shl    $0x3,%eax
    8bfe:	01 d0                	add    %edx,%eax
    8c00:	c1 e0 04             	shl    $0x4,%eax
    8c03:	89 c2                	mov    %eax,%edx
    8c05:	8b 45 0c             	mov    0xc(%ebp),%eax
    8c08:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8c0b:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8c0e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c13:	89 d8                	mov    %ebx,%eax
    8c15:	f7 ea                	imul   %edx
    8c17:	c1 fa 02             	sar    $0x2,%edx
    8c1a:	89 d8                	mov    %ebx,%eax
    8c1c:	c1 f8 1f             	sar    $0x1f,%eax
    8c1f:	89 d1                	mov    %edx,%ecx
    8c21:	29 c1                	sub    %eax,%ecx
    8c23:	89 c8                	mov    %ecx,%eax
    8c25:	c1 e0 03             	shl    $0x3,%eax
    8c28:	01 c8                	add    %ecx,%eax
    8c2a:	01 c0                	add    %eax,%eax
    8c2c:	29 c3                	sub    %eax,%ebx
    8c2e:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8c30:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8c33:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c38:	89 d8                	mov    %ebx,%eax
    8c3a:	f7 ea                	imul   %edx
    8c3c:	c1 fa 02             	sar    $0x2,%edx
    8c3f:	89 d8                	mov    %ebx,%eax
    8c41:	c1 f8 1f             	sar    $0x1f,%eax
    8c44:	29 c2                	sub    %eax,%edx
    8c46:	89 d0                	mov    %edx,%eax
    8c48:	89 c2                	mov    %eax,%edx
    8c4a:	89 d0                	mov    %edx,%eax
    8c4c:	c1 e0 03             	shl    $0x3,%eax
    8c4f:	01 d0                	add    %edx,%eax
    8c51:	c1 e0 04             	shl    $0x4,%eax
    8c54:	89 c2                	mov    %eax,%edx
    8c56:	8b 45 08             	mov    0x8(%ebp),%eax
    8c59:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8c5c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8c5f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c64:	89 d8                	mov    %ebx,%eax
    8c66:	f7 ea                	imul   %edx
    8c68:	c1 fa 02             	sar    $0x2,%edx
    8c6b:	89 d8                	mov    %ebx,%eax
    8c6d:	c1 f8 1f             	sar    $0x1f,%eax
    8c70:	29 c2                	sub    %eax,%edx
    8c72:	89 d0                	mov    %edx,%eax
    8c74:	c1 e0 03             	shl    $0x3,%eax
    8c77:	01 d0                	add    %edx,%eax
    8c79:	01 c0                	add    %eax,%eax
    8c7b:	29 c3                	sub    %eax,%ebx
    8c7d:	89 da                	mov    %ebx,%edx
    8c7f:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8c82:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8c85:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    8c89:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8c8c:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8c8f:	0f 8c 13 ff ff ff    	jl     8ba8 <III_reorder+0x131>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8c95:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    8c99:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8c9d:	0f 8e f9 fe ff ff    	jle    8b9c <III_reorder+0x125>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8ca3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8ca7:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8caa:	89 d0                	mov    %edx,%eax
    8cac:	c1 e0 03             	shl    $0x3,%eax
    8caf:	01 d0                	add    %edx,%eax
    8cb1:	c1 e0 02             	shl    $0x2,%eax
    8cb4:	01 d0                	add    %edx,%eax
    8cb6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8cb9:	01 d0                	add    %edx,%eax
    8cbb:	83 c0 14             	add    $0x14,%eax
    8cbe:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
    8cc5:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8cc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8ccb:	8d 48 01             	lea    0x1(%eax),%ecx
    8cce:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8cd1:	89 d0                	mov    %edx,%eax
    8cd3:	c1 e0 03             	shl    $0x3,%eax
    8cd6:	01 d0                	add    %edx,%eax
    8cd8:	c1 e0 02             	shl    $0x2,%eax
    8cdb:	01 d0                	add    %edx,%eax
    8cdd:	01 c8                	add    %ecx,%eax
    8cdf:	83 c0 14             	add    $0x14,%eax
    8ce2:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
    8ce9:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8cec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8cef:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    8cf3:	0f 8e 97 fe ff ff    	jle    8b90 <III_reorder+0x119>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8cf9:	e9 f0 01 00 00       	jmp    8eee <III_reorder+0x477>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8cfe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8d05:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8d0c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8d0f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d15:	83 c0 54             	add    $0x54,%eax
    8d18:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    8d1d:	8b 40 0c             	mov    0xc(%eax),%eax
    8d20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8d23:	e9 5f 01 00 00       	jmp    8e87 <III_reorder+0x410>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8d28:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8d2f:	e9 fd 00 00 00       	jmp    8e31 <III_reorder+0x3ba>
                  for(freq=0;freq<sfb_lines;freq++) {
    8d34:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8d3b:	e9 e1 00 00 00       	jmp    8e21 <III_reorder+0x3aa>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8d40:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8d43:	89 d0                	mov    %edx,%eax
    8d45:	01 c0                	add    %eax,%eax
    8d47:	01 c2                	add    %eax,%edx
    8d49:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8d4c:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8d50:	01 c2                	add    %eax,%edx
    8d52:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8d55:	01 d0                	add    %edx,%eax
    8d57:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8d5a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8d5d:	89 d0                	mov    %edx,%eax
    8d5f:	01 c0                	add    %eax,%eax
    8d61:	01 c2                	add    %eax,%edx
    8d63:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8d66:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8d69:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8d6c:	89 d0                	mov    %edx,%eax
    8d6e:	01 c0                	add    %eax,%eax
    8d70:	01 d0                	add    %edx,%eax
    8d72:	01 c8                	add    %ecx,%eax
    8d74:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8d77:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8d7a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d7f:	89 c8                	mov    %ecx,%eax
    8d81:	f7 ea                	imul   %edx
    8d83:	c1 fa 02             	sar    $0x2,%edx
    8d86:	89 c8                	mov    %ecx,%eax
    8d88:	c1 f8 1f             	sar    $0x1f,%eax
    8d8b:	29 c2                	sub    %eax,%edx
    8d8d:	89 d0                	mov    %edx,%eax
    8d8f:	89 c2                	mov    %eax,%edx
    8d91:	89 d0                	mov    %edx,%eax
    8d93:	c1 e0 03             	shl    $0x3,%eax
    8d96:	01 d0                	add    %edx,%eax
    8d98:	c1 e0 04             	shl    $0x4,%eax
    8d9b:	89 c2                	mov    %eax,%edx
    8d9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    8da0:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8da3:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8da6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8dab:	89 d8                	mov    %ebx,%eax
    8dad:	f7 ea                	imul   %edx
    8daf:	c1 fa 02             	sar    $0x2,%edx
    8db2:	89 d8                	mov    %ebx,%eax
    8db4:	c1 f8 1f             	sar    $0x1f,%eax
    8db7:	89 d1                	mov    %edx,%ecx
    8db9:	29 c1                	sub    %eax,%ecx
    8dbb:	89 c8                	mov    %ecx,%eax
    8dbd:	c1 e0 03             	shl    $0x3,%eax
    8dc0:	01 c8                	add    %ecx,%eax
    8dc2:	01 c0                	add    %eax,%eax
    8dc4:	29 c3                	sub    %eax,%ebx
    8dc6:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8dc8:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8dcb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8dd0:	89 d8                	mov    %ebx,%eax
    8dd2:	f7 ea                	imul   %edx
    8dd4:	c1 fa 02             	sar    $0x2,%edx
    8dd7:	89 d8                	mov    %ebx,%eax
    8dd9:	c1 f8 1f             	sar    $0x1f,%eax
    8ddc:	29 c2                	sub    %eax,%edx
    8dde:	89 d0                	mov    %edx,%eax
    8de0:	89 c2                	mov    %eax,%edx
    8de2:	89 d0                	mov    %edx,%eax
    8de4:	c1 e0 03             	shl    $0x3,%eax
    8de7:	01 d0                	add    %edx,%eax
    8de9:	c1 e0 04             	shl    $0x4,%eax
    8dec:	89 c2                	mov    %eax,%edx
    8dee:	8b 45 08             	mov    0x8(%ebp),%eax
    8df1:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8df4:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8df7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8dfc:	89 d8                	mov    %ebx,%eax
    8dfe:	f7 ea                	imul   %edx
    8e00:	c1 fa 02             	sar    $0x2,%edx
    8e03:	89 d8                	mov    %ebx,%eax
    8e05:	c1 f8 1f             	sar    $0x1f,%eax
    8e08:	29 c2                	sub    %eax,%edx
    8e0a:	89 d0                	mov    %edx,%eax
    8e0c:	c1 e0 03             	shl    $0x3,%eax
    8e0f:	01 d0                	add    %edx,%eax
    8e11:	01 c0                	add    %eax,%eax
    8e13:	29 c3                	sub    %eax,%ebx
    8e15:	89 da                	mov    %ebx,%edx
    8e17:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8e1a:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8e1d:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    8e21:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8e24:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8e27:	0f 8c 13 ff ff ff    	jl     8d40 <III_reorder+0x2c9>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8e2d:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    8e31:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8e35:	0f 8e f9 fe ff ff    	jle    8d34 <III_reorder+0x2bd>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8e3b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8e3f:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8e42:	89 d0                	mov    %edx,%eax
    8e44:	c1 e0 03             	shl    $0x3,%eax
    8e47:	01 d0                	add    %edx,%eax
    8e49:	c1 e0 02             	shl    $0x2,%eax
    8e4c:	01 d0                	add    %edx,%eax
    8e4e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8e51:	01 d0                	add    %edx,%eax
    8e53:	83 c0 14             	add    $0x14,%eax
    8e56:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
    8e5d:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8e60:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8e63:	8d 48 01             	lea    0x1(%eax),%ecx
    8e66:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8e69:	89 d0                	mov    %edx,%eax
    8e6b:	c1 e0 03             	shl    $0x3,%eax
    8e6e:	01 d0                	add    %edx,%eax
    8e70:	c1 e0 02             	shl    $0x2,%eax
    8e73:	01 d0                	add    %edx,%eax
    8e75:	01 c8                	add    %ecx,%eax
    8e77:	83 c0 14             	add    $0x14,%eax
    8e7a:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
    8e81:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8e84:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8e87:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    8e8b:	0f 8e 97 fe ff ff    	jle    8d28 <III_reorder+0x2b1>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8e91:	eb 5b                	jmp    8eee <III_reorder+0x477>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8e93:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8e9a:	eb 4c                	jmp    8ee8 <III_reorder+0x471>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8e9c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8ea3:	eb 39                	jmp    8ede <III_reorder+0x467>
            ro[sb][ss] = xr[sb][ss];
    8ea5:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8ea8:	89 d0                	mov    %edx,%eax
    8eaa:	c1 e0 03             	shl    $0x3,%eax
    8ead:	01 d0                	add    %edx,%eax
    8eaf:	c1 e0 04             	shl    $0x4,%eax
    8eb2:	89 c2                	mov    %eax,%edx
    8eb4:	8b 45 0c             	mov    0xc(%ebp),%eax
    8eb7:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8eba:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8ebd:	89 d0                	mov    %edx,%eax
    8ebf:	c1 e0 03             	shl    $0x3,%eax
    8ec2:	01 d0                	add    %edx,%eax
    8ec4:	c1 e0 04             	shl    $0x4,%eax
    8ec7:	89 c2                	mov    %eax,%edx
    8ec9:	8b 45 08             	mov    0x8(%ebp),%eax
    8ecc:	01 c2                	add    %eax,%edx
    8ece:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8ed1:	dd 04 c2             	fldl   (%edx,%eax,8)
    8ed4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8ed7:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8eda:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8ede:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8ee2:	7e c1                	jle    8ea5 <III_reorder+0x42e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8ee4:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8ee8:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    8eec:	7e ae                	jle    8e9c <III_reorder+0x425>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    8eee:	83 c4 34             	add    $0x34,%esp
    8ef1:	5b                   	pop    %ebx
    8ef2:	5e                   	pop    %esi
    8ef3:	5f                   	pop    %edi
    8ef4:	5d                   	pop    %ebp
    8ef5:	c3                   	ret    

00008ef6 <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    8ef6:	55                   	push   %ebp
    8ef7:	89 e5                	mov    %esp,%ebp
    8ef9:	56                   	push   %esi
    8efa:	53                   	push   %ebx
    8efb:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    8f01:	8b 45 18             	mov    0x18(%ebp),%eax
    8f04:	8b 00                	mov    (%eax),%eax
    8f06:	8b 40 10             	mov    0x10(%eax),%eax
    8f09:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    8f0c:	8b 45 18             	mov    0x18(%ebp),%eax
    8f0f:	8b 40 08             	mov    0x8(%eax),%eax
    8f12:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f15:	8b 45 18             	mov    0x18(%ebp),%eax
    8f18:	8b 00                	mov    (%eax),%eax
    8f1a:	8b 40 1c             	mov    0x1c(%eax),%eax
    8f1d:	83 f8 01             	cmp    $0x1,%eax
    8f20:	75 16                	jne    8f38 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    8f22:	8b 45 18             	mov    0x18(%ebp),%eax
    8f25:	8b 00                	mov    (%eax),%eax
    8f27:	8b 40 20             	mov    0x20(%eax),%eax
    8f2a:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f2d:	85 c0                	test   %eax,%eax
    8f2f:	74 07                	je     8f38 <III_stereo+0x42>
    8f31:	b8 01 00 00 00       	mov    $0x1,%eax
    8f36:	eb 05                	jmp    8f3d <III_stereo+0x47>
    8f38:	b8 00 00 00 00       	mov    $0x0,%eax
    8f3d:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f40:	8b 45 18             	mov    0x18(%ebp),%eax
    8f43:	8b 00                	mov    (%eax),%eax
    8f45:	8b 40 1c             	mov    0x1c(%eax),%eax
    8f48:	83 f8 01             	cmp    $0x1,%eax
    8f4b:	75 16                	jne    8f63 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    8f4d:	8b 45 18             	mov    0x18(%ebp),%eax
    8f50:	8b 00                	mov    (%eax),%eax
    8f52:	8b 40 20             	mov    0x20(%eax),%eax
    8f55:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f58:	85 c0                	test   %eax,%eax
    8f5a:	74 07                	je     8f63 <III_stereo+0x6d>
    8f5c:	b8 01 00 00 00       	mov    $0x1,%eax
    8f61:	eb 05                	jmp    8f68 <III_stereo+0x72>
    8f63:	b8 00 00 00 00       	mov    $0x0,%eax
    8f68:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8f6b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8f72:	eb 12                	jmp    8f86 <III_stereo+0x90>
      is_pos[i] = 7;
    8f74:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f77:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    8f7e:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8f82:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8f86:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    8f8d:	7e e5                	jle    8f74 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    8f8f:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8f93:	0f 85 65 0a 00 00    	jne    99fe <III_stereo+0xb08>
    8f99:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    8f9d:	0f 84 5b 0a 00 00    	je     99fe <III_stereo+0xb08>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    8fa3:	8b 45 14             	mov    0x14(%ebp),%eax
    8fa6:	8b 40 10             	mov    0x10(%eax),%eax
    8fa9:	85 c0                	test   %eax,%eax
    8fab:	0f 84 4d 08 00 00    	je     97fe <III_stereo+0x908>
    8fb1:	8b 45 14             	mov    0x14(%ebp),%eax
    8fb4:	8b 40 14             	mov    0x14(%eax),%eax
    8fb7:	83 f8 02             	cmp    $0x2,%eax
    8fba:	0f 85 3e 08 00 00    	jne    97fe <III_stereo+0x908>
      {  if( gr_info->mixed_block_flag )
    8fc0:	8b 45 14             	mov    0x14(%ebp),%eax
    8fc3:	8b 40 18             	mov    0x18(%eax),%eax
    8fc6:	85 c0                	test   %eax,%eax
    8fc8:	0f 84 f1 04 00 00    	je     94bf <III_stereo+0x5c9>
         {  int max_sfb = 0;
    8fce:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    8fd5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8fdc:	e9 32 03 00 00       	jmp    9313 <III_stereo+0x41d>
            {  int sfbcnt;
               sfbcnt = 2;
    8fe1:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    8fe8:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8fef:	e9 0f 01 00 00       	jmp    9103 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8ff4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ff7:	8d 48 01             	lea    0x1(%eax),%ecx
    8ffa:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8ffd:	89 d0                	mov    %edx,%eax
    8fff:	c1 e0 03             	shl    $0x3,%eax
    9002:	01 d0                	add    %edx,%eax
    9004:	c1 e0 02             	shl    $0x2,%eax
    9007:	01 d0                	add    %edx,%eax
    9009:	01 c8                	add    %ecx,%eax
    900b:	83 c0 14             	add    $0x14,%eax
    900e:	8b 0c 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%ecx
    9015:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9018:	89 d0                	mov    %edx,%eax
    901a:	c1 e0 03             	shl    $0x3,%eax
    901d:	01 d0                	add    %edx,%eax
    901f:	c1 e0 02             	shl    $0x2,%eax
    9022:	01 d0                	add    %edx,%eax
    9024:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9027:	01 d0                	add    %edx,%eax
    9029:	83 c0 14             	add    $0x14,%eax
    902c:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
    9033:	29 c1                	sub    %eax,%ecx
    9035:	89 c8                	mov    %ecx,%eax
    9037:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    903a:	8b 55 c8             	mov    -0x38(%ebp),%edx
    903d:	89 d0                	mov    %edx,%eax
    903f:	c1 e0 03             	shl    $0x3,%eax
    9042:	01 d0                	add    %edx,%eax
    9044:	c1 e0 02             	shl    $0x2,%eax
    9047:	01 d0                	add    %edx,%eax
    9049:	8b 55 f4             	mov    -0xc(%ebp),%edx
    904c:	01 d0                	add    %edx,%eax
    904e:	83 c0 14             	add    $0x14,%eax
    9051:	8b 14 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%edx
    9058:	89 d0                	mov    %edx,%eax
    905a:	01 c0                	add    %eax,%eax
    905c:	01 c2                	add    %eax,%edx
    905e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9061:	83 c0 01             	add    $0x1,%eax
    9064:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    9068:	01 d0                	add    %edx,%eax
    906a:	83 e8 01             	sub    $0x1,%eax
    906d:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9070:	e9 80 00 00 00       	jmp    90f5 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9075:	8b 45 08             	mov    0x8(%ebp),%eax
    9078:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    907e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9081:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9086:	89 c8                	mov    %ecx,%eax
    9088:	f7 ea                	imul   %edx
    908a:	c1 fa 02             	sar    $0x2,%edx
    908d:	89 c8                	mov    %ecx,%eax
    908f:	c1 f8 1f             	sar    $0x1f,%eax
    9092:	89 d3                	mov    %edx,%ebx
    9094:	29 c3                	sub    %eax,%ebx
    9096:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9099:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    909e:	89 c8                	mov    %ecx,%eax
    90a0:	f7 ea                	imul   %edx
    90a2:	c1 fa 02             	sar    $0x2,%edx
    90a5:	89 c8                	mov    %ecx,%eax
    90a7:	c1 f8 1f             	sar    $0x1f,%eax
    90aa:	29 c2                	sub    %eax,%edx
    90ac:	89 d0                	mov    %edx,%eax
    90ae:	c1 e0 03             	shl    $0x3,%eax
    90b1:	01 d0                	add    %edx,%eax
    90b3:	01 c0                	add    %eax,%eax
    90b5:	29 c1                	sub    %eax,%ecx
    90b7:	89 ca                	mov    %ecx,%edx
    90b9:	89 d8                	mov    %ebx,%eax
    90bb:	c1 e0 03             	shl    $0x3,%eax
    90be:	01 d8                	add    %ebx,%eax
    90c0:	01 c0                	add    %eax,%eax
    90c2:	01 d0                	add    %edx,%eax
    90c4:	dd 04 c6             	fldl   (%esi,%eax,8)
    90c7:	d9 ee                	fldz   
    90c9:	df e9                	fucomip %st(1),%st
    90cb:	7a 0a                	jp     90d7 <III_stereo+0x1e1>
    90cd:	d9 ee                	fldz   
    90cf:	df e9                	fucomip %st(1),%st
    90d1:	dd d8                	fstp   %st(0)
    90d3:	74 18                	je     90ed <III_stereo+0x1f7>
    90d5:	eb 02                	jmp    90d9 <III_stereo+0x1e3>
    90d7:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    90d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90dc:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    90df:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    90e6:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    90ed:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    90f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    90f5:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    90f9:	0f 8f 76 ff ff ff    	jg     9075 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    90ff:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    9103:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    9107:	0f 8f e7 fe ff ff    	jg     8ff4 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    910d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9110:	83 c0 01             	add    $0x1,%eax
    9113:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    9116:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9119:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    911c:	7e 06                	jle    9124 <III_stereo+0x22e>
                  max_sfb = sfb;
    911e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9121:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    9124:	e9 fa 00 00 00       	jmp    9223 <III_stereo+0x32d>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9129:	8b 45 f4             	mov    -0xc(%ebp),%eax
    912c:	8d 48 01             	lea    0x1(%eax),%ecx
    912f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9132:	89 d0                	mov    %edx,%eax
    9134:	c1 e0 03             	shl    $0x3,%eax
    9137:	01 d0                	add    %edx,%eax
    9139:	c1 e0 02             	shl    $0x2,%eax
    913c:	01 d0                	add    %edx,%eax
    913e:	01 c8                	add    %ecx,%eax
    9140:	83 c0 14             	add    $0x14,%eax
    9143:	8b 0c 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%ecx
    914a:	8b 55 c8             	mov    -0x38(%ebp),%edx
    914d:	89 d0                	mov    %edx,%eax
    914f:	c1 e0 03             	shl    $0x3,%eax
    9152:	01 d0                	add    %edx,%eax
    9154:	c1 e0 02             	shl    $0x2,%eax
    9157:	01 d0                	add    %edx,%eax
    9159:	8b 55 f4             	mov    -0xc(%ebp),%edx
    915c:	01 d0                	add    %edx,%eax
    915e:	83 c0 14             	add    $0x14,%eax
    9161:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
    9168:	29 c1                	sub    %eax,%ecx
    916a:	89 c8                	mov    %ecx,%eax
    916c:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    916f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9172:	89 d0                	mov    %edx,%eax
    9174:	c1 e0 03             	shl    $0x3,%eax
    9177:	01 d0                	add    %edx,%eax
    9179:	c1 e0 02             	shl    $0x2,%eax
    917c:	01 d0                	add    %edx,%eax
    917e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9181:	01 d0                	add    %edx,%eax
    9183:	83 c0 14             	add    $0x14,%eax
    9186:	8b 14 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%edx
    918d:	89 d0                	mov    %edx,%eax
    918f:	01 c0                	add    %eax,%eax
    9191:	01 c2                	add    %eax,%edx
    9193:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9196:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    919a:	01 d0                	add    %edx,%eax
    919c:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    919f:	eb 78                	jmp    9219 <III_stereo+0x323>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    91a1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    91a4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    91a7:	89 d0                	mov    %edx,%eax
    91a9:	01 c0                	add    %eax,%eax
    91ab:	01 d0                	add    %edx,%eax
    91ad:	c1 e0 02             	shl    $0x2,%eax
    91b0:	01 d0                	add    %edx,%eax
    91b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    91b5:	01 d0                	add    %edx,%eax
    91b7:	83 c0 52             	add    $0x52,%eax
    91ba:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    91be:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91c1:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    91c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91cb:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    91d2:	83 f8 07             	cmp    $0x7,%eax
    91d5:	74 3a                	je     9211 <III_stereo+0x31b>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    91d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91da:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    91e1:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    91e7:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    91ed:	dd 05 80 d9 00 00    	fldl   0xd980
    91f3:	de c9                	fmulp  %st,%st(1)
    91f5:	83 ec 08             	sub    $0x8,%esp
    91f8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    91fc:	dd 1c 24             	fstpl  (%esp)
    91ff:	e8 60 b6 ff ff       	call   4864 <tan>
    9204:	83 c4 10             	add    $0x10,%esp
    9207:	8b 45 f0             	mov    -0x10(%ebp),%eax
    920a:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    9211:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    9215:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9219:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    921d:	7f 82                	jg     91a1 <III_stereo+0x2ab>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    921f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    9223:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9227:	0f 8e fc fe ff ff    	jle    9129 <III_stereo+0x233>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    922d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9230:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9236:	83 c0 7c             	add    $0x7c,%eax
    9239:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    923e:	8b 50 0c             	mov    0xc(%eax),%edx
    9241:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9244:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    924a:	83 c0 78             	add    $0x78,%eax
    924d:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    9252:	8b 40 0c             	mov    0xc(%eax),%eax
    9255:	29 c2                	sub    %eax,%edx
    9257:	89 d0                	mov    %edx,%eax
    9259:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    925c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    925f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9265:	83 c0 78             	add    $0x78,%eax
    9268:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    926d:	8b 50 0c             	mov    0xc(%eax),%edx
    9270:	89 d0                	mov    %edx,%eax
    9272:	01 c0                	add    %eax,%eax
    9274:	01 c2                	add    %eax,%edx
    9276:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9279:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    927d:	01 d0                	add    %edx,%eax
    927f:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9282:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9285:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    928b:	83 e8 80             	sub    $0xffffff80,%eax
    928e:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    9293:	8b 50 0c             	mov    0xc(%eax),%edx
    9296:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9299:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    929f:	83 c0 7c             	add    $0x7c,%eax
    92a2:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    92a7:	8b 40 0c             	mov    0xc(%eax),%eax
    92aa:	29 c2                	sub    %eax,%edx
    92ac:	89 d0                	mov    %edx,%eax
    92ae:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    92b1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    92b4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    92ba:	83 c0 7c             	add    $0x7c,%eax
    92bd:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    92c2:	8b 50 0c             	mov    0xc(%eax),%edx
    92c5:	89 d0                	mov    %edx,%eax
    92c7:	01 c0                	add    %eax,%eax
    92c9:	01 c2                	add    %eax,%edx
    92cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    92ce:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    92d2:	01 d0                	add    %edx,%eax
    92d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    92d7:	eb 30                	jmp    9309 <III_stereo+0x413>
               {  is_pos[i] = is_pos[sfb];
    92d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92dc:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    92e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    92e6:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    92ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92f0:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    92f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    92fa:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    9301:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    9305:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9309:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    930d:	7f ca                	jg     92d9 <III_stereo+0x3e3>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    930f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9313:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9317:	0f 8e c4 fc ff ff    	jle    8fe1 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    931d:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    9321:	0f 8f 93 01 00 00    	jg     94ba <III_stereo+0x5c4>
             {  i = 2;
    9327:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    932e:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    9335:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    933c:	eb 63                	jmp    93a1 <III_stereo+0x4ab>
                {  if ( xr[1][i][ss] != 0.0 )
    933e:	8b 45 08             	mov    0x8(%ebp),%eax
    9341:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9347:	8b 55 f0             	mov    -0x10(%ebp),%edx
    934a:	89 d0                	mov    %edx,%eax
    934c:	c1 e0 03             	shl    $0x3,%eax
    934f:	01 d0                	add    %edx,%eax
    9351:	01 c0                	add    %eax,%eax
    9353:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9356:	01 d0                	add    %edx,%eax
    9358:	dd 04 c1             	fldl   (%ecx,%eax,8)
    935b:	d9 ee                	fldz   
    935d:	df e9                	fucomip %st(1),%st
    935f:	7a 0a                	jp     936b <III_stereo+0x475>
    9361:	d9 ee                	fldz   
    9363:	df e9                	fucomip %st(1),%st
    9365:	dd d8                	fstp   %st(0)
    9367:	74 23                	je     938c <III_stereo+0x496>
    9369:	eb 02                	jmp    936d <III_stereo+0x477>
    936b:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    936d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9370:	89 d0                	mov    %edx,%eax
    9372:	c1 e0 03             	shl    $0x3,%eax
    9375:	01 d0                	add    %edx,%eax
    9377:	01 c0                	add    %eax,%eax
    9379:	89 c2                	mov    %eax,%edx
    937b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    937e:	01 d0                	add    %edx,%eax
    9380:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    9383:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    938a:	eb 15                	jmp    93a1 <III_stereo+0x4ab>
                   } else
                   {  ss--;
    938c:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    9390:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9394:	79 0b                	jns    93a1 <III_stereo+0x4ab>
                      {  i--;
    9396:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    939a:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    93a1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    93a5:	79 97                	jns    933e <III_stereo+0x448>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    93a7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    93ae:	eb 04                	jmp    93b4 <III_stereo+0x4be>
                   i++;
    93b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    93b4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93b7:	89 d0                	mov    %edx,%eax
    93b9:	c1 e0 03             	shl    $0x3,%eax
    93bc:	01 d0                	add    %edx,%eax
    93be:	c1 e0 02             	shl    $0x2,%eax
    93c1:	01 d0                	add    %edx,%eax
    93c3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    93c6:	01 d0                	add    %edx,%eax
    93c8:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    93cf:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    93d2:	7e dc                	jle    93b0 <III_stereo+0x4ba>
                   i++;
                sfb = i;
    93d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    93da:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93dd:	89 d0                	mov    %edx,%eax
    93df:	c1 e0 03             	shl    $0x3,%eax
    93e2:	01 d0                	add    %edx,%eax
    93e4:	c1 e0 02             	shl    $0x2,%eax
    93e7:	01 d0                	add    %edx,%eax
    93e9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    93ec:	01 d0                	add    %edx,%eax
    93ee:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    93f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    93f8:	e9 b3 00 00 00       	jmp    94b0 <III_stereo+0x5ba>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    93fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9400:	8d 48 01             	lea    0x1(%eax),%ecx
    9403:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9406:	89 d0                	mov    %edx,%eax
    9408:	c1 e0 03             	shl    $0x3,%eax
    940b:	01 d0                	add    %edx,%eax
    940d:	c1 e0 02             	shl    $0x2,%eax
    9410:	01 d0                	add    %edx,%eax
    9412:	01 c8                	add    %ecx,%eax
    9414:	8b 0c 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%ecx
    941b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    941e:	89 d0                	mov    %edx,%eax
    9420:	c1 e0 03             	shl    $0x3,%eax
    9423:	01 d0                	add    %edx,%eax
    9425:	c1 e0 02             	shl    $0x2,%eax
    9428:	01 d0                	add    %edx,%eax
    942a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    942d:	01 d0                	add    %edx,%eax
    942f:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    9436:	29 c1                	sub    %eax,%ecx
    9438:	89 c8                	mov    %ecx,%eax
    943a:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    943d:	eb 67                	jmp    94a6 <III_stereo+0x5b0>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    943f:	8b 45 10             	mov    0x10(%ebp),%eax
    9442:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9445:	83 c2 3e             	add    $0x3e,%edx
    9448:	8b 14 90             	mov    (%eax,%edx,4),%edx
    944b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    944e:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    9455:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9458:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    945f:	83 f8 07             	cmp    $0x7,%eax
    9462:	74 3a                	je     949e <III_stereo+0x5a8>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9464:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9467:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    946e:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9474:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    947a:	dd 05 80 d9 00 00    	fldl   0xd980
    9480:	de c9                	fmulp  %st,%st(1)
    9482:	83 ec 08             	sub    $0x8,%esp
    9485:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9489:	dd 1c 24             	fstpl  (%esp)
    948c:	e8 d3 b3 ff ff       	call   4864 <tan>
    9491:	83 c4 10             	add    $0x10,%esp
    9494:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9497:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    949e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    94a2:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    94a6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    94aa:	7f 93                	jg     943f <III_stereo+0x549>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    94ac:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    94b0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    94b4:	0f 8e 43 ff ff ff    	jle    93fd <III_stereo+0x507>
    94ba:	e9 3a 03 00 00       	jmp    97f9 <III_stereo+0x903>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    94bf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    94c6:	e9 24 03 00 00       	jmp    97ef <III_stereo+0x8f9>
            {  int sfbcnt;
               sfbcnt = -1;
    94cb:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    94d2:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    94d9:	e9 0f 01 00 00       	jmp    95ed <III_stereo+0x6f7>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    94de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94e1:	8d 48 01             	lea    0x1(%eax),%ecx
    94e4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    94e7:	89 d0                	mov    %edx,%eax
    94e9:	c1 e0 03             	shl    $0x3,%eax
    94ec:	01 d0                	add    %edx,%eax
    94ee:	c1 e0 02             	shl    $0x2,%eax
    94f1:	01 d0                	add    %edx,%eax
    94f3:	01 c8                	add    %ecx,%eax
    94f5:	83 c0 14             	add    $0x14,%eax
    94f8:	8b 0c 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%ecx
    94ff:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9502:	89 d0                	mov    %edx,%eax
    9504:	c1 e0 03             	shl    $0x3,%eax
    9507:	01 d0                	add    %edx,%eax
    9509:	c1 e0 02             	shl    $0x2,%eax
    950c:	01 d0                	add    %edx,%eax
    950e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9511:	01 d0                	add    %edx,%eax
    9513:	83 c0 14             	add    $0x14,%eax
    9516:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
    951d:	29 c1                	sub    %eax,%ecx
    951f:	89 c8                	mov    %ecx,%eax
    9521:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9524:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9527:	89 d0                	mov    %edx,%eax
    9529:	c1 e0 03             	shl    $0x3,%eax
    952c:	01 d0                	add    %edx,%eax
    952e:	c1 e0 02             	shl    $0x2,%eax
    9531:	01 d0                	add    %edx,%eax
    9533:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9536:	01 d0                	add    %edx,%eax
    9538:	83 c0 14             	add    $0x14,%eax
    953b:	8b 14 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%edx
    9542:	89 d0                	mov    %edx,%eax
    9544:	01 c0                	add    %eax,%eax
    9546:	01 c2                	add    %eax,%edx
    9548:	8b 45 ec             	mov    -0x14(%ebp),%eax
    954b:	83 c0 01             	add    $0x1,%eax
    954e:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    9552:	01 d0                	add    %edx,%eax
    9554:	83 e8 01             	sub    $0x1,%eax
    9557:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    955a:	e9 80 00 00 00       	jmp    95df <III_stereo+0x6e9>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    955f:	8b 45 08             	mov    0x8(%ebp),%eax
    9562:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9568:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    956b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9570:	89 c8                	mov    %ecx,%eax
    9572:	f7 ea                	imul   %edx
    9574:	c1 fa 02             	sar    $0x2,%edx
    9577:	89 c8                	mov    %ecx,%eax
    9579:	c1 f8 1f             	sar    $0x1f,%eax
    957c:	89 d3                	mov    %edx,%ebx
    957e:	29 c3                	sub    %eax,%ebx
    9580:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9583:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9588:	89 c8                	mov    %ecx,%eax
    958a:	f7 ea                	imul   %edx
    958c:	c1 fa 02             	sar    $0x2,%edx
    958f:	89 c8                	mov    %ecx,%eax
    9591:	c1 f8 1f             	sar    $0x1f,%eax
    9594:	29 c2                	sub    %eax,%edx
    9596:	89 d0                	mov    %edx,%eax
    9598:	c1 e0 03             	shl    $0x3,%eax
    959b:	01 d0                	add    %edx,%eax
    959d:	01 c0                	add    %eax,%eax
    959f:	29 c1                	sub    %eax,%ecx
    95a1:	89 ca                	mov    %ecx,%edx
    95a3:	89 d8                	mov    %ebx,%eax
    95a5:	c1 e0 03             	shl    $0x3,%eax
    95a8:	01 d8                	add    %ebx,%eax
    95aa:	01 c0                	add    %eax,%eax
    95ac:	01 d0                	add    %edx,%eax
    95ae:	dd 04 c6             	fldl   (%esi,%eax,8)
    95b1:	d9 ee                	fldz   
    95b3:	df e9                	fucomip %st(1),%st
    95b5:	7a 0a                	jp     95c1 <III_stereo+0x6cb>
    95b7:	d9 ee                	fldz   
    95b9:	df e9                	fucomip %st(1),%st
    95bb:	dd d8                	fstp   %st(0)
    95bd:	74 18                	je     95d7 <III_stereo+0x6e1>
    95bf:	eb 02                	jmp    95c3 <III_stereo+0x6cd>
    95c1:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    95c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95c6:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    95c9:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    95d0:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    95d7:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    95db:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    95df:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    95e3:	0f 8f 76 ff ff ff    	jg     955f <III_stereo+0x669>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    95e9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    95ed:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    95f1:	0f 89 e7 fe ff ff    	jns    94de <III_stereo+0x5e8>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    95f7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    95fa:	83 c0 01             	add    $0x1,%eax
    95fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    9600:	e9 fa 00 00 00       	jmp    96ff <III_stereo+0x809>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9605:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9608:	8d 48 01             	lea    0x1(%eax),%ecx
    960b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    960e:	89 d0                	mov    %edx,%eax
    9610:	c1 e0 03             	shl    $0x3,%eax
    9613:	01 d0                	add    %edx,%eax
    9615:	c1 e0 02             	shl    $0x2,%eax
    9618:	01 d0                	add    %edx,%eax
    961a:	01 c8                	add    %ecx,%eax
    961c:	83 c0 14             	add    $0x14,%eax
    961f:	8b 0c 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%ecx
    9626:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9629:	89 d0                	mov    %edx,%eax
    962b:	c1 e0 03             	shl    $0x3,%eax
    962e:	01 d0                	add    %edx,%eax
    9630:	c1 e0 02             	shl    $0x2,%eax
    9633:	01 d0                	add    %edx,%eax
    9635:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9638:	01 d0                	add    %edx,%eax
    963a:	83 c0 14             	add    $0x14,%eax
    963d:	8b 04 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%eax
    9644:	29 c1                	sub    %eax,%ecx
    9646:	89 c8                	mov    %ecx,%eax
    9648:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    964b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    964e:	89 d0                	mov    %edx,%eax
    9650:	c1 e0 03             	shl    $0x3,%eax
    9653:	01 d0                	add    %edx,%eax
    9655:	c1 e0 02             	shl    $0x2,%eax
    9658:	01 d0                	add    %edx,%eax
    965a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    965d:	01 d0                	add    %edx,%eax
    965f:	83 c0 14             	add    $0x14,%eax
    9662:	8b 14 85 cc f4 00 00 	mov    0xf4cc(,%eax,4),%edx
    9669:	89 d0                	mov    %edx,%eax
    966b:	01 c0                	add    %eax,%eax
    966d:	01 c2                	add    %eax,%edx
    966f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9672:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9676:	01 d0                	add    %edx,%eax
    9678:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    967b:	eb 78                	jmp    96f5 <III_stereo+0x7ff>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    967d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9680:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9683:	89 d0                	mov    %edx,%eax
    9685:	01 c0                	add    %eax,%eax
    9687:	01 d0                	add    %edx,%eax
    9689:	c1 e0 02             	shl    $0x2,%eax
    968c:	01 d0                	add    %edx,%eax
    968e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9691:	01 d0                	add    %edx,%eax
    9693:	83 c0 52             	add    $0x52,%eax
    9696:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    969a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    969d:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    96a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96a7:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    96ae:	83 f8 07             	cmp    $0x7,%eax
    96b1:	74 3a                	je     96ed <III_stereo+0x7f7>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    96b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96b6:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    96bd:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    96c3:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    96c9:	dd 05 80 d9 00 00    	fldl   0xd980
    96cf:	de c9                	fmulp  %st,%st(1)
    96d1:	83 ec 08             	sub    $0x8,%esp
    96d4:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    96d8:	dd 1c 24             	fstpl  (%esp)
    96db:	e8 84 b1 ff ff       	call   4864 <tan>
    96e0:	83 c4 10             	add    $0x10,%esp
    96e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96e6:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    96ed:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    96f1:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    96f5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    96f9:	7f 82                	jg     967d <III_stereo+0x787>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    96fb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    96ff:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9703:	0f 8e fc fe ff ff    	jle    9605 <III_stereo+0x70f>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    9709:	8b 45 c8             	mov    -0x38(%ebp),%eax
    970c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9712:	83 c0 7c             	add    $0x7c,%eax
    9715:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    971a:	8b 50 0c             	mov    0xc(%eax),%edx
    971d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9720:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9726:	83 c0 78             	add    $0x78,%eax
    9729:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    972e:	8b 40 0c             	mov    0xc(%eax),%eax
    9731:	29 c2                	sub    %eax,%edx
    9733:	89 d0                	mov    %edx,%eax
    9735:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9738:	8b 45 c8             	mov    -0x38(%ebp),%eax
    973b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9741:	83 c0 78             	add    $0x78,%eax
    9744:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    9749:	8b 50 0c             	mov    0xc(%eax),%edx
    974c:	89 d0                	mov    %edx,%eax
    974e:	01 c0                	add    %eax,%eax
    9750:	01 c2                	add    %eax,%edx
    9752:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9755:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9759:	01 d0                	add    %edx,%eax
    975b:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    975e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9761:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9767:	83 e8 80             	sub    $0xffffff80,%eax
    976a:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    976f:	8b 50 0c             	mov    0xc(%eax),%edx
    9772:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9775:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    977b:	83 c0 7c             	add    $0x7c,%eax
    977e:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    9783:	8b 40 0c             	mov    0xc(%eax),%eax
    9786:	29 c2                	sub    %eax,%edx
    9788:	89 d0                	mov    %edx,%eax
    978a:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    978d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9790:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9796:	83 c0 7c             	add    $0x7c,%eax
    9799:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    979e:	8b 50 0c             	mov    0xc(%eax),%edx
    97a1:	89 d0                	mov    %edx,%eax
    97a3:	01 c0                	add    %eax,%eax
    97a5:	01 c2                	add    %eax,%edx
    97a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    97aa:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    97ae:	01 d0                	add    %edx,%eax
    97b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    97b3:	eb 30                	jmp    97e5 <III_stereo+0x8ef>
               {  is_pos[i] = is_pos[sfb];
    97b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97b8:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    97bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    97c2:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    97c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97cc:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    97d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    97d6:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    97dd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    97e1:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    97e5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    97e9:	7f ca                	jg     97b5 <III_stereo+0x8bf>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    97eb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    97ef:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    97f3:	0f 8e d2 fc ff ff    	jle    94cb <III_stereo+0x5d5>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    97f9:	e9 00 02 00 00       	jmp    99fe <III_stereo+0xb08>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    97fe:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    9805:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    980c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    9813:	eb 63                	jmp    9878 <III_stereo+0x982>
         {  if ( xr[1][i][ss] != 0.0 )
    9815:	8b 45 08             	mov    0x8(%ebp),%eax
    9818:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    981e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9821:	89 d0                	mov    %edx,%eax
    9823:	c1 e0 03             	shl    $0x3,%eax
    9826:	01 d0                	add    %edx,%eax
    9828:	01 c0                	add    %eax,%eax
    982a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    982d:	01 d0                	add    %edx,%eax
    982f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9832:	d9 ee                	fldz   
    9834:	df e9                	fucomip %st(1),%st
    9836:	7a 0a                	jp     9842 <III_stereo+0x94c>
    9838:	d9 ee                	fldz   
    983a:	df e9                	fucomip %st(1),%st
    983c:	dd d8                	fstp   %st(0)
    983e:	74 23                	je     9863 <III_stereo+0x96d>
    9840:	eb 02                	jmp    9844 <III_stereo+0x94e>
    9842:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    9844:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9847:	89 d0                	mov    %edx,%eax
    9849:	c1 e0 03             	shl    $0x3,%eax
    984c:	01 d0                	add    %edx,%eax
    984e:	01 c0                	add    %eax,%eax
    9850:	89 c2                	mov    %eax,%edx
    9852:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9855:	01 d0                	add    %edx,%eax
    9857:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    985a:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9861:	eb 15                	jmp    9878 <III_stereo+0x982>
            } else
            {  ss--;
    9863:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    9867:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    986b:	79 0b                	jns    9878 <III_stereo+0x982>
               {  i--;
    986d:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    9871:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    9878:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    987c:	79 97                	jns    9815 <III_stereo+0x91f>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    987e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9885:	eb 04                	jmp    988b <III_stereo+0x995>
            i++;
    9887:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    988b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    988e:	89 d0                	mov    %edx,%eax
    9890:	c1 e0 03             	shl    $0x3,%eax
    9893:	01 d0                	add    %edx,%eax
    9895:	c1 e0 02             	shl    $0x2,%eax
    9898:	01 d0                	add    %edx,%eax
    989a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    989d:	01 d0                	add    %edx,%eax
    989f:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    98a6:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    98a9:	7e dc                	jle    9887 <III_stereo+0x991>
            i++;
         sfb = i;
    98ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    98ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    98b1:	8b 55 c8             	mov    -0x38(%ebp),%edx
    98b4:	89 d0                	mov    %edx,%eax
    98b6:	c1 e0 03             	shl    $0x3,%eax
    98b9:	01 d0                	add    %edx,%eax
    98bb:	c1 e0 02             	shl    $0x2,%eax
    98be:	01 d0                	add    %edx,%eax
    98c0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    98c3:	01 d0                	add    %edx,%eax
    98c5:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    98cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    98cf:	e9 b3 00 00 00       	jmp    9987 <III_stereo+0xa91>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    98d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98d7:	8d 48 01             	lea    0x1(%eax),%ecx
    98da:	8b 55 c8             	mov    -0x38(%ebp),%edx
    98dd:	89 d0                	mov    %edx,%eax
    98df:	c1 e0 03             	shl    $0x3,%eax
    98e2:	01 d0                	add    %edx,%eax
    98e4:	c1 e0 02             	shl    $0x2,%eax
    98e7:	01 d0                	add    %edx,%eax
    98e9:	01 c8                	add    %ecx,%eax
    98eb:	8b 0c 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%ecx
    98f2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    98f5:	89 d0                	mov    %edx,%eax
    98f7:	c1 e0 03             	shl    $0x3,%eax
    98fa:	01 d0                	add    %edx,%eax
    98fc:	c1 e0 02             	shl    $0x2,%eax
    98ff:	01 d0                	add    %edx,%eax
    9901:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9904:	01 d0                	add    %edx,%eax
    9906:	8b 04 85 c0 f4 00 00 	mov    0xf4c0(,%eax,4),%eax
    990d:	29 c1                	sub    %eax,%ecx
    990f:	89 c8                	mov    %ecx,%eax
    9911:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    9914:	eb 67                	jmp    997d <III_stereo+0xa87>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    9916:	8b 45 10             	mov    0x10(%ebp),%eax
    9919:	8b 55 f4             	mov    -0xc(%ebp),%edx
    991c:	83 c2 3e             	add    $0x3e,%edx
    991f:	8b 14 90             	mov    (%eax,%edx,4),%edx
    9922:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9925:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    992c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    992f:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9936:	83 f8 07             	cmp    $0x7,%eax
    9939:	74 3a                	je     9975 <III_stereo+0xa7f>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    993b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    993e:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9945:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    994b:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9951:	dd 05 80 d9 00 00    	fldl   0xd980
    9957:	de c9                	fmulp  %st,%st(1)
    9959:	83 ec 08             	sub    $0x8,%esp
    995c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9960:	dd 1c 24             	fstpl  (%esp)
    9963:	e8 fc ae ff ff       	call   4864 <tan>
    9968:	83 c4 10             	add    $0x10,%esp
    996b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    996e:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    9975:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    9979:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    997d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9981:	7f 93                	jg     9916 <III_stereo+0xa20>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    9983:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9987:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    998b:	0f 8e 43 ff ff ff    	jle    98d4 <III_stereo+0x9de>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    9991:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9994:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    999a:	83 c0 50             	add    $0x50,%eax
    999d:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    99a2:	8b 00                	mov    (%eax),%eax
    99a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    99a7:	8b 45 c8             	mov    -0x38(%ebp),%eax
    99aa:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    99b0:	83 c0 54             	add    $0x54,%eax
    99b3:	05 c0 f4 00 00       	add    $0xf4c0,%eax
    99b8:	8b 00                	mov    (%eax),%eax
    99ba:	ba 40 02 00 00       	mov    $0x240,%edx
    99bf:	29 c2                	sub    %eax,%edx
    99c1:	89 d0                	mov    %edx,%eax
    99c3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    99c6:	eb 30                	jmp    99f8 <III_stereo+0xb02>
         {  is_pos[i] = is_pos[sfb];
    99c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99cb:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    99d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    99d5:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    99dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99df:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    99e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    99e9:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    99f0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    99f4:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    99f8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    99fc:	7f ca                	jg     99c8 <III_stereo+0xad2>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    99fe:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9a05:	eb 55                	jmp    9a5c <III_stereo+0xb66>
      for(sb=0;sb<SBLIMIT;sb++)
    9a07:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9a0e:	eb 42                	jmp    9a52 <III_stereo+0xb5c>
         for(ss=0;ss<SSLIMIT;ss++)
    9a10:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9a17:	eb 2f                	jmp    9a48 <III_stereo+0xb52>
            lr[ch][sb][ss] = 0;
    9a19:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9a1c:	89 d0                	mov    %edx,%eax
    9a1e:	c1 e0 03             	shl    $0x3,%eax
    9a21:	01 d0                	add    %edx,%eax
    9a23:	c1 e0 09             	shl    $0x9,%eax
    9a26:	89 c2                	mov    %eax,%edx
    9a28:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a2b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9a2e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a31:	89 d0                	mov    %edx,%eax
    9a33:	c1 e0 03             	shl    $0x3,%eax
    9a36:	01 d0                	add    %edx,%eax
    9a38:	01 c0                	add    %eax,%eax
    9a3a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9a3d:	01 d0                	add    %edx,%eax
    9a3f:	d9 ee                	fldz   
    9a41:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    9a44:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9a48:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9a4c:	7e cb                	jle    9a19 <III_stereo+0xb23>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    9a4e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9a52:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9a56:	7e b8                	jle    9a10 <III_stereo+0xb1a>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    9a58:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9a5c:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    9a60:	7e a5                	jle    9a07 <III_stereo+0xb11>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    9a62:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9a66:	0f 85 3b 02 00 00    	jne    9ca7 <III_stereo+0xdb1>
      for(sb=0;sb<SBLIMIT;sb++)
    9a6c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9a73:	e9 23 02 00 00       	jmp    9c9b <III_stereo+0xda5>
         for(ss=0;ss<SSLIMIT;ss++) {
    9a78:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9a7f:	e9 09 02 00 00       	jmp    9c8d <III_stereo+0xd97>
            i = (sb*18)+ss;
    9a84:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a87:	89 d0                	mov    %edx,%eax
    9a89:	c1 e0 03             	shl    $0x3,%eax
    9a8c:	01 d0                	add    %edx,%eax
    9a8e:	01 c0                	add    %eax,%eax
    9a90:	89 c2                	mov    %eax,%edx
    9a92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9a95:	01 d0                	add    %edx,%eax
    9a97:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    9a9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9a9d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9aa4:	83 f8 07             	cmp    $0x7,%eax
    9aa7:	0f 85 2c 01 00 00    	jne    9bd9 <III_stereo+0xce3>
               if ( ms_stereo ) {
    9aad:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    9ab1:	0f 84 b5 00 00 00    	je     9b6c <III_stereo+0xc76>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    9ab7:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9aba:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9abd:	89 d0                	mov    %edx,%eax
    9abf:	c1 e0 03             	shl    $0x3,%eax
    9ac2:	01 d0                	add    %edx,%eax
    9ac4:	01 c0                	add    %eax,%eax
    9ac6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ac9:	01 d0                	add    %edx,%eax
    9acb:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9ace:	8b 45 08             	mov    0x8(%ebp),%eax
    9ad1:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9ad7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9ada:	89 d0                	mov    %edx,%eax
    9adc:	c1 e0 03             	shl    $0x3,%eax
    9adf:	01 d0                	add    %edx,%eax
    9ae1:	01 c0                	add    %eax,%eax
    9ae3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ae6:	01 d0                	add    %edx,%eax
    9ae8:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9aeb:	de c1                	faddp  %st,%st(1)
    9aed:	dd 05 88 d9 00 00    	fldl   0xd988
    9af3:	de f9                	fdivrp %st,%st(1)
    9af5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9af8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9afb:	89 d0                	mov    %edx,%eax
    9afd:	c1 e0 03             	shl    $0x3,%eax
    9b00:	01 d0                	add    %edx,%eax
    9b02:	01 c0                	add    %eax,%eax
    9b04:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b07:	01 d0                	add    %edx,%eax
    9b09:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    9b0c:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b0f:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9b15:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9b18:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b1b:	89 d0                	mov    %edx,%eax
    9b1d:	c1 e0 03             	shl    $0x3,%eax
    9b20:	01 d0                	add    %edx,%eax
    9b22:	01 c0                	add    %eax,%eax
    9b24:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b27:	01 d0                	add    %edx,%eax
    9b29:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9b2c:	8b 45 08             	mov    0x8(%ebp),%eax
    9b2f:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9b35:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b38:	89 d0                	mov    %edx,%eax
    9b3a:	c1 e0 03             	shl    $0x3,%eax
    9b3d:	01 d0                	add    %edx,%eax
    9b3f:	01 c0                	add    %eax,%eax
    9b41:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b44:	01 d0                	add    %edx,%eax
    9b46:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9b49:	de e9                	fsubrp %st,%st(1)
    9b4b:	dd 05 88 d9 00 00    	fldl   0xd988
    9b51:	de f9                	fdivrp %st,%st(1)
    9b53:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b56:	89 d0                	mov    %edx,%eax
    9b58:	c1 e0 03             	shl    $0x3,%eax
    9b5b:	01 d0                	add    %edx,%eax
    9b5d:	01 c0                	add    %eax,%eax
    9b5f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b62:	01 d0                	add    %edx,%eax
    9b64:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    9b67:	e9 1d 01 00 00       	jmp    9c89 <III_stereo+0xd93>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    9b6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9b6f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b72:	89 d0                	mov    %edx,%eax
    9b74:	c1 e0 03             	shl    $0x3,%eax
    9b77:	01 d0                	add    %edx,%eax
    9b79:	01 c0                	add    %eax,%eax
    9b7b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b7e:	01 d0                	add    %edx,%eax
    9b80:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9b83:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9b86:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b89:	89 d0                	mov    %edx,%eax
    9b8b:	c1 e0 03             	shl    $0x3,%eax
    9b8e:	01 d0                	add    %edx,%eax
    9b90:	01 c0                	add    %eax,%eax
    9b92:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b95:	01 d0                	add    %edx,%eax
    9b97:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    9b9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b9d:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9ba3:	8b 45 08             	mov    0x8(%ebp),%eax
    9ba6:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9bac:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9baf:	89 d0                	mov    %edx,%eax
    9bb1:	c1 e0 03             	shl    $0x3,%eax
    9bb4:	01 d0                	add    %edx,%eax
    9bb6:	01 c0                	add    %eax,%eax
    9bb8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9bbb:	01 d0                	add    %edx,%eax
    9bbd:	dd 04 c3             	fldl   (%ebx,%eax,8)
    9bc0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9bc3:	89 d0                	mov    %edx,%eax
    9bc5:	c1 e0 03             	shl    $0x3,%eax
    9bc8:	01 d0                	add    %edx,%eax
    9bca:	01 c0                	add    %eax,%eax
    9bcc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9bcf:	01 d0                	add    %edx,%eax
    9bd1:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    9bd4:	e9 b0 00 00 00       	jmp    9c89 <III_stereo+0xd93>
               }
            }
            else if (i_stereo ) {
    9bd9:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9bdd:	0f 84 94 00 00 00    	je     9c77 <III_stereo+0xd81>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    9be3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9be6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9be9:	89 d0                	mov    %edx,%eax
    9beb:	c1 e0 03             	shl    $0x3,%eax
    9bee:	01 d0                	add    %edx,%eax
    9bf0:	01 c0                	add    %eax,%eax
    9bf2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9bf5:	01 d0                	add    %edx,%eax
    9bf7:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9bfa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9bfd:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9c04:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c07:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9c0e:	d9 e8                	fld1   
    9c10:	de c1                	faddp  %st,%st(1)
    9c12:	de f9                	fdivrp %st,%st(1)
    9c14:	de c9                	fmulp  %st,%st(1)
    9c16:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9c19:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9c1c:	89 d0                	mov    %edx,%eax
    9c1e:	c1 e0 03             	shl    $0x3,%eax
    9c21:	01 d0                	add    %edx,%eax
    9c23:	01 c0                	add    %eax,%eax
    9c25:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c28:	01 d0                	add    %edx,%eax
    9c2a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    9c2d:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c30:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9c36:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9c39:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9c3c:	89 d0                	mov    %edx,%eax
    9c3e:	c1 e0 03             	shl    $0x3,%eax
    9c41:	01 d0                	add    %edx,%eax
    9c43:	01 c0                	add    %eax,%eax
    9c45:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c48:	01 d0                	add    %edx,%eax
    9c4a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9c4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c50:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9c57:	d9 e8                	fld1   
    9c59:	de c1                	faddp  %st,%st(1)
    9c5b:	d9 e8                	fld1   
    9c5d:	de f1                	fdivp  %st,%st(1)
    9c5f:	de c9                	fmulp  %st,%st(1)
    9c61:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9c64:	89 d0                	mov    %edx,%eax
    9c66:	c1 e0 03             	shl    $0x3,%eax
    9c69:	01 d0                	add    %edx,%eax
    9c6b:	01 c0                	add    %eax,%eax
    9c6d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c70:	01 d0                	add    %edx,%eax
    9c72:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    9c75:	eb 12                	jmp    9c89 <III_stereo+0xd93>
            }
            else {
               printf(0,"Error in streo processing\n");
    9c77:	83 ec 08             	sub    $0x8,%esp
    9c7a:	68 00 c9 00 00       	push   $0xc900
    9c7f:	6a 00                	push   $0x0
    9c81:	e8 4a a7 ff ff       	call   43d0 <printf>
    9c86:	83 c4 10             	add    $0x10,%esp
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    9c89:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9c8d:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9c91:	0f 8e ed fd ff ff    	jle    9a84 <III_stereo+0xb8e>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    9c97:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9c9b:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9c9f:	0f 8e d3 fd ff ff    	jle    9a78 <III_stereo+0xb82>
    9ca5:	eb 54                	jmp    9cfb <III_stereo+0xe05>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    9ca7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9cae:	eb 45                	jmp    9cf5 <III_stereo+0xdff>
         for(ss=0;ss<SSLIMIT;ss++)
    9cb0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9cb7:	eb 32                	jmp    9ceb <III_stereo+0xdf5>
            lr[0][sb][ss] = xr[0][sb][ss];
    9cb9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9cbc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9cbf:	89 d0                	mov    %edx,%eax
    9cc1:	c1 e0 03             	shl    $0x3,%eax
    9cc4:	01 d0                	add    %edx,%eax
    9cc6:	01 c0                	add    %eax,%eax
    9cc8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ccb:	01 d0                	add    %edx,%eax
    9ccd:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9cd0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9cd3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9cd6:	89 d0                	mov    %edx,%eax
    9cd8:	c1 e0 03             	shl    $0x3,%eax
    9cdb:	01 d0                	add    %edx,%eax
    9cdd:	01 c0                	add    %eax,%eax
    9cdf:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ce2:	01 d0                	add    %edx,%eax
    9ce4:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    9ce7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9ceb:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9cef:	7e c8                	jle    9cb9 <III_stereo+0xdc3>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    9cf1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9cf5:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9cf9:	7e b5                	jle    9cb0 <III_stereo+0xdba>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    9cfb:	8d 65 f8             	lea    -0x8(%ebp),%esp
    9cfe:	5b                   	pop    %ebx
    9cff:	5e                   	pop    %esi
    9d00:	5d                   	pop    %ebp
    9d01:	c3                   	ret    

00009d02 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9d02:	55                   	push   %ebp
    9d03:	89 e5                	mov    %esp,%ebp
    9d05:	83 ec 38             	sub    $0x38,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    9d08:	a1 40 f7 00 00       	mov    0xf740,%eax
    9d0d:	85 c0                	test   %eax,%eax
    9d0f:	74 72                	je     9d83 <III_antialias+0x81>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9d11:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9d18:	eb 59                	jmp    9d73 <III_antialias+0x71>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    9d1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d1d:	dd 04 c5 00 f7 00 00 	fldl   0xf700(,%eax,8)
    9d24:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d27:	dd 04 c5 00 f7 00 00 	fldl   0xf700(,%eax,8)
    9d2e:	de c9                	fmulp  %st,%st(1)
    9d30:	d9 e8                	fld1   
    9d32:	de c1                	faddp  %st,%st(1)
    9d34:	83 ec 08             	sub    $0x8,%esp
    9d37:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9d3b:	dd 1c 24             	fstpl  (%esp)
    9d3e:	e8 e4 ac ff ff       	call   4a27 <sqrt>
    9d43:	83 c4 10             	add    $0x10,%esp
    9d46:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    9d49:	d9 e8                	fld1   
    9d4b:	dc 75 e0             	fdivl  -0x20(%ebp)
    9d4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d51:	dd 1c c5 00 f8 00 00 	fstpl  0xf800(,%eax,8)
         ca[i] = Ci[i]/sq;
    9d58:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d5b:	dd 04 c5 00 f7 00 00 	fldl   0xf700(,%eax,8)
    9d62:	dc 75 e0             	fdivl  -0x20(%ebp)
    9d65:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d68:	dd 1c c5 40 f8 00 00 	fstpl  0xf840(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9d6f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9d73:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    9d77:	7e a1                	jle    9d1a <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    9d79:	c7 05 40 f7 00 00 00 	movl   $0x0,0xf740
    9d80:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9d83:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9d8a:	eb 4c                	jmp    9dd8 <III_antialias+0xd6>
       for(ss=0;ss<SSLIMIT;ss++)
    9d8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9d93:	eb 39                	jmp    9dce <III_antialias+0xcc>
          hybridIn[sb][ss] = xr[sb][ss];
    9d95:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9d98:	89 d0                	mov    %edx,%eax
    9d9a:	c1 e0 03             	shl    $0x3,%eax
    9d9d:	01 d0                	add    %edx,%eax
    9d9f:	c1 e0 04             	shl    $0x4,%eax
    9da2:	89 c2                	mov    %eax,%edx
    9da4:	8b 45 0c             	mov    0xc(%ebp),%eax
    9da7:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9daa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9dad:	89 d0                	mov    %edx,%eax
    9daf:	c1 e0 03             	shl    $0x3,%eax
    9db2:	01 d0                	add    %edx,%eax
    9db4:	c1 e0 04             	shl    $0x4,%eax
    9db7:	89 c2                	mov    %eax,%edx
    9db9:	8b 45 08             	mov    0x8(%ebp),%eax
    9dbc:	01 c2                	add    %eax,%edx
    9dbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9dc1:	dd 04 c2             	fldl   (%edx,%eax,8)
    9dc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9dc7:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    9dca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9dce:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9dd2:	7e c1                	jle    9d95 <III_antialias+0x93>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9dd4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9dd8:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    9ddc:	7e ae                	jle    9d8c <III_antialias+0x8a>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    9dde:	8b 45 10             	mov    0x10(%ebp),%eax
    9de1:	8b 40 10             	mov    0x10(%eax),%eax
    9de4:	85 c0                	test   %eax,%eax
    9de6:	74 1a                	je     9e02 <III_antialias+0x100>
    9de8:	8b 45 10             	mov    0x10(%ebp),%eax
    9deb:	8b 40 14             	mov    0x14(%eax),%eax
    9dee:	83 f8 02             	cmp    $0x2,%eax
    9df1:	75 0f                	jne    9e02 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    9df3:	8b 45 10             	mov    0x10(%ebp),%eax
    9df6:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    9df9:	85 c0                	test   %eax,%eax
    9dfb:	75 05                	jne    9e02 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    9dfd:	e9 1c 01 00 00       	jmp    9f1e <III_antialias+0x21c>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9e02:	8b 45 10             	mov    0x10(%ebp),%eax
    9e05:	8b 40 10             	mov    0x10(%eax),%eax
    9e08:	85 c0                	test   %eax,%eax
    9e0a:	74 1e                	je     9e2a <III_antialias+0x128>
    9e0c:	8b 45 10             	mov    0x10(%ebp),%eax
    9e0f:	8b 40 18             	mov    0x18(%eax),%eax
    9e12:	85 c0                	test   %eax,%eax
    9e14:	74 14                	je     9e2a <III_antialias+0x128>
     (gr_info->block_type == 2))
    9e16:	8b 45 10             	mov    0x10(%ebp),%eax
    9e19:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9e1c:	83 f8 02             	cmp    $0x2,%eax
    9e1f:	75 09                	jne    9e2a <III_antialias+0x128>
     (gr_info->block_type == 2))
      sblim = 1;
    9e21:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    9e28:	eb 07                	jmp    9e31 <III_antialias+0x12f>
   else
      sblim = SBLIMIT-1;
    9e2a:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9e31:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9e38:	e9 d5 00 00 00       	jmp    9f12 <III_antialias+0x210>
      for(ss=0;ss<8;ss++) {
    9e3d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9e44:	e9 bb 00 00 00       	jmp    9f04 <III_antialias+0x202>
         bu = xr[sb][17-ss];
    9e49:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9e4c:	89 d0                	mov    %edx,%eax
    9e4e:	c1 e0 03             	shl    $0x3,%eax
    9e51:	01 d0                	add    %edx,%eax
    9e53:	c1 e0 04             	shl    $0x4,%eax
    9e56:	89 c2                	mov    %eax,%edx
    9e58:	8b 45 08             	mov    0x8(%ebp),%eax
    9e5b:	01 c2                	add    %eax,%edx
    9e5d:	b8 11 00 00 00       	mov    $0x11,%eax
    9e62:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9e65:	dd 04 c2             	fldl   (%edx,%eax,8)
    9e68:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    9e6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e6e:	8d 50 01             	lea    0x1(%eax),%edx
    9e71:	89 d0                	mov    %edx,%eax
    9e73:	c1 e0 03             	shl    $0x3,%eax
    9e76:	01 d0                	add    %edx,%eax
    9e78:	c1 e0 04             	shl    $0x4,%eax
    9e7b:	89 c2                	mov    %eax,%edx
    9e7d:	8b 45 08             	mov    0x8(%ebp),%eax
    9e80:	01 c2                	add    %eax,%edx
    9e82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e85:	dd 04 c2             	fldl   (%edx,%eax,8)
    9e88:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    9e8b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9e8e:	89 d0                	mov    %edx,%eax
    9e90:	c1 e0 03             	shl    $0x3,%eax
    9e93:	01 d0                	add    %edx,%eax
    9e95:	c1 e0 04             	shl    $0x4,%eax
    9e98:	89 c2                	mov    %eax,%edx
    9e9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    9e9d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9ea0:	b8 11 00 00 00       	mov    $0x11,%eax
    9ea5:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9ea8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9eab:	dd 04 d5 00 f8 00 00 	fldl   0xf800(,%edx,8)
    9eb2:	dc 4d d8             	fmull  -0x28(%ebp)
    9eb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9eb8:	dd 04 d5 40 f8 00 00 	fldl   0xf840(,%edx,8)
    9ebf:	dc 4d d0             	fmull  -0x30(%ebp)
    9ec2:	de e9                	fsubrp %st,%st(1)
    9ec4:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    9ec7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9eca:	8d 50 01             	lea    0x1(%eax),%edx
    9ecd:	89 d0                	mov    %edx,%eax
    9ecf:	c1 e0 03             	shl    $0x3,%eax
    9ed2:	01 d0                	add    %edx,%eax
    9ed4:	c1 e0 04             	shl    $0x4,%eax
    9ed7:	89 c2                	mov    %eax,%edx
    9ed9:	8b 45 0c             	mov    0xc(%ebp),%eax
    9edc:	01 c2                	add    %eax,%edx
    9ede:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ee1:	dd 04 c5 00 f8 00 00 	fldl   0xf800(,%eax,8)
    9ee8:	dc 4d d0             	fmull  -0x30(%ebp)
    9eeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9eee:	dd 04 c5 40 f8 00 00 	fldl   0xf840(,%eax,8)
    9ef5:	dc 4d d8             	fmull  -0x28(%ebp)
    9ef8:	de c1                	faddp  %st,%st(1)
    9efa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9efd:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    9f00:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9f04:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    9f08:	0f 8e 3b ff ff ff    	jle    9e49 <III_antialias+0x147>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9f0e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9f12:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f15:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    9f18:	0f 8c 1f ff ff ff    	jl     9e3d <III_antialias+0x13b>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    9f1e:	c9                   	leave  
    9f1f:	c3                   	ret    

00009f20 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    9f20:	55                   	push   %ebp
    9f21:	89 e5                	mov    %esp,%ebp
    9f23:	81 ec 98 00 00 00    	sub    $0x98,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    9f29:	a1 80 f8 00 00       	mov    0xf880,%eax
    9f2e:	85 c0                	test   %eax,%eax
    9f30:	0f 85 9f 02 00 00    	jne    a1d5 <inv_mdct+0x2b5>

    /* type 0 */
      for(i=0;i<36;i++)
    9f36:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f3d:	eb 33                	jmp    9f72 <inv_mdct+0x52>
         win[0][i] = sin( PI/36 *(i+0.5) );
    9f3f:	db 45 f4             	fildl  -0xc(%ebp)
    9f42:	dd 05 90 d9 00 00    	fldl   0xd990
    9f48:	de c1                	faddp  %st,%st(1)
    9f4a:	dd 05 98 d9 00 00    	fldl   0xd998
    9f50:	de c9                	fmulp  %st,%st(1)
    9f52:	83 ec 08             	sub    $0x8,%esp
    9f55:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9f59:	dd 1c 24             	fstpl  (%esp)
    9f5c:	e8 38 a8 ff ff       	call   4799 <sin>
    9f61:	83 c4 10             	add    $0x10,%esp
    9f64:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f67:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    9f6e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9f72:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9f76:	7e c7                	jle    9f3f <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9f78:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f7f:	eb 36                	jmp    9fb7 <inv_mdct+0x97>
         win[1][i] = sin( PI/36 *(i+0.5) );
    9f81:	db 45 f4             	fildl  -0xc(%ebp)
    9f84:	dd 05 90 d9 00 00    	fldl   0xd990
    9f8a:	de c1                	faddp  %st,%st(1)
    9f8c:	dd 05 98 d9 00 00    	fldl   0xd998
    9f92:	de c9                	fmulp  %st,%st(1)
    9f94:	83 ec 08             	sub    $0x8,%esp
    9f97:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9f9b:	dd 1c 24             	fstpl  (%esp)
    9f9e:	e8 f6 a7 ff ff       	call   4799 <sin>
    9fa3:	83 c4 10             	add    $0x10,%esp
    9fa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fa9:	83 c0 24             	add    $0x24,%eax
    9fac:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9fb3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9fb7:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9fbb:	7e c4                	jle    9f81 <inv_mdct+0x61>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9fbd:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9fc4:	eb 13                	jmp    9fd9 <inv_mdct+0xb9>
         win[1][i] = 1.0;
    9fc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fc9:	83 c0 24             	add    $0x24,%eax
    9fcc:	d9 e8                	fld1   
    9fce:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9fd5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9fd9:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    9fdd:	7e e7                	jle    9fc6 <inv_mdct+0xa6>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9fdf:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    9fe6:	eb 3e                	jmp    a026 <inv_mdct+0x106>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    9fe8:	db 45 f4             	fildl  -0xc(%ebp)
    9feb:	dd 05 90 d9 00 00    	fldl   0xd990
    9ff1:	de c1                	faddp  %st,%st(1)
    9ff3:	dd 05 a0 d9 00 00    	fldl   0xd9a0
    9ff9:	de e9                	fsubrp %st,%st(1)
    9ffb:	dd 05 80 d9 00 00    	fldl   0xd980
    a001:	de c9                	fmulp  %st,%st(1)
    a003:	83 ec 08             	sub    $0x8,%esp
    a006:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a00a:	dd 1c 24             	fstpl  (%esp)
    a00d:	e8 87 a7 ff ff       	call   4799 <sin>
    a012:	83 c4 10             	add    $0x10,%esp
    a015:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a018:	83 c0 24             	add    $0x24,%eax
    a01b:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    a022:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a026:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    a02a:	7e bc                	jle    9fe8 <inv_mdct+0xc8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a02c:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    a033:	eb 13                	jmp    a048 <inv_mdct+0x128>
         win[1][i] = 0.0;
    a035:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a038:	83 c0 24             	add    $0x24,%eax
    a03b:	d9 ee                	fldz   
    a03d:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a044:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a048:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a04c:	7e e7                	jle    a035 <inv_mdct+0x115>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a04e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a055:	eb 13                	jmp    a06a <inv_mdct+0x14a>
         win[3][i] = 0.0;
    a057:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a05a:	83 c0 6c             	add    $0x6c,%eax
    a05d:	d9 ee                	fldz   
    a05f:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a066:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a06a:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    a06e:	7e e7                	jle    a057 <inv_mdct+0x137>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a070:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    a077:	eb 3e                	jmp    a0b7 <inv_mdct+0x197>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    a079:	db 45 f4             	fildl  -0xc(%ebp)
    a07c:	dd 05 90 d9 00 00    	fldl   0xd990
    a082:	de c1                	faddp  %st,%st(1)
    a084:	dd 05 a8 d9 00 00    	fldl   0xd9a8
    a08a:	de e9                	fsubrp %st,%st(1)
    a08c:	dd 05 80 d9 00 00    	fldl   0xd980
    a092:	de c9                	fmulp  %st,%st(1)
    a094:	83 ec 08             	sub    $0x8,%esp
    a097:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a09b:	dd 1c 24             	fstpl  (%esp)
    a09e:	e8 f6 a6 ff ff       	call   4799 <sin>
    a0a3:	83 c4 10             	add    $0x10,%esp
    a0a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0a9:	83 c0 6c             	add    $0x6c,%eax
    a0ac:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a0b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a0b7:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a0bb:	7e bc                	jle    a079 <inv_mdct+0x159>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a0bd:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a0c4:	eb 13                	jmp    a0d9 <inv_mdct+0x1b9>
         win[3][i] =1.0;
    a0c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0c9:	83 c0 6c             	add    $0x6c,%eax
    a0cc:	d9 e8                	fld1   
    a0ce:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a0d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a0d9:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a0dd:	7e e7                	jle    a0c6 <inv_mdct+0x1a6>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a0df:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    a0e6:	eb 36                	jmp    a11e <inv_mdct+0x1fe>
         win[3][i] = sin( PI/36*(i+0.5) );
    a0e8:	db 45 f4             	fildl  -0xc(%ebp)
    a0eb:	dd 05 90 d9 00 00    	fldl   0xd990
    a0f1:	de c1                	faddp  %st,%st(1)
    a0f3:	dd 05 98 d9 00 00    	fldl   0xd998
    a0f9:	de c9                	fmulp  %st,%st(1)
    a0fb:	83 ec 08             	sub    $0x8,%esp
    a0fe:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a102:	dd 1c 24             	fstpl  (%esp)
    a105:	e8 8f a6 ff ff       	call   4799 <sin>
    a10a:	83 c4 10             	add    $0x10,%esp
    a10d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a110:	83 c0 6c             	add    $0x6c,%eax
    a113:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a11a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a11e:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a122:	7e c4                	jle    a0e8 <inv_mdct+0x1c8>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a124:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a12b:	eb 36                	jmp    a163 <inv_mdct+0x243>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    a12d:	db 45 f4             	fildl  -0xc(%ebp)
    a130:	dd 05 90 d9 00 00    	fldl   0xd990
    a136:	de c1                	faddp  %st,%st(1)
    a138:	dd 05 80 d9 00 00    	fldl   0xd980
    a13e:	de c9                	fmulp  %st,%st(1)
    a140:	83 ec 08             	sub    $0x8,%esp
    a143:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a147:	dd 1c 24             	fstpl  (%esp)
    a14a:	e8 4a a6 ff ff       	call   4799 <sin>
    a14f:	83 c4 10             	add    $0x10,%esp
    a152:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a155:	83 c0 48             	add    $0x48,%eax
    a158:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a15f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a163:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a167:	7e c4                	jle    a12d <inv_mdct+0x20d>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a169:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a170:	eb 13                	jmp    a185 <inv_mdct+0x265>
         win[2][i] = 0.0 ;
    a172:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a175:	83 c0 48             	add    $0x48,%eax
    a178:	d9 ee                	fldz   
    a17a:	dd 1c c5 c0 f8 00 00 	fstpl  0xf8c0(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a181:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a185:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a189:	7e e7                	jle    a172 <inv_mdct+0x252>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a18b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a192:	eb 2b                	jmp    a1bf <inv_mdct+0x29f>
         COS[i] = cos(PI/(2*36) * i);
    a194:	db 45 f4             	fildl  -0xc(%ebp)
    a197:	dd 05 b0 d9 00 00    	fldl   0xd9b0
    a19d:	de c9                	fmulp  %st,%st(1)
    a19f:	83 ec 08             	sub    $0x8,%esp
    a1a2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a1a6:	dd 1c 24             	fstpl  (%esp)
    a1a9:	e8 8a a6 ff ff       	call   4838 <cos>
    a1ae:	83 c4 10             	add    $0x10,%esp
    a1b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a1b4:	dd 1c c5 40 fd 00 00 	fstpl  0xfd40(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a1bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a1bf:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    a1c6:	7e cc                	jle    a194 <inv_mdct+0x274>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    a1c8:	a1 80 f8 00 00       	mov    0xf880,%eax
    a1cd:	83 c0 01             	add    $0x1,%eax
    a1d0:	a3 80 f8 00 00       	mov    %eax,0xf880
    }

    for(i=0;i<36;i++)
    a1d5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a1dc:	eb 17                	jmp    a1f5 <inv_mdct+0x2d5>
       out[i]=0;
    a1de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a1e1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a1e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    a1eb:	01 d0                	add    %edx,%eax
    a1ed:	d9 ee                	fldz   
    a1ef:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    a1f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a1f5:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a1f9:	7e e3                	jle    a1de <inv_mdct+0x2be>
       out[i]=0;

    if(block_type == 2){
    a1fb:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    a1ff:	0f 85 8f 01 00 00    	jne    a394 <inv_mdct+0x474>
       N=12;
    a205:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    a20c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a213:	e9 6d 01 00 00       	jmp    a385 <inv_mdct+0x465>
          for(p= 0;p<N;p++){
    a218:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a21f:	e9 e9 00 00 00       	jmp    a30d <inv_mdct+0x3ed>
             sum = 0.0;
    a224:	d9 ee                	fldz   
    a226:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    a229:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a230:	e9 99 00 00 00       	jmp    a2ce <inv_mdct+0x3ae>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    a235:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a238:	89 d0                	mov    %edx,%eax
    a23a:	01 c0                	add    %eax,%eax
    a23c:	01 c2                	add    %eax,%edx
    a23e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a241:	01 d0                	add    %edx,%eax
    a243:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a24a:	8b 45 08             	mov    0x8(%ebp),%eax
    a24d:	01 d0                	add    %edx,%eax
    a24f:	dd 00                	fldl   (%eax)
    a251:	dd 9d 70 ff ff ff    	fstpl  -0x90(%ebp)
    a257:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a25a:	01 c0                	add    %eax,%eax
    a25c:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    a262:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    a268:	dd 05 b8 d9 00 00    	fldl   0xd9b8
    a26e:	de f1                	fdivp  %st,%st(1)
    a270:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a273:	01 c0                	add    %eax,%eax
    a275:	8d 50 01             	lea    0x1(%eax),%edx
    a278:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a27b:	89 c1                	mov    %eax,%ecx
    a27d:	c1 e9 1f             	shr    $0x1f,%ecx
    a280:	01 c8                	add    %ecx,%eax
    a282:	d1 f8                	sar    %eax
    a284:	01 d0                	add    %edx,%eax
    a286:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    a28c:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    a292:	de c9                	fmulp  %st,%st(1)
    a294:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a297:	01 c0                	add    %eax,%eax
    a299:	83 c0 01             	add    $0x1,%eax
    a29c:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    a2a2:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    a2a8:	de c9                	fmulp  %st,%st(1)
    a2aa:	83 ec 08             	sub    $0x8,%esp
    a2ad:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a2b1:	dd 1c 24             	fstpl  (%esp)
    a2b4:	e8 7f a5 ff ff       	call   4838 <cos>
    a2b9:	83 c4 10             	add    $0x10,%esp
    a2bc:	dc 8d 70 ff ff ff    	fmull  -0x90(%ebp)
    a2c2:	dd 45 e0             	fldl   -0x20(%ebp)
    a2c5:	de c1                	faddp  %st,%st(1)
    a2c7:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    a2ca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a2ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a2d1:	89 c2                	mov    %eax,%edx
    a2d3:	c1 ea 1f             	shr    $0x1f,%edx
    a2d6:	01 d0                	add    %edx,%eax
    a2d8:	d1 f8                	sar    %eax
    a2da:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a2dd:	0f 8f 52 ff ff ff    	jg     a235 <inv_mdct+0x315>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    a2e3:	8b 55 10             	mov    0x10(%ebp),%edx
    a2e6:	89 d0                	mov    %edx,%eax
    a2e8:	c1 e0 03             	shl    $0x3,%eax
    a2eb:	01 d0                	add    %edx,%eax
    a2ed:	c1 e0 02             	shl    $0x2,%eax
    a2f0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a2f3:	01 d0                	add    %edx,%eax
    a2f5:	dd 04 c5 c0 f8 00 00 	fldl   0xf8c0(,%eax,8)
    a2fc:	dc 4d e0             	fmull  -0x20(%ebp)
    a2ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a302:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    a309:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a30d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a310:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a313:	0f 8c 0b ff ff ff    	jl     a224 <inv_mdct+0x304>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a319:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a320:	eb 57                	jmp    a379 <inv_mdct+0x459>
             out[6*i+p+6] += tmp[p];
    a322:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a325:	89 d0                	mov    %edx,%eax
    a327:	01 c0                	add    %eax,%eax
    a329:	01 d0                	add    %edx,%eax
    a32b:	01 c0                	add    %eax,%eax
    a32d:	89 c2                	mov    %eax,%edx
    a32f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a332:	01 d0                	add    %edx,%eax
    a334:	83 c0 06             	add    $0x6,%eax
    a337:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a33e:	8b 45 0c             	mov    0xc(%ebp),%eax
    a341:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a344:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a347:	89 d0                	mov    %edx,%eax
    a349:	01 c0                	add    %eax,%eax
    a34b:	01 d0                	add    %edx,%eax
    a34d:	01 c0                	add    %eax,%eax
    a34f:	89 c2                	mov    %eax,%edx
    a351:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a354:	01 d0                	add    %edx,%eax
    a356:	83 c0 06             	add    $0x6,%eax
    a359:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a360:	8b 45 0c             	mov    0xc(%ebp),%eax
    a363:	01 d0                	add    %edx,%eax
    a365:	dd 00                	fldl   (%eax)
    a367:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a36a:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    a371:	de c1                	faddp  %st,%st(1)
    a373:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a375:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a379:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a37c:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a37f:	7c a1                	jl     a322 <inv_mdct+0x402>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    a381:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a385:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    a389:	0f 8e 89 fe ff ff    	jle    a218 <inv_mdct+0x2f8>
    a38f:	e9 da 00 00 00       	jmp    a46e <inv_mdct+0x54e>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    a394:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    a39b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a3a2:	e9 bb 00 00 00       	jmp    a462 <inv_mdct+0x542>
         sum = 0.0;
    a3a7:	d9 ee                	fldz   
    a3a9:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    a3ac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a3b3:	eb 6a                	jmp    a41f <inv_mdct+0x4ff>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    a3b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a3b8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a3bf:	8b 45 08             	mov    0x8(%ebp),%eax
    a3c2:	01 d0                	add    %edx,%eax
    a3c4:	dd 00                	fldl   (%eax)
    a3c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a3c9:	01 c0                	add    %eax,%eax
    a3cb:	8d 50 01             	lea    0x1(%eax),%edx
    a3ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a3d1:	89 c1                	mov    %eax,%ecx
    a3d3:	c1 e9 1f             	shr    $0x1f,%ecx
    a3d6:	01 c8                	add    %ecx,%eax
    a3d8:	d1 f8                	sar    %eax
    a3da:	01 c2                	add    %eax,%edx
    a3dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a3df:	01 c0                	add    %eax,%eax
    a3e1:	83 c0 01             	add    $0x1,%eax
    a3e4:	89 d1                	mov    %edx,%ecx
    a3e6:	0f af c8             	imul   %eax,%ecx
    a3e9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a3ee:	89 c8                	mov    %ecx,%eax
    a3f0:	f7 ea                	imul   %edx
    a3f2:	c1 fa 05             	sar    $0x5,%edx
    a3f5:	89 c8                	mov    %ecx,%eax
    a3f7:	c1 f8 1f             	sar    $0x1f,%eax
    a3fa:	29 c2                	sub    %eax,%edx
    a3fc:	89 d0                	mov    %edx,%eax
    a3fe:	c1 e0 03             	shl    $0x3,%eax
    a401:	01 d0                	add    %edx,%eax
    a403:	c1 e0 04             	shl    $0x4,%eax
    a406:	29 c1                	sub    %eax,%ecx
    a408:	89 ca                	mov    %ecx,%edx
    a40a:	dd 04 d5 40 fd 00 00 	fldl   0xfd40(,%edx,8)
    a411:	de c9                	fmulp  %st,%st(1)
    a413:	dd 45 e0             	fldl   -0x20(%ebp)
    a416:	de c1                	faddp  %st,%st(1)
    a418:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    a41b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a41f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a422:	89 c2                	mov    %eax,%edx
    a424:	c1 ea 1f             	shr    $0x1f,%edx
    a427:	01 d0                	add    %edx,%eax
    a429:	d1 f8                	sar    %eax
    a42b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a42e:	7f 85                	jg     a3b5 <inv_mdct+0x495>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    a430:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a433:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a43a:	8b 45 0c             	mov    0xc(%ebp),%eax
    a43d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a440:	8b 55 10             	mov    0x10(%ebp),%edx
    a443:	89 d0                	mov    %edx,%eax
    a445:	c1 e0 03             	shl    $0x3,%eax
    a448:	01 d0                	add    %edx,%eax
    a44a:	c1 e0 02             	shl    $0x2,%eax
    a44d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a450:	01 d0                	add    %edx,%eax
    a452:	dd 04 c5 c0 f8 00 00 	fldl   0xf8c0(,%eax,8)
    a459:	dc 4d e0             	fmull  -0x20(%ebp)
    a45c:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    a45e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a462:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a465:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a468:	0f 8c 39 ff ff ff    	jl     a3a7 <inv_mdct+0x487>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    a46e:	c9                   	leave  
    a46f:	c3                   	ret    

0000a470 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    a470:	55                   	push   %ebp
    a471:	89 e5                	mov    %esp,%ebp
    a473:	53                   	push   %ebx
    a474:	81 ec 44 01 00 00    	sub    $0x144,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    a47a:	a1 44 f7 00 00       	mov    0xf744,%eax
    a47f:	85 c0                	test   %eax,%eax
    a481:	74 6f                	je     a4f2 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    a483:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a48a:	eb 56                	jmp    a4e2 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    a48c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a493:	eb 43                	jmp    a4d8 <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    a495:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a49c:	eb 30                	jmp    a4ce <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    a49e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a4a1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a4a4:	89 c2                	mov    %eax,%edx
    a4a6:	c1 e2 03             	shl    $0x3,%edx
    a4a9:	01 c2                	add    %eax,%edx
    a4ab:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a4ae:	89 c2                	mov    %eax,%edx
    a4b0:	89 c8                	mov    %ecx,%eax
    a4b2:	c1 e0 03             	shl    $0x3,%eax
    a4b5:	01 c8                	add    %ecx,%eax
    a4b7:	c1 e0 06             	shl    $0x6,%eax
    a4ba:	01 c2                	add    %eax,%edx
    a4bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a4bf:	01 d0                	add    %edx,%eax
    a4c1:	d9 ee                	fldz   
    a4c3:	dd 1c c5 c0 01 01 00 	fstpl  0x101c0(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    a4ca:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a4ce:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    a4d2:	7e ca                	jle    a49e <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    a4d4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a4d8:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    a4dc:	7e b7                	jle    a495 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    a4de:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a4e2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    a4e6:	7e a4                	jle    a48c <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    a4e8:	c7 05 44 f7 00 00 00 	movl   $0x0,0xf744
    a4ef:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a4f2:	8b 45 18             	mov    0x18(%ebp),%eax
    a4f5:	8b 40 10             	mov    0x10(%eax),%eax
    a4f8:	85 c0                	test   %eax,%eax
    a4fa:	74 10                	je     a50c <III_hybrid+0x9c>
    a4fc:	8b 45 18             	mov    0x18(%ebp),%eax
    a4ff:	8b 40 18             	mov    0x18(%eax),%eax
    a502:	85 c0                	test   %eax,%eax
    a504:	74 06                	je     a50c <III_hybrid+0x9c>
    a506:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    a50a:	7e 08                	jle    a514 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    a50c:	8b 45 18             	mov    0x18(%ebp),%eax
    a50f:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a512:	eb 05                	jmp    a519 <III_hybrid+0xa9>
    a514:	b8 00 00 00 00       	mov    $0x0,%eax
    a519:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    a51c:	83 ec 04             	sub    $0x4,%esp
    a51f:	ff 75 e4             	pushl  -0x1c(%ebp)
    a522:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    a528:	50                   	push   %eax
    a529:	ff 75 08             	pushl  0x8(%ebp)
    a52c:	e8 ef f9 ff ff       	call   9f20 <inv_mdct>
    a531:	83 c4 10             	add    $0x10,%esp

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a534:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a53b:	e9 83 00 00 00       	jmp    a5c3 <III_hybrid+0x153>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    a540:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a543:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a54a:	8b 45 0c             	mov    0xc(%ebp),%eax
    a54d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a550:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a553:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a55a:	8b 45 10             	mov    0x10(%ebp),%eax
    a55d:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a560:	89 c2                	mov    %eax,%edx
    a562:	c1 e2 03             	shl    $0x3,%edx
    a565:	01 c2                	add    %eax,%edx
    a567:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a56a:	89 c2                	mov    %eax,%edx
    a56c:	89 c8                	mov    %ecx,%eax
    a56e:	c1 e0 03             	shl    $0x3,%eax
    a571:	01 c8                	add    %ecx,%eax
    a573:	c1 e0 06             	shl    $0x6,%eax
    a576:	01 c2                	add    %eax,%edx
    a578:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a57b:	01 d0                	add    %edx,%eax
    a57d:	dd 04 c5 c0 01 01 00 	fldl   0x101c0(,%eax,8)
    a584:	de c1                	faddp  %st,%st(1)
    a586:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    a588:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a58b:	83 c0 12             	add    $0x12,%eax
    a58e:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a595:	8b 45 10             	mov    0x10(%ebp),%eax
    a598:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a59b:	89 c2                	mov    %eax,%edx
    a59d:	c1 e2 03             	shl    $0x3,%edx
    a5a0:	01 c2                	add    %eax,%edx
    a5a2:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a5a5:	89 c2                	mov    %eax,%edx
    a5a7:	89 c8                	mov    %ecx,%eax
    a5a9:	c1 e0 03             	shl    $0x3,%eax
    a5ac:	01 c8                	add    %ecx,%eax
    a5ae:	c1 e0 06             	shl    $0x6,%eax
    a5b1:	01 c2                	add    %eax,%edx
    a5b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a5b6:	01 d0                	add    %edx,%eax
    a5b8:	dd 1c c5 c0 01 01 00 	fstpl  0x101c0(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a5bf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a5c3:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a5c7:	0f 8e 73 ff ff ff    	jle    a540 <III_hybrid+0xd0>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    a5cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    a5d0:	c9                   	leave  
    a5d1:	c3                   	ret    

0000a5d2 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    a5d2:	55                   	push   %ebp
    a5d3:	89 e5                	mov    %esp,%ebp
    a5d5:	57                   	push   %edi
    a5d6:	56                   	push   %esi
    a5d7:	53                   	push   %ebx
    a5d8:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    a5db:	be 00 00 00 00       	mov    $0x0,%esi
    a5e0:	e9 1a 01 00 00       	jmp    a6ff <create_syn_filter+0x12d>
		for (k=0; k<32; k++) {
    a5e5:	bb 00 00 00 00       	mov    $0x0,%ebx
    a5ea:	e9 04 01 00 00       	jmp    a6f3 <create_syn_filter+0x121>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    a5ef:	89 f0                	mov    %esi,%eax
    a5f1:	c1 e0 08             	shl    $0x8,%eax
    a5f4:	89 c2                	mov    %eax,%edx
    a5f6:	8b 45 08             	mov    0x8(%ebp),%eax
    a5f9:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a5fc:	89 75 dc             	mov    %esi,-0x24(%ebp)
    a5ff:	db 45 dc             	fildl  -0x24(%ebp)
    a602:	dd 05 c0 d9 00 00    	fldl   0xd9c0
    a608:	de c9                	fmulp  %st,%st(1)
    a60a:	dd 05 c8 d9 00 00    	fldl   0xd9c8
    a610:	de c1                	faddp  %st,%st(1)
    a612:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    a615:	83 c0 01             	add    $0x1,%eax
    a618:	89 45 dc             	mov    %eax,-0x24(%ebp)
    a61b:	db 45 dc             	fildl  -0x24(%ebp)
    a61e:	de c9                	fmulp  %st,%st(1)
    a620:	83 ec 08             	sub    $0x8,%esp
    a623:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a627:	dd 1c 24             	fstpl  (%esp)
    a62a:	e8 09 a2 ff ff       	call   4838 <cos>
    a62f:	83 c4 10             	add    $0x10,%esp
    a632:	dd 05 d0 d9 00 00    	fldl   0xd9d0
    a638:	de c9                	fmulp  %st,%st(1)
    a63a:	dd 1c df             	fstpl  (%edi,%ebx,8)
    a63d:	dd 04 df             	fldl   (%edi,%ebx,8)
    a640:	d9 ee                	fldz   
    a642:	d9 c9                	fxch   %st(1)
    a644:	df e9                	fucomip %st(1),%st
    a646:	dd d8                	fstp   %st(0)
    a648:	72 41                	jb     a68b <create_syn_filter+0xb9>
				filter[i][k] = (int)(filter[i][k]+0.5);
    a64a:	89 f0                	mov    %esi,%eax
    a64c:	c1 e0 08             	shl    $0x8,%eax
    a64f:	89 c2                	mov    %eax,%edx
    a651:	8b 45 08             	mov    0x8(%ebp),%eax
    a654:	01 c2                	add    %eax,%edx
    a656:	89 f0                	mov    %esi,%eax
    a658:	c1 e0 08             	shl    $0x8,%eax
    a65b:	89 c1                	mov    %eax,%ecx
    a65d:	8b 45 08             	mov    0x8(%ebp),%eax
    a660:	01 c8                	add    %ecx,%eax
    a662:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a665:	dd 05 90 d9 00 00    	fldl   0xd990
    a66b:	de c1                	faddp  %st,%st(1)
    a66d:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a670:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a674:	b4 0c                	mov    $0xc,%ah
    a676:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a67a:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a67d:	db 5d dc             	fistpl -0x24(%ebp)
    a680:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a683:	db 45 dc             	fildl  -0x24(%ebp)
    a686:	dd 1c da             	fstpl  (%edx,%ebx,8)
    a689:	eb 3f                	jmp    a6ca <create_syn_filter+0xf8>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    a68b:	89 f0                	mov    %esi,%eax
    a68d:	c1 e0 08             	shl    $0x8,%eax
    a690:	89 c2                	mov    %eax,%edx
    a692:	8b 45 08             	mov    0x8(%ebp),%eax
    a695:	01 c2                	add    %eax,%edx
    a697:	89 f0                	mov    %esi,%eax
    a699:	c1 e0 08             	shl    $0x8,%eax
    a69c:	89 c1                	mov    %eax,%ecx
    a69e:	8b 45 08             	mov    0x8(%ebp),%eax
    a6a1:	01 c8                	add    %ecx,%eax
    a6a3:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a6a6:	dd 05 90 d9 00 00    	fldl   0xd990
    a6ac:	de e9                	fsubrp %st,%st(1)
    a6ae:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a6b1:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a6b5:	b4 0c                	mov    $0xc,%ah
    a6b7:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a6bb:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a6be:	db 5d dc             	fistpl -0x24(%ebp)
    a6c1:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a6c4:	db 45 dc             	fildl  -0x24(%ebp)
    a6c7:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    a6ca:	89 f0                	mov    %esi,%eax
    a6cc:	c1 e0 08             	shl    $0x8,%eax
    a6cf:	89 c2                	mov    %eax,%edx
    a6d1:	8b 45 08             	mov    0x8(%ebp),%eax
    a6d4:	01 d0                	add    %edx,%eax
    a6d6:	89 f2                	mov    %esi,%edx
    a6d8:	89 d1                	mov    %edx,%ecx
    a6da:	c1 e1 08             	shl    $0x8,%ecx
    a6dd:	8b 55 08             	mov    0x8(%ebp),%edx
    a6e0:	01 ca                	add    %ecx,%edx
    a6e2:	dd 04 da             	fldl   (%edx,%ebx,8)
    a6e5:	dd 05 d8 d9 00 00    	fldl   0xd9d8
    a6eb:	de c9                	fmulp  %st,%st(1)
    a6ed:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    a6f0:	83 c3 01             	add    $0x1,%ebx
    a6f3:	83 fb 1f             	cmp    $0x1f,%ebx
    a6f6:	0f 8e f3 fe ff ff    	jle    a5ef <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    a6fc:	83 c6 01             	add    $0x1,%esi
    a6ff:	83 fe 3f             	cmp    $0x3f,%esi
    a702:	0f 8e dd fe ff ff    	jle    a5e5 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    a708:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a70b:	5b                   	pop    %ebx
    a70c:	5e                   	pop    %esi
    a70d:	5f                   	pop    %edi
    a70e:	5d                   	pop    %ebp
    a70f:	c3                   	ret    

0000a710 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    a710:	55                   	push   %ebp
    a711:	89 e5                	mov    %esp,%ebp
    a713:	57                   	push   %edi
    a714:	56                   	push   %esi
    a715:	53                   	push   %ebx
    a716:	81 ec 04 10 00 00    	sub    $0x1004,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    a71c:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    a722:	bb 40 c9 00 00       	mov    $0xc940,%ebx
    a727:	ba 00 04 00 00       	mov    $0x400,%edx
    a72c:	89 c7                	mov    %eax,%edi
    a72e:	89 de                	mov    %ebx,%esi
    a730:	89 d1                	mov    %edx,%ecx
    a732:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    a734:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    a73a:	89 45 08             	mov    %eax,0x8(%ebp)
}
    a73d:	81 c4 04 10 00 00    	add    $0x1004,%esp
    a743:	5b                   	pop    %ebx
    a744:	5e                   	pop    %esi
    a745:	5f                   	pop    %edi
    a746:	5d                   	pop    %ebp
    a747:	c3                   	ret    

0000a748 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    a748:	55                   	push   %ebp
    a749:	89 e5                	mov    %esp,%ebp
    a74b:	57                   	push   %edi
    a74c:	56                   	push   %esi
    a74d:	53                   	push   %ebx
    a74e:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    a751:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    a758:	a1 48 f7 00 00       	mov    0xf748,%eax
    a75d:	85 c0                	test   %eax,%eax
    a75f:	74 7a                	je     a7db <SubBandSynthesis+0x93>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    a761:	83 ec 08             	sub    $0x8,%esp
    a764:	68 40 d9 00 00       	push   $0xd940
    a769:	68 00 40 00 00       	push   $0x4000
    a76e:	e8 af a7 ff ff       	call   4f22 <mem_alloc>
    a773:	83 c4 10             	add    $0x10,%esp
    a776:	a3 c0 25 01 00       	mov    %eax,0x125c0
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    a77b:	83 ec 08             	sub    $0x8,%esp
    a77e:	68 43 d9 00 00       	push   $0xd943
    a783:	68 00 40 00 00       	push   $0x4000
    a788:	e8 95 a7 ff ff       	call   4f22 <mem_alloc>
    a78d:	83 c4 10             	add    $0x10,%esp
    a790:	a3 c4 25 01 00       	mov    %eax,0x125c4
		create_syn_filter(*filter);
    a795:	a1 c4 25 01 00       	mov    0x125c4,%eax
    a79a:	83 ec 0c             	sub    $0xc,%esp
    a79d:	50                   	push   %eax
    a79e:	e8 2f fe ff ff       	call   a5d2 <create_syn_filter>
    a7a3:	83 c4 10             	add    $0x10,%esp
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    a7a6:	83 ec 08             	sub    $0x8,%esp
    a7a9:	68 46 d9 00 00       	push   $0xd946
    a7ae:	68 00 10 00 00       	push   $0x1000
    a7b3:	e8 6a a7 ff ff       	call   4f22 <mem_alloc>
    a7b8:	83 c4 10             	add    $0x10,%esp
    a7bb:	a3 c8 25 01 00       	mov    %eax,0x125c8
		read_syn_window(window);
    a7c0:	a1 c8 25 01 00       	mov    0x125c8,%eax
    a7c5:	83 ec 0c             	sub    $0xc,%esp
    a7c8:	50                   	push   %eax
    a7c9:	e8 42 ff ff ff       	call   a710 <read_syn_window>
    a7ce:	83 c4 10             	add    $0x10,%esp
		init = 0;
    a7d1:	c7 05 48 f7 00 00 00 	movl   $0x0,0xf748
    a7d8:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    a7db:	8b 45 0c             	mov    0xc(%ebp),%eax
    a7de:	8b 04 85 4c f7 00 00 	mov    0xf74c(,%eax,4),%eax
    a7e5:	83 e8 40             	sub    $0x40,%eax
    a7e8:	25 ff 03 00 00       	and    $0x3ff,%eax
    a7ed:	89 c2                	mov    %eax,%edx
    a7ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    a7f2:	89 14 85 4c f7 00 00 	mov    %edx,0xf74c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    a7f9:	8b 15 c0 25 01 00    	mov    0x125c0,%edx
    a7ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    a802:	8b 04 85 4c f7 00 00 	mov    0xf74c(,%eax,4),%eax
    a809:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a80c:	c1 e1 0a             	shl    $0xa,%ecx
    a80f:	01 c8                	add    %ecx,%eax
    a811:	c1 e0 03             	shl    $0x3,%eax
    a814:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    a817:	bb 00 00 00 00       	mov    $0x0,%ebx
    a81c:	eb 40                	jmp    a85e <SubBandSynthesis+0x116>
		sum = 0;
    a81e:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    a820:	be 00 00 00 00       	mov    $0x0,%esi
    a825:	eb 26                	jmp    a84d <SubBandSynthesis+0x105>
			sum += bandPtr[k] * (*filter)[i][k];
    a827:	89 f0                	mov    %esi,%eax
    a829:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a830:	8b 45 08             	mov    0x8(%ebp),%eax
    a833:	01 d0                	add    %edx,%eax
    a835:	dd 00                	fldl   (%eax)
    a837:	a1 c4 25 01 00       	mov    0x125c4,%eax
    a83c:	89 da                	mov    %ebx,%edx
    a83e:	c1 e2 05             	shl    $0x5,%edx
    a841:	01 f2                	add    %esi,%edx
    a843:	dd 04 d0             	fldl   (%eax,%edx,8)
    a846:	de c9                	fmulp  %st,%st(1)
    a848:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    a84a:	83 c6 01             	add    $0x1,%esi
    a84d:	83 fe 1f             	cmp    $0x1f,%esi
    a850:	7e d5                	jle    a827 <SubBandSynthesis+0xdf>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    a852:	89 d8                	mov    %ebx,%eax
    a854:	c1 e0 03             	shl    $0x3,%eax
    a857:	01 f8                	add    %edi,%eax
    a859:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    a85b:	83 c3 01             	add    $0x1,%ebx
    a85e:	83 fb 3f             	cmp    $0x3f,%ebx
    a861:	7e bb                	jle    a81e <SubBandSynthesis+0xd6>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a863:	bf 00 00 00 00       	mov    $0x0,%edi
    a868:	e9 c7 00 00 00       	jmp    a934 <SubBandSynthesis+0x1ec>
		sum = 0;
    a86d:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    a86f:	bb 00 00 00 00       	mov    $0x0,%ebx
    a874:	eb 4c                	jmp    a8c2 <SubBandSynthesis+0x17a>
			k = j + (i<<5);
    a876:	89 d8                	mov    %ebx,%eax
    a878:	c1 e0 05             	shl    $0x5,%eax
    a87b:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a87e:	a1 c8 25 01 00       	mov    0x125c8,%eax
    a883:	89 f2                	mov    %esi,%edx
    a885:	c1 e2 03             	shl    $0x3,%edx
    a888:	01 d0                	add    %edx,%eax
    a88a:	dd 00                	fldl   (%eax)
    a88c:	a1 c0 25 01 00       	mov    0x125c0,%eax
    a891:	8d 53 01             	lea    0x1(%ebx),%edx
    a894:	d1 fa                	sar    %edx
    a896:	c1 e2 06             	shl    $0x6,%edx
    a899:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    a89c:	8b 55 0c             	mov    0xc(%ebp),%edx
    a89f:	8b 14 95 4c f7 00 00 	mov    0xf74c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a8a6:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    a8a8:	89 d1                	mov    %edx,%ecx
    a8aa:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a8b0:	8b 55 0c             	mov    0xc(%ebp),%edx
    a8b3:	c1 e2 0a             	shl    $0xa,%edx
    a8b6:	01 ca                	add    %ecx,%edx
    a8b8:	dd 04 d0             	fldl   (%eax,%edx,8)
    a8bb:	de c9                	fmulp  %st,%st(1)
    a8bd:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    a8bf:	83 c3 01             	add    $0x1,%ebx
    a8c2:	83 fb 0f             	cmp    $0xf,%ebx
    a8c5:	7e af                	jle    a876 <SubBandSynthesis+0x12e>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    a8c7:	dd 05 e0 d9 00 00    	fldl   0xd9e0
    a8cd:	de c9                	fmulp  %st,%st(1)
    a8cf:	d9 7d d6             	fnstcw -0x2a(%ebp)
    a8d2:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    a8d6:	b4 0c                	mov    $0xc,%ah
    a8d8:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    a8dc:	d9 6d d4             	fldcw  -0x2c(%ebp)
    a8df:	db 5d e0             	fistpl -0x20(%ebp)
    a8e2:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    a8e5:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    a8ec:	7e 15                	jle    a903 <SubBandSynthesis+0x1bb>
    a8ee:	89 f8                	mov    %edi,%eax
    a8f0:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a8f3:	8b 45 10             	mov    0x10(%ebp),%eax
    a8f6:	01 d0                	add    %edx,%eax
    a8f8:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    a8fd:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a901:	eb 2e                	jmp    a931 <SubBandSynthesis+0x1e9>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    a903:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    a90a:	7d 15                	jge    a921 <SubBandSynthesis+0x1d9>
    a90c:	89 f8                	mov    %edi,%eax
    a90e:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a911:	8b 45 10             	mov    0x10(%ebp),%eax
    a914:	01 d0                	add    %edx,%eax
    a916:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    a91b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a91f:	eb 10                	jmp    a931 <SubBandSynthesis+0x1e9>
			else                           samples[j] = foo;
    a921:	89 f8                	mov    %edi,%eax
    a923:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a926:	8b 45 10             	mov    0x10(%ebp),%eax
    a929:	01 d0                	add    %edx,%eax
    a92b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a92e:	66 89 10             	mov    %dx,(%eax)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a931:	83 c7 01             	add    $0x1,%edi
    a934:	83 ff 1f             	cmp    $0x1f,%edi
    a937:	0f 8e 30 ff ff ff    	jle    a86d <SubBandSynthesis+0x125>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    a93d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    a940:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a943:	5b                   	pop    %ebx
    a944:	5e                   	pop    %esi
    a945:	5f                   	pop    %edi
    a946:	5d                   	pop    %ebp
    a947:	c3                   	ret    

0000a948 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    a948:	55                   	push   %ebp
    a949:	89 e5                	mov    %esp,%ebp
    a94b:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    a94e:	8b 45 10             	mov    0x10(%ebp),%eax
    a951:	8b 40 08             	mov    0x8(%eax),%eax
    a954:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a957:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    a95e:	eb 75                	jmp    a9d5 <out_fifo+0x8d>
    a960:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    a967:	eb 62                	jmp    a9cb <out_fifo+0x83>
            (*psampFrames)++;
    a969:	8b 45 14             	mov    0x14(%ebp),%eax
    a96c:	8b 00                	mov    (%eax),%eax
    a96e:	8d 50 01             	lea    0x1(%eax),%edx
    a971:	8b 45 14             	mov    0x14(%ebp),%eax
    a974:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    a976:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a97d:	eb 40                	jmp    a9bf <out_fifo+0x77>
                if (!(k%1600) && k) {
    a97f:	8b 0d cc 25 01 00    	mov    0x125cc,%ecx
    a985:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    a98a:	89 c8                	mov    %ecx,%eax
    a98c:	f7 ea                	imul   %edx
    a98e:	c1 fa 09             	sar    $0x9,%edx
    a991:	89 c8                	mov    %ecx,%eax
    a993:	c1 f8 1f             	sar    $0x1f,%eax
    a996:	29 c2                	sub    %eax,%edx
    a998:	89 d0                	mov    %edx,%eax
    a99a:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    a9a0:	29 c1                	sub    %eax,%ecx
    a9a2:	89 c8                	mov    %ecx,%eax
    a9a4:	85 c0                	test   %eax,%eax
    a9a6:	75 13                	jne    a9bb <out_fifo+0x73>
    a9a8:	a1 cc 25 01 00       	mov    0x125cc,%eax
    a9ad:	85 c0                	test   %eax,%eax
    a9af:	74 0a                	je     a9bb <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    a9b1:	c7 05 cc 25 01 00 00 	movl   $0x0,0x125cc
    a9b8:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    a9bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a9bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a9c2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a9c5:	7c b8                	jl     a97f <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a9c7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    a9cb:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    a9cf:	7e 98                	jle    a969 <out_fifo+0x21>
    a9d1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    a9d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    a9d8:	3b 45 0c             	cmp    0xc(%ebp),%eax
    a9db:	7c 83                	jl     a960 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    a9dd:	c9                   	leave  
    a9de:	c3                   	ret    

0000a9df <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    a9df:	55                   	push   %ebp
    a9e0:	89 e5                	mov    %esp,%ebp
    a9e2:	83 ec 08             	sub    $0x8,%esp
    *old_crc = getbits(bs, 16);
    a9e5:	83 ec 08             	sub    $0x8,%esp
    a9e8:	6a 10                	push   $0x10
    a9ea:	ff 75 08             	pushl  0x8(%ebp)
    a9ed:	e8 14 a8 ff ff       	call   5206 <getbits>
    a9f2:	83 c4 10             	add    $0x10,%esp
    a9f5:	89 c2                	mov    %eax,%edx
    a9f7:	8b 45 0c             	mov    0xc(%ebp),%eax
    a9fa:	89 10                	mov    %edx,(%eax)
}
    a9fc:	c9                   	leave  
    a9fd:	c3                   	ret    

0000a9fe <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    a9fe:	55                   	push   %ebp
    a9ff:	89 e5                	mov    %esp,%ebp
    aa01:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    aa04:	8b 45 08             	mov    0x8(%ebp),%eax
    aa07:	8b 40 0c             	mov    0xc(%eax),%eax
    aa0a:	83 c0 1e             	add    $0x1e,%eax
    aa0d:	8b 14 85 40 f2 00 00 	mov    0xf240(,%eax,4),%edx
    aa14:	89 d0                	mov    %edx,%eax
    aa16:	c1 e0 03             	shl    $0x3,%eax
    aa19:	01 d0                	add    %edx,%eax
    aa1b:	c1 e0 04             	shl    $0x4,%eax
    aa1e:	89 45 e8             	mov    %eax,-0x18(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
    aa21:	db 45 e8             	fildl  -0x18(%ebp)
    aa24:	8b 45 08             	mov    0x8(%ebp),%eax
    aa27:	8b 40 10             	mov    0x10(%eax),%eax
    aa2a:	dd 04 c5 00 f3 00 00 	fldl   0xf300(,%eax,8)
    aa31:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    aa33:	d9 7d ee             	fnstcw -0x12(%ebp)
    aa36:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
    aa3a:	b4 0c                	mov    $0xc,%ah
    aa3c:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    aa40:	d9 6d ec             	fldcw  -0x14(%ebp)
    aa43:	db 5d fc             	fistpl -0x4(%ebp)
    aa46:	d9 6d ee             	fldcw  -0x12(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    aa49:	8b 45 08             	mov    0x8(%ebp),%eax
    aa4c:	8b 40 14             	mov    0x14(%eax),%eax
    aa4f:	85 c0                	test   %eax,%eax
    aa51:	74 04                	je     aa57 <main_data_slots+0x59>
    aa53:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    aa57:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    aa5b:	8b 45 08             	mov    0x8(%ebp),%eax
    aa5e:	8b 40 08             	mov    0x8(%eax),%eax
    aa61:	85 c0                	test   %eax,%eax
    aa63:	74 04                	je     aa69 <main_data_slots+0x6b>
		nSlots -= 2;
    aa65:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    aa69:	8b 45 10             	mov    0x10(%ebp),%eax
    aa6c:	83 f8 01             	cmp    $0x1,%eax
    aa6f:	75 06                	jne    aa77 <main_data_slots+0x79>
		nSlots -= 17;
    aa71:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    aa75:	eb 04                	jmp    aa7b <main_data_slots+0x7d>
	else
		nSlots -=32;
    aa77:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    aa7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    aa7e:	c9                   	leave  
    aa7f:	c3                   	ret    
