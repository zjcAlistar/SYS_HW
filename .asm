
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
      7c:	05 8c 2e 01 00       	add    $0x12e8c,%eax
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
      8e:	c7 05 a0 2e 01 00 00 	movl   $0x0,0x12ea0
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
      a6:	e8 01 46 00 00       	call   46ac <malloc>
      ab:	83 c4 10             	add    $0x10,%esp
      ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      b1:	83 ec 0c             	sub    $0xc,%esp
      b4:	6a 20                	push   $0x20
      b6:	e8 f1 45 00 00       	call   46ac <malloc>
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
      d3:	e8 f6 3e 00 00       	call   3fce <strcpy>
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
      fb:	8b 15 cc f7 00 00    	mov    0xf7cc,%edx
     101:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     104:	8d 45 d8             	lea    -0x28(%ebp),%eax
     107:	83 ec 0c             	sub    $0xc,%esp
     10a:	52                   	push   %edx
     10b:	ff 35 88 2e 01 00    	pushl  0x12e88
     111:	ff 35 84 2e 01 00    	pushl  0x12e84
     117:	ff 35 80 2e 01 00    	pushl  0x12e80
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
     13e:	8b 15 c8 f7 00 00    	mov    0xf7c8,%edx
     144:	8b 45 f4             	mov    -0xc(%ebp),%eax
     147:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     14a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     14d:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     154:	8b 45 f4             	mov    -0xc(%ebp),%eax
     157:	a3 c8 f7 00 00       	mov    %eax,0xf7c8
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
     167:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
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
     18a:	e8 dc 43 00 00       	call   456b <free>
     18f:	83 c4 10             	add    $0x10,%esp
		free(temp);
     192:	83 ec 0c             	sub    $0xc,%esp
     195:	ff 75 f0             	pushl  -0x10(%ebp)
     198:	e8 ce 43 00 00       	call   456b <free>
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
     1a6:	c7 05 c8 f7 00 00 00 	movl   $0x0,0xf7c8
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
     1be:	e8 7a 3e 00 00       	call   403d <strlen>
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
     257:	c7 05 cc f7 00 00 00 	movl   $0x0,0xf7cc
     25e:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     261:	83 ec 08             	sub    $0x8,%esp
     264:	6a 00                	push   $0x0
     266:	ff 75 08             	pushl  0x8(%ebp)
     269:	e8 d0 3f 00 00       	call   423e <open>
     26e:	83 c4 10             	add    $0x10,%esp
     271:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     274:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     278:	79 1a                	jns    294 <list+0x49>
		printf(2, "ls: cannot open %s\n", path);
     27a:	83 ec 04             	sub    $0x4,%esp
     27d:	ff 75 08             	pushl  0x8(%ebp)
     280:	68 c0 aa 00 00       	push   $0xaac0
     285:	6a 02                	push   $0x2
     287:	e8 4f 41 00 00       	call   43db <printf>
     28c:	83 c4 10             	add    $0x10,%esp
		return;
     28f:	e9 52 02 00 00       	jmp    4e6 <list+0x29b>
	}

	if (fstat(fd, &st) < 0) {
     294:	83 ec 08             	sub    $0x8,%esp
     297:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     29d:	50                   	push   %eax
     29e:	ff 75 e4             	pushl  -0x1c(%ebp)
     2a1:	e8 b0 3f 00 00       	call   4256 <fstat>
     2a6:	83 c4 10             	add    $0x10,%esp
     2a9:	85 c0                	test   %eax,%eax
     2ab:	79 28                	jns    2d5 <list+0x8a>
		printf(2, "ls: cannot stat %s\n", path);
     2ad:	83 ec 04             	sub    $0x4,%esp
     2b0:	ff 75 08             	pushl  0x8(%ebp)
     2b3:	68 d4 aa 00 00       	push   $0xaad4
     2b8:	6a 02                	push   $0x2
     2ba:	e8 1c 41 00 00       	call   43db <printf>
     2bf:	83 c4 10             	add    $0x10,%esp
		close(fd);
     2c2:	83 ec 0c             	sub    $0xc,%esp
     2c5:	ff 75 e4             	pushl  -0x1c(%ebp)
     2c8:	e8 59 3f 00 00       	call   4226 <close>
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
     316:	68 e8 aa 00 00       	push   $0xaae8
     31b:	6a 01                	push   $0x1
     31d:	e8 b9 40 00 00       	call   43db <printf>
     322:	83 c4 20             	add    $0x20,%esp
		break;
     325:	e9 ae 01 00 00       	jmp    4d8 <list+0x28d>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     32a:	83 ec 0c             	sub    $0xc,%esp
     32d:	ff 75 08             	pushl  0x8(%ebp)
     330:	e8 08 3d 00 00       	call   403d <strlen>
     335:	83 c4 10             	add    $0x10,%esp
     338:	83 c0 10             	add    $0x10,%eax
     33b:	3d 00 02 00 00       	cmp    $0x200,%eax
     340:	76 17                	jbe    359 <list+0x10e>
			printf(1, "ls: path too long\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 f5 aa 00 00       	push   $0xaaf5
     34a:	6a 01                	push   $0x1
     34c:	e8 8a 40 00 00       	call   43db <printf>
     351:	83 c4 10             	add    $0x10,%esp
			break;
     354:	e9 7f 01 00 00       	jmp    4d8 <list+0x28d>
		}
		strcpy(buf, path);
     359:	83 ec 08             	sub    $0x8,%esp
     35c:	ff 75 08             	pushl  0x8(%ebp)
     35f:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     365:	50                   	push   %eax
     366:	e8 63 3c 00 00       	call   3fce <strcpy>
     36b:	83 c4 10             	add    $0x10,%esp
		p = buf + strlen(buf);
     36e:	83 ec 0c             	sub    $0xc,%esp
     371:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     377:	50                   	push   %eax
     378:	e8 c0 3c 00 00       	call   403d <strlen>
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
     3c1:	e8 f3 3d 00 00       	call   41b9 <memmove>
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
     3e3:	e8 37 3d 00 00       	call   411f <stat>
     3e8:	83 c4 10             	add    $0x10,%esp
     3eb:	85 c0                	test   %eax,%eax
     3ed:	79 1e                	jns    40d <list+0x1c2>
				printf(1, "ls: cannot stat %s\n", buf);
     3ef:	83 ec 04             	sub    $0x4,%esp
     3f2:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3f8:	50                   	push   %eax
     3f9:	68 d4 aa 00 00       	push   $0xaad4
     3fe:	6a 01                	push   $0x1
     400:	e8 d6 3f 00 00       	call   43db <printf>
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
     43a:	8b 15 cc f7 00 00    	mov    0xf7cc,%edx
     440:	8d 45 d0             	lea    -0x30(%ebp),%eax
     443:	83 ec 0c             	sub    $0xc,%esp
     446:	52                   	push   %edx
     447:	ff 35 88 2e 01 00    	pushl  0x12e88
     44d:	ff 35 84 2e 01 00    	pushl  0x12e84
     453:	ff 35 80 2e 01 00    	pushl  0x12e80
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
     4aa:	a1 cc f7 00 00       	mov    0xf7cc,%eax
     4af:	83 c0 01             	add    $0x1,%eax
     4b2:	a3 cc f7 00 00       	mov    %eax,0xf7cc
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
     4c6:	e8 4b 3d 00 00       	call   4216 <read>
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
     4de:	e8 43 3d 00 00       	call   4226 <close>
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
     52d:	e8 bd 23 00 00       	call   28ef <fill_rect>
     532:	83 c4 20             	add    $0x20,%esp
	}
	if (style == ICON_STYLE) {
     535:	a1 c4 ed 00 00       	mov    0xedc4,%eax
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
     560:	ff 35 30 ee 00 00    	pushl  0xee30
     566:	ff 35 2c ee 00 00    	pushl  0xee2c
     56c:	ff 35 28 ee 00 00    	pushl  0xee28
     572:	ff 75 10             	pushl  0x10(%ebp)
     575:	ff 75 0c             	pushl  0xc(%ebp)
     578:	ff 75 08             	pushl  0x8(%ebp)
     57b:	e8 79 29 00 00       	call   2ef9 <draw_picture>
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
     593:	ff 35 98 ee 00 00    	pushl  0xee98
     599:	ff 35 94 ee 00 00    	pushl  0xee94
     59f:	ff 35 90 ee 00 00    	pushl  0xee90
     5a5:	ff 75 10             	pushl  0x10(%ebp)
     5a8:	ff 75 0c             	pushl  0xc(%ebp)
     5ab:	ff 75 08             	pushl  0x8(%ebp)
     5ae:	e8 46 29 00 00       	call   2ef9 <draw_picture>
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
     5bd:	e8 7b 3a 00 00       	call   403d <strlen>
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
     608:	e8 3d 28 00 00       	call   2e4a <puts_str>
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
     636:	ff 35 64 ee 00 00    	pushl  0xee64
     63c:	ff 35 60 ee 00 00    	pushl  0xee60
     642:	ff 35 5c ee 00 00    	pushl  0xee5c
     648:	ff 75 10             	pushl  0x10(%ebp)
     64b:	ff 75 0c             	pushl  0xc(%ebp)
     64e:	ff 75 08             	pushl  0x8(%ebp)
     651:	e8 a3 28 00 00       	call   2ef9 <draw_picture>
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
     690:	e8 b5 27 00 00       	call   2e4a <puts_str>
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
     6a8:	ff 35 cc ee 00 00    	pushl  0xeecc
     6ae:	ff 35 c8 ee 00 00    	pushl  0xeec8
     6b4:	ff 35 c4 ee 00 00    	pushl  0xeec4
     6ba:	ff 75 10             	pushl  0x10(%ebp)
     6bd:	ff 75 0c             	pushl  0xc(%ebp)
     6c0:	ff 75 08             	pushl  0x8(%ebp)
     6c3:	e8 31 28 00 00       	call   2ef9 <draw_picture>
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
     6ee:	e8 57 27 00 00       	call   2e4a <puts_str>
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
     707:	e8 a0 3f 00 00       	call   46ac <malloc>
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
     87a:	e8 36 27 00 00       	call   2fb5 <draw_line>
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
     8a4:	e8 0c 27 00 00       	call   2fb5 <draw_line>
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
     8ce:	e8 e2 26 00 00       	call   2fb5 <draw_line>
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
     8ee:	e8 c2 26 00 00       	call   2fb5 <draw_line>
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
     911:	e8 d9 1f 00 00       	call   28ef <fill_rect>
     916:	83 c4 20             	add    $0x20,%esp
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     919:	83 ec 04             	sub    $0x4,%esp
     91c:	6a 03                	push   $0x3
     91e:	68 2c 01 00 00       	push   $0x12c
     923:	6a 00                	push   $0x0
     925:	68 08 ab 00 00       	push   $0xab08
     92a:	ff 75 10             	pushl  0x10(%ebp)
     92d:	ff 75 0c             	pushl  0xc(%ebp)
     930:	ff 75 08             	pushl  0x8(%ebp)
     933:	e8 12 25 00 00       	call   2e4a <puts_str>
     938:	83 c4 20             	add    $0x20,%esp
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     93b:	83 ec 0c             	sub    $0xc,%esp
     93e:	6a 0e                	push   $0xe
     940:	68 00 ef 00 00       	push   $0xef00
     945:	ff 75 10             	pushl  0x10(%ebp)
     948:	ff 75 0c             	pushl  0xc(%ebp)
     94b:	ff 75 08             	pushl  0x8(%ebp)
     94e:	e8 27 29 00 00       	call   327a <draw_iconlist>
     953:	83 c4 20             	add    $0x20,%esp
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     956:	83 ec 04             	sub    $0x4,%esp
     959:	6a 23                	push   $0x23
     95b:	68 a4 01 00 00       	push   $0x1a4
     960:	6a 00                	push   $0x0
     962:	68 8c 2e 01 00       	push   $0x12e8c
     967:	ff 75 10             	pushl  0x10(%ebp)
     96a:	ff 75 0c             	pushl  0xc(%ebp)
     96d:	ff 75 08             	pushl  0x8(%ebp)
     970:	e8 d5 24 00 00       	call   2e4a <puts_str>
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
     98f:	a1 c4 ed 00 00       	mov    0xedc4,%eax
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
     9c3:	e8 27 1f 00 00       	call   28ef <fill_rect>
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
     9ed:	e8 c3 25 00 00       	call   2fb5 <draw_line>
     9f2:	83 c4 20             	add    $0x20,%esp

	//printf(0, "listing complete!\n");
	//printItemList();
//	p = fileItemList;
//	q = 0;
	if (keyContent.length == 0) {
     9f5:	a1 a0 2e 01 00       	mov    0x12ea0,%eax
     9fa:	85 c0                	test   %eax,%eax
     9fc:	75 72                	jne    a70 <drawFinderContent+0xf6>
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
     9fe:	83 ec 08             	sub    $0x8,%esp
     a01:	68 10 ab 00 00       	push   $0xab10
     a06:	6a 00                	push   $0x0
     a08:	e8 ce 39 00 00       	call   43db <printf>
     a0d:	83 c4 10             	add    $0x10,%esp
//		freeFileItemList();
//		list(".");
		p = fileItemList;
     a10:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
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
     a70:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
     a75:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while(p != 0) {
     a78:	e9 a9 00 00 00       	jmp    b26 <drawFinderContent+0x1ac>
			printf(0, "now you are searching!\n");
     a7d:	83 ec 08             	sub    $0x8,%esp
     a80:	68 69 ab 00 00       	push   $0xab69
     a85:	6a 00                	push   $0x0
     a87:	e8 4f 39 00 00       	call   43db <printf>
     a8c:	83 c4 10             	add    $0x10,%esp
		   	if (strstr(p->name, keyContent.content)) {
     a8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a92:	8b 40 14             	mov    0x14(%eax),%eax
     a95:	83 ec 08             	sub    $0x8,%esp
     a98:	68 8c 2e 01 00       	push   $0x12e8c
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
     b0e:	68 84 ab 00 00       	push   $0xab84
     b13:	6a 00                	push   $0x0
     b15:	e8 c1 38 00 00       	call   43db <printf>
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
     b30:	a1 c4 ed 00 00       	mov    0xedc4,%eax
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
     b54:	e8 96 1d 00 00       	call   28ef <fill_rect>
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
     b75:	e8 75 1d 00 00       	call   28ef <fill_rect>
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
     b9d:	e8 4d 1d 00 00       	call   28ef <fill_rect>
     ba2:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     ba5:	83 ec 04             	sub    $0x4,%esp
     ba8:	6a 50                	push   $0x50
     baa:	6a 2b                	push   $0x2b
     bac:	6a 00                	push   $0x0
     bae:	68 a5 ab 00 00       	push   $0xaba5
     bb3:	ff 75 10             	pushl  0x10(%ebp)
     bb6:	ff 75 0c             	pushl  0xc(%ebp)
     bb9:	ff 75 08             	pushl  0x8(%ebp)
     bbc:	e8 89 22 00 00       	call   2e4a <puts_str>
     bc1:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     bc4:	83 ec 04             	sub    $0x4,%esp
     bc7:	6a 50                	push   $0x50
     bc9:	68 cb 00 00 00       	push   $0xcb
     bce:	6a 00                	push   $0x0
     bd0:	68 aa ab 00 00       	push   $0xabaa
     bd5:	ff 75 10             	pushl  0x10(%ebp)
     bd8:	ff 75 0c             	pushl  0xc(%ebp)
     bdb:	ff 75 08             	pushl  0x8(%ebp)
     bde:	e8 67 22 00 00       	call   2e4a <puts_str>
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
     bfe:	e8 a9 3a 00 00       	call   46ac <malloc>
     c03:	83 c4 10             	add    $0x10,%esp
     c06:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     c09:	83 ec 0c             	sub    $0xc,%esp
     c0c:	6a 04                	push   $0x4
     c0e:	e8 99 3a 00 00       	call   46ac <malloc>
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
     cc3:	e8 a3 38 00 00       	call   456b <free>
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
     cd9:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
     cde:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     ce1:	eb 22                	jmp    d05 <printItemList+0x32>
		printf(0, "%s\n", p->name);
     ce3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ce6:	8b 40 14             	mov    0x14(%eax),%eax
     ce9:	83 ec 04             	sub    $0x4,%esp
     cec:	50                   	push   %eax
     ced:	68 af ab 00 00       	push   $0xabaf
     cf2:	6a 00                	push   $0x0
     cf4:	e8 e2 36 00 00       	call   43db <printf>
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
     d13:	a1 c4 ed 00 00       	mov    0xedc4,%eax
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
     d67:	8b 15 c0 f7 00 00    	mov    0xf7c0,%edx
     d6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d70:	01 c2                	add    %eax,%edx
     d72:	8b 45 08             	mov    0x8(%ebp),%eax
     d75:	83 ec 0c             	sub    $0xc,%esp
     d78:	6a 5f                	push   $0x5f
     d7a:	6a 64                	push   $0x64
     d7c:	52                   	push   %edx
     d7d:	ff 75 e4             	pushl  -0x1c(%ebp)
     d80:	50                   	push   %eax
     d81:	e8 b4 2c 00 00       	call   3a3a <initRect>
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
     d9b:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
     da0:	01 c2                	add    %eax,%edx
     da2:	8b 45 08             	mov    0x8(%ebp),%eax
     da5:	83 ec 0c             	sub    $0xc,%esp
     da8:	6a 1e                	push   $0x1e
     daa:	51                   	push   %ecx
     dab:	52                   	push   %edx
     dac:	6a 00                	push   $0x0
     dae:	50                   	push   %eax
     daf:	e8 86 2c 00 00       	call   3a3a <initRect>
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
     dc4:	a1 c4 ed 00 00       	mov    0xedc4,%eax
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
     dfa:	68 0e 20 00 00       	push   $0x200e
     dff:	6a 02                	push   $0x2
     e01:	ff 75 30             	pushl  0x30(%ebp)
     e04:	ff 75 2c             	pushl  0x2c(%ebp)
     e07:	ff 75 28             	pushl  0x28(%ebp)
     e0a:	ff 75 24             	pushl  0x24(%ebp)
     e0d:	ff 75 08             	pushl  0x8(%ebp)
     e10:	e8 07 2d 00 00       	call   3b1c <createClickable>
     e15:	83 c4 20             	add    $0x20,%esp
		break;
     e18:	eb 56                	jmp    e70 <addItemEvent+0xb2>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     e1a:	83 ec 04             	sub    $0x4,%esp
     e1d:	68 0e 20 00 00       	push   $0x200e
     e22:	6a 02                	push   $0x2
     e24:	ff 75 30             	pushl  0x30(%ebp)
     e27:	ff 75 2c             	pushl  0x2c(%ebp)
     e2a:	ff 75 28             	pushl  0x28(%ebp)
     e2d:	ff 75 24             	pushl  0x24(%ebp)
     e30:	ff 75 08             	pushl  0x8(%ebp)
     e33:	e8 e4 2c 00 00       	call   3b1c <createClickable>
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
     e54:	e8 c3 2c 00 00       	call   3b1c <createClickable>
     e59:	83 c4 20             	add    $0x20,%esp
		break;
     e5c:	eb 12                	jmp    e70 <addItemEvent+0xb2>
	default:
		printf(0, "unknown file type!");
     e5e:	83 ec 08             	sub    $0x8,%esp
     e61:	68 b3 ab 00 00       	push   $0xabb3
     e66:	6a 00                	push   $0x0
     e68:	e8 6e 35 00 00       	call   43db <printf>
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
     e78:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
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
     eec:	8b 1c 85 e0 f1 00 00 	mov    0xf1e0(,%eax,4),%ebx
     ef3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ef6:	6b c0 34             	imul   $0x34,%eax,%eax
     ef9:	83 c0 20             	add    $0x20,%eax
     efc:	05 00 ef 00 00       	add    $0xef00,%eax
     f01:	8b 78 10             	mov    0x10(%eax),%edi
     f04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f07:	6b c0 34             	imul   $0x34,%eax,%eax
     f0a:	83 c0 20             	add    $0x20,%eax
     f0d:	05 00 ef 00 00       	add    $0xef00,%eax
     f12:	8b 70 0c             	mov    0xc(%eax),%esi
     f15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f18:	6b c0 34             	imul   $0x34,%eax,%eax
     f1b:	83 c0 20             	add    $0x20,%eax
     f1e:	05 00 ef 00 00       	add    $0xef00,%eax
     f23:	8b 48 04             	mov    0x4(%eax),%ecx
     f26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f29:	6b c0 34             	imul   $0x34,%eax,%eax
     f2c:	83 c0 20             	add    $0x20,%eax
     f2f:	05 00 ef 00 00       	add    $0xef00,%eax
     f34:	8b 10                	mov    (%eax),%edx
     f36:	8d 45 d0             	lea    -0x30(%ebp),%eax
     f39:	83 ec 0c             	sub    $0xc,%esp
     f3c:	57                   	push   %edi
     f3d:	56                   	push   %esi
     f3e:	51                   	push   %ecx
     f3f:	52                   	push   %edx
     f40:	50                   	push   %eax
     f41:	e8 f4 2a 00 00       	call   3a3a <initRect>
     f46:	83 c4 1c             	add    $0x1c,%esp
     f49:	83 ec 04             	sub    $0x4,%esp
     f4c:	53                   	push   %ebx
     f4d:	6a 02                	push   $0x2
     f4f:	ff 75 dc             	pushl  -0x24(%ebp)
     f52:	ff 75 d8             	pushl  -0x28(%ebp)
     f55:	ff 75 d4             	pushl  -0x2c(%ebp)
     f58:	ff 75 d0             	pushl  -0x30(%ebp)
     f5b:	ff 75 08             	pushl  0x8(%ebp)
     f5e:	e8 b9 2b 00 00       	call   3b1c <createClickable>
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
     f84:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
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
     fa6:	e8 e0 2a 00 00       	call   3a8b <isIn>
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
     fd0:	c7 05 40 26 01 00 01 	movl   $0x1,0x12640
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
     fe2:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
     fe7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
     fea:	a1 c4 ed 00 00       	mov    0xedc4,%eax
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
    100e:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    1013:	83 e8 1e             	sub    $0x1e,%eax
    1016:	a3 c0 f7 00 00       	mov    %eax,0xf7c0
    101b:	eb 5d                	jmp    107a <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
    101d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1020:	8b 40 1c             	mov    0x1c(%eax),%eax
    1023:	ba 63 01 00 00       	mov    $0x163,%edx
    1028:	29 c2                	sub    %eax,%edx
    102a:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    102f:	01 d0                	add    %edx,%eax
    1031:	a3 c0 f7 00 00       	mov    %eax,0xf7c0
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
    1052:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    1057:	83 e8 1e             	sub    $0x1e,%eax
    105a:	a3 c0 f7 00 00       	mov    %eax,0xf7c0
    105f:	eb 19                	jmp    107a <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    1061:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1064:	8b 40 1c             	mov    0x1c(%eax),%eax
    1067:	ba a4 01 00 00       	mov    $0x1a4,%edx
    106c:	29 c2                	sub    %eax,%edx
    106e:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    1073:	01 d0                	add    %edx,%eax
    1075:	a3 c0 f7 00 00       	mov    %eax,0xf7c0
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    107a:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    107f:	83 ec 04             	sub    $0x4,%esp
    1082:	50                   	push   %eax
    1083:	68 c8 ab 00 00       	push   $0xabc8
    1088:	6a 00                	push   $0x0
    108a:	e8 4c 33 00 00       	call   43db <printf>
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
    10a7:	68 e7 ab 00 00       	push   $0xabe7
    10ac:	e8 9a f1 ff ff       	call   24b <list>
    10b1:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    10b4:	83 ec 04             	sub    $0x4,%esp
    10b7:	ff 35 88 2e 01 00    	pushl  0x12e88
    10bd:	ff 35 84 2e 01 00    	pushl  0x12e84
    10c3:	ff 35 80 2e 01 00    	pushl  0x12e80
    10c9:	e8 ac f8 ff ff       	call   97a <drawFinderContent>
    10ce:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    10d1:	83 ec 04             	sub    $0x4,%esp
    10d4:	ff 35 88 2e 01 00    	pushl  0x12e88
    10da:	ff 35 84 2e 01 00    	pushl  0x12e84
    10e0:	ff 35 80 2e 01 00    	pushl  0x12e80
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
    1103:	e8 32 29 00 00       	call   3a3a <initRect>
    1108:	83 c4 1c             	add    $0x1c,%esp
    110b:	83 ec 0c             	sub    $0xc,%esp
    110e:	ff 75 f4             	pushl  -0xc(%ebp)
    1111:	ff 75 f0             	pushl  -0x10(%ebp)
    1114:	ff 75 ec             	pushl  -0x14(%ebp)
    1117:	ff 75 e8             	pushl  -0x18(%ebp)
    111a:	68 c0 2f 01 00       	push   $0x12fc0
    111f:	e8 db 2a 00 00       	call   3bff <deleteClickable>
    1124:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1127:	83 ec 0c             	sub    $0xc,%esp
    112a:	68 c0 2f 01 00       	push   $0x12fc0
    112f:	e8 99 fd ff ff       	call   ecd <addWndEvent>
    1134:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1137:	83 ec 0c             	sub    $0xc,%esp
    113a:	68 c0 2f 01 00       	push   $0x12fc0
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
    114f:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
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
    116e:	a1 c4 ed 00 00       	mov    0xedc4,%eax
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
    118e:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    1193:	83 c0 1e             	add    $0x1e,%eax
    1196:	a3 c0 f7 00 00       	mov    %eax,0xf7c0
    119b:	eb 59                	jmp    11f6 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
    119d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11a0:	8b 40 1c             	mov    0x1c(%eax),%eax
    11a3:	ba 46 00 00 00       	mov    $0x46,%edx
    11a8:	29 c2                	sub    %eax,%edx
    11aa:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    11af:	01 d0                	add    %edx,%eax
    11b1:	a3 c0 f7 00 00       	mov    %eax,0xf7c0
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
    11ce:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    11d3:	83 c0 1e             	add    $0x1e,%eax
    11d6:	a3 c0 f7 00 00       	mov    %eax,0xf7c0
    11db:	eb 19                	jmp    11f6 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    11dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11e0:	8b 40 1c             	mov    0x1c(%eax),%eax
    11e3:	ba 62 00 00 00       	mov    $0x62,%edx
    11e8:	29 c2                	sub    %eax,%edx
    11ea:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    11ef:	01 d0                	add    %edx,%eax
    11f1:	a3 c0 f7 00 00       	mov    %eax,0xf7c0
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    11f6:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    11fb:	83 ec 04             	sub    $0x4,%esp
    11fe:	50                   	push   %eax
    11ff:	68 e9 ab 00 00       	push   $0xabe9
    1204:	6a 00                	push   $0x0
    1206:	e8 d0 31 00 00       	call   43db <printf>
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
    1223:	68 e7 ab 00 00       	push   $0xabe7
    1228:	e8 1e f0 ff ff       	call   24b <list>
    122d:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1230:	83 ec 04             	sub    $0x4,%esp
    1233:	ff 35 88 2e 01 00    	pushl  0x12e88
    1239:	ff 35 84 2e 01 00    	pushl  0x12e84
    123f:	ff 35 80 2e 01 00    	pushl  0x12e80
    1245:	e8 30 f7 ff ff       	call   97a <drawFinderContent>
    124a:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    124d:	83 ec 04             	sub    $0x4,%esp
    1250:	ff 35 88 2e 01 00    	pushl  0x12e88
    1256:	ff 35 84 2e 01 00    	pushl  0x12e84
    125c:	ff 35 80 2e 01 00    	pushl  0x12e80
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
    127f:	e8 b6 27 00 00       	call   3a3a <initRect>
    1284:	83 c4 1c             	add    $0x1c,%esp
    1287:	83 ec 0c             	sub    $0xc,%esp
    128a:	ff 75 f4             	pushl  -0xc(%ebp)
    128d:	ff 75 f0             	pushl  -0x10(%ebp)
    1290:	ff 75 ec             	pushl  -0x14(%ebp)
    1293:	ff 75 e8             	pushl  -0x18(%ebp)
    1296:	68 c0 2f 01 00       	push   $0x12fc0
    129b:	e8 5f 29 00 00       	call   3bff <deleteClickable>
    12a0:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    12a3:	83 ec 0c             	sub    $0xc,%esp
    12a6:	68 c0 2f 01 00       	push   $0x12fc0
    12ab:	e8 1d fc ff ff       	call   ecd <addWndEvent>
    12b0:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    12b3:	83 ec 0c             	sub    $0xc,%esp
    12b6:	68 c0 2f 01 00       	push   $0x12fc0
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
    12d1:	e8 67 2d 00 00       	call   403d <strlen>
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
    1304:	68 c0 2e 01 00       	push   $0x12ec0
    1309:	e8 2f 2d 00 00       	call   403d <strlen>
    130e:	83 c4 10             	add    $0x10,%esp
    1311:	83 f8 01             	cmp    $0x1,%eax
    1314:	75 0b                	jne    1321 <updatePath+0x5c>
    1316:	0f b6 05 c0 2e 01 00 	movzbl 0x12ec0,%eax
    131d:	3c 2f                	cmp    $0x2f,%al
    131f:	74 53                	je     1374 <updatePath+0xaf>
        {
            int tmpn = strlen(currentPath);
    1321:	83 ec 0c             	sub    $0xc,%esp
    1324:	68 c0 2e 01 00       	push   $0x12ec0
    1329:	e8 0f 2d 00 00       	call   403d <strlen>
    132e:	83 c4 10             	add    $0x10,%esp
    1331:	89 45 ec             	mov    %eax,-0x14(%ebp)
            currentPath[tmpn - 1] = '\0';
    1334:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1337:	83 e8 01             	sub    $0x1,%eax
    133a:	c6 80 c0 2e 01 00 00 	movb   $0x0,0x12ec0(%eax)
            for (i = tmpn - 2; i > 0; i--)
    1341:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1344:	83 e8 02             	sub    $0x2,%eax
    1347:	89 45 f4             	mov    %eax,-0xc(%ebp)
    134a:	eb 22                	jmp    136e <updatePath+0xa9>
            {
                if (currentPath[i] != '/')
    134c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    134f:	05 c0 2e 01 00       	add    $0x12ec0,%eax
    1354:	0f b6 00             	movzbl (%eax),%eax
    1357:	3c 2f                	cmp    $0x2f,%al
    1359:	74 0d                	je     1368 <updatePath+0xa3>
                    currentPath[i] = '\0';
    135b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    135e:	05 c0 2e 01 00       	add    $0x12ec0,%eax
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
    1379:	68 c0 2e 01 00       	push   $0x12ec0
    137e:	e8 ba 2c 00 00       	call   403d <strlen>
    1383:	83 c4 10             	add    $0x10,%esp
    1386:	89 45 e8             	mov    %eax,-0x18(%ebp)
        strcpy(currentPath + tmpn, name);
    1389:	8b 45 e8             	mov    -0x18(%ebp),%eax
    138c:	05 c0 2e 01 00       	add    $0x12ec0,%eax
    1391:	83 ec 08             	sub    $0x8,%esp
    1394:	ff 75 08             	pushl  0x8(%ebp)
    1397:	50                   	push   %eax
    1398:	e8 31 2c 00 00       	call   3fce <strcpy>
    139d:	83 c4 10             	add    $0x10,%esp
        tmpn = strlen(currentPath);
    13a0:	83 ec 0c             	sub    $0xc,%esp
    13a3:	68 c0 2e 01 00       	push   $0x12ec0
    13a8:	e8 90 2c 00 00       	call   403d <strlen>
    13ad:	83 c4 10             	add    $0x10,%esp
    13b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
        currentPath[tmpn] = '/';
    13b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13b6:	05 c0 2e 01 00       	add    $0x12ec0,%eax
    13bb:	c6 00 2f             	movb   $0x2f,(%eax)
        currentPath[tmpn + 1] = '\0';
    13be:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13c1:	83 c0 01             	add    $0x1,%eax
    13c4:	c6 80 c0 2e 01 00 00 	movb   $0x0,0x12ec0(%eax)
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
    13d3:	c7 05 c0 f7 00 00 00 	movl   $0x0,0xf7c0
    13da:	00 00 00 
	printf(0, "entering : %s\n", name);
    13dd:	83 ec 04             	sub    $0x4,%esp
    13e0:	ff 75 08             	pushl  0x8(%ebp)
    13e3:	68 06 ac 00 00       	push   $0xac06
    13e8:	6a 00                	push   $0x0
    13ea:	e8 ec 2f 00 00       	call   43db <printf>
    13ef:	83 c4 10             	add    $0x10,%esp
	if (chdir(name) < 0)
    13f2:	83 ec 0c             	sub    $0xc,%esp
    13f5:	ff 75 08             	pushl  0x8(%ebp)
    13f8:	e8 71 2e 00 00       	call   426e <chdir>
    13fd:	83 c4 10             	add    $0x10,%esp
    1400:	85 c0                	test   %eax,%eax
    1402:	79 17                	jns    141b <enterDir+0x4e>
		printf(2, "cannot cd %s\n", name);
    1404:	83 ec 04             	sub    $0x4,%esp
    1407:	ff 75 08             	pushl  0x8(%ebp)
    140a:	68 15 ac 00 00       	push   $0xac15
    140f:	6a 02                	push   $0x2
    1411:	e8 c5 2f 00 00       	call   43db <printf>
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
    142c:	68 c0 2e 01 00       	push   $0x12ec0
    1431:	68 23 ac 00 00       	push   $0xac23
    1436:	6a 00                	push   $0x0
    1438:	e8 9e 2f 00 00       	call   43db <printf>
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
    1476:	68 e7 ab 00 00       	push   $0xabe7
    147b:	e8 cb ed ff ff       	call   24b <list>
    1480:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1483:	83 ec 04             	sub    $0x4,%esp
    1486:	ff 35 88 2e 01 00    	pushl  0x12e88
    148c:	ff 35 84 2e 01 00    	pushl  0x12e84
    1492:	ff 35 80 2e 01 00    	pushl  0x12e80
    1498:	e8 dd f4 ff ff       	call   97a <drawFinderContent>
    149d:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    14a0:	83 ec 04             	sub    $0x4,%esp
    14a3:	ff 35 88 2e 01 00    	pushl  0x12e88
    14a9:	ff 35 84 2e 01 00    	pushl  0x12e84
    14af:	ff 35 80 2e 01 00    	pushl  0x12e80
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
    14d2:	e8 63 25 00 00       	call   3a3a <initRect>
    14d7:	83 c4 1c             	add    $0x1c,%esp
    14da:	83 ec 0c             	sub    $0xc,%esp
    14dd:	ff 75 f0             	pushl  -0x10(%ebp)
    14e0:	ff 75 ec             	pushl  -0x14(%ebp)
    14e3:	ff 75 e8             	pushl  -0x18(%ebp)
    14e6:	ff 75 e4             	pushl  -0x1c(%ebp)
    14e9:	68 c0 2f 01 00       	push   $0x12fc0
    14ee:	e8 0c 27 00 00       	call   3bff <deleteClickable>
    14f3:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    14f6:	83 ec 0c             	sub    $0xc,%esp
    14f9:	68 c0 2f 01 00       	push   $0x12fc0
    14fe:	e8 ca f9 ff ff       	call   ecd <addWndEvent>
    1503:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1506:	83 ec 0c             	sub    $0xc,%esp
    1509:	68 c0 2f 01 00       	push   $0x12fc0
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
    1524:	e8 14 2b 00 00       	call   403d <strlen>
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
    153e:	e8 fa 2a 00 00       	call   403d <strlen>
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
    1566:	e8 01 2c 00 00       	call   416c <atoi>
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
    1592:	e8 37 2a 00 00       	call   3fce <strcpy>
    1597:	83 c4 10             	add    $0x10,%esp
		close(fd);
    159a:	83 ec 0c             	sub    $0xc,%esp
    159d:	ff 75 e8             	pushl  -0x18(%ebp)
    15a0:	e8 81 2c 00 00       	call   4226 <close>
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
    15b0:	e8 89 2c 00 00       	call   423e <open>
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
    15d0:	e8 69 2c 00 00       	call   423e <open>
    15d5:	83 c4 10             	add    $0x10,%esp
    15d8:	89 45 e8             	mov    %eax,-0x18(%ebp)
    15db:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    15df:	79 1a                	jns    15fb <newFile+0xe3>
		printf(0, "cat: cannot open %s\n", name);
    15e1:	83 ec 04             	sub    $0x4,%esp
    15e4:	ff 75 08             	pushl  0x8(%ebp)
    15e7:	68 34 ac 00 00       	push   $0xac34
    15ec:	6a 00                	push   $0x0
    15ee:	e8 e8 2d 00 00       	call   43db <printf>
    15f3:	83 c4 10             	add    $0x10,%esp
		exit();
    15f6:	e8 03 2c 00 00       	call   41fe <exit>
	}
	close(fd);
    15fb:	83 ec 0c             	sub    $0xc,%esp
    15fe:	ff 75 e8             	pushl  -0x18(%ebp)
    1601:	e8 20 2c 00 00       	call   4226 <close>
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
    1660:	68 e7 ab 00 00       	push   $0xabe7
    1665:	e8 e1 eb ff ff       	call   24b <list>
    166a:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    166d:	83 ec 04             	sub    $0x4,%esp
    1670:	ff 35 88 2e 01 00    	pushl  0x12e88
    1676:	ff 35 84 2e 01 00    	pushl  0x12e84
    167c:	ff 35 80 2e 01 00    	pushl  0x12e80
    1682:	e8 f3 f2 ff ff       	call   97a <drawFinderContent>
    1687:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    168a:	83 ec 04             	sub    $0x4,%esp
    168d:	ff 35 88 2e 01 00    	pushl  0x12e88
    1693:	ff 35 84 2e 01 00    	pushl  0x12e84
    1699:	ff 35 80 2e 01 00    	pushl  0x12e80
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
    16bc:	e8 79 23 00 00       	call   3a3a <initRect>
    16c1:	83 c4 1c             	add    $0x1c,%esp
    16c4:	83 ec 0c             	sub    $0xc,%esp
    16c7:	ff 75 f4             	pushl  -0xc(%ebp)
    16ca:	ff 75 f0             	pushl  -0x10(%ebp)
    16cd:	ff 75 ec             	pushl  -0x14(%ebp)
    16d0:	ff 75 e8             	pushl  -0x18(%ebp)
    16d3:	68 c0 2f 01 00       	push   $0x12fc0
    16d8:	e8 22 25 00 00       	call   3bff <deleteClickable>
    16dd:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    16e0:	83 ec 0c             	sub    $0xc,%esp
    16e3:	68 c0 2f 01 00       	push   $0x12fc0
    16e8:	e8 e0 f7 ff ff       	call   ecd <addWndEvent>
    16ed:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    16f0:	83 ec 0c             	sub    $0xc,%esp
    16f3:	68 c0 2f 01 00       	push   $0x12fc0
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
    170e:	e8 2a 29 00 00       	call   403d <strlen>
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
    1728:	e8 10 29 00 00       	call   403d <strlen>
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
    1750:	e8 17 2a 00 00       	call   416c <atoi>
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
    177c:	e8 4d 28 00 00       	call   3fce <strcpy>
    1781:	83 c4 10             	add    $0x10,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    1784:	83 ec 0c             	sub    $0xc,%esp
    1787:	ff 75 08             	pushl  0x8(%ebp)
    178a:	e8 d7 2a 00 00       	call   4266 <mkdir>
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
    17ed:	68 49 ac 00 00       	push   $0xac49
    17f2:	6a 00                	push   $0x0
    17f4:	e8 e2 2b 00 00       	call   43db <printf>
    17f9:	83 c4 10             	add    $0x10,%esp
	list(".");
    17fc:	83 ec 0c             	sub    $0xc,%esp
    17ff:	68 e7 ab 00 00       	push   $0xabe7
    1804:	e8 42 ea ff ff       	call   24b <list>
    1809:	83 c4 10             	add    $0x10,%esp
	printItemList();
    180c:	e8 c2 f4 ff ff       	call   cd3 <printItemList>
	drawFinderContent(context);
    1811:	83 ec 04             	sub    $0x4,%esp
    1814:	ff 35 88 2e 01 00    	pushl  0x12e88
    181a:	ff 35 84 2e 01 00    	pushl  0x12e84
    1820:	ff 35 80 2e 01 00    	pushl  0x12e80
    1826:	e8 4f f1 ff ff       	call   97a <drawFinderContent>
    182b:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    182e:	83 ec 04             	sub    $0x4,%esp
    1831:	ff 35 88 2e 01 00    	pushl  0x12e88
    1837:	ff 35 84 2e 01 00    	pushl  0x12e84
    183d:	ff 35 80 2e 01 00    	pushl  0x12e80
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
    1860:	e8 d5 21 00 00       	call   3a3a <initRect>
    1865:	83 c4 1c             	add    $0x1c,%esp
    1868:	83 ec 0c             	sub    $0xc,%esp
    186b:	ff 75 f4             	pushl  -0xc(%ebp)
    186e:	ff 75 f0             	pushl  -0x10(%ebp)
    1871:	ff 75 ec             	pushl  -0x14(%ebp)
    1874:	ff 75 e8             	pushl  -0x18(%ebp)
    1877:	68 c0 2f 01 00       	push   $0x12fc0
    187c:	e8 7e 23 00 00       	call   3bff <deleteClickable>
    1881:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1884:	83 ec 0c             	sub    $0xc,%esp
    1887:	68 c0 2f 01 00       	push   $0x12fc0
    188c:	e8 3c f6 ff ff       	call   ecd <addWndEvent>
    1891:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1894:	83 ec 0c             	sub    $0xc,%esp
    1897:	68 c0 2f 01 00       	push   $0x12fc0
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
    18b2:	68 56 ac 00 00       	push   $0xac56
    18b7:	6a 00                	push   $0x0
    18b9:	e8 1d 2b 00 00       	call   43db <printf>
    18be:	83 c4 10             	add    $0x10,%esp
	if(unlink(name) < 0){
    18c1:	83 ec 0c             	sub    $0xc,%esp
    18c4:	ff 75 08             	pushl  0x8(%ebp)
    18c7:	e8 82 29 00 00       	call   424e <unlink>
    18cc:	83 c4 10             	add    $0x10,%esp
    18cf:	85 c0                	test   %eax,%eax
    18d1:	0f 89 b3 00 00 00    	jns    198a <deleteFile+0xe4>
		if (chdir(name) < 0){
    18d7:	83 ec 0c             	sub    $0xc,%esp
    18da:	ff 75 08             	pushl  0x8(%ebp)
    18dd:	e8 8c 29 00 00       	call   426e <chdir>
    18e2:	83 c4 10             	add    $0x10,%esp
    18e5:	85 c0                	test   %eax,%eax
    18e7:	79 1a                	jns    1903 <deleteFile+0x5d>
			printf(2, "rm: %s failed to delete\n", name);
    18e9:	83 ec 04             	sub    $0x4,%esp
    18ec:	ff 75 08             	pushl  0x8(%ebp)
    18ef:	68 74 ac 00 00       	push   $0xac74
    18f4:	6a 02                	push   $0x2
    18f6:	e8 e0 2a 00 00       	call   43db <printf>
    18fb:	83 c4 10             	add    $0x10,%esp
    18fe:	e9 87 00 00 00       	jmp    198a <deleteFile+0xe4>
		}
		else{
			freeFileItemList();
    1903:	e8 59 e8 ff ff       	call   161 <freeFileItemList>
			list(".");
    1908:	83 ec 0c             	sub    $0xc,%esp
    190b:	68 e7 ab 00 00       	push   $0xabe7
    1910:	e8 36 e9 ff ff       	call   24b <list>
    1915:	83 c4 10             	add    $0x10,%esp
			struct fileItem *p;
			p = fileItemList;
    1918:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
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
    193c:	68 e7 ab 00 00       	push   $0xabe7
    1941:	e8 05 e9 ff ff       	call   24b <list>
    1946:	83 c4 10             	add    $0x10,%esp
				p = fileItemList;
    1949:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
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
    195a:	68 8d ac 00 00       	push   $0xac8d
    195f:	e8 0a 29 00 00       	call   426e <chdir>
    1964:	83 c4 10             	add    $0x10,%esp
			freeFileItemList();
    1967:	e8 f5 e7 ff ff       	call   161 <freeFileItemList>
			list(".");
    196c:	83 ec 0c             	sub    $0xc,%esp
    196f:	68 e7 ab 00 00       	push   $0xabe7
    1974:	e8 d2 e8 ff ff       	call   24b <list>
    1979:	83 c4 10             	add    $0x10,%esp
			unlink(name);
    197c:	83 ec 0c             	sub    $0xc,%esp
    197f:	ff 75 08             	pushl  0x8(%ebp)
    1982:	e8 c7 28 00 00       	call   424e <unlink>
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
    1992:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
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
    19b0:	68 90 ac 00 00       	push   $0xac90
    19b5:	6a 00                	push   $0x0
    19b7:	e8 1f 2a 00 00       	call   43db <printf>
    19bc:	83 c4 10             	add    $0x10,%esp
	while (q != 0)
    19bf:	e9 90 00 00 00       	jmp    1a54 <h_deleteFile+0xc8>
	{
		printf(0, "hi2\n");
    19c4:	83 ec 08             	sub    $0x8,%esp
    19c7:	68 95 ac 00 00       	push   $0xac95
    19cc:	6a 00                	push   $0x0
    19ce:	e8 08 2a 00 00       	call   43db <printf>
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
    19e5:	e8 c2 2c 00 00       	call   46ac <malloc>
    19ea:	83 c4 10             	add    $0x10,%esp
    19ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    19f0:	83 ec 0c             	sub    $0xc,%esp
    19f3:	6a 20                	push   $0x20
    19f5:	e8 b2 2c 00 00       	call   46ac <malloc>
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
    1a16:	e8 b3 25 00 00       	call   3fce <strcpy>
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
    1a67:	68 9c ac 00 00       	push   $0xac9c
    1a6c:	6a 00                	push   $0x0
    1a6e:	e8 68 29 00 00       	call   43db <printf>
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
    1a9c:	68 04 ad 00 00       	push   $0xad04
    1aa1:	6a 00                	push   $0x0
    1aa3:	e8 33 29 00 00       	call   43db <printf>
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
    1ac3:	68 1a ad 00 00       	push   $0xad1a
    1ac8:	6a 00                	push   $0x0
    1aca:	e8 0c 29 00 00       	call   43db <printf>
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
    1ae5:	e8 81 2a 00 00       	call   456b <free>
    1aea:	83 c4 10             	add    $0x10,%esp
		free(p2);
    1aed:	83 ec 0c             	sub    $0xc,%esp
    1af0:	ff 75 e8             	pushl  -0x18(%ebp)
    1af3:	e8 73 2a 00 00       	call   456b <free>
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
    1b04:	68 26 ad 00 00       	push   $0xad26
    1b09:	6a 00                	push   $0x0
    1b0b:	e8 cb 28 00 00       	call   43db <printf>
    1b10:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1b13:	e8 49 e6 ff ff       	call   161 <freeFileItemList>
	list(".");
    1b18:	83 ec 0c             	sub    $0xc,%esp
    1b1b:	68 e7 ab 00 00       	push   $0xabe7
    1b20:	e8 26 e7 ff ff       	call   24b <list>
    1b25:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1b28:	e8 a6 f1 ff ff       	call   cd3 <printItemList>
	drawFinderContent(context);
    1b2d:	83 ec 04             	sub    $0x4,%esp
    1b30:	ff 35 88 2e 01 00    	pushl  0x12e88
    1b36:	ff 35 84 2e 01 00    	pushl  0x12e84
    1b3c:	ff 35 80 2e 01 00    	pushl  0x12e80
    1b42:	e8 33 ee ff ff       	call   97a <drawFinderContent>
    1b47:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1b4a:	83 ec 04             	sub    $0x4,%esp
    1b4d:	ff 35 88 2e 01 00    	pushl  0x12e88
    1b53:	ff 35 84 2e 01 00    	pushl  0x12e84
    1b59:	ff 35 80 2e 01 00    	pushl  0x12e80
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
    1b7c:	e8 b9 1e 00 00       	call   3a3a <initRect>
    1b81:	83 c4 1c             	add    $0x1c,%esp
    1b84:	83 ec 0c             	sub    $0xc,%esp
    1b87:	ff 75 e4             	pushl  -0x1c(%ebp)
    1b8a:	ff 75 e0             	pushl  -0x20(%ebp)
    1b8d:	ff 75 dc             	pushl  -0x24(%ebp)
    1b90:	ff 75 d8             	pushl  -0x28(%ebp)
    1b93:	68 c0 2f 01 00       	push   $0x12fc0
    1b98:	e8 62 20 00 00       	call   3bff <deleteClickable>
    1b9d:	83 c4 20             	add    $0x20,%esp
		addWndEvent(&cm);
    1ba0:	83 ec 0c             	sub    $0xc,%esp
    1ba3:	68 c0 2f 01 00       	push   $0x12fc0
    1ba8:	e8 20 f3 ff ff       	call   ecd <addWndEvent>
    1bad:	83 c4 10             	add    $0x10,%esp
		addListEvent(&cm);
    1bb0:	83 ec 0c             	sub    $0xc,%esp
    1bb3:	68 c0 2f 01 00       	push   $0x12fc0
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
    1bca:	a1 c8 f7 00 00       	mov    0xf7c8,%eax
    1bcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    1bd2:	e9 07 01 00 00       	jmp    1cde <copyFile+0x11c>
		if (p->chosen == 1){
    1bd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bda:	8b 40 28             	mov    0x28(%eax),%eax
    1bdd:	83 f8 01             	cmp    $0x1,%eax
    1be0:	0f 85 ef 00 00 00    	jne    1cd5 <copyFile+0x113>
			if(lenOfWaited >= MAX_COPY_SIZE){
    1be6:	a1 d4 2f 01 00       	mov    0x12fd4,%eax
    1beb:	83 f8 07             	cmp    $0x7,%eax
    1bee:	7e 1d                	jle    1c0d <copyFile+0x4b>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    1bf0:	a1 d4 2f 01 00       	mov    0x12fd4,%eax
    1bf5:	83 ec 04             	sub    $0x4,%esp
    1bf8:	50                   	push   %eax
    1bf9:	68 38 ad 00 00       	push   $0xad38
    1bfe:	6a 00                	push   $0x0
    1c00:	e8 d6 27 00 00       	call   43db <printf>
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
    1c19:	e8 20 26 00 00       	call   423e <open>
    1c1e:	83 c4 10             	add    $0x10,%esp
    1c21:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1c24:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1c28:	0f 88 8e 00 00 00    	js     1cbc <copyFile+0xfa>
					strcpy(filesWaited[lenOfWaited], currentPath);
    1c2e:	a1 d4 2f 01 00       	mov    0x12fd4,%eax
    1c33:	c1 e0 08             	shl    $0x8,%eax
    1c36:	05 80 26 01 00       	add    $0x12680,%eax
    1c3b:	83 ec 08             	sub    $0x8,%esp
    1c3e:	68 c0 2e 01 00       	push   $0x12ec0
    1c43:	50                   	push   %eax
    1c44:	e8 85 23 00 00       	call   3fce <strcpy>
    1c49:	83 c4 10             	add    $0x10,%esp
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    1c4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c4f:	8b 58 14             	mov    0x14(%eax),%ebx
    1c52:	a1 d4 2f 01 00       	mov    0x12fd4,%eax
    1c57:	c1 e0 08             	shl    $0x8,%eax
    1c5a:	8d b0 80 26 01 00    	lea    0x12680(%eax),%esi
    1c60:	83 ec 0c             	sub    $0xc,%esp
    1c63:	68 c0 2e 01 00       	push   $0x12ec0
    1c68:	e8 d0 23 00 00       	call   403d <strlen>
    1c6d:	83 c4 10             	add    $0x10,%esp
    1c70:	01 f0                	add    %esi,%eax
    1c72:	83 ec 08             	sub    $0x8,%esp
    1c75:	53                   	push   %ebx
    1c76:	50                   	push   %eax
    1c77:	e8 52 23 00 00       	call   3fce <strcpy>
    1c7c:	83 c4 10             	add    $0x10,%esp
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    1c7f:	a1 d4 2f 01 00       	mov    0x12fd4,%eax
    1c84:	c1 e0 08             	shl    $0x8,%eax
    1c87:	05 80 26 01 00       	add    $0x12680,%eax
    1c8c:	83 ec 04             	sub    $0x4,%esp
    1c8f:	50                   	push   %eax
    1c90:	68 53 ad 00 00       	push   $0xad53
    1c95:	6a 00                	push   $0x0
    1c97:	e8 3f 27 00 00       	call   43db <printf>
    1c9c:	83 c4 10             	add    $0x10,%esp
					lenOfWaited++;
    1c9f:	a1 d4 2f 01 00       	mov    0x12fd4,%eax
    1ca4:	83 c0 01             	add    $0x1,%eax
    1ca7:	a3 d4 2f 01 00       	mov    %eax,0x12fd4
					close(fd);
    1cac:	83 ec 0c             	sub    $0xc,%esp
    1caf:	ff 75 f0             	pushl  -0x10(%ebp)
    1cb2:	e8 6f 25 00 00       	call   4226 <close>
    1cb7:	83 c4 10             	add    $0x10,%esp
    1cba:	eb 19                	jmp    1cd5 <copyFile+0x113>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    1cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cbf:	8b 40 14             	mov    0x14(%eax),%eax
    1cc2:	83 ec 04             	sub    $0x4,%esp
    1cc5:	50                   	push   %eax
    1cc6:	68 69 ad 00 00       	push   $0xad69
    1ccb:	6a 00                	push   $0x0
    1ccd:	e8 09 27 00 00       	call   43db <printf>
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
    1cf5:	c7 05 c4 f7 00 00 00 	movl   $0x0,0xf7c4
    1cfc:	00 00 00 
	lenOfWaited = 0;
    1cff:	c7 05 d4 2f 01 00 00 	movl   $0x0,0x12fd4
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
    1d25:	05 80 26 01 00       	add    $0x12680,%eax
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
    1d3a:	a1 d4 2f 01 00       	mov    0x12fd4,%eax
    1d3f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1d42:	7c db                	jl     1d1f <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    1d44:	c7 05 d4 2f 01 00 00 	movl   $0x0,0x12fd4
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
    1d56:	c7 05 c4 f7 00 00 01 	movl   $0x1,0xf7c4
    1d5d:	00 00 00 
	lenOfWaited = 0;
    1d60:	c7 05 d4 2f 01 00 00 	movl   $0x0,0x12fd4
    1d67:	00 00 00 
	copyFile();
    1d6a:	e8 53 fe ff ff       	call   1bc2 <copyFile>
}
    1d6f:	c9                   	leave  
    1d70:	c3                   	ret    

00001d71 <pasteJustFile>:

void pasteJustFile(char *src, char *filename){
    1d71:	55                   	push   %ebp
    1d72:	89 e5                	mov    %esp,%ebp
    1d74:	83 ec 18             	sub    $0x18,%esp
	int size = 0;
    1d77:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	int file_src, file_dest;
	char* buff = (char*)malloc(4096 * sizeof(char));
    1d7e:	83 ec 0c             	sub    $0xc,%esp
    1d81:	68 00 10 00 00       	push   $0x1000
    1d86:	e8 21 29 00 00       	call   46ac <malloc>
    1d8b:	83 c4 10             	add    $0x10,%esp
    1d8e:	89 45 ec             	mov    %eax,-0x14(%ebp)
	memset(buff, 0, 4096);
    1d91:	83 ec 04             	sub    $0x4,%esp
    1d94:	68 00 10 00 00       	push   $0x1000
    1d99:	6a 00                	push   $0x0
    1d9b:	ff 75 ec             	pushl  -0x14(%ebp)
    1d9e:	e8 c1 22 00 00       	call   4064 <memset>
    1da3:	83 c4 10             	add    $0x10,%esp
	file_src = open(src, O_RDONLY);
    1da6:	83 ec 08             	sub    $0x8,%esp
    1da9:	6a 00                	push   $0x0
    1dab:	ff 75 08             	pushl  0x8(%ebp)
    1dae:	e8 8b 24 00 00       	call   423e <open>
    1db3:	83 c4 10             	add    $0x10,%esp
    1db6:	89 45 e8             	mov    %eax,-0x18(%ebp)
	if((file_dest = open(filename, O_RDONLY)) >= 0){
    1db9:	83 ec 08             	sub    $0x8,%esp
    1dbc:	6a 00                	push   $0x0
    1dbe:	ff 75 0c             	pushl  0xc(%ebp)
    1dc1:	e8 78 24 00 00       	call   423e <open>
    1dc6:	83 c4 10             	add    $0x10,%esp
    1dc9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1dcc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1dd0:	78 17                	js     1de9 <pasteJustFile+0x78>
		printf(0, "File %s already exist\n", filename);
    1dd2:	83 ec 04             	sub    $0x4,%esp
    1dd5:	ff 75 0c             	pushl  0xc(%ebp)
    1dd8:	68 7e ad 00 00       	push   $0xad7e
    1ddd:	6a 00                	push   $0x0
    1ddf:	e8 f7 25 00 00       	call   43db <printf>
    1de4:	83 c4 10             	add    $0x10,%esp
    1de7:	eb 68                	jmp    1e51 <pasteJustFile+0xe0>
	}
	else{
		file_dest = open(filename, O_CREATE);
    1de9:	83 ec 08             	sub    $0x8,%esp
    1dec:	68 00 02 00 00       	push   $0x200
    1df1:	ff 75 0c             	pushl  0xc(%ebp)
    1df4:	e8 45 24 00 00       	call   423e <open>
    1df9:	83 c4 10             	add    $0x10,%esp
    1dfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while((size = read(file_src, buff, 4096)) > 0)
    1dff:	eb 14                	jmp    1e15 <pasteJustFile+0xa4>
            write(file_dest, buff, size);
    1e01:	83 ec 04             	sub    $0x4,%esp
    1e04:	ff 75 f0             	pushl  -0x10(%ebp)
    1e07:	ff 75 ec             	pushl  -0x14(%ebp)
    1e0a:	ff 75 f4             	pushl  -0xc(%ebp)
    1e0d:	e8 0c 24 00 00       	call   421e <write>
    1e12:	83 c4 10             	add    $0x10,%esp
	if((file_dest = open(filename, O_RDONLY)) >= 0){
		printf(0, "File %s already exist\n", filename);
	}
	else{
		file_dest = open(filename, O_CREATE);
		while((size = read(file_src, buff, 4096)) > 0)
    1e15:	83 ec 04             	sub    $0x4,%esp
    1e18:	68 00 10 00 00       	push   $0x1000
    1e1d:	ff 75 ec             	pushl  -0x14(%ebp)
    1e20:	ff 75 e8             	pushl  -0x18(%ebp)
    1e23:	e8 ee 23 00 00       	call   4216 <read>
    1e28:	83 c4 10             	add    $0x10,%esp
    1e2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1e2e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e32:	7f cd                	jg     1e01 <pasteJustFile+0x90>
            write(file_dest, buff, size);
	    if(size < 0)
    1e34:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e38:	79 17                	jns    1e51 <pasteJustFile+0xe0>
	    {
	    	//printf(2, "copy file error!!!\r\n");
	        printf(0, "File %s error\n", filename);
    1e3a:	83 ec 04             	sub    $0x4,%esp
    1e3d:	ff 75 0c             	pushl  0xc(%ebp)
    1e40:	68 95 ad 00 00       	push   $0xad95
    1e45:	6a 00                	push   $0x0
    1e47:	e8 8f 25 00 00       	call   43db <printf>
    1e4c:	83 c4 10             	add    $0x10,%esp
	        return;
    1e4f:	eb 2a                	jmp    1e7b <pasteJustFile+0x10a>
	    }
	}
	close(file_dest);
    1e51:	83 ec 0c             	sub    $0xc,%esp
    1e54:	ff 75 f4             	pushl  -0xc(%ebp)
    1e57:	e8 ca 23 00 00       	call   4226 <close>
    1e5c:	83 c4 10             	add    $0x10,%esp
	close(file_src);
    1e5f:	83 ec 0c             	sub    $0xc,%esp
    1e62:	ff 75 e8             	pushl  -0x18(%ebp)
    1e65:	e8 bc 23 00 00       	call   4226 <close>
    1e6a:	83 c4 10             	add    $0x10,%esp
	free(buff);
    1e6d:	83 ec 0c             	sub    $0xc,%esp
    1e70:	ff 75 ec             	pushl  -0x14(%ebp)
    1e73:	e8 f3 26 00 00       	call   456b <free>
    1e78:	83 c4 10             	add    $0x10,%esp
}
    1e7b:	c9                   	leave  
    1e7c:	c3                   	ret    

00001e7d <pasteFile>:

void pasteFile(){
    1e7d:	55                   	push   %ebp
    1e7e:	89 e5                	mov    %esp,%ebp
    1e80:	83 ec 18             	sub    $0x18,%esp
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
    1e83:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1e8a:	e9 ab 00 00 00       	jmp    1f3a <pasteFile+0xbd>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    1e8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e92:	c1 e0 08             	shl    $0x8,%eax
    1e95:	05 80 26 01 00       	add    $0x12680,%eax
    1e9a:	50                   	push   %eax
    1e9b:	ff 75 f4             	pushl  -0xc(%ebp)
    1e9e:	68 a4 ad 00 00       	push   $0xada4
    1ea3:	6a 00                	push   $0x0
    1ea5:	e8 31 25 00 00       	call   43db <printf>
    1eaa:	83 c4 10             	add    $0x10,%esp
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    1ead:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1eb0:	c1 e0 08             	shl    $0x8,%eax
    1eb3:	05 80 26 01 00       	add    $0x12680,%eax
    1eb8:	83 ec 0c             	sub    $0xc,%esp
    1ebb:	50                   	push   %eax
    1ebc:	e8 7c 21 00 00       	call   403d <strlen>
    1ec1:	83 c4 10             	add    $0x10,%esp
    1ec4:	83 e8 01             	sub    $0x1,%eax
    1ec7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1eca:	eb 35                	jmp    1f01 <pasteFile+0x84>
        	if (*(filesWaited[i]+j) == '/'){
    1ecc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ecf:	c1 e0 08             	shl    $0x8,%eax
    1ed2:	8d 90 80 26 01 00    	lea    0x12680(%eax),%edx
    1ed8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1edb:	01 d0                	add    %edx,%eax
    1edd:	0f b6 00             	movzbl (%eax),%eax
    1ee0:	3c 2f                	cmp    $0x2f,%al
    1ee2:	75 19                	jne    1efd <pasteFile+0x80>
        		filename = filesWaited[i] + j + 1;
    1ee4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ee7:	c1 e0 08             	shl    $0x8,%eax
    1eea:	8d 90 80 26 01 00    	lea    0x12680(%eax),%edx
    1ef0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ef3:	83 c0 01             	add    $0x1,%eax
    1ef6:	01 d0                	add    %edx,%eax
    1ef8:	89 45 ec             	mov    %eax,-0x14(%ebp)
        		break;
    1efb:	eb 0a                	jmp    1f07 <pasteFile+0x8a>
void pasteFile(){
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    1efd:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    1f01:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1f05:	79 c5                	jns    1ecc <pasteFile+0x4f>
        	if (*(filesWaited[i]+j) == '/'){
        		filename = filesWaited[i] + j + 1;
        		break;
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
    1f07:	ff 75 ec             	pushl  -0x14(%ebp)
    1f0a:	ff 75 f4             	pushl  -0xc(%ebp)
    1f0d:	68 c1 ad 00 00       	push   $0xadc1
    1f12:	6a 00                	push   $0x0
    1f14:	e8 c2 24 00 00       	call   43db <printf>
    1f19:	83 c4 10             	add    $0x10,%esp
        pasteJustFile(filesWaited[i], filename);
    1f1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f1f:	c1 e0 08             	shl    $0x8,%eax
    1f22:	05 80 26 01 00       	add    $0x12680,%eax
    1f27:	83 ec 08             	sub    $0x8,%esp
    1f2a:	ff 75 ec             	pushl  -0x14(%ebp)
    1f2d:	50                   	push   %eax
    1f2e:	e8 3e fe ff ff       	call   1d71 <pasteJustFile>
    1f33:	83 c4 10             	add    $0x10,%esp
}

void pasteFile(){
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
    1f36:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1f3a:	a1 d4 2f 01 00       	mov    0x12fd4,%eax
    1f3f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1f42:	0f 8c 47 ff ff ff    	jl     1e8f <pasteFile+0x12>
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
        pasteJustFile(filesWaited[i], filename);
	}
}
    1f48:	c9                   	leave  
    1f49:	c3                   	ret    

00001f4a <h_pasteFile>:

void h_pasteFile(Point p){
    1f4a:	55                   	push   %ebp
    1f4b:	89 e5                	mov    %esp,%ebp
    1f4d:	83 ec 18             	sub    $0x18,%esp
	pasteFile();
    1f50:	e8 28 ff ff ff       	call   1e7d <pasteFile>
	if(copyOrCut == 1)
    1f55:	a1 c4 f7 00 00       	mov    0xf7c4,%eax
    1f5a:	83 f8 01             	cmp    $0x1,%eax
    1f5d:	75 05                	jne    1f64 <h_pasteFile+0x1a>
		moveFile();
    1f5f:	e8 ac fd ff ff       	call   1d10 <moveFile>
    freeFileItemList();
    1f64:	e8 f8 e1 ff ff       	call   161 <freeFileItemList>
	list(".");
    1f69:	83 ec 0c             	sub    $0xc,%esp
    1f6c:	68 e7 ab 00 00       	push   $0xabe7
    1f71:	e8 d5 e2 ff ff       	call   24b <list>
    1f76:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1f79:	83 ec 04             	sub    $0x4,%esp
    1f7c:	ff 35 88 2e 01 00    	pushl  0x12e88
    1f82:	ff 35 84 2e 01 00    	pushl  0x12e84
    1f88:	ff 35 80 2e 01 00    	pushl  0x12e80
    1f8e:	e8 e7 e9 ff ff       	call   97a <drawFinderContent>
    1f93:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1f96:	83 ec 04             	sub    $0x4,%esp
    1f99:	ff 35 88 2e 01 00    	pushl  0x12e88
    1f9f:	ff 35 84 2e 01 00    	pushl  0x12e84
    1fa5:	ff 35 80 2e 01 00    	pushl  0x12e80
    1fab:	e8 ac e8 ff ff       	call   85c <drawFinderWnd>
    1fb0:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1fb3:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1fb6:	83 ec 0c             	sub    $0xc,%esp
    1fb9:	68 58 02 00 00       	push   $0x258
    1fbe:	68 20 03 00 00       	push   $0x320
    1fc3:	6a 00                	push   $0x0
    1fc5:	6a 00                	push   $0x0
    1fc7:	50                   	push   %eax
    1fc8:	e8 6d 1a 00 00       	call   3a3a <initRect>
    1fcd:	83 c4 1c             	add    $0x1c,%esp
    1fd0:	83 ec 0c             	sub    $0xc,%esp
    1fd3:	ff 75 f4             	pushl  -0xc(%ebp)
    1fd6:	ff 75 f0             	pushl  -0x10(%ebp)
    1fd9:	ff 75 ec             	pushl  -0x14(%ebp)
    1fdc:	ff 75 e8             	pushl  -0x18(%ebp)
    1fdf:	68 c0 2f 01 00       	push   $0x12fc0
    1fe4:	e8 16 1c 00 00       	call   3bff <deleteClickable>
    1fe9:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1fec:	83 ec 0c             	sub    $0xc,%esp
    1fef:	68 c0 2f 01 00       	push   $0x12fc0
    1ff4:	e8 d4 ee ff ff       	call   ecd <addWndEvent>
    1ff9:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1ffc:	83 ec 0c             	sub    $0xc,%esp
    1fff:	68 c0 2f 01 00       	push   $0x12fc0
    2004:	e8 69 ee ff ff       	call   e72 <addListEvent>
    2009:	83 c4 10             	add    $0x10,%esp
}
    200c:	c9                   	leave  
    200d:	c3                   	ret    

0000200e <h_chooseFile>:

void h_chooseFile(Point p) {
    200e:	55                   	push   %ebp
    200f:	89 e5                	mov    %esp,%ebp
    2011:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *temp = getFileItem(p);
    2014:	83 ec 08             	sub    $0x8,%esp
    2017:	ff 75 0c             	pushl  0xc(%ebp)
    201a:	ff 75 08             	pushl  0x8(%ebp)
    201d:	e8 5c ef ff ff       	call   f7e <getFileItem>
    2022:	83 c4 10             	add    $0x10,%esp
    2025:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    2028:	8b 45 f4             	mov    -0xc(%ebp),%eax
    202b:	8b 40 28             	mov    0x28(%eax),%eax
    202e:	85 c0                	test   %eax,%eax
    2030:	74 1e                	je     2050 <h_chooseFile+0x42>
	{
		printf(0, "chooseFile!\n");
    2032:	83 ec 08             	sub    $0x8,%esp
    2035:	68 d9 ad 00 00       	push   $0xadd9
    203a:	6a 00                	push   $0x0
    203c:	e8 9a 23 00 00       	call   43db <printf>
    2041:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 0;
    2044:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2047:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    204e:	eb 1c                	jmp    206c <h_chooseFile+0x5e>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    2050:	83 ec 08             	sub    $0x8,%esp
    2053:	68 e6 ad 00 00       	push   $0xade6
    2058:	6a 00                	push   $0x0
    205a:	e8 7c 23 00 00       	call   43db <printf>
    205f:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 1;
    2062:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2065:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    206c:	83 ec 04             	sub    $0x4,%esp
    206f:	ff 35 88 2e 01 00    	pushl  0x12e88
    2075:	ff 35 84 2e 01 00    	pushl  0x12e84
    207b:	ff 35 80 2e 01 00    	pushl  0x12e80
    2081:	e8 f4 e8 ff ff       	call   97a <drawFinderContent>
    2086:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2089:	83 ec 04             	sub    $0x4,%esp
    208c:	ff 35 88 2e 01 00    	pushl  0x12e88
    2092:	ff 35 84 2e 01 00    	pushl  0x12e84
    2098:	ff 35 80 2e 01 00    	pushl  0x12e80
    209e:	e8 b9 e7 ff ff       	call   85c <drawFinderWnd>
    20a3:	83 c4 10             	add    $0x10,%esp
}
    20a6:	c9                   	leave  
    20a7:	c3                   	ret    

000020a8 <h_closeWnd>:

void h_closeWnd(Point p) {
    20a8:	55                   	push   %ebp
    20a9:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    20ab:	c7 05 c0 ed 00 00 00 	movl   $0x0,0xedc0
    20b2:	00 00 00 
}
    20b5:	5d                   	pop    %ebp
    20b6:	c3                   	ret    

000020b7 <h_chvm1>:

void h_chvm1(Point p) {
    20b7:	55                   	push   %ebp
    20b8:	89 e5                	mov    %esp,%ebp
    20ba:	83 ec 18             	sub    $0x18,%esp
	style = ICON_STYLE;
    20bd:	c7 05 c4 ed 00 00 01 	movl   $0x1,0xedc4
    20c4:	00 00 00 
	freeFileItemList();
    20c7:	e8 95 e0 ff ff       	call   161 <freeFileItemList>
		list(".");
    20cc:	83 ec 0c             	sub    $0xc,%esp
    20cf:	68 e7 ab 00 00       	push   $0xabe7
    20d4:	e8 72 e1 ff ff       	call   24b <list>
    20d9:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    20dc:	83 ec 04             	sub    $0x4,%esp
    20df:	ff 35 88 2e 01 00    	pushl  0x12e88
    20e5:	ff 35 84 2e 01 00    	pushl  0x12e84
    20eb:	ff 35 80 2e 01 00    	pushl  0x12e80
    20f1:	e8 84 e8 ff ff       	call   97a <drawFinderContent>
    20f6:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    20f9:	83 ec 04             	sub    $0x4,%esp
    20fc:	ff 35 88 2e 01 00    	pushl  0x12e88
    2102:	ff 35 84 2e 01 00    	pushl  0x12e84
    2108:	ff 35 80 2e 01 00    	pushl  0x12e80
    210e:	e8 49 e7 ff ff       	call   85c <drawFinderWnd>
    2113:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2116:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2119:	83 ec 0c             	sub    $0xc,%esp
    211c:	68 58 02 00 00       	push   $0x258
    2121:	68 20 03 00 00       	push   $0x320
    2126:	6a 00                	push   $0x0
    2128:	6a 00                	push   $0x0
    212a:	50                   	push   %eax
    212b:	e8 0a 19 00 00       	call   3a3a <initRect>
    2130:	83 c4 1c             	add    $0x1c,%esp
    2133:	83 ec 0c             	sub    $0xc,%esp
    2136:	ff 75 f4             	pushl  -0xc(%ebp)
    2139:	ff 75 f0             	pushl  -0x10(%ebp)
    213c:	ff 75 ec             	pushl  -0x14(%ebp)
    213f:	ff 75 e8             	pushl  -0x18(%ebp)
    2142:	68 c0 2f 01 00       	push   $0x12fc0
    2147:	e8 b3 1a 00 00       	call   3bff <deleteClickable>
    214c:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    214f:	83 ec 0c             	sub    $0xc,%esp
    2152:	68 c0 2f 01 00       	push   $0x12fc0
    2157:	e8 71 ed ff ff       	call   ecd <addWndEvent>
    215c:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    215f:	83 ec 0c             	sub    $0xc,%esp
    2162:	68 c0 2f 01 00       	push   $0x12fc0
    2167:	e8 06 ed ff ff       	call   e72 <addListEvent>
    216c:	83 c4 10             	add    $0x10,%esp
}
    216f:	c9                   	leave  
    2170:	c3                   	ret    

00002171 <h_chvm2>:

void h_chvm2(Point p) {
    2171:	55                   	push   %ebp
    2172:	89 e5                	mov    %esp,%ebp
    2174:	83 ec 18             	sub    $0x18,%esp
	style = LIST_STYLE;
    2177:	c7 05 c4 ed 00 00 02 	movl   $0x2,0xedc4
    217e:	00 00 00 
	freeFileItemList();
    2181:	e8 db df ff ff       	call   161 <freeFileItemList>
		list(".");
    2186:	83 ec 0c             	sub    $0xc,%esp
    2189:	68 e7 ab 00 00       	push   $0xabe7
    218e:	e8 b8 e0 ff ff       	call   24b <list>
    2193:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    2196:	83 ec 04             	sub    $0x4,%esp
    2199:	ff 35 88 2e 01 00    	pushl  0x12e88
    219f:	ff 35 84 2e 01 00    	pushl  0x12e84
    21a5:	ff 35 80 2e 01 00    	pushl  0x12e80
    21ab:	e8 ca e7 ff ff       	call   97a <drawFinderContent>
    21b0:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    21b3:	83 ec 04             	sub    $0x4,%esp
    21b6:	ff 35 88 2e 01 00    	pushl  0x12e88
    21bc:	ff 35 84 2e 01 00    	pushl  0x12e84
    21c2:	ff 35 80 2e 01 00    	pushl  0x12e80
    21c8:	e8 8f e6 ff ff       	call   85c <drawFinderWnd>
    21cd:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    21d0:	8d 45 e8             	lea    -0x18(%ebp),%eax
    21d3:	83 ec 0c             	sub    $0xc,%esp
    21d6:	68 58 02 00 00       	push   $0x258
    21db:	68 20 03 00 00       	push   $0x320
    21e0:	6a 00                	push   $0x0
    21e2:	6a 00                	push   $0x0
    21e4:	50                   	push   %eax
    21e5:	e8 50 18 00 00       	call   3a3a <initRect>
    21ea:	83 c4 1c             	add    $0x1c,%esp
    21ed:	83 ec 0c             	sub    $0xc,%esp
    21f0:	ff 75 f4             	pushl  -0xc(%ebp)
    21f3:	ff 75 f0             	pushl  -0x10(%ebp)
    21f6:	ff 75 ec             	pushl  -0x14(%ebp)
    21f9:	ff 75 e8             	pushl  -0x18(%ebp)
    21fc:	68 c0 2f 01 00       	push   $0x12fc0
    2201:	e8 f9 19 00 00       	call   3bff <deleteClickable>
    2206:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    2209:	83 ec 0c             	sub    $0xc,%esp
    220c:	68 c0 2f 01 00       	push   $0x12fc0
    2211:	e8 b7 ec ff ff       	call   ecd <addWndEvent>
    2216:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    2219:	83 ec 0c             	sub    $0xc,%esp
    221c:	68 c0 2f 01 00       	push   $0x12fc0
    2221:	e8 4c ec ff ff       	call   e72 <addListEvent>
    2226:	83 c4 10             	add    $0x10,%esp
}
    2229:	c9                   	leave  
    222a:	c3                   	ret    

0000222b <h_goUp>:

void h_goUp(Point p) {
    222b:	55                   	push   %ebp
    222c:	89 e5                	mov    %esp,%ebp
    222e:	83 ec 18             	sub    $0x18,%esp
	enterDir("..");
    2231:	83 ec 0c             	sub    $0xc,%esp
    2234:	68 8d ac 00 00       	push   $0xac8d
    2239:	e8 8f f1 ff ff       	call   13cd <enterDir>
    223e:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2241:	e8 1b df ff ff       	call   161 <freeFileItemList>
	list(".");
    2246:	83 ec 0c             	sub    $0xc,%esp
    2249:	68 e7 ab 00 00       	push   $0xabe7
    224e:	e8 f8 df ff ff       	call   24b <list>
    2253:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    2256:	83 ec 04             	sub    $0x4,%esp
    2259:	ff 35 88 2e 01 00    	pushl  0x12e88
    225f:	ff 35 84 2e 01 00    	pushl  0x12e84
    2265:	ff 35 80 2e 01 00    	pushl  0x12e80
    226b:	e8 0a e7 ff ff       	call   97a <drawFinderContent>
    2270:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2273:	83 ec 04             	sub    $0x4,%esp
    2276:	ff 35 88 2e 01 00    	pushl  0x12e88
    227c:	ff 35 84 2e 01 00    	pushl  0x12e84
    2282:	ff 35 80 2e 01 00    	pushl  0x12e80
    2288:	e8 cf e5 ff ff       	call   85c <drawFinderWnd>
    228d:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2290:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2293:	83 ec 0c             	sub    $0xc,%esp
    2296:	68 58 02 00 00       	push   $0x258
    229b:	68 20 03 00 00       	push   $0x320
    22a0:	6a 00                	push   $0x0
    22a2:	6a 00                	push   $0x0
    22a4:	50                   	push   %eax
    22a5:	e8 90 17 00 00       	call   3a3a <initRect>
    22aa:	83 c4 1c             	add    $0x1c,%esp
    22ad:	83 ec 0c             	sub    $0xc,%esp
    22b0:	ff 75 f4             	pushl  -0xc(%ebp)
    22b3:	ff 75 f0             	pushl  -0x10(%ebp)
    22b6:	ff 75 ec             	pushl  -0x14(%ebp)
    22b9:	ff 75 e8             	pushl  -0x18(%ebp)
    22bc:	68 c0 2f 01 00       	push   $0x12fc0
    22c1:	e8 39 19 00 00       	call   3bff <deleteClickable>
    22c6:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    22c9:	83 ec 0c             	sub    $0xc,%esp
    22cc:	68 c0 2f 01 00       	push   $0x12fc0
    22d1:	e8 f7 eb ff ff       	call   ecd <addWndEvent>
    22d6:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    22d9:	83 ec 0c             	sub    $0xc,%esp
    22dc:	68 c0 2f 01 00       	push   $0x12fc0
    22e1:	e8 8c eb ff ff       	call   e72 <addListEvent>
    22e6:	83 c4 10             	add    $0x10,%esp
}
    22e9:	c9                   	leave  
    22ea:	c3                   	ret    

000022eb <h_empty>:

void h_empty(Point p) {
    22eb:	55                   	push   %ebp
    22ec:	89 e5                	mov    %esp,%ebp

}
    22ee:	5d                   	pop    %ebp
    22ef:	c3                   	ret    

000022f0 <main>:

int main(int argc, char *argv[]) {
    22f0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    22f4:	83 e4 f0             	and    $0xfffffff0,%esp
    22f7:	ff 71 fc             	pushl  -0x4(%ecx)
    22fa:	55                   	push   %ebp
    22fb:	89 e5                	mov    %esp,%ebp
    22fd:	56                   	push   %esi
    22fe:	53                   	push   %ebx
    22ff:	51                   	push   %ecx
    2300:	83 ec 7c             	sub    $0x7c,%esp
	struct Msg msg;
	char key;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    2303:	83 ec 04             	sub    $0x4,%esp
    2306:	68 c2 01 00 00       	push   $0x1c2
    230b:	68 58 02 00 00       	push   $0x258
    2310:	68 80 2e 01 00       	push   $0x12e80
    2315:	e8 f1 04 00 00       	call   280b <init_context>
    231a:	83 c4 10             	add    $0x10,%esp
    231d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    2320:	8d 45 88             	lea    -0x78(%ebp),%eax
    2323:	ff 35 88 2e 01 00    	pushl  0x12e88
    2329:	ff 35 84 2e 01 00    	pushl  0x12e84
    232f:	ff 35 80 2e 01 00    	pushl  0x12e80
    2335:	50                   	push   %eax
    2336:	e8 93 17 00 00       	call   3ace <initClickManager>
    233b:	83 c4 0c             	add    $0xc,%esp
    233e:	8b 45 88             	mov    -0x78(%ebp),%eax
    2341:	a3 c0 2f 01 00       	mov    %eax,0x12fc0
    2346:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2349:	a3 c4 2f 01 00       	mov    %eax,0x12fc4
    234e:	8b 45 90             	mov    -0x70(%ebp),%eax
    2351:	a3 c8 2f 01 00       	mov    %eax,0x12fc8
    2356:	8b 45 94             	mov    -0x6c(%ebp),%eax
    2359:	a3 cc 2f 01 00       	mov    %eax,0x12fcc
    235e:	8b 45 98             	mov    -0x68(%ebp),%eax
    2361:	a3 d0 2f 01 00       	mov    %eax,0x12fd0
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    2366:	83 ec 08             	sub    $0x8,%esp
    2369:	6a 0e                	push   $0xe
    236b:	68 00 ef 00 00       	push   $0xef00
    2370:	e8 c0 0e 00 00       	call   3235 <load_iconlist>
    2375:	83 c4 10             	add    $0x10,%esp
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    2378:	83 ec 08             	sub    $0x8,%esp
    237b:	6a 04                	push   $0x4
    237d:	68 00 ee 00 00       	push   $0xee00
    2382:	e8 ae 0e 00 00       	call   3235 <load_iconlist>
    2387:	83 c4 10             	add    $0x10,%esp
	//testHandlers();
	strcpy(currentPath, "/");
    238a:	83 ec 08             	sub    $0x8,%esp
    238d:	68 f5 ad 00 00       	push   $0xadf5
    2392:	68 c0 2e 01 00       	push   $0x12ec0
    2397:	e8 32 1c 00 00       	call   3fce <strcpy>
    239c:	83 c4 10             	add    $0x10,%esp
	mkdir("userfolder");
    239f:	83 ec 0c             	sub    $0xc,%esp
    23a2:	68 f7 ad 00 00       	push   $0xadf7
    23a7:	e8 ba 1e 00 00       	call   4266 <mkdir>
    23ac:	83 c4 10             	add    $0x10,%esp
	enterDir("userfolder");
    23af:	83 ec 0c             	sub    $0xc,%esp
    23b2:	68 f7 ad 00 00       	push   $0xadf7
    23b7:	e8 11 f0 ff ff       	call   13cd <enterDir>
    23bc:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    23bf:	e8 9d dd ff ff       	call   161 <freeFileItemList>
	list(".");
    23c4:	83 ec 0c             	sub    $0xc,%esp
    23c7:	68 e7 ab 00 00       	push   $0xabe7
    23cc:	e8 7a de ff ff       	call   24b <list>
    23d1:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    23d4:	8d 45 d0             	lea    -0x30(%ebp),%eax
    23d7:	83 ec 0c             	sub    $0xc,%esp
    23da:	68 58 02 00 00       	push   $0x258
    23df:	68 20 03 00 00       	push   $0x320
    23e4:	6a 00                	push   $0x0
    23e6:	6a 00                	push   $0x0
    23e8:	50                   	push   %eax
    23e9:	e8 4c 16 00 00       	call   3a3a <initRect>
    23ee:	83 c4 1c             	add    $0x1c,%esp
    23f1:	83 ec 0c             	sub    $0xc,%esp
    23f4:	ff 75 dc             	pushl  -0x24(%ebp)
    23f7:	ff 75 d8             	pushl  -0x28(%ebp)
    23fa:	ff 75 d4             	pushl  -0x2c(%ebp)
    23fd:	ff 75 d0             	pushl  -0x30(%ebp)
    2400:	68 c0 2f 01 00       	push   $0x12fc0
    2405:	e8 f5 17 00 00       	call   3bff <deleteClickable>
    240a:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    240d:	83 ec 0c             	sub    $0xc,%esp
    2410:	68 c0 2f 01 00       	push   $0x12fc0
    2415:	e8 b3 ea ff ff       	call   ecd <addWndEvent>
    241a:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    241d:	83 ec 0c             	sub    $0xc,%esp
    2420:	68 c0 2f 01 00       	push   $0x12fc0
    2425:	e8 48 ea ff ff       	call   e72 <addListEvent>
    242a:	83 c4 10             	add    $0x10,%esp
	lenOfWaited = 0;
    242d:	c7 05 d4 2f 01 00 00 	movl   $0x0,0x12fd4
    2434:	00 00 00 
	while (isRun) {
    2437:	e9 91 02 00 00       	jmp    26cd <main+0x3dd>
		getMsg(&msg);
    243c:	83 ec 0c             	sub    $0xc,%esp
    243f:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2442:	50                   	push   %eax
    2443:	e8 56 1e 00 00       	call   429e <getMsg>
    2448:	83 c4 10             	add    $0x10,%esp
		switch (msg.msg_type) {
    244b:	8b 45 b8             	mov    -0x48(%ebp),%eax
    244e:	83 f8 08             	cmp    $0x8,%eax
    2451:	0f 87 75 02 00 00    	ja     26cc <main+0x3dc>
    2457:	8b 04 85 04 ae 00 00 	mov    0xae04(,%eax,4),%eax
    245e:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2460:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2463:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2466:	8d 45 b0             	lea    -0x50(%ebp),%eax
    2469:	83 ec 04             	sub    $0x4,%esp
    246c:	51                   	push   %ecx
    246d:	52                   	push   %edx
    246e:	50                   	push   %eax
    246f:	e8 9f 15 00 00       	call   3a13 <initPoint>
    2474:	83 c4 0c             	add    $0xc,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    2477:	a1 c4 2f 01 00       	mov    0x12fc4,%eax
    247c:	83 ec 04             	sub    $0x4,%esp
    247f:	ff 75 b4             	pushl  -0x4c(%ebp)
    2482:	ff 75 b0             	pushl  -0x50(%ebp)
    2485:	50                   	push   %eax
    2486:	e8 46 18 00 00       	call   3cd1 <executeHandler>
    248b:	83 c4 10             	add    $0x10,%esp
    248e:	85 c0                	test   %eax,%eax
    2490:	74 14                	je     24a6 <main+0x1b6>
				updateWindow(winid, context.addr);
    2492:	a1 80 2e 01 00       	mov    0x12e80,%eax
    2497:	83 ec 08             	sub    $0x8,%esp
    249a:	50                   	push   %eax
    249b:	ff 75 e4             	pushl  -0x1c(%ebp)
    249e:	e8 13 1e 00 00       	call   42b6 <updateWindow>
    24a3:	83 c4 10             	add    $0x10,%esp
			}
			break;
    24a6:	e9 22 02 00 00       	jmp    26cd <main+0x3dd>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    24ab:	83 ec 04             	sub    $0x4,%esp
    24ae:	ff 35 88 2e 01 00    	pushl  0x12e88
    24b4:	ff 35 84 2e 01 00    	pushl  0x12e84
    24ba:	ff 35 80 2e 01 00    	pushl  0x12e80
    24c0:	e8 b5 e4 ff ff       	call   97a <drawFinderContent>
    24c5:	83 c4 10             	add    $0x10,%esp
			drawFinderWnd(context);
    24c8:	83 ec 04             	sub    $0x4,%esp
    24cb:	ff 35 88 2e 01 00    	pushl  0x12e88
    24d1:	ff 35 84 2e 01 00    	pushl  0x12e84
    24d7:	ff 35 80 2e 01 00    	pushl  0x12e80
    24dd:	e8 7a e3 ff ff       	call   85c <drawFinderWnd>
    24e2:	83 c4 10             	add    $0x10,%esp
			updateWindow(winid, context.addr);
    24e5:	a1 80 2e 01 00       	mov    0x12e80,%eax
    24ea:	83 ec 08             	sub    $0x8,%esp
    24ed:	50                   	push   %eax
    24ee:	ff 75 e4             	pushl  -0x1c(%ebp)
    24f1:	e8 c0 1d 00 00       	call   42b6 <updateWindow>
    24f6:	83 c4 10             	add    $0x10,%esp
			break;
    24f9:	e9 cf 01 00 00       	jmp    26cd <main+0x3dd>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    24fe:	8b 75 c8             	mov    -0x38(%ebp),%esi
    2501:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
    2504:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2507:	8b 55 bc             	mov    -0x44(%ebp),%edx
    250a:	a1 80 2e 01 00       	mov    0x12e80,%eax
    250f:	83 ec 08             	sub    $0x8,%esp
    2512:	56                   	push   %esi
    2513:	53                   	push   %ebx
    2514:	51                   	push   %ecx
    2515:	52                   	push   %edx
    2516:	50                   	push   %eax
    2517:	ff 75 e4             	pushl  -0x1c(%ebp)
    251a:	e8 9f 1d 00 00       	call   42be <updatePartialWindow>
    251f:	83 c4 20             	add    $0x20,%esp
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    2522:	e9 a6 01 00 00       	jmp    26cd <main+0x3dd>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2527:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    252a:	8b 55 bc             	mov    -0x44(%ebp),%edx
    252d:	8d 45 80             	lea    -0x80(%ebp),%eax
    2530:	83 ec 04             	sub    $0x4,%esp
    2533:	51                   	push   %ecx
    2534:	52                   	push   %edx
    2535:	50                   	push   %eax
    2536:	e8 d8 14 00 00       	call   3a13 <initPoint>
    253b:	83 c4 0c             	add    $0xc,%esp
    253e:	8b 45 80             	mov    -0x80(%ebp),%eax
    2541:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2544:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2547:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    254a:	a1 c0 2f 01 00       	mov    0x12fc0,%eax
    254f:	83 ec 04             	sub    $0x4,%esp
    2552:	ff 75 b4             	pushl  -0x4c(%ebp)
    2555:	ff 75 b0             	pushl  -0x50(%ebp)
    2558:	50                   	push   %eax
    2559:	e8 73 17 00 00       	call   3cd1 <executeHandler>
    255e:	83 c4 10             	add    $0x10,%esp
    2561:	85 c0                	test   %eax,%eax
    2563:	74 14                	je     2579 <main+0x289>

				updateWindow(winid, context.addr);
    2565:	a1 80 2e 01 00       	mov    0x12e80,%eax
    256a:	83 ec 08             	sub    $0x8,%esp
    256d:	50                   	push   %eax
    256e:	ff 75 e4             	pushl  -0x1c(%ebp)
    2571:	e8 40 1d 00 00       	call   42b6 <updateWindow>
    2576:	83 c4 10             	add    $0x10,%esp
			}
			break;
    2579:	e9 4f 01 00 00       	jmp    26cd <main+0x3dd>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    257e:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2581:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2584:	8d 45 80             	lea    -0x80(%ebp),%eax
    2587:	83 ec 04             	sub    $0x4,%esp
    258a:	51                   	push   %ecx
    258b:	52                   	push   %edx
    258c:	50                   	push   %eax
    258d:	e8 81 14 00 00       	call   3a13 <initPoint>
    2592:	83 c4 0c             	add    $0xc,%esp
    2595:	8b 45 80             	mov    -0x80(%ebp),%eax
    2598:	8b 55 84             	mov    -0x7c(%ebp),%edx
    259b:	89 45 b0             	mov    %eax,-0x50(%ebp)
    259e:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    25a1:	a1 c8 2f 01 00       	mov    0x12fc8,%eax
    25a6:	83 ec 04             	sub    $0x4,%esp
    25a9:	ff 75 b4             	pushl  -0x4c(%ebp)
    25ac:	ff 75 b0             	pushl  -0x50(%ebp)
    25af:	50                   	push   %eax
    25b0:	e8 1c 17 00 00       	call   3cd1 <executeHandler>
    25b5:	83 c4 10             	add    $0x10,%esp
    25b8:	85 c0                	test   %eax,%eax
    25ba:	74 14                	je     25d0 <main+0x2e0>
				updateWindow(winid, context.addr);
    25bc:	a1 80 2e 01 00       	mov    0x12e80,%eax
    25c1:	83 ec 08             	sub    $0x8,%esp
    25c4:	50                   	push   %eax
    25c5:	ff 75 e4             	pushl  -0x1c(%ebp)
    25c8:	e8 e9 1c 00 00       	call   42b6 <updateWindow>
    25cd:	83 c4 10             	add    $0x10,%esp
			}
			break;
    25d0:	e9 f8 00 00 00       	jmp    26cd <main+0x3dd>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    25d5:	0f b6 45 bc          	movzbl -0x44(%ebp),%eax
    25d9:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    25dc:	a1 40 26 01 00       	mov    0x12640,%eax
    25e1:	85 c0                	test   %eax,%eax
    25e3:	0f 84 e1 00 00 00    	je     26ca <main+0x3da>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    25e9:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    25ed:	74 2a                	je     2619 <main+0x329>
    25ef:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    25f3:	74 24                	je     2619 <main+0x329>
    25f5:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    25f9:	7e 06                	jle    2601 <main+0x311>
    25fb:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    25ff:	7e 18                	jle    2619 <main+0x329>
    2601:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    2605:	7e 06                	jle    260d <main+0x31d>
    2607:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    260b:	7e 0c                	jle    2619 <main+0x329>
    260d:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    2611:	7e 41                	jle    2654 <main+0x364>
    2613:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    2617:	7f 3b                	jg     2654 <main+0x364>
    2619:	a1 a0 2e 01 00       	mov    0x12ea0,%eax
    261e:	83 f8 13             	cmp    $0x13,%eax
    2621:	7f 31                	jg     2654 <main+0x364>
					keyContent.content[keyContent.length++] = key;
    2623:	a1 a0 2e 01 00       	mov    0x12ea0,%eax
    2628:	8d 50 01             	lea    0x1(%eax),%edx
    262b:	89 15 a0 2e 01 00    	mov    %edx,0x12ea0
    2631:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    2635:	88 90 8c 2e 01 00    	mov    %dl,0x12e8c(%eax)
					printf(0, "%s\n", keyContent.content);
    263b:	83 ec 04             	sub    $0x4,%esp
    263e:	68 8c 2e 01 00       	push   $0x12e8c
    2643:	68 af ab 00 00       	push   $0xabaf
    2648:	6a 00                	push   $0x0
    264a:	e8 8c 1d 00 00       	call   43db <printf>
    264f:	83 c4 10             	add    $0x10,%esp
    2652:	eb 28                	jmp    267c <main+0x38c>
				}
				else if (key == 8 && keyContent.length > 0) {
    2654:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    2658:	75 22                	jne    267c <main+0x38c>
    265a:	a1 a0 2e 01 00       	mov    0x12ea0,%eax
    265f:	85 c0                	test   %eax,%eax
    2661:	7e 19                	jle    267c <main+0x38c>
					keyContent.content[--keyContent.length] = 0;
    2663:	a1 a0 2e 01 00       	mov    0x12ea0,%eax
    2668:	83 e8 01             	sub    $0x1,%eax
    266b:	a3 a0 2e 01 00       	mov    %eax,0x12ea0
    2670:	a1 a0 2e 01 00       	mov    0x12ea0,%eax
    2675:	c6 80 8c 2e 01 00 00 	movb   $0x0,0x12e8c(%eax)
				}
				drawFinderContent(context);
    267c:	83 ec 04             	sub    $0x4,%esp
    267f:	ff 35 88 2e 01 00    	pushl  0x12e88
    2685:	ff 35 84 2e 01 00    	pushl  0x12e84
    268b:	ff 35 80 2e 01 00    	pushl  0x12e80
    2691:	e8 e4 e2 ff ff       	call   97a <drawFinderContent>
    2696:	83 c4 10             	add    $0x10,%esp
				drawFinderWnd(context);
    2699:	83 ec 04             	sub    $0x4,%esp
    269c:	ff 35 88 2e 01 00    	pushl  0x12e88
    26a2:	ff 35 84 2e 01 00    	pushl  0x12e84
    26a8:	ff 35 80 2e 01 00    	pushl  0x12e80
    26ae:	e8 a9 e1 ff ff       	call   85c <drawFinderWnd>
    26b3:	83 c4 10             	add    $0x10,%esp
				updateWindow(winid, context.addr);
    26b6:	a1 80 2e 01 00       	mov    0x12e80,%eax
    26bb:	83 ec 08             	sub    $0x8,%esp
    26be:	50                   	push   %eax
    26bf:	ff 75 e4             	pushl  -0x1c(%ebp)
    26c2:	e8 ef 1b 00 00       	call   42b6 <updateWindow>
    26c7:	83 c4 10             	add    $0x10,%esp
			}
			break;
    26ca:	eb 01                	jmp    26cd <main+0x3dd>
		default:
			break;
    26cc:	90                   	nop
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    26cd:	a1 c0 ed 00 00       	mov    0xedc0,%eax
    26d2:	85 c0                	test   %eax,%eax
    26d4:	0f 85 62 fd ff ff    	jne    243c <main+0x14c>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    26da:	83 ec 08             	sub    $0x8,%esp
    26dd:	ff 75 e4             	pushl  -0x1c(%ebp)
    26e0:	68 80 2e 01 00       	push   $0x12e80
    26e5:	e8 95 01 00 00       	call   287f <free_context>
    26ea:	83 c4 10             	add    $0x10,%esp
	exit();
    26ed:	e8 0c 1b 00 00       	call   41fe <exit>

000026f2 <testHandlers>:
}

void testHandlers() {
    26f2:	55                   	push   %ebp
    26f3:	89 e5                	mov    %esp,%ebp
    26f5:	83 ec 08             	sub    $0x8,%esp

	list(".");
    26f8:	83 ec 0c             	sub    $0xc,%esp
    26fb:	68 e7 ab 00 00       	push   $0xabe7
    2700:	e8 46 db ff ff       	call   24b <list>
    2705:	83 c4 10             	add    $0x10,%esp
	printf(0, "original list:\n");
    2708:	83 ec 08             	sub    $0x8,%esp
    270b:	68 28 ae 00 00       	push   $0xae28
    2710:	6a 00                	push   $0x0
    2712:	e8 c4 1c 00 00       	call   43db <printf>
    2717:	83 c4 10             	add    $0x10,%esp
	printItemList();
    271a:	e8 b4 e5 ff ff       	call   cd3 <printItemList>
	printf(0, "\n");
    271f:	83 ec 08             	sub    $0x8,%esp
    2722:	68 38 ae 00 00       	push   $0xae38
    2727:	6a 00                	push   $0x0
    2729:	e8 ad 1c 00 00       	call   43db <printf>
    272e:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a folder:\n");
    2731:	83 ec 08             	sub    $0x8,%esp
    2734:	68 3a ae 00 00       	push   $0xae3a
    2739:	6a 00                	push   $0x0
    273b:	e8 9b 1c 00 00       	call   43db <printf>
    2740:	83 c4 10             	add    $0x10,%esp
	newFolder("newfolder");
    2743:	83 ec 0c             	sub    $0xc,%esp
    2746:	68 49 ae 00 00       	push   $0xae49
    274b:	e8 b2 ef ff ff       	call   1702 <newFolder>
    2750:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2753:	e8 09 da ff ff       	call   161 <freeFileItemList>
	list(".");
    2758:	83 ec 0c             	sub    $0xc,%esp
    275b:	68 e7 ab 00 00       	push   $0xabe7
    2760:	e8 e6 da ff ff       	call   24b <list>
    2765:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2768:	e8 66 e5 ff ff       	call   cd3 <printItemList>
	printf(0, "\n");
    276d:	83 ec 08             	sub    $0x8,%esp
    2770:	68 38 ae 00 00       	push   $0xae38
    2775:	6a 00                	push   $0x0
    2777:	e8 5f 1c 00 00       	call   43db <printf>
    277c:	83 c4 10             	add    $0x10,%esp
	printf(0, "enter new folder:\n");
    277f:	83 ec 08             	sub    $0x8,%esp
    2782:	68 53 ae 00 00       	push   $0xae53
    2787:	6a 00                	push   $0x0
    2789:	e8 4d 1c 00 00       	call   43db <printf>
    278e:	83 c4 10             	add    $0x10,%esp
	enterDir("newfolder");
    2791:	83 ec 0c             	sub    $0xc,%esp
    2794:	68 49 ae 00 00       	push   $0xae49
    2799:	e8 2f ec ff ff       	call   13cd <enterDir>
    279e:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    27a1:	e8 bb d9 ff ff       	call   161 <freeFileItemList>
	list(".");
    27a6:	83 ec 0c             	sub    $0xc,%esp
    27a9:	68 e7 ab 00 00       	push   $0xabe7
    27ae:	e8 98 da ff ff       	call   24b <list>
    27b3:	83 c4 10             	add    $0x10,%esp
	printItemList();
    27b6:	e8 18 e5 ff ff       	call   cd3 <printItemList>
	printf(0, "\n");
    27bb:	83 ec 08             	sub    $0x8,%esp
    27be:	68 38 ae 00 00       	push   $0xae38
    27c3:	6a 00                	push   $0x0
    27c5:	e8 11 1c 00 00       	call   43db <printf>
    27ca:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a file:\n");
    27cd:	83 ec 08             	sub    $0x8,%esp
    27d0:	68 66 ae 00 00       	push   $0xae66
    27d5:	6a 00                	push   $0x0
    27d7:	e8 ff 1b 00 00       	call   43db <printf>
    27dc:	83 c4 10             	add    $0x10,%esp
	newFile("newfile.txt");
    27df:	83 ec 0c             	sub    $0xc,%esp
    27e2:	68 73 ae 00 00       	push   $0xae73
    27e7:	e8 2c ed ff ff       	call   1518 <newFile>
    27ec:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    27ef:	e8 6d d9 ff ff       	call   161 <freeFileItemList>
	list(".");
    27f4:	83 ec 0c             	sub    $0xc,%esp
    27f7:	68 e7 ab 00 00       	push   $0xabe7
    27fc:	e8 4a da ff ff       	call   24b <list>
    2801:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2804:	e8 ca e4 ff ff       	call   cd3 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    2809:	c9                   	leave  
    280a:	c3                   	ret    

0000280b <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    280b:	55                   	push   %ebp
    280c:	89 e5                	mov    %esp,%ebp
    280e:	83 ec 08             	sub    $0x8,%esp
    context_ptr->width = width;
    2811:	8b 45 08             	mov    0x8(%ebp),%eax
    2814:	8b 55 0c             	mov    0xc(%ebp),%edx
    2817:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    281a:	8b 45 08             	mov    0x8(%ebp),%eax
    281d:	8b 55 10             	mov    0x10(%ebp),%edx
    2820:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    2823:	8b 55 0c             	mov    0xc(%ebp),%edx
    2826:	8b 45 10             	mov    0x10(%ebp),%eax
    2829:	0f af c2             	imul   %edx,%eax
    282c:	01 c0                	add    %eax,%eax
    282e:	83 ec 0c             	sub    $0xc,%esp
    2831:	50                   	push   %eax
    2832:	e8 75 1e 00 00       	call   46ac <malloc>
    2837:	83 c4 10             	add    $0x10,%esp
    283a:	89 c2                	mov    %eax,%edx
    283c:	8b 45 08             	mov    0x8(%ebp),%eax
    283f:	89 10                	mov    %edx,(%eax)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    2841:	8b 55 0c             	mov    0xc(%ebp),%edx
    2844:	8b 45 10             	mov    0x10(%ebp),%eax
    2847:	0f af c2             	imul   %edx,%eax
    284a:	8d 14 00             	lea    (%eax,%eax,1),%edx
    284d:	8b 45 08             	mov    0x8(%ebp),%eax
    2850:	8b 00                	mov    (%eax),%eax
    2852:	83 ec 04             	sub    $0x4,%esp
    2855:	52                   	push   %edx
    2856:	6a 00                	push   $0x0
    2858:	50                   	push   %eax
    2859:	e8 06 18 00 00       	call   4064 <memset>
    285e:	83 c4 10             	add    $0x10,%esp
    initializeASCII();
    2861:	e8 73 01 00 00       	call   29d9 <initializeASCII>
    initializeGBK();
    2866:	e8 f4 02 00 00       	call   2b5f <initializeGBK>
    return createWindow(0, 0, width, height);
    286b:	ff 75 10             	pushl  0x10(%ebp)
    286e:	ff 75 0c             	pushl  0xc(%ebp)
    2871:	6a 00                	push   $0x0
    2873:	6a 00                	push   $0x0
    2875:	e8 2c 1a 00 00       	call   42a6 <createWindow>
    287a:	83 c4 10             	add    $0x10,%esp
}
    287d:	c9                   	leave  
    287e:	c3                   	ret    

0000287f <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    287f:	55                   	push   %ebp
    2880:	89 e5                	mov    %esp,%ebp
    2882:	83 ec 08             	sub    $0x8,%esp
    free(context_ptr->addr);
    2885:	8b 45 08             	mov    0x8(%ebp),%eax
    2888:	8b 00                	mov    (%eax),%eax
    288a:	83 ec 0c             	sub    $0xc,%esp
    288d:	50                   	push   %eax
    288e:	e8 d8 1c 00 00       	call   456b <free>
    2893:	83 c4 10             	add    $0x10,%esp
    freeASCII();
    2896:	e8 ab 02 00 00       	call   2b46 <freeASCII>
    freeGBK();
    289b:	e8 60 03 00 00       	call   2c00 <freeGBK>
    destroyWindow(winid);
    28a0:	83 ec 0c             	sub    $0xc,%esp
    28a3:	ff 75 0c             	pushl  0xc(%ebp)
    28a6:	e8 03 1a 00 00       	call   42ae <destroyWindow>
    28ab:	83 c4 10             	add    $0x10,%esp
}
    28ae:	c9                   	leave  
    28af:	c3                   	ret    

000028b0 <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    28b0:	55                   	push   %ebp
    28b1:	89 e5                	mov    %esp,%ebp
    28b3:	83 ec 04             	sub    $0x4,%esp
    28b6:	8b 45 1c             	mov    0x1c(%ebp),%eax
    28b9:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    28bd:	8b 45 0c             	mov    0xc(%ebp),%eax
    28c0:	3b 45 14             	cmp    0x14(%ebp),%eax
    28c3:	77 02                	ja     28c7 <draw_point+0x17>
    return;
    28c5:	eb 26                	jmp    28ed <draw_point+0x3d>
  if(y >= c.height)
    28c7:	8b 45 10             	mov    0x10(%ebp),%eax
    28ca:	3b 45 18             	cmp    0x18(%ebp),%eax
    28cd:	77 02                	ja     28d1 <draw_point+0x21>
    return;
    28cf:	eb 1c                	jmp    28ed <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    28d1:	8b 45 08             	mov    0x8(%ebp),%eax
    28d4:	8b 55 0c             	mov    0xc(%ebp),%edx
    28d7:	89 d1                	mov    %edx,%ecx
    28d9:	0f af 4d 18          	imul   0x18(%ebp),%ecx
    28dd:	8b 55 14             	mov    0x14(%ebp),%edx
    28e0:	01 ca                	add    %ecx,%edx
    28e2:	01 d2                	add    %edx,%edx
    28e4:	01 c2                	add    %eax,%edx
    28e6:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    28ea:	66 89 02             	mov    %ax,(%edx)
}
    28ed:	c9                   	leave  
    28ee:	c3                   	ret    

000028ef <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    28ef:	55                   	push   %ebp
    28f0:	89 e5                	mov    %esp,%ebp
    28f2:	83 ec 14             	sub    $0x14,%esp
    28f5:	8b 45 24             	mov    0x24(%ebp),%eax
    28f8:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    28fc:	8b 55 14             	mov    0x14(%ebp),%edx
    28ff:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2902:	01 d0                	add    %edx,%eax
    2904:	8b 55 0c             	mov    0xc(%ebp),%edx
    2907:	39 d0                	cmp    %edx,%eax
    2909:	0f 47 c2             	cmova  %edx,%eax
    290c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    290f:	8b 55 18             	mov    0x18(%ebp),%edx
    2912:	8b 45 20             	mov    0x20(%ebp),%eax
    2915:	01 d0                	add    %edx,%eax
    2917:	8b 55 10             	mov    0x10(%ebp),%edx
    291a:	39 d0                	cmp    %edx,%eax
    291c:	0f 47 c2             	cmova  %edx,%eax
    291f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    2922:	8b 45 18             	mov    0x18(%ebp),%eax
    2925:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2928:	eb 36                	jmp    2960 <fill_rect+0x71>
	{
		for (x = bx; x < mx; x++)
    292a:	8b 45 14             	mov    0x14(%ebp),%eax
    292d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    2930:	eb 22                	jmp    2954 <fill_rect+0x65>
		{
			draw_point(c, x, y, color);
    2932:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    2936:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2939:	8b 45 fc             	mov    -0x4(%ebp),%eax
    293c:	51                   	push   %ecx
    293d:	52                   	push   %edx
    293e:	50                   	push   %eax
    293f:	ff 75 10             	pushl  0x10(%ebp)
    2942:	ff 75 0c             	pushl  0xc(%ebp)
    2945:	ff 75 08             	pushl  0x8(%ebp)
    2948:	e8 63 ff ff ff       	call   28b0 <draw_point>
    294d:	83 c4 18             	add    $0x18,%esp
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    2950:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2954:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2957:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    295a:	7c d6                	jl     2932 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    295c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2960:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2963:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2966:	7c c2                	jl     292a <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    2968:	c9                   	leave  
    2969:	c3                   	ret    

0000296a <printBinary>:

void printBinary(char c)
{
    296a:	55                   	push   %ebp
    296b:	89 e5                	mov    %esp,%ebp
    296d:	83 ec 28             	sub    $0x28,%esp
    2970:	8b 45 08             	mov    0x8(%ebp),%eax
    2973:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    2976:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    297d:	eb 40                	jmp    29bf <printBinary+0x55>
	{
		if(((c << i) & 0x80) != 0)
    297f:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    2983:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2986:	89 c1                	mov    %eax,%ecx
    2988:	d3 e2                	shl    %cl,%edx
    298a:	89 d0                	mov    %edx,%eax
    298c:	25 80 00 00 00       	and    $0x80,%eax
    2991:	85 c0                	test   %eax,%eax
    2993:	74 14                	je     29a9 <printBinary+0x3f>
		{
			printf(0, "1");
    2995:	83 ec 08             	sub    $0x8,%esp
    2998:	68 7f ae 00 00       	push   $0xae7f
    299d:	6a 00                	push   $0x0
    299f:	e8 37 1a 00 00       	call   43db <printf>
    29a4:	83 c4 10             	add    $0x10,%esp
    29a7:	eb 12                	jmp    29bb <printBinary+0x51>
		}
		else
		{
			printf(0, "0");
    29a9:	83 ec 08             	sub    $0x8,%esp
    29ac:	68 81 ae 00 00       	push   $0xae81
    29b1:	6a 00                	push   $0x0
    29b3:	e8 23 1a 00 00       	call   43db <printf>
    29b8:	83 c4 10             	add    $0x10,%esp
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    29bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    29bf:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    29c3:	7e ba                	jle    297f <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    29c5:	83 ec 08             	sub    $0x8,%esp
    29c8:	68 83 ae 00 00       	push   $0xae83
    29cd:	6a 00                	push   $0x0
    29cf:	e8 07 1a 00 00       	call   43db <printf>
    29d4:	83 c4 10             	add    $0x10,%esp
}
    29d7:	c9                   	leave  
    29d8:	c3                   	ret    

000029d9 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    29d9:	55                   	push   %ebp
    29da:	89 e5                	mov    %esp,%ebp
    29dc:	56                   	push   %esi
    29dd:	53                   	push   %ebx
    29de:	83 ec 20             	sub    $0x20,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    29e1:	83 ec 08             	sub    $0x8,%esp
    29e4:	68 85 ae 00 00       	push   $0xae85
    29e9:	6a 00                	push   $0x0
    29eb:	e8 eb 19 00 00       	call   43db <printf>
    29f0:	83 c4 10             	add    $0x10,%esp
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    29f3:	83 ec 08             	sub    $0x8,%esp
    29f6:	6a 00                	push   $0x0
    29f8:	68 98 ae 00 00       	push   $0xae98
    29fd:	e8 3c 18 00 00       	call   423e <open>
    2a02:	83 c4 10             	add    $0x10,%esp
    2a05:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2a08:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2a0c:	79 1c                	jns    2a2a <initializeASCII+0x51>
	  printf(0,"cannot open %s\n", HANKAKU);
    2a0e:	83 ec 04             	sub    $0x4,%esp
    2a11:	68 98 ae 00 00       	push   $0xae98
    2a16:	68 a4 ae 00 00       	push   $0xaea4
    2a1b:	6a 00                	push   $0x0
    2a1d:	e8 b9 19 00 00       	call   43db <printf>
    2a22:	83 c4 10             	add    $0x10,%esp
	  return;
    2a25:	e9 15 01 00 00       	jmp    2b3f <initializeASCII+0x166>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    2a2a:	83 ec 0c             	sub    $0xc,%esp
    2a2d:	68 00 10 00 00       	push   $0x1000
    2a32:	e8 75 1c 00 00       	call   46ac <malloc>
    2a37:	83 c4 10             	add    $0x10,%esp
    2a3a:	a3 00 30 01 00       	mov    %eax,0x13000
	for (i = 0; i < ASCII_NUM; i++)
    2a3f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a46:	eb 12                	jmp    2a5a <initializeASCII+0x81>
	{
		hankaku[i] = 0;
    2a48:	8b 15 00 30 01 00    	mov    0x13000,%edx
    2a4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a51:	01 d0                	add    %edx,%eax
    2a53:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    2a56:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a5a:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    2a61:	7e e5                	jle    2a48 <initializeASCII+0x6f>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    2a63:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    2a6a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2a71:	e9 84 00 00 00       	jmp    2afa <initializeASCII+0x121>
	{
		for (i = 0; i < n; i++){
    2a76:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a7d:	eb 73                	jmp    2af2 <initializeASCII+0x119>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    2a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a82:	05 40 30 01 00       	add    $0x13040,%eax
    2a87:	0f b6 00             	movzbl (%eax),%eax
    2a8a:	3c 2a                	cmp    $0x2a,%al
    2a8c:	74 0f                	je     2a9d <initializeASCII+0xc4>
    2a8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a91:	05 40 30 01 00       	add    $0x13040,%eax
    2a96:	0f b6 00             	movzbl (%eax),%eax
    2a99:	3c 2e                	cmp    $0x2e,%al
    2a9b:	75 51                	jne    2aee <initializeASCII+0x115>
			{
				if (buf[i] == '*')
    2a9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2aa0:	05 40 30 01 00       	add    $0x13040,%eax
    2aa5:	0f b6 00             	movzbl (%eax),%eax
    2aa8:	3c 2a                	cmp    $0x2a,%al
    2aaa:	75 2d                	jne    2ad9 <initializeASCII+0x100>
				{
					hankaku[y] |= (0x80 >> x);
    2aac:	8b 15 00 30 01 00    	mov    0x13000,%edx
    2ab2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ab5:	01 c2                	add    %eax,%edx
    2ab7:	8b 0d 00 30 01 00    	mov    0x13000,%ecx
    2abd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ac0:	01 c8                	add    %ecx,%eax
    2ac2:	0f b6 00             	movzbl (%eax),%eax
    2ac5:	89 c3                	mov    %eax,%ebx
    2ac7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2aca:	be 80 00 00 00       	mov    $0x80,%esi
    2acf:	89 c1                	mov    %eax,%ecx
    2ad1:	d3 fe                	sar    %cl,%esi
    2ad3:	89 f0                	mov    %esi,%eax
    2ad5:	09 d8                	or     %ebx,%eax
    2ad7:	88 02                	mov    %al,(%edx)
				}
				x ++;
    2ad9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    2add:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    2ae1:	7e 0b                	jle    2aee <initializeASCII+0x115>
				{
					x = 0;
    2ae3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    2aea:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    2aee:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2af5:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    2af8:	7c 85                	jl     2a7f <initializeASCII+0xa6>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2afa:	83 ec 04             	sub    $0x4,%esp
    2afd:	68 00 02 00 00       	push   $0x200
    2b02:	68 40 30 01 00       	push   $0x13040
    2b07:	ff 75 e8             	pushl  -0x18(%ebp)
    2b0a:	e8 07 17 00 00       	call   4216 <read>
    2b0f:	83 c4 10             	add    $0x10,%esp
    2b12:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2b15:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2b19:	0f 8f 57 ff ff ff    	jg     2a76 <initializeASCII+0x9d>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    2b1f:	83 ec 08             	sub    $0x8,%esp
    2b22:	68 b4 ae 00 00       	push   $0xaeb4
    2b27:	6a 00                	push   $0x0
    2b29:	e8 ad 18 00 00       	call   43db <printf>
    2b2e:	83 c4 10             	add    $0x10,%esp
	close(fd);
    2b31:	83 ec 0c             	sub    $0xc,%esp
    2b34:	ff 75 e8             	pushl  -0x18(%ebp)
    2b37:	e8 ea 16 00 00       	call   4226 <close>
    2b3c:	83 c4 10             	add    $0x10,%esp
}
    2b3f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2b42:	5b                   	pop    %ebx
    2b43:	5e                   	pop    %esi
    2b44:	5d                   	pop    %ebp
    2b45:	c3                   	ret    

00002b46 <freeASCII>:

void freeASCII(){
    2b46:	55                   	push   %ebp
    2b47:	89 e5                	mov    %esp,%ebp
    2b49:	83 ec 08             	sub    $0x8,%esp
	free(hankaku);
    2b4c:	a1 00 30 01 00       	mov    0x13000,%eax
    2b51:	83 ec 0c             	sub    $0xc,%esp
    2b54:	50                   	push   %eax
    2b55:	e8 11 1a 00 00       	call   456b <free>
    2b5a:	83 c4 10             	add    $0x10,%esp
}
    2b5d:	c9                   	leave  
    2b5e:	c3                   	ret    

00002b5f <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    2b5f:	55                   	push   %ebp
    2b60:	89 e5                	mov    %esp,%ebp
    2b62:	83 ec 18             	sub    $0x18,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    2b65:	83 ec 08             	sub    $0x8,%esp
    2b68:	68 d1 ae 00 00       	push   $0xaed1
    2b6d:	6a 00                	push   $0x0
    2b6f:	e8 67 18 00 00       	call   43db <printf>
    2b74:	83 c4 10             	add    $0x10,%esp
	if((fd = open(HZK16, 0)) < 0){
    2b77:	83 ec 08             	sub    $0x8,%esp
    2b7a:	6a 00                	push   $0x0
    2b7c:	68 e2 ae 00 00       	push   $0xaee2
    2b81:	e8 b8 16 00 00       	call   423e <open>
    2b86:	83 c4 10             	add    $0x10,%esp
    2b89:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b8c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b90:	79 19                	jns    2bab <initializeGBK+0x4c>
		printf(0,"cannot open %s\n", HZK16);
    2b92:	83 ec 04             	sub    $0x4,%esp
    2b95:	68 e2 ae 00 00       	push   $0xaee2
    2b9a:	68 a4 ae 00 00       	push   $0xaea4
    2b9f:	6a 00                	push   $0x0
    2ba1:	e8 35 18 00 00       	call   43db <printf>
    2ba6:	83 c4 10             	add    $0x10,%esp
		return;
    2ba9:	eb 53                	jmp    2bfe <initializeGBK+0x9f>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    2bab:	83 ec 0c             	sub    $0xc,%esp
    2bae:	68 78 69 00 00       	push   $0x6978
    2bb3:	e8 f4 1a 00 00       	call   46ac <malloc>
    2bb8:	83 c4 10             	add    $0x10,%esp
    2bbb:	a3 04 30 01 00       	mov    %eax,0x13004
	fontFile.size = read(fd, fontFile.buf, 27000);
    2bc0:	a1 04 30 01 00       	mov    0x13004,%eax
    2bc5:	83 ec 04             	sub    $0x4,%esp
    2bc8:	68 78 69 00 00       	push   $0x6978
    2bcd:	50                   	push   %eax
    2bce:	ff 75 f4             	pushl  -0xc(%ebp)
    2bd1:	e8 40 16 00 00       	call   4216 <read>
    2bd6:	83 c4 10             	add    $0x10,%esp
    2bd9:	a3 08 30 01 00       	mov    %eax,0x13008
	printf(0,"initialzing gbk complete!\n");
    2bde:	83 ec 08             	sub    $0x8,%esp
    2be1:	68 ec ae 00 00       	push   $0xaeec
    2be6:	6a 00                	push   $0x0
    2be8:	e8 ee 17 00 00       	call   43db <printf>
    2bed:	83 c4 10             	add    $0x10,%esp
	close(fd);
    2bf0:	83 ec 0c             	sub    $0xc,%esp
    2bf3:	ff 75 f4             	pushl  -0xc(%ebp)
    2bf6:	e8 2b 16 00 00       	call   4226 <close>
    2bfb:	83 c4 10             	add    $0x10,%esp
}
    2bfe:	c9                   	leave  
    2bff:	c3                   	ret    

00002c00 <freeGBK>:

void freeGBK(){
    2c00:	55                   	push   %ebp
    2c01:	89 e5                	mov    %esp,%ebp
    2c03:	83 ec 08             	sub    $0x8,%esp
	free(fontFile.buf);
    2c06:	a1 04 30 01 00       	mov    0x13004,%eax
    2c0b:	83 ec 0c             	sub    $0xc,%esp
    2c0e:	50                   	push   %eax
    2c0f:	e8 57 19 00 00       	call   456b <free>
    2c14:	83 c4 10             	add    $0x10,%esp
}
    2c17:	c9                   	leave  
    2c18:	c3                   	ret    

00002c19 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    2c19:	55                   	push   %ebp
    2c1a:	89 e5                	mov    %esp,%ebp
    2c1c:	53                   	push   %ebx
    2c1d:	83 ec 18             	sub    $0x18,%esp
    2c20:	8b 55 14             	mov    0x14(%ebp),%edx
    2c23:	8b 45 18             	mov    0x18(%ebp),%eax
    2c26:	88 55 e8             	mov    %dl,-0x18(%ebp)
    2c29:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2c2d:	8b 45 20             	mov    0x20(%ebp),%eax
    2c30:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c33:	eb 6b                	jmp    2ca0 <put_ascii+0x87>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2c35:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2c3c:	eb 58                	jmp    2c96 <put_ascii+0x7d>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    2c3e:	8b 15 00 30 01 00    	mov    0x13000,%edx
    2c44:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
    2c48:	c1 e0 04             	shl    $0x4,%eax
    2c4b:	89 c1                	mov    %eax,%ecx
    2c4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c50:	2b 45 20             	sub    0x20(%ebp),%eax
    2c53:	01 c8                	add    %ecx,%eax
    2c55:	01 d0                	add    %edx,%eax
    2c57:	0f b6 00             	movzbl (%eax),%eax
    2c5a:	0f b6 d0             	movzbl %al,%edx
    2c5d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2c60:	89 c1                	mov    %eax,%ecx
    2c62:	d3 e2                	shl    %cl,%edx
    2c64:	89 d0                	mov    %edx,%eax
    2c66:	25 80 00 00 00       	and    $0x80,%eax
    2c6b:	85 c0                	test   %eax,%eax
    2c6d:	74 23                	je     2c92 <put_ascii+0x79>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    2c6f:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2c73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c76:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2c79:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2c7c:	01 d9                	add    %ebx,%ecx
    2c7e:	52                   	push   %edx
    2c7f:	50                   	push   %eax
    2c80:	51                   	push   %ecx
    2c81:	ff 75 10             	pushl  0x10(%ebp)
    2c84:	ff 75 0c             	pushl  0xc(%ebp)
    2c87:	ff 75 08             	pushl  0x8(%ebp)
    2c8a:	e8 21 fc ff ff       	call   28b0 <draw_point>
    2c8f:	83 c4 18             	add    $0x18,%esp
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2c92:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2c96:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2c9a:	7e a2                	jle    2c3e <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2c9c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2ca0:	8b 45 20             	mov    0x20(%ebp),%eax
    2ca3:	83 c0 10             	add    $0x10,%eax
    2ca6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2ca9:	7f 8a                	jg     2c35 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    2cab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cae:	c9                   	leave  
    2caf:	c3                   	ret    

00002cb0 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    2cb0:	55                   	push   %ebp
    2cb1:	89 e5                	mov    %esp,%ebp
    2cb3:	53                   	push   %ebx
    2cb4:	83 ec 18             	sub    $0x18,%esp
    2cb7:	8b 55 14             	mov    0x14(%ebp),%edx
    2cba:	8b 45 18             	mov    0x18(%ebp),%eax
    2cbd:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    2cc1:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2cc5:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2cc9:	0f b6 c0             	movzbl %al,%eax
    2ccc:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2cd1:	0f 8e 1e 01 00 00    	jle    2df5 <put_gbk+0x145>
    2cd7:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2cdb:	66 c1 f8 08          	sar    $0x8,%ax
    2cdf:	98                   	cwtl   
    2ce0:	0f b6 c0             	movzbl %al,%eax
    2ce3:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2ce8:	0f 8e 07 01 00 00    	jle    2df5 <put_gbk+0x145>
		hzk16Base = fontFile.buf;
    2cee:	a1 04 30 01 00       	mov    0x13004,%eax
    2cf3:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    2cf6:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2cfa:	0f b6 c0             	movzbl %al,%eax
    2cfd:	2d a1 00 00 00       	sub    $0xa1,%eax
    2d02:	6b c0 5e             	imul   $0x5e,%eax,%eax
    2d05:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    2d09:	66 c1 fa 08          	sar    $0x8,%dx
    2d0d:	0f bf d2             	movswl %dx,%edx
    2d10:	0f b6 d2             	movzbl %dl,%edx
    2d13:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    2d19:	01 d0                	add    %edx,%eax
    2d1b:	c1 e0 05             	shl    $0x5,%eax
    2d1e:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2d21:	8b 45 20             	mov    0x20(%ebp),%eax
    2d24:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2d27:	e9 b8 00 00 00       	jmp    2de4 <put_gbk+0x134>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2d2c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2d33:	eb 47                	jmp    2d7c <put_gbk+0xcc>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2d35:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2d38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d3b:	01 d0                	add    %edx,%eax
    2d3d:	0f b6 00             	movzbl (%eax),%eax
    2d40:	0f b6 d0             	movzbl %al,%edx
    2d43:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2d46:	89 c1                	mov    %eax,%ecx
    2d48:	d3 e2                	shl    %cl,%edx
    2d4a:	89 d0                	mov    %edx,%eax
    2d4c:	25 80 00 00 00       	and    $0x80,%eax
    2d51:	85 c0                	test   %eax,%eax
    2d53:	74 23                	je     2d78 <put_gbk+0xc8>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2d55:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2d59:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d5c:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2d5f:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2d62:	01 d9                	add    %ebx,%ecx
    2d64:	52                   	push   %edx
    2d65:	50                   	push   %eax
    2d66:	51                   	push   %ecx
    2d67:	ff 75 10             	pushl  0x10(%ebp)
    2d6a:	ff 75 0c             	pushl  0xc(%ebp)
    2d6d:	ff 75 08             	pushl  0x8(%ebp)
    2d70:	e8 3b fb ff ff       	call   28b0 <draw_point>
    2d75:	83 c4 18             	add    $0x18,%esp
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2d78:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2d7c:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2d80:	7e b3                	jle    2d35 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    2d82:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2d86:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2d8d:	eb 47                	jmp    2dd6 <put_gbk+0x126>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2d8f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2d92:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d95:	01 d0                	add    %edx,%eax
    2d97:	0f b6 00             	movzbl (%eax),%eax
    2d9a:	0f b6 d0             	movzbl %al,%edx
    2d9d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2da0:	89 c1                	mov    %eax,%ecx
    2da2:	d3 e2                	shl    %cl,%edx
    2da4:	89 d0                	mov    %edx,%eax
    2da6:	25 80 00 00 00       	and    $0x80,%eax
    2dab:	85 c0                	test   %eax,%eax
    2dad:	74 23                	je     2dd2 <put_gbk+0x122>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2daf:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2db3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2db6:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2db9:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2dbc:	01 d9                	add    %ebx,%ecx
    2dbe:	52                   	push   %edx
    2dbf:	50                   	push   %eax
    2dc0:	51                   	push   %ecx
    2dc1:	ff 75 10             	pushl  0x10(%ebp)
    2dc4:	ff 75 0c             	pushl  0xc(%ebp)
    2dc7:	ff 75 08             	pushl  0x8(%ebp)
    2dca:	e8 e1 fa ff ff       	call   28b0 <draw_point>
    2dcf:	83 c4 18             	add    $0x18,%esp
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2dd2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2dd6:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2dda:	7e b3                	jle    2d8f <put_gbk+0xdf>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    2ddc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2de0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2de4:	8b 45 20             	mov    0x20(%ebp),%eax
    2de7:	83 c0 10             	add    $0x10,%eax
    2dea:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2ded:	0f 8f 39 ff ff ff    	jg     2d2c <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2df3:	eb 50                	jmp    2e45 <put_gbk+0x195>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    2df5:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2df9:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2dfd:	0f b6 c0             	movzbl %al,%eax
    2e00:	ff 75 20             	pushl  0x20(%ebp)
    2e03:	ff 75 1c             	pushl  0x1c(%ebp)
    2e06:	52                   	push   %edx
    2e07:	50                   	push   %eax
    2e08:	ff 75 10             	pushl  0x10(%ebp)
    2e0b:	ff 75 0c             	pushl  0xc(%ebp)
    2e0e:	ff 75 08             	pushl  0x8(%ebp)
    2e11:	e8 03 fe ff ff       	call   2c19 <put_ascii>
    2e16:	83 c4 1c             	add    $0x1c,%esp
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    2e19:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2e1c:	8d 48 08             	lea    0x8(%eax),%ecx
    2e1f:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2e23:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2e27:	66 c1 f8 08          	sar    $0x8,%ax
    2e2b:	0f b6 c0             	movzbl %al,%eax
    2e2e:	ff 75 20             	pushl  0x20(%ebp)
    2e31:	51                   	push   %ecx
    2e32:	52                   	push   %edx
    2e33:	50                   	push   %eax
    2e34:	ff 75 10             	pushl  0x10(%ebp)
    2e37:	ff 75 0c             	pushl  0xc(%ebp)
    2e3a:	ff 75 08             	pushl  0x8(%ebp)
    2e3d:	e8 d7 fd ff ff       	call   2c19 <put_ascii>
    2e42:	83 c4 1c             	add    $0x1c,%esp
	}
}
    2e45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2e48:	c9                   	leave  
    2e49:	c3                   	ret    

00002e4a <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    2e4a:	55                   	push   %ebp
    2e4b:	89 e5                	mov    %esp,%ebp
    2e4d:	83 ec 28             	sub    $0x28,%esp
    2e50:	8b 45 18             	mov    0x18(%ebp),%eax
    2e53:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    2e57:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    2e5e:	83 ec 0c             	sub    $0xc,%esp
    2e61:	ff 75 14             	pushl  0x14(%ebp)
    2e64:	e8 d4 11 00 00       	call   403d <strlen>
    2e69:	83 c4 10             	add    $0x10,%esp
    2e6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2e6f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2e76:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2e79:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2e7c:	eb 36                	jmp    2eb4 <puts_str+0x6a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    2e7e:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2e82:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2e85:	8b 45 14             	mov    0x14(%ebp),%eax
    2e88:	01 c8                	add    %ecx,%eax
    2e8a:	0f b6 00             	movzbl (%eax),%eax
    2e8d:	0f b6 c0             	movzbl %al,%eax
    2e90:	83 ec 04             	sub    $0x4,%esp
    2e93:	ff 75 20             	pushl  0x20(%ebp)
    2e96:	ff 75 f0             	pushl  -0x10(%ebp)
    2e99:	52                   	push   %edx
    2e9a:	50                   	push   %eax
    2e9b:	ff 75 10             	pushl  0x10(%ebp)
    2e9e:	ff 75 0c             	pushl  0xc(%ebp)
    2ea1:	ff 75 08             	pushl  0x8(%ebp)
    2ea4:	e8 70 fd ff ff       	call   2c19 <put_ascii>
    2ea9:	83 c4 20             	add    $0x20,%esp
			xTmp += 8;
    2eac:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    2eb0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2eb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2eb7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2eba:	72 c2                	jb     2e7e <puts_str+0x34>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    2ebc:	c9                   	leave  
    2ebd:	c3                   	ret    

00002ebe <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    2ebe:	55                   	push   %ebp
    2ebf:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    2ec1:	8b 45 10             	mov    0x10(%ebp),%eax
    2ec4:	8d 50 07             	lea    0x7(%eax),%edx
    2ec7:	85 c0                	test   %eax,%eax
    2ec9:	0f 48 c2             	cmovs  %edx,%eax
    2ecc:	c1 f8 03             	sar    $0x3,%eax
    2ecf:	89 c1                	mov    %eax,%ecx
    2ed1:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ed4:	8d 50 03             	lea    0x3(%eax),%edx
    2ed7:	85 c0                	test   %eax,%eax
    2ed9:	0f 48 c2             	cmovs  %edx,%eax
    2edc:	c1 f8 02             	sar    $0x2,%eax
    2edf:	c1 e0 05             	shl    $0x5,%eax
    2ee2:	01 c1                	add    %eax,%ecx
    2ee4:	8b 45 08             	mov    0x8(%ebp),%eax
    2ee7:	8d 50 07             	lea    0x7(%eax),%edx
    2eea:	85 c0                	test   %eax,%eax
    2eec:	0f 48 c2             	cmovs  %edx,%eax
    2eef:	c1 f8 03             	sar    $0x3,%eax
    2ef2:	c1 e0 0b             	shl    $0xb,%eax
    2ef5:	01 c8                	add    %ecx,%eax
}
    2ef7:	5d                   	pop    %ebp
    2ef8:	c3                   	ret    

00002ef9 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    2ef9:	55                   	push   %ebp
    2efa:	89 e5                	mov    %esp,%ebp
    2efc:	53                   	push   %ebx
    2efd:	83 ec 10             	sub    $0x10,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2f00:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2f07:	e9 98 00 00 00       	jmp    2fa4 <draw_picture+0xab>
	{
		for (j = 0; j < pic.width; j++)
    2f0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f13:	eb 7f                	jmp    2f94 <draw_picture+0x9b>
		{
			rgb = pic.data[i*pic.width+j];
    2f15:	8b 55 14             	mov    0x14(%ebp),%edx
    2f18:	8b 45 18             	mov    0x18(%ebp),%eax
    2f1b:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    2f1f:	89 c1                	mov    %eax,%ecx
    2f21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f24:	01 c8                	add    %ecx,%eax
    2f26:	c1 e0 02             	shl    $0x2,%eax
    2f29:	01 d0                	add    %edx,%eax
    2f2b:	8b 00                	mov    (%eax),%eax
    2f2d:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    2f30:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    2f34:	3c 01                	cmp    $0x1,%al
    2f36:	75 02                	jne    2f3a <draw_picture+0x41>
    2f38:	eb 56                	jmp    2f90 <draw_picture+0x97>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    2f3a:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    2f3e:	0f b6 c8             	movzbl %al,%ecx
    2f41:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    2f45:	0f b6 d0             	movzbl %al,%edx
    2f48:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    2f4c:	0f b6 c0             	movzbl %al,%eax
    2f4f:	51                   	push   %ecx
    2f50:	52                   	push   %edx
    2f51:	50                   	push   %eax
    2f52:	e8 67 ff ff ff       	call   2ebe <_RGB16BIT565>
    2f57:	83 c4 0c             	add    $0xc,%esp
    2f5a:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    2f5e:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
    2f62:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2f65:	83 ea 01             	sub    $0x1,%edx
    2f68:	89 d1                	mov    %edx,%ecx
    2f6a:	2b 4d f8             	sub    -0x8(%ebp),%ecx
    2f6d:	8b 55 24             	mov    0x24(%ebp),%edx
    2f70:	01 ca                	add    %ecx,%edx
    2f72:	89 d3                	mov    %edx,%ebx
    2f74:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2f77:	8b 55 20             	mov    0x20(%ebp),%edx
    2f7a:	01 ca                	add    %ecx,%edx
    2f7c:	50                   	push   %eax
    2f7d:	53                   	push   %ebx
    2f7e:	52                   	push   %edx
    2f7f:	ff 75 10             	pushl  0x10(%ebp)
    2f82:	ff 75 0c             	pushl  0xc(%ebp)
    2f85:	ff 75 08             	pushl  0x8(%ebp)
    2f88:	e8 23 f9 ff ff       	call   28b0 <draw_point>
    2f8d:	83 c4 18             	add    $0x18,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    2f90:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2f94:	8b 45 18             	mov    0x18(%ebp),%eax
    2f97:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2f9a:	0f 8f 75 ff ff ff    	jg     2f15 <draw_picture+0x1c>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2fa0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2fa4:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2fa7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2faa:	0f 8f 5c ff ff ff    	jg     2f0c <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    2fb0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2fb3:	c9                   	leave  
    2fb4:	c3                   	ret    

00002fb5 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    2fb5:	55                   	push   %ebp
    2fb6:	89 e5                	mov    %esp,%ebp
    2fb8:	83 ec 24             	sub    $0x24,%esp
    2fbb:	8b 45 24             	mov    0x24(%ebp),%eax
    2fbe:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    2fc2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2fc5:	2b 45 14             	sub    0x14(%ebp),%eax
    2fc8:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    2fcb:	8b 45 20             	mov    0x20(%ebp),%eax
    2fce:	2b 45 18             	sub    0x18(%ebp),%eax
    2fd1:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    2fd4:	8b 45 14             	mov    0x14(%ebp),%eax
    2fd7:	c1 e0 0a             	shl    $0xa,%eax
    2fda:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    2fdd:	8b 45 18             	mov    0x18(%ebp),%eax
    2fe0:	c1 e0 0a             	shl    $0xa,%eax
    2fe3:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    2fe6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2fe9:	c1 f8 1f             	sar    $0x1f,%eax
    2fec:	31 45 fc             	xor    %eax,-0x4(%ebp)
    2fef:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    2ff2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2ff5:	c1 f8 1f             	sar    $0x1f,%eax
    2ff8:	31 45 f8             	xor    %eax,-0x8(%ebp)
    2ffb:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    2ffe:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3001:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3004:	7c 4f                	jl     3055 <draw_line+0xa0>
		len = dx + 1;
    3006:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3009:	83 c0 01             	add    $0x1,%eax
    300c:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    300f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3012:	3b 45 14             	cmp    0x14(%ebp),%eax
    3015:	7e 07                	jle    301e <draw_line+0x69>
    3017:	b8 00 04 00 00       	mov    $0x400,%eax
    301c:	eb 05                	jmp    3023 <draw_line+0x6e>
    301e:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3023:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    3026:	8b 45 20             	mov    0x20(%ebp),%eax
    3029:	3b 45 18             	cmp    0x18(%ebp),%eax
    302c:	7c 12                	jl     3040 <draw_line+0x8b>
    302e:	8b 45 20             	mov    0x20(%ebp),%eax
    3031:	2b 45 18             	sub    0x18(%ebp),%eax
    3034:	83 c0 01             	add    $0x1,%eax
    3037:	c1 e0 0a             	shl    $0xa,%eax
    303a:	99                   	cltd   
    303b:	f7 7d ec             	idivl  -0x14(%ebp)
    303e:	eb 10                	jmp    3050 <draw_line+0x9b>
    3040:	8b 45 20             	mov    0x20(%ebp),%eax
    3043:	2b 45 18             	sub    0x18(%ebp),%eax
    3046:	83 e8 01             	sub    $0x1,%eax
    3049:	c1 e0 0a             	shl    $0xa,%eax
    304c:	99                   	cltd   
    304d:	f7 7d ec             	idivl  -0x14(%ebp)
    3050:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3053:	eb 4d                	jmp    30a2 <draw_line+0xed>
	}
	else {
		len = dy + 1;
    3055:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3058:	83 c0 01             	add    $0x1,%eax
    305b:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    305e:	8b 45 20             	mov    0x20(%ebp),%eax
    3061:	3b 45 18             	cmp    0x18(%ebp),%eax
    3064:	7e 07                	jle    306d <draw_line+0xb8>
    3066:	b8 00 04 00 00       	mov    $0x400,%eax
    306b:	eb 05                	jmp    3072 <draw_line+0xbd>
    306d:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3072:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    3075:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3078:	3b 45 14             	cmp    0x14(%ebp),%eax
    307b:	7c 12                	jl     308f <draw_line+0xda>
    307d:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3080:	2b 45 14             	sub    0x14(%ebp),%eax
    3083:	83 c0 01             	add    $0x1,%eax
    3086:	c1 e0 0a             	shl    $0xa,%eax
    3089:	99                   	cltd   
    308a:	f7 7d ec             	idivl  -0x14(%ebp)
    308d:	eb 10                	jmp    309f <draw_line+0xea>
    308f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3092:	2b 45 14             	sub    0x14(%ebp),%eax
    3095:	83 e8 01             	sub    $0x1,%eax
    3098:	c1 e0 0a             	shl    $0xa,%eax
    309b:	99                   	cltd   
    309c:	f7 7d ec             	idivl  -0x14(%ebp)
    309f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    30a2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    30a9:	eb 36                	jmp    30e1 <draw_line+0x12c>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    30ab:	0f b7 45 dc          	movzwl -0x24(%ebp),%eax
    30af:	8b 55 f0             	mov    -0x10(%ebp),%edx
    30b2:	c1 fa 0a             	sar    $0xa,%edx
    30b5:	89 d1                	mov    %edx,%ecx
    30b7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    30ba:	c1 fa 0a             	sar    $0xa,%edx
    30bd:	50                   	push   %eax
    30be:	51                   	push   %ecx
    30bf:	52                   	push   %edx
    30c0:	ff 75 10             	pushl  0x10(%ebp)
    30c3:	ff 75 0c             	pushl  0xc(%ebp)
    30c6:	ff 75 08             	pushl  0x8(%ebp)
    30c9:	e8 e2 f7 ff ff       	call   28b0 <draw_point>
    30ce:	83 c4 18             	add    $0x18,%esp
		y += dy;
    30d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    30d4:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    30d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    30da:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    30dd:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    30e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    30e4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    30e7:	7c c2                	jl     30ab <draw_line+0xf6>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    30e9:	c9                   	leave  
    30ea:	c3                   	ret    

000030eb <draw_window>:

void
draw_window(Context c, char *title)
{
    30eb:	55                   	push   %ebp
    30ec:	89 e5                	mov    %esp,%ebp
    30ee:	83 ec 18             	sub    $0x18,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    30f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    30f4:	83 e8 01             	sub    $0x1,%eax
    30f7:	6a 00                	push   $0x0
    30f9:	6a 00                	push   $0x0
    30fb:	50                   	push   %eax
    30fc:	6a 00                	push   $0x0
    30fe:	6a 00                	push   $0x0
    3100:	ff 75 10             	pushl  0x10(%ebp)
    3103:	ff 75 0c             	pushl  0xc(%ebp)
    3106:	ff 75 08             	pushl  0x8(%ebp)
    3109:	e8 a7 fe ff ff       	call   2fb5 <draw_line>
    310e:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    3111:	8b 45 10             	mov    0x10(%ebp),%eax
    3114:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3117:	8b 45 0c             	mov    0xc(%ebp),%eax
    311a:	8d 50 ff             	lea    -0x1(%eax),%edx
    311d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3120:	83 e8 01             	sub    $0x1,%eax
    3123:	6a 00                	push   $0x0
    3125:	51                   	push   %ecx
    3126:	52                   	push   %edx
    3127:	6a 00                	push   $0x0
    3129:	50                   	push   %eax
    312a:	ff 75 10             	pushl  0x10(%ebp)
    312d:	ff 75 0c             	pushl  0xc(%ebp)
    3130:	ff 75 08             	pushl  0x8(%ebp)
    3133:	e8 7d fe ff ff       	call   2fb5 <draw_line>
    3138:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    313b:	8b 45 10             	mov    0x10(%ebp),%eax
    313e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3141:	8b 45 10             	mov    0x10(%ebp),%eax
    3144:	8d 50 ff             	lea    -0x1(%eax),%edx
    3147:	8b 45 0c             	mov    0xc(%ebp),%eax
    314a:	83 e8 01             	sub    $0x1,%eax
    314d:	6a 00                	push   $0x0
    314f:	51                   	push   %ecx
    3150:	6a 00                	push   $0x0
    3152:	52                   	push   %edx
    3153:	50                   	push   %eax
    3154:	ff 75 10             	pushl  0x10(%ebp)
    3157:	ff 75 0c             	pushl  0xc(%ebp)
    315a:	ff 75 08             	pushl  0x8(%ebp)
    315d:	e8 53 fe ff ff       	call   2fb5 <draw_line>
    3162:	83 c4 20             	add    $0x20,%esp
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    3165:	8b 45 10             	mov    0x10(%ebp),%eax
    3168:	83 e8 01             	sub    $0x1,%eax
    316b:	6a 00                	push   $0x0
    316d:	6a 00                	push   $0x0
    316f:	6a 00                	push   $0x0
    3171:	50                   	push   %eax
    3172:	6a 00                	push   $0x0
    3174:	ff 75 10             	pushl  0x10(%ebp)
    3177:	ff 75 0c             	pushl  0xc(%ebp)
    317a:	ff 75 08             	pushl  0x8(%ebp)
    317d:	e8 33 fe ff ff       	call   2fb5 <draw_line>
    3182:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    3185:	8b 45 0c             	mov    0xc(%ebp),%eax
    3188:	83 e8 02             	sub    $0x2,%eax
    318b:	68 cb 5a 00 00       	push   $0x5acb
    3190:	6a 14                	push   $0x14
    3192:	50                   	push   %eax
    3193:	6a 01                	push   $0x1
    3195:	6a 01                	push   $0x1
    3197:	ff 75 10             	pushl  0x10(%ebp)
    319a:	ff 75 0c             	pushl  0xc(%ebp)
    319d:	ff 75 08             	pushl  0x8(%ebp)
    31a0:	e8 4a f7 ff ff       	call   28ef <fill_rect>
    31a5:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    31a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    31ab:	83 e8 02             	sub    $0x2,%eax
    31ae:	89 c2                	mov    %eax,%edx
    31b0:	8b 45 10             	mov    0x10(%ebp),%eax
    31b3:	83 e8 15             	sub    $0x15,%eax
    31b6:	68 cb 5a 00 00       	push   $0x5acb
    31bb:	6a 14                	push   $0x14
    31bd:	52                   	push   %edx
    31be:	50                   	push   %eax
    31bf:	6a 01                	push   $0x1
    31c1:	ff 75 10             	pushl  0x10(%ebp)
    31c4:	ff 75 0c             	pushl  0xc(%ebp)
    31c7:	ff 75 08             	pushl  0x8(%ebp)
    31ca:	e8 20 f7 ff ff       	call   28ef <fill_rect>
    31cf:	83 c4 20             	add    $0x20,%esp

  loadBitmap(&pic, "close.bmp");
    31d2:	83 ec 08             	sub    $0x8,%esp
    31d5:	68 07 af 00 00       	push   $0xaf07
    31da:	8d 45 ec             	lea    -0x14(%ebp),%eax
    31dd:	50                   	push   %eax
    31de:	e8 fb 00 00 00       	call   32de <loadBitmap>
    31e3:	83 c4 10             	add    $0x10,%esp
  draw_picture(c, pic, 3, 3);
    31e6:	6a 03                	push   $0x3
    31e8:	6a 03                	push   $0x3
    31ea:	ff 75 f4             	pushl  -0xc(%ebp)
    31ed:	ff 75 f0             	pushl  -0x10(%ebp)
    31f0:	ff 75 ec             	pushl  -0x14(%ebp)
    31f3:	ff 75 10             	pushl  0x10(%ebp)
    31f6:	ff 75 0c             	pushl  0xc(%ebp)
    31f9:	ff 75 08             	pushl  0x8(%ebp)
    31fc:	e8 f8 fc ff ff       	call   2ef9 <draw_picture>
    3201:	83 c4 20             	add    $0x20,%esp
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    3204:	83 ec 04             	sub    $0x4,%esp
    3207:	6a 02                	push   $0x2
    3209:	6a 19                	push   $0x19
    320b:	68 ff ff 00 00       	push   $0xffff
    3210:	ff 75 14             	pushl  0x14(%ebp)
    3213:	ff 75 10             	pushl  0x10(%ebp)
    3216:	ff 75 0c             	pushl  0xc(%ebp)
    3219:	ff 75 08             	pushl  0x8(%ebp)
    321c:	e8 29 fc ff ff       	call   2e4a <puts_str>
    3221:	83 c4 20             	add    $0x20,%esp
  freepic(&pic);
    3224:	83 ec 0c             	sub    $0xc,%esp
    3227:	8d 45 ec             	lea    -0x14(%ebp),%eax
    322a:	50                   	push   %eax
    322b:	e8 cd 05 00 00       	call   37fd <freepic>
    3230:	83 c4 10             	add    $0x10,%esp
}
    3233:	c9                   	leave  
    3234:	c3                   	ret    

00003235 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    3235:	55                   	push   %ebp
    3236:	89 e5                	mov    %esp,%ebp
    3238:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < len; i++)
    323b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3242:	eb 2c                	jmp    3270 <load_iconlist+0x3b>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    3244:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3247:	6b d0 34             	imul   $0x34,%eax,%edx
    324a:	8b 45 08             	mov    0x8(%ebp),%eax
    324d:	01 d0                	add    %edx,%eax
    324f:	89 c1                	mov    %eax,%ecx
    3251:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3254:	6b d0 34             	imul   $0x34,%eax,%edx
    3257:	8b 45 08             	mov    0x8(%ebp),%eax
    325a:	01 d0                	add    %edx,%eax
    325c:	83 c0 28             	add    $0x28,%eax
    325f:	83 ec 08             	sub    $0x8,%esp
    3262:	51                   	push   %ecx
    3263:	50                   	push   %eax
    3264:	e8 75 00 00 00       	call   32de <loadBitmap>
    3269:	83 c4 10             	add    $0x10,%esp
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    326c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3270:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3273:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3276:	7c cc                	jl     3244 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    3278:	c9                   	leave  
    3279:	c3                   	ret    

0000327a <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    327a:	55                   	push   %ebp
    327b:	89 e5                	mov    %esp,%ebp
    327d:	53                   	push   %ebx
    327e:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; i < len; i++)
    3281:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3288:	eb 47                	jmp    32d1 <draw_iconlist+0x57>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    328a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    328d:	6b d0 34             	imul   $0x34,%eax,%edx
    3290:	8b 45 14             	mov    0x14(%ebp),%eax
    3293:	01 d0                	add    %edx,%eax
    3295:	8b 48 24             	mov    0x24(%eax),%ecx
    3298:	8b 45 f8             	mov    -0x8(%ebp),%eax
    329b:	6b d0 34             	imul   $0x34,%eax,%edx
    329e:	8b 45 14             	mov    0x14(%ebp),%eax
    32a1:	01 d0                	add    %edx,%eax
    32a3:	8b 50 20             	mov    0x20(%eax),%edx
    32a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    32a9:	6b d8 34             	imul   $0x34,%eax,%ebx
    32ac:	8b 45 14             	mov    0x14(%ebp),%eax
    32af:	01 d8                	add    %ebx,%eax
    32b1:	51                   	push   %ecx
    32b2:	52                   	push   %edx
    32b3:	ff 70 30             	pushl  0x30(%eax)
    32b6:	ff 70 2c             	pushl  0x2c(%eax)
    32b9:	ff 70 28             	pushl  0x28(%eax)
    32bc:	ff 75 10             	pushl  0x10(%ebp)
    32bf:	ff 75 0c             	pushl  0xc(%ebp)
    32c2:	ff 75 08             	pushl  0x8(%ebp)
    32c5:	e8 2f fc ff ff       	call   2ef9 <draw_picture>
    32ca:	83 c4 20             	add    $0x20,%esp
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    32cd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    32d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    32d4:	3b 45 18             	cmp    0x18(%ebp),%eax
    32d7:	7c b1                	jl     328a <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    32d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    32dc:	c9                   	leave  
    32dd:	c3                   	ret    

000032de <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    32de:	55                   	push   %ebp
    32df:	89 e5                	mov    %esp,%ebp
    32e1:	81 ec 88 00 00 00    	sub    $0x88,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    32e7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    32ee:	83 ec 08             	sub    $0x8,%esp
    32f1:	6a 00                	push   $0x0
    32f3:	ff 75 0c             	pushl  0xc(%ebp)
    32f6:	e8 43 0f 00 00       	call   423e <open>
    32fb:	83 c4 10             	add    $0x10,%esp
    32fe:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3301:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3305:	79 1a                	jns    3321 <loadBitmap+0x43>
		printf(0, "cannot open %s\n", pic_name);
    3307:	83 ec 04             	sub    $0x4,%esp
    330a:	ff 75 0c             	pushl  0xc(%ebp)
    330d:	68 14 af 00 00       	push   $0xaf14
    3312:	6a 00                	push   $0x0
    3314:	e8 c2 10 00 00       	call   43db <printf>
    3319:	83 c4 10             	add    $0x10,%esp
		return;
    331c:	e9 ca 02 00 00       	jmp    35eb <loadBitmap+0x30d>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    3321:	83 ec 04             	sub    $0x4,%esp
    3324:	ff 75 0c             	pushl  0xc(%ebp)
    3327:	68 24 af 00 00       	push   $0xaf24
    332c:	6a 00                	push   $0x0
    332e:	e8 a8 10 00 00       	call   43db <printf>
    3333:	83 c4 10             	add    $0x10,%esp
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    3336:	83 ec 0c             	sub    $0xc,%esp
    3339:	6a 0e                	push   $0xe
    333b:	e8 6c 13 00 00       	call   46ac <malloc>
    3340:	83 c4 10             	add    $0x10,%esp
    3343:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    3346:	83 ec 04             	sub    $0x4,%esp
    3349:	6a 0e                	push   $0xe
    334b:	ff 75 e4             	pushl  -0x1c(%ebp)
    334e:	ff 75 e8             	pushl  -0x18(%ebp)
    3351:	e8 c0 0e 00 00       	call   4216 <read>
    3356:	83 c4 10             	add    $0x10,%esp
    3359:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    335c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    335f:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    3362:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3365:	0f b7 00             	movzwl (%eax),%eax
    3368:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    336c:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    3370:	66 3d 42 4d          	cmp    $0x4d42,%ax
    3374:	74 17                	je     338d <loadBitmap+0xaf>
		printf(0, "file is not .bmp file!");
    3376:	83 ec 08             	sub    $0x8,%esp
    3379:	68 38 af 00 00       	push   $0xaf38
    337e:	6a 00                	push   $0x0
    3380:	e8 56 10 00 00       	call   43db <printf>
    3385:	83 c4 10             	add    $0x10,%esp
		return;
    3388:	e9 5e 02 00 00       	jmp    35eb <loadBitmap+0x30d>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    338d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3390:	83 c0 02             	add    $0x2,%eax
    3393:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    3396:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3399:	8b 00                	mov    (%eax),%eax
    339b:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    339e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    33a1:	83 c0 06             	add    $0x6,%eax
    33a4:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    33a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    33aa:	0f b7 00             	movzwl (%eax),%eax
    33ad:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    33b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    33b4:	83 c0 08             	add    $0x8,%eax
    33b7:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    33ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
    33bd:	0f b7 00             	movzwl (%eax),%eax
    33c0:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    33c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    33c7:	83 c0 0a             	add    $0xa,%eax
    33ca:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    33cd:	8b 45 d8             	mov    -0x28(%ebp),%eax
    33d0:	8b 00                	mov    (%eax),%eax
    33d2:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    33d5:	83 ec 04             	sub    $0x4,%esp
    33d8:	6a 28                	push   $0x28
    33da:	8d 45 84             	lea    -0x7c(%ebp),%eax
    33dd:	50                   	push   %eax
    33de:	ff 75 e8             	pushl  -0x18(%ebp)
    33e1:	e8 30 0e 00 00       	call   4216 <read>
    33e6:	83 c4 10             	add    $0x10,%esp
	width = bitInfoHead.biWidth;
    33e9:	8b 45 88             	mov    -0x78(%ebp),%eax
    33ec:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    33ef:	8b 45 8c             	mov    -0x74(%ebp),%eax
    33f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    33f5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    33f8:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    33fc:	c1 e0 02             	shl    $0x2,%eax
    33ff:	83 ec 0c             	sub    $0xc,%esp
    3402:	50                   	push   %eax
    3403:	ff 75 d0             	pushl  -0x30(%ebp)
    3406:	ff 75 d4             	pushl  -0x2c(%ebp)
    3409:	68 50 af 00 00       	push   $0xaf50
    340e:	6a 00                	push   $0x0
    3410:	e8 c6 0f 00 00       	call   43db <printf>
    3415:	83 c4 20             	add    $0x20,%esp
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    3418:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    341c:	75 12                	jne    3430 <loadBitmap+0x152>
		printf(0, "0");
    341e:	83 ec 08             	sub    $0x8,%esp
    3421:	68 75 af 00 00       	push   $0xaf75
    3426:	6a 00                	push   $0x0
    3428:	e8 ae 0f 00 00       	call   43db <printf>
    342d:	83 c4 10             	add    $0x10,%esp
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    3430:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3434:	0f b7 c0             	movzwl %ax,%eax
    3437:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    343b:	83 c0 1f             	add    $0x1f,%eax
    343e:	8d 50 1f             	lea    0x1f(%eax),%edx
    3441:	85 c0                	test   %eax,%eax
    3443:	0f 48 c2             	cmovs  %edx,%eax
    3446:	c1 f8 05             	sar    $0x5,%eax
    3449:	c1 e0 02             	shl    $0x2,%eax
    344c:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    344f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3452:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3456:	83 ec 0c             	sub    $0xc,%esp
    3459:	50                   	push   %eax
    345a:	e8 4d 12 00 00       	call   46ac <malloc>
    345f:	83 c4 10             	add    $0x10,%esp
    3462:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    3465:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3468:	8b 45 cc             	mov    -0x34(%ebp),%eax
    346b:	0f af c2             	imul   %edx,%eax
    346e:	83 ec 04             	sub    $0x4,%esp
    3471:	50                   	push   %eax
    3472:	6a 00                	push   $0x0
    3474:	ff 75 c8             	pushl  -0x38(%ebp)
    3477:	e8 e8 0b 00 00       	call   4064 <memset>
    347c:	83 c4 10             	add    $0x10,%esp
	long nData = height * l_width;
    347f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3482:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3486:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    3489:	83 ec 04             	sub    $0x4,%esp
    348c:	ff 75 c4             	pushl  -0x3c(%ebp)
    348f:	ff 75 c8             	pushl  -0x38(%ebp)
    3492:	ff 75 e8             	pushl  -0x18(%ebp)
    3495:	e8 7c 0d 00 00       	call   4216 <read>
    349a:	83 c4 10             	add    $0x10,%esp

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    349d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    34a0:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    34a4:	c1 e0 02             	shl    $0x2,%eax
    34a7:	83 ec 0c             	sub    $0xc,%esp
    34aa:	50                   	push   %eax
    34ab:	e8 fc 11 00 00       	call   46ac <malloc>
    34b0:	83 c4 10             	add    $0x10,%esp
    34b3:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    34b6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    34b9:	8b 45 d0             	mov    -0x30(%ebp),%eax
    34bc:	0f af c2             	imul   %edx,%eax
    34bf:	c1 e0 02             	shl    $0x2,%eax
    34c2:	83 ec 04             	sub    $0x4,%esp
    34c5:	50                   	push   %eax
    34c6:	6a 00                	push   $0x0
    34c8:	ff 75 c0             	pushl  -0x40(%ebp)
    34cb:	e8 94 0b 00 00       	call   4064 <memset>
    34d0:	83 c4 10             	add    $0x10,%esp
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    34d3:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    34d7:	66 83 f8 17          	cmp    $0x17,%ax
    34db:	77 17                	ja     34f4 <loadBitmap+0x216>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    34dd:	83 ec 08             	sub    $0x8,%esp
    34e0:	68 78 af 00 00       	push   $0xaf78
    34e5:	6a 00                	push   $0x0
    34e7:	e8 ef 0e 00 00       	call   43db <printf>
    34ec:	83 c4 10             	add    $0x10,%esp
		return;
    34ef:	e9 f7 00 00 00       	jmp    35eb <loadBitmap+0x30d>
	} else	//位图为24位真彩色
	{
		index = 0;
    34f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    34fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3502:	e9 94 00 00 00       	jmp    359b <loadBitmap+0x2bd>
			for (j = 0; j < width; j++) {
    3507:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    350e:	eb 7b                	jmp    358b <loadBitmap+0x2ad>
				k = i * l_width + j * 3;
    3510:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3513:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3517:	89 c1                	mov    %eax,%ecx
    3519:	8b 55 f0             	mov    -0x10(%ebp),%edx
    351c:	89 d0                	mov    %edx,%eax
    351e:	01 c0                	add    %eax,%eax
    3520:	01 d0                	add    %edx,%eax
    3522:	01 c8                	add    %ecx,%eax
    3524:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    3527:	8b 45 ec             	mov    -0x14(%ebp),%eax
    352a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3531:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3534:	01 c2                	add    %eax,%edx
    3536:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3539:	8d 48 02             	lea    0x2(%eax),%ecx
    353c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    353f:	01 c8                	add    %ecx,%eax
    3541:	0f b6 00             	movzbl (%eax),%eax
    3544:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    3547:	8b 45 ec             	mov    -0x14(%ebp),%eax
    354a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3551:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3554:	01 c2                	add    %eax,%edx
    3556:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3559:	8d 48 01             	lea    0x1(%eax),%ecx
    355c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    355f:	01 c8                	add    %ecx,%eax
    3561:	0f b6 00             	movzbl (%eax),%eax
    3564:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    3567:	8b 45 ec             	mov    -0x14(%ebp),%eax
    356a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3571:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3574:	01 c2                	add    %eax,%edx
    3576:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    3579:	8b 45 c8             	mov    -0x38(%ebp),%eax
    357c:	01 c8                	add    %ecx,%eax
    357e:	0f b6 00             	movzbl (%eax),%eax
    3581:	88 02                	mov    %al,(%edx)
				index++;
    3583:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    3587:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    358b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    358e:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    3591:	0f 8c 79 ff ff ff    	jl     3510 <loadBitmap+0x232>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    3597:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    359b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    359e:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    35a1:	0f 8c 60 ff ff ff    	jl     3507 <loadBitmap+0x229>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    35a7:	83 ec 0c             	sub    $0xc,%esp
    35aa:	ff 75 e8             	pushl  -0x18(%ebp)
    35ad:	e8 74 0c 00 00       	call   4226 <close>
    35b2:	83 c4 10             	add    $0x10,%esp

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    35b5:	8b 45 08             	mov    0x8(%ebp),%eax
    35b8:	8b 55 c0             	mov    -0x40(%ebp),%edx
    35bb:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    35bd:	8b 45 08             	mov    0x8(%ebp),%eax
    35c0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    35c3:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    35c6:	8b 45 08             	mov    0x8(%ebp),%eax
    35c9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    35cc:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    35cf:	83 ec 0c             	sub    $0xc,%esp
    35d2:	ff 75 c8             	pushl  -0x38(%ebp)
    35d5:	e8 91 0f 00 00       	call   456b <free>
    35da:	83 c4 10             	add    $0x10,%esp
	free(BmpFileHeader);
    35dd:	83 ec 0c             	sub    $0xc,%esp
    35e0:	ff 75 e4             	pushl  -0x1c(%ebp)
    35e3:	e8 83 0f 00 00       	call   456b <free>
    35e8:	83 c4 10             	add    $0x10,%esp
	//printf("\n");
}
    35eb:	c9                   	leave  
    35ec:	c3                   	ret    

000035ed <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    35ed:	55                   	push   %ebp
    35ee:	89 e5                	mov    %esp,%ebp
    35f0:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图文件头:\n");
    35f3:	83 ec 08             	sub    $0x8,%esp
    35f6:	68 98 af 00 00       	push   $0xaf98
    35fb:	6a 00                	push   $0x0
    35fd:	e8 d9 0d 00 00       	call   43db <printf>
    3602:	83 c4 10             	add    $0x10,%esp
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    3605:	8b 45 08             	mov    0x8(%ebp),%eax
    3608:	0f b7 00             	movzwl (%eax),%eax
    360b:	0f b7 c0             	movzwl %ax,%eax
    360e:	83 ec 04             	sub    $0x4,%esp
    3611:	50                   	push   %eax
    3612:	68 aa af 00 00       	push   $0xafaa
    3617:	6a 00                	push   $0x0
    3619:	e8 bd 0d 00 00       	call   43db <printf>
    361e:	83 c4 10             	add    $0x10,%esp
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    3621:	8b 45 08             	mov    0x8(%ebp),%eax
    3624:	8b 40 04             	mov    0x4(%eax),%eax
    3627:	83 ec 04             	sub    $0x4,%esp
    362a:	50                   	push   %eax
    362b:	68 c8 af 00 00       	push   $0xafc8
    3630:	6a 00                	push   $0x0
    3632:	e8 a4 0d 00 00       	call   43db <printf>
    3637:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    363a:	8b 45 08             	mov    0x8(%ebp),%eax
    363d:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    3641:	0f b7 c0             	movzwl %ax,%eax
    3644:	83 ec 04             	sub    $0x4,%esp
    3647:	50                   	push   %eax
    3648:	68 d9 af 00 00       	push   $0xafd9
    364d:	6a 00                	push   $0x0
    364f:	e8 87 0d 00 00       	call   43db <printf>
    3654:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    3657:	8b 45 08             	mov    0x8(%ebp),%eax
    365a:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    365e:	0f b7 c0             	movzwl %ax,%eax
    3661:	83 ec 04             	sub    $0x4,%esp
    3664:	50                   	push   %eax
    3665:	68 d9 af 00 00       	push   $0xafd9
    366a:	6a 00                	push   $0x0
    366c:	e8 6a 0d 00 00       	call   43db <printf>
    3671:	83 c4 10             	add    $0x10,%esp
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    3674:	8b 45 08             	mov    0x8(%ebp),%eax
    3677:	8b 40 0c             	mov    0xc(%eax),%eax
    367a:	83 ec 04             	sub    $0x4,%esp
    367d:	50                   	push   %eax
    367e:	68 e8 af 00 00       	push   $0xafe8
    3683:	6a 00                	push   $0x0
    3685:	e8 51 0d 00 00       	call   43db <printf>
    368a:	83 c4 10             	add    $0x10,%esp
}
    368d:	c9                   	leave  
    368e:	c3                   	ret    

0000368f <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    368f:	55                   	push   %ebp
    3690:	89 e5                	mov    %esp,%ebp
    3692:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图信息头:\n");
    3695:	83 ec 08             	sub    $0x8,%esp
    3698:	68 11 b0 00 00       	push   $0xb011
    369d:	6a 00                	push   $0x0
    369f:	e8 37 0d 00 00       	call   43db <printf>
    36a4:	83 c4 10             	add    $0x10,%esp
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    36a7:	8b 45 08             	mov    0x8(%ebp),%eax
    36aa:	8b 00                	mov    (%eax),%eax
    36ac:	83 ec 04             	sub    $0x4,%esp
    36af:	50                   	push   %eax
    36b0:	68 23 b0 00 00       	push   $0xb023
    36b5:	6a 00                	push   $0x0
    36b7:	e8 1f 0d 00 00       	call   43db <printf>
    36bc:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    36bf:	8b 45 08             	mov    0x8(%ebp),%eax
    36c2:	8b 40 04             	mov    0x4(%eax),%eax
    36c5:	83 ec 04             	sub    $0x4,%esp
    36c8:	50                   	push   %eax
    36c9:	68 3a b0 00 00       	push   $0xb03a
    36ce:	6a 00                	push   $0x0
    36d0:	e8 06 0d 00 00       	call   43db <printf>
    36d5:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    36d8:	8b 45 08             	mov    0x8(%ebp),%eax
    36db:	8b 40 08             	mov    0x8(%eax),%eax
    36de:	83 ec 04             	sub    $0x4,%esp
    36e1:	50                   	push   %eax
    36e2:	68 48 b0 00 00       	push   $0xb048
    36e7:	6a 00                	push   $0x0
    36e9:	e8 ed 0c 00 00       	call   43db <printf>
    36ee:	83 c4 10             	add    $0x10,%esp
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    36f1:	8b 45 08             	mov    0x8(%ebp),%eax
    36f4:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    36f8:	0f b7 c0             	movzwl %ax,%eax
    36fb:	83 ec 04             	sub    $0x4,%esp
    36fe:	50                   	push   %eax
    36ff:	68 56 b0 00 00       	push   $0xb056
    3704:	6a 00                	push   $0x0
    3706:	e8 d0 0c 00 00       	call   43db <printf>
    370b:	83 c4 10             	add    $0x10,%esp
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    370e:	8b 45 08             	mov    0x8(%ebp),%eax
    3711:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    3715:	0f b7 c0             	movzwl %ax,%eax
    3718:	83 ec 04             	sub    $0x4,%esp
    371b:	50                   	push   %eax
    371c:	68 6c b0 00 00       	push   $0xb06c
    3721:	6a 00                	push   $0x0
    3723:	e8 b3 0c 00 00       	call   43db <printf>
    3728:	83 c4 10             	add    $0x10,%esp
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    372b:	8b 45 08             	mov    0x8(%ebp),%eax
    372e:	8b 40 10             	mov    0x10(%eax),%eax
    3731:	83 ec 04             	sub    $0x4,%esp
    3734:	50                   	push   %eax
    3735:	68 8d b0 00 00       	push   $0xb08d
    373a:	6a 00                	push   $0x0
    373c:	e8 9a 0c 00 00       	call   43db <printf>
    3741:	83 c4 10             	add    $0x10,%esp
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    3744:	8b 45 08             	mov    0x8(%ebp),%eax
    3747:	8b 40 14             	mov    0x14(%eax),%eax
    374a:	83 ec 04             	sub    $0x4,%esp
    374d:	50                   	push   %eax
    374e:	68 a0 b0 00 00       	push   $0xb0a0
    3753:	6a 00                	push   $0x0
    3755:	e8 81 0c 00 00       	call   43db <printf>
    375a:	83 c4 10             	add    $0x10,%esp
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    375d:	8b 45 08             	mov    0x8(%ebp),%eax
    3760:	8b 40 18             	mov    0x18(%eax),%eax
    3763:	83 ec 04             	sub    $0x4,%esp
    3766:	50                   	push   %eax
    3767:	68 d4 b0 00 00       	push   $0xb0d4
    376c:	6a 00                	push   $0x0
    376e:	e8 68 0c 00 00       	call   43db <printf>
    3773:	83 c4 10             	add    $0x10,%esp
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    3776:	8b 45 08             	mov    0x8(%ebp),%eax
    3779:	8b 40 1c             	mov    0x1c(%eax),%eax
    377c:	83 ec 04             	sub    $0x4,%esp
    377f:	50                   	push   %eax
    3780:	68 e9 b0 00 00       	push   $0xb0e9
    3785:	6a 00                	push   $0x0
    3787:	e8 4f 0c 00 00       	call   43db <printf>
    378c:	83 c4 10             	add    $0x10,%esp
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    378f:	8b 45 08             	mov    0x8(%ebp),%eax
    3792:	8b 40 20             	mov    0x20(%eax),%eax
    3795:	83 ec 04             	sub    $0x4,%esp
    3798:	50                   	push   %eax
    3799:	68 fe b0 00 00       	push   $0xb0fe
    379e:	6a 00                	push   $0x0
    37a0:	e8 36 0c 00 00       	call   43db <printf>
    37a5:	83 c4 10             	add    $0x10,%esp
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    37a8:	8b 45 08             	mov    0x8(%ebp),%eax
    37ab:	8b 40 24             	mov    0x24(%eax),%eax
    37ae:	83 ec 04             	sub    $0x4,%esp
    37b1:	50                   	push   %eax
    37b2:	68 15 b1 00 00       	push   $0xb115
    37b7:	6a 00                	push   $0x0
    37b9:	e8 1d 0c 00 00       	call   43db <printf>
    37be:	83 c4 10             	add    $0x10,%esp
}
    37c1:	c9                   	leave  
    37c2:	c3                   	ret    

000037c3 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    37c3:	55                   	push   %ebp
    37c4:	89 e5                	mov    %esp,%ebp
    37c6:	83 ec 08             	sub    $0x8,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    37c9:	8b 45 08             	mov    0x8(%ebp),%eax
    37cc:	0f b6 00             	movzbl (%eax),%eax
    37cf:	0f b6 c8             	movzbl %al,%ecx
    37d2:	8b 45 08             	mov    0x8(%ebp),%eax
    37d5:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    37d9:	0f b6 d0             	movzbl %al,%edx
    37dc:	8b 45 08             	mov    0x8(%ebp),%eax
    37df:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    37e3:	0f b6 c0             	movzbl %al,%eax
    37e6:	83 ec 0c             	sub    $0xc,%esp
    37e9:	51                   	push   %ecx
    37ea:	52                   	push   %edx
    37eb:	50                   	push   %eax
    37ec:	68 29 b1 00 00       	push   $0xb129
    37f1:	6a 00                	push   $0x0
    37f3:	e8 e3 0b 00 00       	call   43db <printf>
    37f8:	83 c4 20             	add    $0x20,%esp
}
    37fb:	c9                   	leave  
    37fc:	c3                   	ret    

000037fd <freepic>:

void freepic(PICNODE *pic) {
    37fd:	55                   	push   %ebp
    37fe:	89 e5                	mov    %esp,%ebp
    3800:	83 ec 08             	sub    $0x8,%esp
	free(pic->data);
    3803:	8b 45 08             	mov    0x8(%ebp),%eax
    3806:	8b 00                	mov    (%eax),%eax
    3808:	83 ec 0c             	sub    $0xc,%esp
    380b:	50                   	push   %eax
    380c:	e8 5a 0d 00 00       	call   456b <free>
    3811:	83 c4 10             	add    $0x10,%esp
}
    3814:	c9                   	leave  
    3815:	c3                   	ret    

00003816 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    3816:	55                   	push   %ebp
    3817:	89 e5                	mov    %esp,%ebp
    3819:	83 ec 68             	sub    $0x68,%esp
	int W = 15;
    381c:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    3823:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3826:	83 ec 0c             	sub    $0xc,%esp
    3829:	ff 75 ec             	pushl  -0x14(%ebp)
    382c:	ff 75 ec             	pushl  -0x14(%ebp)
    382f:	6a 00                	push   $0x0
    3831:	6a 00                	push   $0x0
    3833:	50                   	push   %eax
    3834:	e8 01 02 00 00       	call   3a3a <initRect>
    3839:	83 c4 1c             	add    $0x1c,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    383c:	8b 45 08             	mov    0x8(%ebp),%eax
    383f:	8b 40 04             	mov    0x4(%eax),%eax
    3842:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3845:	89 c2                	mov    %eax,%edx
    3847:	8d 45 cc             	lea    -0x34(%ebp),%eax
    384a:	83 ec 0c             	sub    $0xc,%esp
    384d:	ff 75 ec             	pushl  -0x14(%ebp)
    3850:	ff 75 ec             	pushl  -0x14(%ebp)
    3853:	6a 00                	push   $0x0
    3855:	52                   	push   %edx
    3856:	50                   	push   %eax
    3857:	e8 de 01 00 00       	call   3a3a <initRect>
    385c:	83 c4 1c             	add    $0x1c,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    385f:	8b 45 08             	mov    0x8(%ebp),%eax
    3862:	8b 40 08             	mov    0x8(%eax),%eax
    3865:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3868:	89 c1                	mov    %eax,%ecx
    386a:	8b 45 08             	mov    0x8(%ebp),%eax
    386d:	8b 40 04             	mov    0x4(%eax),%eax
    3870:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3873:	89 c2                	mov    %eax,%edx
    3875:	8d 45 bc             	lea    -0x44(%ebp),%eax
    3878:	83 ec 0c             	sub    $0xc,%esp
    387b:	ff 75 ec             	pushl  -0x14(%ebp)
    387e:	ff 75 ec             	pushl  -0x14(%ebp)
    3881:	51                   	push   %ecx
    3882:	52                   	push   %edx
    3883:	50                   	push   %eax
    3884:	e8 b1 01 00 00       	call   3a3a <initRect>
    3889:	83 c4 1c             	add    $0x1c,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    388c:	8b 45 08             	mov    0x8(%ebp),%eax
    388f:	8b 40 08             	mov    0x8(%eax),%eax
    3892:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3895:	89 c2                	mov    %eax,%edx
    3897:	8d 45 ac             	lea    -0x54(%ebp),%eax
    389a:	83 ec 0c             	sub    $0xc,%esp
    389d:	ff 75 ec             	pushl  -0x14(%ebp)
    38a0:	ff 75 ec             	pushl  -0x14(%ebp)
    38a3:	52                   	push   %edx
    38a4:	6a 00                	push   $0x0
    38a6:	50                   	push   %eax
    38a7:	e8 8e 01 00 00       	call   3a3a <initRect>
    38ac:	83 c4 1c             	add    $0x1c,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    38af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    38b6:	e9 47 01 00 00       	jmp    3a02 <set_icon_alpha+0x1ec>
		for (j = 0; j < pic->height; j++) {
    38bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    38c2:	e9 28 01 00 00       	jmp    39ef <set_icon_alpha+0x1d9>
			p = initPoint(i, j);
    38c7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    38ca:	83 ec 04             	sub    $0x4,%esp
    38cd:	ff 75 f0             	pushl  -0x10(%ebp)
    38d0:	ff 75 f4             	pushl  -0xc(%ebp)
    38d3:	50                   	push   %eax
    38d4:	e8 3a 01 00 00       	call   3a13 <initPoint>
    38d9:	83 c4 0c             	add    $0xc,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    38dc:	83 ec 08             	sub    $0x8,%esp
    38df:	ff 75 e8             	pushl  -0x18(%ebp)
    38e2:	ff 75 e4             	pushl  -0x1c(%ebp)
    38e5:	ff 75 e0             	pushl  -0x20(%ebp)
    38e8:	ff 75 dc             	pushl  -0x24(%ebp)
    38eb:	ff 75 a8             	pushl  -0x58(%ebp)
    38ee:	ff 75 a4             	pushl  -0x5c(%ebp)
    38f1:	e8 95 01 00 00       	call   3a8b <isIn>
    38f6:	83 c4 20             	add    $0x20,%esp
    38f9:	85 c0                	test   %eax,%eax
    38fb:	75 67                	jne    3964 <set_icon_alpha+0x14e>
    38fd:	83 ec 08             	sub    $0x8,%esp
    3900:	ff 75 d8             	pushl  -0x28(%ebp)
    3903:	ff 75 d4             	pushl  -0x2c(%ebp)
    3906:	ff 75 d0             	pushl  -0x30(%ebp)
    3909:	ff 75 cc             	pushl  -0x34(%ebp)
    390c:	ff 75 a8             	pushl  -0x58(%ebp)
    390f:	ff 75 a4             	pushl  -0x5c(%ebp)
    3912:	e8 74 01 00 00       	call   3a8b <isIn>
    3917:	83 c4 20             	add    $0x20,%esp
    391a:	85 c0                	test   %eax,%eax
    391c:	75 46                	jne    3964 <set_icon_alpha+0x14e>
    391e:	83 ec 08             	sub    $0x8,%esp
    3921:	ff 75 c8             	pushl  -0x38(%ebp)
    3924:	ff 75 c4             	pushl  -0x3c(%ebp)
    3927:	ff 75 c0             	pushl  -0x40(%ebp)
    392a:	ff 75 bc             	pushl  -0x44(%ebp)
    392d:	ff 75 a8             	pushl  -0x58(%ebp)
    3930:	ff 75 a4             	pushl  -0x5c(%ebp)
    3933:	e8 53 01 00 00       	call   3a8b <isIn>
    3938:	83 c4 20             	add    $0x20,%esp
    393b:	85 c0                	test   %eax,%eax
    393d:	75 25                	jne    3964 <set_icon_alpha+0x14e>
    393f:	83 ec 08             	sub    $0x8,%esp
    3942:	ff 75 b8             	pushl  -0x48(%ebp)
    3945:	ff 75 b4             	pushl  -0x4c(%ebp)
    3948:	ff 75 b0             	pushl  -0x50(%ebp)
    394b:	ff 75 ac             	pushl  -0x54(%ebp)
    394e:	ff 75 a8             	pushl  -0x58(%ebp)
    3951:	ff 75 a4             	pushl  -0x5c(%ebp)
    3954:	e8 32 01 00 00       	call   3a8b <isIn>
    3959:	83 c4 20             	add    $0x20,%esp
    395c:	85 c0                	test   %eax,%eax
    395e:	0f 84 87 00 00 00    	je     39eb <set_icon_alpha+0x1d5>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    3964:	8b 45 08             	mov    0x8(%ebp),%eax
    3967:	8b 10                	mov    (%eax),%edx
    3969:	8b 45 08             	mov    0x8(%ebp),%eax
    396c:	8b 40 04             	mov    0x4(%eax),%eax
    396f:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3973:	89 c1                	mov    %eax,%ecx
    3975:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3978:	01 c8                	add    %ecx,%eax
    397a:	c1 e0 02             	shl    $0x2,%eax
    397d:	01 d0                	add    %edx,%eax
    397f:	0f b6 00             	movzbl (%eax),%eax
    3982:	3c ff                	cmp    $0xff,%al
    3984:	75 65                	jne    39eb <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    3986:	8b 45 08             	mov    0x8(%ebp),%eax
    3989:	8b 10                	mov    (%eax),%edx
    398b:	8b 45 08             	mov    0x8(%ebp),%eax
    398e:	8b 40 04             	mov    0x4(%eax),%eax
    3991:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3995:	89 c1                	mov    %eax,%ecx
    3997:	8b 45 f4             	mov    -0xc(%ebp),%eax
    399a:	01 c8                	add    %ecx,%eax
    399c:	c1 e0 02             	shl    $0x2,%eax
    399f:	01 d0                	add    %edx,%eax
    39a1:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    39a5:	3c ff                	cmp    $0xff,%al
    39a7:	75 42                	jne    39eb <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    39a9:	8b 45 08             	mov    0x8(%ebp),%eax
    39ac:	8b 10                	mov    (%eax),%edx
    39ae:	8b 45 08             	mov    0x8(%ebp),%eax
    39b1:	8b 40 04             	mov    0x4(%eax),%eax
    39b4:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    39b8:	89 c1                	mov    %eax,%ecx
    39ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39bd:	01 c8                	add    %ecx,%eax
    39bf:	c1 e0 02             	shl    $0x2,%eax
    39c2:	01 d0                	add    %edx,%eax
    39c4:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    39c8:	3c ff                	cmp    $0xff,%al
    39ca:	75 1f                	jne    39eb <set_icon_alpha+0x1d5>
					pic->data[j * pic->width + i].rgbReserved = 1;
    39cc:	8b 45 08             	mov    0x8(%ebp),%eax
    39cf:	8b 10                	mov    (%eax),%edx
    39d1:	8b 45 08             	mov    0x8(%ebp),%eax
    39d4:	8b 40 04             	mov    0x4(%eax),%eax
    39d7:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    39db:	89 c1                	mov    %eax,%ecx
    39dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39e0:	01 c8                	add    %ecx,%eax
    39e2:	c1 e0 02             	shl    $0x2,%eax
    39e5:	01 d0                	add    %edx,%eax
    39e7:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    39eb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    39ef:	8b 45 08             	mov    0x8(%ebp),%eax
    39f2:	8b 40 08             	mov    0x8(%eax),%eax
    39f5:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    39f8:	0f 8f c9 fe ff ff    	jg     38c7 <set_icon_alpha+0xb1>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    39fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3a02:	8b 45 08             	mov    0x8(%ebp),%eax
    3a05:	8b 40 04             	mov    0x4(%eax),%eax
    3a08:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3a0b:	0f 8f aa fe ff ff    	jg     38bb <set_icon_alpha+0xa5>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    3a11:	c9                   	leave  
    3a12:	c3                   	ret    

00003a13 <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    3a13:	55                   	push   %ebp
    3a14:	89 e5                	mov    %esp,%ebp
    3a16:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    3a19:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a1c:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    3a1f:	8b 45 10             	mov    0x10(%ebp),%eax
    3a22:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    3a25:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3a28:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3a2b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3a2e:	89 01                	mov    %eax,(%ecx)
    3a30:	89 51 04             	mov    %edx,0x4(%ecx)
}
    3a33:	8b 45 08             	mov    0x8(%ebp),%eax
    3a36:	c9                   	leave  
    3a37:	c2 04 00             	ret    $0x4

00003a3a <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    3a3a:	55                   	push   %ebp
    3a3b:	89 e5                	mov    %esp,%ebp
    3a3d:	83 ec 18             	sub    $0x18,%esp
	Rect r;
	r.start = initPoint(x, y);
    3a40:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3a43:	ff 75 10             	pushl  0x10(%ebp)
    3a46:	ff 75 0c             	pushl  0xc(%ebp)
    3a49:	50                   	push   %eax
    3a4a:	e8 c4 ff ff ff       	call   3a13 <initPoint>
    3a4f:	83 c4 08             	add    $0x8,%esp
    3a52:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3a55:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3a58:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3a5b:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    3a5e:	8b 45 14             	mov    0x14(%ebp),%eax
    3a61:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    3a64:	8b 45 18             	mov    0x18(%ebp),%eax
    3a67:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    3a6a:	8b 45 08             	mov    0x8(%ebp),%eax
    3a6d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3a70:	89 10                	mov    %edx,(%eax)
    3a72:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3a75:	89 50 04             	mov    %edx,0x4(%eax)
    3a78:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3a7b:	89 50 08             	mov    %edx,0x8(%eax)
    3a7e:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3a81:	89 50 0c             	mov    %edx,0xc(%eax)
}
    3a84:	8b 45 08             	mov    0x8(%ebp),%eax
    3a87:	c9                   	leave  
    3a88:	c2 04 00             	ret    $0x4

00003a8b <isIn>:

int isIn(Point p, Rect r)
{
    3a8b:	55                   	push   %ebp
    3a8c:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3a8e:	8b 55 08             	mov    0x8(%ebp),%edx
    3a91:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3a94:	39 c2                	cmp    %eax,%edx
    3a96:	7c 2f                	jl     3ac7 <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3a98:	8b 45 08             	mov    0x8(%ebp),%eax
    3a9b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3a9e:	8b 55 18             	mov    0x18(%ebp),%edx
    3aa1:	01 ca                	add    %ecx,%edx
    3aa3:	39 d0                	cmp    %edx,%eax
    3aa5:	7d 20                	jge    3ac7 <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3aa7:	8b 55 0c             	mov    0xc(%ebp),%edx
    3aaa:	8b 45 14             	mov    0x14(%ebp),%eax
    3aad:	39 c2                	cmp    %eax,%edx
    3aaf:	7c 16                	jl     3ac7 <isIn+0x3c>
    3ab1:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ab4:	8b 4d 14             	mov    0x14(%ebp),%ecx
    3ab7:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3aba:	01 ca                	add    %ecx,%edx
    3abc:	39 d0                	cmp    %edx,%eax
    3abe:	7d 07                	jge    3ac7 <isIn+0x3c>
    3ac0:	b8 01 00 00 00       	mov    $0x1,%eax
    3ac5:	eb 05                	jmp    3acc <isIn+0x41>
    3ac7:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3acc:	5d                   	pop    %ebp
    3acd:	c3                   	ret    

00003ace <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    3ace:	55                   	push   %ebp
    3acf:	89 e5                	mov    %esp,%ebp
    3ad1:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    3ad4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    3adb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    3ae2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    3ae9:	8b 45 10             	mov    0x10(%ebp),%eax
    3aec:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    3aef:	8b 45 14             	mov    0x14(%ebp),%eax
    3af2:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    3af5:	8b 45 08             	mov    0x8(%ebp),%eax
    3af8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3afb:	89 10                	mov    %edx,(%eax)
    3afd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3b00:	89 50 04             	mov    %edx,0x4(%eax)
    3b03:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3b06:	89 50 08             	mov    %edx,0x8(%eax)
    3b09:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3b0c:	89 50 0c             	mov    %edx,0xc(%eax)
    3b0f:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3b12:	89 50 10             	mov    %edx,0x10(%eax)
}
    3b15:	8b 45 08             	mov    0x8(%ebp),%eax
    3b18:	c9                   	leave  
    3b19:	c2 04 00             	ret    $0x4

00003b1c <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    3b1c:	55                   	push   %ebp
    3b1d:	89 e5                	mov    %esp,%ebp
    3b1f:	83 ec 08             	sub    $0x8,%esp
	switch (MsgType)
    3b22:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3b25:	83 f8 03             	cmp    $0x3,%eax
    3b28:	74 4f                	je     3b79 <createClickable+0x5d>
    3b2a:	83 f8 04             	cmp    $0x4,%eax
    3b2d:	74 07                	je     3b36 <createClickable+0x1a>
    3b2f:	83 f8 02             	cmp    $0x2,%eax
    3b32:	74 25                	je     3b59 <createClickable+0x3d>
    3b34:	eb 66                	jmp    3b9c <createClickable+0x80>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    3b36:	8b 45 08             	mov    0x8(%ebp),%eax
    3b39:	83 c0 04             	add    $0x4,%eax
    3b3c:	83 ec 08             	sub    $0x8,%esp
    3b3f:	ff 75 20             	pushl  0x20(%ebp)
    3b42:	ff 75 18             	pushl  0x18(%ebp)
    3b45:	ff 75 14             	pushl  0x14(%ebp)
    3b48:	ff 75 10             	pushl  0x10(%ebp)
    3b4b:	ff 75 0c             	pushl  0xc(%ebp)
    3b4e:	50                   	push   %eax
    3b4f:	e8 5d 00 00 00       	call   3bb1 <addClickable>
    3b54:	83 c4 20             	add    $0x20,%esp
	        break;
    3b57:	eb 56                	jmp    3baf <createClickable+0x93>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    3b59:	8b 45 08             	mov    0x8(%ebp),%eax
    3b5c:	83 ec 08             	sub    $0x8,%esp
    3b5f:	ff 75 20             	pushl  0x20(%ebp)
    3b62:	ff 75 18             	pushl  0x18(%ebp)
    3b65:	ff 75 14             	pushl  0x14(%ebp)
    3b68:	ff 75 10             	pushl  0x10(%ebp)
    3b6b:	ff 75 0c             	pushl  0xc(%ebp)
    3b6e:	50                   	push   %eax
    3b6f:	e8 3d 00 00 00       	call   3bb1 <addClickable>
    3b74:	83 c4 20             	add    $0x20,%esp
	    	break;
    3b77:	eb 36                	jmp    3baf <createClickable+0x93>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    3b79:	8b 45 08             	mov    0x8(%ebp),%eax
    3b7c:	83 c0 08             	add    $0x8,%eax
    3b7f:	83 ec 08             	sub    $0x8,%esp
    3b82:	ff 75 20             	pushl  0x20(%ebp)
    3b85:	ff 75 18             	pushl  0x18(%ebp)
    3b88:	ff 75 14             	pushl  0x14(%ebp)
    3b8b:	ff 75 10             	pushl  0x10(%ebp)
    3b8e:	ff 75 0c             	pushl  0xc(%ebp)
    3b91:	50                   	push   %eax
    3b92:	e8 1a 00 00 00       	call   3bb1 <addClickable>
    3b97:	83 c4 20             	add    $0x20,%esp
	    	break;
    3b9a:	eb 13                	jmp    3baf <createClickable+0x93>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    3b9c:	83 ec 08             	sub    $0x8,%esp
    3b9f:	68 38 b1 00 00       	push   $0xb138
    3ba4:	6a 00                	push   $0x0
    3ba6:	e8 30 08 00 00       	call   43db <printf>
    3bab:	83 c4 10             	add    $0x10,%esp
	    	break;
    3bae:	90                   	nop
	}
}
    3baf:	c9                   	leave  
    3bb0:	c3                   	ret    

00003bb1 <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    3bb1:	55                   	push   %ebp
    3bb2:	89 e5                	mov    %esp,%ebp
    3bb4:	83 ec 18             	sub    $0x18,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    3bb7:	83 ec 0c             	sub    $0xc,%esp
    3bba:	6a 18                	push   $0x18
    3bbc:	e8 eb 0a 00 00       	call   46ac <malloc>
    3bc1:	83 c4 10             	add    $0x10,%esp
    3bc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    3bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bca:	8b 55 0c             	mov    0xc(%ebp),%edx
    3bcd:	89 10                	mov    %edx,(%eax)
    3bcf:	8b 55 10             	mov    0x10(%ebp),%edx
    3bd2:	89 50 04             	mov    %edx,0x4(%eax)
    3bd5:	8b 55 14             	mov    0x14(%ebp),%edx
    3bd8:	89 50 08             	mov    %edx,0x8(%eax)
    3bdb:	8b 55 18             	mov    0x18(%ebp),%edx
    3bde:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    3be1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3be4:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3be7:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    3bea:	8b 45 08             	mov    0x8(%ebp),%eax
    3bed:	8b 10                	mov    (%eax),%edx
    3bef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bf2:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    3bf5:	8b 45 08             	mov    0x8(%ebp),%eax
    3bf8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3bfb:	89 10                	mov    %edx,(%eax)
}
    3bfd:	c9                   	leave  
    3bfe:	c3                   	ret    

00003bff <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    3bff:	55                   	push   %ebp
    3c00:	89 e5                	mov    %esp,%ebp
    3c02:	83 ec 18             	sub    $0x18,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    3c05:	8b 45 08             	mov    0x8(%ebp),%eax
    3c08:	8b 00                	mov    (%eax),%eax
    3c0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3c0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c10:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3c13:	e9 ad 00 00 00       	jmp    3cc5 <deleteClickable+0xc6>
	{
		if (isIn(cur->area.start, region))
    3c18:	ff 75 18             	pushl  0x18(%ebp)
    3c1b:	ff 75 14             	pushl  0x14(%ebp)
    3c1e:	ff 75 10             	pushl  0x10(%ebp)
    3c21:	ff 75 0c             	pushl  0xc(%ebp)
    3c24:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c27:	ff 70 04             	pushl  0x4(%eax)
    3c2a:	ff 30                	pushl  (%eax)
    3c2c:	e8 5a fe ff ff       	call   3a8b <isIn>
    3c31:	83 c4 18             	add    $0x18,%esp
    3c34:	85 c0                	test   %eax,%eax
    3c36:	74 66                	je     3c9e <deleteClickable+0x9f>
		{
			//如果当前指针指向头部
			if (cur == *head)
    3c38:	8b 45 08             	mov    0x8(%ebp),%eax
    3c3b:	8b 00                	mov    (%eax),%eax
    3c3d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3c40:	75 31                	jne    3c73 <deleteClickable+0x74>
			{
				//删除头节点
				temp = *head;
    3c42:	8b 45 08             	mov    0x8(%ebp),%eax
    3c45:	8b 00                	mov    (%eax),%eax
    3c47:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    3c4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c4d:	8b 50 14             	mov    0x14(%eax),%edx
    3c50:	8b 45 08             	mov    0x8(%ebp),%eax
    3c53:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    3c55:	8b 45 08             	mov    0x8(%ebp),%eax
    3c58:	8b 00                	mov    (%eax),%eax
    3c5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3c5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c60:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3c63:	83 ec 0c             	sub    $0xc,%esp
    3c66:	ff 75 ec             	pushl  -0x14(%ebp)
    3c69:	e8 fd 08 00 00       	call   456b <free>
    3c6e:	83 c4 10             	add    $0x10,%esp
    3c71:	eb 52                	jmp    3cc5 <deleteClickable+0xc6>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    3c73:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c76:	8b 50 14             	mov    0x14(%eax),%edx
    3c79:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c7c:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    3c7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c82:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    3c85:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c88:	8b 40 14             	mov    0x14(%eax),%eax
    3c8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3c8e:	83 ec 0c             	sub    $0xc,%esp
    3c91:	ff 75 ec             	pushl  -0x14(%ebp)
    3c94:	e8 d2 08 00 00       	call   456b <free>
    3c99:	83 c4 10             	add    $0x10,%esp
    3c9c:	eb 27                	jmp    3cc5 <deleteClickable+0xc6>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    3c9e:	8b 45 08             	mov    0x8(%ebp),%eax
    3ca1:	8b 00                	mov    (%eax),%eax
    3ca3:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3ca6:	75 0b                	jne    3cb3 <deleteClickable+0xb4>
			{
				cur = cur->next;
    3ca8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3cab:	8b 40 14             	mov    0x14(%eax),%eax
    3cae:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3cb1:	eb 12                	jmp    3cc5 <deleteClickable+0xc6>
			}
			else
			{
				cur = cur->next;
    3cb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3cb6:	8b 40 14             	mov    0x14(%eax),%eax
    3cb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    3cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cbf:	8b 40 14             	mov    0x14(%eax),%eax
    3cc2:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    3cc5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3cc9:	0f 85 49 ff ff ff    	jne    3c18 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    3ccf:	c9                   	leave  
    3cd0:	c3                   	ret    

00003cd1 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    3cd1:	55                   	push   %ebp
    3cd2:	89 e5                	mov    %esp,%ebp
    3cd4:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    3cd7:	8b 45 08             	mov    0x8(%ebp),%eax
    3cda:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3cdd:	eb 4e                	jmp    3d2d <executeHandler+0x5c>
	{
		if (isIn(click, cur->area))
    3cdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ce2:	ff 70 0c             	pushl  0xc(%eax)
    3ce5:	ff 70 08             	pushl  0x8(%eax)
    3ce8:	ff 70 04             	pushl  0x4(%eax)
    3ceb:	ff 30                	pushl  (%eax)
    3ced:	ff 75 10             	pushl  0x10(%ebp)
    3cf0:	ff 75 0c             	pushl  0xc(%ebp)
    3cf3:	e8 93 fd ff ff       	call   3a8b <isIn>
    3cf8:	83 c4 18             	add    $0x18,%esp
    3cfb:	85 c0                	test   %eax,%eax
    3cfd:	74 25                	je     3d24 <executeHandler+0x53>
		{
			isSearching = 0;
    3cff:	c7 05 40 26 01 00 00 	movl   $0x0,0x12640
    3d06:	00 00 00 
			cur->handler(click);
    3d09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d0c:	8b 40 10             	mov    0x10(%eax),%eax
    3d0f:	83 ec 08             	sub    $0x8,%esp
    3d12:	ff 75 10             	pushl  0x10(%ebp)
    3d15:	ff 75 0c             	pushl  0xc(%ebp)
    3d18:	ff d0                	call   *%eax
    3d1a:	83 c4 10             	add    $0x10,%esp
			return 1;
    3d1d:	b8 01 00 00 00       	mov    $0x1,%eax
    3d22:	eb 30                	jmp    3d54 <executeHandler+0x83>
		}
		cur = cur->next;
    3d24:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d27:	8b 40 14             	mov    0x14(%eax),%eax
    3d2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    3d2d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3d31:	75 ac                	jne    3cdf <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    3d33:	c7 05 40 26 01 00 00 	movl   $0x0,0x12640
    3d3a:	00 00 00 
	printf(0, "execute: none!\n");
    3d3d:	83 ec 08             	sub    $0x8,%esp
    3d40:	68 66 b1 00 00       	push   $0xb166
    3d45:	6a 00                	push   $0x0
    3d47:	e8 8f 06 00 00       	call   43db <printf>
    3d4c:	83 c4 10             	add    $0x10,%esp
	return 0;
    3d4f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3d54:	c9                   	leave  
    3d55:	c3                   	ret    

00003d56 <printClickable>:

void printClickable(Clickable *c)
{
    3d56:	55                   	push   %ebp
    3d57:	89 e5                	mov    %esp,%ebp
    3d59:	53                   	push   %ebx
    3d5a:	83 ec 04             	sub    $0x4,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    3d5d:	8b 45 08             	mov    0x8(%ebp),%eax
    3d60:	8b 58 0c             	mov    0xc(%eax),%ebx
    3d63:	8b 45 08             	mov    0x8(%ebp),%eax
    3d66:	8b 48 08             	mov    0x8(%eax),%ecx
    3d69:	8b 45 08             	mov    0x8(%ebp),%eax
    3d6c:	8b 50 04             	mov    0x4(%eax),%edx
    3d6f:	8b 45 08             	mov    0x8(%ebp),%eax
    3d72:	8b 00                	mov    (%eax),%eax
    3d74:	83 ec 08             	sub    $0x8,%esp
    3d77:	53                   	push   %ebx
    3d78:	51                   	push   %ecx
    3d79:	52                   	push   %edx
    3d7a:	50                   	push   %eax
    3d7b:	68 76 b1 00 00       	push   $0xb176
    3d80:	6a 00                	push   $0x0
    3d82:	e8 54 06 00 00       	call   43db <printf>
    3d87:	83 c4 20             	add    $0x20,%esp
}
    3d8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3d8d:	c9                   	leave  
    3d8e:	c3                   	ret    

00003d8f <printClickableList>:

void printClickableList(Clickable *head)
{
    3d8f:	55                   	push   %ebp
    3d90:	89 e5                	mov    %esp,%ebp
    3d92:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    3d95:	8b 45 08             	mov    0x8(%ebp),%eax
    3d98:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    3d9b:	83 ec 08             	sub    $0x8,%esp
    3d9e:	68 88 b1 00 00       	push   $0xb188
    3da3:	6a 00                	push   $0x0
    3da5:	e8 31 06 00 00       	call   43db <printf>
    3daa:	83 c4 10             	add    $0x10,%esp
	while(cur != 0)
    3dad:	eb 17                	jmp    3dc6 <printClickableList+0x37>
	{
		printClickable(cur);
    3daf:	83 ec 0c             	sub    $0xc,%esp
    3db2:	ff 75 f4             	pushl  -0xc(%ebp)
    3db5:	e8 9c ff ff ff       	call   3d56 <printClickable>
    3dba:	83 c4 10             	add    $0x10,%esp
		cur = cur->next;
    3dbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3dc0:	8b 40 14             	mov    0x14(%eax),%eax
    3dc3:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    3dc6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3dca:	75 e3                	jne    3daf <printClickableList+0x20>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    3dcc:	83 ec 08             	sub    $0x8,%esp
    3dcf:	68 99 b1 00 00       	push   $0xb199
    3dd4:	6a 00                	push   $0x0
    3dd6:	e8 00 06 00 00       	call   43db <printf>
    3ddb:	83 c4 10             	add    $0x10,%esp
}
    3dde:	c9                   	leave  
    3ddf:	c3                   	ret    

00003de0 <testHanler>:

void testHanler(struct Point p)
{
    3de0:	55                   	push   %ebp
    3de1:	89 e5                	mov    %esp,%ebp
    3de3:	83 ec 08             	sub    $0x8,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    3de6:	8b 55 0c             	mov    0xc(%ebp),%edx
    3de9:	8b 45 08             	mov    0x8(%ebp),%eax
    3dec:	52                   	push   %edx
    3ded:	50                   	push   %eax
    3dee:	68 9b b1 00 00       	push   $0xb19b
    3df3:	6a 00                	push   $0x0
    3df5:	e8 e1 05 00 00       	call   43db <printf>
    3dfa:	83 c4 10             	add    $0x10,%esp
}
    3dfd:	c9                   	leave  
    3dfe:	c3                   	ret    

00003dff <testClickable>:
void testClickable(struct Context c)
{
    3dff:	55                   	push   %ebp
    3e00:	89 e5                	mov    %esp,%ebp
    3e02:	83 ec 78             	sub    $0x78,%esp
	ClickableManager cm = initClickManager(c);
    3e05:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3e08:	ff 75 10             	pushl  0x10(%ebp)
    3e0b:	ff 75 0c             	pushl  0xc(%ebp)
    3e0e:	ff 75 08             	pushl  0x8(%ebp)
    3e11:	50                   	push   %eax
    3e12:	e8 b7 fc ff ff       	call   3ace <initClickManager>
    3e17:	83 c4 0c             	add    $0xc,%esp

	Rect r1 = initRect(5,5,20,20);
    3e1a:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    3e1d:	83 ec 04             	sub    $0x4,%esp
    3e20:	6a 14                	push   $0x14
    3e22:	6a 14                	push   $0x14
    3e24:	6a 05                	push   $0x5
    3e26:	6a 05                	push   $0x5
    3e28:	50                   	push   %eax
    3e29:	e8 0c fc ff ff       	call   3a3a <initRect>
    3e2e:	83 c4 14             	add    $0x14,%esp
	Rect r2 = initRect(20,20,20,20);
    3e31:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    3e34:	83 ec 04             	sub    $0x4,%esp
    3e37:	6a 14                	push   $0x14
    3e39:	6a 14                	push   $0x14
    3e3b:	6a 14                	push   $0x14
    3e3d:	6a 14                	push   $0x14
    3e3f:	50                   	push   %eax
    3e40:	e8 f5 fb ff ff       	call   3a3a <initRect>
    3e45:	83 c4 14             	add    $0x14,%esp
	Rect r3 = initRect(50,50,15,15);
    3e48:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    3e4b:	83 ec 04             	sub    $0x4,%esp
    3e4e:	6a 0f                	push   $0xf
    3e50:	6a 0f                	push   $0xf
    3e52:	6a 32                	push   $0x32
    3e54:	6a 32                	push   $0x32
    3e56:	50                   	push   %eax
    3e57:	e8 de fb ff ff       	call   3a3a <initRect>
    3e5c:	83 c4 14             	add    $0x14,%esp
	Rect r4 = initRect(0,0,30,30);
    3e5f:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3e62:	83 ec 04             	sub    $0x4,%esp
    3e65:	6a 1e                	push   $0x1e
    3e67:	6a 1e                	push   $0x1e
    3e69:	6a 00                	push   $0x0
    3e6b:	6a 00                	push   $0x0
    3e6d:	50                   	push   %eax
    3e6e:	e8 c7 fb ff ff       	call   3a3a <initRect>
    3e73:	83 c4 14             	add    $0x14,%esp
	Point p1 = initPoint(23, 23);
    3e76:	8d 45 9c             	lea    -0x64(%ebp),%eax
    3e79:	83 ec 04             	sub    $0x4,%esp
    3e7c:	6a 17                	push   $0x17
    3e7e:	6a 17                	push   $0x17
    3e80:	50                   	push   %eax
    3e81:	e8 8d fb ff ff       	call   3a13 <initPoint>
    3e86:	83 c4 0c             	add    $0xc,%esp
	Point p2 = initPoint(70, 70);
    3e89:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3e8c:	83 ec 04             	sub    $0x4,%esp
    3e8f:	6a 46                	push   $0x46
    3e91:	6a 46                	push   $0x46
    3e93:	50                   	push   %eax
    3e94:	e8 7a fb ff ff       	call   3a13 <initPoint>
    3e99:	83 c4 0c             	add    $0xc,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    3e9c:	83 ec 04             	sub    $0x4,%esp
    3e9f:	68 e0 3d 00 00       	push   $0x3de0
    3ea4:	6a 02                	push   $0x2
    3ea6:	ff 75 e0             	pushl  -0x20(%ebp)
    3ea9:	ff 75 dc             	pushl  -0x24(%ebp)
    3eac:	ff 75 d8             	pushl  -0x28(%ebp)
    3eaf:	ff 75 d4             	pushl  -0x2c(%ebp)
    3eb2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3eb5:	50                   	push   %eax
    3eb6:	e8 61 fc ff ff       	call   3b1c <createClickable>
    3ebb:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3ebe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ec1:	83 ec 04             	sub    $0x4,%esp
    3ec4:	50                   	push   %eax
    3ec5:	68 af b1 00 00       	push   $0xb1af
    3eca:	6a 00                	push   $0x0
    3ecc:	e8 0a 05 00 00       	call   43db <printf>
    3ed1:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    3ed4:	83 ec 04             	sub    $0x4,%esp
    3ed7:	68 e0 3d 00 00       	push   $0x3de0
    3edc:	6a 02                	push   $0x2
    3ede:	ff 75 d0             	pushl  -0x30(%ebp)
    3ee1:	ff 75 cc             	pushl  -0x34(%ebp)
    3ee4:	ff 75 c8             	pushl  -0x38(%ebp)
    3ee7:	ff 75 c4             	pushl  -0x3c(%ebp)
    3eea:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3eed:	50                   	push   %eax
    3eee:	e8 29 fc ff ff       	call   3b1c <createClickable>
    3ef3:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3ef6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ef9:	83 ec 04             	sub    $0x4,%esp
    3efc:	50                   	push   %eax
    3efd:	68 af b1 00 00       	push   $0xb1af
    3f02:	6a 00                	push   $0x0
    3f04:	e8 d2 04 00 00       	call   43db <printf>
    3f09:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    3f0c:	83 ec 04             	sub    $0x4,%esp
    3f0f:	68 e0 3d 00 00       	push   $0x3de0
    3f14:	6a 02                	push   $0x2
    3f16:	ff 75 c0             	pushl  -0x40(%ebp)
    3f19:	ff 75 bc             	pushl  -0x44(%ebp)
    3f1c:	ff 75 b8             	pushl  -0x48(%ebp)
    3f1f:	ff 75 b4             	pushl  -0x4c(%ebp)
    3f22:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3f25:	50                   	push   %eax
    3f26:	e8 f1 fb ff ff       	call   3b1c <createClickable>
    3f2b:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3f2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f31:	83 ec 04             	sub    $0x4,%esp
    3f34:	50                   	push   %eax
    3f35:	68 af b1 00 00       	push   $0xb1af
    3f3a:	6a 00                	push   $0x0
    3f3c:	e8 9a 04 00 00       	call   43db <printf>
    3f41:	83 c4 10             	add    $0x10,%esp
	printClickableList(cm.left_click);
    3f44:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f47:	83 ec 0c             	sub    $0xc,%esp
    3f4a:	50                   	push   %eax
    3f4b:	e8 3f fe ff ff       	call   3d8f <printClickableList>
    3f50:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p1);
    3f53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f56:	83 ec 04             	sub    $0x4,%esp
    3f59:	ff 75 a0             	pushl  -0x60(%ebp)
    3f5c:	ff 75 9c             	pushl  -0x64(%ebp)
    3f5f:	50                   	push   %eax
    3f60:	e8 6c fd ff ff       	call   3cd1 <executeHandler>
    3f65:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p2);
    3f68:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f6b:	83 ec 04             	sub    $0x4,%esp
    3f6e:	ff 75 98             	pushl  -0x68(%ebp)
    3f71:	ff 75 94             	pushl  -0x6c(%ebp)
    3f74:	50                   	push   %eax
    3f75:	e8 57 fd ff ff       	call   3cd1 <executeHandler>
    3f7a:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, r4);
    3f7d:	83 ec 0c             	sub    $0xc,%esp
    3f80:	ff 75 b0             	pushl  -0x50(%ebp)
    3f83:	ff 75 ac             	pushl  -0x54(%ebp)
    3f86:	ff 75 a8             	pushl  -0x58(%ebp)
    3f89:	ff 75 a4             	pushl  -0x5c(%ebp)
    3f8c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3f8f:	50                   	push   %eax
    3f90:	e8 6a fc ff ff       	call   3bff <deleteClickable>
    3f95:	83 c4 20             	add    $0x20,%esp
	printClickableList(cm.left_click);
    3f98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f9b:	83 ec 0c             	sub    $0xc,%esp
    3f9e:	50                   	push   %eax
    3f9f:	e8 eb fd ff ff       	call   3d8f <printClickableList>
    3fa4:	83 c4 10             	add    $0x10,%esp
}
    3fa7:	c9                   	leave  
    3fa8:	c3                   	ret    

00003fa9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3fa9:	55                   	push   %ebp
    3faa:	89 e5                	mov    %esp,%ebp
    3fac:	57                   	push   %edi
    3fad:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3fae:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3fb1:	8b 55 10             	mov    0x10(%ebp),%edx
    3fb4:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fb7:	89 cb                	mov    %ecx,%ebx
    3fb9:	89 df                	mov    %ebx,%edi
    3fbb:	89 d1                	mov    %edx,%ecx
    3fbd:	fc                   	cld    
    3fbe:	f3 aa                	rep stos %al,%es:(%edi)
    3fc0:	89 ca                	mov    %ecx,%edx
    3fc2:	89 fb                	mov    %edi,%ebx
    3fc4:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3fc7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3fca:	5b                   	pop    %ebx
    3fcb:	5f                   	pop    %edi
    3fcc:	5d                   	pop    %ebp
    3fcd:	c3                   	ret    

00003fce <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3fce:	55                   	push   %ebp
    3fcf:	89 e5                	mov    %esp,%ebp
    3fd1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3fd4:	8b 45 08             	mov    0x8(%ebp),%eax
    3fd7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3fda:	90                   	nop
    3fdb:	8b 45 08             	mov    0x8(%ebp),%eax
    3fde:	8d 50 01             	lea    0x1(%eax),%edx
    3fe1:	89 55 08             	mov    %edx,0x8(%ebp)
    3fe4:	8b 55 0c             	mov    0xc(%ebp),%edx
    3fe7:	8d 4a 01             	lea    0x1(%edx),%ecx
    3fea:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3fed:	0f b6 12             	movzbl (%edx),%edx
    3ff0:	88 10                	mov    %dl,(%eax)
    3ff2:	0f b6 00             	movzbl (%eax),%eax
    3ff5:	84 c0                	test   %al,%al
    3ff7:	75 e2                	jne    3fdb <strcpy+0xd>
    ;
  return os;
    3ff9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3ffc:	c9                   	leave  
    3ffd:	c3                   	ret    

00003ffe <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3ffe:	55                   	push   %ebp
    3fff:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    4001:	eb 08                	jmp    400b <strcmp+0xd>
    p++, q++;
    4003:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4007:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    400b:	8b 45 08             	mov    0x8(%ebp),%eax
    400e:	0f b6 00             	movzbl (%eax),%eax
    4011:	84 c0                	test   %al,%al
    4013:	74 10                	je     4025 <strcmp+0x27>
    4015:	8b 45 08             	mov    0x8(%ebp),%eax
    4018:	0f b6 10             	movzbl (%eax),%edx
    401b:	8b 45 0c             	mov    0xc(%ebp),%eax
    401e:	0f b6 00             	movzbl (%eax),%eax
    4021:	38 c2                	cmp    %al,%dl
    4023:	74 de                	je     4003 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    4025:	8b 45 08             	mov    0x8(%ebp),%eax
    4028:	0f b6 00             	movzbl (%eax),%eax
    402b:	0f b6 d0             	movzbl %al,%edx
    402e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4031:	0f b6 00             	movzbl (%eax),%eax
    4034:	0f b6 c0             	movzbl %al,%eax
    4037:	29 c2                	sub    %eax,%edx
    4039:	89 d0                	mov    %edx,%eax
}
    403b:	5d                   	pop    %ebp
    403c:	c3                   	ret    

0000403d <strlen>:

uint
strlen(char *s)
{
    403d:	55                   	push   %ebp
    403e:	89 e5                	mov    %esp,%ebp
    4040:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    4043:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    404a:	eb 04                	jmp    4050 <strlen+0x13>
    404c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    4050:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4053:	8b 45 08             	mov    0x8(%ebp),%eax
    4056:	01 d0                	add    %edx,%eax
    4058:	0f b6 00             	movzbl (%eax),%eax
    405b:	84 c0                	test   %al,%al
    405d:	75 ed                	jne    404c <strlen+0xf>
    ;
  return n;
    405f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4062:	c9                   	leave  
    4063:	c3                   	ret    

00004064 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4064:	55                   	push   %ebp
    4065:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    4067:	8b 45 10             	mov    0x10(%ebp),%eax
    406a:	50                   	push   %eax
    406b:	ff 75 0c             	pushl  0xc(%ebp)
    406e:	ff 75 08             	pushl  0x8(%ebp)
    4071:	e8 33 ff ff ff       	call   3fa9 <stosb>
    4076:	83 c4 0c             	add    $0xc,%esp
  return dst;
    4079:	8b 45 08             	mov    0x8(%ebp),%eax
}
    407c:	c9                   	leave  
    407d:	c3                   	ret    

0000407e <strchr>:

char*
strchr(const char *s, char c)
{
    407e:	55                   	push   %ebp
    407f:	89 e5                	mov    %esp,%ebp
    4081:	83 ec 04             	sub    $0x4,%esp
    4084:	8b 45 0c             	mov    0xc(%ebp),%eax
    4087:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    408a:	eb 14                	jmp    40a0 <strchr+0x22>
    if(*s == c)
    408c:	8b 45 08             	mov    0x8(%ebp),%eax
    408f:	0f b6 00             	movzbl (%eax),%eax
    4092:	3a 45 fc             	cmp    -0x4(%ebp),%al
    4095:	75 05                	jne    409c <strchr+0x1e>
      return (char*)s;
    4097:	8b 45 08             	mov    0x8(%ebp),%eax
    409a:	eb 13                	jmp    40af <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    409c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    40a0:	8b 45 08             	mov    0x8(%ebp),%eax
    40a3:	0f b6 00             	movzbl (%eax),%eax
    40a6:	84 c0                	test   %al,%al
    40a8:	75 e2                	jne    408c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    40aa:	b8 00 00 00 00       	mov    $0x0,%eax
}
    40af:	c9                   	leave  
    40b0:	c3                   	ret    

000040b1 <gets>:

char*
gets(char *buf, int max)
{
    40b1:	55                   	push   %ebp
    40b2:	89 e5                	mov    %esp,%ebp
    40b4:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    40b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    40be:	eb 44                	jmp    4104 <gets+0x53>
    cc = read(0, &c, 1);
    40c0:	83 ec 04             	sub    $0x4,%esp
    40c3:	6a 01                	push   $0x1
    40c5:	8d 45 ef             	lea    -0x11(%ebp),%eax
    40c8:	50                   	push   %eax
    40c9:	6a 00                	push   $0x0
    40cb:	e8 46 01 00 00       	call   4216 <read>
    40d0:	83 c4 10             	add    $0x10,%esp
    40d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    40d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    40da:	7f 02                	jg     40de <gets+0x2d>
      break;
    40dc:	eb 31                	jmp    410f <gets+0x5e>
    buf[i++] = c;
    40de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40e1:	8d 50 01             	lea    0x1(%eax),%edx
    40e4:	89 55 f4             	mov    %edx,-0xc(%ebp)
    40e7:	89 c2                	mov    %eax,%edx
    40e9:	8b 45 08             	mov    0x8(%ebp),%eax
    40ec:	01 c2                	add    %eax,%edx
    40ee:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    40f2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    40f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    40f8:	3c 0a                	cmp    $0xa,%al
    40fa:	74 13                	je     410f <gets+0x5e>
    40fc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4100:	3c 0d                	cmp    $0xd,%al
    4102:	74 0b                	je     410f <gets+0x5e>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4104:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4107:	83 c0 01             	add    $0x1,%eax
    410a:	3b 45 0c             	cmp    0xc(%ebp),%eax
    410d:	7c b1                	jl     40c0 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    410f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4112:	8b 45 08             	mov    0x8(%ebp),%eax
    4115:	01 d0                	add    %edx,%eax
    4117:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    411a:	8b 45 08             	mov    0x8(%ebp),%eax
}
    411d:	c9                   	leave  
    411e:	c3                   	ret    

0000411f <stat>:

int
stat(char *n, struct stat *st)
{
    411f:	55                   	push   %ebp
    4120:	89 e5                	mov    %esp,%ebp
    4122:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4125:	83 ec 08             	sub    $0x8,%esp
    4128:	6a 00                	push   $0x0
    412a:	ff 75 08             	pushl  0x8(%ebp)
    412d:	e8 0c 01 00 00       	call   423e <open>
    4132:	83 c4 10             	add    $0x10,%esp
    4135:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    4138:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    413c:	79 07                	jns    4145 <stat+0x26>
    return -1;
    413e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4143:	eb 25                	jmp    416a <stat+0x4b>
  r = fstat(fd, st);
    4145:	83 ec 08             	sub    $0x8,%esp
    4148:	ff 75 0c             	pushl  0xc(%ebp)
    414b:	ff 75 f4             	pushl  -0xc(%ebp)
    414e:	e8 03 01 00 00       	call   4256 <fstat>
    4153:	83 c4 10             	add    $0x10,%esp
    4156:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    4159:	83 ec 0c             	sub    $0xc,%esp
    415c:	ff 75 f4             	pushl  -0xc(%ebp)
    415f:	e8 c2 00 00 00       	call   4226 <close>
    4164:	83 c4 10             	add    $0x10,%esp
  return r;
    4167:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    416a:	c9                   	leave  
    416b:	c3                   	ret    

0000416c <atoi>:

int
atoi(const char *s)
{
    416c:	55                   	push   %ebp
    416d:	89 e5                	mov    %esp,%ebp
    416f:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    4172:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    4179:	eb 25                	jmp    41a0 <atoi+0x34>
    n = n*10 + *s++ - '0';
    417b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    417e:	89 d0                	mov    %edx,%eax
    4180:	c1 e0 02             	shl    $0x2,%eax
    4183:	01 d0                	add    %edx,%eax
    4185:	01 c0                	add    %eax,%eax
    4187:	89 c1                	mov    %eax,%ecx
    4189:	8b 45 08             	mov    0x8(%ebp),%eax
    418c:	8d 50 01             	lea    0x1(%eax),%edx
    418f:	89 55 08             	mov    %edx,0x8(%ebp)
    4192:	0f b6 00             	movzbl (%eax),%eax
    4195:	0f be c0             	movsbl %al,%eax
    4198:	01 c8                	add    %ecx,%eax
    419a:	83 e8 30             	sub    $0x30,%eax
    419d:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    41a0:	8b 45 08             	mov    0x8(%ebp),%eax
    41a3:	0f b6 00             	movzbl (%eax),%eax
    41a6:	3c 2f                	cmp    $0x2f,%al
    41a8:	7e 0a                	jle    41b4 <atoi+0x48>
    41aa:	8b 45 08             	mov    0x8(%ebp),%eax
    41ad:	0f b6 00             	movzbl (%eax),%eax
    41b0:	3c 39                	cmp    $0x39,%al
    41b2:	7e c7                	jle    417b <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    41b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    41b7:	c9                   	leave  
    41b8:	c3                   	ret    

000041b9 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    41b9:	55                   	push   %ebp
    41ba:	89 e5                	mov    %esp,%ebp
    41bc:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    41bf:	8b 45 08             	mov    0x8(%ebp),%eax
    41c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    41c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    41c8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    41cb:	eb 17                	jmp    41e4 <memmove+0x2b>
    *dst++ = *src++;
    41cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    41d0:	8d 50 01             	lea    0x1(%eax),%edx
    41d3:	89 55 fc             	mov    %edx,-0x4(%ebp)
    41d6:	8b 55 f8             	mov    -0x8(%ebp),%edx
    41d9:	8d 4a 01             	lea    0x1(%edx),%ecx
    41dc:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    41df:	0f b6 12             	movzbl (%edx),%edx
    41e2:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    41e4:	8b 45 10             	mov    0x10(%ebp),%eax
    41e7:	8d 50 ff             	lea    -0x1(%eax),%edx
    41ea:	89 55 10             	mov    %edx,0x10(%ebp)
    41ed:	85 c0                	test   %eax,%eax
    41ef:	7f dc                	jg     41cd <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    41f1:	8b 45 08             	mov    0x8(%ebp),%eax
}
    41f4:	c9                   	leave  
    41f5:	c3                   	ret    

000041f6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    41f6:	b8 01 00 00 00       	mov    $0x1,%eax
    41fb:	cd 40                	int    $0x40
    41fd:	c3                   	ret    

000041fe <exit>:
SYSCALL(exit)
    41fe:	b8 02 00 00 00       	mov    $0x2,%eax
    4203:	cd 40                	int    $0x40
    4205:	c3                   	ret    

00004206 <wait>:
SYSCALL(wait)
    4206:	b8 03 00 00 00       	mov    $0x3,%eax
    420b:	cd 40                	int    $0x40
    420d:	c3                   	ret    

0000420e <pipe>:
SYSCALL(pipe)
    420e:	b8 04 00 00 00       	mov    $0x4,%eax
    4213:	cd 40                	int    $0x40
    4215:	c3                   	ret    

00004216 <read>:
SYSCALL(read)
    4216:	b8 05 00 00 00       	mov    $0x5,%eax
    421b:	cd 40                	int    $0x40
    421d:	c3                   	ret    

0000421e <write>:
SYSCALL(write)
    421e:	b8 10 00 00 00       	mov    $0x10,%eax
    4223:	cd 40                	int    $0x40
    4225:	c3                   	ret    

00004226 <close>:
SYSCALL(close)
    4226:	b8 15 00 00 00       	mov    $0x15,%eax
    422b:	cd 40                	int    $0x40
    422d:	c3                   	ret    

0000422e <kill>:
SYSCALL(kill)
    422e:	b8 06 00 00 00       	mov    $0x6,%eax
    4233:	cd 40                	int    $0x40
    4235:	c3                   	ret    

00004236 <exec>:
SYSCALL(exec)
    4236:	b8 07 00 00 00       	mov    $0x7,%eax
    423b:	cd 40                	int    $0x40
    423d:	c3                   	ret    

0000423e <open>:
SYSCALL(open)
    423e:	b8 0f 00 00 00       	mov    $0xf,%eax
    4243:	cd 40                	int    $0x40
    4245:	c3                   	ret    

00004246 <mknod>:
SYSCALL(mknod)
    4246:	b8 11 00 00 00       	mov    $0x11,%eax
    424b:	cd 40                	int    $0x40
    424d:	c3                   	ret    

0000424e <unlink>:
SYSCALL(unlink)
    424e:	b8 12 00 00 00       	mov    $0x12,%eax
    4253:	cd 40                	int    $0x40
    4255:	c3                   	ret    

00004256 <fstat>:
SYSCALL(fstat)
    4256:	b8 08 00 00 00       	mov    $0x8,%eax
    425b:	cd 40                	int    $0x40
    425d:	c3                   	ret    

0000425e <link>:
SYSCALL(link)
    425e:	b8 13 00 00 00       	mov    $0x13,%eax
    4263:	cd 40                	int    $0x40
    4265:	c3                   	ret    

00004266 <mkdir>:
SYSCALL(mkdir)
    4266:	b8 14 00 00 00       	mov    $0x14,%eax
    426b:	cd 40                	int    $0x40
    426d:	c3                   	ret    

0000426e <chdir>:
SYSCALL(chdir)
    426e:	b8 09 00 00 00       	mov    $0x9,%eax
    4273:	cd 40                	int    $0x40
    4275:	c3                   	ret    

00004276 <dup>:
SYSCALL(dup)
    4276:	b8 0a 00 00 00       	mov    $0xa,%eax
    427b:	cd 40                	int    $0x40
    427d:	c3                   	ret    

0000427e <getpid>:
SYSCALL(getpid)
    427e:	b8 0b 00 00 00       	mov    $0xb,%eax
    4283:	cd 40                	int    $0x40
    4285:	c3                   	ret    

00004286 <sbrk>:
SYSCALL(sbrk)
    4286:	b8 0c 00 00 00       	mov    $0xc,%eax
    428b:	cd 40                	int    $0x40
    428d:	c3                   	ret    

0000428e <sleep>:
SYSCALL(sleep)
    428e:	b8 0d 00 00 00       	mov    $0xd,%eax
    4293:	cd 40                	int    $0x40
    4295:	c3                   	ret    

00004296 <uptime>:
SYSCALL(uptime)
    4296:	b8 0e 00 00 00       	mov    $0xe,%eax
    429b:	cd 40                	int    $0x40
    429d:	c3                   	ret    

0000429e <getMsg>:
SYSCALL(getMsg)
    429e:	b8 16 00 00 00       	mov    $0x16,%eax
    42a3:	cd 40                	int    $0x40
    42a5:	c3                   	ret    

000042a6 <createWindow>:
SYSCALL(createWindow)
    42a6:	b8 17 00 00 00       	mov    $0x17,%eax
    42ab:	cd 40                	int    $0x40
    42ad:	c3                   	ret    

000042ae <destroyWindow>:
SYSCALL(destroyWindow)
    42ae:	b8 18 00 00 00       	mov    $0x18,%eax
    42b3:	cd 40                	int    $0x40
    42b5:	c3                   	ret    

000042b6 <updateWindow>:
SYSCALL(updateWindow)
    42b6:	b8 19 00 00 00       	mov    $0x19,%eax
    42bb:	cd 40                	int    $0x40
    42bd:	c3                   	ret    

000042be <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    42be:	b8 1a 00 00 00       	mov    $0x1a,%eax
    42c3:	cd 40                	int    $0x40
    42c5:	c3                   	ret    

000042c6 <kwrite>:
SYSCALL(kwrite)
    42c6:	b8 1c 00 00 00       	mov    $0x1c,%eax
    42cb:	cd 40                	int    $0x40
    42cd:	c3                   	ret    

000042ce <setSampleRate>:
SYSCALL(setSampleRate)
    42ce:	b8 1b 00 00 00       	mov    $0x1b,%eax
    42d3:	cd 40                	int    $0x40
    42d5:	c3                   	ret    

000042d6 <pause>:
SYSCALL(pause)
    42d6:	b8 1d 00 00 00       	mov    $0x1d,%eax
    42db:	cd 40                	int    $0x40
    42dd:	c3                   	ret    

000042de <wavdecode>:
SYSCALL(wavdecode)
    42de:	b8 1e 00 00 00       	mov    $0x1e,%eax
    42e3:	cd 40                	int    $0x40
    42e5:	c3                   	ret    

000042e6 <beginDecode>:
SYSCALL(beginDecode)
    42e6:	b8 1f 00 00 00       	mov    $0x1f,%eax
    42eb:	cd 40                	int    $0x40
    42ed:	c3                   	ret    

000042ee <waitForDecode>:
SYSCALL(waitForDecode)
    42ee:	b8 20 00 00 00       	mov    $0x20,%eax
    42f3:	cd 40                	int    $0x40
    42f5:	c3                   	ret    

000042f6 <endDecode>:
SYSCALL(endDecode)
    42f6:	b8 21 00 00 00       	mov    $0x21,%eax
    42fb:	cd 40                	int    $0x40
    42fd:	c3                   	ret    

000042fe <getCoreBuf>:
    42fe:	b8 22 00 00 00       	mov    $0x22,%eax
    4303:	cd 40                	int    $0x40
    4305:	c3                   	ret    

00004306 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4306:	55                   	push   %ebp
    4307:	89 e5                	mov    %esp,%ebp
    4309:	83 ec 18             	sub    $0x18,%esp
    430c:	8b 45 0c             	mov    0xc(%ebp),%eax
    430f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    4312:	83 ec 04             	sub    $0x4,%esp
    4315:	6a 01                	push   $0x1
    4317:	8d 45 f4             	lea    -0xc(%ebp),%eax
    431a:	50                   	push   %eax
    431b:	ff 75 08             	pushl  0x8(%ebp)
    431e:	e8 fb fe ff ff       	call   421e <write>
    4323:	83 c4 10             	add    $0x10,%esp
}
    4326:	c9                   	leave  
    4327:	c3                   	ret    

00004328 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4328:	55                   	push   %ebp
    4329:	89 e5                	mov    %esp,%ebp
    432b:	53                   	push   %ebx
    432c:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    432f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    4336:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    433a:	74 17                	je     4353 <printint+0x2b>
    433c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4340:	79 11                	jns    4353 <printint+0x2b>
    neg = 1;
    4342:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    4349:	8b 45 0c             	mov    0xc(%ebp),%eax
    434c:	f7 d8                	neg    %eax
    434e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4351:	eb 06                	jmp    4359 <printint+0x31>
  } else {
    x = xx;
    4353:	8b 45 0c             	mov    0xc(%ebp),%eax
    4356:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    4359:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    4360:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    4363:	8d 41 01             	lea    0x1(%ecx),%eax
    4366:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4369:	8b 5d 10             	mov    0x10(%ebp),%ebx
    436c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    436f:	ba 00 00 00 00       	mov    $0x0,%edx
    4374:	f7 f3                	div    %ebx
    4376:	89 d0                	mov    %edx,%eax
    4378:	0f b6 80 18 f2 00 00 	movzbl 0xf218(%eax),%eax
    437f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    4383:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4386:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4389:	ba 00 00 00 00       	mov    $0x0,%edx
    438e:	f7 f3                	div    %ebx
    4390:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4393:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4397:	75 c7                	jne    4360 <printint+0x38>
  if(neg)
    4399:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    439d:	74 0e                	je     43ad <printint+0x85>
    buf[i++] = '-';
    439f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43a2:	8d 50 01             	lea    0x1(%eax),%edx
    43a5:	89 55 f4             	mov    %edx,-0xc(%ebp)
    43a8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    43ad:	eb 1d                	jmp    43cc <printint+0xa4>
    putc(fd, buf[i]);
    43af:	8d 55 dc             	lea    -0x24(%ebp),%edx
    43b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43b5:	01 d0                	add    %edx,%eax
    43b7:	0f b6 00             	movzbl (%eax),%eax
    43ba:	0f be c0             	movsbl %al,%eax
    43bd:	83 ec 08             	sub    $0x8,%esp
    43c0:	50                   	push   %eax
    43c1:	ff 75 08             	pushl  0x8(%ebp)
    43c4:	e8 3d ff ff ff       	call   4306 <putc>
    43c9:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    43cc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    43d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    43d4:	79 d9                	jns    43af <printint+0x87>
    putc(fd, buf[i]);
}
    43d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    43d9:	c9                   	leave  
    43da:	c3                   	ret    

000043db <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    43db:	55                   	push   %ebp
    43dc:	89 e5                	mov    %esp,%ebp
    43de:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    43e1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    43e8:	8d 45 0c             	lea    0xc(%ebp),%eax
    43eb:	83 c0 04             	add    $0x4,%eax
    43ee:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    43f1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    43f8:	e9 59 01 00 00       	jmp    4556 <printf+0x17b>
    c = fmt[i] & 0xff;
    43fd:	8b 55 0c             	mov    0xc(%ebp),%edx
    4400:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4403:	01 d0                	add    %edx,%eax
    4405:	0f b6 00             	movzbl (%eax),%eax
    4408:	0f be c0             	movsbl %al,%eax
    440b:	25 ff 00 00 00       	and    $0xff,%eax
    4410:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    4413:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4417:	75 2c                	jne    4445 <printf+0x6a>
      if(c == '%'){
    4419:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    441d:	75 0c                	jne    442b <printf+0x50>
        state = '%';
    441f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    4426:	e9 27 01 00 00       	jmp    4552 <printf+0x177>
      } else {
        putc(fd, c);
    442b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    442e:	0f be c0             	movsbl %al,%eax
    4431:	83 ec 08             	sub    $0x8,%esp
    4434:	50                   	push   %eax
    4435:	ff 75 08             	pushl  0x8(%ebp)
    4438:	e8 c9 fe ff ff       	call   4306 <putc>
    443d:	83 c4 10             	add    $0x10,%esp
    4440:	e9 0d 01 00 00       	jmp    4552 <printf+0x177>
      }
    } else if(state == '%'){
    4445:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    4449:	0f 85 03 01 00 00    	jne    4552 <printf+0x177>
      if(c == 'd'){
    444f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    4453:	75 1e                	jne    4473 <printf+0x98>
        printint(fd, *ap, 10, 1);
    4455:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4458:	8b 00                	mov    (%eax),%eax
    445a:	6a 01                	push   $0x1
    445c:	6a 0a                	push   $0xa
    445e:	50                   	push   %eax
    445f:	ff 75 08             	pushl  0x8(%ebp)
    4462:	e8 c1 fe ff ff       	call   4328 <printint>
    4467:	83 c4 10             	add    $0x10,%esp
        ap++;
    446a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    446e:	e9 d8 00 00 00       	jmp    454b <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    4473:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    4477:	74 06                	je     447f <printf+0xa4>
    4479:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    447d:	75 1e                	jne    449d <printf+0xc2>
        printint(fd, *ap, 16, 0);
    447f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4482:	8b 00                	mov    (%eax),%eax
    4484:	6a 00                	push   $0x0
    4486:	6a 10                	push   $0x10
    4488:	50                   	push   %eax
    4489:	ff 75 08             	pushl  0x8(%ebp)
    448c:	e8 97 fe ff ff       	call   4328 <printint>
    4491:	83 c4 10             	add    $0x10,%esp
        ap++;
    4494:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4498:	e9 ae 00 00 00       	jmp    454b <printf+0x170>
      } else if(c == 's'){
    449d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    44a1:	75 43                	jne    44e6 <printf+0x10b>
        s = (char*)*ap;
    44a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    44a6:	8b 00                	mov    (%eax),%eax
    44a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    44ab:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    44af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    44b3:	75 07                	jne    44bc <printf+0xe1>
          s = "(null)";
    44b5:	c7 45 f4 bf b1 00 00 	movl   $0xb1bf,-0xc(%ebp)
        while(*s != 0){
    44bc:	eb 1c                	jmp    44da <printf+0xff>
          putc(fd, *s);
    44be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44c1:	0f b6 00             	movzbl (%eax),%eax
    44c4:	0f be c0             	movsbl %al,%eax
    44c7:	83 ec 08             	sub    $0x8,%esp
    44ca:	50                   	push   %eax
    44cb:	ff 75 08             	pushl  0x8(%ebp)
    44ce:	e8 33 fe ff ff       	call   4306 <putc>
    44d3:	83 c4 10             	add    $0x10,%esp
          s++;
    44d6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    44da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44dd:	0f b6 00             	movzbl (%eax),%eax
    44e0:	84 c0                	test   %al,%al
    44e2:	75 da                	jne    44be <printf+0xe3>
    44e4:	eb 65                	jmp    454b <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    44e6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    44ea:	75 1d                	jne    4509 <printf+0x12e>
        putc(fd, *ap);
    44ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
    44ef:	8b 00                	mov    (%eax),%eax
    44f1:	0f be c0             	movsbl %al,%eax
    44f4:	83 ec 08             	sub    $0x8,%esp
    44f7:	50                   	push   %eax
    44f8:	ff 75 08             	pushl  0x8(%ebp)
    44fb:	e8 06 fe ff ff       	call   4306 <putc>
    4500:	83 c4 10             	add    $0x10,%esp
        ap++;
    4503:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4507:	eb 42                	jmp    454b <printf+0x170>
      } else if(c == '%'){
    4509:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    450d:	75 17                	jne    4526 <printf+0x14b>
        putc(fd, c);
    450f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4512:	0f be c0             	movsbl %al,%eax
    4515:	83 ec 08             	sub    $0x8,%esp
    4518:	50                   	push   %eax
    4519:	ff 75 08             	pushl  0x8(%ebp)
    451c:	e8 e5 fd ff ff       	call   4306 <putc>
    4521:	83 c4 10             	add    $0x10,%esp
    4524:	eb 25                	jmp    454b <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4526:	83 ec 08             	sub    $0x8,%esp
    4529:	6a 25                	push   $0x25
    452b:	ff 75 08             	pushl  0x8(%ebp)
    452e:	e8 d3 fd ff ff       	call   4306 <putc>
    4533:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    4536:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4539:	0f be c0             	movsbl %al,%eax
    453c:	83 ec 08             	sub    $0x8,%esp
    453f:	50                   	push   %eax
    4540:	ff 75 08             	pushl  0x8(%ebp)
    4543:	e8 be fd ff ff       	call   4306 <putc>
    4548:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    454b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4552:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4556:	8b 55 0c             	mov    0xc(%ebp),%edx
    4559:	8b 45 f0             	mov    -0x10(%ebp),%eax
    455c:	01 d0                	add    %edx,%eax
    455e:	0f b6 00             	movzbl (%eax),%eax
    4561:	84 c0                	test   %al,%al
    4563:	0f 85 94 fe ff ff    	jne    43fd <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4569:	c9                   	leave  
    456a:	c3                   	ret    

0000456b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    456b:	55                   	push   %ebp
    456c:	89 e5                	mov    %esp,%ebp
    456e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4571:	8b 45 08             	mov    0x8(%ebp),%eax
    4574:	83 e8 08             	sub    $0x8,%eax
    4577:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    457a:	a1 d8 f7 00 00       	mov    0xf7d8,%eax
    457f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4582:	eb 24                	jmp    45a8 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4584:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4587:	8b 00                	mov    (%eax),%eax
    4589:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    458c:	77 12                	ja     45a0 <free+0x35>
    458e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4591:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4594:	77 24                	ja     45ba <free+0x4f>
    4596:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4599:	8b 00                	mov    (%eax),%eax
    459b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    459e:	77 1a                	ja     45ba <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    45a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45a3:	8b 00                	mov    (%eax),%eax
    45a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
    45a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45ab:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    45ae:	76 d4                	jbe    4584 <free+0x19>
    45b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45b3:	8b 00                	mov    (%eax),%eax
    45b5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    45b8:	76 ca                	jbe    4584 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    45ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45bd:	8b 40 04             	mov    0x4(%eax),%eax
    45c0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    45c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45ca:	01 c2                	add    %eax,%edx
    45cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45cf:	8b 00                	mov    (%eax),%eax
    45d1:	39 c2                	cmp    %eax,%edx
    45d3:	75 24                	jne    45f9 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    45d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45d8:	8b 50 04             	mov    0x4(%eax),%edx
    45db:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45de:	8b 00                	mov    (%eax),%eax
    45e0:	8b 40 04             	mov    0x4(%eax),%eax
    45e3:	01 c2                	add    %eax,%edx
    45e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45e8:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    45eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45ee:	8b 00                	mov    (%eax),%eax
    45f0:	8b 10                	mov    (%eax),%edx
    45f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45f5:	89 10                	mov    %edx,(%eax)
    45f7:	eb 0a                	jmp    4603 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    45f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45fc:	8b 10                	mov    (%eax),%edx
    45fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4601:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    4603:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4606:	8b 40 04             	mov    0x4(%eax),%eax
    4609:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4610:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4613:	01 d0                	add    %edx,%eax
    4615:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4618:	75 20                	jne    463a <free+0xcf>
    p->s.size += bp->s.size;
    461a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    461d:	8b 50 04             	mov    0x4(%eax),%edx
    4620:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4623:	8b 40 04             	mov    0x4(%eax),%eax
    4626:	01 c2                	add    %eax,%edx
    4628:	8b 45 fc             	mov    -0x4(%ebp),%eax
    462b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    462e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4631:	8b 10                	mov    (%eax),%edx
    4633:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4636:	89 10                	mov    %edx,(%eax)
    4638:	eb 08                	jmp    4642 <free+0xd7>
  } else
    p->s.ptr = bp;
    463a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    463d:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4640:	89 10                	mov    %edx,(%eax)
  freep = p;
    4642:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4645:	a3 d8 f7 00 00       	mov    %eax,0xf7d8
}
    464a:	c9                   	leave  
    464b:	c3                   	ret    

0000464c <morecore>:

static Header*
morecore(uint nu)
{
    464c:	55                   	push   %ebp
    464d:	89 e5                	mov    %esp,%ebp
    464f:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4652:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4659:	77 07                	ja     4662 <morecore+0x16>
    nu = 4096;
    465b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4662:	8b 45 08             	mov    0x8(%ebp),%eax
    4665:	c1 e0 03             	shl    $0x3,%eax
    4668:	83 ec 0c             	sub    $0xc,%esp
    466b:	50                   	push   %eax
    466c:	e8 15 fc ff ff       	call   4286 <sbrk>
    4671:	83 c4 10             	add    $0x10,%esp
    4674:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4677:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    467b:	75 07                	jne    4684 <morecore+0x38>
    return 0;
    467d:	b8 00 00 00 00       	mov    $0x0,%eax
    4682:	eb 26                	jmp    46aa <morecore+0x5e>
  hp = (Header*)p;
    4684:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4687:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    468a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    468d:	8b 55 08             	mov    0x8(%ebp),%edx
    4690:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4693:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4696:	83 c0 08             	add    $0x8,%eax
    4699:	83 ec 0c             	sub    $0xc,%esp
    469c:	50                   	push   %eax
    469d:	e8 c9 fe ff ff       	call   456b <free>
    46a2:	83 c4 10             	add    $0x10,%esp
  return freep;
    46a5:	a1 d8 f7 00 00       	mov    0xf7d8,%eax
}
    46aa:	c9                   	leave  
    46ab:	c3                   	ret    

000046ac <malloc>:

void*
malloc(uint nbytes)
{
    46ac:	55                   	push   %ebp
    46ad:	89 e5                	mov    %esp,%ebp
    46af:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    46b2:	8b 45 08             	mov    0x8(%ebp),%eax
    46b5:	83 c0 07             	add    $0x7,%eax
    46b8:	c1 e8 03             	shr    $0x3,%eax
    46bb:	83 c0 01             	add    $0x1,%eax
    46be:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    46c1:	a1 d8 f7 00 00       	mov    0xf7d8,%eax
    46c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    46c9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    46cd:	75 23                	jne    46f2 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    46cf:	c7 45 f0 d0 f7 00 00 	movl   $0xf7d0,-0x10(%ebp)
    46d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46d9:	a3 d8 f7 00 00       	mov    %eax,0xf7d8
    46de:	a1 d8 f7 00 00       	mov    0xf7d8,%eax
    46e3:	a3 d0 f7 00 00       	mov    %eax,0xf7d0
    base.s.size = 0;
    46e8:	c7 05 d4 f7 00 00 00 	movl   $0x0,0xf7d4
    46ef:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    46f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46f5:	8b 00                	mov    (%eax),%eax
    46f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    46fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46fd:	8b 40 04             	mov    0x4(%eax),%eax
    4700:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4703:	72 4d                	jb     4752 <malloc+0xa6>
      if(p->s.size == nunits)
    4705:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4708:	8b 40 04             	mov    0x4(%eax),%eax
    470b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    470e:	75 0c                	jne    471c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    4710:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4713:	8b 10                	mov    (%eax),%edx
    4715:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4718:	89 10                	mov    %edx,(%eax)
    471a:	eb 26                	jmp    4742 <malloc+0x96>
      else {
        p->s.size -= nunits;
    471c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    471f:	8b 40 04             	mov    0x4(%eax),%eax
    4722:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4725:	89 c2                	mov    %eax,%edx
    4727:	8b 45 f4             	mov    -0xc(%ebp),%eax
    472a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    472d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4730:	8b 40 04             	mov    0x4(%eax),%eax
    4733:	c1 e0 03             	shl    $0x3,%eax
    4736:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    4739:	8b 45 f4             	mov    -0xc(%ebp),%eax
    473c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    473f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    4742:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4745:	a3 d8 f7 00 00       	mov    %eax,0xf7d8
      return (void*)(p + 1);
    474a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    474d:	83 c0 08             	add    $0x8,%eax
    4750:	eb 3b                	jmp    478d <malloc+0xe1>
    }
    if(p == freep)
    4752:	a1 d8 f7 00 00       	mov    0xf7d8,%eax
    4757:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    475a:	75 1e                	jne    477a <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    475c:	83 ec 0c             	sub    $0xc,%esp
    475f:	ff 75 ec             	pushl  -0x14(%ebp)
    4762:	e8 e5 fe ff ff       	call   464c <morecore>
    4767:	83 c4 10             	add    $0x10,%esp
    476a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    476d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4771:	75 07                	jne    477a <malloc+0xce>
        return 0;
    4773:	b8 00 00 00 00       	mov    $0x0,%eax
    4778:	eb 13                	jmp    478d <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    477a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    477d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4780:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4783:	8b 00                	mov    (%eax),%eax
    4785:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4788:	e9 6d ff ff ff       	jmp    46fa <malloc+0x4e>
}
    478d:	c9                   	leave  
    478e:	c3                   	ret    

0000478f <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    478f:	55                   	push   %ebp
    4790:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    4792:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4796:	79 07                	jns    479f <abs+0x10>
		return x * -1;
    4798:	8b 45 08             	mov    0x8(%ebp),%eax
    479b:	f7 d8                	neg    %eax
    479d:	eb 03                	jmp    47a2 <abs+0x13>
	else
		return x;
    479f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    47a2:	5d                   	pop    %ebp
    47a3:	c3                   	ret    

000047a4 <sin>:
double sin(double x)  
{  
    47a4:	55                   	push   %ebp
    47a5:	89 e5                	mov    %esp,%ebp
    47a7:	83 ec 40             	sub    $0x40,%esp
    47aa:	8b 45 08             	mov    0x8(%ebp),%eax
    47ad:	89 45 c8             	mov    %eax,-0x38(%ebp)
    47b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    47b3:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    47b6:	dd 45 c8             	fldl   -0x38(%ebp)
    47b9:	dd 5d f8             	fstpl  -0x8(%ebp)
    47bc:	d9 e8                	fld1   
    47be:	dd 5d f0             	fstpl  -0x10(%ebp)
    47c1:	dd 45 c8             	fldl   -0x38(%ebp)
    47c4:	dd 5d e8             	fstpl  -0x18(%ebp)
    47c7:	dd 45 c8             	fldl   -0x38(%ebp)
    47ca:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    47cd:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    47d4:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    47db:	eb 50                	jmp    482d <sin+0x89>
	{  
		n = n+1;  
    47dd:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    47e1:	db 45 dc             	fildl  -0x24(%ebp)
    47e4:	dc 4d f0             	fmull  -0x10(%ebp)
    47e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47ea:	83 c0 01             	add    $0x1,%eax
    47ed:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    47f0:	db 45 c4             	fildl  -0x3c(%ebp)
    47f3:	de c9                	fmulp  %st,%st(1)
    47f5:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    47f8:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    47fc:	dd 45 c8             	fldl   -0x38(%ebp)
    47ff:	dc 4d c8             	fmull  -0x38(%ebp)
    4802:	dd 45 e8             	fldl   -0x18(%ebp)
    4805:	de c9                	fmulp  %st,%st(1)
    4807:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    480a:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    480d:	dd 45 e8             	fldl   -0x18(%ebp)
    4810:	dc 75 f0             	fdivl  -0x10(%ebp)
    4813:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    4816:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    481a:	7e 08                	jle    4824 <sin+0x80>
    481c:	dd 45 f8             	fldl   -0x8(%ebp)
    481f:	dc 45 e0             	faddl  -0x20(%ebp)
    4822:	eb 06                	jmp    482a <sin+0x86>
    4824:	dd 45 f8             	fldl   -0x8(%ebp)
    4827:	dc 65 e0             	fsubl  -0x20(%ebp)
    482a:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    482d:	dd 45 e0             	fldl   -0x20(%ebp)
    4830:	dd 05 c8 b1 00 00    	fldl   0xb1c8
    4836:	d9 c9                	fxch   %st(1)
    4838:	df e9                	fucomip %st(1),%st
    483a:	dd d8                	fstp   %st(0)
    483c:	77 9f                	ja     47dd <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    483e:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    4841:	c9                   	leave  
    4842:	c3                   	ret    

00004843 <cos>:
double cos(double x)  
{  
    4843:	55                   	push   %ebp
    4844:	89 e5                	mov    %esp,%ebp
    4846:	83 ec 08             	sub    $0x8,%esp
    4849:	8b 45 08             	mov    0x8(%ebp),%eax
    484c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    484f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4852:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    4855:	dd 05 d0 b1 00 00    	fldl   0xb1d0
    485b:	dc 65 f8             	fsubl  -0x8(%ebp)
    485e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4862:	dd 1c 24             	fstpl  (%esp)
    4865:	e8 3a ff ff ff       	call   47a4 <sin>
    486a:	83 c4 08             	add    $0x8,%esp
}  
    486d:	c9                   	leave  
    486e:	c3                   	ret    

0000486f <tan>:
double tan(double x)  
{  
    486f:	55                   	push   %ebp
    4870:	89 e5                	mov    %esp,%ebp
    4872:	83 ec 10             	sub    $0x10,%esp
    4875:	8b 45 08             	mov    0x8(%ebp),%eax
    4878:	89 45 f8             	mov    %eax,-0x8(%ebp)
    487b:	8b 45 0c             	mov    0xc(%ebp),%eax
    487e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    4881:	ff 75 fc             	pushl  -0x4(%ebp)
    4884:	ff 75 f8             	pushl  -0x8(%ebp)
    4887:	e8 18 ff ff ff       	call   47a4 <sin>
    488c:	83 c4 08             	add    $0x8,%esp
    488f:	dd 5d f0             	fstpl  -0x10(%ebp)
    4892:	ff 75 fc             	pushl  -0x4(%ebp)
    4895:	ff 75 f8             	pushl  -0x8(%ebp)
    4898:	e8 a6 ff ff ff       	call   4843 <cos>
    489d:	83 c4 08             	add    $0x8,%esp
    48a0:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    48a3:	c9                   	leave  
    48a4:	c3                   	ret    

000048a5 <pow>:

double pow(double x, double y)
{
    48a5:	55                   	push   %ebp
    48a6:	89 e5                	mov    %esp,%ebp
    48a8:	83 ec 38             	sub    $0x38,%esp
    48ab:	8b 45 08             	mov    0x8(%ebp),%eax
    48ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
    48b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    48b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    48b7:	8b 45 10             	mov    0x10(%ebp),%eax
    48ba:	89 45 d8             	mov    %eax,-0x28(%ebp)
    48bd:	8b 45 14             	mov    0x14(%ebp),%eax
    48c0:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    48c3:	dd 45 e0             	fldl   -0x20(%ebp)
    48c6:	d9 ee                	fldz   
    48c8:	df e9                	fucomip %st(1),%st
    48ca:	dd d8                	fstp   %st(0)
    48cc:	7a 28                	jp     48f6 <pow+0x51>
    48ce:	dd 45 e0             	fldl   -0x20(%ebp)
    48d1:	d9 ee                	fldz   
    48d3:	df e9                	fucomip %st(1),%st
    48d5:	dd d8                	fstp   %st(0)
    48d7:	75 1d                	jne    48f6 <pow+0x51>
    48d9:	dd 45 d8             	fldl   -0x28(%ebp)
    48dc:	d9 ee                	fldz   
    48de:	df e9                	fucomip %st(1),%st
    48e0:	dd d8                	fstp   %st(0)
    48e2:	7a 0b                	jp     48ef <pow+0x4a>
    48e4:	dd 45 d8             	fldl   -0x28(%ebp)
    48e7:	d9 ee                	fldz   
    48e9:	df e9                	fucomip %st(1),%st
    48eb:	dd d8                	fstp   %st(0)
    48ed:	74 07                	je     48f6 <pow+0x51>
    48ef:	d9 ee                	fldz   
    48f1:	e9 3a 01 00 00       	jmp    4a30 <pow+0x18b>
	else if(x==0 && y==0) return 1;
    48f6:	dd 45 e0             	fldl   -0x20(%ebp)
    48f9:	d9 ee                	fldz   
    48fb:	df e9                	fucomip %st(1),%st
    48fd:	dd d8                	fstp   %st(0)
    48ff:	7a 28                	jp     4929 <pow+0x84>
    4901:	dd 45 e0             	fldl   -0x20(%ebp)
    4904:	d9 ee                	fldz   
    4906:	df e9                	fucomip %st(1),%st
    4908:	dd d8                	fstp   %st(0)
    490a:	75 1d                	jne    4929 <pow+0x84>
    490c:	dd 45 d8             	fldl   -0x28(%ebp)
    490f:	d9 ee                	fldz   
    4911:	df e9                	fucomip %st(1),%st
    4913:	dd d8                	fstp   %st(0)
    4915:	7a 12                	jp     4929 <pow+0x84>
    4917:	dd 45 d8             	fldl   -0x28(%ebp)
    491a:	d9 ee                	fldz   
    491c:	df e9                	fucomip %st(1),%st
    491e:	dd d8                	fstp   %st(0)
    4920:	75 07                	jne    4929 <pow+0x84>
    4922:	d9 e8                	fld1   
    4924:	e9 07 01 00 00       	jmp    4a30 <pow+0x18b>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    4929:	d9 ee                	fldz   
    492b:	dd 45 d8             	fldl   -0x28(%ebp)
    492e:	d9 c9                	fxch   %st(1)
    4930:	df e9                	fucomip %st(1),%st
    4932:	dd d8                	fstp   %st(0)
    4934:	76 23                	jbe    4959 <pow+0xb4>
    4936:	dd 45 d8             	fldl   -0x28(%ebp)
    4939:	d9 e0                	fchs   
    493b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    493f:	dd 1c 24             	fstpl  (%esp)
    4942:	ff 75 e4             	pushl  -0x1c(%ebp)
    4945:	ff 75 e0             	pushl  -0x20(%ebp)
    4948:	e8 58 ff ff ff       	call   48a5 <pow>
    494d:	83 c4 10             	add    $0x10,%esp
    4950:	d9 e8                	fld1   
    4952:	de f1                	fdivp  %st,%st(1)
    4954:	e9 d7 00 00 00       	jmp    4a30 <pow+0x18b>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    4959:	d9 ee                	fldz   
    495b:	dd 45 e0             	fldl   -0x20(%ebp)
    495e:	d9 c9                	fxch   %st(1)
    4960:	df e9                	fucomip %st(1),%st
    4962:	dd d8                	fstp   %st(0)
    4964:	76 3a                	jbe    49a0 <pow+0xfb>
    4966:	dd 45 d8             	fldl   -0x28(%ebp)
    4969:	d9 7d d6             	fnstcw -0x2a(%ebp)
    496c:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4970:	b4 0c                	mov    $0xc,%ah
    4972:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    4976:	d9 6d d4             	fldcw  -0x2c(%ebp)
    4979:	db 5d cc             	fistpl -0x34(%ebp)
    497c:	d9 6d d6             	fldcw  -0x2a(%ebp)
    497f:	db 45 cc             	fildl  -0x34(%ebp)
    4982:	dd 45 d8             	fldl   -0x28(%ebp)
    4985:	de e1                	fsubp  %st,%st(1)
    4987:	d9 ee                	fldz   
    4989:	df e9                	fucomip %st(1),%st
    498b:	7a 0a                	jp     4997 <pow+0xf2>
    498d:	d9 ee                	fldz   
    498f:	df e9                	fucomip %st(1),%st
    4991:	dd d8                	fstp   %st(0)
    4993:	74 0b                	je     49a0 <pow+0xfb>
    4995:	eb 02                	jmp    4999 <pow+0xf4>
    4997:	dd d8                	fstp   %st(0)
    4999:	d9 ee                	fldz   
    499b:	e9 90 00 00 00       	jmp    4a30 <pow+0x18b>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    49a0:	d9 ee                	fldz   
    49a2:	dd 45 e0             	fldl   -0x20(%ebp)
    49a5:	d9 c9                	fxch   %st(1)
    49a7:	df e9                	fucomip %st(1),%st
    49a9:	dd d8                	fstp   %st(0)
    49ab:	76 5d                	jbe    4a0a <pow+0x165>
    49ad:	dd 45 d8             	fldl   -0x28(%ebp)
    49b0:	d9 7d d6             	fnstcw -0x2a(%ebp)
    49b3:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    49b7:	b4 0c                	mov    $0xc,%ah
    49b9:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    49bd:	d9 6d d4             	fldcw  -0x2c(%ebp)
    49c0:	db 5d cc             	fistpl -0x34(%ebp)
    49c3:	d9 6d d6             	fldcw  -0x2a(%ebp)
    49c6:	db 45 cc             	fildl  -0x34(%ebp)
    49c9:	dd 45 d8             	fldl   -0x28(%ebp)
    49cc:	de e1                	fsubp  %st,%st(1)
    49ce:	d9 ee                	fldz   
    49d0:	df e9                	fucomip %st(1),%st
    49d2:	7a 34                	jp     4a08 <pow+0x163>
    49d4:	d9 ee                	fldz   
    49d6:	df e9                	fucomip %st(1),%st
    49d8:	dd d8                	fstp   %st(0)
    49da:	75 2e                	jne    4a0a <pow+0x165>
	{
		double powint=1;
    49dc:	d9 e8                	fld1   
    49de:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    49e1:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    49e8:	eb 0d                	jmp    49f7 <pow+0x152>
    49ea:	dd 45 f0             	fldl   -0x10(%ebp)
    49ed:	dc 4d e0             	fmull  -0x20(%ebp)
    49f0:	dd 5d f0             	fstpl  -0x10(%ebp)
    49f3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    49f7:	db 45 ec             	fildl  -0x14(%ebp)
    49fa:	dd 45 d8             	fldl   -0x28(%ebp)
    49fd:	df e9                	fucomip %st(1),%st
    49ff:	dd d8                	fstp   %st(0)
    4a01:	73 e7                	jae    49ea <pow+0x145>
		return powint;
    4a03:	dd 45 f0             	fldl   -0x10(%ebp)
    4a06:	eb 28                	jmp    4a30 <pow+0x18b>
    4a08:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    4a0a:	83 ec 08             	sub    $0x8,%esp
    4a0d:	ff 75 e4             	pushl  -0x1c(%ebp)
    4a10:	ff 75 e0             	pushl  -0x20(%ebp)
    4a13:	e8 49 00 00 00       	call   4a61 <ln>
    4a18:	83 c4 10             	add    $0x10,%esp
    4a1b:	dc 4d d8             	fmull  -0x28(%ebp)
    4a1e:	83 ec 08             	sub    $0x8,%esp
    4a21:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4a25:	dd 1c 24             	fstpl  (%esp)
    4a28:	e8 2a 02 00 00       	call   4c57 <exp>
    4a2d:	83 c4 10             	add    $0x10,%esp
}
    4a30:	c9                   	leave  
    4a31:	c3                   	ret    

00004a32 <sqrt>:
// 求根
double sqrt(double x)
{
    4a32:	55                   	push   %ebp
    4a33:	89 e5                	mov    %esp,%ebp
    4a35:	83 ec 18             	sub    $0x18,%esp
    4a38:	8b 45 08             	mov    0x8(%ebp),%eax
    4a3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4a3e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a41:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    4a44:	dd 05 d8 b1 00 00    	fldl   0xb1d8
    4a4a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4a4e:	dd 1c 24             	fstpl  (%esp)
    4a51:	ff 75 f4             	pushl  -0xc(%ebp)
    4a54:	ff 75 f0             	pushl  -0x10(%ebp)
    4a57:	e8 49 fe ff ff       	call   48a5 <pow>
    4a5c:	83 c4 10             	add    $0x10,%esp
}
    4a5f:	c9                   	leave  
    4a60:	c3                   	ret    

00004a61 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    4a61:	55                   	push   %ebp
    4a62:	89 e5                	mov    %esp,%ebp
    4a64:	83 ec 78             	sub    $0x78,%esp
    4a67:	8b 45 08             	mov    0x8(%ebp),%eax
    4a6a:	89 45 90             	mov    %eax,-0x70(%ebp)
    4a6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a70:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    4a73:	dd 45 90             	fldl   -0x70(%ebp)
    4a76:	d9 e8                	fld1   
    4a78:	de e9                	fsubrp %st,%st(1)
    4a7a:	dd 5d c0             	fstpl  -0x40(%ebp)
    4a7d:	d9 ee                	fldz   
    4a7f:	dd 5d f0             	fstpl  -0x10(%ebp)
    4a82:	d9 ee                	fldz   
    4a84:	dd 5d b8             	fstpl  -0x48(%ebp)
    4a87:	d9 ee                	fldz   
    4a89:	dd 5d b0             	fstpl  -0x50(%ebp)
    4a8c:	d9 ee                	fldz   
    4a8e:	dd 5d e8             	fstpl  -0x18(%ebp)
    4a91:	d9 e8                	fld1   
    4a93:	dd 5d e0             	fstpl  -0x20(%ebp)
    4a96:	d9 e8                	fld1   
    4a98:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    4a9b:	dd 45 90             	fldl   -0x70(%ebp)
    4a9e:	d9 e8                	fld1   
    4aa0:	df e9                	fucomip %st(1),%st
    4aa2:	dd d8                	fstp   %st(0)
    4aa4:	7a 12                	jp     4ab8 <ln+0x57>
    4aa6:	dd 45 90             	fldl   -0x70(%ebp)
    4aa9:	d9 e8                	fld1   
    4aab:	df e9                	fucomip %st(1),%st
    4aad:	dd d8                	fstp   %st(0)
    4aaf:	75 07                	jne    4ab8 <ln+0x57>
    4ab1:	d9 ee                	fldz   
    4ab3:	e9 9d 01 00 00       	jmp    4c55 <ln+0x1f4>
	else if(x>2) return -ln(1/x);
    4ab8:	dd 45 90             	fldl   -0x70(%ebp)
    4abb:	dd 05 e0 b1 00 00    	fldl   0xb1e0
    4ac1:	d9 c9                	fxch   %st(1)
    4ac3:	df e9                	fucomip %st(1),%st
    4ac5:	dd d8                	fstp   %st(0)
    4ac7:	76 1e                	jbe    4ae7 <ln+0x86>
    4ac9:	d9 e8                	fld1   
    4acb:	dc 75 90             	fdivl  -0x70(%ebp)
    4ace:	83 ec 08             	sub    $0x8,%esp
    4ad1:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4ad5:	dd 1c 24             	fstpl  (%esp)
    4ad8:	e8 84 ff ff ff       	call   4a61 <ln>
    4add:	83 c4 10             	add    $0x10,%esp
    4ae0:	d9 e0                	fchs   
    4ae2:	e9 6e 01 00 00       	jmp    4c55 <ln+0x1f4>
	else if(x<.1)
    4ae7:	dd 05 e8 b1 00 00    	fldl   0xb1e8
    4aed:	dd 45 90             	fldl   -0x70(%ebp)
    4af0:	d9 c9                	fxch   %st(1)
    4af2:	df e9                	fucomip %st(1),%st
    4af4:	dd d8                	fstp   %st(0)
    4af6:	76 65                	jbe    4b5d <ln+0xfc>
	{
		double n=-1;
    4af8:	d9 e8                	fld1   
    4afa:	d9 e0                	fchs   
    4afc:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    4aff:	dd 45 c8             	fldl   -0x38(%ebp)
    4b02:	dd 05 f0 b1 00 00    	fldl   0xb1f0
    4b08:	de e9                	fsubrp %st,%st(1)
    4b0a:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    4b0d:	83 ec 08             	sub    $0x8,%esp
    4b10:	ff 75 cc             	pushl  -0x34(%ebp)
    4b13:	ff 75 c8             	pushl  -0x38(%ebp)
    4b16:	e8 3c 01 00 00       	call   4c57 <exp>
    4b1b:	83 c4 10             	add    $0x10,%esp
    4b1e:	dd 45 90             	fldl   -0x70(%ebp)
    4b21:	de f1                	fdivp  %st,%st(1)
    4b23:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    4b26:	dd 45 a0             	fldl   -0x60(%ebp)
    4b29:	dd 05 e0 b1 00 00    	fldl   0xb1e0
    4b2f:	d9 c9                	fxch   %st(1)
    4b31:	df e9                	fucomip %st(1),%st
    4b33:	dd d8                	fstp   %st(0)
    4b35:	77 c8                	ja     4aff <ln+0x9e>
    4b37:	d9 e8                	fld1   
    4b39:	dd 45 a0             	fldl   -0x60(%ebp)
    4b3c:	d9 c9                	fxch   %st(1)
    4b3e:	df e9                	fucomip %st(1),%st
    4b40:	dd d8                	fstp   %st(0)
    4b42:	77 bb                	ja     4aff <ln+0x9e>
		return ln(a)+n;
    4b44:	83 ec 08             	sub    $0x8,%esp
    4b47:	ff 75 a4             	pushl  -0x5c(%ebp)
    4b4a:	ff 75 a0             	pushl  -0x60(%ebp)
    4b4d:	e8 0f ff ff ff       	call   4a61 <ln>
    4b52:	83 c4 10             	add    $0x10,%esp
    4b55:	dc 45 c8             	faddl  -0x38(%ebp)
    4b58:	e9 f8 00 00 00       	jmp    4c55 <ln+0x1f4>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4b5d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    4b64:	d9 e8                	fld1   
    4b66:	dd 5d d8             	fstpl  -0x28(%ebp)
    4b69:	e9 b6 00 00 00       	jmp    4c24 <ln+0x1c3>
	{
		ln_tmp=ln_px;
    4b6e:	dd 45 e8             	fldl   -0x18(%ebp)
    4b71:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    4b74:	dd 45 d8             	fldl   -0x28(%ebp)
    4b77:	dc 4d c0             	fmull  -0x40(%ebp)
    4b7a:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    4b7d:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    4b81:	75 0d                	jne    4b90 <ln+0x12f>
    4b83:	db 45 d4             	fildl  -0x2c(%ebp)
    4b86:	dd 45 d8             	fldl   -0x28(%ebp)
    4b89:	de f1                	fdivp  %st,%st(1)
    4b8b:	dd 5d d8             	fstpl  -0x28(%ebp)
    4b8e:	eb 13                	jmp    4ba3 <ln+0x142>
		else tmp=tmp/-l;
    4b90:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4b93:	f7 d8                	neg    %eax
    4b95:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4b98:	db 45 8c             	fildl  -0x74(%ebp)
    4b9b:	dd 45 d8             	fldl   -0x28(%ebp)
    4b9e:	de f1                	fdivp  %st,%st(1)
    4ba0:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    4ba3:	dd 45 f0             	fldl   -0x10(%ebp)
    4ba6:	dc 45 d8             	faddl  -0x28(%ebp)
    4ba9:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    4bac:	dd 45 d8             	fldl   -0x28(%ebp)
    4baf:	d9 e0                	fchs   
    4bb1:	dc 4d c0             	fmull  -0x40(%ebp)
    4bb4:	db 45 d4             	fildl  -0x2c(%ebp)
    4bb7:	de c9                	fmulp  %st,%st(1)
    4bb9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4bbc:	83 c0 01             	add    $0x1,%eax
    4bbf:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4bc2:	db 45 8c             	fildl  -0x74(%ebp)
    4bc5:	de f9                	fdivrp %st,%st(1)
    4bc7:	dc 45 f0             	faddl  -0x10(%ebp)
    4bca:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    4bcd:	dd 45 d8             	fldl   -0x28(%ebp)
    4bd0:	dc 4d c0             	fmull  -0x40(%ebp)
    4bd3:	dc 4d c0             	fmull  -0x40(%ebp)
    4bd6:	db 45 d4             	fildl  -0x2c(%ebp)
    4bd9:	de c9                	fmulp  %st,%st(1)
    4bdb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4bde:	83 c0 02             	add    $0x2,%eax
    4be1:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4be4:	db 45 8c             	fildl  -0x74(%ebp)
    4be7:	de f9                	fdivrp %st,%st(1)
    4be9:	dc 45 b8             	faddl  -0x48(%ebp)
    4bec:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    4bef:	dd 45 b0             	fldl   -0x50(%ebp)
    4bf2:	dc 65 b8             	fsubl  -0x48(%ebp)
    4bf5:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    4bf8:	dd 45 a8             	fldl   -0x58(%ebp)
    4bfb:	dc 4d a8             	fmull  -0x58(%ebp)
    4bfe:	dd 45 b8             	fldl   -0x48(%ebp)
    4c01:	d8 c0                	fadd   %st(0),%st
    4c03:	dd 45 b0             	fldl   -0x50(%ebp)
    4c06:	de e1                	fsubp  %st,%st(1)
    4c08:	dc 45 f0             	faddl  -0x10(%ebp)
    4c0b:	de f9                	fdivrp %st,%st(1)
    4c0d:	dd 45 b0             	fldl   -0x50(%ebp)
    4c10:	de e1                	fsubp  %st,%st(1)
    4c12:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    4c15:	db 45 d4             	fildl  -0x2c(%ebp)
    4c18:	dd 45 d8             	fldl   -0x28(%ebp)
    4c1b:	de c9                	fmulp  %st,%st(1)
    4c1d:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4c20:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    4c24:	dd 45 e8             	fldl   -0x18(%ebp)
    4c27:	dc 65 e0             	fsubl  -0x20(%ebp)
    4c2a:	dd 05 f8 b1 00 00    	fldl   0xb1f8
    4c30:	d9 c9                	fxch   %st(1)
    4c32:	df e9                	fucomip %st(1),%st
    4c34:	dd d8                	fstp   %st(0)
    4c36:	0f 87 32 ff ff ff    	ja     4b6e <ln+0x10d>
    4c3c:	dd 45 e8             	fldl   -0x18(%ebp)
    4c3f:	dc 65 e0             	fsubl  -0x20(%ebp)
    4c42:	dd 05 00 b2 00 00    	fldl   0xb200
    4c48:	df e9                	fucomip %st(1),%st
    4c4a:	dd d8                	fstp   %st(0)
    4c4c:	0f 87 1c ff ff ff    	ja     4b6e <ln+0x10d>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    4c52:	dd 45 e8             	fldl   -0x18(%ebp)
}
    4c55:	c9                   	leave  
    4c56:	c3                   	ret    

00004c57 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    4c57:	55                   	push   %ebp
    4c58:	89 e5                	mov    %esp,%ebp
    4c5a:	83 ec 68             	sub    $0x68,%esp
    4c5d:	8b 45 08             	mov    0x8(%ebp),%eax
    4c60:	89 45 a0             	mov    %eax,-0x60(%ebp)
    4c63:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c66:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    4c69:	dd 45 a0             	fldl   -0x60(%ebp)
    4c6c:	dd 5d c0             	fstpl  -0x40(%ebp)
    4c6f:	d9 ee                	fldz   
    4c71:	dd 5d f0             	fstpl  -0x10(%ebp)
    4c74:	d9 ee                	fldz   
    4c76:	dd 5d b8             	fstpl  -0x48(%ebp)
    4c79:	d9 ee                	fldz   
    4c7b:	dd 5d b0             	fstpl  -0x50(%ebp)
    4c7e:	d9 ee                	fldz   
    4c80:	dd 5d e8             	fstpl  -0x18(%ebp)
    4c83:	d9 e8                	fld1   
    4c85:	dd 5d e0             	fstpl  -0x20(%ebp)
    4c88:	d9 e8                	fld1   
    4c8a:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    4c8d:	dd 45 a0             	fldl   -0x60(%ebp)
    4c90:	d9 ee                	fldz   
    4c92:	df e9                	fucomip %st(1),%st
    4c94:	dd d8                	fstp   %st(0)
    4c96:	7a 12                	jp     4caa <exp+0x53>
    4c98:	dd 45 a0             	fldl   -0x60(%ebp)
    4c9b:	d9 ee                	fldz   
    4c9d:	df e9                	fucomip %st(1),%st
    4c9f:	dd d8                	fstp   %st(0)
    4ca1:	75 07                	jne    4caa <exp+0x53>
    4ca3:	d9 e8                	fld1   
    4ca5:	e9 12 01 00 00       	jmp    4dbc <exp+0x165>
	if(x<0) return 1/exp(-x); 
    4caa:	d9 ee                	fldz   
    4cac:	dd 45 a0             	fldl   -0x60(%ebp)
    4caf:	d9 c9                	fxch   %st(1)
    4cb1:	df e9                	fucomip %st(1),%st
    4cb3:	dd d8                	fstp   %st(0)
    4cb5:	76 20                	jbe    4cd7 <exp+0x80>
    4cb7:	dd 45 a0             	fldl   -0x60(%ebp)
    4cba:	d9 e0                	fchs   
    4cbc:	83 ec 08             	sub    $0x8,%esp
    4cbf:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4cc3:	dd 1c 24             	fstpl  (%esp)
    4cc6:	e8 8c ff ff ff       	call   4c57 <exp>
    4ccb:	83 c4 10             	add    $0x10,%esp
    4cce:	d9 e8                	fld1   
    4cd0:	de f1                	fdivp  %st,%st(1)
    4cd2:	e9 e5 00 00 00       	jmp    4dbc <exp+0x165>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4cd7:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    4cde:	d9 e8                	fld1   
    4ce0:	dd 5d d0             	fstpl  -0x30(%ebp)
    4ce3:	e9 92 00 00 00       	jmp    4d7a <exp+0x123>
	{
		ex_tmp=ex_px;
    4ce8:	dd 45 e8             	fldl   -0x18(%ebp)
    4ceb:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    4cee:	dd 45 d0             	fldl   -0x30(%ebp)
    4cf1:	dc 4d c0             	fmull  -0x40(%ebp)
    4cf4:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    4cf7:	db 45 cc             	fildl  -0x34(%ebp)
    4cfa:	dd 45 d0             	fldl   -0x30(%ebp)
    4cfd:	de f1                	fdivp  %st,%st(1)
    4cff:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    4d02:	dd 45 f0             	fldl   -0x10(%ebp)
    4d05:	dc 45 d0             	faddl  -0x30(%ebp)
    4d08:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    4d0b:	dd 45 d0             	fldl   -0x30(%ebp)
    4d0e:	dc 4d c0             	fmull  -0x40(%ebp)
    4d11:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4d14:	83 c0 01             	add    $0x1,%eax
    4d17:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4d1a:	db 45 9c             	fildl  -0x64(%ebp)
    4d1d:	de f9                	fdivrp %st,%st(1)
    4d1f:	dc 45 f0             	faddl  -0x10(%ebp)
    4d22:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    4d25:	dd 45 d0             	fldl   -0x30(%ebp)
    4d28:	dc 4d c0             	fmull  -0x40(%ebp)
    4d2b:	dc 4d c0             	fmull  -0x40(%ebp)
    4d2e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4d31:	83 c0 01             	add    $0x1,%eax
    4d34:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4d37:	db 45 9c             	fildl  -0x64(%ebp)
    4d3a:	de f9                	fdivrp %st,%st(1)
    4d3c:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4d3f:	83 c0 02             	add    $0x2,%eax
    4d42:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4d45:	db 45 9c             	fildl  -0x64(%ebp)
    4d48:	de f9                	fdivrp %st,%st(1)
    4d4a:	dc 45 b8             	faddl  -0x48(%ebp)
    4d4d:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    4d50:	dd 45 b0             	fldl   -0x50(%ebp)
    4d53:	dc 65 b8             	fsubl  -0x48(%ebp)
    4d56:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    4d59:	dd 45 d8             	fldl   -0x28(%ebp)
    4d5c:	dc 4d d8             	fmull  -0x28(%ebp)
    4d5f:	dd 45 b8             	fldl   -0x48(%ebp)
    4d62:	d8 c0                	fadd   %st(0),%st
    4d64:	dd 45 b0             	fldl   -0x50(%ebp)
    4d67:	de e1                	fsubp  %st,%st(1)
    4d69:	dc 45 f0             	faddl  -0x10(%ebp)
    4d6c:	de f9                	fdivrp %st,%st(1)
    4d6e:	dd 45 b0             	fldl   -0x50(%ebp)
    4d71:	de e1                	fsubp  %st,%st(1)
    4d73:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4d76:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    4d7a:	dd 45 e8             	fldl   -0x18(%ebp)
    4d7d:	dc 65 e0             	fsubl  -0x20(%ebp)
    4d80:	dd 05 08 b2 00 00    	fldl   0xb208
    4d86:	d9 c9                	fxch   %st(1)
    4d88:	df e9                	fucomip %st(1),%st
    4d8a:	dd d8                	fstp   %st(0)
    4d8c:	77 12                	ja     4da0 <exp+0x149>
    4d8e:	dd 45 e8             	fldl   -0x18(%ebp)
    4d91:	dc 65 e0             	fsubl  -0x20(%ebp)
    4d94:	dd 05 10 b2 00 00    	fldl   0xb210
    4d9a:	df e9                	fucomip %st(1),%st
    4d9c:	dd d8                	fstp   %st(0)
    4d9e:	76 15                	jbe    4db5 <exp+0x15e>
    4da0:	dd 45 d8             	fldl   -0x28(%ebp)
    4da3:	dd 05 08 b2 00 00    	fldl   0xb208
    4da9:	d9 c9                	fxch   %st(1)
    4dab:	df e9                	fucomip %st(1),%st
    4dad:	dd d8                	fstp   %st(0)
    4daf:	0f 87 33 ff ff ff    	ja     4ce8 <exp+0x91>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    4db5:	dd 45 e8             	fldl   -0x18(%ebp)
    4db8:	d9 e8                	fld1   
    4dba:	de c1                	faddp  %st,%st(1)
    4dbc:	c9                   	leave  
    4dbd:	c3                   	ret    

00004dbe <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    4dbe:	55                   	push   %ebp
    4dbf:	89 e5                	mov    %esp,%ebp
    4dc1:	83 ec 68             	sub    $0x68,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    4dc4:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    4dc8:	83 ec 08             	sub    $0x8,%esp
    4dcb:	ff 75 08             	pushl  0x8(%ebp)
    4dce:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4dd1:	50                   	push   %eax
    4dd2:	e8 f7 f1 ff ff       	call   3fce <strcpy>
    4dd7:	83 c4 10             	add    $0x10,%esp
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    4dda:	83 ec 08             	sub    $0x8,%esp
    4ddd:	6a 02                	push   $0x2
    4ddf:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4de2:	50                   	push   %eax
    4de3:	e8 56 f4 ff ff       	call   423e <open>
    4de8:	83 c4 10             	add    $0x10,%esp
    4deb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4dee:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4df2:	75 16                	jne    4e0a <OpenTableFile+0x4c>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    4df4:	83 ec 04             	sub    $0x4,%esp
    4df7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4dfa:	50                   	push   %eax
    4dfb:	68 44 b2 00 00       	push   $0xb244
    4e00:	6a 00                	push   $0x0
    4e02:	e8 d4 f5 ff ff       	call   43db <printf>
    4e07:	83 c4 10             	add    $0x10,%esp
    }
    return f;
    4e0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4e0d:	c9                   	leave  
    4e0e:	c3                   	ret    

00004e0f <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    4e0f:	55                   	push   %ebp
    4e10:	89 e5                	mov    %esp,%ebp
    4e12:	57                   	push   %edi
    4e13:	56                   	push   %esi
    4e14:	53                   	push   %ebx
    4e15:	83 ec 1c             	sub    $0x1c,%esp
	layer *info = fr_ps->header;
    4e18:	8b 45 08             	mov    0x8(%ebp),%eax
    4e1b:	8b 00                	mov    (%eax),%eax
    4e1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4e20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e23:	8b 78 14             	mov    0x14(%eax),%edi
    4e26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e29:	8b 70 10             	mov    0x10(%eax),%esi
    4e2c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e2f:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    4e32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e35:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4e38:	85 c0                	test   %eax,%eax
    4e3a:	0f 94 c0             	sete   %al
    4e3d:	0f b6 c8             	movzbl %al,%ecx
    4e40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e43:	8b 50 04             	mov    0x4(%eax),%edx
    4e46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e49:	8b 00                	mov    (%eax),%eax
    4e4b:	57                   	push   %edi
    4e4c:	56                   	push   %esi
    4e4d:	53                   	push   %ebx
    4e4e:	51                   	push   %ecx
    4e4f:	52                   	push   %edx
    4e50:	50                   	push   %eax
    4e51:	68 64 b2 00 00       	push   $0xb264
    4e56:	6a 00                	push   $0x0
    4e58:	e8 7e f5 ff ff       	call   43db <printf>
    4e5d:	83 c4 20             	add    $0x20,%esp
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    4e60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e63:	8b 78 2c             	mov    0x2c(%eax),%edi
    4e66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e69:	8b 70 28             	mov    0x28(%eax),%esi
    4e6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e6f:	8b 58 24             	mov    0x24(%eax),%ebx
    4e72:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e75:	8b 48 20             	mov    0x20(%eax),%ecx
    4e78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e7b:	8b 50 1c             	mov    0x1c(%eax),%edx
    4e7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e81:	8b 40 18             	mov    0x18(%eax),%eax
    4e84:	57                   	push   %edi
    4e85:	56                   	push   %esi
    4e86:	53                   	push   %ebx
    4e87:	51                   	push   %ecx
    4e88:	52                   	push   %edx
    4e89:	50                   	push   %eax
    4e8a:	68 a4 b2 00 00       	push   $0xb2a4
    4e8f:	6a 00                	push   $0x0
    4e91:	e8 45 f5 ff ff       	call   43db <printf>
    4e96:	83 c4 20             	add    $0x20,%esp
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4e99:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e9c:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4e9f:	8b 0c 85 60 f3 00 00 	mov    0xf360(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4ea6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ea9:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4eac:	dd 04 c5 40 f3 00 00 	fldl   0xf340(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4eb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4eb6:	8b 40 04             	mov    0x4(%eax),%eax
    4eb9:	8d 50 ff             	lea    -0x1(%eax),%edx
    4ebc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ebf:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4ec2:	89 d0                	mov    %edx,%eax
    4ec4:	c1 e0 04             	shl    $0x4,%eax
    4ec7:	29 d0                	sub    %edx,%eax
    4ec9:	01 d8                	add    %ebx,%eax
    4ecb:	8b 14 85 80 f2 00 00 	mov    0xf280(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4ed2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ed5:	8b 40 04             	mov    0x4(%eax),%eax
    4ed8:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4edb:	8b 04 85 40 f2 00 00 	mov    0xf240(,%eax,4),%eax
    4ee2:	83 ec 04             	sub    $0x4,%esp
    4ee5:	51                   	push   %ecx
    4ee6:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4eea:	dd 1c 24             	fstpl  (%esp)
    4eed:	52                   	push   %edx
    4eee:	50                   	push   %eax
    4eef:	68 cc b2 00 00       	push   $0xb2cc
    4ef4:	6a 00                	push   $0x0
    4ef6:	e8 e0 f4 ff ff       	call   43db <printf>
    4efb:	83 c4 20             	add    $0x20,%esp
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    4efe:	8b 45 08             	mov    0x8(%ebp),%eax
    4f01:	8b 48 08             	mov    0x8(%eax),%ecx
    4f04:	8b 45 08             	mov    0x8(%ebp),%eax
    4f07:	8b 50 0c             	mov    0xc(%eax),%edx
    4f0a:	8b 45 08             	mov    0x8(%ebp),%eax
    4f0d:	8b 40 10             	mov    0x10(%eax),%eax
    4f10:	83 ec 0c             	sub    $0xc,%esp
    4f13:	51                   	push   %ecx
    4f14:	52                   	push   %edx
    4f15:	50                   	push   %eax
    4f16:	68 fb b2 00 00       	push   $0xb2fb
    4f1b:	6a 00                	push   $0x0
    4f1d:	e8 b9 f4 ff ff       	call   43db <printf>
    4f22:	83 c4 20             	add    $0x20,%esp
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    4f25:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4f28:	5b                   	pop    %ebx
    4f29:	5e                   	pop    %esi
    4f2a:	5f                   	pop    %edi
    4f2b:	5d                   	pop    %ebp
    4f2c:	c3                   	ret    

00004f2d <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    4f2d:	55                   	push   %ebp
    4f2e:	89 e5                	mov    %esp,%ebp
    4f30:	83 ec 18             	sub    $0x18,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    4f33:	83 ec 0c             	sub    $0xc,%esp
    4f36:	ff 75 08             	pushl  0x8(%ebp)
    4f39:	e8 6e f7 ff ff       	call   46ac <malloc>
    4f3e:	83 c4 10             	add    $0x10,%esp
    4f41:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    4f44:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4f48:	74 15                	je     4f5f <mem_alloc+0x32>
		memset(ptr, 0, block);
    4f4a:	83 ec 04             	sub    $0x4,%esp
    4f4d:	ff 75 08             	pushl  0x8(%ebp)
    4f50:	6a 00                	push   $0x0
    4f52:	ff 75 f4             	pushl  -0xc(%ebp)
    4f55:	e8 0a f1 ff ff       	call   4064 <memset>
    4f5a:	83 c4 10             	add    $0x10,%esp
    4f5d:	eb 1a                	jmp    4f79 <mem_alloc+0x4c>
	else{
		printf(0, "Unable to allocate %s\n", item);
    4f5f:	83 ec 04             	sub    $0x4,%esp
    4f62:	ff 75 0c             	pushl  0xc(%ebp)
    4f65:	68 15 b3 00 00       	push   $0xb315
    4f6a:	6a 00                	push   $0x0
    4f6c:	e8 6a f4 ff ff       	call   43db <printf>
    4f71:	83 c4 10             	add    $0x10,%esp
		exit();
    4f74:	e8 85 f2 ff ff       	call   41fe <exit>
	}
	return ptr;
    4f79:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4f7c:	c9                   	leave  
    4f7d:	c3                   	ret    

00004f7e <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    4f7e:	55                   	push   %ebp
    4f7f:	89 e5                	mov    %esp,%ebp
    4f81:	83 ec 08             	sub    $0x8,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    4f84:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f87:	83 ec 08             	sub    $0x8,%esp
    4f8a:	68 2c b3 00 00       	push   $0xb32c
    4f8f:	50                   	push   %eax
    4f90:	e8 98 ff ff ff       	call   4f2d <mem_alloc>
    4f95:	83 c4 10             	add    $0x10,%esp
    4f98:	89 c2                	mov    %eax,%edx
    4f9a:	8b 45 08             	mov    0x8(%ebp),%eax
    4f9d:	89 50 04             	mov    %edx,0x4(%eax)
	bs->buf_size = size;
    4fa0:	8b 45 08             	mov    0x8(%ebp),%eax
    4fa3:	8b 55 0c             	mov    0xc(%ebp),%edx
    4fa6:	89 50 08             	mov    %edx,0x8(%eax)
}
    4fa9:	c9                   	leave  
    4faa:	c3                   	ret    

00004fab <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    4fab:	55                   	push   %ebp
    4fac:	89 e5                	mov    %esp,%ebp
    4fae:	83 ec 08             	sub    $0x8,%esp
	free(bs->buf);
    4fb1:	8b 45 08             	mov    0x8(%ebp),%eax
    4fb4:	8b 40 04             	mov    0x4(%eax),%eax
    4fb7:	83 ec 0c             	sub    $0xc,%esp
    4fba:	50                   	push   %eax
    4fbb:	e8 ab f5 ff ff       	call   456b <free>
    4fc0:	83 c4 10             	add    $0x10,%esp
}
    4fc3:	c9                   	leave  
    4fc4:	c3                   	ret    

00004fc5 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    4fc5:	55                   	push   %ebp
    4fc6:	89 e5                	mov    %esp,%ebp
    4fc8:	83 ec 08             	sub    $0x8,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    4fcb:	83 ec 08             	sub    $0x8,%esp
    4fce:	6a 02                	push   $0x2
    4fd0:	ff 75 0c             	pushl  0xc(%ebp)
    4fd3:	e8 66 f2 ff ff       	call   423e <open>
    4fd8:	83 c4 10             	add    $0x10,%esp
    4fdb:	89 c2                	mov    %eax,%edx
    4fdd:	8b 45 08             	mov    0x8(%ebp),%eax
    4fe0:	89 10                	mov    %edx,(%eax)
    4fe2:	8b 45 08             	mov    0x8(%ebp),%eax
    4fe5:	8b 00                	mov    (%eax),%eax
    4fe7:	83 f8 ff             	cmp    $0xffffffff,%eax
    4fea:	75 1a                	jne    5006 <open_bit_stream_r+0x41>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    4fec:	83 ec 04             	sub    $0x4,%esp
    4fef:	ff 75 0c             	pushl  0xc(%ebp)
    4ff2:	68 33 b3 00 00       	push   $0xb333
    4ff7:	6a 00                	push   $0x0
    4ff9:	e8 dd f3 ff ff       	call   43db <printf>
    4ffe:	83 c4 10             	add    $0x10,%esp
		exit();
    5001:	e8 f8 f1 ff ff       	call   41fe <exit>
	}

	bs->format = BINARY;
    5006:	8b 45 08             	mov    0x8(%ebp),%eax
    5009:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    500d:	83 ec 08             	sub    $0x8,%esp
    5010:	ff 75 10             	pushl  0x10(%ebp)
    5013:	ff 75 08             	pushl  0x8(%ebp)
    5016:	e8 63 ff ff ff       	call   4f7e <alloc_buffer>
    501b:	83 c4 10             	add    $0x10,%esp
	bs->buf_byte_idx=0;
    501e:	8b 45 08             	mov    0x8(%ebp),%eax
    5021:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    5028:	8b 45 08             	mov    0x8(%ebp),%eax
    502b:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    5032:	8b 45 08             	mov    0x8(%ebp),%eax
    5035:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    503c:	8b 45 08             	mov    0x8(%ebp),%eax
    503f:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    5046:	8b 45 08             	mov    0x8(%ebp),%eax
    5049:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    5050:	8b 45 08             	mov    0x8(%ebp),%eax
    5053:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    505a:	c9                   	leave  
    505b:	c3                   	ret    

0000505c <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    505c:	55                   	push   %ebp
    505d:	89 e5                	mov    %esp,%ebp
    505f:	83 ec 08             	sub    $0x8,%esp
	close(bs->pt);
    5062:	8b 45 08             	mov    0x8(%ebp),%eax
    5065:	8b 00                	mov    (%eax),%eax
    5067:	83 ec 0c             	sub    $0xc,%esp
    506a:	50                   	push   %eax
    506b:	e8 b6 f1 ff ff       	call   4226 <close>
    5070:	83 c4 10             	add    $0x10,%esp
	desalloc_buffer(bs);
    5073:	83 ec 0c             	sub    $0xc,%esp
    5076:	ff 75 08             	pushl  0x8(%ebp)
    5079:	e8 2d ff ff ff       	call   4fab <desalloc_buffer>
    507e:	83 c4 10             	add    $0x10,%esp
}
    5081:	c9                   	leave  
    5082:	c3                   	ret    

00005083 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    5083:	55                   	push   %ebp
    5084:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    5086:	8b 45 08             	mov    0x8(%ebp),%eax
    5089:	8b 40 20             	mov    0x20(%eax),%eax
}
    508c:	5d                   	pop    %ebp
    508d:	c3                   	ret    

0000508e <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    508e:	55                   	push   %ebp
    508f:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    5091:	8b 45 08             	mov    0x8(%ebp),%eax
    5094:	8b 40 0c             	mov    0xc(%eax),%eax
}
    5097:	5d                   	pop    %ebp
    5098:	c3                   	ret    

00005099 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    5099:	55                   	push   %ebp
    509a:	89 e5                	mov    %esp,%ebp
    509c:	56                   	push   %esi
    509d:	53                   	push   %ebx
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    509e:	8b 45 08             	mov    0x8(%ebp),%eax
    50a1:	8b 40 08             	mov    0x8(%eax),%eax
    50a4:	8d 50 fe             	lea    -0x2(%eax),%edx
    50a7:	8b 45 08             	mov    0x8(%ebp),%eax
    50aa:	8b 40 10             	mov    0x10(%eax),%eax
    50ad:	89 d3                	mov    %edx,%ebx
    50af:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    50b1:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    50b6:	eb 30                	jmp    50e8 <refill_buffer+0x4f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    50b8:	8b 45 08             	mov    0x8(%ebp),%eax
    50bb:	8b 50 04             	mov    0x4(%eax),%edx
    50be:	89 d8                	mov    %ebx,%eax
    50c0:	8d 58 ff             	lea    -0x1(%eax),%ebx
    50c3:	01 c2                	add    %eax,%edx
    50c5:	8b 45 08             	mov    0x8(%ebp),%eax
    50c8:	8b 00                	mov    (%eax),%eax
    50ca:	83 ec 04             	sub    $0x4,%esp
    50cd:	6a 01                	push   $0x1
    50cf:	52                   	push   %edx
    50d0:	50                   	push   %eax
    50d1:	e8 40 f1 ff ff       	call   4216 <read>
    50d6:	83 c4 10             	add    $0x10,%esp
    50d9:	89 c6                	mov    %eax,%esi
		if (!n)
    50db:	85 f6                	test   %esi,%esi
    50dd:	75 09                	jne    50e8 <refill_buffer+0x4f>
		bs->eob= i+1;
    50df:	8d 53 01             	lea    0x1(%ebx),%edx
    50e2:	8b 45 08             	mov    0x8(%ebp),%eax
    50e5:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    50e8:	85 db                	test   %ebx,%ebx
    50ea:	78 0a                	js     50f6 <refill_buffer+0x5d>
    50ec:	8b 45 08             	mov    0x8(%ebp),%eax
    50ef:	8b 40 1c             	mov    0x1c(%eax),%eax
    50f2:	85 c0                	test   %eax,%eax
    50f4:	74 c2                	je     50b8 <refill_buffer+0x1f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    50f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    50f9:	5b                   	pop    %ebx
    50fa:	5e                   	pop    %esi
    50fb:	5d                   	pop    %ebp
    50fc:	c3                   	ret    

000050fd <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    50fd:	55                   	push   %ebp
    50fe:	89 e5                	mov    %esp,%ebp
    5100:	53                   	push   %ebx
    5101:	83 ec 14             	sub    $0x14,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    5104:	8b 45 08             	mov    0x8(%ebp),%eax
    5107:	8b 40 0c             	mov    0xc(%eax),%eax
    510a:	8d 50 01             	lea    0x1(%eax),%edx
    510d:	8b 45 08             	mov    0x8(%ebp),%eax
    5110:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    5113:	8b 45 08             	mov    0x8(%ebp),%eax
    5116:	8b 40 14             	mov    0x14(%eax),%eax
    5119:	85 c0                	test   %eax,%eax
    511b:	0f 85 a2 00 00 00    	jne    51c3 <get1bit+0xc6>
        bs->buf_bit_idx = 8;
    5121:	8b 45 08             	mov    0x8(%ebp),%eax
    5124:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    512b:	8b 45 08             	mov    0x8(%ebp),%eax
    512e:	8b 40 10             	mov    0x10(%eax),%eax
    5131:	8d 50 ff             	lea    -0x1(%eax),%edx
    5134:	8b 45 08             	mov    0x8(%ebp),%eax
    5137:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    513a:	8b 45 08             	mov    0x8(%ebp),%eax
    513d:	8b 40 10             	mov    0x10(%eax),%eax
    5140:	83 f8 03             	cmp    $0x3,%eax
    5143:	7e 10                	jle    5155 <get1bit+0x58>
    5145:	8b 45 08             	mov    0x8(%ebp),%eax
    5148:	8b 50 10             	mov    0x10(%eax),%edx
    514b:	8b 45 08             	mov    0x8(%ebp),%eax
    514e:	8b 40 1c             	mov    0x1c(%eax),%eax
    5151:	39 c2                	cmp    %eax,%edx
    5153:	7d 6e                	jge    51c3 <get1bit+0xc6>
             if (bs->eob)
    5155:	8b 45 08             	mov    0x8(%ebp),%eax
    5158:	8b 40 1c             	mov    0x1c(%eax),%eax
    515b:	85 c0                	test   %eax,%eax
    515d:	74 0c                	je     516b <get1bit+0x6e>
                bs->eobs = TRUE;
    515f:	8b 45 08             	mov    0x8(%ebp),%eax
    5162:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5169:	eb 58                	jmp    51c3 <get1bit+0xc6>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    516b:	8b 45 08             	mov    0x8(%ebp),%eax
    516e:	8b 58 10             	mov    0x10(%eax),%ebx
    5171:	eb 2f                	jmp    51a2 <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5173:	8b 45 08             	mov    0x8(%ebp),%eax
    5176:	8b 50 04             	mov    0x4(%eax),%edx
    5179:	8b 45 08             	mov    0x8(%ebp),%eax
    517c:	8b 40 08             	mov    0x8(%eax),%eax
    517f:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5182:	8b 45 08             	mov    0x8(%ebp),%eax
    5185:	8b 40 10             	mov    0x10(%eax),%eax
    5188:	29 c1                	sub    %eax,%ecx
    518a:	89 c8                	mov    %ecx,%eax
    518c:	01 d8                	add    %ebx,%eax
    518e:	01 c2                	add    %eax,%edx
    5190:	8b 45 08             	mov    0x8(%ebp),%eax
    5193:	8b 40 04             	mov    0x4(%eax),%eax
    5196:	89 d9                	mov    %ebx,%ecx
    5198:	01 c8                	add    %ecx,%eax
    519a:	0f b6 00             	movzbl (%eax),%eax
    519d:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    519f:	83 eb 01             	sub    $0x1,%ebx
    51a2:	85 db                	test   %ebx,%ebx
    51a4:	79 cd                	jns    5173 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    51a6:	83 ec 0c             	sub    $0xc,%esp
    51a9:	ff 75 08             	pushl  0x8(%ebp)
    51ac:	e8 e8 fe ff ff       	call   5099 <refill_buffer>
    51b1:	83 c4 10             	add    $0x10,%esp
                bs->buf_byte_idx = bs->buf_size-1;
    51b4:	8b 45 08             	mov    0x8(%ebp),%eax
    51b7:	8b 40 08             	mov    0x8(%eax),%eax
    51ba:	8d 50 ff             	lea    -0x1(%eax),%edx
    51bd:	8b 45 08             	mov    0x8(%ebp),%eax
    51c0:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    51c3:	8b 45 08             	mov    0x8(%ebp),%eax
    51c6:	8b 50 04             	mov    0x4(%eax),%edx
    51c9:	8b 45 08             	mov    0x8(%ebp),%eax
    51cc:	8b 40 10             	mov    0x10(%eax),%eax
    51cf:	01 d0                	add    %edx,%eax
    51d1:	0f b6 00             	movzbl (%eax),%eax
    51d4:	0f b6 d0             	movzbl %al,%edx
    51d7:	8b 45 08             	mov    0x8(%ebp),%eax
    51da:	8b 40 14             	mov    0x14(%eax),%eax
    51dd:	83 e8 01             	sub    $0x1,%eax
    51e0:	8b 04 85 80 f3 00 00 	mov    0xf380(,%eax,4),%eax
    51e7:	21 d0                	and    %edx,%eax
    51e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    51ec:	8b 45 08             	mov    0x8(%ebp),%eax
    51ef:	8b 40 14             	mov    0x14(%eax),%eax
    51f2:	83 e8 01             	sub    $0x1,%eax
    51f5:	89 c1                	mov    %eax,%ecx
    51f7:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    51fa:	8b 45 08             	mov    0x8(%ebp),%eax
    51fd:	8b 40 14             	mov    0x14(%eax),%eax
    5200:	8d 50 ff             	lea    -0x1(%eax),%edx
    5203:	8b 45 08             	mov    0x8(%ebp),%eax
    5206:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    5209:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    520c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    520f:	c9                   	leave  
    5210:	c3                   	ret    

00005211 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    5211:	55                   	push   %ebp
    5212:	89 e5                	mov    %esp,%ebp
    5214:	57                   	push   %edi
    5215:	56                   	push   %esi
    5216:	53                   	push   %ebx
    5217:	83 ec 1c             	sub    $0x1c,%esp
	unsigned long val=0;
    521a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    5221:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    5224:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    5228:	7e 14                	jle    523e <getbits+0x2d>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    522a:	83 ec 04             	sub    $0x4,%esp
    522d:	6a 20                	push   $0x20
    522f:	68 4c b3 00 00       	push   $0xb34c
    5234:	6a 00                	push   $0x0
    5236:	e8 a0 f1 ff ff       	call   43db <printf>
    523b:	83 c4 10             	add    $0x10,%esp

	bs->totbit += N;
    523e:	8b 45 08             	mov    0x8(%ebp),%eax
    5241:	8b 50 0c             	mov    0xc(%eax),%edx
    5244:	8b 45 0c             	mov    0xc(%ebp),%eax
    5247:	01 c2                	add    %eax,%edx
    5249:	8b 45 08             	mov    0x8(%ebp),%eax
    524c:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    524f:	e9 0d 01 00 00       	jmp    5361 <getbits+0x150>
		if (!bs->buf_bit_idx) {
    5254:	8b 45 08             	mov    0x8(%ebp),%eax
    5257:	8b 40 14             	mov    0x14(%eax),%eax
    525a:	85 c0                	test   %eax,%eax
    525c:	0f 85 a2 00 00 00    	jne    5304 <getbits+0xf3>
			bs->buf_bit_idx = 8;
    5262:	8b 45 08             	mov    0x8(%ebp),%eax
    5265:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    526c:	8b 45 08             	mov    0x8(%ebp),%eax
    526f:	8b 40 10             	mov    0x10(%eax),%eax
    5272:	8d 50 ff             	lea    -0x1(%eax),%edx
    5275:	8b 45 08             	mov    0x8(%ebp),%eax
    5278:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    527b:	8b 45 08             	mov    0x8(%ebp),%eax
    527e:	8b 40 10             	mov    0x10(%eax),%eax
    5281:	83 f8 03             	cmp    $0x3,%eax
    5284:	7e 10                	jle    5296 <getbits+0x85>
    5286:	8b 45 08             	mov    0x8(%ebp),%eax
    5289:	8b 50 10             	mov    0x10(%eax),%edx
    528c:	8b 45 08             	mov    0x8(%ebp),%eax
    528f:	8b 40 1c             	mov    0x1c(%eax),%eax
    5292:	39 c2                	cmp    %eax,%edx
    5294:	7d 6e                	jge    5304 <getbits+0xf3>
				if (bs->eob)
    5296:	8b 45 08             	mov    0x8(%ebp),%eax
    5299:	8b 40 1c             	mov    0x1c(%eax),%eax
    529c:	85 c0                	test   %eax,%eax
    529e:	74 0c                	je     52ac <getbits+0x9b>
					bs->eobs = TRUE;
    52a0:	8b 45 08             	mov    0x8(%ebp),%eax
    52a3:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    52aa:	eb 58                	jmp    5304 <getbits+0xf3>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    52ac:	8b 45 08             	mov    0x8(%ebp),%eax
    52af:	8b 70 10             	mov    0x10(%eax),%esi
    52b2:	eb 2f                	jmp    52e3 <getbits+0xd2>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    52b4:	8b 45 08             	mov    0x8(%ebp),%eax
    52b7:	8b 50 04             	mov    0x4(%eax),%edx
    52ba:	8b 45 08             	mov    0x8(%ebp),%eax
    52bd:	8b 40 08             	mov    0x8(%eax),%eax
    52c0:	8d 48 ff             	lea    -0x1(%eax),%ecx
    52c3:	8b 45 08             	mov    0x8(%ebp),%eax
    52c6:	8b 40 10             	mov    0x10(%eax),%eax
    52c9:	29 c1                	sub    %eax,%ecx
    52cb:	89 c8                	mov    %ecx,%eax
    52cd:	01 f0                	add    %esi,%eax
    52cf:	01 c2                	add    %eax,%edx
    52d1:	8b 45 08             	mov    0x8(%ebp),%eax
    52d4:	8b 40 04             	mov    0x4(%eax),%eax
    52d7:	89 f1                	mov    %esi,%ecx
    52d9:	01 c8                	add    %ecx,%eax
    52db:	0f b6 00             	movzbl (%eax),%eax
    52de:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    52e0:	83 ee 01             	sub    $0x1,%esi
    52e3:	85 f6                	test   %esi,%esi
    52e5:	79 cd                	jns    52b4 <getbits+0xa3>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    52e7:	83 ec 0c             	sub    $0xc,%esp
    52ea:	ff 75 08             	pushl  0x8(%ebp)
    52ed:	e8 a7 fd ff ff       	call   5099 <refill_buffer>
    52f2:	83 c4 10             	add    $0x10,%esp
					bs->buf_byte_idx = bs->buf_size-1;
    52f5:	8b 45 08             	mov    0x8(%ebp),%eax
    52f8:	8b 40 08             	mov    0x8(%eax),%eax
    52fb:	8d 50 ff             	lea    -0x1(%eax),%edx
    52fe:	8b 45 08             	mov    0x8(%ebp),%eax
    5301:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    5304:	8b 45 08             	mov    0x8(%ebp),%eax
    5307:	8b 40 14             	mov    0x14(%eax),%eax
    530a:	39 d8                	cmp    %ebx,%eax
    530c:	0f 4f c3             	cmovg  %ebx,%eax
    530f:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    5311:	8b 45 08             	mov    0x8(%ebp),%eax
    5314:	8b 50 04             	mov    0x4(%eax),%edx
    5317:	8b 45 08             	mov    0x8(%ebp),%eax
    531a:	8b 40 10             	mov    0x10(%eax),%eax
    531d:	01 d0                	add    %edx,%eax
    531f:	0f b6 00             	movzbl (%eax),%eax
    5322:	0f b6 d0             	movzbl %al,%edx
    5325:	8b 45 08             	mov    0x8(%ebp),%eax
    5328:	8b 40 14             	mov    0x14(%eax),%eax
    532b:	8b 04 85 a0 f3 00 00 	mov    0xf3a0(,%eax,4),%eax
    5332:	89 d7                	mov    %edx,%edi
    5334:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    5336:	8b 45 08             	mov    0x8(%ebp),%eax
    5339:	8b 40 14             	mov    0x14(%eax),%eax
    533c:	29 f0                	sub    %esi,%eax
    533e:	89 c1                	mov    %eax,%ecx
    5340:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    5342:	89 d8                	mov    %ebx,%eax
    5344:	29 f0                	sub    %esi,%eax
    5346:	89 c1                	mov    %eax,%ecx
    5348:	d3 e7                	shl    %cl,%edi
    534a:	89 f8                	mov    %edi,%eax
    534c:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    534f:	8b 45 08             	mov    0x8(%ebp),%eax
    5352:	8b 40 14             	mov    0x14(%eax),%eax
    5355:	29 f0                	sub    %esi,%eax
    5357:	89 c2                	mov    %eax,%edx
    5359:	8b 45 08             	mov    0x8(%ebp),%eax
    535c:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    535f:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    5361:	85 db                	test   %ebx,%ebx
    5363:	0f 8f eb fe ff ff    	jg     5254 <getbits+0x43>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    5369:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    536c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    536f:	5b                   	pop    %ebx
    5370:	5e                   	pop    %esi
    5371:	5f                   	pop    %edi
    5372:	5d                   	pop    %ebp
    5373:	c3                   	ret    

00005374 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    5374:	55                   	push   %ebp
    5375:	89 e5                	mov    %esp,%ebp
    5377:	83 ec 28             	sub    $0x28,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    537a:	db 45 10             	fildl  0x10(%ebp)
    537d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5381:	dd 1c 24             	fstpl  (%esp)
    5384:	dd 05 b8 b3 00 00    	fldl   0xb3b8
    538a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    538e:	dd 1c 24             	fstpl  (%esp)
    5391:	e8 0f f5 ff ff       	call   48a5 <pow>
    5396:	83 c4 10             	add    $0x10,%esp
    5399:	d9 7d e6             	fnstcw -0x1a(%ebp)
    539c:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    53a0:	b4 0c                	mov    $0xc,%ah
    53a2:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    53a6:	d9 6d e4             	fldcw  -0x1c(%ebp)
    53a9:	db 5d e0             	fistpl -0x20(%ebp)
    53ac:	d9 6d e6             	fldcw  -0x1a(%ebp)
    53af:	8b 45 e0             	mov    -0x20(%ebp),%eax
    53b2:	83 e8 01             	sub    $0x1,%eax
    53b5:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    53b8:	83 ec 0c             	sub    $0xc,%esp
    53bb:	ff 75 08             	pushl  0x8(%ebp)
    53be:	e8 cb fc ff ff       	call   508e <sstell>
    53c3:	83 c4 10             	add    $0x10,%esp
    53c6:	83 e0 07             	and    $0x7,%eax
    53c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    53cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    53d0:	74 17                	je     53e9 <seek_sync+0x75>
		getbits(bs, (int)(ALIGNING-aligning));
    53d2:	b8 08 00 00 00       	mov    $0x8,%eax
    53d7:	2b 45 ec             	sub    -0x14(%ebp),%eax
    53da:	83 ec 08             	sub    $0x8,%esp
    53dd:	50                   	push   %eax
    53de:	ff 75 08             	pushl  0x8(%ebp)
    53e1:	e8 2b fe ff ff       	call   5211 <getbits>
    53e6:	83 c4 10             	add    $0x10,%esp

	val = getbits(bs, N);
    53e9:	83 ec 08             	sub    $0x8,%esp
    53ec:	ff 75 10             	pushl  0x10(%ebp)
    53ef:	ff 75 08             	pushl  0x8(%ebp)
    53f2:	e8 1a fe ff ff       	call   5211 <getbits>
    53f7:	83 c4 10             	add    $0x10,%esp
    53fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    53fd:	eb 17                	jmp    5416 <seek_sync+0xa2>
		val <<= ALIGNING;
    53ff:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    5403:	83 ec 08             	sub    $0x8,%esp
    5406:	6a 08                	push   $0x8
    5408:	ff 75 08             	pushl  0x8(%ebp)
    540b:	e8 01 fe ff ff       	call   5211 <getbits>
    5410:	83 c4 10             	add    $0x10,%esp
    5413:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    5416:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5419:	23 45 f4             	and    -0xc(%ebp),%eax
    541c:	3b 45 0c             	cmp    0xc(%ebp),%eax
    541f:	74 12                	je     5433 <seek_sync+0xbf>
    5421:	83 ec 0c             	sub    $0xc,%esp
    5424:	ff 75 08             	pushl  0x8(%ebp)
    5427:	e8 57 fc ff ff       	call   5083 <end_bs>
    542c:	83 c4 10             	add    $0x10,%esp
    542f:	85 c0                	test   %eax,%eax
    5431:	74 cc                	je     53ff <seek_sync+0x8b>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    5433:	83 ec 0c             	sub    $0xc,%esp
    5436:	ff 75 08             	pushl  0x8(%ebp)
    5439:	e8 45 fc ff ff       	call   5083 <end_bs>
    543e:	83 c4 10             	add    $0x10,%esp
    5441:	85 c0                	test   %eax,%eax
    5443:	74 07                	je     544c <seek_sync+0xd8>
		return(0);
    5445:	b8 00 00 00 00       	mov    $0x0,%eax
    544a:	eb 05                	jmp    5451 <seek_sync+0xdd>
	else
		return(1);
    544c:	b8 01 00 00 00       	mov    $0x1,%eax
}
    5451:	c9                   	leave  
    5452:	c3                   	ret    

00005453 <js_bound>:

int js_bound(int lay, int m_ext)
{
    5453:	55                   	push   %ebp
    5454:	89 e5                	mov    %esp,%ebp
    5456:	83 ec 08             	sub    $0x8,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    5459:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    545d:	7e 12                	jle    5471 <js_bound+0x1e>
    545f:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    5463:	7f 0c                	jg     5471 <js_bound+0x1e>
    5465:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5469:	78 06                	js     5471 <js_bound+0x1e>
    546b:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    546f:	7e 1a                	jle    548b <js_bound+0x38>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    5471:	ff 75 0c             	pushl  0xc(%ebp)
    5474:	ff 75 08             	pushl  0x8(%ebp)
    5477:	68 80 b3 00 00       	push   $0xb380
    547c:	6a 00                	push   $0x0
    547e:	e8 58 ef ff ff       	call   43db <printf>
    5483:	83 c4 10             	add    $0x10,%esp
        exit();
    5486:	e8 73 ed ff ff       	call   41fe <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    548b:	8b 45 08             	mov    0x8(%ebp),%eax
    548e:	83 e8 01             	sub    $0x1,%eax
    5491:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    5498:	8b 45 0c             	mov    0xc(%ebp),%eax
    549b:	01 d0                	add    %edx,%eax
    549d:	8b 04 85 e0 f3 00 00 	mov    0xf3e0(,%eax,4),%eax
}
    54a4:	c9                   	leave  
    54a5:	c3                   	ret    

000054a6 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    54a6:	55                   	push   %ebp
    54a7:	89 e5                	mov    %esp,%ebp
    54a9:	83 ec 18             	sub    $0x18,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    54ac:	8b 45 08             	mov    0x8(%ebp),%eax
    54af:	8b 00                	mov    (%eax),%eax
    54b1:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    54b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54b7:	8b 50 1c             	mov    0x1c(%eax),%edx
    54ba:	8b 45 08             	mov    0x8(%ebp),%eax
    54bd:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    54c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54c3:	8b 40 1c             	mov    0x1c(%eax),%eax
    54c6:	83 f8 03             	cmp    $0x3,%eax
    54c9:	75 07                	jne    54d2 <hdr_to_frps+0x2c>
    54cb:	ba 01 00 00 00       	mov    $0x1,%edx
    54d0:	eb 05                	jmp    54d7 <hdr_to_frps+0x31>
    54d2:	ba 02 00 00 00       	mov    $0x2,%edx
    54d7:	8b 45 08             	mov    0x8(%ebp),%eax
    54da:	89 50 08             	mov    %edx,0x8(%eax)
	fr_ps->sblimit = SBLIMIT;
    54dd:	8b 45 08             	mov    0x8(%ebp),%eax
    54e0:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    54e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54ea:	8b 40 1c             	mov    0x1c(%eax),%eax
    54ed:	83 f8 01             	cmp    $0x1,%eax
    54f0:	75 23                	jne    5515 <hdr_to_frps+0x6f>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    54f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54f5:	8b 50 20             	mov    0x20(%eax),%edx
    54f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54fb:	8b 40 04             	mov    0x4(%eax),%eax
    54fe:	83 ec 08             	sub    $0x8,%esp
    5501:	52                   	push   %edx
    5502:	50                   	push   %eax
    5503:	e8 4b ff ff ff       	call   5453 <js_bound>
    5508:	83 c4 10             	add    $0x10,%esp
    550b:	89 c2                	mov    %eax,%edx
    550d:	8b 45 08             	mov    0x8(%ebp),%eax
    5510:	89 50 0c             	mov    %edx,0xc(%eax)
    5513:	eb 0c                	jmp    5521 <hdr_to_frps+0x7b>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    5515:	8b 45 08             	mov    0x8(%ebp),%eax
    5518:	8b 50 10             	mov    0x10(%eax),%edx
    551b:	8b 45 08             	mov    0x8(%ebp),%eax
    551e:	89 50 0c             	mov    %edx,0xc(%eax)
}
    5521:	c9                   	leave  
    5522:	c3                   	ret    

00005523 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    5523:	55                   	push   %ebp
    5524:	89 e5                	mov    %esp,%ebp
    5526:	83 ec 08             	sub    $0x8,%esp
	if (N != 8) {
    5529:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    552d:	74 17                	je     5546 <hputbuf+0x23>
		printf(0,"Not Supported yet!!\n");
    552f:	83 ec 08             	sub    $0x8,%esp
    5532:	68 a3 b3 00 00       	push   $0xb3a3
    5537:	6a 00                	push   $0x0
    5539:	e8 9d ee ff ff       	call   43db <printf>
    553e:	83 c4 10             	add    $0x10,%esp
		exit();
    5541:	e8 b8 ec ff ff       	call   41fe <exit>
	}
	getCoreBuf(1, val);
    5546:	83 ec 08             	sub    $0x8,%esp
    5549:	ff 75 08             	pushl  0x8(%ebp)
    554c:	6a 01                	push   $0x1
    554e:	e8 ab ed ff ff       	call   42fe <getCoreBuf>
    5553:	83 c4 10             	add    $0x10,%esp
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    5556:	c9                   	leave  
    5557:	c3                   	ret    

00005558 <hsstell>:

unsigned long hsstell()
{
    5558:	55                   	push   %ebp
    5559:	89 e5                	mov    %esp,%ebp
    555b:	83 ec 08             	sub    $0x8,%esp
	return getCoreBuf(2, 0);
    555e:	83 ec 08             	sub    $0x8,%esp
    5561:	6a 00                	push   $0x0
    5563:	6a 02                	push   $0x2
    5565:	e8 94 ed ff ff       	call   42fe <getCoreBuf>
    556a:	83 c4 10             	add    $0x10,%esp
//	return(totbit);
}
    556d:	c9                   	leave  
    556e:	c3                   	ret    

0000556f <hgetbits>:

unsigned long hgetbits(int N)
{
    556f:	55                   	push   %ebp
    5570:	89 e5                	mov    %esp,%ebp
    5572:	83 ec 08             	sub    $0x8,%esp

	return getCoreBuf(3, N);
    5575:	83 ec 08             	sub    $0x8,%esp
    5578:	ff 75 08             	pushl  0x8(%ebp)
    557b:	6a 03                	push   $0x3
    557d:	e8 7c ed ff ff       	call   42fe <getCoreBuf>
    5582:	83 c4 10             	add    $0x10,%esp
}
    5585:	c9                   	leave  
    5586:	c3                   	ret    

00005587 <hget1bit>:


unsigned int hget1bit()
{
    5587:	55                   	push   %ebp
    5588:	89 e5                	mov    %esp,%ebp
    558a:	83 ec 08             	sub    $0x8,%esp
	return(hgetbits(1));
    558d:	83 ec 0c             	sub    $0xc,%esp
    5590:	6a 01                	push   $0x1
    5592:	e8 d8 ff ff ff       	call   556f <hgetbits>
    5597:	83 c4 10             	add    $0x10,%esp
}
    559a:	c9                   	leave  
    559b:	c3                   	ret    

0000559c <rewindNbits>:


void rewindNbits(int N)
{
    559c:	55                   	push   %ebp
    559d:	89 e5                	mov    %esp,%ebp
    559f:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(4, N);
    55a2:	83 ec 08             	sub    $0x8,%esp
    55a5:	ff 75 08             	pushl  0x8(%ebp)
    55a8:	6a 04                	push   $0x4
    55aa:	e8 4f ed ff ff       	call   42fe <getCoreBuf>
    55af:	83 c4 10             	add    $0x10,%esp
}
    55b2:	c9                   	leave  
    55b3:	c3                   	ret    

000055b4 <rewindNbytes>:


void rewindNbytes(int N)
{
    55b4:	55                   	push   %ebp
    55b5:	89 e5                	mov    %esp,%ebp
    55b7:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(5, N);
    55ba:	83 ec 08             	sub    $0x8,%esp
    55bd:	ff 75 08             	pushl  0x8(%ebp)
    55c0:	6a 05                	push   $0x5
    55c2:	e8 37 ed ff ff       	call   42fe <getCoreBuf>
    55c7:	83 c4 10             	add    $0x10,%esp
}
    55ca:	c9                   	leave  
    55cb:	c3                   	ret    

000055cc <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    55cc:	55                   	push   %ebp
    55cd:	89 e5                	mov    %esp,%ebp
    55cf:	57                   	push   %edi
    55d0:	56                   	push   %esi
    55d1:	53                   	push   %ebx
    55d2:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    55d8:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    55dc:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    55e0:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    55e4:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    55e8:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    55ec:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    55f0:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    55f4:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    55f8:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    55fc:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    5600:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    5604:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    5608:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    560c:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5610:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    5614:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    5618:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    561c:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    5620:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    5624:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    5628:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    562c:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    5630:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    5634:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    5638:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    563c:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    5640:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    5644:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    5648:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    564c:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    5650:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    5654:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    5658:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    565c:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    5660:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    5664:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    5668:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    566c:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    5670:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    5674:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    5678:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    567c:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    5680:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    5684:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    5688:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    568c:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    5690:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    5694:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5698:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    569c:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    56a0:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    56a4:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    56a8:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    56ac:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    56b0:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    56b4:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    56b8:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    56bc:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    56c0:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    56c4:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    56c8:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    56cc:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    56d0:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    56d4:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    56d8:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    56dc:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    56e0:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    56e4:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    56e8:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    56ec:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    56f0:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    56f4:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    56f8:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    56fc:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    5700:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    5704:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    5708:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    570c:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    5710:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    5714:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    5718:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    571c:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    5720:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    5727:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    572e:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    5735:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    573c:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    5743:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    574a:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    5751:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    5758:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    575f:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    5766:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    576d:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    5774:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    577b:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    5782:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    5789:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    5790:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    5797:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    579e:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    57a5:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    57ac:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    57b3:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    57ba:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    57c1:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    57c8:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    57cf:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    57d6:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    57dd:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    57e4:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    57e8:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    57ec:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    57f0:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    57f4:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    57f8:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    57fc:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    5800:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    5804:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    5808:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    580c:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    5810:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    5814:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    5818:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    581c:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    5820:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    5824:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    5828:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    582c:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    5830:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    5834:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    5838:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    583c:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    5840:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    5844:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    5848:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    584c:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    5850:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    5854:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    5858:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    585c:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    5860:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    5864:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    5868:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    586c:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    5873:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    587a:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    5881:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    5888:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    588f:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    5896:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    589d:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    58a4:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    58ab:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    58b2:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    58b9:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    58c0:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    58c7:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    58ce:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    58d5:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    58dc:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    58e3:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    58ea:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    58f1:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    58f8:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    58ff:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    5906:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    590d:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    5914:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    591b:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    5922:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    5929:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    5930:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    5937:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    593e:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    5945:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    594c:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    5953:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    595a:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    5961:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    5968:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    596f:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    5976:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    597d:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    5984:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    598b:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    5992:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    5999:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    59a0:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    59a7:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    59ae:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    59b5:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    59bc:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    59c3:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    59ca:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    59d1:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    59d8:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    59df:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    59e6:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    59ed:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    59f4:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    59fb:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    5a02:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    5a09:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    5a10:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    5a17:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5a1e:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    5a24:	ba c0 b3 00 00       	mov    $0xb3c0,%edx
    5a29:	b9 23 00 00 00       	mov    $0x23,%ecx
    5a2e:	89 c7                	mov    %eax,%edi
    5a30:	89 d6                	mov    %edx,%esi
    5a32:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5a34:	89 f2                	mov    %esi,%edx
    5a36:	89 f8                	mov    %edi,%eax
    5a38:	0f b7 0a             	movzwl (%edx),%ecx
    5a3b:	66 89 08             	mov    %cx,(%eax)
    5a3e:	8d 40 02             	lea    0x2(%eax),%eax
    5a41:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    5a44:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5a4a:	bb 80 b4 00 00       	mov    $0xb480,%ebx
    5a4f:	ba 8e 00 00 00       	mov    $0x8e,%edx
    5a54:	8b 0b                	mov    (%ebx),%ecx
    5a56:	89 08                	mov    %ecx,(%eax)
    5a58:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5a5c:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5a60:	8d 78 04             	lea    0x4(%eax),%edi
    5a63:	83 e7 fc             	and    $0xfffffffc,%edi
    5a66:	29 f8                	sub    %edi,%eax
    5a68:	29 c3                	sub    %eax,%ebx
    5a6a:	01 c2                	add    %eax,%edx
    5a6c:	83 e2 fc             	and    $0xfffffffc,%edx
    5a6f:	89 d0                	mov    %edx,%eax
    5a71:	c1 e8 02             	shr    $0x2,%eax
    5a74:	89 de                	mov    %ebx,%esi
    5a76:	89 c1                	mov    %eax,%ecx
    5a78:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5a7a:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    5a80:	ba 40 b5 00 00       	mov    $0xb540,%edx
    5a85:	b9 23 00 00 00       	mov    $0x23,%ecx
    5a8a:	89 c7                	mov    %eax,%edi
    5a8c:	89 d6                	mov    %edx,%esi
    5a8e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5a90:	89 f2                	mov    %esi,%edx
    5a92:	89 f8                	mov    %edi,%eax
    5a94:	0f b7 0a             	movzwl (%edx),%ecx
    5a97:	66 89 08             	mov    %cx,(%eax)
    5a9a:	8d 40 02             	lea    0x2(%eax),%eax
    5a9d:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5aa0:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    5aa6:	bb 00 b6 00 00       	mov    $0xb600,%ebx
    5aab:	ba fe 00 00 00       	mov    $0xfe,%edx
    5ab0:	8b 0b                	mov    (%ebx),%ecx
    5ab2:	89 08                	mov    %ecx,(%eax)
    5ab4:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5ab8:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5abc:	8d 78 04             	lea    0x4(%eax),%edi
    5abf:	83 e7 fc             	and    $0xfffffffc,%edi
    5ac2:	29 f8                	sub    %edi,%eax
    5ac4:	29 c3                	sub    %eax,%ebx
    5ac6:	01 c2                	add    %eax,%edx
    5ac8:	83 e2 fc             	and    $0xfffffffc,%edx
    5acb:	89 d0                	mov    %edx,%eax
    5acd:	c1 e8 02             	shr    $0x2,%eax
    5ad0:	89 de                	mov    %ebx,%esi
    5ad2:	89 c1                	mov    %eax,%ecx
    5ad4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5ad6:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    5adc:	ba 00 b7 00 00       	mov    $0xb700,%edx
    5ae1:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    5ae6:	89 c7                	mov    %eax,%edi
    5ae8:	89 d6                	mov    %edx,%esi
    5aea:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5aec:	89 f2                	mov    %esi,%edx
    5aee:	89 f8                	mov    %edi,%eax
    5af0:	0f b7 0a             	movzwl (%edx),%ecx
    5af3:	66 89 08             	mov    %cx,(%eax)
    5af6:	8d 40 02             	lea    0x2(%eax),%eax
    5af9:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5afc:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    5b02:	bb 00 b8 00 00       	mov    $0xb800,%ebx
    5b07:	ba fe 00 00 00       	mov    $0xfe,%edx
    5b0c:	8b 0b                	mov    (%ebx),%ecx
    5b0e:	89 08                	mov    %ecx,(%eax)
    5b10:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5b14:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5b18:	8d 78 04             	lea    0x4(%eax),%edi
    5b1b:	83 e7 fc             	and    $0xfffffffc,%edi
    5b1e:	29 f8                	sub    %edi,%eax
    5b20:	29 c3                	sub    %eax,%ebx
    5b22:	01 c2                	add    %eax,%edx
    5b24:	83 e2 fc             	and    $0xfffffffc,%edx
    5b27:	89 d0                	mov    %edx,%eax
    5b29:	c1 e8 02             	shr    $0x2,%eax
    5b2c:	89 de                	mov    %ebx,%esi
    5b2e:	89 c1                	mov    %eax,%ecx
    5b30:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    5b32:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    5b38:	ba 00 b9 00 00       	mov    $0xb900,%edx
    5b3d:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5b42:	89 c7                	mov    %eax,%edi
    5b44:	89 d6                	mov    %edx,%esi
    5b46:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5b48:	89 f2                	mov    %esi,%edx
    5b4a:	89 f8                	mov    %edi,%eax
    5b4c:	0f b7 0a             	movzwl (%edx),%ecx
    5b4f:	66 89 08             	mov    %cx,(%eax)
    5b52:	8d 40 02             	lea    0x2(%eax),%eax
    5b55:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    5b58:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5b5e:	bb 00 bd 00 00       	mov    $0xbd00,%ebx
    5b63:	ba fe 03 00 00       	mov    $0x3fe,%edx
    5b68:	8b 0b                	mov    (%ebx),%ecx
    5b6a:	89 08                	mov    %ecx,(%eax)
    5b6c:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5b70:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5b74:	8d 78 04             	lea    0x4(%eax),%edi
    5b77:	83 e7 fc             	and    $0xfffffffc,%edi
    5b7a:	29 f8                	sub    %edi,%eax
    5b7c:	29 c3                	sub    %eax,%ebx
    5b7e:	01 c2                	add    %eax,%edx
    5b80:	83 e2 fc             	and    $0xfffffffc,%edx
    5b83:	89 d0                	mov    %edx,%eax
    5b85:	c1 e8 02             	shr    $0x2,%eax
    5b88:	89 de                	mov    %ebx,%esi
    5b8a:	89 c1                	mov    %eax,%ecx
    5b8c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5b8e:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5b94:	ba 00 c1 00 00       	mov    $0xc100,%edx
    5b99:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5b9e:	89 c7                	mov    %eax,%edi
    5ba0:	89 d6                	mov    %edx,%esi
    5ba2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5ba4:	89 f2                	mov    %esi,%edx
    5ba6:	89 f8                	mov    %edi,%eax
    5ba8:	0f b7 0a             	movzwl (%edx),%ecx
    5bab:	66 89 08             	mov    %cx,(%eax)
    5bae:	8d 40 02             	lea    0x2(%eax),%eax
    5bb1:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5bb4:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5bba:	bb 00 c5 00 00       	mov    $0xc500,%ebx
    5bbf:	ba 00 01 00 00       	mov    $0x100,%edx
    5bc4:	89 c7                	mov    %eax,%edi
    5bc6:	89 de                	mov    %ebx,%esi
    5bc8:	89 d1                	mov    %edx,%ecx
    5bca:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    5bcc:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    5bd3:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    5bda:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    5be1:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    5be8:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    5bef:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    5bf6:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    5bfd:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    5c04:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    5c0b:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    5c12:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    5c19:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    5c20:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    5c27:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    5c2e:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    5c35:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    5c3c:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    5c43:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    5c4a:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    5c51:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    5c58:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    5c5f:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    5c66:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    5c6d:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    5c74:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    5c7b:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    5c82:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    5c89:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    5c90:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    5c97:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    5c9e:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    5ca5:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    5cac:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    5cb3:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    5cba:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    5cc1:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    5cc8:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    5ccf:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    5cd6:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    5cdd:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    5ce4:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    5ceb:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    5cf2:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    5cf9:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    5d00:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    5d07:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    5d0e:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    5d15:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    5d1c:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    5d23:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    5d2a:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    5d31:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    5d38:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    5d3f:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    5d46:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    5d4d:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    5d54:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    5d5b:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    5d62:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    5d69:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    5d70:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    5d77:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    5d7e:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    5d85:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    5d8c:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    5d93:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    5d9a:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    5da1:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    5da8:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    5daf:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    5db6:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    5dbd:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    5dc4:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    5dcb:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    5dd2:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    5dd9:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    5de0:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    5de7:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    5dee:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    5df5:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    5dfc:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    5e03:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    5e0a:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    5e11:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    5e18:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    5e1f:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    5e26:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    5e2d:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    5e34:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    5e3b:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    5e42:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    5e49:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    5e50:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    5e57:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    5e5e:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    5e65:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    5e6c:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    5e73:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    5e7a:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    5e81:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    5e88:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    5e8f:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    5e96:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    5e9d:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    5ea4:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    5eab:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    5eb2:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    5eb9:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    5ec0:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    5ec7:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    5ece:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    5ed5:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    5edc:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    5ee3:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    5eea:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    5ef1:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    5ef8:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    5eff:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    5f06:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    5f0d:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    5f14:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    5f1b:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    5f22:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    5f29:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    5f30:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    5f37:	30 00 
    5f39:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    5f40:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    5f47:	00 00 00 
    5f4a:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    5f51:	00 00 00 
    5f54:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    5f5b:	00 00 00 
    5f5e:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    5f65:	00 00 00 
    5f68:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    5f6f:	ff ff ff 
    5f72:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    5f79:	00 00 00 
    5f7c:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    5f83:	00 00 00 
    5f86:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    5f8d:	00 00 00 
    5f90:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    5f97:	00 00 00 
    5f9a:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    5fa1:	31 00 
    5fa3:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    5faa:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    5fb1:	00 00 00 
    5fb4:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    5fbb:	00 00 00 
    5fbe:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    5fc5:	00 00 00 
    5fc8:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    5fcf:	00 00 00 
    5fd2:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    5fd9:	ff ff ff 
    5fdc:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    5fe3:	00 00 00 
    5fe6:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    5fed:	00 00 00 
    5ff0:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    5ff3:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    5ff9:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    6000:	00 00 00 
    6003:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    600a:	32 00 
    600c:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    6013:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    601a:	00 00 00 
    601d:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    6024:	00 00 00 
    6027:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    602e:	00 00 00 
    6031:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    6038:	00 00 00 
    603b:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    6042:	ff ff ff 
    6045:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    604c:	00 00 00 
    604f:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    6056:	00 00 00 
    6059:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    605c:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    6062:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    6069:	00 00 00 
    606c:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    6073:	33 00 
    6075:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    607c:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    6083:	00 00 00 
    6086:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    608d:	00 00 00 
    6090:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    6097:	00 00 00 
    609a:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    60a1:	00 00 00 
    60a4:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    60ab:	ff ff ff 
    60ae:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    60b5:	00 00 00 
    60b8:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    60bf:	00 00 00 
    60c2:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    60c5:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    60cb:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    60d2:	00 00 00 
    60d5:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    60dc:	34 00 
    60de:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    60e5:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    60ec:	00 00 00 
    60ef:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    60f6:	00 00 00 
    60f9:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    6100:	00 00 00 
    6103:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    610a:	00 00 00 
    610d:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    6114:	ff ff ff 
    6117:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    611e:	00 00 00 
    6121:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    6128:	00 00 00 
    612b:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    6132:	00 00 00 
    6135:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    613c:	00 00 00 
    613f:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    6146:	35 00 
    6148:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    614f:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    6156:	00 00 00 
    6159:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    6160:	00 00 00 
    6163:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    616a:	00 00 00 
    616d:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    6174:	00 00 00 
    6177:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    617e:	ff ff ff 
    6181:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    6188:	00 00 00 
    618b:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    6192:	00 00 00 
    6195:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    619b:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    61a1:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    61a8:	00 00 00 
    61ab:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    61b2:	36 00 
    61b4:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    61bb:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    61c2:	00 00 00 
    61c5:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    61cc:	00 00 00 
    61cf:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    61d6:	00 00 00 
    61d9:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    61e0:	00 00 00 
    61e3:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    61ea:	ff ff ff 
    61ed:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    61f4:	00 00 00 
    61f7:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    61fe:	00 00 00 
    6201:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    6207:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    620d:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    6214:	00 00 00 
    6217:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    621e:	37 00 
    6220:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    6227:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    622e:	00 00 00 
    6231:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    6238:	00 00 00 
    623b:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    6242:	00 00 00 
    6245:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    624c:	00 00 00 
    624f:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    6256:	ff ff ff 
    6259:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    6260:	00 00 00 
    6263:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    626a:	00 00 00 
    626d:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    6273:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    6279:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    6280:	00 00 00 
    6283:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    628a:	38 00 
    628c:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    6293:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    629a:	00 00 00 
    629d:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    62a4:	00 00 00 
    62a7:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    62ae:	00 00 00 
    62b1:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    62b8:	00 00 00 
    62bb:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    62c2:	ff ff ff 
    62c5:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    62cc:	00 00 00 
    62cf:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    62d6:	00 00 00 
    62d9:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    62df:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    62e5:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    62ec:	00 00 00 
    62ef:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    62f6:	39 00 
    62f8:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    62ff:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    6306:	00 00 00 
    6309:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    6310:	00 00 00 
    6313:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    631a:	00 00 00 
    631d:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    6324:	00 00 00 
    6327:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    632e:	ff ff ff 
    6331:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    6338:	00 00 00 
    633b:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    6342:	00 00 00 
    6345:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    634b:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    6351:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    6358:	00 00 00 
    635b:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    6362:	31 30 
    6364:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    636b:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    6372:	00 00 00 
    6375:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    637c:	00 00 00 
    637f:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    6386:	00 00 00 
    6389:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    6390:	00 00 00 
    6393:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    639a:	ff ff ff 
    639d:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    63a4:	00 00 00 
    63a7:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    63ae:	00 00 00 
    63b1:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    63b7:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    63bd:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    63c4:	00 00 00 
    63c7:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    63ce:	31 31 
    63d0:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    63d7:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    63de:	00 00 00 
    63e1:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    63e8:	00 00 00 
    63eb:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    63f2:	00 00 00 
    63f5:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    63fc:	00 00 00 
    63ff:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    6406:	ff ff ff 
    6409:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    6410:	00 00 00 
    6413:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    641a:	00 00 00 
    641d:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    6423:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    6429:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    6430:	00 00 00 
    6433:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    643a:	31 32 
    643c:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    6443:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    644a:	00 00 00 
    644d:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    6454:	00 00 00 
    6457:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    645e:	00 00 00 
    6461:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    6468:	00 00 00 
    646b:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    6472:	ff ff ff 
    6475:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    647c:	00 00 00 
    647f:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    6486:	00 00 00 
    6489:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    648f:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    6495:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    649c:	00 00 00 
    649f:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    64a6:	31 33 
    64a8:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    64af:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    64b6:	00 00 00 
    64b9:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    64c0:	00 00 00 
    64c3:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    64ca:	00 00 00 
    64cd:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    64d4:	00 00 00 
    64d7:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    64de:	ff ff ff 
    64e1:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    64e8:	00 00 00 
    64eb:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    64f2:	00 00 00 
    64f5:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    64fb:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    6501:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    6508:	01 00 00 
    650b:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    6512:	31 34 
    6514:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    651b:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    6522:	00 00 00 
    6525:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    652c:	00 00 00 
    652f:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    6536:	00 00 00 
    6539:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    6540:	00 00 00 
    6543:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    654a:	ff ff ff 
    654d:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    6554:	00 00 00 
    6557:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    655e:	00 00 00 
    6561:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    6568:	00 00 00 
    656b:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    6572:	00 00 00 
    6575:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    657c:	31 35 
    657e:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    6585:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    658c:	00 00 00 
    658f:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    6596:	00 00 00 
    6599:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    65a0:	00 00 00 
    65a3:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    65aa:	00 00 00 
    65ad:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    65b4:	ff ff ff 
    65b7:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    65be:	00 00 00 
    65c1:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    65c8:	00 00 00 
    65cb:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    65d1:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    65d7:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    65de:	01 00 00 
    65e1:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    65e8:	31 36 
    65ea:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    65f1:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    65f8:	00 00 00 
    65fb:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    6602:	00 00 00 
    6605:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    660c:	00 00 00 
    660f:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    6616:	00 00 00 
    6619:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    6620:	ff ff ff 
    6623:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    662a:	00 00 00 
    662d:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    6634:	00 00 00 
    6637:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    663d:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    6643:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    664a:	01 00 00 
    664d:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    6654:	31 37 
    6656:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    665d:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    6664:	00 00 00 
    6667:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    666e:	00 00 00 
    6671:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    6678:	00 00 00 
    667b:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    6682:	00 00 00 
    6685:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    668c:	00 00 00 
    668f:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    6696:	00 00 00 
    6699:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    66a0:	00 00 00 
    66a3:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    66a9:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    66af:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    66b6:	01 00 00 
    66b9:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    66c0:	31 38 
    66c2:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    66c9:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    66d0:	00 00 00 
    66d3:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    66da:	00 00 00 
    66dd:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    66e4:	00 00 00 
    66e7:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    66ee:	00 00 00 
    66f1:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    66f8:	00 00 00 
    66fb:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    6702:	00 00 00 
    6705:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    670c:	00 00 00 
    670f:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6715:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    671b:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    6722:	01 00 00 
    6725:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    672c:	31 39 
    672e:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    6735:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    673c:	00 00 00 
    673f:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    6746:	00 00 00 
    6749:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    6750:	00 00 00 
    6753:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    675a:	00 00 00 
    675d:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    6764:	00 00 00 
    6767:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    676e:	00 00 00 
    6771:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    6778:	00 00 00 
    677b:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6781:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    6787:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    678e:	01 00 00 
    6791:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    6798:	32 30 
    679a:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    67a1:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    67a8:	00 00 00 
    67ab:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    67b2:	00 00 00 
    67b5:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    67bc:	00 00 00 
    67bf:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    67c6:	00 00 00 
    67c9:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    67d0:	00 00 00 
    67d3:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    67da:	00 00 00 
    67dd:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    67e4:	00 00 00 
    67e7:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    67ed:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    67f3:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    67fa:	01 00 00 
    67fd:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    6804:	32 31 
    6806:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    680d:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    6814:	00 00 00 
    6817:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    681e:	00 00 00 
    6821:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    6828:	00 00 00 
    682b:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    6832:	00 00 00 
    6835:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    683c:	00 00 00 
    683f:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    6846:	00 00 00 
    6849:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    6850:	00 00 00 
    6853:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6859:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    685f:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    6866:	01 00 00 
    6869:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    6870:	32 32 
    6872:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    6879:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    6880:	00 00 00 
    6883:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    688a:	00 00 00 
    688d:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    6894:	00 00 00 
    6897:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    689e:	03 00 00 
    68a1:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    68a8:	00 00 00 
    68ab:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    68b2:	00 00 00 
    68b5:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    68bc:	00 00 00 
    68bf:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    68c5:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    68cb:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    68d2:	01 00 00 
    68d5:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    68dc:	32 33 
    68de:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    68e5:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    68ec:	00 00 00 
    68ef:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    68f6:	00 00 00 
    68f9:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    6900:	00 00 00 
    6903:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    690a:	1f 00 00 
    690d:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    6914:	00 00 00 
    6917:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    691e:	00 00 00 
    6921:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    6928:	00 00 00 
    692b:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6931:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    6937:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    693e:	01 00 00 
    6941:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    6948:	32 34 
    694a:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    6951:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    6958:	00 00 00 
    695b:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    6962:	00 00 00 
    6965:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    696c:	00 00 00 
    696f:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    6976:	00 00 00 
    6979:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    6980:	ff ff ff 
    6983:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    698a:	00 00 00 
    698d:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    6994:	00 00 00 
    6997:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    699d:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    69a3:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    69aa:	02 00 00 
    69ad:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    69b4:	32 35 
    69b6:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    69bd:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    69c4:	00 00 00 
    69c7:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    69ce:	00 00 00 
    69d1:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    69d8:	00 00 00 
    69db:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    69e2:	00 00 00 
    69e5:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    69ec:	00 00 00 
    69ef:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    69f6:	00 00 00 
    69f9:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    6a00:	00 00 00 
    6a03:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6a09:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    6a0f:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    6a16:	02 00 00 
    6a19:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    6a20:	32 36 
    6a22:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    6a29:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    6a30:	00 00 00 
    6a33:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    6a3a:	00 00 00 
    6a3d:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    6a44:	00 00 00 
    6a47:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    6a4e:	00 00 00 
    6a51:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    6a58:	00 00 00 
    6a5b:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    6a62:	00 00 00 
    6a65:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    6a6c:	00 00 00 
    6a6f:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6a75:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    6a7b:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    6a82:	02 00 00 
    6a85:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    6a8c:	32 37 
    6a8e:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    6a95:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    6a9c:	00 00 00 
    6a9f:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    6aa6:	00 00 00 
    6aa9:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    6ab0:	00 00 00 
    6ab3:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    6aba:	00 00 00 
    6abd:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    6ac4:	00 00 00 
    6ac7:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    6ace:	00 00 00 
    6ad1:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    6ad8:	00 00 00 
    6adb:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6ae1:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    6ae7:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    6aee:	02 00 00 
    6af1:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    6af8:	32 38 
    6afa:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    6b01:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    6b08:	00 00 00 
    6b0b:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    6b12:	00 00 00 
    6b15:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    6b1c:	00 00 00 
    6b1f:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    6b26:	00 00 00 
    6b29:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    6b30:	00 00 00 
    6b33:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    6b3a:	00 00 00 
    6b3d:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    6b44:	00 00 00 
    6b47:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6b4d:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    6b53:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    6b5a:	02 00 00 
    6b5d:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    6b64:	32 39 
    6b66:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    6b6d:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    6b74:	00 00 00 
    6b77:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    6b7e:	00 00 00 
    6b81:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    6b88:	00 00 00 
    6b8b:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    6b92:	01 00 00 
    6b95:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    6b9c:	00 00 00 
    6b9f:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    6ba6:	00 00 00 
    6ba9:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    6bb0:	00 00 00 
    6bb3:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6bb9:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    6bbf:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    6bc6:	02 00 00 
    6bc9:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    6bd0:	33 30 
    6bd2:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    6bd9:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    6be0:	00 00 00 
    6be3:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    6bea:	00 00 00 
    6bed:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    6bf4:	00 00 00 
    6bf7:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    6bfe:	07 00 00 
    6c01:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    6c08:	00 00 00 
    6c0b:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    6c12:	00 00 00 
    6c15:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    6c1c:	00 00 00 
    6c1f:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6c25:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    6c2b:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    6c32:	02 00 00 
    6c35:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    6c3c:	33 31 
    6c3e:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    6c45:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    6c4c:	00 00 00 
    6c4f:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    6c56:	00 00 00 
    6c59:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    6c60:	00 00 00 
    6c63:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    6c6a:	1f 00 00 
    6c6d:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    6c74:	00 00 00 
    6c77:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    6c7e:	00 00 00 
    6c81:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    6c88:	00 00 00 
    6c8b:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6c91:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    6c97:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    6c9e:	02 00 00 
    6ca1:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    6ca8:	33 32 
    6caa:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    6cb1:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    6cb8:	00 00 00 
    6cbb:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    6cc2:	00 00 00 
    6cc5:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    6ccc:	00 00 00 
    6ccf:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    6cd6:	00 00 00 
    6cd9:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    6ce0:	ff ff ff 
    6ce3:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    6cea:	00 00 00 
    6ced:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    6cf4:	00 00 00 
    6cf7:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    6cfd:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    6d03:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    6d0a:	00 00 00 
    6d0d:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    6d14:	33 33 
    6d16:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    6d1d:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    6d24:	00 00 00 
    6d27:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    6d2e:	00 00 00 
    6d31:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    6d38:	00 00 00 
    6d3b:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    6d42:	00 00 00 
    6d45:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    6d4c:	ff ff ff 
    6d4f:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    6d56:	00 00 00 
    6d59:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    6d60:	00 00 00 
    6d63:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    6d69:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    6d6f:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    6d76:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    6d79:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    6d7f:	5b                   	pop    %ebx
    6d80:	5e                   	pop    %esi
    6d81:	5f                   	pop    %edi
    6d82:	5d                   	pop    %ebp
    6d83:	c3                   	ret    

00006d84 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    6d84:	55                   	push   %ebp
    6d85:	89 e5                	mov    %esp,%ebp
    6d87:	83 ec 18             	sub    $0x18,%esp
  HUFFBITS level;
  int point = 0;
    6d8a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    6d91:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    6d98:	a1 10 f4 00 00       	mov    0xf410,%eax
    6d9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    6da0:	8b 45 08             	mov    0x8(%ebp),%eax
    6da3:	8b 40 20             	mov    0x20(%eax),%eax
    6da6:	85 c0                	test   %eax,%eax
    6da8:	75 0a                	jne    6db4 <huffman_decoder+0x30>
    6daa:	b8 02 00 00 00       	mov    $0x2,%eax
    6daf:	e9 15 03 00 00       	jmp    70c9 <huffman_decoder+0x345>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    6db4:	8b 45 08             	mov    0x8(%ebp),%eax
    6db7:	8b 40 24             	mov    0x24(%eax),%eax
    6dba:	85 c0                	test   %eax,%eax
    6dbc:	75 1d                	jne    6ddb <huffman_decoder+0x57>
  {  *x = *y = 0;
    6dbe:	8b 45 10             	mov    0x10(%ebp),%eax
    6dc1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    6dc7:	8b 45 10             	mov    0x10(%ebp),%eax
    6dca:	8b 10                	mov    (%eax),%edx
    6dcc:	8b 45 0c             	mov    0xc(%ebp),%eax
    6dcf:	89 10                	mov    %edx,(%eax)
     return 0;
    6dd1:	b8 00 00 00 00       	mov    $0x0,%eax
    6dd6:	e9 ee 02 00 00       	jmp    70c9 <huffman_decoder+0x345>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    6ddb:	8b 45 08             	mov    0x8(%ebp),%eax
    6dde:	8b 40 20             	mov    0x20(%eax),%eax
    6de1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6de4:	01 d2                	add    %edx,%edx
    6de6:	01 d0                	add    %edx,%eax
    6de8:	0f b6 00             	movzbl (%eax),%eax
    6deb:	84 c0                	test   %al,%al
    6ded:	75 46                	jne    6e35 <huffman_decoder+0xb1>
      *x = h->val[point][1] >> 4;
    6def:	8b 45 08             	mov    0x8(%ebp),%eax
    6df2:	8b 40 20             	mov    0x20(%eax),%eax
    6df5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6df8:	01 d2                	add    %edx,%edx
    6dfa:	01 d0                	add    %edx,%eax
    6dfc:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e00:	c0 e8 04             	shr    $0x4,%al
    6e03:	0f b6 d0             	movzbl %al,%edx
    6e06:	8b 45 0c             	mov    0xc(%ebp),%eax
    6e09:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    6e0b:	8b 45 08             	mov    0x8(%ebp),%eax
    6e0e:	8b 40 20             	mov    0x20(%eax),%eax
    6e11:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e14:	01 d2                	add    %edx,%edx
    6e16:	01 d0                	add    %edx,%eax
    6e18:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e1c:	0f b6 c0             	movzbl %al,%eax
    6e1f:	83 e0 0f             	and    $0xf,%eax
    6e22:	89 c2                	mov    %eax,%edx
    6e24:	8b 45 10             	mov    0x10(%ebp),%eax
    6e27:	89 10                	mov    %edx,(%eax)

      error = 0;
    6e29:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    6e30:	e9 af 00 00 00       	jmp    6ee4 <huffman_decoder+0x160>
    } 
    if (hget1bit()) {
    6e35:	e8 4d e7 ff ff       	call   5587 <hget1bit>
    6e3a:	85 c0                	test   %eax,%eax
    6e3c:	74 47                	je     6e85 <huffman_decoder+0x101>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    6e3e:	eb 17                	jmp    6e57 <huffman_decoder+0xd3>
    6e40:	8b 45 08             	mov    0x8(%ebp),%eax
    6e43:	8b 40 20             	mov    0x20(%eax),%eax
    6e46:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e49:	01 d2                	add    %edx,%edx
    6e4b:	01 d0                	add    %edx,%eax
    6e4d:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e51:	0f b6 c0             	movzbl %al,%eax
    6e54:	01 45 f0             	add    %eax,-0x10(%ebp)
    6e57:	8b 45 08             	mov    0x8(%ebp),%eax
    6e5a:	8b 40 20             	mov    0x20(%eax),%eax
    6e5d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e60:	01 d2                	add    %edx,%edx
    6e62:	01 d0                	add    %edx,%eax
    6e64:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e68:	3c f9                	cmp    $0xf9,%al
    6e6a:	77 d4                	ja     6e40 <huffman_decoder+0xbc>
      point += h->val[point][1];
    6e6c:	8b 45 08             	mov    0x8(%ebp),%eax
    6e6f:	8b 40 20             	mov    0x20(%eax),%eax
    6e72:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e75:	01 d2                	add    %edx,%edx
    6e77:	01 d0                	add    %edx,%eax
    6e79:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e7d:	0f b6 c0             	movzbl %al,%eax
    6e80:	01 45 f0             	add    %eax,-0x10(%ebp)
    6e83:	eb 42                	jmp    6ec7 <huffman_decoder+0x143>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    6e85:	eb 16                	jmp    6e9d <huffman_decoder+0x119>
    6e87:	8b 45 08             	mov    0x8(%ebp),%eax
    6e8a:	8b 40 20             	mov    0x20(%eax),%eax
    6e8d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e90:	01 d2                	add    %edx,%edx
    6e92:	01 d0                	add    %edx,%eax
    6e94:	0f b6 00             	movzbl (%eax),%eax
    6e97:	0f b6 c0             	movzbl %al,%eax
    6e9a:	01 45 f0             	add    %eax,-0x10(%ebp)
    6e9d:	8b 45 08             	mov    0x8(%ebp),%eax
    6ea0:	8b 40 20             	mov    0x20(%eax),%eax
    6ea3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6ea6:	01 d2                	add    %edx,%edx
    6ea8:	01 d0                	add    %edx,%eax
    6eaa:	0f b6 00             	movzbl (%eax),%eax
    6ead:	3c f9                	cmp    $0xf9,%al
    6eaf:	77 d6                	ja     6e87 <huffman_decoder+0x103>
      point += h->val[point][0];
    6eb1:	8b 45 08             	mov    0x8(%ebp),%eax
    6eb4:	8b 40 20             	mov    0x20(%eax),%eax
    6eb7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6eba:	01 d2                	add    %edx,%edx
    6ebc:	01 d0                	add    %edx,%eax
    6ebe:	0f b6 00             	movzbl (%eax),%eax
    6ec1:	0f b6 c0             	movzbl %al,%eax
    6ec4:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    6ec7:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    6eca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6ece:	0f 85 07 ff ff ff    	jne    6ddb <huffman_decoder+0x57>
    6ed4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6ed7:	a1 64 32 01 00       	mov    0x13264,%eax
    6edc:	39 c2                	cmp    %eax,%edx
    6ede:	0f 82 f7 fe ff ff    	jb     6ddb <huffman_decoder+0x57>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    6ee4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6ee8:	74 24                	je     6f0e <huffman_decoder+0x18a>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    6eea:	8b 45 08             	mov    0x8(%ebp),%eax
    6eed:	8b 40 04             	mov    0x4(%eax),%eax
    6ef0:	83 e8 01             	sub    $0x1,%eax
    6ef3:	01 c0                	add    %eax,%eax
    6ef5:	89 c2                	mov    %eax,%edx
    6ef7:	8b 45 0c             	mov    0xc(%ebp),%eax
    6efa:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    6efc:	8b 45 08             	mov    0x8(%ebp),%eax
    6eff:	8b 40 08             	mov    0x8(%eax),%eax
    6f02:	83 e8 01             	sub    $0x1,%eax
    6f05:	01 c0                	add    %eax,%eax
    6f07:	89 c2                	mov    %eax,%edx
    6f09:	8b 45 10             	mov    0x10(%ebp),%eax
    6f0c:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    6f0e:	8b 45 08             	mov    0x8(%ebp),%eax
    6f11:	0f b6 00             	movzbl (%eax),%eax
    6f14:	3c 33                	cmp    $0x33,%al
    6f16:	0f 85 ec 00 00 00    	jne    7008 <huffman_decoder+0x284>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    6f1c:	8b 45 08             	mov    0x8(%ebp),%eax
    6f1f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6f23:	3c 32                	cmp    $0x32,%al
    6f25:	74 0f                	je     6f36 <huffman_decoder+0x1b2>
    6f27:	8b 45 08             	mov    0x8(%ebp),%eax
    6f2a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6f2e:	3c 33                	cmp    $0x33,%al
    6f30:	0f 85 d2 00 00 00    	jne    7008 <huffman_decoder+0x284>
     *v = (*y>>3) & 1;
    6f36:	8b 45 10             	mov    0x10(%ebp),%eax
    6f39:	8b 00                	mov    (%eax),%eax
    6f3b:	c1 f8 03             	sar    $0x3,%eax
    6f3e:	83 e0 01             	and    $0x1,%eax
    6f41:	89 c2                	mov    %eax,%edx
    6f43:	8b 45 14             	mov    0x14(%ebp),%eax
    6f46:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    6f48:	8b 45 10             	mov    0x10(%ebp),%eax
    6f4b:	8b 00                	mov    (%eax),%eax
    6f4d:	c1 f8 02             	sar    $0x2,%eax
    6f50:	83 e0 01             	and    $0x1,%eax
    6f53:	89 c2                	mov    %eax,%edx
    6f55:	8b 45 18             	mov    0x18(%ebp),%eax
    6f58:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    6f5a:	8b 45 10             	mov    0x10(%ebp),%eax
    6f5d:	8b 00                	mov    (%eax),%eax
    6f5f:	d1 f8                	sar    %eax
    6f61:	83 e0 01             	and    $0x1,%eax
    6f64:	89 c2                	mov    %eax,%edx
    6f66:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f69:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    6f6b:	8b 45 10             	mov    0x10(%ebp),%eax
    6f6e:	8b 00                	mov    (%eax),%eax
    6f70:	83 e0 01             	and    $0x1,%eax
    6f73:	89 c2                	mov    %eax,%edx
    6f75:	8b 45 10             	mov    0x10(%ebp),%eax
    6f78:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    6f7a:	8b 45 14             	mov    0x14(%ebp),%eax
    6f7d:	8b 00                	mov    (%eax),%eax
    6f7f:	85 c0                	test   %eax,%eax
    6f81:	74 18                	je     6f9b <huffman_decoder+0x217>
        if (hget1bit() == 1) *v = -*v;
    6f83:	e8 ff e5 ff ff       	call   5587 <hget1bit>
    6f88:	83 f8 01             	cmp    $0x1,%eax
    6f8b:	75 0e                	jne    6f9b <huffman_decoder+0x217>
    6f8d:	8b 45 14             	mov    0x14(%ebp),%eax
    6f90:	8b 00                	mov    (%eax),%eax
    6f92:	f7 d8                	neg    %eax
    6f94:	89 c2                	mov    %eax,%edx
    6f96:	8b 45 14             	mov    0x14(%ebp),%eax
    6f99:	89 10                	mov    %edx,(%eax)
     if (*w)
    6f9b:	8b 45 18             	mov    0x18(%ebp),%eax
    6f9e:	8b 00                	mov    (%eax),%eax
    6fa0:	85 c0                	test   %eax,%eax
    6fa2:	74 18                	je     6fbc <huffman_decoder+0x238>
        if (hget1bit() == 1) *w = -*w;
    6fa4:	e8 de e5 ff ff       	call   5587 <hget1bit>
    6fa9:	83 f8 01             	cmp    $0x1,%eax
    6fac:	75 0e                	jne    6fbc <huffman_decoder+0x238>
    6fae:	8b 45 18             	mov    0x18(%ebp),%eax
    6fb1:	8b 00                	mov    (%eax),%eax
    6fb3:	f7 d8                	neg    %eax
    6fb5:	89 c2                	mov    %eax,%edx
    6fb7:	8b 45 18             	mov    0x18(%ebp),%eax
    6fba:	89 10                	mov    %edx,(%eax)
     if (*x)
    6fbc:	8b 45 0c             	mov    0xc(%ebp),%eax
    6fbf:	8b 00                	mov    (%eax),%eax
    6fc1:	85 c0                	test   %eax,%eax
    6fc3:	74 18                	je     6fdd <huffman_decoder+0x259>
        if (hget1bit() == 1) *x = -*x;
    6fc5:	e8 bd e5 ff ff       	call   5587 <hget1bit>
    6fca:	83 f8 01             	cmp    $0x1,%eax
    6fcd:	75 0e                	jne    6fdd <huffman_decoder+0x259>
    6fcf:	8b 45 0c             	mov    0xc(%ebp),%eax
    6fd2:	8b 00                	mov    (%eax),%eax
    6fd4:	f7 d8                	neg    %eax
    6fd6:	89 c2                	mov    %eax,%edx
    6fd8:	8b 45 0c             	mov    0xc(%ebp),%eax
    6fdb:	89 10                	mov    %edx,(%eax)
     if (*y)
    6fdd:	8b 45 10             	mov    0x10(%ebp),%eax
    6fe0:	8b 00                	mov    (%eax),%eax
    6fe2:	85 c0                	test   %eax,%eax
    6fe4:	74 1d                	je     7003 <huffman_decoder+0x27f>
        if (hget1bit() == 1) *y = -*y;
    6fe6:	e8 9c e5 ff ff       	call   5587 <hget1bit>
    6feb:	83 f8 01             	cmp    $0x1,%eax
    6fee:	75 13                	jne    7003 <huffman_decoder+0x27f>
    6ff0:	8b 45 10             	mov    0x10(%ebp),%eax
    6ff3:	8b 00                	mov    (%eax),%eax
    6ff5:	f7 d8                	neg    %eax
    6ff7:	89 c2                	mov    %eax,%edx
    6ff9:	8b 45 10             	mov    0x10(%ebp),%eax
    6ffc:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    6ffe:	e9 c3 00 00 00       	jmp    70c6 <huffman_decoder+0x342>
    7003:	e9 be 00 00 00       	jmp    70c6 <huffman_decoder+0x342>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    7008:	8b 45 08             	mov    0x8(%ebp),%eax
    700b:	8b 40 0c             	mov    0xc(%eax),%eax
    700e:	85 c0                	test   %eax,%eax
    7010:	74 34                	je     7046 <huffman_decoder+0x2c2>
       if ((h->xlen-1) == *x) 
    7012:	8b 45 08             	mov    0x8(%ebp),%eax
    7015:	8b 40 04             	mov    0x4(%eax),%eax
    7018:	8d 50 ff             	lea    -0x1(%eax),%edx
    701b:	8b 45 0c             	mov    0xc(%ebp),%eax
    701e:	8b 00                	mov    (%eax),%eax
    7020:	39 c2                	cmp    %eax,%edx
    7022:	75 22                	jne    7046 <huffman_decoder+0x2c2>
         *x += hgetbits(h->linbits);
    7024:	8b 45 08             	mov    0x8(%ebp),%eax
    7027:	8b 40 0c             	mov    0xc(%eax),%eax
    702a:	83 ec 0c             	sub    $0xc,%esp
    702d:	50                   	push   %eax
    702e:	e8 3c e5 ff ff       	call   556f <hgetbits>
    7033:	83 c4 10             	add    $0x10,%esp
    7036:	89 c2                	mov    %eax,%edx
    7038:	8b 45 0c             	mov    0xc(%ebp),%eax
    703b:	8b 00                	mov    (%eax),%eax
    703d:	01 d0                	add    %edx,%eax
    703f:	89 c2                	mov    %eax,%edx
    7041:	8b 45 0c             	mov    0xc(%ebp),%eax
    7044:	89 10                	mov    %edx,(%eax)
     if (*x)
    7046:	8b 45 0c             	mov    0xc(%ebp),%eax
    7049:	8b 00                	mov    (%eax),%eax
    704b:	85 c0                	test   %eax,%eax
    704d:	74 18                	je     7067 <huffman_decoder+0x2e3>
        if (hget1bit() == 1) *x = -*x;
    704f:	e8 33 e5 ff ff       	call   5587 <hget1bit>
    7054:	83 f8 01             	cmp    $0x1,%eax
    7057:	75 0e                	jne    7067 <huffman_decoder+0x2e3>
    7059:	8b 45 0c             	mov    0xc(%ebp),%eax
    705c:	8b 00                	mov    (%eax),%eax
    705e:	f7 d8                	neg    %eax
    7060:	89 c2                	mov    %eax,%edx
    7062:	8b 45 0c             	mov    0xc(%ebp),%eax
    7065:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    7067:	8b 45 08             	mov    0x8(%ebp),%eax
    706a:	8b 40 0c             	mov    0xc(%eax),%eax
    706d:	85 c0                	test   %eax,%eax
    706f:	74 34                	je     70a5 <huffman_decoder+0x321>
       if ((h->ylen-1) == *y)
    7071:	8b 45 08             	mov    0x8(%ebp),%eax
    7074:	8b 40 08             	mov    0x8(%eax),%eax
    7077:	8d 50 ff             	lea    -0x1(%eax),%edx
    707a:	8b 45 10             	mov    0x10(%ebp),%eax
    707d:	8b 00                	mov    (%eax),%eax
    707f:	39 c2                	cmp    %eax,%edx
    7081:	75 22                	jne    70a5 <huffman_decoder+0x321>
         *y += hgetbits(h->linbits);
    7083:	8b 45 08             	mov    0x8(%ebp),%eax
    7086:	8b 40 0c             	mov    0xc(%eax),%eax
    7089:	83 ec 0c             	sub    $0xc,%esp
    708c:	50                   	push   %eax
    708d:	e8 dd e4 ff ff       	call   556f <hgetbits>
    7092:	83 c4 10             	add    $0x10,%esp
    7095:	89 c2                	mov    %eax,%edx
    7097:	8b 45 10             	mov    0x10(%ebp),%eax
    709a:	8b 00                	mov    (%eax),%eax
    709c:	01 d0                	add    %edx,%eax
    709e:	89 c2                	mov    %eax,%edx
    70a0:	8b 45 10             	mov    0x10(%ebp),%eax
    70a3:	89 10                	mov    %edx,(%eax)
     if (*y)
    70a5:	8b 45 10             	mov    0x10(%ebp),%eax
    70a8:	8b 00                	mov    (%eax),%eax
    70aa:	85 c0                	test   %eax,%eax
    70ac:	74 18                	je     70c6 <huffman_decoder+0x342>
        if (hget1bit() == 1) *y = -*y;
    70ae:	e8 d4 e4 ff ff       	call   5587 <hget1bit>
    70b3:	83 f8 01             	cmp    $0x1,%eax
    70b6:	75 0e                	jne    70c6 <huffman_decoder+0x342>
    70b8:	8b 45 10             	mov    0x10(%ebp),%eax
    70bb:	8b 00                	mov    (%eax),%eax
    70bd:	f7 d8                	neg    %eax
    70bf:	89 c2                	mov    %eax,%edx
    70c1:	8b 45 10             	mov    0x10(%ebp),%eax
    70c4:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    70c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    70c9:	c9                   	leave  
    70ca:	c3                   	ret    

000070cb <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    70cb:	55                   	push   %ebp
    70cc:	89 e5                	mov    %esp,%ebp
    70ce:	83 ec 18             	sub    $0x18,%esp
    layer *hdr = fr_ps->header;
    70d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    70d4:	8b 00                	mov    (%eax),%eax
    70d6:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    70d9:	83 ec 0c             	sub    $0xc,%esp
    70dc:	ff 75 08             	pushl  0x8(%ebp)
    70df:	e8 19 e0 ff ff       	call   50fd <get1bit>
    70e4:	83 c4 10             	add    $0x10,%esp
    70e7:	89 c2                	mov    %eax,%edx
    70e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    70ec:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    70ee:	83 ec 08             	sub    $0x8,%esp
    70f1:	6a 02                	push   $0x2
    70f3:	ff 75 08             	pushl  0x8(%ebp)
    70f6:	e8 16 e1 ff ff       	call   5211 <getbits>
    70fb:	83 c4 10             	add    $0x10,%esp
    70fe:	ba 04 00 00 00       	mov    $0x4,%edx
    7103:	29 c2                	sub    %eax,%edx
    7105:	89 d0                	mov    %edx,%eax
    7107:	89 c2                	mov    %eax,%edx
    7109:	8b 45 f4             	mov    -0xc(%ebp),%eax
    710c:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    710f:	83 ec 0c             	sub    $0xc,%esp
    7112:	ff 75 08             	pushl  0x8(%ebp)
    7115:	e8 e3 df ff ff       	call   50fd <get1bit>
    711a:	83 c4 10             	add    $0x10,%esp
    711d:	85 c0                	test   %eax,%eax
    711f:	0f 94 c0             	sete   %al
    7122:	0f b6 d0             	movzbl %al,%edx
    7125:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7128:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    712b:	83 ec 08             	sub    $0x8,%esp
    712e:	6a 04                	push   $0x4
    7130:	ff 75 08             	pushl  0x8(%ebp)
    7133:	e8 d9 e0 ff ff       	call   5211 <getbits>
    7138:	83 c4 10             	add    $0x10,%esp
    713b:	89 c2                	mov    %eax,%edx
    713d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7140:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    7143:	83 ec 08             	sub    $0x8,%esp
    7146:	6a 02                	push   $0x2
    7148:	ff 75 08             	pushl  0x8(%ebp)
    714b:	e8 c1 e0 ff ff       	call   5211 <getbits>
    7150:	83 c4 10             	add    $0x10,%esp
    7153:	89 c2                	mov    %eax,%edx
    7155:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7158:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    715b:	83 ec 0c             	sub    $0xc,%esp
    715e:	ff 75 08             	pushl  0x8(%ebp)
    7161:	e8 97 df ff ff       	call   50fd <get1bit>
    7166:	83 c4 10             	add    $0x10,%esp
    7169:	89 c2                	mov    %eax,%edx
    716b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    716e:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    7171:	83 ec 0c             	sub    $0xc,%esp
    7174:	ff 75 08             	pushl  0x8(%ebp)
    7177:	e8 81 df ff ff       	call   50fd <get1bit>
    717c:	83 c4 10             	add    $0x10,%esp
    717f:	89 c2                	mov    %eax,%edx
    7181:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7184:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    7187:	83 ec 08             	sub    $0x8,%esp
    718a:	6a 02                	push   $0x2
    718c:	ff 75 08             	pushl  0x8(%ebp)
    718f:	e8 7d e0 ff ff       	call   5211 <getbits>
    7194:	83 c4 10             	add    $0x10,%esp
    7197:	89 c2                	mov    %eax,%edx
    7199:	8b 45 f4             	mov    -0xc(%ebp),%eax
    719c:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    719f:	83 ec 08             	sub    $0x8,%esp
    71a2:	6a 02                	push   $0x2
    71a4:	ff 75 08             	pushl  0x8(%ebp)
    71a7:	e8 65 e0 ff ff       	call   5211 <getbits>
    71ac:	83 c4 10             	add    $0x10,%esp
    71af:	89 c2                	mov    %eax,%edx
    71b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71b4:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    71b7:	83 ec 0c             	sub    $0xc,%esp
    71ba:	ff 75 08             	pushl  0x8(%ebp)
    71bd:	e8 3b df ff ff       	call   50fd <get1bit>
    71c2:	83 c4 10             	add    $0x10,%esp
    71c5:	89 c2                	mov    %eax,%edx
    71c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71ca:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    71cd:	83 ec 0c             	sub    $0xc,%esp
    71d0:	ff 75 08             	pushl  0x8(%ebp)
    71d3:	e8 25 df ff ff       	call   50fd <get1bit>
    71d8:	83 c4 10             	add    $0x10,%esp
    71db:	89 c2                	mov    %eax,%edx
    71dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71e0:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    71e3:	83 ec 08             	sub    $0x8,%esp
    71e6:	6a 02                	push   $0x2
    71e8:	ff 75 08             	pushl  0x8(%ebp)
    71eb:	e8 21 e0 ff ff       	call   5211 <getbits>
    71f0:	83 c4 10             	add    $0x10,%esp
    71f3:	89 c2                	mov    %eax,%edx
    71f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71f8:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    71fb:	c9                   	leave  
    71fc:	c3                   	ret    

000071fd <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    71fd:	55                   	push   %ebp
    71fe:	89 e5                	mov    %esp,%ebp
    7200:	56                   	push   %esi
    7201:	53                   	push   %ebx
    7202:	83 ec 10             	sub    $0x10,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    7205:	8b 45 10             	mov    0x10(%ebp),%eax
    7208:	8b 40 08             	mov    0x8(%eax),%eax
    720b:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    720e:	83 ec 08             	sub    $0x8,%esp
    7211:	6a 09                	push   $0x9
    7213:	ff 75 08             	pushl  0x8(%ebp)
    7216:	e8 f6 df ff ff       	call   5211 <getbits>
    721b:	83 c4 10             	add    $0x10,%esp
    721e:	89 c2                	mov    %eax,%edx
    7220:	8b 45 0c             	mov    0xc(%ebp),%eax
    7223:	89 10                	mov    %edx,(%eax)
	if (stereo == 1)
    7225:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    7229:	75 1a                	jne    7245 <III_get_side_info+0x48>
		si->private_bits = getbits(bs,5);
    722b:	83 ec 08             	sub    $0x8,%esp
    722e:	6a 05                	push   $0x5
    7230:	ff 75 08             	pushl  0x8(%ebp)
    7233:	e8 d9 df ff ff       	call   5211 <getbits>
    7238:	83 c4 10             	add    $0x10,%esp
    723b:	89 c2                	mov    %eax,%edx
    723d:	8b 45 0c             	mov    0xc(%ebp),%eax
    7240:	89 50 04             	mov    %edx,0x4(%eax)
    7243:	eb 18                	jmp    725d <III_get_side_info+0x60>
	else
		si->private_bits = getbits(bs,3);
    7245:	83 ec 08             	sub    $0x8,%esp
    7248:	6a 03                	push   $0x3
    724a:	ff 75 08             	pushl  0x8(%ebp)
    724d:	e8 bf df ff ff       	call   5211 <getbits>
    7252:	83 c4 10             	add    $0x10,%esp
    7255:	89 c2                	mov    %eax,%edx
    7257:	8b 45 0c             	mov    0xc(%ebp),%eax
    725a:	89 50 04             	mov    %edx,0x4(%eax)

	for (ch=0; ch<stereo; ch++)
    725d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7264:	eb 40                	jmp    72a6 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    7266:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    726d:	eb 2d                	jmp    729c <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    726f:	83 ec 0c             	sub    $0xc,%esp
    7272:	ff 75 08             	pushl  0x8(%ebp)
    7275:	e8 83 de ff ff       	call   50fd <get1bit>
    727a:	83 c4 10             	add    $0x10,%esp
    727d:	89 c3                	mov    %eax,%ebx
    727f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7282:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7285:	89 d0                	mov    %edx,%eax
    7287:	c1 e0 02             	shl    $0x2,%eax
    728a:	01 d0                	add    %edx,%eax
    728c:	c1 e0 03             	shl    $0x3,%eax
    728f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7292:	01 d0                	add    %edx,%eax
    7294:	89 5c 81 08          	mov    %ebx,0x8(%ecx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    7298:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    729c:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    72a0:	7e cd                	jle    726f <III_get_side_info+0x72>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    72a2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    72a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    72a9:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    72ac:	7c b8                	jl     7266 <III_get_side_info+0x69>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    72ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    72b5:	e9 cb 05 00 00       	jmp    7885 <III_get_side_info+0x688>
		for (ch=0; ch<stereo; ch++) {
    72ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    72c1:	e9 af 05 00 00       	jmp    7875 <III_get_side_info+0x678>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    72c6:	83 ec 08             	sub    $0x8,%esp
    72c9:	6a 0c                	push   $0xc
    72cb:	ff 75 08             	pushl  0x8(%ebp)
    72ce:	e8 3e df ff ff       	call   5211 <getbits>
    72d3:	83 c4 10             	add    $0x10,%esp
    72d6:	89 c6                	mov    %eax,%esi
    72d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    72db:	8b 45 f0             	mov    -0x10(%ebp),%eax
    72de:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    72e1:	89 c2                	mov    %eax,%edx
    72e3:	c1 e2 03             	shl    $0x3,%edx
    72e6:	01 c2                	add    %eax,%edx
    72e8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    72ef:	89 c2                	mov    %eax,%edx
    72f1:	89 c8                	mov    %ecx,%eax
    72f3:	c1 e0 02             	shl    $0x2,%eax
    72f6:	01 c8                	add    %ecx,%eax
    72f8:	c1 e0 05             	shl    $0x5,%eax
    72fb:	01 d0                	add    %edx,%eax
    72fd:	01 d8                	add    %ebx,%eax
    72ff:	83 c0 10             	add    $0x10,%eax
    7302:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    7305:	83 ec 08             	sub    $0x8,%esp
    7308:	6a 09                	push   $0x9
    730a:	ff 75 08             	pushl  0x8(%ebp)
    730d:	e8 ff de ff ff       	call   5211 <getbits>
    7312:	83 c4 10             	add    $0x10,%esp
    7315:	89 c6                	mov    %eax,%esi
    7317:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    731a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    731d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7320:	89 c2                	mov    %eax,%edx
    7322:	c1 e2 03             	shl    $0x3,%edx
    7325:	01 c2                	add    %eax,%edx
    7327:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    732e:	89 c2                	mov    %eax,%edx
    7330:	89 c8                	mov    %ecx,%eax
    7332:	c1 e0 02             	shl    $0x2,%eax
    7335:	01 c8                	add    %ecx,%eax
    7337:	c1 e0 05             	shl    $0x5,%eax
    733a:	01 d0                	add    %edx,%eax
    733c:	01 d8                	add    %ebx,%eax
    733e:	83 c0 10             	add    $0x10,%eax
    7341:	89 70 0c             	mov    %esi,0xc(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    7344:	83 ec 08             	sub    $0x8,%esp
    7347:	6a 08                	push   $0x8
    7349:	ff 75 08             	pushl  0x8(%ebp)
    734c:	e8 c0 de ff ff       	call   5211 <getbits>
    7351:	83 c4 10             	add    $0x10,%esp
    7354:	89 c6                	mov    %eax,%esi
    7356:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7359:	8b 45 f0             	mov    -0x10(%ebp),%eax
    735c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    735f:	89 c2                	mov    %eax,%edx
    7361:	c1 e2 03             	shl    $0x3,%edx
    7364:	01 c2                	add    %eax,%edx
    7366:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    736d:	89 c2                	mov    %eax,%edx
    736f:	89 c8                	mov    %ecx,%eax
    7371:	c1 e0 02             	shl    $0x2,%eax
    7374:	01 c8                	add    %ecx,%eax
    7376:	c1 e0 05             	shl    $0x5,%eax
    7379:	01 d0                	add    %edx,%eax
    737b:	01 d8                	add    %ebx,%eax
    737d:	83 c0 10             	add    $0x10,%eax
    7380:	89 70 10             	mov    %esi,0x10(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    7383:	83 ec 08             	sub    $0x8,%esp
    7386:	6a 04                	push   $0x4
    7388:	ff 75 08             	pushl  0x8(%ebp)
    738b:	e8 81 de ff ff       	call   5211 <getbits>
    7390:	83 c4 10             	add    $0x10,%esp
    7393:	89 c6                	mov    %eax,%esi
    7395:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7398:	8b 45 f0             	mov    -0x10(%ebp),%eax
    739b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    739e:	89 c2                	mov    %eax,%edx
    73a0:	c1 e2 03             	shl    $0x3,%edx
    73a3:	01 c2                	add    %eax,%edx
    73a5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    73ac:	89 c2                	mov    %eax,%edx
    73ae:	89 c8                	mov    %ecx,%eax
    73b0:	c1 e0 02             	shl    $0x2,%eax
    73b3:	01 c8                	add    %ecx,%eax
    73b5:	c1 e0 05             	shl    $0x5,%eax
    73b8:	01 d0                	add    %edx,%eax
    73ba:	01 d8                	add    %ebx,%eax
    73bc:	83 c0 10             	add    $0x10,%eax
    73bf:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    73c2:	83 ec 0c             	sub    $0xc,%esp
    73c5:	ff 75 08             	pushl  0x8(%ebp)
    73c8:	e8 30 dd ff ff       	call   50fd <get1bit>
    73cd:	83 c4 10             	add    $0x10,%esp
    73d0:	89 c6                	mov    %eax,%esi
    73d2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    73d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73d8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    73db:	89 c2                	mov    %eax,%edx
    73dd:	c1 e2 03             	shl    $0x3,%edx
    73e0:	01 c2                	add    %eax,%edx
    73e2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    73e9:	89 c2                	mov    %eax,%edx
    73eb:	89 c8                	mov    %ecx,%eax
    73ed:	c1 e0 02             	shl    $0x2,%eax
    73f0:	01 c8                	add    %ecx,%eax
    73f2:	c1 e0 05             	shl    $0x5,%eax
    73f5:	01 d0                	add    %edx,%eax
    73f7:	01 d8                	add    %ebx,%eax
    73f9:	83 c0 20             	add    $0x20,%eax
    73fc:	89 70 08             	mov    %esi,0x8(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    73ff:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7402:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7405:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7408:	89 c2                	mov    %eax,%edx
    740a:	c1 e2 03             	shl    $0x3,%edx
    740d:	01 c2                	add    %eax,%edx
    740f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7416:	89 c2                	mov    %eax,%edx
    7418:	89 c8                	mov    %ecx,%eax
    741a:	c1 e0 02             	shl    $0x2,%eax
    741d:	01 c8                	add    %ecx,%eax
    741f:	c1 e0 05             	shl    $0x5,%eax
    7422:	01 d0                	add    %edx,%eax
    7424:	01 d8                	add    %ebx,%eax
    7426:	83 c0 20             	add    $0x20,%eax
    7429:	8b 40 08             	mov    0x8(%eax),%eax
    742c:	85 c0                	test   %eax,%eax
    742e:	0f 84 85 02 00 00    	je     76b9 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    7434:	83 ec 08             	sub    $0x8,%esp
    7437:	6a 02                	push   $0x2
    7439:	ff 75 08             	pushl  0x8(%ebp)
    743c:	e8 d0 dd ff ff       	call   5211 <getbits>
    7441:	83 c4 10             	add    $0x10,%esp
    7444:	89 c6                	mov    %eax,%esi
    7446:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7449:	8b 45 f0             	mov    -0x10(%ebp),%eax
    744c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    744f:	89 c2                	mov    %eax,%edx
    7451:	c1 e2 03             	shl    $0x3,%edx
    7454:	01 c2                	add    %eax,%edx
    7456:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    745d:	89 c2                	mov    %eax,%edx
    745f:	89 c8                	mov    %ecx,%eax
    7461:	c1 e0 02             	shl    $0x2,%eax
    7464:	01 c8                	add    %ecx,%eax
    7466:	c1 e0 05             	shl    $0x5,%eax
    7469:	01 d0                	add    %edx,%eax
    746b:	01 d8                	add    %ebx,%eax
    746d:	83 c0 20             	add    $0x20,%eax
    7470:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    7473:	83 ec 0c             	sub    $0xc,%esp
    7476:	ff 75 08             	pushl  0x8(%ebp)
    7479:	e8 7f dc ff ff       	call   50fd <get1bit>
    747e:	83 c4 10             	add    $0x10,%esp
    7481:	89 c6                	mov    %eax,%esi
    7483:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7486:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7489:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    748c:	89 c2                	mov    %eax,%edx
    748e:	c1 e2 03             	shl    $0x3,%edx
    7491:	01 c2                	add    %eax,%edx
    7493:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    749a:	89 c2                	mov    %eax,%edx
    749c:	89 c8                	mov    %ecx,%eax
    749e:	c1 e0 02             	shl    $0x2,%eax
    74a1:	01 c8                	add    %ecx,%eax
    74a3:	c1 e0 05             	shl    $0x5,%eax
    74a6:	01 d0                	add    %edx,%eax
    74a8:	01 d8                	add    %ebx,%eax
    74aa:	83 c0 20             	add    $0x20,%eax
    74ad:	89 70 10             	mov    %esi,0x10(%eax)
				for (i=0; i<2; i++)
    74b0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    74b7:	eb 43                	jmp    74fc <III_get_side_info+0x2ff>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    74b9:	83 ec 08             	sub    $0x8,%esp
    74bc:	6a 05                	push   $0x5
    74be:	ff 75 08             	pushl  0x8(%ebp)
    74c1:	e8 4b dd ff ff       	call   5211 <getbits>
    74c6:	83 c4 10             	add    $0x10,%esp
    74c9:	89 c6                	mov    %eax,%esi
    74cb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    74ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    74d1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    74d4:	89 c2                	mov    %eax,%edx
    74d6:	c1 e2 03             	shl    $0x3,%edx
    74d9:	01 c2                	add    %eax,%edx
    74db:	8d 04 12             	lea    (%edx,%edx,1),%eax
    74de:	89 c2                	mov    %eax,%edx
    74e0:	89 c8                	mov    %ecx,%eax
    74e2:	c1 e0 02             	shl    $0x2,%eax
    74e5:	01 c8                	add    %ecx,%eax
    74e7:	c1 e0 03             	shl    $0x3,%eax
    74ea:	01 c2                	add    %eax,%edx
    74ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
    74ef:	01 d0                	add    %edx,%eax
    74f1:	83 c0 08             	add    $0x8,%eax
    74f4:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    74f8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    74fc:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    7500:	7e b7                	jle    74b9 <III_get_side_info+0x2bc>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    7502:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7509:	eb 43                	jmp    754e <III_get_side_info+0x351>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    750b:	83 ec 08             	sub    $0x8,%esp
    750e:	6a 03                	push   $0x3
    7510:	ff 75 08             	pushl  0x8(%ebp)
    7513:	e8 f9 dc ff ff       	call   5211 <getbits>
    7518:	83 c4 10             	add    $0x10,%esp
    751b:	89 c6                	mov    %eax,%esi
    751d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7520:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7523:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7526:	89 c2                	mov    %eax,%edx
    7528:	c1 e2 03             	shl    $0x3,%edx
    752b:	01 c2                	add    %eax,%edx
    752d:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7530:	89 c2                	mov    %eax,%edx
    7532:	89 c8                	mov    %ecx,%eax
    7534:	c1 e0 02             	shl    $0x2,%eax
    7537:	01 c8                	add    %ecx,%eax
    7539:	c1 e0 03             	shl    $0x3,%eax
    753c:	01 c2                	add    %eax,%edx
    753e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7541:	01 d0                	add    %edx,%eax
    7543:	83 c0 0c             	add    $0xc,%eax
    7546:	89 74 83 10          	mov    %esi,0x10(%ebx,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    754a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    754e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7552:	7e b7                	jle    750b <III_get_side_info+0x30e>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    7554:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7557:	8b 45 f0             	mov    -0x10(%ebp),%eax
    755a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    755d:	89 c2                	mov    %eax,%edx
    755f:	c1 e2 03             	shl    $0x3,%edx
    7562:	01 c2                	add    %eax,%edx
    7564:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    756b:	89 c2                	mov    %eax,%edx
    756d:	89 c8                	mov    %ecx,%eax
    756f:	c1 e0 02             	shl    $0x2,%eax
    7572:	01 c8                	add    %ecx,%eax
    7574:	c1 e0 05             	shl    $0x5,%eax
    7577:	01 d0                	add    %edx,%eax
    7579:	01 d8                	add    %ebx,%eax
    757b:	83 c0 20             	add    $0x20,%eax
    757e:	8b 40 0c             	mov    0xc(%eax),%eax
    7581:	85 c0                	test   %eax,%eax
    7583:	75 05                	jne    758a <III_get_side_info+0x38d>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    7585:	e8 74 cc ff ff       	call   41fe <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    758a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    758d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7590:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7593:	89 c2                	mov    %eax,%edx
    7595:	c1 e2 03             	shl    $0x3,%edx
    7598:	01 c2                	add    %eax,%edx
    759a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    75a1:	89 c2                	mov    %eax,%edx
    75a3:	89 c8                	mov    %ecx,%eax
    75a5:	c1 e0 02             	shl    $0x2,%eax
    75a8:	01 c8                	add    %ecx,%eax
    75aa:	c1 e0 05             	shl    $0x5,%eax
    75ad:	01 d0                	add    %edx,%eax
    75af:	01 d8                	add    %ebx,%eax
    75b1:	83 c0 20             	add    $0x20,%eax
    75b4:	8b 40 0c             	mov    0xc(%eax),%eax
    75b7:	83 f8 02             	cmp    $0x2,%eax
    75ba:	75 64                	jne    7620 <III_get_side_info+0x423>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    75bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    75bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75c2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    75c5:	89 c2                	mov    %eax,%edx
    75c7:	c1 e2 03             	shl    $0x3,%edx
    75ca:	01 c2                	add    %eax,%edx
    75cc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    75d3:	89 c2                	mov    %eax,%edx
    75d5:	89 c8                	mov    %ecx,%eax
    75d7:	c1 e0 02             	shl    $0x2,%eax
    75da:	01 c8                	add    %ecx,%eax
    75dc:	c1 e0 05             	shl    $0x5,%eax
    75df:	01 d0                	add    %edx,%eax
    75e1:	01 d8                	add    %ebx,%eax
    75e3:	83 c0 20             	add    $0x20,%eax
    75e6:	8b 40 10             	mov    0x10(%eax),%eax
    75e9:	85 c0                	test   %eax,%eax
    75eb:	75 33                	jne    7620 <III_get_side_info+0x423>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    75ed:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    75f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75f3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    75f6:	89 c2                	mov    %eax,%edx
    75f8:	c1 e2 03             	shl    $0x3,%edx
    75fb:	01 c2                	add    %eax,%edx
    75fd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7604:	89 c2                	mov    %eax,%edx
    7606:	89 c8                	mov    %ecx,%eax
    7608:	c1 e0 02             	shl    $0x2,%eax
    760b:	01 c8                	add    %ecx,%eax
    760d:	c1 e0 05             	shl    $0x5,%eax
    7610:	01 d0                	add    %edx,%eax
    7612:	01 d8                	add    %ebx,%eax
    7614:	83 c0 40             	add    $0x40,%eax
    7617:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
    761e:	eb 31                	jmp    7651 <III_get_side_info+0x454>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    7620:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7623:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7626:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7629:	89 c2                	mov    %eax,%edx
    762b:	c1 e2 03             	shl    $0x3,%edx
    762e:	01 c2                	add    %eax,%edx
    7630:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7637:	89 c2                	mov    %eax,%edx
    7639:	89 c8                	mov    %ecx,%eax
    763b:	c1 e0 02             	shl    $0x2,%eax
    763e:	01 c8                	add    %ecx,%eax
    7640:	c1 e0 05             	shl    $0x5,%eax
    7643:	01 d0                	add    %edx,%eax
    7645:	01 d8                	add    %ebx,%eax
    7647:	83 c0 40             	add    $0x40,%eax
    764a:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    7651:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7654:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7657:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    765a:	89 c2                	mov    %eax,%edx
    765c:	c1 e2 03             	shl    $0x3,%edx
    765f:	01 c2                	add    %eax,%edx
    7661:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7668:	89 c2                	mov    %eax,%edx
    766a:	89 c8                	mov    %ecx,%eax
    766c:	c1 e0 02             	shl    $0x2,%eax
    766f:	01 c8                	add    %ecx,%eax
    7671:	c1 e0 05             	shl    $0x5,%eax
    7674:	01 d0                	add    %edx,%eax
    7676:	01 d8                	add    %ebx,%eax
    7678:	83 c0 40             	add    $0x40,%eax
    767b:	8b 40 0c             	mov    0xc(%eax),%eax
    767e:	ba 14 00 00 00       	mov    $0x14,%edx
    7683:	89 d3                	mov    %edx,%ebx
    7685:	29 c3                	sub    %eax,%ebx
    7687:	8b 75 0c             	mov    0xc(%ebp),%esi
    768a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    768d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7690:	89 c2                	mov    %eax,%edx
    7692:	c1 e2 03             	shl    $0x3,%edx
    7695:	01 c2                	add    %eax,%edx
    7697:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    769e:	89 c2                	mov    %eax,%edx
    76a0:	89 c8                	mov    %ecx,%eax
    76a2:	c1 e0 02             	shl    $0x2,%eax
    76a5:	01 c8                	add    %ecx,%eax
    76a7:	c1 e0 05             	shl    $0x5,%eax
    76aa:	01 d0                	add    %edx,%eax
    76ac:	01 f0                	add    %esi,%eax
    76ae:	83 c0 40             	add    $0x40,%eax
    76b1:	89 58 10             	mov    %ebx,0x10(%eax)
    76b4:	e9 01 01 00 00       	jmp    77ba <III_get_side_info+0x5bd>
			}
			else {
				for (i=0; i<3; i++)
    76b9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    76c0:	eb 43                	jmp    7705 <III_get_side_info+0x508>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    76c2:	83 ec 08             	sub    $0x8,%esp
    76c5:	6a 05                	push   $0x5
    76c7:	ff 75 08             	pushl  0x8(%ebp)
    76ca:	e8 42 db ff ff       	call   5211 <getbits>
    76cf:	83 c4 10             	add    $0x10,%esp
    76d2:	89 c6                	mov    %eax,%esi
    76d4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    76d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    76da:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    76dd:	89 c2                	mov    %eax,%edx
    76df:	c1 e2 03             	shl    $0x3,%edx
    76e2:	01 c2                	add    %eax,%edx
    76e4:	8d 04 12             	lea    (%edx,%edx,1),%eax
    76e7:	89 c2                	mov    %eax,%edx
    76e9:	89 c8                	mov    %ecx,%eax
    76eb:	c1 e0 02             	shl    $0x2,%eax
    76ee:	01 c8                	add    %ecx,%eax
    76f0:	c1 e0 03             	shl    $0x3,%eax
    76f3:	01 c2                	add    %eax,%edx
    76f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    76f8:	01 d0                	add    %edx,%eax
    76fa:	83 c0 08             	add    $0x8,%eax
    76fd:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    7701:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7705:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7709:	7e b7                	jle    76c2 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    770b:	83 ec 08             	sub    $0x8,%esp
    770e:	6a 04                	push   $0x4
    7710:	ff 75 08             	pushl  0x8(%ebp)
    7713:	e8 f9 da ff ff       	call   5211 <getbits>
    7718:	83 c4 10             	add    $0x10,%esp
    771b:	89 c6                	mov    %eax,%esi
    771d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7720:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7723:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7726:	89 c2                	mov    %eax,%edx
    7728:	c1 e2 03             	shl    $0x3,%edx
    772b:	01 c2                	add    %eax,%edx
    772d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7734:	89 c2                	mov    %eax,%edx
    7736:	89 c8                	mov    %ecx,%eax
    7738:	c1 e0 02             	shl    $0x2,%eax
    773b:	01 c8                	add    %ecx,%eax
    773d:	c1 e0 05             	shl    $0x5,%eax
    7740:	01 d0                	add    %edx,%eax
    7742:	01 d8                	add    %ebx,%eax
    7744:	83 c0 40             	add    $0x40,%eax
    7747:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    774a:	83 ec 08             	sub    $0x8,%esp
    774d:	6a 03                	push   $0x3
    774f:	ff 75 08             	pushl  0x8(%ebp)
    7752:	e8 ba da ff ff       	call   5211 <getbits>
    7757:	83 c4 10             	add    $0x10,%esp
    775a:	89 c6                	mov    %eax,%esi
    775c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    775f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7762:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7765:	89 c2                	mov    %eax,%edx
    7767:	c1 e2 03             	shl    $0x3,%edx
    776a:	01 c2                	add    %eax,%edx
    776c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7773:	89 c2                	mov    %eax,%edx
    7775:	89 c8                	mov    %ecx,%eax
    7777:	c1 e0 02             	shl    $0x2,%eax
    777a:	01 c8                	add    %ecx,%eax
    777c:	c1 e0 05             	shl    $0x5,%eax
    777f:	01 d0                	add    %edx,%eax
    7781:	01 d8                	add    %ebx,%eax
    7783:	83 c0 40             	add    $0x40,%eax
    7786:	89 70 10             	mov    %esi,0x10(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    7789:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    778c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    778f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7792:	89 c2                	mov    %eax,%edx
    7794:	c1 e2 03             	shl    $0x3,%edx
    7797:	01 c2                	add    %eax,%edx
    7799:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    77a0:	89 c2                	mov    %eax,%edx
    77a2:	89 c8                	mov    %ecx,%eax
    77a4:	c1 e0 02             	shl    $0x2,%eax
    77a7:	01 c8                	add    %ecx,%eax
    77a9:	c1 e0 05             	shl    $0x5,%eax
    77ac:	01 d0                	add    %edx,%eax
    77ae:	01 d8                	add    %ebx,%eax
    77b0:	83 c0 20             	add    $0x20,%eax
    77b3:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    77ba:	83 ec 0c             	sub    $0xc,%esp
    77bd:	ff 75 08             	pushl  0x8(%ebp)
    77c0:	e8 38 d9 ff ff       	call   50fd <get1bit>
    77c5:	83 c4 10             	add    $0x10,%esp
    77c8:	89 c6                	mov    %eax,%esi
    77ca:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    77cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    77d0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    77d3:	89 c2                	mov    %eax,%edx
    77d5:	c1 e2 03             	shl    $0x3,%edx
    77d8:	01 c2                	add    %eax,%edx
    77da:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    77e1:	89 c2                	mov    %eax,%edx
    77e3:	89 c8                	mov    %ecx,%eax
    77e5:	c1 e0 02             	shl    $0x2,%eax
    77e8:	01 c8                	add    %ecx,%eax
    77ea:	c1 e0 05             	shl    $0x5,%eax
    77ed:	01 d0                	add    %edx,%eax
    77ef:	01 d8                	add    %ebx,%eax
    77f1:	83 c0 40             	add    $0x40,%eax
    77f4:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    77f7:	83 ec 0c             	sub    $0xc,%esp
    77fa:	ff 75 08             	pushl  0x8(%ebp)
    77fd:	e8 fb d8 ff ff       	call   50fd <get1bit>
    7802:	83 c4 10             	add    $0x10,%esp
    7805:	89 c6                	mov    %eax,%esi
    7807:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    780a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    780d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7810:	89 c2                	mov    %eax,%edx
    7812:	c1 e2 03             	shl    $0x3,%edx
    7815:	01 c2                	add    %eax,%edx
    7817:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    781e:	89 c2                	mov    %eax,%edx
    7820:	89 c8                	mov    %ecx,%eax
    7822:	c1 e0 02             	shl    $0x2,%eax
    7825:	01 c8                	add    %ecx,%eax
    7827:	c1 e0 05             	shl    $0x5,%eax
    782a:	01 d0                	add    %edx,%eax
    782c:	01 d8                	add    %ebx,%eax
    782e:	83 c0 50             	add    $0x50,%eax
    7831:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    7834:	83 ec 0c             	sub    $0xc,%esp
    7837:	ff 75 08             	pushl  0x8(%ebp)
    783a:	e8 be d8 ff ff       	call   50fd <get1bit>
    783f:	83 c4 10             	add    $0x10,%esp
    7842:	89 c6                	mov    %eax,%esi
    7844:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7847:	8b 45 f0             	mov    -0x10(%ebp),%eax
    784a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    784d:	89 c2                	mov    %eax,%edx
    784f:	c1 e2 03             	shl    $0x3,%edx
    7852:	01 c2                	add    %eax,%edx
    7854:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    785b:	89 c2                	mov    %eax,%edx
    785d:	89 c8                	mov    %ecx,%eax
    785f:	c1 e0 02             	shl    $0x2,%eax
    7862:	01 c8                	add    %ecx,%eax
    7864:	c1 e0 05             	shl    $0x5,%eax
    7867:	01 d0                	add    %edx,%eax
    7869:	01 d8                	add    %ebx,%eax
    786b:	83 c0 50             	add    $0x50,%eax
    786e:	89 70 0c             	mov    %esi,0xc(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    7871:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7875:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7878:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    787b:	0f 8c 45 fa ff ff    	jl     72c6 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    7881:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7885:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7889:	0f 8e 2b fa ff ff    	jle    72ba <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    788f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    7892:	5b                   	pop    %ebx
    7893:	5e                   	pop    %esi
    7894:	5d                   	pop    %ebp
    7895:	c3                   	ret    

00007896 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    7896:	55                   	push   %ebp
    7897:	89 e5                	mov    %esp,%ebp
    7899:	56                   	push   %esi
    789a:	53                   	push   %ebx
    789b:	83 ec 10             	sub    $0x10,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    789e:	8b 45 10             	mov    0x10(%ebp),%eax
    78a1:	89 c2                	mov    %eax,%edx
    78a3:	c1 e2 03             	shl    $0x3,%edx
    78a6:	01 c2                	add    %eax,%edx
    78a8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    78af:	89 c2                	mov    %eax,%edx
    78b1:	8b 4d 14             	mov    0x14(%ebp),%ecx
    78b4:	89 c8                	mov    %ecx,%eax
    78b6:	c1 e0 02             	shl    $0x2,%eax
    78b9:	01 c8                	add    %ecx,%eax
    78bb:	c1 e0 05             	shl    $0x5,%eax
    78be:	01 d0                	add    %edx,%eax
    78c0:	8d 50 10             	lea    0x10(%eax),%edx
    78c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    78c6:	01 d0                	add    %edx,%eax
    78c8:	83 c0 08             	add    $0x8,%eax
    78cb:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    78ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
    78d1:	8b 40 10             	mov    0x10(%eax),%eax
    78d4:	85 c0                	test   %eax,%eax
    78d6:	0f 84 93 02 00 00    	je     7b6f <III_get_scale_factors+0x2d9>
    78dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    78df:	8b 40 14             	mov    0x14(%eax),%eax
    78e2:	83 f8 02             	cmp    $0x2,%eax
    78e5:	0f 85 84 02 00 00    	jne    7b6f <III_get_scale_factors+0x2d9>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    78eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    78ee:	8b 40 18             	mov    0x18(%eax),%eax
    78f1:	85 c0                	test   %eax,%eax
    78f3:	0f 84 7c 01 00 00    	je     7a75 <III_get_scale_factors+0x1df>
			for (sfb = 0; sfb < 8; sfb++)
    78f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7900:	eb 3b                	jmp    793d <III_get_scale_factors+0xa7>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    7902:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7905:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    7908:	8b 04 85 80 f4 00 00 	mov    0xf480(,%eax,4),%eax
    790f:	83 ec 0c             	sub    $0xc,%esp
    7912:	50                   	push   %eax
    7913:	e8 57 dc ff ff       	call   556f <hgetbits>
    7918:	83 c4 10             	add    $0x10,%esp
    791b:	89 c3                	mov    %eax,%ebx
    791d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7920:	8b 45 14             	mov    0x14(%ebp),%eax
    7923:	89 c2                	mov    %eax,%edx
    7925:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7928:	89 c2                	mov    %eax,%edx
    792a:	89 d0                	mov    %edx,%eax
    792c:	c1 e0 05             	shl    $0x5,%eax
    792f:	29 d0                	sub    %edx,%eax
    7931:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7934:	01 d0                	add    %edx,%eax
    7936:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    7939:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    793d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7941:	7e bf                	jle    7902 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    7943:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    794a:	eb 60                	jmp    79ac <III_get_scale_factors+0x116>
				for (window=0; window<3; window++)
    794c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7953:	eb 4d                	jmp    79a2 <III_get_scale_factors+0x10c>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    7955:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7958:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    795b:	8b 04 85 80 f4 00 00 	mov    0xf480(,%eax,4),%eax
    7962:	83 ec 0c             	sub    $0xc,%esp
    7965:	50                   	push   %eax
    7966:	e8 04 dc ff ff       	call   556f <hgetbits>
    796b:	83 c4 10             	add    $0x10,%esp
    796e:	89 c6                	mov    %eax,%esi
    7970:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7973:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7976:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7979:	89 d0                	mov    %edx,%eax
    797b:	01 c0                	add    %eax,%eax
    797d:	01 d0                	add    %edx,%eax
    797f:	c1 e0 02             	shl    $0x2,%eax
    7982:	01 d0                	add    %edx,%eax
    7984:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7987:	89 d1                	mov    %edx,%ecx
    7989:	89 ca                	mov    %ecx,%edx
    798b:	c1 e2 05             	shl    $0x5,%edx
    798e:	29 ca                	sub    %ecx,%edx
    7990:	01 c2                	add    %eax,%edx
    7992:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7995:	01 d0                	add    %edx,%eax
    7997:	83 c0 14             	add    $0x14,%eax
    799a:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    799e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    79a2:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    79a6:	7e ad                	jle    7955 <III_get_scale_factors+0xbf>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    79a8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    79ac:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    79b0:	7e 9a                	jle    794c <III_get_scale_factors+0xb6>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    79b2:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    79b9:	eb 63                	jmp    7a1e <III_get_scale_factors+0x188>
				for (window=0; window<3; window++)
    79bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    79c2:	eb 50                	jmp    7a14 <III_get_scale_factors+0x17e>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    79c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    79c7:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    79ca:	83 c0 10             	add    $0x10,%eax
    79cd:	8b 04 85 80 f4 00 00 	mov    0xf480(,%eax,4),%eax
    79d4:	83 ec 0c             	sub    $0xc,%esp
    79d7:	50                   	push   %eax
    79d8:	e8 92 db ff ff       	call   556f <hgetbits>
    79dd:	83 c4 10             	add    $0x10,%esp
    79e0:	89 c6                	mov    %eax,%esi
    79e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
    79e5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    79e8:	8b 4d 14             	mov    0x14(%ebp),%ecx
    79eb:	89 d0                	mov    %edx,%eax
    79ed:	01 c0                	add    %eax,%eax
    79ef:	01 d0                	add    %edx,%eax
    79f1:	c1 e0 02             	shl    $0x2,%eax
    79f4:	01 d0                	add    %edx,%eax
    79f6:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    79f9:	89 d1                	mov    %edx,%ecx
    79fb:	89 ca                	mov    %ecx,%edx
    79fd:	c1 e2 05             	shl    $0x5,%edx
    7a00:	29 ca                	sub    %ecx,%edx
    7a02:	01 c2                	add    %eax,%edx
    7a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7a07:	01 d0                	add    %edx,%eax
    7a09:	83 c0 14             	add    $0x14,%eax
    7a0c:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    7a10:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7a14:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7a18:	7e aa                	jle    79c4 <III_get_scale_factors+0x12e>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    7a1a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7a1e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7a22:	7e 97                	jle    79bb <III_get_scale_factors+0x125>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    7a24:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7a2b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7a32:	eb 36                	jmp    7a6a <III_get_scale_factors+0x1d4>
				(*scalefac)[ch].s[window][sfb] = 0;
    7a34:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7a37:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7a3a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7a3d:	89 d0                	mov    %edx,%eax
    7a3f:	01 c0                	add    %eax,%eax
    7a41:	01 d0                	add    %edx,%eax
    7a43:	c1 e0 02             	shl    $0x2,%eax
    7a46:	01 d0                	add    %edx,%eax
    7a48:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7a4b:	89 d1                	mov    %edx,%ecx
    7a4d:	89 ca                	mov    %ecx,%edx
    7a4f:	c1 e2 05             	shl    $0x5,%edx
    7a52:	29 ca                	sub    %ecx,%edx
    7a54:	01 c2                	add    %eax,%edx
    7a56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7a59:	01 d0                	add    %edx,%eax
    7a5b:	83 c0 14             	add    $0x14,%eax
    7a5e:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7a65:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    7a66:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7a6a:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7a6e:	7e c4                	jle    7a34 <III_get_scale_factors+0x19e>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7a70:	e9 bf 01 00 00       	jmp    7c34 <III_get_scale_factors+0x39e>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7a75:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7a7c:	e9 93 00 00 00       	jmp    7b14 <III_get_scale_factors+0x27e>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    7a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a84:	83 c0 04             	add    $0x4,%eax
    7a87:	8b 04 85 44 f4 00 00 	mov    0xf444(,%eax,4),%eax
    7a8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7a91:	eb 68                	jmp    7afb <III_get_scale_factors+0x265>
					for (window=0; window<3; window++)
    7a93:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7a9a:	eb 55                	jmp    7af1 <III_get_scale_factors+0x25b>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    7a9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7a9f:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    7aa2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7aa5:	c1 e2 04             	shl    $0x4,%edx
    7aa8:	01 d0                	add    %edx,%eax
    7aaa:	8b 04 85 80 f4 00 00 	mov    0xf480(,%eax,4),%eax
    7ab1:	83 ec 0c             	sub    $0xc,%esp
    7ab4:	50                   	push   %eax
    7ab5:	e8 b5 da ff ff       	call   556f <hgetbits>
    7aba:	83 c4 10             	add    $0x10,%esp
    7abd:	89 c6                	mov    %eax,%esi
    7abf:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7ac2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7ac5:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7ac8:	89 d0                	mov    %edx,%eax
    7aca:	01 c0                	add    %eax,%eax
    7acc:	01 d0                	add    %edx,%eax
    7ace:	c1 e0 02             	shl    $0x2,%eax
    7ad1:	01 d0                	add    %edx,%eax
    7ad3:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7ad6:	89 d1                	mov    %edx,%ecx
    7ad8:	89 ca                	mov    %ecx,%edx
    7ada:	c1 e2 05             	shl    $0x5,%edx
    7add:	29 ca                	sub    %ecx,%edx
    7adf:	01 c2                	add    %eax,%edx
    7ae1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ae4:	01 d0                	add    %edx,%eax
    7ae6:	83 c0 14             	add    $0x14,%eax
    7ae9:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    7aed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7af1:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7af5:	7e a5                	jle    7a9c <III_get_scale_factors+0x206>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    7af7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7afb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7afe:	83 c0 01             	add    $0x1,%eax
    7b01:	83 c0 04             	add    $0x4,%eax
    7b04:	8b 04 85 44 f4 00 00 	mov    0xf444(,%eax,4),%eax
    7b0b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7b0e:	7f 83                	jg     7a93 <III_get_scale_factors+0x1fd>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7b10:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7b14:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7b18:	0f 8e 63 ff ff ff    	jle    7a81 <III_get_scale_factors+0x1eb>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7b1e:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7b25:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7b2c:	eb 36                	jmp    7b64 <III_get_scale_factors+0x2ce>
					(*scalefac)[ch].s[window][sfb] = 0;
    7b2e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7b31:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7b34:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7b37:	89 d0                	mov    %edx,%eax
    7b39:	01 c0                	add    %eax,%eax
    7b3b:	01 d0                	add    %edx,%eax
    7b3d:	c1 e0 02             	shl    $0x2,%eax
    7b40:	01 d0                	add    %edx,%eax
    7b42:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7b45:	89 d1                	mov    %edx,%ecx
    7b47:	89 ca                	mov    %ecx,%edx
    7b49:	c1 e2 05             	shl    $0x5,%edx
    7b4c:	29 ca                	sub    %ecx,%edx
    7b4e:	01 c2                	add    %eax,%edx
    7b50:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b53:	01 d0                	add    %edx,%eax
    7b55:	83 c0 14             	add    $0x14,%eax
    7b58:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7b5f:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7b60:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7b64:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7b68:	7e c4                	jle    7b2e <III_get_scale_factors+0x298>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7b6a:	e9 c5 00 00 00       	jmp    7c34 <III_get_scale_factors+0x39e>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7b6f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7b76:	e9 92 00 00 00       	jmp    7c0d <III_get_scale_factors+0x377>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    7b7b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7b7e:	8b 55 14             	mov    0x14(%ebp),%edx
    7b81:	89 d0                	mov    %edx,%eax
    7b83:	c1 e0 02             	shl    $0x2,%eax
    7b86:	01 d0                	add    %edx,%eax
    7b88:	c1 e0 03             	shl    $0x3,%eax
    7b8b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b8e:	01 d0                	add    %edx,%eax
    7b90:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    7b94:	85 c0                	test   %eax,%eax
    7b96:	74 06                	je     7b9e <III_get_scale_factors+0x308>
    7b98:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    7b9c:	75 6b                	jne    7c09 <III_get_scale_factors+0x373>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7b9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ba1:	8b 04 85 40 f4 00 00 	mov    0xf440(,%eax,4),%eax
    7ba8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7bab:	eb 4a                	jmp    7bf7 <III_get_scale_factors+0x361>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    7bad:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7bb1:	0f 9f c0             	setg   %al
    7bb4:	0f b6 d0             	movzbl %al,%edx
    7bb7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7bba:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    7bbd:	c1 e2 04             	shl    $0x4,%edx
    7bc0:	01 d0                	add    %edx,%eax
    7bc2:	8b 04 85 80 f4 00 00 	mov    0xf480(,%eax,4),%eax
    7bc9:	83 ec 0c             	sub    $0xc,%esp
    7bcc:	50                   	push   %eax
    7bcd:	e8 9d d9 ff ff       	call   556f <hgetbits>
    7bd2:	83 c4 10             	add    $0x10,%esp
    7bd5:	89 c3                	mov    %eax,%ebx
    7bd7:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7bda:	8b 45 14             	mov    0x14(%ebp),%eax
    7bdd:	89 c2                	mov    %eax,%edx
    7bdf:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7be2:	89 c2                	mov    %eax,%edx
    7be4:	89 d0                	mov    %edx,%eax
    7be6:	c1 e0 05             	shl    $0x5,%eax
    7be9:	29 d0                	sub    %edx,%eax
    7beb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7bee:	01 d0                	add    %edx,%eax
    7bf0:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7bf3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7bf7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7bfa:	83 c0 01             	add    $0x1,%eax
    7bfd:	8b 04 85 40 f4 00 00 	mov    0xf440(,%eax,4),%eax
    7c04:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7c07:	7f a4                	jg     7bad <III_get_scale_factors+0x317>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7c09:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7c0d:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7c11:	0f 8e 64 ff ff ff    	jle    7b7b <III_get_scale_factors+0x2e5>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    7c17:	8b 55 08             	mov    0x8(%ebp),%edx
    7c1a:	8b 45 14             	mov    0x14(%ebp),%eax
    7c1d:	c1 e0 03             	shl    $0x3,%eax
    7c20:	89 c1                	mov    %eax,%ecx
    7c22:	c1 e1 05             	shl    $0x5,%ecx
    7c25:	29 c1                	sub    %eax,%ecx
    7c27:	89 c8                	mov    %ecx,%eax
    7c29:	83 c0 58             	add    $0x58,%eax
    7c2c:	01 d0                	add    %edx,%eax
    7c2e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    7c34:	8d 65 f8             	lea    -0x8(%ebp),%esp
    7c37:	5b                   	pop    %ebx
    7c38:	5e                   	pop    %esi
    7c39:	5d                   	pop    %ebp
    7c3a:	c3                   	ret    

00007c3b <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    7c3b:	55                   	push   %ebp
    7c3c:	89 e5                	mov    %esp,%ebp
    7c3e:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    7c41:	a1 00 f8 00 00       	mov    0xf800,%eax
    7c46:	85 c0                	test   %eax,%eax
    7c48:	74 02                	je     7c4c <initialize_huffman+0x11>
    7c4a:	eb 0f                	jmp    7c5b <initialize_huffman+0x20>
	read_decoder_table();
    7c4c:	e8 7b d9 ff ff       	call   55cc <read_decoder_table>
	huffman_initialized = TRUE;
    7c51:	c7 05 00 f8 00 00 01 	movl   $0x1,0xf800
    7c58:	00 00 00 
}
    7c5b:	c9                   	leave  
    7c5c:	c3                   	ret    

00007c5d <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    7c5d:	55                   	push   %ebp
    7c5e:	89 e5                	mov    %esp,%ebp
    7c60:	57                   	push   %edi
    7c61:	56                   	push   %esi
    7c62:	53                   	push   %ebx
    7c63:	83 ec 2c             	sub    $0x2c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    7c66:	e8 d0 ff ff ff       	call   7c3b <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7c6b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7c6e:	8b 45 14             	mov    0x14(%ebp),%eax
    7c71:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7c74:	89 c2                	mov    %eax,%edx
    7c76:	c1 e2 03             	shl    $0x3,%edx
    7c79:	01 c2                	add    %eax,%edx
    7c7b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c82:	89 c2                	mov    %eax,%edx
    7c84:	89 c8                	mov    %ecx,%eax
    7c86:	c1 e0 02             	shl    $0x2,%eax
    7c89:	01 c8                	add    %ecx,%eax
    7c8b:	c1 e0 05             	shl    $0x5,%eax
    7c8e:	01 d0                	add    %edx,%eax
    7c90:	01 d8                	add    %ebx,%eax
    7c92:	83 c0 20             	add    $0x20,%eax
    7c95:	8b 40 08             	mov    0x8(%eax),%eax
    7c98:	85 c0                	test   %eax,%eax
    7c9a:	74 45                	je     7ce1 <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    7c9c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7c9f:	8b 45 14             	mov    0x14(%ebp),%eax
    7ca2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7ca5:	89 c2                	mov    %eax,%edx
    7ca7:	c1 e2 03             	shl    $0x3,%edx
    7caa:	01 c2                	add    %eax,%edx
    7cac:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7cb3:	89 c2                	mov    %eax,%edx
    7cb5:	89 c8                	mov    %ecx,%eax
    7cb7:	c1 e0 02             	shl    $0x2,%eax
    7cba:	01 c8                	add    %ecx,%eax
    7cbc:	c1 e0 05             	shl    $0x5,%eax
    7cbf:	01 d0                	add    %edx,%eax
    7cc1:	01 d8                	add    %ebx,%eax
    7cc3:	83 c0 20             	add    $0x20,%eax
    7cc6:	8b 40 0c             	mov    0xc(%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7cc9:	83 f8 02             	cmp    $0x2,%eax
    7ccc:	75 13                	jne    7ce1 <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    7cce:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    7cd5:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    7cdc:	e9 cf 00 00 00       	jmp    7db0 <III_hufman_decode+0x153>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7ce1:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7ce4:	8b 00                	mov    (%eax),%eax
    7ce6:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    7ce9:	8b 75 0c             	mov    0xc(%ebp),%esi
    7cec:	8b 45 14             	mov    0x14(%ebp),%eax
    7cef:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7cf2:	89 c2                	mov    %eax,%edx
    7cf4:	c1 e2 03             	shl    $0x3,%edx
    7cf7:	01 c2                	add    %eax,%edx
    7cf9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d00:	89 c2                	mov    %eax,%edx
    7d02:	89 d8                	mov    %ebx,%eax
    7d04:	c1 e0 02             	shl    $0x2,%eax
    7d07:	01 d8                	add    %ebx,%eax
    7d09:	c1 e0 05             	shl    $0x5,%eax
    7d0c:	01 d0                	add    %edx,%eax
    7d0e:	01 f0                	add    %esi,%eax
    7d10:	83 c0 40             	add    $0x40,%eax
    7d13:	8b 40 0c             	mov    0xc(%eax),%eax
    7d16:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7d19:	89 c8                	mov    %ecx,%eax
    7d1b:	c1 e0 03             	shl    $0x3,%eax
    7d1e:	01 c8                	add    %ecx,%eax
    7d20:	c1 e0 02             	shl    $0x2,%eax
    7d23:	01 c8                	add    %ecx,%eax
    7d25:	01 d0                	add    %edx,%eax
    7d27:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    7d2e:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7d31:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7d34:	8b 00                	mov    (%eax),%eax
    7d36:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7d39:	8b 75 0c             	mov    0xc(%ebp),%esi
    7d3c:	8b 45 14             	mov    0x14(%ebp),%eax
    7d3f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7d42:	89 c2                	mov    %eax,%edx
    7d44:	c1 e2 03             	shl    $0x3,%edx
    7d47:	01 c2                	add    %eax,%edx
    7d49:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d50:	89 c2                	mov    %eax,%edx
    7d52:	89 d8                	mov    %ebx,%eax
    7d54:	c1 e0 02             	shl    $0x2,%eax
    7d57:	01 d8                	add    %ebx,%eax
    7d59:	c1 e0 05             	shl    $0x5,%eax
    7d5c:	01 d0                	add    %edx,%eax
    7d5e:	01 f0                	add    %esi,%eax
    7d60:	83 c0 40             	add    $0x40,%eax
    7d63:	8b 70 0c             	mov    0xc(%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    7d66:	8b 7d 0c             	mov    0xc(%ebp),%edi
    7d69:	8b 45 14             	mov    0x14(%ebp),%eax
    7d6c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7d6f:	89 c2                	mov    %eax,%edx
    7d71:	c1 e2 03             	shl    $0x3,%edx
    7d74:	01 c2                	add    %eax,%edx
    7d76:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d7d:	89 c2                	mov    %eax,%edx
    7d7f:	89 d8                	mov    %ebx,%eax
    7d81:	c1 e0 02             	shl    $0x2,%eax
    7d84:	01 d8                	add    %ebx,%eax
    7d86:	c1 e0 05             	shl    $0x5,%eax
    7d89:	01 d0                	add    %edx,%eax
    7d8b:	01 f8                	add    %edi,%eax
    7d8d:	83 c0 40             	add    $0x40,%eax
    7d90:	8b 40 10             	mov    0x10(%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7d93:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    7d95:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7d98:	89 c8                	mov    %ecx,%eax
    7d9a:	c1 e0 03             	shl    $0x3,%eax
    7d9d:	01 c8                	add    %ecx,%eax
    7d9f:	c1 e0 02             	shl    $0x2,%eax
    7da2:	01 c8                	add    %ecx,%eax
    7da4:	01 d0                	add    %edx,%eax
    7da6:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    7dad:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7db0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7db7:	e9 a6 01 00 00       	jmp    7f62 <III_hufman_decode+0x305>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    7dbc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7dbf:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    7dc2:	7d 44                	jge    7e08 <III_hufman_decode+0x1ab>
    7dc4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7dc7:	8b 45 14             	mov    0x14(%ebp),%eax
    7dca:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7dcd:	89 c2                	mov    %eax,%edx
    7dcf:	c1 e2 03             	shl    $0x3,%edx
    7dd2:	01 c2                	add    %eax,%edx
    7dd4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ddb:	89 c2                	mov    %eax,%edx
    7ddd:	89 c8                	mov    %ecx,%eax
    7ddf:	c1 e0 02             	shl    $0x2,%eax
    7de2:	01 c8                	add    %ecx,%eax
    7de4:	c1 e0 05             	shl    $0x5,%eax
    7de7:	01 d0                	add    %edx,%eax
    7de9:	01 d8                	add    %ebx,%eax
    7deb:	83 c0 20             	add    $0x20,%eax
    7dee:	8b 50 14             	mov    0x14(%eax),%edx
    7df1:	89 d0                	mov    %edx,%eax
    7df3:	c1 e0 02             	shl    $0x2,%eax
    7df6:	01 d0                	add    %edx,%eax
    7df8:	c1 e0 03             	shl    $0x3,%eax
    7dfb:	05 40 32 01 00       	add    $0x13240,%eax
    7e00:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7e03:	e9 88 00 00 00       	jmp    7e90 <III_hufman_decode+0x233>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    7e08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7e0b:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    7e0e:	7d 41                	jge    7e51 <III_hufman_decode+0x1f4>
    7e10:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e13:	8b 45 14             	mov    0x14(%ebp),%eax
    7e16:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7e19:	89 c2                	mov    %eax,%edx
    7e1b:	c1 e2 03             	shl    $0x3,%edx
    7e1e:	01 c2                	add    %eax,%edx
    7e20:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7e27:	89 c2                	mov    %eax,%edx
    7e29:	89 c8                	mov    %ecx,%eax
    7e2b:	c1 e0 02             	shl    $0x2,%eax
    7e2e:	01 c8                	add    %ecx,%eax
    7e30:	c1 e0 05             	shl    $0x5,%eax
    7e33:	01 d0                	add    %edx,%eax
    7e35:	01 d8                	add    %ebx,%eax
    7e37:	83 c0 24             	add    $0x24,%eax
    7e3a:	8b 50 14             	mov    0x14(%eax),%edx
    7e3d:	89 d0                	mov    %edx,%eax
    7e3f:	c1 e0 02             	shl    $0x2,%eax
    7e42:	01 d0                	add    %edx,%eax
    7e44:	c1 e0 03             	shl    $0x3,%eax
    7e47:	05 40 32 01 00       	add    $0x13240,%eax
    7e4c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7e4f:	eb 3f                	jmp    7e90 <III_hufman_decode+0x233>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    7e51:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e54:	8b 45 14             	mov    0x14(%ebp),%eax
    7e57:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7e5a:	89 c2                	mov    %eax,%edx
    7e5c:	c1 e2 03             	shl    $0x3,%edx
    7e5f:	01 c2                	add    %eax,%edx
    7e61:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7e68:	89 c2                	mov    %eax,%edx
    7e6a:	89 c8                	mov    %ecx,%eax
    7e6c:	c1 e0 02             	shl    $0x2,%eax
    7e6f:	01 c8                	add    %ecx,%eax
    7e71:	c1 e0 05             	shl    $0x5,%eax
    7e74:	01 d0                	add    %edx,%eax
    7e76:	01 d8                	add    %ebx,%eax
    7e78:	83 c0 28             	add    $0x28,%eax
    7e7b:	8b 50 14             	mov    0x14(%eax),%edx
    7e7e:	89 d0                	mov    %edx,%eax
    7e80:	c1 e0 02             	shl    $0x2,%eax
    7e83:	01 d0                	add    %edx,%eax
    7e85:	c1 e0 03             	shl    $0x3,%eax
    7e88:	05 40 32 01 00       	add    $0x13240,%eax
    7e8d:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    7e90:	83 ec 0c             	sub    $0xc,%esp
    7e93:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7e96:	50                   	push   %eax
    7e97:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7e9a:	50                   	push   %eax
    7e9b:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7e9e:	50                   	push   %eax
    7e9f:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    7ea2:	50                   	push   %eax
    7ea3:	ff 75 e0             	pushl  -0x20(%ebp)
    7ea6:	e8 d9 ee ff ff       	call   6d84 <huffman_decoder>
    7eab:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = x;
    7eae:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7eb1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7eb6:	89 c8                	mov    %ecx,%eax
    7eb8:	f7 ea                	imul   %edx
    7eba:	c1 fa 02             	sar    $0x2,%edx
    7ebd:	89 c8                	mov    %ecx,%eax
    7ebf:	c1 f8 1f             	sar    $0x1f,%eax
    7ec2:	29 c2                	sub    %eax,%edx
    7ec4:	89 d0                	mov    %edx,%eax
    7ec6:	89 c2                	mov    %eax,%edx
    7ec8:	89 d0                	mov    %edx,%eax
    7eca:	c1 e0 03             	shl    $0x3,%eax
    7ecd:	01 d0                	add    %edx,%eax
    7ecf:	c1 e0 03             	shl    $0x3,%eax
    7ed2:	89 c2                	mov    %eax,%edx
    7ed4:	8b 45 08             	mov    0x8(%ebp),%eax
    7ed7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7eda:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7edd:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7ee2:	89 c8                	mov    %ecx,%eax
    7ee4:	f7 ea                	imul   %edx
    7ee6:	c1 fa 02             	sar    $0x2,%edx
    7ee9:	89 c8                	mov    %ecx,%eax
    7eeb:	c1 f8 1f             	sar    $0x1f,%eax
    7eee:	29 c2                	sub    %eax,%edx
    7ef0:	89 d0                	mov    %edx,%eax
    7ef2:	c1 e0 03             	shl    $0x3,%eax
    7ef5:	01 d0                	add    %edx,%eax
    7ef7:	01 c0                	add    %eax,%eax
    7ef9:	29 c1                	sub    %eax,%ecx
    7efb:	89 ca                	mov    %ecx,%edx
    7efd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7f00:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    7f03:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7f06:	8d 48 01             	lea    0x1(%eax),%ecx
    7f09:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7f0e:	89 c8                	mov    %ecx,%eax
    7f10:	f7 ea                	imul   %edx
    7f12:	c1 fa 02             	sar    $0x2,%edx
    7f15:	89 c8                	mov    %ecx,%eax
    7f17:	c1 f8 1f             	sar    $0x1f,%eax
    7f1a:	29 c2                	sub    %eax,%edx
    7f1c:	89 d0                	mov    %edx,%eax
    7f1e:	89 c2                	mov    %eax,%edx
    7f20:	89 d0                	mov    %edx,%eax
    7f22:	c1 e0 03             	shl    $0x3,%eax
    7f25:	01 d0                	add    %edx,%eax
    7f27:	c1 e0 03             	shl    $0x3,%eax
    7f2a:	89 c2                	mov    %eax,%edx
    7f2c:	8b 45 08             	mov    0x8(%ebp),%eax
    7f2f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7f32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7f35:	8d 48 01             	lea    0x1(%eax),%ecx
    7f38:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7f3d:	89 c8                	mov    %ecx,%eax
    7f3f:	f7 ea                	imul   %edx
    7f41:	c1 fa 02             	sar    $0x2,%edx
    7f44:	89 c8                	mov    %ecx,%eax
    7f46:	c1 f8 1f             	sar    $0x1f,%eax
    7f49:	29 c2                	sub    %eax,%edx
    7f4b:	89 d0                	mov    %edx,%eax
    7f4d:	c1 e0 03             	shl    $0x3,%eax
    7f50:	01 d0                	add    %edx,%eax
    7f52:	01 c0                	add    %eax,%eax
    7f54:	29 c1                	sub    %eax,%ecx
    7f56:	89 ca                	mov    %ecx,%edx
    7f58:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7f5b:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7f5e:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    7f62:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    7f65:	8b 75 0c             	mov    0xc(%ebp),%esi
    7f68:	8b 45 14             	mov    0x14(%ebp),%eax
    7f6b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7f6e:	89 c2                	mov    %eax,%edx
    7f70:	c1 e2 03             	shl    $0x3,%edx
    7f73:	01 c2                	add    %eax,%edx
    7f75:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7f7c:	89 c2                	mov    %eax,%edx
    7f7e:	89 c8                	mov    %ecx,%eax
    7f80:	c1 e0 02             	shl    $0x2,%eax
    7f83:	01 c8                	add    %ecx,%eax
    7f85:	c1 e0 05             	shl    $0x5,%eax
    7f88:	01 d0                	add    %edx,%eax
    7f8a:	01 f0                	add    %esi,%eax
    7f8c:	83 c0 10             	add    $0x10,%eax
    7f8f:	8b 40 0c             	mov    0xc(%eax),%eax
    7f92:	01 c0                	add    %eax,%eax
    7f94:	39 c3                	cmp    %eax,%ebx
    7f96:	0f 82 20 fe ff ff    	jb     7dbc <III_hufman_decode+0x15f>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    7f9c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7f9f:	8b 45 14             	mov    0x14(%ebp),%eax
    7fa2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7fa5:	89 c2                	mov    %eax,%edx
    7fa7:	c1 e2 03             	shl    $0x3,%edx
    7faa:	01 c2                	add    %eax,%edx
    7fac:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7fb3:	89 c2                	mov    %eax,%edx
    7fb5:	89 c8                	mov    %ecx,%eax
    7fb7:	c1 e0 02             	shl    $0x2,%eax
    7fba:	01 c8                	add    %ecx,%eax
    7fbc:	c1 e0 05             	shl    $0x5,%eax
    7fbf:	01 d0                	add    %edx,%eax
    7fc1:	01 d8                	add    %ebx,%eax
    7fc3:	83 c0 50             	add    $0x50,%eax
    7fc6:	8b 40 0c             	mov    0xc(%eax),%eax
    7fc9:	8d 50 20             	lea    0x20(%eax),%edx
    7fcc:	89 d0                	mov    %edx,%eax
    7fce:	c1 e0 02             	shl    $0x2,%eax
    7fd1:	01 d0                	add    %edx,%eax
    7fd3:	c1 e0 03             	shl    $0x3,%eax
    7fd6:	05 40 32 01 00       	add    $0x13240,%eax
    7fdb:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    7fde:	e9 88 01 00 00       	jmp    816b <III_hufman_decode+0x50e>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    7fe3:	83 ec 0c             	sub    $0xc,%esp
    7fe6:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7fe9:	50                   	push   %eax
    7fea:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7fed:	50                   	push   %eax
    7fee:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7ff1:	50                   	push   %eax
    7ff2:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    7ff5:	50                   	push   %eax
    7ff6:	ff 75 e0             	pushl  -0x20(%ebp)
    7ff9:	e8 86 ed ff ff       	call   6d84 <huffman_decoder>
    7ffe:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = v;
    8001:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8004:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8009:	89 c8                	mov    %ecx,%eax
    800b:	f7 ea                	imul   %edx
    800d:	c1 fa 02             	sar    $0x2,%edx
    8010:	89 c8                	mov    %ecx,%eax
    8012:	c1 f8 1f             	sar    $0x1f,%eax
    8015:	29 c2                	sub    %eax,%edx
    8017:	89 d0                	mov    %edx,%eax
    8019:	89 c2                	mov    %eax,%edx
    801b:	89 d0                	mov    %edx,%eax
    801d:	c1 e0 03             	shl    $0x3,%eax
    8020:	01 d0                	add    %edx,%eax
    8022:	c1 e0 03             	shl    $0x3,%eax
    8025:	89 c2                	mov    %eax,%edx
    8027:	8b 45 08             	mov    0x8(%ebp),%eax
    802a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    802d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8030:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8035:	89 c8                	mov    %ecx,%eax
    8037:	f7 ea                	imul   %edx
    8039:	c1 fa 02             	sar    $0x2,%edx
    803c:	89 c8                	mov    %ecx,%eax
    803e:	c1 f8 1f             	sar    $0x1f,%eax
    8041:	29 c2                	sub    %eax,%edx
    8043:	89 d0                	mov    %edx,%eax
    8045:	c1 e0 03             	shl    $0x3,%eax
    8048:	01 d0                	add    %edx,%eax
    804a:	01 c0                	add    %eax,%eax
    804c:	29 c1                	sub    %eax,%ecx
    804e:	89 ca                	mov    %ecx,%edx
    8050:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8053:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    8056:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8059:	8d 48 01             	lea    0x1(%eax),%ecx
    805c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8061:	89 c8                	mov    %ecx,%eax
    8063:	f7 ea                	imul   %edx
    8065:	c1 fa 02             	sar    $0x2,%edx
    8068:	89 c8                	mov    %ecx,%eax
    806a:	c1 f8 1f             	sar    $0x1f,%eax
    806d:	29 c2                	sub    %eax,%edx
    806f:	89 d0                	mov    %edx,%eax
    8071:	89 c2                	mov    %eax,%edx
    8073:	89 d0                	mov    %edx,%eax
    8075:	c1 e0 03             	shl    $0x3,%eax
    8078:	01 d0                	add    %edx,%eax
    807a:	c1 e0 03             	shl    $0x3,%eax
    807d:	89 c2                	mov    %eax,%edx
    807f:	8b 45 08             	mov    0x8(%ebp),%eax
    8082:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8085:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8088:	8d 48 01             	lea    0x1(%eax),%ecx
    808b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8090:	89 c8                	mov    %ecx,%eax
    8092:	f7 ea                	imul   %edx
    8094:	c1 fa 02             	sar    $0x2,%edx
    8097:	89 c8                	mov    %ecx,%eax
    8099:	c1 f8 1f             	sar    $0x1f,%eax
    809c:	29 c2                	sub    %eax,%edx
    809e:	89 d0                	mov    %edx,%eax
    80a0:	c1 e0 03             	shl    $0x3,%eax
    80a3:	01 d0                	add    %edx,%eax
    80a5:	01 c0                	add    %eax,%eax
    80a7:	29 c1                	sub    %eax,%ecx
    80a9:	89 ca                	mov    %ecx,%edx
    80ab:	8b 45 c8             	mov    -0x38(%ebp),%eax
    80ae:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    80b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    80b4:	8d 48 02             	lea    0x2(%eax),%ecx
    80b7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    80bc:	89 c8                	mov    %ecx,%eax
    80be:	f7 ea                	imul   %edx
    80c0:	c1 fa 02             	sar    $0x2,%edx
    80c3:	89 c8                	mov    %ecx,%eax
    80c5:	c1 f8 1f             	sar    $0x1f,%eax
    80c8:	29 c2                	sub    %eax,%edx
    80ca:	89 d0                	mov    %edx,%eax
    80cc:	89 c2                	mov    %eax,%edx
    80ce:	89 d0                	mov    %edx,%eax
    80d0:	c1 e0 03             	shl    $0x3,%eax
    80d3:	01 d0                	add    %edx,%eax
    80d5:	c1 e0 03             	shl    $0x3,%eax
    80d8:	89 c2                	mov    %eax,%edx
    80da:	8b 45 08             	mov    0x8(%ebp),%eax
    80dd:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    80e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    80e3:	8d 48 02             	lea    0x2(%eax),%ecx
    80e6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    80eb:	89 c8                	mov    %ecx,%eax
    80ed:	f7 ea                	imul   %edx
    80ef:	c1 fa 02             	sar    $0x2,%edx
    80f2:	89 c8                	mov    %ecx,%eax
    80f4:	c1 f8 1f             	sar    $0x1f,%eax
    80f7:	29 c2                	sub    %eax,%edx
    80f9:	89 d0                	mov    %edx,%eax
    80fb:	c1 e0 03             	shl    $0x3,%eax
    80fe:	01 d0                	add    %edx,%eax
    8100:	01 c0                	add    %eax,%eax
    8102:	29 c1                	sub    %eax,%ecx
    8104:	89 ca                	mov    %ecx,%edx
    8106:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8109:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    810c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    810f:	8d 48 03             	lea    0x3(%eax),%ecx
    8112:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8117:	89 c8                	mov    %ecx,%eax
    8119:	f7 ea                	imul   %edx
    811b:	c1 fa 02             	sar    $0x2,%edx
    811e:	89 c8                	mov    %ecx,%eax
    8120:	c1 f8 1f             	sar    $0x1f,%eax
    8123:	29 c2                	sub    %eax,%edx
    8125:	89 d0                	mov    %edx,%eax
    8127:	89 c2                	mov    %eax,%edx
    8129:	89 d0                	mov    %edx,%eax
    812b:	c1 e0 03             	shl    $0x3,%eax
    812e:	01 d0                	add    %edx,%eax
    8130:	c1 e0 03             	shl    $0x3,%eax
    8133:	89 c2                	mov    %eax,%edx
    8135:	8b 45 08             	mov    0x8(%ebp),%eax
    8138:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    813b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    813e:	8d 48 03             	lea    0x3(%eax),%ecx
    8141:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8146:	89 c8                	mov    %ecx,%eax
    8148:	f7 ea                	imul   %edx
    814a:	c1 fa 02             	sar    $0x2,%edx
    814d:	89 c8                	mov    %ecx,%eax
    814f:	c1 f8 1f             	sar    $0x1f,%eax
    8152:	29 c2                	sub    %eax,%edx
    8154:	89 d0                	mov    %edx,%eax
    8156:	c1 e0 03             	shl    $0x3,%eax
    8159:	01 d0                	add    %edx,%eax
    815b:	01 c0                	add    %eax,%eax
    815d:	29 c1                	sub    %eax,%ecx
    815f:	89 ca                	mov    %ecx,%edx
    8161:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8164:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    8167:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    816b:	e8 e8 d3 ff ff       	call   5558 <hsstell>
    8170:	89 c6                	mov    %eax,%esi
    8172:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8175:	8b 45 14             	mov    0x14(%ebp),%eax
    8178:	8b 4d 10             	mov    0x10(%ebp),%ecx
    817b:	89 c2                	mov    %eax,%edx
    817d:	c1 e2 03             	shl    $0x3,%edx
    8180:	01 c2                	add    %eax,%edx
    8182:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8189:	89 c2                	mov    %eax,%edx
    818b:	89 c8                	mov    %ecx,%eax
    818d:	c1 e0 02             	shl    $0x2,%eax
    8190:	01 c8                	add    %ecx,%eax
    8192:	c1 e0 05             	shl    $0x5,%eax
    8195:	01 d0                	add    %edx,%eax
    8197:	01 d8                	add    %ebx,%eax
    8199:	83 c0 10             	add    $0x10,%eax
    819c:	8b 50 08             	mov    0x8(%eax),%edx
    819f:	8b 45 18             	mov    0x18(%ebp),%eax
    81a2:	01 d0                	add    %edx,%eax
    81a4:	39 c6                	cmp    %eax,%esi
    81a6:	73 0d                	jae    81b5 <III_hufman_decode+0x558>
    81a8:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    81af:	0f 8e 2e fe ff ff    	jle    7fe3 <III_hufman_decode+0x386>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    81b5:	e8 9e d3 ff ff       	call   5558 <hsstell>
    81ba:	89 c6                	mov    %eax,%esi
    81bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    81bf:	8b 45 14             	mov    0x14(%ebp),%eax
    81c2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    81c5:	89 c2                	mov    %eax,%edx
    81c7:	c1 e2 03             	shl    $0x3,%edx
    81ca:	01 c2                	add    %eax,%edx
    81cc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    81d3:	89 c2                	mov    %eax,%edx
    81d5:	89 c8                	mov    %ecx,%eax
    81d7:	c1 e0 02             	shl    $0x2,%eax
    81da:	01 c8                	add    %ecx,%eax
    81dc:	c1 e0 05             	shl    $0x5,%eax
    81df:	01 d0                	add    %edx,%eax
    81e1:	01 d8                	add    %ebx,%eax
    81e3:	83 c0 10             	add    $0x10,%eax
    81e6:	8b 50 08             	mov    0x8(%eax),%edx
    81e9:	8b 45 18             	mov    0x18(%ebp),%eax
    81ec:	01 d0                	add    %edx,%eax
    81ee:	39 c6                	cmp    %eax,%esi
    81f0:	76 4f                	jbe    8241 <III_hufman_decode+0x5e4>
   {  i -=4;
    81f2:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    81f6:	e8 5d d3 ff ff       	call   5558 <hsstell>
    81fb:	89 c2                	mov    %eax,%edx
    81fd:	8b 45 18             	mov    0x18(%ebp),%eax
    8200:	89 d6                	mov    %edx,%esi
    8202:	29 c6                	sub    %eax,%esi
    8204:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8207:	8b 45 14             	mov    0x14(%ebp),%eax
    820a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    820d:	89 c2                	mov    %eax,%edx
    820f:	c1 e2 03             	shl    $0x3,%edx
    8212:	01 c2                	add    %eax,%edx
    8214:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    821b:	89 c2                	mov    %eax,%edx
    821d:	89 c8                	mov    %ecx,%eax
    821f:	c1 e0 02             	shl    $0x2,%eax
    8222:	01 c8                	add    %ecx,%eax
    8224:	c1 e0 05             	shl    $0x5,%eax
    8227:	01 d0                	add    %edx,%eax
    8229:	01 d8                	add    %ebx,%eax
    822b:	83 c0 10             	add    $0x10,%eax
    822e:	8b 40 08             	mov    0x8(%eax),%eax
    8231:	29 c6                	sub    %eax,%esi
    8233:	89 f0                	mov    %esi,%eax
    8235:	83 ec 0c             	sub    $0xc,%esp
    8238:	50                   	push   %eax
    8239:	e8 5e d3 ff ff       	call   559c <rewindNbits>
    823e:	83 c4 10             	add    $0x10,%esp
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    8241:	e8 12 d3 ff ff       	call   5558 <hsstell>
    8246:	89 c6                	mov    %eax,%esi
    8248:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    824b:	8b 45 14             	mov    0x14(%ebp),%eax
    824e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8251:	89 c2                	mov    %eax,%edx
    8253:	c1 e2 03             	shl    $0x3,%edx
    8256:	01 c2                	add    %eax,%edx
    8258:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    825f:	89 c2                	mov    %eax,%edx
    8261:	89 c8                	mov    %ecx,%eax
    8263:	c1 e0 02             	shl    $0x2,%eax
    8266:	01 c8                	add    %ecx,%eax
    8268:	c1 e0 05             	shl    $0x5,%eax
    826b:	01 d0                	add    %edx,%eax
    826d:	01 d8                	add    %ebx,%eax
    826f:	83 c0 10             	add    $0x10,%eax
    8272:	8b 50 08             	mov    0x8(%eax),%edx
    8275:	8b 45 18             	mov    0x18(%ebp),%eax
    8278:	01 d0                	add    %edx,%eax
    827a:	39 c6                	cmp    %eax,%esi
    827c:	73 48                	jae    82c6 <III_hufman_decode+0x669>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    827e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8281:	8b 45 14             	mov    0x14(%ebp),%eax
    8284:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8287:	89 c2                	mov    %eax,%edx
    8289:	c1 e2 03             	shl    $0x3,%edx
    828c:	01 c2                	add    %eax,%edx
    828e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8295:	89 c2                	mov    %eax,%edx
    8297:	89 c8                	mov    %ecx,%eax
    8299:	c1 e0 02             	shl    $0x2,%eax
    829c:	01 c8                	add    %ecx,%eax
    829e:	c1 e0 05             	shl    $0x5,%eax
    82a1:	01 d0                	add    %edx,%eax
    82a3:	01 d8                	add    %ebx,%eax
    82a5:	83 c0 10             	add    $0x10,%eax
    82a8:	8b 50 08             	mov    0x8(%eax),%edx
    82ab:	8b 45 18             	mov    0x18(%ebp),%eax
    82ae:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    82b1:	e8 a2 d2 ff ff       	call   5558 <hsstell>
    82b6:	29 c3                	sub    %eax,%ebx
    82b8:	89 d8                	mov    %ebx,%eax
    82ba:	83 ec 0c             	sub    $0xc,%esp
    82bd:	50                   	push   %eax
    82be:	e8 ac d2 ff ff       	call   556f <hgetbits>
    82c3:	83 c4 10             	add    $0x10,%esp

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    82c6:	eb 5a                	jmp    8322 <III_hufman_decode+0x6c5>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    82c8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    82cb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    82d0:	89 c8                	mov    %ecx,%eax
    82d2:	f7 ea                	imul   %edx
    82d4:	c1 fa 02             	sar    $0x2,%edx
    82d7:	89 c8                	mov    %ecx,%eax
    82d9:	c1 f8 1f             	sar    $0x1f,%eax
    82dc:	29 c2                	sub    %eax,%edx
    82de:	89 d0                	mov    %edx,%eax
    82e0:	89 c2                	mov    %eax,%edx
    82e2:	89 d0                	mov    %edx,%eax
    82e4:	c1 e0 03             	shl    $0x3,%eax
    82e7:	01 d0                	add    %edx,%eax
    82e9:	c1 e0 03             	shl    $0x3,%eax
    82ec:	89 c2                	mov    %eax,%edx
    82ee:	8b 45 08             	mov    0x8(%ebp),%eax
    82f1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    82f4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    82f7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    82fc:	89 c8                	mov    %ecx,%eax
    82fe:	f7 ea                	imul   %edx
    8300:	c1 fa 02             	sar    $0x2,%edx
    8303:	89 c8                	mov    %ecx,%eax
    8305:	c1 f8 1f             	sar    $0x1f,%eax
    8308:	29 c2                	sub    %eax,%edx
    830a:	89 d0                	mov    %edx,%eax
    830c:	c1 e0 03             	shl    $0x3,%eax
    830f:	01 d0                	add    %edx,%eax
    8311:	01 c0                	add    %eax,%eax
    8313:	29 c1                	sub    %eax,%ecx
    8315:	89 ca                	mov    %ecx,%edx
    8317:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    831e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    8322:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8329:	7e 9d                	jle    82c8 <III_hufman_decode+0x66b>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    832b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    832e:	5b                   	pop    %ebx
    832f:	5e                   	pop    %esi
    8330:	5f                   	pop    %edi
    8331:	5d                   	pop    %ebp
    8332:	c3                   	ret    

00008333 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    8333:	55                   	push   %ebp
    8334:	89 e5                	mov    %esp,%ebp
    8336:	53                   	push   %ebx
    8337:	83 ec 34             	sub    $0x34,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    833a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8341:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8344:	8b 00                	mov    (%eax),%eax
    8346:	8b 40 10             	mov    0x10(%eax),%eax
    8349:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    834c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    8353:	8b 45 14             	mov    0x14(%ebp),%eax
    8356:	8b 40 10             	mov    0x10(%eax),%eax
    8359:	85 c0                	test   %eax,%eax
    835b:	74 6a                	je     83c7 <III_dequantize_sample+0x94>
    835d:	8b 45 14             	mov    0x14(%ebp),%eax
    8360:	8b 40 14             	mov    0x14(%eax),%eax
    8363:	83 f8 02             	cmp    $0x2,%eax
    8366:	75 5f                	jne    83c7 <III_dequantize_sample+0x94>
		if (gr_info->mixed_block_flag)
    8368:	8b 45 14             	mov    0x14(%ebp),%eax
    836b:	8b 40 18             	mov    0x18(%eax),%eax
    836e:	85 c0                	test   %eax,%eax
    8370:	74 18                	je     838a <III_dequantize_sample+0x57>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    8372:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8375:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    837b:	83 c0 04             	add    $0x4,%eax
    837e:	05 00 f5 00 00       	add    $0xf500,%eax
    8383:	8b 00                	mov    (%eax),%eax
    8385:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    8388:	eb 53                	jmp    83dd <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    838a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    838d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8393:	83 c0 54             	add    $0x54,%eax
    8396:	05 00 f5 00 00       	add    $0xf500,%eax
    839b:	8b 50 0c             	mov    0xc(%eax),%edx
    839e:	89 d0                	mov    %edx,%eax
    83a0:	01 c0                	add    %eax,%eax
    83a2:	01 d0                	add    %edx,%eax
    83a4:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    83a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    83aa:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    83b0:	83 c0 54             	add    $0x54,%eax
    83b3:	05 00 f5 00 00       	add    $0xf500,%eax
    83b8:	8b 40 0c             	mov    0xc(%eax),%eax
    83bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    83be:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    83c5:	eb 16                	jmp    83dd <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    83c7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    83ca:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    83d0:	83 c0 04             	add    $0x4,%eax
    83d3:	05 00 f5 00 00       	add    $0xf500,%eax
    83d8:	8b 00                	mov    (%eax),%eax
    83da:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    83dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    83e4:	e9 8a 06 00 00       	jmp    8a73 <III_dequantize_sample+0x740>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    83e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    83f0:	e9 70 06 00 00       	jmp    8a65 <III_dequantize_sample+0x732>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    83f5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    83f8:	89 d0                	mov    %edx,%eax
    83fa:	c1 e0 03             	shl    $0x3,%eax
    83fd:	01 d0                	add    %edx,%eax
    83ff:	01 c0                	add    %eax,%eax
    8401:	89 c2                	mov    %eax,%edx
    8403:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8406:	01 d0                	add    %edx,%eax
    8408:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    840b:	0f 85 a7 02 00 00    	jne    86b8 <III_dequantize_sample+0x385>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8411:	8b 45 14             	mov    0x14(%ebp),%eax
    8414:	8b 40 10             	mov    0x10(%eax),%eax
    8417:	85 c0                	test   %eax,%eax
    8419:	0f 84 74 02 00 00    	je     8693 <III_dequantize_sample+0x360>
    841f:	8b 45 14             	mov    0x14(%ebp),%eax
    8422:	8b 40 14             	mov    0x14(%eax),%eax
    8425:	83 f8 02             	cmp    $0x2,%eax
    8428:	0f 85 65 02 00 00    	jne    8693 <III_dequantize_sample+0x360>
					if (gr_info->mixed_block_flag) {
    842e:	8b 45 14             	mov    0x14(%ebp),%eax
    8431:	8b 40 18             	mov    0x18(%eax),%eax
    8434:	85 c0                	test   %eax,%eax
    8436:	0f 84 b8 01 00 00    	je     85f4 <III_dequantize_sample+0x2c1>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    843c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    843f:	89 d0                	mov    %edx,%eax
    8441:	c1 e0 03             	shl    $0x3,%eax
    8444:	01 d0                	add    %edx,%eax
    8446:	01 c0                	add    %eax,%eax
    8448:	89 c2                	mov    %eax,%edx
    844a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    844d:	01 c2                	add    %eax,%edx
    844f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8452:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8458:	83 c0 20             	add    $0x20,%eax
    845b:	05 00 f5 00 00       	add    $0xf500,%eax
    8460:	8b 00                	mov    (%eax),%eax
    8462:	39 c2                	cmp    %eax,%edx
    8464:	0f 85 96 00 00 00    	jne    8500 <III_dequantize_sample+0x1cd>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    846a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    846d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8473:	83 c0 60             	add    $0x60,%eax
    8476:	05 00 f5 00 00       	add    $0xf500,%eax
    847b:	8b 50 0c             	mov    0xc(%eax),%edx
    847e:	89 d0                	mov    %edx,%eax
    8480:	01 c0                	add    %eax,%eax
    8482:	01 d0                	add    %edx,%eax
    8484:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    8487:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    848e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8491:	8d 48 01             	lea    0x1(%eax),%ecx
    8494:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8497:	89 d0                	mov    %edx,%eax
    8499:	c1 e0 03             	shl    $0x3,%eax
    849c:	01 d0                	add    %edx,%eax
    849e:	c1 e0 02             	shl    $0x2,%eax
    84a1:	01 d0                	add    %edx,%eax
    84a3:	01 c8                	add    %ecx,%eax
    84a5:	83 c0 14             	add    $0x14,%eax
    84a8:	8b 0c 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    84af:	8b 55 dc             	mov    -0x24(%ebp),%edx
    84b2:	89 d0                	mov    %edx,%eax
    84b4:	c1 e0 03             	shl    $0x3,%eax
    84b7:	01 d0                	add    %edx,%eax
    84b9:	c1 e0 02             	shl    $0x2,%eax
    84bc:	01 d0                	add    %edx,%eax
    84be:	8b 55 ec             	mov    -0x14(%ebp),%edx
    84c1:	01 d0                	add    %edx,%eax
    84c3:	83 c0 14             	add    $0x14,%eax
    84c6:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    84cd:	29 c1                	sub    %eax,%ecx
    84cf:	89 c8                	mov    %ecx,%eax
    84d1:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    84d4:	8b 55 dc             	mov    -0x24(%ebp),%edx
    84d7:	89 d0                	mov    %edx,%eax
    84d9:	c1 e0 03             	shl    $0x3,%eax
    84dc:	01 d0                	add    %edx,%eax
    84de:	c1 e0 02             	shl    $0x2,%eax
    84e1:	01 d0                	add    %edx,%eax
    84e3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    84e6:	01 d0                	add    %edx,%eax
    84e8:	83 c0 14             	add    $0x14,%eax
    84eb:	8b 14 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%edx
    84f2:	89 d0                	mov    %edx,%eax
    84f4:	01 c0                	add    %eax,%eax
    84f6:	01 d0                	add    %edx,%eax
    84f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    84fb:	e9 91 01 00 00       	jmp    8691 <III_dequantize_sample+0x35e>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    8500:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8503:	89 d0                	mov    %edx,%eax
    8505:	c1 e0 03             	shl    $0x3,%eax
    8508:	01 d0                	add    %edx,%eax
    850a:	01 c0                	add    %eax,%eax
    850c:	89 c2                	mov    %eax,%edx
    850e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8511:	01 c2                	add    %eax,%edx
    8513:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8516:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    851c:	83 c0 20             	add    $0x20,%eax
    851f:	05 00 f5 00 00       	add    $0xf500,%eax
    8524:	8b 00                	mov    (%eax),%eax
    8526:	39 c2                	cmp    %eax,%edx
    8528:	7d 2a                	jge    8554 <III_dequantize_sample+0x221>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    852a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    852e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8531:	8d 48 01             	lea    0x1(%eax),%ecx
    8534:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8537:	89 d0                	mov    %edx,%eax
    8539:	c1 e0 03             	shl    $0x3,%eax
    853c:	01 d0                	add    %edx,%eax
    853e:	c1 e0 02             	shl    $0x2,%eax
    8541:	01 d0                	add    %edx,%eax
    8543:	01 c8                	add    %ecx,%eax
    8545:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    854c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    854f:	e9 3d 01 00 00       	jmp    8691 <III_dequantize_sample+0x35e>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8554:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8558:	8b 45 ec             	mov    -0x14(%ebp),%eax
    855b:	8d 48 01             	lea    0x1(%eax),%ecx
    855e:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8561:	89 d0                	mov    %edx,%eax
    8563:	c1 e0 03             	shl    $0x3,%eax
    8566:	01 d0                	add    %edx,%eax
    8568:	c1 e0 02             	shl    $0x2,%eax
    856b:	01 d0                	add    %edx,%eax
    856d:	01 c8                	add    %ecx,%eax
    856f:	83 c0 14             	add    $0x14,%eax
    8572:	8b 14 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%edx
    8579:	89 d0                	mov    %edx,%eax
    857b:	01 c0                	add    %eax,%eax
    857d:	01 d0                	add    %edx,%eax
    857f:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8582:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8585:	8d 48 01             	lea    0x1(%eax),%ecx
    8588:	8b 55 dc             	mov    -0x24(%ebp),%edx
    858b:	89 d0                	mov    %edx,%eax
    858d:	c1 e0 03             	shl    $0x3,%eax
    8590:	01 d0                	add    %edx,%eax
    8592:	c1 e0 02             	shl    $0x2,%eax
    8595:	01 d0                	add    %edx,%eax
    8597:	01 c8                	add    %ecx,%eax
    8599:	83 c0 14             	add    $0x14,%eax
    859c:	8b 0c 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    85a3:	8b 55 dc             	mov    -0x24(%ebp),%edx
    85a6:	89 d0                	mov    %edx,%eax
    85a8:	c1 e0 03             	shl    $0x3,%eax
    85ab:	01 d0                	add    %edx,%eax
    85ad:	c1 e0 02             	shl    $0x2,%eax
    85b0:	01 d0                	add    %edx,%eax
    85b2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    85b5:	01 d0                	add    %edx,%eax
    85b7:	83 c0 14             	add    $0x14,%eax
    85ba:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    85c1:	29 c1                	sub    %eax,%ecx
    85c3:	89 c8                	mov    %ecx,%eax
    85c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    85c8:	8b 55 dc             	mov    -0x24(%ebp),%edx
    85cb:	89 d0                	mov    %edx,%eax
    85cd:	c1 e0 03             	shl    $0x3,%eax
    85d0:	01 d0                	add    %edx,%eax
    85d2:	c1 e0 02             	shl    $0x2,%eax
    85d5:	01 d0                	add    %edx,%eax
    85d7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    85da:	01 d0                	add    %edx,%eax
    85dc:	83 c0 14             	add    $0x14,%eax
    85df:	8b 14 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%edx
    85e6:	89 d0                	mov    %edx,%eax
    85e8:	01 c0                	add    %eax,%eax
    85ea:	01 d0                	add    %edx,%eax
    85ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    85ef:	e9 c4 00 00 00       	jmp    86b8 <III_dequantize_sample+0x385>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    85f4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    85f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    85fb:	8d 48 01             	lea    0x1(%eax),%ecx
    85fe:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8601:	89 d0                	mov    %edx,%eax
    8603:	c1 e0 03             	shl    $0x3,%eax
    8606:	01 d0                	add    %edx,%eax
    8608:	c1 e0 02             	shl    $0x2,%eax
    860b:	01 d0                	add    %edx,%eax
    860d:	01 c8                	add    %ecx,%eax
    860f:	83 c0 14             	add    $0x14,%eax
    8612:	8b 14 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%edx
    8619:	89 d0                	mov    %edx,%eax
    861b:	01 c0                	add    %eax,%eax
    861d:	01 d0                	add    %edx,%eax
    861f:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8622:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8625:	8d 48 01             	lea    0x1(%eax),%ecx
    8628:	8b 55 dc             	mov    -0x24(%ebp),%edx
    862b:	89 d0                	mov    %edx,%eax
    862d:	c1 e0 03             	shl    $0x3,%eax
    8630:	01 d0                	add    %edx,%eax
    8632:	c1 e0 02             	shl    $0x2,%eax
    8635:	01 d0                	add    %edx,%eax
    8637:	01 c8                	add    %ecx,%eax
    8639:	83 c0 14             	add    $0x14,%eax
    863c:	8b 0c 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    8643:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8646:	89 d0                	mov    %edx,%eax
    8648:	c1 e0 03             	shl    $0x3,%eax
    864b:	01 d0                	add    %edx,%eax
    864d:	c1 e0 02             	shl    $0x2,%eax
    8650:	01 d0                	add    %edx,%eax
    8652:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8655:	01 d0                	add    %edx,%eax
    8657:	83 c0 14             	add    $0x14,%eax
    865a:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8661:	29 c1                	sub    %eax,%ecx
    8663:	89 c8                	mov    %ecx,%eax
    8665:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8668:	8b 55 dc             	mov    -0x24(%ebp),%edx
    866b:	89 d0                	mov    %edx,%eax
    866d:	c1 e0 03             	shl    $0x3,%eax
    8670:	01 d0                	add    %edx,%eax
    8672:	c1 e0 02             	shl    $0x2,%eax
    8675:	01 d0                	add    %edx,%eax
    8677:	8b 55 ec             	mov    -0x14(%ebp),%edx
    867a:	01 d0                	add    %edx,%eax
    867c:	83 c0 14             	add    $0x14,%eax
    867f:	8b 14 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%edx
    8686:	89 d0                	mov    %edx,%eax
    8688:	01 c0                	add    %eax,%eax
    868a:	01 d0                	add    %edx,%eax
    868c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    868f:	eb 27                	jmp    86b8 <III_dequantize_sample+0x385>
    8691:	eb 25                	jmp    86b8 <III_dequantize_sample+0x385>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    8693:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8697:	8b 45 ec             	mov    -0x14(%ebp),%eax
    869a:	8d 48 01             	lea    0x1(%eax),%ecx
    869d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    86a0:	89 d0                	mov    %edx,%eax
    86a2:	c1 e0 03             	shl    $0x3,%eax
    86a5:	01 d0                	add    %edx,%eax
    86a7:	c1 e0 02             	shl    $0x2,%eax
    86aa:	01 d0                	add    %edx,%eax
    86ac:	01 c8                	add    %ecx,%eax
    86ae:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    86b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    86b8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86bb:	89 d0                	mov    %edx,%eax
    86bd:	c1 e0 03             	shl    $0x3,%eax
    86c0:	01 d0                	add    %edx,%eax
    86c2:	c1 e0 04             	shl    $0x4,%eax
    86c5:	89 c2                	mov    %eax,%edx
    86c7:	8b 45 0c             	mov    0xc(%ebp),%eax
    86ca:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    86cd:	8b 45 14             	mov    0x14(%ebp),%eax
    86d0:	8b 40 08             	mov    0x8(%eax),%eax
    86d3:	89 45 c8             	mov    %eax,-0x38(%ebp)
    86d6:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    86dd:	df 6d c8             	fildll -0x38(%ebp)
    86e0:	dd 5d d0             	fstpl  -0x30(%ebp)
    86e3:	dd 45 d0             	fldl   -0x30(%ebp)
    86e6:	dd 05 50 d9 00 00    	fldl   0xd950
    86ec:	de e9                	fsubrp %st,%st(1)
    86ee:	dd 05 58 d9 00 00    	fldl   0xd958
    86f4:	de c9                	fmulp  %st,%st(1)
    86f6:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    86fa:	dd 1c 24             	fstpl  (%esp)
    86fd:	dd 05 60 d9 00 00    	fldl   0xd960
    8703:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8707:	dd 1c 24             	fstpl  (%esp)
    870a:	e8 96 c1 ff ff       	call   48a5 <pow>
    870f:	83 c4 10             	add    $0x10,%esp
    8712:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8715:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8718:	8b 45 14             	mov    0x14(%ebp),%eax
    871b:	8b 40 10             	mov    0x10(%eax),%eax
    871e:	85 c0                	test   %eax,%eax
    8720:	0f 84 9c 01 00 00    	je     88c2 <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8726:	8b 45 14             	mov    0x14(%ebp),%eax
    8729:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    872c:	83 f8 02             	cmp    $0x2,%eax
    872f:	75 0a                	jne    873b <III_dequantize_sample+0x408>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8731:	8b 45 14             	mov    0x14(%ebp),%eax
    8734:	8b 40 18             	mov    0x18(%eax),%eax
    8737:	85 c0                	test   %eax,%eax
    8739:	74 27                	je     8762 <III_dequantize_sample+0x42f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    873b:	8b 45 14             	mov    0x14(%ebp),%eax
    873e:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8741:	83 f8 02             	cmp    $0x2,%eax
    8744:	0f 85 78 01 00 00    	jne    88c2 <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    874a:	8b 45 14             	mov    0x14(%ebp),%eax
    874d:	8b 40 18             	mov    0x18(%eax),%eax
    8750:	85 c0                	test   %eax,%eax
    8752:	0f 84 6a 01 00 00    	je     88c2 <III_dequantize_sample+0x58f>
    8758:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    875c:	0f 8e 60 01 00 00    	jle    88c2 <III_dequantize_sample+0x58f>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    8762:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8765:	89 d0                	mov    %edx,%eax
    8767:	c1 e0 03             	shl    $0x3,%eax
    876a:	01 d0                	add    %edx,%eax
    876c:	01 c0                	add    %eax,%eax
    876e:	89 c2                	mov    %eax,%edx
    8770:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8773:	01 d0                	add    %edx,%eax
    8775:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8778:	99                   	cltd   
    8779:	f7 7d e0             	idivl  -0x20(%ebp)
    877c:	89 c2                	mov    %eax,%edx
    877e:	8b 45 14             	mov    0x14(%ebp),%eax
    8781:	83 c2 08             	add    $0x8,%edx
    8784:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    8788:	89 45 c8             	mov    %eax,-0x38(%ebp)
    878b:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8792:	df 6d c8             	fildll -0x38(%ebp)
    8795:	dd 5d d0             	fstpl  -0x30(%ebp)
    8798:	dd 45 d0             	fldl   -0x30(%ebp)
    879b:	dd 05 68 d9 00 00    	fldl   0xd968
    87a1:	de c9                	fmulp  %st,%st(1)
    87a3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    87a7:	dd 1c 24             	fstpl  (%esp)
    87aa:	dd 05 60 d9 00 00    	fldl   0xd960
    87b0:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    87b4:	dd 1c 24             	fstpl  (%esp)
    87b7:	e8 e9 c0 ff ff       	call   48a5 <pow>
    87bc:	83 c4 10             	add    $0x10,%esp
    87bf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    87c2:	89 d0                	mov    %edx,%eax
    87c4:	c1 e0 03             	shl    $0x3,%eax
    87c7:	01 d0                	add    %edx,%eax
    87c9:	c1 e0 04             	shl    $0x4,%eax
    87cc:	89 c2                	mov    %eax,%edx
    87ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    87d1:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    87d4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    87d7:	89 d0                	mov    %edx,%eax
    87d9:	c1 e0 03             	shl    $0x3,%eax
    87dc:	01 d0                	add    %edx,%eax
    87de:	c1 e0 04             	shl    $0x4,%eax
    87e1:	89 c2                	mov    %eax,%edx
    87e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    87e6:	01 c2                	add    %eax,%edx
    87e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87eb:	dd 04 c2             	fldl   (%edx,%eax,8)
    87ee:	de c9                	fmulp  %st,%st(1)
    87f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87f3:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    87f6:	8b 45 14             	mov    0x14(%ebp),%eax
    87f9:	8b 40 40             	mov    0x40(%eax),%eax
    87fc:	89 45 c8             	mov    %eax,-0x38(%ebp)
    87ff:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8806:	df 6d c8             	fildll -0x38(%ebp)
    8809:	dd 5d d0             	fstpl  -0x30(%ebp)
    880c:	dd 45 d0             	fldl   -0x30(%ebp)
    880f:	d9 e8                	fld1   
    8811:	de c1                	faddp  %st,%st(1)
    8813:	dd 05 70 d9 00 00    	fldl   0xd970
    8819:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    881b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    881e:	89 d0                	mov    %edx,%eax
    8820:	c1 e0 03             	shl    $0x3,%eax
    8823:	01 d0                	add    %edx,%eax
    8825:	01 c0                	add    %eax,%eax
    8827:	89 c2                	mov    %eax,%edx
    8829:	8b 45 f4             	mov    -0xc(%ebp),%eax
    882c:	01 d0                	add    %edx,%eax
    882e:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8831:	99                   	cltd   
    8832:	f7 7d e0             	idivl  -0x20(%ebp)
    8835:	89 c2                	mov    %eax,%edx
    8837:	8b 5d 10             	mov    0x10(%ebp),%ebx
    883a:	8b 4d 18             	mov    0x18(%ebp),%ecx
    883d:	89 d0                	mov    %edx,%eax
    883f:	01 c0                	add    %eax,%eax
    8841:	01 d0                	add    %edx,%eax
    8843:	c1 e0 02             	shl    $0x2,%eax
    8846:	01 d0                	add    %edx,%eax
    8848:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    884b:	89 d1                	mov    %edx,%ecx
    884d:	89 ca                	mov    %ecx,%edx
    884f:	c1 e2 05             	shl    $0x5,%edx
    8852:	29 ca                	sub    %ecx,%edx
    8854:	01 c2                	add    %eax,%edx
    8856:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8859:	01 d0                	add    %edx,%eax
    885b:	83 c0 14             	add    $0x14,%eax
    885e:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    8862:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8865:	db 45 c8             	fildl  -0x38(%ebp)
    8868:	de c9                	fmulp  %st,%st(1)
    886a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    886e:	dd 1c 24             	fstpl  (%esp)
    8871:	dd 05 60 d9 00 00    	fldl   0xd960
    8877:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    887b:	dd 1c 24             	fstpl  (%esp)
    887e:	e8 22 c0 ff ff       	call   48a5 <pow>
    8883:	83 c4 10             	add    $0x10,%esp
    8886:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8889:	89 d0                	mov    %edx,%eax
    888b:	c1 e0 03             	shl    $0x3,%eax
    888e:	01 d0                	add    %edx,%eax
    8890:	c1 e0 04             	shl    $0x4,%eax
    8893:	89 c2                	mov    %eax,%edx
    8895:	8b 45 0c             	mov    0xc(%ebp),%eax
    8898:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    889b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    889e:	89 d0                	mov    %edx,%eax
    88a0:	c1 e0 03             	shl    $0x3,%eax
    88a3:	01 d0                	add    %edx,%eax
    88a5:	c1 e0 04             	shl    $0x4,%eax
    88a8:	89 c2                	mov    %eax,%edx
    88aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    88ad:	01 c2                	add    %eax,%edx
    88af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88b2:	dd 04 c2             	fldl   (%edx,%eax,8)
    88b5:	de c9                	fmulp  %st,%st(1)
    88b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88ba:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    88bd:	e9 c0 00 00 00       	jmp    8982 <III_dequantize_sample+0x64f>
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    88c2:	8b 45 14             	mov    0x14(%ebp),%eax
    88c5:	8b 40 40             	mov    0x40(%eax),%eax
    88c8:	89 45 c8             	mov    %eax,-0x38(%ebp)
    88cb:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    88d2:	df 6d c8             	fildll -0x38(%ebp)
    88d5:	dd 5d d0             	fstpl  -0x30(%ebp)
    88d8:	dd 45 d0             	fldl   -0x30(%ebp)
    88db:	d9 e8                	fld1   
    88dd:	de c1                	faddp  %st,%st(1)
    88df:	dd 05 70 d9 00 00    	fldl   0xd970
    88e5:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    88e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    88ea:	8b 45 18             	mov    0x18(%ebp),%eax
    88ed:	89 c2                	mov    %eax,%edx
    88ef:	8d 04 12             	lea    (%edx,%edx,1),%eax
    88f2:	89 c2                	mov    %eax,%edx
    88f4:	89 d0                	mov    %edx,%eax
    88f6:	c1 e0 05             	shl    $0x5,%eax
    88f9:	29 d0                	sub    %edx,%eax
    88fb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    88fe:	01 d0                	add    %edx,%eax
    8900:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    8903:	89 c1                	mov    %eax,%ecx
    8905:	8b 45 14             	mov    0x14(%ebp),%eax
    8908:	8b 50 3c             	mov    0x3c(%eax),%edx
    890b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    890e:	8b 04 85 c0 f6 00 00 	mov    0xf6c0(,%eax,4),%eax
    8915:	0f af c2             	imul   %edx,%eax
    8918:	01 c8                	add    %ecx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    891a:	89 45 c8             	mov    %eax,-0x38(%ebp)
    891d:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8924:	df 6d c8             	fildll -0x38(%ebp)
    8927:	dd 5d d0             	fstpl  -0x30(%ebp)
    892a:	dd 45 d0             	fldl   -0x30(%ebp)
    892d:	de c9                	fmulp  %st,%st(1)
    892f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8933:	dd 1c 24             	fstpl  (%esp)
    8936:	dd 05 60 d9 00 00    	fldl   0xd960
    893c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8940:	dd 1c 24             	fstpl  (%esp)
    8943:	e8 5d bf ff ff       	call   48a5 <pow>
    8948:	83 c4 10             	add    $0x10,%esp
    894b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    894e:	89 d0                	mov    %edx,%eax
    8950:	c1 e0 03             	shl    $0x3,%eax
    8953:	01 d0                	add    %edx,%eax
    8955:	c1 e0 04             	shl    $0x4,%eax
    8958:	89 c2                	mov    %eax,%edx
    895a:	8b 45 0c             	mov    0xc(%ebp),%eax
    895d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8960:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8963:	89 d0                	mov    %edx,%eax
    8965:	c1 e0 03             	shl    $0x3,%eax
    8968:	01 d0                	add    %edx,%eax
    896a:	c1 e0 04             	shl    $0x4,%eax
    896d:	89 c2                	mov    %eax,%edx
    896f:	8b 45 0c             	mov    0xc(%ebp),%eax
    8972:	01 c2                	add    %eax,%edx
    8974:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8977:	dd 04 c2             	fldl   (%edx,%eax,8)
    897a:	de c9                	fmulp  %st,%st(1)
    897c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    897f:	dd 1c c1             	fstpl  (%ecx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    8982:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8985:	89 d0                	mov    %edx,%eax
    8987:	c1 e0 03             	shl    $0x3,%eax
    898a:	01 d0                	add    %edx,%eax
    898c:	c1 e0 03             	shl    $0x3,%eax
    898f:	89 c2                	mov    %eax,%edx
    8991:	8b 45 08             	mov    0x8(%ebp),%eax
    8994:	01 c2                	add    %eax,%edx
    8996:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8999:	8b 04 82             	mov    (%edx,%eax,4),%eax
    899c:	c1 e8 1f             	shr    $0x1f,%eax
    899f:	0f b6 c0             	movzbl %al,%eax
    89a2:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    89a5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89a8:	89 d0                	mov    %edx,%eax
    89aa:	c1 e0 03             	shl    $0x3,%eax
    89ad:	01 d0                	add    %edx,%eax
    89af:	c1 e0 03             	shl    $0x3,%eax
    89b2:	89 c2                	mov    %eax,%edx
    89b4:	8b 45 08             	mov    0x8(%ebp),%eax
    89b7:	01 c2                	add    %eax,%edx
    89b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89bc:	8b 04 82             	mov    (%edx,%eax,4),%eax
    89bf:	83 ec 0c             	sub    $0xc,%esp
    89c2:	50                   	push   %eax
    89c3:	e8 c7 bd ff ff       	call   478f <abs>
    89c8:	83 c4 10             	add    $0x10,%esp
    89cb:	89 45 c8             	mov    %eax,-0x38(%ebp)
    89ce:	db 45 c8             	fildl  -0x38(%ebp)
    89d1:	dd 05 78 d9 00 00    	fldl   0xd978
    89d7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    89db:	dd 1c 24             	fstpl  (%esp)
    89de:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    89e2:	dd 1c 24             	fstpl  (%esp)
    89e5:	e8 bb be ff ff       	call   48a5 <pow>
    89ea:	83 c4 10             	add    $0x10,%esp
    89ed:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89f0:	89 d0                	mov    %edx,%eax
    89f2:	c1 e0 03             	shl    $0x3,%eax
    89f5:	01 d0                	add    %edx,%eax
    89f7:	c1 e0 04             	shl    $0x4,%eax
    89fa:	89 c2                	mov    %eax,%edx
    89fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    89ff:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8a02:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a05:	89 d0                	mov    %edx,%eax
    8a07:	c1 e0 03             	shl    $0x3,%eax
    8a0a:	01 d0                	add    %edx,%eax
    8a0c:	c1 e0 04             	shl    $0x4,%eax
    8a0f:	89 c2                	mov    %eax,%edx
    8a11:	8b 45 0c             	mov    0xc(%ebp),%eax
    8a14:	01 c2                	add    %eax,%edx
    8a16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a19:	dd 04 c2             	fldl   (%edx,%eax,8)
    8a1c:	de c9                	fmulp  %st,%st(1)
    8a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a21:	dd 1c c1             	fstpl  (%ecx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    8a24:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    8a28:	74 37                	je     8a61 <III_dequantize_sample+0x72e>
    8a2a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a2d:	89 d0                	mov    %edx,%eax
    8a2f:	c1 e0 03             	shl    $0x3,%eax
    8a32:	01 d0                	add    %edx,%eax
    8a34:	c1 e0 04             	shl    $0x4,%eax
    8a37:	89 c2                	mov    %eax,%edx
    8a39:	8b 45 0c             	mov    0xc(%ebp),%eax
    8a3c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8a3f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a42:	89 d0                	mov    %edx,%eax
    8a44:	c1 e0 03             	shl    $0x3,%eax
    8a47:	01 d0                	add    %edx,%eax
    8a49:	c1 e0 04             	shl    $0x4,%eax
    8a4c:	89 c2                	mov    %eax,%edx
    8a4e:	8b 45 0c             	mov    0xc(%ebp),%eax
    8a51:	01 c2                	add    %eax,%edx
    8a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a56:	dd 04 c2             	fldl   (%edx,%eax,8)
    8a59:	d9 e0                	fchs   
    8a5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a5e:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    8a61:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8a65:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8a69:	0f 8e 86 f9 ff ff    	jle    83f5 <III_dequantize_sample+0xc2>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    8a6f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8a73:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8a77:	0f 8e 6c f9 ff ff    	jle    83e9 <III_dequantize_sample+0xb6>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    8a7d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    8a80:	c9                   	leave  
    8a81:	c3                   	ret    

00008a82 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    8a82:	55                   	push   %ebp
    8a83:	89 e5                	mov    %esp,%ebp
    8a85:	57                   	push   %edi
    8a86:	56                   	push   %esi
    8a87:	53                   	push   %ebx
    8a88:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    8a8b:	8b 45 14             	mov    0x14(%ebp),%eax
    8a8e:	8b 00                	mov    (%eax),%eax
    8a90:	8b 40 10             	mov    0x10(%eax),%eax
    8a93:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8a96:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8a9d:	eb 33                	jmp    8ad2 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    8a9f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8aa6:	eb 20                	jmp    8ac8 <III_reorder+0x46>
         ro[sb][ss] = 0;
    8aa8:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8aab:	89 d0                	mov    %edx,%eax
    8aad:	c1 e0 03             	shl    $0x3,%eax
    8ab0:	01 d0                	add    %edx,%eax
    8ab2:	c1 e0 04             	shl    $0x4,%eax
    8ab5:	89 c2                	mov    %eax,%edx
    8ab7:	8b 45 0c             	mov    0xc(%ebp),%eax
    8aba:	01 c2                	add    %eax,%edx
    8abc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8abf:	d9 ee                	fldz   
    8ac1:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    8ac4:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8ac8:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8acc:	7e da                	jle    8aa8 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8ace:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8ad2:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    8ad6:	7e c7                	jle    8a9f <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8ad8:	8b 45 10             	mov    0x10(%ebp),%eax
    8adb:	8b 40 10             	mov    0x10(%eax),%eax
    8ade:	85 c0                	test   %eax,%eax
    8ae0:	0f 84 b8 03 00 00    	je     8e9e <III_reorder+0x41c>
    8ae6:	8b 45 10             	mov    0x10(%ebp),%eax
    8ae9:	8b 40 14             	mov    0x14(%eax),%eax
    8aec:	83 f8 02             	cmp    $0x2,%eax
    8aef:	0f 85 a9 03 00 00    	jne    8e9e <III_reorder+0x41c>
      if (gr_info->mixed_block_flag) {
    8af5:	8b 45 10             	mov    0x10(%ebp),%eax
    8af8:	8b 40 18             	mov    0x18(%eax),%eax
    8afb:	85 c0                	test   %eax,%eax
    8afd:	0f 84 06 02 00 00    	je     8d09 <III_reorder+0x287>
         for (sb=0 ; sb < 2 ; sb++)
    8b03:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8b0a:	eb 4c                	jmp    8b58 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8b0c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8b13:	eb 39                	jmp    8b4e <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    8b15:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8b18:	89 d0                	mov    %edx,%eax
    8b1a:	c1 e0 03             	shl    $0x3,%eax
    8b1d:	01 d0                	add    %edx,%eax
    8b1f:	c1 e0 04             	shl    $0x4,%eax
    8b22:	89 c2                	mov    %eax,%edx
    8b24:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b27:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8b2a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8b2d:	89 d0                	mov    %edx,%eax
    8b2f:	c1 e0 03             	shl    $0x3,%eax
    8b32:	01 d0                	add    %edx,%eax
    8b34:	c1 e0 04             	shl    $0x4,%eax
    8b37:	89 c2                	mov    %eax,%edx
    8b39:	8b 45 08             	mov    0x8(%ebp),%eax
    8b3c:	01 c2                	add    %eax,%edx
    8b3e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8b41:	dd 04 c2             	fldl   (%edx,%eax,8)
    8b44:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8b47:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8b4a:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8b4e:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8b52:	7e c1                	jle    8b15 <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    8b54:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8b58:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    8b5c:	7e ae                	jle    8b0c <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8b5e:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    8b65:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8b68:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8b6e:	83 c0 5c             	add    $0x5c,%eax
    8b71:	05 00 f5 00 00       	add    $0xf500,%eax
    8b76:	8b 40 0c             	mov    0xc(%eax),%eax
    8b79:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    8b7c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8b7f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8b85:	83 c0 60             	add    $0x60,%eax
    8b88:	05 00 f5 00 00       	add    $0xf500,%eax
    8b8d:	8b 40 0c             	mov    0xc(%eax),%eax
    8b90:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8b93:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8b96:	e9 5f 01 00 00       	jmp    8cfa <III_reorder+0x278>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8b9b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8ba2:	e9 fd 00 00 00       	jmp    8ca4 <III_reorder+0x222>
                  for(freq=0;freq<sfb_lines;freq++) {
    8ba7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8bae:	e9 e1 00 00 00       	jmp    8c94 <III_reorder+0x212>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8bb3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8bb6:	89 d0                	mov    %edx,%eax
    8bb8:	01 c0                	add    %eax,%eax
    8bba:	01 c2                	add    %eax,%edx
    8bbc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8bbf:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8bc3:	01 c2                	add    %eax,%edx
    8bc5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8bc8:	01 d0                	add    %edx,%eax
    8bca:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8bcd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8bd0:	89 d0                	mov    %edx,%eax
    8bd2:	01 c0                	add    %eax,%eax
    8bd4:	01 c2                	add    %eax,%edx
    8bd6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8bd9:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8bdc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8bdf:	89 d0                	mov    %edx,%eax
    8be1:	01 c0                	add    %eax,%eax
    8be3:	01 d0                	add    %edx,%eax
    8be5:	01 c8                	add    %ecx,%eax
    8be7:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8bea:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8bed:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8bf2:	89 c8                	mov    %ecx,%eax
    8bf4:	f7 ea                	imul   %edx
    8bf6:	c1 fa 02             	sar    $0x2,%edx
    8bf9:	89 c8                	mov    %ecx,%eax
    8bfb:	c1 f8 1f             	sar    $0x1f,%eax
    8bfe:	29 c2                	sub    %eax,%edx
    8c00:	89 d0                	mov    %edx,%eax
    8c02:	89 c2                	mov    %eax,%edx
    8c04:	89 d0                	mov    %edx,%eax
    8c06:	c1 e0 03             	shl    $0x3,%eax
    8c09:	01 d0                	add    %edx,%eax
    8c0b:	c1 e0 04             	shl    $0x4,%eax
    8c0e:	89 c2                	mov    %eax,%edx
    8c10:	8b 45 0c             	mov    0xc(%ebp),%eax
    8c13:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8c16:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8c19:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c1e:	89 d8                	mov    %ebx,%eax
    8c20:	f7 ea                	imul   %edx
    8c22:	c1 fa 02             	sar    $0x2,%edx
    8c25:	89 d8                	mov    %ebx,%eax
    8c27:	c1 f8 1f             	sar    $0x1f,%eax
    8c2a:	89 d1                	mov    %edx,%ecx
    8c2c:	29 c1                	sub    %eax,%ecx
    8c2e:	89 c8                	mov    %ecx,%eax
    8c30:	c1 e0 03             	shl    $0x3,%eax
    8c33:	01 c8                	add    %ecx,%eax
    8c35:	01 c0                	add    %eax,%eax
    8c37:	29 c3                	sub    %eax,%ebx
    8c39:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8c3b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8c3e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c43:	89 d8                	mov    %ebx,%eax
    8c45:	f7 ea                	imul   %edx
    8c47:	c1 fa 02             	sar    $0x2,%edx
    8c4a:	89 d8                	mov    %ebx,%eax
    8c4c:	c1 f8 1f             	sar    $0x1f,%eax
    8c4f:	29 c2                	sub    %eax,%edx
    8c51:	89 d0                	mov    %edx,%eax
    8c53:	89 c2                	mov    %eax,%edx
    8c55:	89 d0                	mov    %edx,%eax
    8c57:	c1 e0 03             	shl    $0x3,%eax
    8c5a:	01 d0                	add    %edx,%eax
    8c5c:	c1 e0 04             	shl    $0x4,%eax
    8c5f:	89 c2                	mov    %eax,%edx
    8c61:	8b 45 08             	mov    0x8(%ebp),%eax
    8c64:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8c67:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8c6a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c6f:	89 d8                	mov    %ebx,%eax
    8c71:	f7 ea                	imul   %edx
    8c73:	c1 fa 02             	sar    $0x2,%edx
    8c76:	89 d8                	mov    %ebx,%eax
    8c78:	c1 f8 1f             	sar    $0x1f,%eax
    8c7b:	29 c2                	sub    %eax,%edx
    8c7d:	89 d0                	mov    %edx,%eax
    8c7f:	c1 e0 03             	shl    $0x3,%eax
    8c82:	01 d0                	add    %edx,%eax
    8c84:	01 c0                	add    %eax,%eax
    8c86:	29 c3                	sub    %eax,%ebx
    8c88:	89 da                	mov    %ebx,%edx
    8c8a:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8c8d:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8c90:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    8c94:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8c97:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8c9a:	0f 8c 13 ff ff ff    	jl     8bb3 <III_reorder+0x131>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8ca0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    8ca4:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8ca8:	0f 8e f9 fe ff ff    	jle    8ba7 <III_reorder+0x125>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8cae:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8cb2:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8cb5:	89 d0                	mov    %edx,%eax
    8cb7:	c1 e0 03             	shl    $0x3,%eax
    8cba:	01 d0                	add    %edx,%eax
    8cbc:	c1 e0 02             	shl    $0x2,%eax
    8cbf:	01 d0                	add    %edx,%eax
    8cc1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8cc4:	01 d0                	add    %edx,%eax
    8cc6:	83 c0 14             	add    $0x14,%eax
    8cc9:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
    8cd0:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8cd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8cd6:	8d 48 01             	lea    0x1(%eax),%ecx
    8cd9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8cdc:	89 d0                	mov    %edx,%eax
    8cde:	c1 e0 03             	shl    $0x3,%eax
    8ce1:	01 d0                	add    %edx,%eax
    8ce3:	c1 e0 02             	shl    $0x2,%eax
    8ce6:	01 d0                	add    %edx,%eax
    8ce8:	01 c8                	add    %ecx,%eax
    8cea:	83 c0 14             	add    $0x14,%eax
    8ced:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
    8cf4:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8cf7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8cfa:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    8cfe:	0f 8e 97 fe ff ff    	jle    8b9b <III_reorder+0x119>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8d04:	e9 f0 01 00 00       	jmp    8ef9 <III_reorder+0x477>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8d09:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8d10:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8d17:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8d1a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d20:	83 c0 54             	add    $0x54,%eax
    8d23:	05 00 f5 00 00       	add    $0xf500,%eax
    8d28:	8b 40 0c             	mov    0xc(%eax),%eax
    8d2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8d2e:	e9 5f 01 00 00       	jmp    8e92 <III_reorder+0x410>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8d33:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8d3a:	e9 fd 00 00 00       	jmp    8e3c <III_reorder+0x3ba>
                  for(freq=0;freq<sfb_lines;freq++) {
    8d3f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8d46:	e9 e1 00 00 00       	jmp    8e2c <III_reorder+0x3aa>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8d4b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8d4e:	89 d0                	mov    %edx,%eax
    8d50:	01 c0                	add    %eax,%eax
    8d52:	01 c2                	add    %eax,%edx
    8d54:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8d57:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8d5b:	01 c2                	add    %eax,%edx
    8d5d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8d60:	01 d0                	add    %edx,%eax
    8d62:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8d65:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8d68:	89 d0                	mov    %edx,%eax
    8d6a:	01 c0                	add    %eax,%eax
    8d6c:	01 c2                	add    %eax,%edx
    8d6e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8d71:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8d74:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8d77:	89 d0                	mov    %edx,%eax
    8d79:	01 c0                	add    %eax,%eax
    8d7b:	01 d0                	add    %edx,%eax
    8d7d:	01 c8                	add    %ecx,%eax
    8d7f:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8d82:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8d85:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d8a:	89 c8                	mov    %ecx,%eax
    8d8c:	f7 ea                	imul   %edx
    8d8e:	c1 fa 02             	sar    $0x2,%edx
    8d91:	89 c8                	mov    %ecx,%eax
    8d93:	c1 f8 1f             	sar    $0x1f,%eax
    8d96:	29 c2                	sub    %eax,%edx
    8d98:	89 d0                	mov    %edx,%eax
    8d9a:	89 c2                	mov    %eax,%edx
    8d9c:	89 d0                	mov    %edx,%eax
    8d9e:	c1 e0 03             	shl    $0x3,%eax
    8da1:	01 d0                	add    %edx,%eax
    8da3:	c1 e0 04             	shl    $0x4,%eax
    8da6:	89 c2                	mov    %eax,%edx
    8da8:	8b 45 0c             	mov    0xc(%ebp),%eax
    8dab:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8dae:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8db1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8db6:	89 d8                	mov    %ebx,%eax
    8db8:	f7 ea                	imul   %edx
    8dba:	c1 fa 02             	sar    $0x2,%edx
    8dbd:	89 d8                	mov    %ebx,%eax
    8dbf:	c1 f8 1f             	sar    $0x1f,%eax
    8dc2:	89 d1                	mov    %edx,%ecx
    8dc4:	29 c1                	sub    %eax,%ecx
    8dc6:	89 c8                	mov    %ecx,%eax
    8dc8:	c1 e0 03             	shl    $0x3,%eax
    8dcb:	01 c8                	add    %ecx,%eax
    8dcd:	01 c0                	add    %eax,%eax
    8dcf:	29 c3                	sub    %eax,%ebx
    8dd1:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8dd3:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8dd6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ddb:	89 d8                	mov    %ebx,%eax
    8ddd:	f7 ea                	imul   %edx
    8ddf:	c1 fa 02             	sar    $0x2,%edx
    8de2:	89 d8                	mov    %ebx,%eax
    8de4:	c1 f8 1f             	sar    $0x1f,%eax
    8de7:	29 c2                	sub    %eax,%edx
    8de9:	89 d0                	mov    %edx,%eax
    8deb:	89 c2                	mov    %eax,%edx
    8ded:	89 d0                	mov    %edx,%eax
    8def:	c1 e0 03             	shl    $0x3,%eax
    8df2:	01 d0                	add    %edx,%eax
    8df4:	c1 e0 04             	shl    $0x4,%eax
    8df7:	89 c2                	mov    %eax,%edx
    8df9:	8b 45 08             	mov    0x8(%ebp),%eax
    8dfc:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8dff:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8e02:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8e07:	89 d8                	mov    %ebx,%eax
    8e09:	f7 ea                	imul   %edx
    8e0b:	c1 fa 02             	sar    $0x2,%edx
    8e0e:	89 d8                	mov    %ebx,%eax
    8e10:	c1 f8 1f             	sar    $0x1f,%eax
    8e13:	29 c2                	sub    %eax,%edx
    8e15:	89 d0                	mov    %edx,%eax
    8e17:	c1 e0 03             	shl    $0x3,%eax
    8e1a:	01 d0                	add    %edx,%eax
    8e1c:	01 c0                	add    %eax,%eax
    8e1e:	29 c3                	sub    %eax,%ebx
    8e20:	89 da                	mov    %ebx,%edx
    8e22:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8e25:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8e28:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    8e2c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8e2f:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8e32:	0f 8c 13 ff ff ff    	jl     8d4b <III_reorder+0x2c9>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8e38:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    8e3c:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8e40:	0f 8e f9 fe ff ff    	jle    8d3f <III_reorder+0x2bd>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8e46:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8e4a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8e4d:	89 d0                	mov    %edx,%eax
    8e4f:	c1 e0 03             	shl    $0x3,%eax
    8e52:	01 d0                	add    %edx,%eax
    8e54:	c1 e0 02             	shl    $0x2,%eax
    8e57:	01 d0                	add    %edx,%eax
    8e59:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8e5c:	01 d0                	add    %edx,%eax
    8e5e:	83 c0 14             	add    $0x14,%eax
    8e61:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
    8e68:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8e6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8e6e:	8d 48 01             	lea    0x1(%eax),%ecx
    8e71:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8e74:	89 d0                	mov    %edx,%eax
    8e76:	c1 e0 03             	shl    $0x3,%eax
    8e79:	01 d0                	add    %edx,%eax
    8e7b:	c1 e0 02             	shl    $0x2,%eax
    8e7e:	01 d0                	add    %edx,%eax
    8e80:	01 c8                	add    %ecx,%eax
    8e82:	83 c0 14             	add    $0x14,%eax
    8e85:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
    8e8c:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8e8f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8e92:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    8e96:	0f 8e 97 fe ff ff    	jle    8d33 <III_reorder+0x2b1>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8e9c:	eb 5b                	jmp    8ef9 <III_reorder+0x477>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8e9e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8ea5:	eb 4c                	jmp    8ef3 <III_reorder+0x471>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8ea7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8eae:	eb 39                	jmp    8ee9 <III_reorder+0x467>
            ro[sb][ss] = xr[sb][ss];
    8eb0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8eb3:	89 d0                	mov    %edx,%eax
    8eb5:	c1 e0 03             	shl    $0x3,%eax
    8eb8:	01 d0                	add    %edx,%eax
    8eba:	c1 e0 04             	shl    $0x4,%eax
    8ebd:	89 c2                	mov    %eax,%edx
    8ebf:	8b 45 0c             	mov    0xc(%ebp),%eax
    8ec2:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8ec5:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8ec8:	89 d0                	mov    %edx,%eax
    8eca:	c1 e0 03             	shl    $0x3,%eax
    8ecd:	01 d0                	add    %edx,%eax
    8ecf:	c1 e0 04             	shl    $0x4,%eax
    8ed2:	89 c2                	mov    %eax,%edx
    8ed4:	8b 45 08             	mov    0x8(%ebp),%eax
    8ed7:	01 c2                	add    %eax,%edx
    8ed9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8edc:	dd 04 c2             	fldl   (%edx,%eax,8)
    8edf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8ee2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8ee5:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8ee9:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8eed:	7e c1                	jle    8eb0 <III_reorder+0x42e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8eef:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8ef3:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    8ef7:	7e ae                	jle    8ea7 <III_reorder+0x425>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    8ef9:	83 c4 34             	add    $0x34,%esp
    8efc:	5b                   	pop    %ebx
    8efd:	5e                   	pop    %esi
    8efe:	5f                   	pop    %edi
    8eff:	5d                   	pop    %ebp
    8f00:	c3                   	ret    

00008f01 <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    8f01:	55                   	push   %ebp
    8f02:	89 e5                	mov    %esp,%ebp
    8f04:	56                   	push   %esi
    8f05:	53                   	push   %ebx
    8f06:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    8f0c:	8b 45 18             	mov    0x18(%ebp),%eax
    8f0f:	8b 00                	mov    (%eax),%eax
    8f11:	8b 40 10             	mov    0x10(%eax),%eax
    8f14:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    8f17:	8b 45 18             	mov    0x18(%ebp),%eax
    8f1a:	8b 40 08             	mov    0x8(%eax),%eax
    8f1d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f20:	8b 45 18             	mov    0x18(%ebp),%eax
    8f23:	8b 00                	mov    (%eax),%eax
    8f25:	8b 40 1c             	mov    0x1c(%eax),%eax
    8f28:	83 f8 01             	cmp    $0x1,%eax
    8f2b:	75 16                	jne    8f43 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    8f2d:	8b 45 18             	mov    0x18(%ebp),%eax
    8f30:	8b 00                	mov    (%eax),%eax
    8f32:	8b 40 20             	mov    0x20(%eax),%eax
    8f35:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f38:	85 c0                	test   %eax,%eax
    8f3a:	74 07                	je     8f43 <III_stereo+0x42>
    8f3c:	b8 01 00 00 00       	mov    $0x1,%eax
    8f41:	eb 05                	jmp    8f48 <III_stereo+0x47>
    8f43:	b8 00 00 00 00       	mov    $0x0,%eax
    8f48:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f4b:	8b 45 18             	mov    0x18(%ebp),%eax
    8f4e:	8b 00                	mov    (%eax),%eax
    8f50:	8b 40 1c             	mov    0x1c(%eax),%eax
    8f53:	83 f8 01             	cmp    $0x1,%eax
    8f56:	75 16                	jne    8f6e <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    8f58:	8b 45 18             	mov    0x18(%ebp),%eax
    8f5b:	8b 00                	mov    (%eax),%eax
    8f5d:	8b 40 20             	mov    0x20(%eax),%eax
    8f60:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f63:	85 c0                	test   %eax,%eax
    8f65:	74 07                	je     8f6e <III_stereo+0x6d>
    8f67:	b8 01 00 00 00       	mov    $0x1,%eax
    8f6c:	eb 05                	jmp    8f73 <III_stereo+0x72>
    8f6e:	b8 00 00 00 00       	mov    $0x0,%eax
    8f73:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8f76:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8f7d:	eb 12                	jmp    8f91 <III_stereo+0x90>
      is_pos[i] = 7;
    8f7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f82:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    8f89:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8f8d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8f91:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    8f98:	7e e5                	jle    8f7f <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    8f9a:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8f9e:	0f 85 65 0a 00 00    	jne    9a09 <III_stereo+0xb08>
    8fa4:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    8fa8:	0f 84 5b 0a 00 00    	je     9a09 <III_stereo+0xb08>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    8fae:	8b 45 14             	mov    0x14(%ebp),%eax
    8fb1:	8b 40 10             	mov    0x10(%eax),%eax
    8fb4:	85 c0                	test   %eax,%eax
    8fb6:	0f 84 4d 08 00 00    	je     9809 <III_stereo+0x908>
    8fbc:	8b 45 14             	mov    0x14(%ebp),%eax
    8fbf:	8b 40 14             	mov    0x14(%eax),%eax
    8fc2:	83 f8 02             	cmp    $0x2,%eax
    8fc5:	0f 85 3e 08 00 00    	jne    9809 <III_stereo+0x908>
      {  if( gr_info->mixed_block_flag )
    8fcb:	8b 45 14             	mov    0x14(%ebp),%eax
    8fce:	8b 40 18             	mov    0x18(%eax),%eax
    8fd1:	85 c0                	test   %eax,%eax
    8fd3:	0f 84 f1 04 00 00    	je     94ca <III_stereo+0x5c9>
         {  int max_sfb = 0;
    8fd9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    8fe0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8fe7:	e9 32 03 00 00       	jmp    931e <III_stereo+0x41d>
            {  int sfbcnt;
               sfbcnt = 2;
    8fec:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    8ff3:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8ffa:	e9 0f 01 00 00       	jmp    910e <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8fff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9002:	8d 48 01             	lea    0x1(%eax),%ecx
    9005:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9008:	89 d0                	mov    %edx,%eax
    900a:	c1 e0 03             	shl    $0x3,%eax
    900d:	01 d0                	add    %edx,%eax
    900f:	c1 e0 02             	shl    $0x2,%eax
    9012:	01 d0                	add    %edx,%eax
    9014:	01 c8                	add    %ecx,%eax
    9016:	83 c0 14             	add    $0x14,%eax
    9019:	8b 0c 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%ecx
    9020:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9023:	89 d0                	mov    %edx,%eax
    9025:	c1 e0 03             	shl    $0x3,%eax
    9028:	01 d0                	add    %edx,%eax
    902a:	c1 e0 02             	shl    $0x2,%eax
    902d:	01 d0                	add    %edx,%eax
    902f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9032:	01 d0                	add    %edx,%eax
    9034:	83 c0 14             	add    $0x14,%eax
    9037:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
    903e:	29 c1                	sub    %eax,%ecx
    9040:	89 c8                	mov    %ecx,%eax
    9042:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9045:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9048:	89 d0                	mov    %edx,%eax
    904a:	c1 e0 03             	shl    $0x3,%eax
    904d:	01 d0                	add    %edx,%eax
    904f:	c1 e0 02             	shl    $0x2,%eax
    9052:	01 d0                	add    %edx,%eax
    9054:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9057:	01 d0                	add    %edx,%eax
    9059:	83 c0 14             	add    $0x14,%eax
    905c:	8b 14 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%edx
    9063:	89 d0                	mov    %edx,%eax
    9065:	01 c0                	add    %eax,%eax
    9067:	01 c2                	add    %eax,%edx
    9069:	8b 45 ec             	mov    -0x14(%ebp),%eax
    906c:	83 c0 01             	add    $0x1,%eax
    906f:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    9073:	01 d0                	add    %edx,%eax
    9075:	83 e8 01             	sub    $0x1,%eax
    9078:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    907b:	e9 80 00 00 00       	jmp    9100 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9080:	8b 45 08             	mov    0x8(%ebp),%eax
    9083:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9089:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    908c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9091:	89 c8                	mov    %ecx,%eax
    9093:	f7 ea                	imul   %edx
    9095:	c1 fa 02             	sar    $0x2,%edx
    9098:	89 c8                	mov    %ecx,%eax
    909a:	c1 f8 1f             	sar    $0x1f,%eax
    909d:	89 d3                	mov    %edx,%ebx
    909f:	29 c3                	sub    %eax,%ebx
    90a1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    90a4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    90a9:	89 c8                	mov    %ecx,%eax
    90ab:	f7 ea                	imul   %edx
    90ad:	c1 fa 02             	sar    $0x2,%edx
    90b0:	89 c8                	mov    %ecx,%eax
    90b2:	c1 f8 1f             	sar    $0x1f,%eax
    90b5:	29 c2                	sub    %eax,%edx
    90b7:	89 d0                	mov    %edx,%eax
    90b9:	c1 e0 03             	shl    $0x3,%eax
    90bc:	01 d0                	add    %edx,%eax
    90be:	01 c0                	add    %eax,%eax
    90c0:	29 c1                	sub    %eax,%ecx
    90c2:	89 ca                	mov    %ecx,%edx
    90c4:	89 d8                	mov    %ebx,%eax
    90c6:	c1 e0 03             	shl    $0x3,%eax
    90c9:	01 d8                	add    %ebx,%eax
    90cb:	01 c0                	add    %eax,%eax
    90cd:	01 d0                	add    %edx,%eax
    90cf:	dd 04 c6             	fldl   (%esi,%eax,8)
    90d2:	d9 ee                	fldz   
    90d4:	df e9                	fucomip %st(1),%st
    90d6:	7a 0a                	jp     90e2 <III_stereo+0x1e1>
    90d8:	d9 ee                	fldz   
    90da:	df e9                	fucomip %st(1),%st
    90dc:	dd d8                	fstp   %st(0)
    90de:	74 18                	je     90f8 <III_stereo+0x1f7>
    90e0:	eb 02                	jmp    90e4 <III_stereo+0x1e3>
    90e2:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    90e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90e7:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    90ea:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    90f1:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    90f8:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    90fc:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    9100:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    9104:	0f 8f 76 ff ff ff    	jg     9080 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    910a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    910e:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    9112:	0f 8f e7 fe ff ff    	jg     8fff <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    9118:	8b 45 d8             	mov    -0x28(%ebp),%eax
    911b:	83 c0 01             	add    $0x1,%eax
    911e:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    9121:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9124:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9127:	7e 06                	jle    912f <III_stereo+0x22e>
                  max_sfb = sfb;
    9129:	8b 45 f4             	mov    -0xc(%ebp),%eax
    912c:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    912f:	e9 fa 00 00 00       	jmp    922e <III_stereo+0x32d>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9134:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9137:	8d 48 01             	lea    0x1(%eax),%ecx
    913a:	8b 55 c8             	mov    -0x38(%ebp),%edx
    913d:	89 d0                	mov    %edx,%eax
    913f:	c1 e0 03             	shl    $0x3,%eax
    9142:	01 d0                	add    %edx,%eax
    9144:	c1 e0 02             	shl    $0x2,%eax
    9147:	01 d0                	add    %edx,%eax
    9149:	01 c8                	add    %ecx,%eax
    914b:	83 c0 14             	add    $0x14,%eax
    914e:	8b 0c 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%ecx
    9155:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9158:	89 d0                	mov    %edx,%eax
    915a:	c1 e0 03             	shl    $0x3,%eax
    915d:	01 d0                	add    %edx,%eax
    915f:	c1 e0 02             	shl    $0x2,%eax
    9162:	01 d0                	add    %edx,%eax
    9164:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9167:	01 d0                	add    %edx,%eax
    9169:	83 c0 14             	add    $0x14,%eax
    916c:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
    9173:	29 c1                	sub    %eax,%ecx
    9175:	89 c8                	mov    %ecx,%eax
    9177:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    917a:	8b 55 c8             	mov    -0x38(%ebp),%edx
    917d:	89 d0                	mov    %edx,%eax
    917f:	c1 e0 03             	shl    $0x3,%eax
    9182:	01 d0                	add    %edx,%eax
    9184:	c1 e0 02             	shl    $0x2,%eax
    9187:	01 d0                	add    %edx,%eax
    9189:	8b 55 f4             	mov    -0xc(%ebp),%edx
    918c:	01 d0                	add    %edx,%eax
    918e:	83 c0 14             	add    $0x14,%eax
    9191:	8b 14 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%edx
    9198:	89 d0                	mov    %edx,%eax
    919a:	01 c0                	add    %eax,%eax
    919c:	01 c2                	add    %eax,%edx
    919e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    91a1:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    91a5:	01 d0                	add    %edx,%eax
    91a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    91aa:	eb 78                	jmp    9224 <III_stereo+0x323>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    91ac:	8b 4d 10             	mov    0x10(%ebp),%ecx
    91af:	8b 55 ec             	mov    -0x14(%ebp),%edx
    91b2:	89 d0                	mov    %edx,%eax
    91b4:	01 c0                	add    %eax,%eax
    91b6:	01 d0                	add    %edx,%eax
    91b8:	c1 e0 02             	shl    $0x2,%eax
    91bb:	01 d0                	add    %edx,%eax
    91bd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    91c0:	01 d0                	add    %edx,%eax
    91c2:	83 c0 52             	add    $0x52,%eax
    91c5:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    91c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91cc:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    91d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91d6:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    91dd:	83 f8 07             	cmp    $0x7,%eax
    91e0:	74 3a                	je     921c <III_stereo+0x31b>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    91e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91e5:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    91ec:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    91f2:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    91f8:	dd 05 80 d9 00 00    	fldl   0xd980
    91fe:	de c9                	fmulp  %st,%st(1)
    9200:	83 ec 08             	sub    $0x8,%esp
    9203:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9207:	dd 1c 24             	fstpl  (%esp)
    920a:	e8 60 b6 ff ff       	call   486f <tan>
    920f:	83 c4 10             	add    $0x10,%esp
    9212:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9215:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    921c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    9220:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9224:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9228:	7f 82                	jg     91ac <III_stereo+0x2ab>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    922a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    922e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9232:	0f 8e fc fe ff ff    	jle    9134 <III_stereo+0x233>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    9238:	8b 45 c8             	mov    -0x38(%ebp),%eax
    923b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9241:	83 c0 7c             	add    $0x7c,%eax
    9244:	05 00 f5 00 00       	add    $0xf500,%eax
    9249:	8b 50 0c             	mov    0xc(%eax),%edx
    924c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    924f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9255:	83 c0 78             	add    $0x78,%eax
    9258:	05 00 f5 00 00       	add    $0xf500,%eax
    925d:	8b 40 0c             	mov    0xc(%eax),%eax
    9260:	29 c2                	sub    %eax,%edx
    9262:	89 d0                	mov    %edx,%eax
    9264:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9267:	8b 45 c8             	mov    -0x38(%ebp),%eax
    926a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9270:	83 c0 78             	add    $0x78,%eax
    9273:	05 00 f5 00 00       	add    $0xf500,%eax
    9278:	8b 50 0c             	mov    0xc(%eax),%edx
    927b:	89 d0                	mov    %edx,%eax
    927d:	01 c0                	add    %eax,%eax
    927f:	01 c2                	add    %eax,%edx
    9281:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9284:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9288:	01 d0                	add    %edx,%eax
    928a:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    928d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9290:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9296:	83 e8 80             	sub    $0xffffff80,%eax
    9299:	05 00 f5 00 00       	add    $0xf500,%eax
    929e:	8b 50 0c             	mov    0xc(%eax),%edx
    92a1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    92a4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    92aa:	83 c0 7c             	add    $0x7c,%eax
    92ad:	05 00 f5 00 00       	add    $0xf500,%eax
    92b2:	8b 40 0c             	mov    0xc(%eax),%eax
    92b5:	29 c2                	sub    %eax,%edx
    92b7:	89 d0                	mov    %edx,%eax
    92b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    92bc:	8b 45 c8             	mov    -0x38(%ebp),%eax
    92bf:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    92c5:	83 c0 7c             	add    $0x7c,%eax
    92c8:	05 00 f5 00 00       	add    $0xf500,%eax
    92cd:	8b 50 0c             	mov    0xc(%eax),%edx
    92d0:	89 d0                	mov    %edx,%eax
    92d2:	01 c0                	add    %eax,%eax
    92d4:	01 c2                	add    %eax,%edx
    92d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    92d9:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    92dd:	01 d0                	add    %edx,%eax
    92df:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    92e2:	eb 30                	jmp    9314 <III_stereo+0x413>
               {  is_pos[i] = is_pos[sfb];
    92e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92e7:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    92ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    92f1:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    92f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92fb:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9302:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9305:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    930c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    9310:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9314:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9318:	7f ca                	jg     92e4 <III_stereo+0x3e3>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    931a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    931e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9322:	0f 8e c4 fc ff ff    	jle    8fec <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    9328:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    932c:	0f 8f 93 01 00 00    	jg     94c5 <III_stereo+0x5c4>
             {  i = 2;
    9332:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    9339:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    9340:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    9347:	eb 63                	jmp    93ac <III_stereo+0x4ab>
                {  if ( xr[1][i][ss] != 0.0 )
    9349:	8b 45 08             	mov    0x8(%ebp),%eax
    934c:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9352:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9355:	89 d0                	mov    %edx,%eax
    9357:	c1 e0 03             	shl    $0x3,%eax
    935a:	01 d0                	add    %edx,%eax
    935c:	01 c0                	add    %eax,%eax
    935e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9361:	01 d0                	add    %edx,%eax
    9363:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9366:	d9 ee                	fldz   
    9368:	df e9                	fucomip %st(1),%st
    936a:	7a 0a                	jp     9376 <III_stereo+0x475>
    936c:	d9 ee                	fldz   
    936e:	df e9                	fucomip %st(1),%st
    9370:	dd d8                	fstp   %st(0)
    9372:	74 23                	je     9397 <III_stereo+0x496>
    9374:	eb 02                	jmp    9378 <III_stereo+0x477>
    9376:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    9378:	8b 55 f0             	mov    -0x10(%ebp),%edx
    937b:	89 d0                	mov    %edx,%eax
    937d:	c1 e0 03             	shl    $0x3,%eax
    9380:	01 d0                	add    %edx,%eax
    9382:	01 c0                	add    %eax,%eax
    9384:	89 c2                	mov    %eax,%edx
    9386:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9389:	01 d0                	add    %edx,%eax
    938b:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    938e:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9395:	eb 15                	jmp    93ac <III_stereo+0x4ab>
                   } else
                   {  ss--;
    9397:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    939b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    939f:	79 0b                	jns    93ac <III_stereo+0x4ab>
                      {  i--;
    93a1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    93a5:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    93ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    93b0:	79 97                	jns    9349 <III_stereo+0x448>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    93b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    93b9:	eb 04                	jmp    93bf <III_stereo+0x4be>
                   i++;
    93bb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    93bf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93c2:	89 d0                	mov    %edx,%eax
    93c4:	c1 e0 03             	shl    $0x3,%eax
    93c7:	01 d0                	add    %edx,%eax
    93c9:	c1 e0 02             	shl    $0x2,%eax
    93cc:	01 d0                	add    %edx,%eax
    93ce:	8b 55 f0             	mov    -0x10(%ebp),%edx
    93d1:	01 d0                	add    %edx,%eax
    93d3:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    93da:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    93dd:	7e dc                	jle    93bb <III_stereo+0x4ba>
                   i++;
                sfb = i;
    93df:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    93e5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93e8:	89 d0                	mov    %edx,%eax
    93ea:	c1 e0 03             	shl    $0x3,%eax
    93ed:	01 d0                	add    %edx,%eax
    93ef:	c1 e0 02             	shl    $0x2,%eax
    93f2:	01 d0                	add    %edx,%eax
    93f4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    93f7:	01 d0                	add    %edx,%eax
    93f9:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    9400:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    9403:	e9 b3 00 00 00       	jmp    94bb <III_stereo+0x5ba>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    9408:	8b 45 f4             	mov    -0xc(%ebp),%eax
    940b:	8d 48 01             	lea    0x1(%eax),%ecx
    940e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9411:	89 d0                	mov    %edx,%eax
    9413:	c1 e0 03             	shl    $0x3,%eax
    9416:	01 d0                	add    %edx,%eax
    9418:	c1 e0 02             	shl    $0x2,%eax
    941b:	01 d0                	add    %edx,%eax
    941d:	01 c8                	add    %ecx,%eax
    941f:	8b 0c 85 00 f5 00 00 	mov    0xf500(,%eax,4),%ecx
    9426:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9429:	89 d0                	mov    %edx,%eax
    942b:	c1 e0 03             	shl    $0x3,%eax
    942e:	01 d0                	add    %edx,%eax
    9430:	c1 e0 02             	shl    $0x2,%eax
    9433:	01 d0                	add    %edx,%eax
    9435:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9438:	01 d0                	add    %edx,%eax
    943a:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    9441:	29 c1                	sub    %eax,%ecx
    9443:	89 c8                	mov    %ecx,%eax
    9445:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    9448:	eb 67                	jmp    94b1 <III_stereo+0x5b0>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    944a:	8b 45 10             	mov    0x10(%ebp),%eax
    944d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9450:	83 c2 3e             	add    $0x3e,%edx
    9453:	8b 14 90             	mov    (%eax,%edx,4),%edx
    9456:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9459:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    9460:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9463:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    946a:	83 f8 07             	cmp    $0x7,%eax
    946d:	74 3a                	je     94a9 <III_stereo+0x5a8>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    946f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9472:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9479:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    947f:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9485:	dd 05 80 d9 00 00    	fldl   0xd980
    948b:	de c9                	fmulp  %st,%st(1)
    948d:	83 ec 08             	sub    $0x8,%esp
    9490:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9494:	dd 1c 24             	fstpl  (%esp)
    9497:	e8 d3 b3 ff ff       	call   486f <tan>
    949c:	83 c4 10             	add    $0x10,%esp
    949f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    94a2:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    94a9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    94ad:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    94b1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    94b5:	7f 93                	jg     944a <III_stereo+0x549>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    94b7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    94bb:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    94bf:	0f 8e 43 ff ff ff    	jle    9408 <III_stereo+0x507>
    94c5:	e9 3a 03 00 00       	jmp    9804 <III_stereo+0x903>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    94ca:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    94d1:	e9 24 03 00 00       	jmp    97fa <III_stereo+0x8f9>
            {  int sfbcnt;
               sfbcnt = -1;
    94d6:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    94dd:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    94e4:	e9 0f 01 00 00       	jmp    95f8 <III_stereo+0x6f7>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    94e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94ec:	8d 48 01             	lea    0x1(%eax),%ecx
    94ef:	8b 55 c8             	mov    -0x38(%ebp),%edx
    94f2:	89 d0                	mov    %edx,%eax
    94f4:	c1 e0 03             	shl    $0x3,%eax
    94f7:	01 d0                	add    %edx,%eax
    94f9:	c1 e0 02             	shl    $0x2,%eax
    94fc:	01 d0                	add    %edx,%eax
    94fe:	01 c8                	add    %ecx,%eax
    9500:	83 c0 14             	add    $0x14,%eax
    9503:	8b 0c 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%ecx
    950a:	8b 55 c8             	mov    -0x38(%ebp),%edx
    950d:	89 d0                	mov    %edx,%eax
    950f:	c1 e0 03             	shl    $0x3,%eax
    9512:	01 d0                	add    %edx,%eax
    9514:	c1 e0 02             	shl    $0x2,%eax
    9517:	01 d0                	add    %edx,%eax
    9519:	8b 55 f4             	mov    -0xc(%ebp),%edx
    951c:	01 d0                	add    %edx,%eax
    951e:	83 c0 14             	add    $0x14,%eax
    9521:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
    9528:	29 c1                	sub    %eax,%ecx
    952a:	89 c8                	mov    %ecx,%eax
    952c:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    952f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9532:	89 d0                	mov    %edx,%eax
    9534:	c1 e0 03             	shl    $0x3,%eax
    9537:	01 d0                	add    %edx,%eax
    9539:	c1 e0 02             	shl    $0x2,%eax
    953c:	01 d0                	add    %edx,%eax
    953e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9541:	01 d0                	add    %edx,%eax
    9543:	83 c0 14             	add    $0x14,%eax
    9546:	8b 14 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%edx
    954d:	89 d0                	mov    %edx,%eax
    954f:	01 c0                	add    %eax,%eax
    9551:	01 c2                	add    %eax,%edx
    9553:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9556:	83 c0 01             	add    $0x1,%eax
    9559:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    955d:	01 d0                	add    %edx,%eax
    955f:	83 e8 01             	sub    $0x1,%eax
    9562:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9565:	e9 80 00 00 00       	jmp    95ea <III_stereo+0x6e9>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    956a:	8b 45 08             	mov    0x8(%ebp),%eax
    956d:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9573:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9576:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    957b:	89 c8                	mov    %ecx,%eax
    957d:	f7 ea                	imul   %edx
    957f:	c1 fa 02             	sar    $0x2,%edx
    9582:	89 c8                	mov    %ecx,%eax
    9584:	c1 f8 1f             	sar    $0x1f,%eax
    9587:	89 d3                	mov    %edx,%ebx
    9589:	29 c3                	sub    %eax,%ebx
    958b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    958e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9593:	89 c8                	mov    %ecx,%eax
    9595:	f7 ea                	imul   %edx
    9597:	c1 fa 02             	sar    $0x2,%edx
    959a:	89 c8                	mov    %ecx,%eax
    959c:	c1 f8 1f             	sar    $0x1f,%eax
    959f:	29 c2                	sub    %eax,%edx
    95a1:	89 d0                	mov    %edx,%eax
    95a3:	c1 e0 03             	shl    $0x3,%eax
    95a6:	01 d0                	add    %edx,%eax
    95a8:	01 c0                	add    %eax,%eax
    95aa:	29 c1                	sub    %eax,%ecx
    95ac:	89 ca                	mov    %ecx,%edx
    95ae:	89 d8                	mov    %ebx,%eax
    95b0:	c1 e0 03             	shl    $0x3,%eax
    95b3:	01 d8                	add    %ebx,%eax
    95b5:	01 c0                	add    %eax,%eax
    95b7:	01 d0                	add    %edx,%eax
    95b9:	dd 04 c6             	fldl   (%esi,%eax,8)
    95bc:	d9 ee                	fldz   
    95be:	df e9                	fucomip %st(1),%st
    95c0:	7a 0a                	jp     95cc <III_stereo+0x6cb>
    95c2:	d9 ee                	fldz   
    95c4:	df e9                	fucomip %st(1),%st
    95c6:	dd d8                	fstp   %st(0)
    95c8:	74 18                	je     95e2 <III_stereo+0x6e1>
    95ca:	eb 02                	jmp    95ce <III_stereo+0x6cd>
    95cc:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    95ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    95d4:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    95db:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    95e2:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    95e6:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    95ea:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    95ee:	0f 8f 76 ff ff ff    	jg     956a <III_stereo+0x669>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    95f4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    95f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    95fc:	0f 89 e7 fe ff ff    	jns    94e9 <III_stereo+0x5e8>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    9602:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9605:	83 c0 01             	add    $0x1,%eax
    9608:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    960b:	e9 fa 00 00 00       	jmp    970a <III_stereo+0x809>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9610:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9613:	8d 48 01             	lea    0x1(%eax),%ecx
    9616:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9619:	89 d0                	mov    %edx,%eax
    961b:	c1 e0 03             	shl    $0x3,%eax
    961e:	01 d0                	add    %edx,%eax
    9620:	c1 e0 02             	shl    $0x2,%eax
    9623:	01 d0                	add    %edx,%eax
    9625:	01 c8                	add    %ecx,%eax
    9627:	83 c0 14             	add    $0x14,%eax
    962a:	8b 0c 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%ecx
    9631:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9634:	89 d0                	mov    %edx,%eax
    9636:	c1 e0 03             	shl    $0x3,%eax
    9639:	01 d0                	add    %edx,%eax
    963b:	c1 e0 02             	shl    $0x2,%eax
    963e:	01 d0                	add    %edx,%eax
    9640:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9643:	01 d0                	add    %edx,%eax
    9645:	83 c0 14             	add    $0x14,%eax
    9648:	8b 04 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%eax
    964f:	29 c1                	sub    %eax,%ecx
    9651:	89 c8                	mov    %ecx,%eax
    9653:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9656:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9659:	89 d0                	mov    %edx,%eax
    965b:	c1 e0 03             	shl    $0x3,%eax
    965e:	01 d0                	add    %edx,%eax
    9660:	c1 e0 02             	shl    $0x2,%eax
    9663:	01 d0                	add    %edx,%eax
    9665:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9668:	01 d0                	add    %edx,%eax
    966a:	83 c0 14             	add    $0x14,%eax
    966d:	8b 14 85 0c f5 00 00 	mov    0xf50c(,%eax,4),%edx
    9674:	89 d0                	mov    %edx,%eax
    9676:	01 c0                	add    %eax,%eax
    9678:	01 c2                	add    %eax,%edx
    967a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    967d:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9681:	01 d0                	add    %edx,%eax
    9683:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9686:	eb 78                	jmp    9700 <III_stereo+0x7ff>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9688:	8b 4d 10             	mov    0x10(%ebp),%ecx
    968b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    968e:	89 d0                	mov    %edx,%eax
    9690:	01 c0                	add    %eax,%eax
    9692:	01 d0                	add    %edx,%eax
    9694:	c1 e0 02             	shl    $0x2,%eax
    9697:	01 d0                	add    %edx,%eax
    9699:	8b 55 f4             	mov    -0xc(%ebp),%edx
    969c:	01 d0                	add    %edx,%eax
    969e:	83 c0 52             	add    $0x52,%eax
    96a1:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    96a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96a8:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    96af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96b2:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    96b9:	83 f8 07             	cmp    $0x7,%eax
    96bc:	74 3a                	je     96f8 <III_stereo+0x7f7>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    96be:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96c1:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    96c8:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    96ce:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    96d4:	dd 05 80 d9 00 00    	fldl   0xd980
    96da:	de c9                	fmulp  %st,%st(1)
    96dc:	83 ec 08             	sub    $0x8,%esp
    96df:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    96e3:	dd 1c 24             	fstpl  (%esp)
    96e6:	e8 84 b1 ff ff       	call   486f <tan>
    96eb:	83 c4 10             	add    $0x10,%esp
    96ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96f1:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    96f8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    96fc:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9700:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9704:	7f 82                	jg     9688 <III_stereo+0x787>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    9706:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    970a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    970e:	0f 8e fc fe ff ff    	jle    9610 <III_stereo+0x70f>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    9714:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9717:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    971d:	83 c0 7c             	add    $0x7c,%eax
    9720:	05 00 f5 00 00       	add    $0xf500,%eax
    9725:	8b 50 0c             	mov    0xc(%eax),%edx
    9728:	8b 45 c8             	mov    -0x38(%ebp),%eax
    972b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9731:	83 c0 78             	add    $0x78,%eax
    9734:	05 00 f5 00 00       	add    $0xf500,%eax
    9739:	8b 40 0c             	mov    0xc(%eax),%eax
    973c:	29 c2                	sub    %eax,%edx
    973e:	89 d0                	mov    %edx,%eax
    9740:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9743:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9746:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    974c:	83 c0 78             	add    $0x78,%eax
    974f:	05 00 f5 00 00       	add    $0xf500,%eax
    9754:	8b 50 0c             	mov    0xc(%eax),%edx
    9757:	89 d0                	mov    %edx,%eax
    9759:	01 c0                	add    %eax,%eax
    975b:	01 c2                	add    %eax,%edx
    975d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9760:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9764:	01 d0                	add    %edx,%eax
    9766:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9769:	8b 45 c8             	mov    -0x38(%ebp),%eax
    976c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9772:	83 e8 80             	sub    $0xffffff80,%eax
    9775:	05 00 f5 00 00       	add    $0xf500,%eax
    977a:	8b 50 0c             	mov    0xc(%eax),%edx
    977d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9780:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9786:	83 c0 7c             	add    $0x7c,%eax
    9789:	05 00 f5 00 00       	add    $0xf500,%eax
    978e:	8b 40 0c             	mov    0xc(%eax),%eax
    9791:	29 c2                	sub    %eax,%edx
    9793:	89 d0                	mov    %edx,%eax
    9795:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9798:	8b 45 c8             	mov    -0x38(%ebp),%eax
    979b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    97a1:	83 c0 7c             	add    $0x7c,%eax
    97a4:	05 00 f5 00 00       	add    $0xf500,%eax
    97a9:	8b 50 0c             	mov    0xc(%eax),%edx
    97ac:	89 d0                	mov    %edx,%eax
    97ae:	01 c0                	add    %eax,%eax
    97b0:	01 c2                	add    %eax,%edx
    97b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    97b5:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    97b9:	01 d0                	add    %edx,%eax
    97bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    97be:	eb 30                	jmp    97f0 <III_stereo+0x8ef>
               {  is_pos[i] = is_pos[sfb];
    97c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97c3:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    97ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    97cd:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    97d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97d7:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    97de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    97e1:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    97e8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    97ec:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    97f0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    97f4:	7f ca                	jg     97c0 <III_stereo+0x8bf>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    97f6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    97fa:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    97fe:	0f 8e d2 fc ff ff    	jle    94d6 <III_stereo+0x5d5>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    9804:	e9 00 02 00 00       	jmp    9a09 <III_stereo+0xb08>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    9809:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    9810:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    9817:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    981e:	eb 63                	jmp    9883 <III_stereo+0x982>
         {  if ( xr[1][i][ss] != 0.0 )
    9820:	8b 45 08             	mov    0x8(%ebp),%eax
    9823:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9829:	8b 55 f0             	mov    -0x10(%ebp),%edx
    982c:	89 d0                	mov    %edx,%eax
    982e:	c1 e0 03             	shl    $0x3,%eax
    9831:	01 d0                	add    %edx,%eax
    9833:	01 c0                	add    %eax,%eax
    9835:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9838:	01 d0                	add    %edx,%eax
    983a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    983d:	d9 ee                	fldz   
    983f:	df e9                	fucomip %st(1),%st
    9841:	7a 0a                	jp     984d <III_stereo+0x94c>
    9843:	d9 ee                	fldz   
    9845:	df e9                	fucomip %st(1),%st
    9847:	dd d8                	fstp   %st(0)
    9849:	74 23                	je     986e <III_stereo+0x96d>
    984b:	eb 02                	jmp    984f <III_stereo+0x94e>
    984d:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    984f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9852:	89 d0                	mov    %edx,%eax
    9854:	c1 e0 03             	shl    $0x3,%eax
    9857:	01 d0                	add    %edx,%eax
    9859:	01 c0                	add    %eax,%eax
    985b:	89 c2                	mov    %eax,%edx
    985d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9860:	01 d0                	add    %edx,%eax
    9862:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    9865:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    986c:	eb 15                	jmp    9883 <III_stereo+0x982>
            } else
            {  ss--;
    986e:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    9872:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9876:	79 0b                	jns    9883 <III_stereo+0x982>
               {  i--;
    9878:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    987c:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    9883:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9887:	79 97                	jns    9820 <III_stereo+0x91f>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    9889:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9890:	eb 04                	jmp    9896 <III_stereo+0x995>
            i++;
    9892:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9896:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9899:	89 d0                	mov    %edx,%eax
    989b:	c1 e0 03             	shl    $0x3,%eax
    989e:	01 d0                	add    %edx,%eax
    98a0:	c1 e0 02             	shl    $0x2,%eax
    98a3:	01 d0                	add    %edx,%eax
    98a5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    98a8:	01 d0                	add    %edx,%eax
    98aa:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    98b1:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    98b4:	7e dc                	jle    9892 <III_stereo+0x991>
            i++;
         sfb = i;
    98b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    98b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    98bc:	8b 55 c8             	mov    -0x38(%ebp),%edx
    98bf:	89 d0                	mov    %edx,%eax
    98c1:	c1 e0 03             	shl    $0x3,%eax
    98c4:	01 d0                	add    %edx,%eax
    98c6:	c1 e0 02             	shl    $0x2,%eax
    98c9:	01 d0                	add    %edx,%eax
    98cb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    98ce:	01 d0                	add    %edx,%eax
    98d0:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    98d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    98da:	e9 b3 00 00 00       	jmp    9992 <III_stereo+0xa91>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    98df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98e2:	8d 48 01             	lea    0x1(%eax),%ecx
    98e5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    98e8:	89 d0                	mov    %edx,%eax
    98ea:	c1 e0 03             	shl    $0x3,%eax
    98ed:	01 d0                	add    %edx,%eax
    98ef:	c1 e0 02             	shl    $0x2,%eax
    98f2:	01 d0                	add    %edx,%eax
    98f4:	01 c8                	add    %ecx,%eax
    98f6:	8b 0c 85 00 f5 00 00 	mov    0xf500(,%eax,4),%ecx
    98fd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9900:	89 d0                	mov    %edx,%eax
    9902:	c1 e0 03             	shl    $0x3,%eax
    9905:	01 d0                	add    %edx,%eax
    9907:	c1 e0 02             	shl    $0x2,%eax
    990a:	01 d0                	add    %edx,%eax
    990c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    990f:	01 d0                	add    %edx,%eax
    9911:	8b 04 85 00 f5 00 00 	mov    0xf500(,%eax,4),%eax
    9918:	29 c1                	sub    %eax,%ecx
    991a:	89 c8                	mov    %ecx,%eax
    991c:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    991f:	eb 67                	jmp    9988 <III_stereo+0xa87>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    9921:	8b 45 10             	mov    0x10(%ebp),%eax
    9924:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9927:	83 c2 3e             	add    $0x3e,%edx
    992a:	8b 14 90             	mov    (%eax,%edx,4),%edx
    992d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9930:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    9937:	8b 45 f0             	mov    -0x10(%ebp),%eax
    993a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9941:	83 f8 07             	cmp    $0x7,%eax
    9944:	74 3a                	je     9980 <III_stereo+0xa7f>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9946:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9949:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9950:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9956:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    995c:	dd 05 80 d9 00 00    	fldl   0xd980
    9962:	de c9                	fmulp  %st,%st(1)
    9964:	83 ec 08             	sub    $0x8,%esp
    9967:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    996b:	dd 1c 24             	fstpl  (%esp)
    996e:	e8 fc ae ff ff       	call   486f <tan>
    9973:	83 c4 10             	add    $0x10,%esp
    9976:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9979:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    9980:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    9984:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9988:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    998c:	7f 93                	jg     9921 <III_stereo+0xa20>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    998e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9992:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    9996:	0f 8e 43 ff ff ff    	jle    98df <III_stereo+0x9de>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    999c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    999f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    99a5:	83 c0 50             	add    $0x50,%eax
    99a8:	05 00 f5 00 00       	add    $0xf500,%eax
    99ad:	8b 00                	mov    (%eax),%eax
    99af:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    99b2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    99b5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    99bb:	83 c0 54             	add    $0x54,%eax
    99be:	05 00 f5 00 00       	add    $0xf500,%eax
    99c3:	8b 00                	mov    (%eax),%eax
    99c5:	ba 40 02 00 00       	mov    $0x240,%edx
    99ca:	29 c2                	sub    %eax,%edx
    99cc:	89 d0                	mov    %edx,%eax
    99ce:	89 45 e8             	mov    %eax,-0x18(%ebp)
    99d1:	eb 30                	jmp    9a03 <III_stereo+0xb02>
         {  is_pos[i] = is_pos[sfb];
    99d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99d6:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    99dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    99e0:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    99e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99ea:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    99f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    99f4:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    99fb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    99ff:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9a03:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9a07:	7f ca                	jg     99d3 <III_stereo+0xad2>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    9a09:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9a10:	eb 55                	jmp    9a67 <III_stereo+0xb66>
      for(sb=0;sb<SBLIMIT;sb++)
    9a12:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9a19:	eb 42                	jmp    9a5d <III_stereo+0xb5c>
         for(ss=0;ss<SSLIMIT;ss++)
    9a1b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9a22:	eb 2f                	jmp    9a53 <III_stereo+0xb52>
            lr[ch][sb][ss] = 0;
    9a24:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9a27:	89 d0                	mov    %edx,%eax
    9a29:	c1 e0 03             	shl    $0x3,%eax
    9a2c:	01 d0                	add    %edx,%eax
    9a2e:	c1 e0 09             	shl    $0x9,%eax
    9a31:	89 c2                	mov    %eax,%edx
    9a33:	8b 45 0c             	mov    0xc(%ebp),%eax
    9a36:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9a39:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a3c:	89 d0                	mov    %edx,%eax
    9a3e:	c1 e0 03             	shl    $0x3,%eax
    9a41:	01 d0                	add    %edx,%eax
    9a43:	01 c0                	add    %eax,%eax
    9a45:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9a48:	01 d0                	add    %edx,%eax
    9a4a:	d9 ee                	fldz   
    9a4c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    9a4f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9a53:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9a57:	7e cb                	jle    9a24 <III_stereo+0xb23>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    9a59:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9a5d:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9a61:	7e b8                	jle    9a1b <III_stereo+0xb1a>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    9a63:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9a67:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    9a6b:	7e a5                	jle    9a12 <III_stereo+0xb11>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    9a6d:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9a71:	0f 85 3b 02 00 00    	jne    9cb2 <III_stereo+0xdb1>
      for(sb=0;sb<SBLIMIT;sb++)
    9a77:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9a7e:	e9 23 02 00 00       	jmp    9ca6 <III_stereo+0xda5>
         for(ss=0;ss<SSLIMIT;ss++) {
    9a83:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9a8a:	e9 09 02 00 00       	jmp    9c98 <III_stereo+0xd97>
            i = (sb*18)+ss;
    9a8f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a92:	89 d0                	mov    %edx,%eax
    9a94:	c1 e0 03             	shl    $0x3,%eax
    9a97:	01 d0                	add    %edx,%eax
    9a99:	01 c0                	add    %eax,%eax
    9a9b:	89 c2                	mov    %eax,%edx
    9a9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9aa0:	01 d0                	add    %edx,%eax
    9aa2:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    9aa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9aa8:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9aaf:	83 f8 07             	cmp    $0x7,%eax
    9ab2:	0f 85 2c 01 00 00    	jne    9be4 <III_stereo+0xce3>
               if ( ms_stereo ) {
    9ab8:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    9abc:	0f 84 b5 00 00 00    	je     9b77 <III_stereo+0xc76>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    9ac2:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9ac5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9ac8:	89 d0                	mov    %edx,%eax
    9aca:	c1 e0 03             	shl    $0x3,%eax
    9acd:	01 d0                	add    %edx,%eax
    9acf:	01 c0                	add    %eax,%eax
    9ad1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ad4:	01 d0                	add    %edx,%eax
    9ad6:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9ad9:	8b 45 08             	mov    0x8(%ebp),%eax
    9adc:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9ae2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9ae5:	89 d0                	mov    %edx,%eax
    9ae7:	c1 e0 03             	shl    $0x3,%eax
    9aea:	01 d0                	add    %edx,%eax
    9aec:	01 c0                	add    %eax,%eax
    9aee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9af1:	01 d0                	add    %edx,%eax
    9af3:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9af6:	de c1                	faddp  %st,%st(1)
    9af8:	dd 05 88 d9 00 00    	fldl   0xd988
    9afe:	de f9                	fdivrp %st,%st(1)
    9b00:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9b03:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b06:	89 d0                	mov    %edx,%eax
    9b08:	c1 e0 03             	shl    $0x3,%eax
    9b0b:	01 d0                	add    %edx,%eax
    9b0d:	01 c0                	add    %eax,%eax
    9b0f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b12:	01 d0                	add    %edx,%eax
    9b14:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    9b17:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b1a:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9b20:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9b23:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b26:	89 d0                	mov    %edx,%eax
    9b28:	c1 e0 03             	shl    $0x3,%eax
    9b2b:	01 d0                	add    %edx,%eax
    9b2d:	01 c0                	add    %eax,%eax
    9b2f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b32:	01 d0                	add    %edx,%eax
    9b34:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9b37:	8b 45 08             	mov    0x8(%ebp),%eax
    9b3a:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9b40:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b43:	89 d0                	mov    %edx,%eax
    9b45:	c1 e0 03             	shl    $0x3,%eax
    9b48:	01 d0                	add    %edx,%eax
    9b4a:	01 c0                	add    %eax,%eax
    9b4c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b4f:	01 d0                	add    %edx,%eax
    9b51:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9b54:	de e9                	fsubrp %st,%st(1)
    9b56:	dd 05 88 d9 00 00    	fldl   0xd988
    9b5c:	de f9                	fdivrp %st,%st(1)
    9b5e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b61:	89 d0                	mov    %edx,%eax
    9b63:	c1 e0 03             	shl    $0x3,%eax
    9b66:	01 d0                	add    %edx,%eax
    9b68:	01 c0                	add    %eax,%eax
    9b6a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b6d:	01 d0                	add    %edx,%eax
    9b6f:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    9b72:	e9 1d 01 00 00       	jmp    9c94 <III_stereo+0xd93>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    9b77:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9b7a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b7d:	89 d0                	mov    %edx,%eax
    9b7f:	c1 e0 03             	shl    $0x3,%eax
    9b82:	01 d0                	add    %edx,%eax
    9b84:	01 c0                	add    %eax,%eax
    9b86:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b89:	01 d0                	add    %edx,%eax
    9b8b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9b8e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9b91:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b94:	89 d0                	mov    %edx,%eax
    9b96:	c1 e0 03             	shl    $0x3,%eax
    9b99:	01 d0                	add    %edx,%eax
    9b9b:	01 c0                	add    %eax,%eax
    9b9d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ba0:	01 d0                	add    %edx,%eax
    9ba2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    9ba5:	8b 45 0c             	mov    0xc(%ebp),%eax
    9ba8:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9bae:	8b 45 08             	mov    0x8(%ebp),%eax
    9bb1:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9bb7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9bba:	89 d0                	mov    %edx,%eax
    9bbc:	c1 e0 03             	shl    $0x3,%eax
    9bbf:	01 d0                	add    %edx,%eax
    9bc1:	01 c0                	add    %eax,%eax
    9bc3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9bc6:	01 d0                	add    %edx,%eax
    9bc8:	dd 04 c3             	fldl   (%ebx,%eax,8)
    9bcb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9bce:	89 d0                	mov    %edx,%eax
    9bd0:	c1 e0 03             	shl    $0x3,%eax
    9bd3:	01 d0                	add    %edx,%eax
    9bd5:	01 c0                	add    %eax,%eax
    9bd7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9bda:	01 d0                	add    %edx,%eax
    9bdc:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    9bdf:	e9 b0 00 00 00       	jmp    9c94 <III_stereo+0xd93>
               }
            }
            else if (i_stereo ) {
    9be4:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9be8:	0f 84 94 00 00 00    	je     9c82 <III_stereo+0xd81>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    9bee:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9bf1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9bf4:	89 d0                	mov    %edx,%eax
    9bf6:	c1 e0 03             	shl    $0x3,%eax
    9bf9:	01 d0                	add    %edx,%eax
    9bfb:	01 c0                	add    %eax,%eax
    9bfd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c00:	01 d0                	add    %edx,%eax
    9c02:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9c05:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c08:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9c0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c12:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9c19:	d9 e8                	fld1   
    9c1b:	de c1                	faddp  %st,%st(1)
    9c1d:	de f9                	fdivrp %st,%st(1)
    9c1f:	de c9                	fmulp  %st,%st(1)
    9c21:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9c24:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9c27:	89 d0                	mov    %edx,%eax
    9c29:	c1 e0 03             	shl    $0x3,%eax
    9c2c:	01 d0                	add    %edx,%eax
    9c2e:	01 c0                	add    %eax,%eax
    9c30:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c33:	01 d0                	add    %edx,%eax
    9c35:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    9c38:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c3b:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9c41:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9c44:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9c47:	89 d0                	mov    %edx,%eax
    9c49:	c1 e0 03             	shl    $0x3,%eax
    9c4c:	01 d0                	add    %edx,%eax
    9c4e:	01 c0                	add    %eax,%eax
    9c50:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c53:	01 d0                	add    %edx,%eax
    9c55:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9c58:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c5b:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9c62:	d9 e8                	fld1   
    9c64:	de c1                	faddp  %st,%st(1)
    9c66:	d9 e8                	fld1   
    9c68:	de f1                	fdivp  %st,%st(1)
    9c6a:	de c9                	fmulp  %st,%st(1)
    9c6c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9c6f:	89 d0                	mov    %edx,%eax
    9c71:	c1 e0 03             	shl    $0x3,%eax
    9c74:	01 d0                	add    %edx,%eax
    9c76:	01 c0                	add    %eax,%eax
    9c78:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c7b:	01 d0                	add    %edx,%eax
    9c7d:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    9c80:	eb 12                	jmp    9c94 <III_stereo+0xd93>
            }
            else {
               printf(0,"Error in streo processing\n");
    9c82:	83 ec 08             	sub    $0x8,%esp
    9c85:	68 00 c9 00 00       	push   $0xc900
    9c8a:	6a 00                	push   $0x0
    9c8c:	e8 4a a7 ff ff       	call   43db <printf>
    9c91:	83 c4 10             	add    $0x10,%esp
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    9c94:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9c98:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9c9c:	0f 8e ed fd ff ff    	jle    9a8f <III_stereo+0xb8e>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    9ca2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9ca6:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9caa:	0f 8e d3 fd ff ff    	jle    9a83 <III_stereo+0xb82>
    9cb0:	eb 54                	jmp    9d06 <III_stereo+0xe05>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    9cb2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9cb9:	eb 45                	jmp    9d00 <III_stereo+0xdff>
         for(ss=0;ss<SSLIMIT;ss++)
    9cbb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9cc2:	eb 32                	jmp    9cf6 <III_stereo+0xdf5>
            lr[0][sb][ss] = xr[0][sb][ss];
    9cc4:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9cc7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9cca:	89 d0                	mov    %edx,%eax
    9ccc:	c1 e0 03             	shl    $0x3,%eax
    9ccf:	01 d0                	add    %edx,%eax
    9cd1:	01 c0                	add    %eax,%eax
    9cd3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9cd6:	01 d0                	add    %edx,%eax
    9cd8:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9cdb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9cde:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9ce1:	89 d0                	mov    %edx,%eax
    9ce3:	c1 e0 03             	shl    $0x3,%eax
    9ce6:	01 d0                	add    %edx,%eax
    9ce8:	01 c0                	add    %eax,%eax
    9cea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ced:	01 d0                	add    %edx,%eax
    9cef:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    9cf2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9cf6:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9cfa:	7e c8                	jle    9cc4 <III_stereo+0xdc3>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    9cfc:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9d00:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9d04:	7e b5                	jle    9cbb <III_stereo+0xdba>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    9d06:	8d 65 f8             	lea    -0x8(%ebp),%esp
    9d09:	5b                   	pop    %ebx
    9d0a:	5e                   	pop    %esi
    9d0b:	5d                   	pop    %ebp
    9d0c:	c3                   	ret    

00009d0d <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9d0d:	55                   	push   %ebp
    9d0e:	89 e5                	mov    %esp,%ebp
    9d10:	83 ec 38             	sub    $0x38,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    9d13:	a1 80 f7 00 00       	mov    0xf780,%eax
    9d18:	85 c0                	test   %eax,%eax
    9d1a:	74 72                	je     9d8e <III_antialias+0x81>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9d1c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9d23:	eb 59                	jmp    9d7e <III_antialias+0x71>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    9d25:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d28:	dd 04 c5 40 f7 00 00 	fldl   0xf740(,%eax,8)
    9d2f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d32:	dd 04 c5 40 f7 00 00 	fldl   0xf740(,%eax,8)
    9d39:	de c9                	fmulp  %st,%st(1)
    9d3b:	d9 e8                	fld1   
    9d3d:	de c1                	faddp  %st,%st(1)
    9d3f:	83 ec 08             	sub    $0x8,%esp
    9d42:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9d46:	dd 1c 24             	fstpl  (%esp)
    9d49:	e8 e4 ac ff ff       	call   4a32 <sqrt>
    9d4e:	83 c4 10             	add    $0x10,%esp
    9d51:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    9d54:	d9 e8                	fld1   
    9d56:	dc 75 e0             	fdivl  -0x20(%ebp)
    9d59:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d5c:	dd 1c c5 40 f8 00 00 	fstpl  0xf840(,%eax,8)
         ca[i] = Ci[i]/sq;
    9d63:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d66:	dd 04 c5 40 f7 00 00 	fldl   0xf740(,%eax,8)
    9d6d:	dc 75 e0             	fdivl  -0x20(%ebp)
    9d70:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9d73:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9d7a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9d7e:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    9d82:	7e a1                	jle    9d25 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    9d84:	c7 05 80 f7 00 00 00 	movl   $0x0,0xf780
    9d8b:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9d8e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9d95:	eb 4c                	jmp    9de3 <III_antialias+0xd6>
       for(ss=0;ss<SSLIMIT;ss++)
    9d97:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9d9e:	eb 39                	jmp    9dd9 <III_antialias+0xcc>
          hybridIn[sb][ss] = xr[sb][ss];
    9da0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9da3:	89 d0                	mov    %edx,%eax
    9da5:	c1 e0 03             	shl    $0x3,%eax
    9da8:	01 d0                	add    %edx,%eax
    9daa:	c1 e0 04             	shl    $0x4,%eax
    9dad:	89 c2                	mov    %eax,%edx
    9daf:	8b 45 0c             	mov    0xc(%ebp),%eax
    9db2:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9db5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9db8:	89 d0                	mov    %edx,%eax
    9dba:	c1 e0 03             	shl    $0x3,%eax
    9dbd:	01 d0                	add    %edx,%eax
    9dbf:	c1 e0 04             	shl    $0x4,%eax
    9dc2:	89 c2                	mov    %eax,%edx
    9dc4:	8b 45 08             	mov    0x8(%ebp),%eax
    9dc7:	01 c2                	add    %eax,%edx
    9dc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9dcc:	dd 04 c2             	fldl   (%edx,%eax,8)
    9dcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9dd2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    9dd5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9dd9:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9ddd:	7e c1                	jle    9da0 <III_antialias+0x93>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9ddf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9de3:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    9de7:	7e ae                	jle    9d97 <III_antialias+0x8a>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    9de9:	8b 45 10             	mov    0x10(%ebp),%eax
    9dec:	8b 40 10             	mov    0x10(%eax),%eax
    9def:	85 c0                	test   %eax,%eax
    9df1:	74 1a                	je     9e0d <III_antialias+0x100>
    9df3:	8b 45 10             	mov    0x10(%ebp),%eax
    9df6:	8b 40 14             	mov    0x14(%eax),%eax
    9df9:	83 f8 02             	cmp    $0x2,%eax
    9dfc:	75 0f                	jne    9e0d <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    9dfe:	8b 45 10             	mov    0x10(%ebp),%eax
    9e01:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    9e04:	85 c0                	test   %eax,%eax
    9e06:	75 05                	jne    9e0d <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    9e08:	e9 1c 01 00 00       	jmp    9f29 <III_antialias+0x21c>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9e0d:	8b 45 10             	mov    0x10(%ebp),%eax
    9e10:	8b 40 10             	mov    0x10(%eax),%eax
    9e13:	85 c0                	test   %eax,%eax
    9e15:	74 1e                	je     9e35 <III_antialias+0x128>
    9e17:	8b 45 10             	mov    0x10(%ebp),%eax
    9e1a:	8b 40 18             	mov    0x18(%eax),%eax
    9e1d:	85 c0                	test   %eax,%eax
    9e1f:	74 14                	je     9e35 <III_antialias+0x128>
     (gr_info->block_type == 2))
    9e21:	8b 45 10             	mov    0x10(%ebp),%eax
    9e24:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9e27:	83 f8 02             	cmp    $0x2,%eax
    9e2a:	75 09                	jne    9e35 <III_antialias+0x128>
     (gr_info->block_type == 2))
      sblim = 1;
    9e2c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    9e33:	eb 07                	jmp    9e3c <III_antialias+0x12f>
   else
      sblim = SBLIMIT-1;
    9e35:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9e3c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9e43:	e9 d5 00 00 00       	jmp    9f1d <III_antialias+0x210>
      for(ss=0;ss<8;ss++) {
    9e48:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9e4f:	e9 bb 00 00 00       	jmp    9f0f <III_antialias+0x202>
         bu = xr[sb][17-ss];
    9e54:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9e57:	89 d0                	mov    %edx,%eax
    9e59:	c1 e0 03             	shl    $0x3,%eax
    9e5c:	01 d0                	add    %edx,%eax
    9e5e:	c1 e0 04             	shl    $0x4,%eax
    9e61:	89 c2                	mov    %eax,%edx
    9e63:	8b 45 08             	mov    0x8(%ebp),%eax
    9e66:	01 c2                	add    %eax,%edx
    9e68:	b8 11 00 00 00       	mov    $0x11,%eax
    9e6d:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9e70:	dd 04 c2             	fldl   (%edx,%eax,8)
    9e73:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    9e76:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e79:	8d 50 01             	lea    0x1(%eax),%edx
    9e7c:	89 d0                	mov    %edx,%eax
    9e7e:	c1 e0 03             	shl    $0x3,%eax
    9e81:	01 d0                	add    %edx,%eax
    9e83:	c1 e0 04             	shl    $0x4,%eax
    9e86:	89 c2                	mov    %eax,%edx
    9e88:	8b 45 08             	mov    0x8(%ebp),%eax
    9e8b:	01 c2                	add    %eax,%edx
    9e8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e90:	dd 04 c2             	fldl   (%edx,%eax,8)
    9e93:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    9e96:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9e99:	89 d0                	mov    %edx,%eax
    9e9b:	c1 e0 03             	shl    $0x3,%eax
    9e9e:	01 d0                	add    %edx,%eax
    9ea0:	c1 e0 04             	shl    $0x4,%eax
    9ea3:	89 c2                	mov    %eax,%edx
    9ea5:	8b 45 0c             	mov    0xc(%ebp),%eax
    9ea8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9eab:	b8 11 00 00 00       	mov    $0x11,%eax
    9eb0:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9eb3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9eb6:	dd 04 d5 40 f8 00 00 	fldl   0xf840(,%edx,8)
    9ebd:	dc 4d d8             	fmull  -0x28(%ebp)
    9ec0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9ec3:	dd 04 d5 80 f8 00 00 	fldl   0xf880(,%edx,8)
    9eca:	dc 4d d0             	fmull  -0x30(%ebp)
    9ecd:	de e9                	fsubrp %st,%st(1)
    9ecf:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    9ed2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ed5:	8d 50 01             	lea    0x1(%eax),%edx
    9ed8:	89 d0                	mov    %edx,%eax
    9eda:	c1 e0 03             	shl    $0x3,%eax
    9edd:	01 d0                	add    %edx,%eax
    9edf:	c1 e0 04             	shl    $0x4,%eax
    9ee2:	89 c2                	mov    %eax,%edx
    9ee4:	8b 45 0c             	mov    0xc(%ebp),%eax
    9ee7:	01 c2                	add    %eax,%edx
    9ee9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9eec:	dd 04 c5 40 f8 00 00 	fldl   0xf840(,%eax,8)
    9ef3:	dc 4d d0             	fmull  -0x30(%ebp)
    9ef6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ef9:	dd 04 c5 80 f8 00 00 	fldl   0xf880(,%eax,8)
    9f00:	dc 4d d8             	fmull  -0x28(%ebp)
    9f03:	de c1                	faddp  %st,%st(1)
    9f05:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f08:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    9f0b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9f0f:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    9f13:	0f 8e 3b ff ff ff    	jle    9e54 <III_antialias+0x147>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9f19:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9f1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f20:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    9f23:	0f 8c 1f ff ff ff    	jl     9e48 <III_antialias+0x13b>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    9f29:	c9                   	leave  
    9f2a:	c3                   	ret    

00009f2b <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    9f2b:	55                   	push   %ebp
    9f2c:	89 e5                	mov    %esp,%ebp
    9f2e:	81 ec 98 00 00 00    	sub    $0x98,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    9f34:	a1 c0 f8 00 00       	mov    0xf8c0,%eax
    9f39:	85 c0                	test   %eax,%eax
    9f3b:	0f 85 9f 02 00 00    	jne    a1e0 <inv_mdct+0x2b5>

    /* type 0 */
      for(i=0;i<36;i++)
    9f41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f48:	eb 33                	jmp    9f7d <inv_mdct+0x52>
         win[0][i] = sin( PI/36 *(i+0.5) );
    9f4a:	db 45 f4             	fildl  -0xc(%ebp)
    9f4d:	dd 05 90 d9 00 00    	fldl   0xd990
    9f53:	de c1                	faddp  %st,%st(1)
    9f55:	dd 05 98 d9 00 00    	fldl   0xd998
    9f5b:	de c9                	fmulp  %st,%st(1)
    9f5d:	83 ec 08             	sub    $0x8,%esp
    9f60:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9f64:	dd 1c 24             	fstpl  (%esp)
    9f67:	e8 38 a8 ff ff       	call   47a4 <sin>
    9f6c:	83 c4 10             	add    $0x10,%esp
    9f6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f72:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    9f79:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9f7d:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9f81:	7e c7                	jle    9f4a <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9f83:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f8a:	eb 36                	jmp    9fc2 <inv_mdct+0x97>
         win[1][i] = sin( PI/36 *(i+0.5) );
    9f8c:	db 45 f4             	fildl  -0xc(%ebp)
    9f8f:	dd 05 90 d9 00 00    	fldl   0xd990
    9f95:	de c1                	faddp  %st,%st(1)
    9f97:	dd 05 98 d9 00 00    	fldl   0xd998
    9f9d:	de c9                	fmulp  %st,%st(1)
    9f9f:	83 ec 08             	sub    $0x8,%esp
    9fa2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9fa6:	dd 1c 24             	fstpl  (%esp)
    9fa9:	e8 f6 a7 ff ff       	call   47a4 <sin>
    9fae:	83 c4 10             	add    $0x10,%esp
    9fb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fb4:	83 c0 24             	add    $0x24,%eax
    9fb7:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9fbe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9fc2:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9fc6:	7e c4                	jle    9f8c <inv_mdct+0x61>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9fc8:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9fcf:	eb 13                	jmp    9fe4 <inv_mdct+0xb9>
         win[1][i] = 1.0;
    9fd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fd4:	83 c0 24             	add    $0x24,%eax
    9fd7:	d9 e8                	fld1   
    9fd9:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9fe0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9fe4:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    9fe8:	7e e7                	jle    9fd1 <inv_mdct+0xa6>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9fea:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    9ff1:	eb 3e                	jmp    a031 <inv_mdct+0x106>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    9ff3:	db 45 f4             	fildl  -0xc(%ebp)
    9ff6:	dd 05 90 d9 00 00    	fldl   0xd990
    9ffc:	de c1                	faddp  %st,%st(1)
    9ffe:	dd 05 a0 d9 00 00    	fldl   0xd9a0
    a004:	de e9                	fsubrp %st,%st(1)
    a006:	dd 05 80 d9 00 00    	fldl   0xd980
    a00c:	de c9                	fmulp  %st,%st(1)
    a00e:	83 ec 08             	sub    $0x8,%esp
    a011:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a015:	dd 1c 24             	fstpl  (%esp)
    a018:	e8 87 a7 ff ff       	call   47a4 <sin>
    a01d:	83 c4 10             	add    $0x10,%esp
    a020:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a023:	83 c0 24             	add    $0x24,%eax
    a026:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    a02d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a031:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    a035:	7e bc                	jle    9ff3 <inv_mdct+0xc8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a037:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    a03e:	eb 13                	jmp    a053 <inv_mdct+0x128>
         win[1][i] = 0.0;
    a040:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a043:	83 c0 24             	add    $0x24,%eax
    a046:	d9 ee                	fldz   
    a048:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a04f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a053:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a057:	7e e7                	jle    a040 <inv_mdct+0x115>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a059:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a060:	eb 13                	jmp    a075 <inv_mdct+0x14a>
         win[3][i] = 0.0;
    a062:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a065:	83 c0 6c             	add    $0x6c,%eax
    a068:	d9 ee                	fldz   
    a06a:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a071:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a075:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    a079:	7e e7                	jle    a062 <inv_mdct+0x137>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a07b:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    a082:	eb 3e                	jmp    a0c2 <inv_mdct+0x197>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    a084:	db 45 f4             	fildl  -0xc(%ebp)
    a087:	dd 05 90 d9 00 00    	fldl   0xd990
    a08d:	de c1                	faddp  %st,%st(1)
    a08f:	dd 05 a8 d9 00 00    	fldl   0xd9a8
    a095:	de e9                	fsubrp %st,%st(1)
    a097:	dd 05 80 d9 00 00    	fldl   0xd980
    a09d:	de c9                	fmulp  %st,%st(1)
    a09f:	83 ec 08             	sub    $0x8,%esp
    a0a2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a0a6:	dd 1c 24             	fstpl  (%esp)
    a0a9:	e8 f6 a6 ff ff       	call   47a4 <sin>
    a0ae:	83 c4 10             	add    $0x10,%esp
    a0b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0b4:	83 c0 6c             	add    $0x6c,%eax
    a0b7:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a0be:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a0c2:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a0c6:	7e bc                	jle    a084 <inv_mdct+0x159>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a0c8:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a0cf:	eb 13                	jmp    a0e4 <inv_mdct+0x1b9>
         win[3][i] =1.0;
    a0d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0d4:	83 c0 6c             	add    $0x6c,%eax
    a0d7:	d9 e8                	fld1   
    a0d9:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a0e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a0e4:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a0e8:	7e e7                	jle    a0d1 <inv_mdct+0x1a6>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a0ea:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    a0f1:	eb 36                	jmp    a129 <inv_mdct+0x1fe>
         win[3][i] = sin( PI/36*(i+0.5) );
    a0f3:	db 45 f4             	fildl  -0xc(%ebp)
    a0f6:	dd 05 90 d9 00 00    	fldl   0xd990
    a0fc:	de c1                	faddp  %st,%st(1)
    a0fe:	dd 05 98 d9 00 00    	fldl   0xd998
    a104:	de c9                	fmulp  %st,%st(1)
    a106:	83 ec 08             	sub    $0x8,%esp
    a109:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a10d:	dd 1c 24             	fstpl  (%esp)
    a110:	e8 8f a6 ff ff       	call   47a4 <sin>
    a115:	83 c4 10             	add    $0x10,%esp
    a118:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a11b:	83 c0 6c             	add    $0x6c,%eax
    a11e:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a125:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a129:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a12d:	7e c4                	jle    a0f3 <inv_mdct+0x1c8>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a12f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a136:	eb 36                	jmp    a16e <inv_mdct+0x243>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    a138:	db 45 f4             	fildl  -0xc(%ebp)
    a13b:	dd 05 90 d9 00 00    	fldl   0xd990
    a141:	de c1                	faddp  %st,%st(1)
    a143:	dd 05 80 d9 00 00    	fldl   0xd980
    a149:	de c9                	fmulp  %st,%st(1)
    a14b:	83 ec 08             	sub    $0x8,%esp
    a14e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a152:	dd 1c 24             	fstpl  (%esp)
    a155:	e8 4a a6 ff ff       	call   47a4 <sin>
    a15a:	83 c4 10             	add    $0x10,%esp
    a15d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a160:	83 c0 48             	add    $0x48,%eax
    a163:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a16a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a16e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a172:	7e c4                	jle    a138 <inv_mdct+0x20d>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a174:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a17b:	eb 13                	jmp    a190 <inv_mdct+0x265>
         win[2][i] = 0.0 ;
    a17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a180:	83 c0 48             	add    $0x48,%eax
    a183:	d9 ee                	fldz   
    a185:	dd 1c c5 00 f9 00 00 	fstpl  0xf900(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a18c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a190:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a194:	7e e7                	jle    a17d <inv_mdct+0x252>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a196:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a19d:	eb 2b                	jmp    a1ca <inv_mdct+0x29f>
         COS[i] = cos(PI/(2*36) * i);
    a19f:	db 45 f4             	fildl  -0xc(%ebp)
    a1a2:	dd 05 b0 d9 00 00    	fldl   0xd9b0
    a1a8:	de c9                	fmulp  %st,%st(1)
    a1aa:	83 ec 08             	sub    $0x8,%esp
    a1ad:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a1b1:	dd 1c 24             	fstpl  (%esp)
    a1b4:	e8 8a a6 ff ff       	call   4843 <cos>
    a1b9:	83 c4 10             	add    $0x10,%esp
    a1bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a1bf:	dd 1c c5 80 fd 00 00 	fstpl  0xfd80(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a1c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a1ca:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    a1d1:	7e cc                	jle    a19f <inv_mdct+0x274>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    a1d3:	a1 c0 f8 00 00       	mov    0xf8c0,%eax
    a1d8:	83 c0 01             	add    $0x1,%eax
    a1db:	a3 c0 f8 00 00       	mov    %eax,0xf8c0
    }

    for(i=0;i<36;i++)
    a1e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a1e7:	eb 17                	jmp    a200 <inv_mdct+0x2d5>
       out[i]=0;
    a1e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a1ec:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a1f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    a1f6:	01 d0                	add    %edx,%eax
    a1f8:	d9 ee                	fldz   
    a1fa:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    a1fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a200:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a204:	7e e3                	jle    a1e9 <inv_mdct+0x2be>
       out[i]=0;

    if(block_type == 2){
    a206:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    a20a:	0f 85 8f 01 00 00    	jne    a39f <inv_mdct+0x474>
       N=12;
    a210:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    a217:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a21e:	e9 6d 01 00 00       	jmp    a390 <inv_mdct+0x465>
          for(p= 0;p<N;p++){
    a223:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a22a:	e9 e9 00 00 00       	jmp    a318 <inv_mdct+0x3ed>
             sum = 0.0;
    a22f:	d9 ee                	fldz   
    a231:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    a234:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a23b:	e9 99 00 00 00       	jmp    a2d9 <inv_mdct+0x3ae>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    a240:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a243:	89 d0                	mov    %edx,%eax
    a245:	01 c0                	add    %eax,%eax
    a247:	01 c2                	add    %eax,%edx
    a249:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a24c:	01 d0                	add    %edx,%eax
    a24e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a255:	8b 45 08             	mov    0x8(%ebp),%eax
    a258:	01 d0                	add    %edx,%eax
    a25a:	dd 00                	fldl   (%eax)
    a25c:	dd 9d 70 ff ff ff    	fstpl  -0x90(%ebp)
    a262:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a265:	01 c0                	add    %eax,%eax
    a267:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    a26d:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    a273:	dd 05 b8 d9 00 00    	fldl   0xd9b8
    a279:	de f1                	fdivp  %st,%st(1)
    a27b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a27e:	01 c0                	add    %eax,%eax
    a280:	8d 50 01             	lea    0x1(%eax),%edx
    a283:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a286:	89 c1                	mov    %eax,%ecx
    a288:	c1 e9 1f             	shr    $0x1f,%ecx
    a28b:	01 c8                	add    %ecx,%eax
    a28d:	d1 f8                	sar    %eax
    a28f:	01 d0                	add    %edx,%eax
    a291:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    a297:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    a29d:	de c9                	fmulp  %st,%st(1)
    a29f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2a2:	01 c0                	add    %eax,%eax
    a2a4:	83 c0 01             	add    $0x1,%eax
    a2a7:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    a2ad:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    a2b3:	de c9                	fmulp  %st,%st(1)
    a2b5:	83 ec 08             	sub    $0x8,%esp
    a2b8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a2bc:	dd 1c 24             	fstpl  (%esp)
    a2bf:	e8 7f a5 ff ff       	call   4843 <cos>
    a2c4:	83 c4 10             	add    $0x10,%esp
    a2c7:	dc 8d 70 ff ff ff    	fmull  -0x90(%ebp)
    a2cd:	dd 45 e0             	fldl   -0x20(%ebp)
    a2d0:	de c1                	faddp  %st,%st(1)
    a2d2:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    a2d5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a2d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a2dc:	89 c2                	mov    %eax,%edx
    a2de:	c1 ea 1f             	shr    $0x1f,%edx
    a2e1:	01 d0                	add    %edx,%eax
    a2e3:	d1 f8                	sar    %eax
    a2e5:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a2e8:	0f 8f 52 ff ff ff    	jg     a240 <inv_mdct+0x315>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    a2ee:	8b 55 10             	mov    0x10(%ebp),%edx
    a2f1:	89 d0                	mov    %edx,%eax
    a2f3:	c1 e0 03             	shl    $0x3,%eax
    a2f6:	01 d0                	add    %edx,%eax
    a2f8:	c1 e0 02             	shl    $0x2,%eax
    a2fb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a2fe:	01 d0                	add    %edx,%eax
    a300:	dd 04 c5 00 f9 00 00 	fldl   0xf900(,%eax,8)
    a307:	dc 4d e0             	fmull  -0x20(%ebp)
    a30a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a30d:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    a314:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a318:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a31b:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a31e:	0f 8c 0b ff ff ff    	jl     a22f <inv_mdct+0x304>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a324:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a32b:	eb 57                	jmp    a384 <inv_mdct+0x459>
             out[6*i+p+6] += tmp[p];
    a32d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a330:	89 d0                	mov    %edx,%eax
    a332:	01 c0                	add    %eax,%eax
    a334:	01 d0                	add    %edx,%eax
    a336:	01 c0                	add    %eax,%eax
    a338:	89 c2                	mov    %eax,%edx
    a33a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a33d:	01 d0                	add    %edx,%eax
    a33f:	83 c0 06             	add    $0x6,%eax
    a342:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a349:	8b 45 0c             	mov    0xc(%ebp),%eax
    a34c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a34f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a352:	89 d0                	mov    %edx,%eax
    a354:	01 c0                	add    %eax,%eax
    a356:	01 d0                	add    %edx,%eax
    a358:	01 c0                	add    %eax,%eax
    a35a:	89 c2                	mov    %eax,%edx
    a35c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a35f:	01 d0                	add    %edx,%eax
    a361:	83 c0 06             	add    $0x6,%eax
    a364:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a36b:	8b 45 0c             	mov    0xc(%ebp),%eax
    a36e:	01 d0                	add    %edx,%eax
    a370:	dd 00                	fldl   (%eax)
    a372:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a375:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    a37c:	de c1                	faddp  %st,%st(1)
    a37e:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a380:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a384:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a387:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a38a:	7c a1                	jl     a32d <inv_mdct+0x402>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    a38c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a390:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    a394:	0f 8e 89 fe ff ff    	jle    a223 <inv_mdct+0x2f8>
    a39a:	e9 da 00 00 00       	jmp    a479 <inv_mdct+0x54e>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    a39f:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    a3a6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a3ad:	e9 bb 00 00 00       	jmp    a46d <inv_mdct+0x542>
         sum = 0.0;
    a3b2:	d9 ee                	fldz   
    a3b4:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    a3b7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a3be:	eb 6a                	jmp    a42a <inv_mdct+0x4ff>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    a3c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a3c3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a3ca:	8b 45 08             	mov    0x8(%ebp),%eax
    a3cd:	01 d0                	add    %edx,%eax
    a3cf:	dd 00                	fldl   (%eax)
    a3d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a3d4:	01 c0                	add    %eax,%eax
    a3d6:	8d 50 01             	lea    0x1(%eax),%edx
    a3d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a3dc:	89 c1                	mov    %eax,%ecx
    a3de:	c1 e9 1f             	shr    $0x1f,%ecx
    a3e1:	01 c8                	add    %ecx,%eax
    a3e3:	d1 f8                	sar    %eax
    a3e5:	01 c2                	add    %eax,%edx
    a3e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a3ea:	01 c0                	add    %eax,%eax
    a3ec:	83 c0 01             	add    $0x1,%eax
    a3ef:	89 d1                	mov    %edx,%ecx
    a3f1:	0f af c8             	imul   %eax,%ecx
    a3f4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a3f9:	89 c8                	mov    %ecx,%eax
    a3fb:	f7 ea                	imul   %edx
    a3fd:	c1 fa 05             	sar    $0x5,%edx
    a400:	89 c8                	mov    %ecx,%eax
    a402:	c1 f8 1f             	sar    $0x1f,%eax
    a405:	29 c2                	sub    %eax,%edx
    a407:	89 d0                	mov    %edx,%eax
    a409:	c1 e0 03             	shl    $0x3,%eax
    a40c:	01 d0                	add    %edx,%eax
    a40e:	c1 e0 04             	shl    $0x4,%eax
    a411:	29 c1                	sub    %eax,%ecx
    a413:	89 ca                	mov    %ecx,%edx
    a415:	dd 04 d5 80 fd 00 00 	fldl   0xfd80(,%edx,8)
    a41c:	de c9                	fmulp  %st,%st(1)
    a41e:	dd 45 e0             	fldl   -0x20(%ebp)
    a421:	de c1                	faddp  %st,%st(1)
    a423:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    a426:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a42a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a42d:	89 c2                	mov    %eax,%edx
    a42f:	c1 ea 1f             	shr    $0x1f,%edx
    a432:	01 d0                	add    %edx,%eax
    a434:	d1 f8                	sar    %eax
    a436:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a439:	7f 85                	jg     a3c0 <inv_mdct+0x495>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    a43b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a43e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a445:	8b 45 0c             	mov    0xc(%ebp),%eax
    a448:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a44b:	8b 55 10             	mov    0x10(%ebp),%edx
    a44e:	89 d0                	mov    %edx,%eax
    a450:	c1 e0 03             	shl    $0x3,%eax
    a453:	01 d0                	add    %edx,%eax
    a455:	c1 e0 02             	shl    $0x2,%eax
    a458:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a45b:	01 d0                	add    %edx,%eax
    a45d:	dd 04 c5 00 f9 00 00 	fldl   0xf900(,%eax,8)
    a464:	dc 4d e0             	fmull  -0x20(%ebp)
    a467:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    a469:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a46d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a470:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a473:	0f 8c 39 ff ff ff    	jl     a3b2 <inv_mdct+0x487>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    a479:	c9                   	leave  
    a47a:	c3                   	ret    

0000a47b <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    a47b:	55                   	push   %ebp
    a47c:	89 e5                	mov    %esp,%ebp
    a47e:	53                   	push   %ebx
    a47f:	81 ec 44 01 00 00    	sub    $0x144,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    a485:	a1 84 f7 00 00       	mov    0xf784,%eax
    a48a:	85 c0                	test   %eax,%eax
    a48c:	74 6f                	je     a4fd <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    a48e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a495:	eb 56                	jmp    a4ed <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    a497:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a49e:	eb 43                	jmp    a4e3 <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    a4a0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a4a7:	eb 30                	jmp    a4d9 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    a4a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a4ac:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a4af:	89 c2                	mov    %eax,%edx
    a4b1:	c1 e2 03             	shl    $0x3,%edx
    a4b4:	01 c2                	add    %eax,%edx
    a4b6:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a4b9:	89 c2                	mov    %eax,%edx
    a4bb:	89 c8                	mov    %ecx,%eax
    a4bd:	c1 e0 03             	shl    $0x3,%eax
    a4c0:	01 c8                	add    %ecx,%eax
    a4c2:	c1 e0 06             	shl    $0x6,%eax
    a4c5:	01 c2                	add    %eax,%edx
    a4c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a4ca:	01 d0                	add    %edx,%eax
    a4cc:	d9 ee                	fldz   
    a4ce:	dd 1c c5 00 02 01 00 	fstpl  0x10200(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    a4d5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a4d9:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    a4dd:	7e ca                	jle    a4a9 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    a4df:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a4e3:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    a4e7:	7e b7                	jle    a4a0 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    a4e9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a4ed:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    a4f1:	7e a4                	jle    a497 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    a4f3:	c7 05 84 f7 00 00 00 	movl   $0x0,0xf784
    a4fa:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a4fd:	8b 45 18             	mov    0x18(%ebp),%eax
    a500:	8b 40 10             	mov    0x10(%eax),%eax
    a503:	85 c0                	test   %eax,%eax
    a505:	74 10                	je     a517 <III_hybrid+0x9c>
    a507:	8b 45 18             	mov    0x18(%ebp),%eax
    a50a:	8b 40 18             	mov    0x18(%eax),%eax
    a50d:	85 c0                	test   %eax,%eax
    a50f:	74 06                	je     a517 <III_hybrid+0x9c>
    a511:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    a515:	7e 08                	jle    a51f <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    a517:	8b 45 18             	mov    0x18(%ebp),%eax
    a51a:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a51d:	eb 05                	jmp    a524 <III_hybrid+0xa9>
    a51f:	b8 00 00 00 00       	mov    $0x0,%eax
    a524:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    a527:	83 ec 04             	sub    $0x4,%esp
    a52a:	ff 75 e4             	pushl  -0x1c(%ebp)
    a52d:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    a533:	50                   	push   %eax
    a534:	ff 75 08             	pushl  0x8(%ebp)
    a537:	e8 ef f9 ff ff       	call   9f2b <inv_mdct>
    a53c:	83 c4 10             	add    $0x10,%esp

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a53f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a546:	e9 83 00 00 00       	jmp    a5ce <III_hybrid+0x153>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    a54b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a54e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a555:	8b 45 0c             	mov    0xc(%ebp),%eax
    a558:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a55b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a55e:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a565:	8b 45 10             	mov    0x10(%ebp),%eax
    a568:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a56b:	89 c2                	mov    %eax,%edx
    a56d:	c1 e2 03             	shl    $0x3,%edx
    a570:	01 c2                	add    %eax,%edx
    a572:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a575:	89 c2                	mov    %eax,%edx
    a577:	89 c8                	mov    %ecx,%eax
    a579:	c1 e0 03             	shl    $0x3,%eax
    a57c:	01 c8                	add    %ecx,%eax
    a57e:	c1 e0 06             	shl    $0x6,%eax
    a581:	01 c2                	add    %eax,%edx
    a583:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a586:	01 d0                	add    %edx,%eax
    a588:	dd 04 c5 00 02 01 00 	fldl   0x10200(,%eax,8)
    a58f:	de c1                	faddp  %st,%st(1)
    a591:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    a593:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a596:	83 c0 12             	add    $0x12,%eax
    a599:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a5a0:	8b 45 10             	mov    0x10(%ebp),%eax
    a5a3:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a5a6:	89 c2                	mov    %eax,%edx
    a5a8:	c1 e2 03             	shl    $0x3,%edx
    a5ab:	01 c2                	add    %eax,%edx
    a5ad:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a5b0:	89 c2                	mov    %eax,%edx
    a5b2:	89 c8                	mov    %ecx,%eax
    a5b4:	c1 e0 03             	shl    $0x3,%eax
    a5b7:	01 c8                	add    %ecx,%eax
    a5b9:	c1 e0 06             	shl    $0x6,%eax
    a5bc:	01 c2                	add    %eax,%edx
    a5be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a5c1:	01 d0                	add    %edx,%eax
    a5c3:	dd 1c c5 00 02 01 00 	fstpl  0x10200(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a5ca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a5ce:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a5d2:	0f 8e 73 ff ff ff    	jle    a54b <III_hybrid+0xd0>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    a5d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    a5db:	c9                   	leave  
    a5dc:	c3                   	ret    

0000a5dd <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    a5dd:	55                   	push   %ebp
    a5de:	89 e5                	mov    %esp,%ebp
    a5e0:	57                   	push   %edi
    a5e1:	56                   	push   %esi
    a5e2:	53                   	push   %ebx
    a5e3:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    a5e6:	be 00 00 00 00       	mov    $0x0,%esi
    a5eb:	e9 1a 01 00 00       	jmp    a70a <create_syn_filter+0x12d>
		for (k=0; k<32; k++) {
    a5f0:	bb 00 00 00 00       	mov    $0x0,%ebx
    a5f5:	e9 04 01 00 00       	jmp    a6fe <create_syn_filter+0x121>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    a5fa:	89 f0                	mov    %esi,%eax
    a5fc:	c1 e0 08             	shl    $0x8,%eax
    a5ff:	89 c2                	mov    %eax,%edx
    a601:	8b 45 08             	mov    0x8(%ebp),%eax
    a604:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a607:	89 75 dc             	mov    %esi,-0x24(%ebp)
    a60a:	db 45 dc             	fildl  -0x24(%ebp)
    a60d:	dd 05 c0 d9 00 00    	fldl   0xd9c0
    a613:	de c9                	fmulp  %st,%st(1)
    a615:	dd 05 c8 d9 00 00    	fldl   0xd9c8
    a61b:	de c1                	faddp  %st,%st(1)
    a61d:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    a620:	83 c0 01             	add    $0x1,%eax
    a623:	89 45 dc             	mov    %eax,-0x24(%ebp)
    a626:	db 45 dc             	fildl  -0x24(%ebp)
    a629:	de c9                	fmulp  %st,%st(1)
    a62b:	83 ec 08             	sub    $0x8,%esp
    a62e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a632:	dd 1c 24             	fstpl  (%esp)
    a635:	e8 09 a2 ff ff       	call   4843 <cos>
    a63a:	83 c4 10             	add    $0x10,%esp
    a63d:	dd 05 d0 d9 00 00    	fldl   0xd9d0
    a643:	de c9                	fmulp  %st,%st(1)
    a645:	dd 1c df             	fstpl  (%edi,%ebx,8)
    a648:	dd 04 df             	fldl   (%edi,%ebx,8)
    a64b:	d9 ee                	fldz   
    a64d:	d9 c9                	fxch   %st(1)
    a64f:	df e9                	fucomip %st(1),%st
    a651:	dd d8                	fstp   %st(0)
    a653:	72 41                	jb     a696 <create_syn_filter+0xb9>
				filter[i][k] = (int)(filter[i][k]+0.5);
    a655:	89 f0                	mov    %esi,%eax
    a657:	c1 e0 08             	shl    $0x8,%eax
    a65a:	89 c2                	mov    %eax,%edx
    a65c:	8b 45 08             	mov    0x8(%ebp),%eax
    a65f:	01 c2                	add    %eax,%edx
    a661:	89 f0                	mov    %esi,%eax
    a663:	c1 e0 08             	shl    $0x8,%eax
    a666:	89 c1                	mov    %eax,%ecx
    a668:	8b 45 08             	mov    0x8(%ebp),%eax
    a66b:	01 c8                	add    %ecx,%eax
    a66d:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a670:	dd 05 90 d9 00 00    	fldl   0xd990
    a676:	de c1                	faddp  %st,%st(1)
    a678:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a67b:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a67f:	b4 0c                	mov    $0xc,%ah
    a681:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a685:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a688:	db 5d dc             	fistpl -0x24(%ebp)
    a68b:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a68e:	db 45 dc             	fildl  -0x24(%ebp)
    a691:	dd 1c da             	fstpl  (%edx,%ebx,8)
    a694:	eb 3f                	jmp    a6d5 <create_syn_filter+0xf8>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    a696:	89 f0                	mov    %esi,%eax
    a698:	c1 e0 08             	shl    $0x8,%eax
    a69b:	89 c2                	mov    %eax,%edx
    a69d:	8b 45 08             	mov    0x8(%ebp),%eax
    a6a0:	01 c2                	add    %eax,%edx
    a6a2:	89 f0                	mov    %esi,%eax
    a6a4:	c1 e0 08             	shl    $0x8,%eax
    a6a7:	89 c1                	mov    %eax,%ecx
    a6a9:	8b 45 08             	mov    0x8(%ebp),%eax
    a6ac:	01 c8                	add    %ecx,%eax
    a6ae:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a6b1:	dd 05 90 d9 00 00    	fldl   0xd990
    a6b7:	de e9                	fsubrp %st,%st(1)
    a6b9:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a6bc:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a6c0:	b4 0c                	mov    $0xc,%ah
    a6c2:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a6c6:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a6c9:	db 5d dc             	fistpl -0x24(%ebp)
    a6cc:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a6cf:	db 45 dc             	fildl  -0x24(%ebp)
    a6d2:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    a6d5:	89 f0                	mov    %esi,%eax
    a6d7:	c1 e0 08             	shl    $0x8,%eax
    a6da:	89 c2                	mov    %eax,%edx
    a6dc:	8b 45 08             	mov    0x8(%ebp),%eax
    a6df:	01 d0                	add    %edx,%eax
    a6e1:	89 f2                	mov    %esi,%edx
    a6e3:	89 d1                	mov    %edx,%ecx
    a6e5:	c1 e1 08             	shl    $0x8,%ecx
    a6e8:	8b 55 08             	mov    0x8(%ebp),%edx
    a6eb:	01 ca                	add    %ecx,%edx
    a6ed:	dd 04 da             	fldl   (%edx,%ebx,8)
    a6f0:	dd 05 d8 d9 00 00    	fldl   0xd9d8
    a6f6:	de c9                	fmulp  %st,%st(1)
    a6f8:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    a6fb:	83 c3 01             	add    $0x1,%ebx
    a6fe:	83 fb 1f             	cmp    $0x1f,%ebx
    a701:	0f 8e f3 fe ff ff    	jle    a5fa <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    a707:	83 c6 01             	add    $0x1,%esi
    a70a:	83 fe 3f             	cmp    $0x3f,%esi
    a70d:	0f 8e dd fe ff ff    	jle    a5f0 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    a713:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a716:	5b                   	pop    %ebx
    a717:	5e                   	pop    %esi
    a718:	5f                   	pop    %edi
    a719:	5d                   	pop    %ebp
    a71a:	c3                   	ret    

0000a71b <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    a71b:	55                   	push   %ebp
    a71c:	89 e5                	mov    %esp,%ebp
    a71e:	57                   	push   %edi
    a71f:	56                   	push   %esi
    a720:	53                   	push   %ebx
    a721:	81 ec 04 10 00 00    	sub    $0x1004,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    a727:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    a72d:	bb 40 c9 00 00       	mov    $0xc940,%ebx
    a732:	ba 00 04 00 00       	mov    $0x400,%edx
    a737:	89 c7                	mov    %eax,%edi
    a739:	89 de                	mov    %ebx,%esi
    a73b:	89 d1                	mov    %edx,%ecx
    a73d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    a73f:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    a745:	89 45 08             	mov    %eax,0x8(%ebp)
}
    a748:	81 c4 04 10 00 00    	add    $0x1004,%esp
    a74e:	5b                   	pop    %ebx
    a74f:	5e                   	pop    %esi
    a750:	5f                   	pop    %edi
    a751:	5d                   	pop    %ebp
    a752:	c3                   	ret    

0000a753 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    a753:	55                   	push   %ebp
    a754:	89 e5                	mov    %esp,%ebp
    a756:	57                   	push   %edi
    a757:	56                   	push   %esi
    a758:	53                   	push   %ebx
    a759:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    a75c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    a763:	a1 88 f7 00 00       	mov    0xf788,%eax
    a768:	85 c0                	test   %eax,%eax
    a76a:	74 7a                	je     a7e6 <SubBandSynthesis+0x93>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    a76c:	83 ec 08             	sub    $0x8,%esp
    a76f:	68 40 d9 00 00       	push   $0xd940
    a774:	68 00 40 00 00       	push   $0x4000
    a779:	e8 af a7 ff ff       	call   4f2d <mem_alloc>
    a77e:	83 c4 10             	add    $0x10,%esp
    a781:	a3 00 26 01 00       	mov    %eax,0x12600
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    a786:	83 ec 08             	sub    $0x8,%esp
    a789:	68 43 d9 00 00       	push   $0xd943
    a78e:	68 00 40 00 00       	push   $0x4000
    a793:	e8 95 a7 ff ff       	call   4f2d <mem_alloc>
    a798:	83 c4 10             	add    $0x10,%esp
    a79b:	a3 04 26 01 00       	mov    %eax,0x12604
		create_syn_filter(*filter);
    a7a0:	a1 04 26 01 00       	mov    0x12604,%eax
    a7a5:	83 ec 0c             	sub    $0xc,%esp
    a7a8:	50                   	push   %eax
    a7a9:	e8 2f fe ff ff       	call   a5dd <create_syn_filter>
    a7ae:	83 c4 10             	add    $0x10,%esp
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    a7b1:	83 ec 08             	sub    $0x8,%esp
    a7b4:	68 46 d9 00 00       	push   $0xd946
    a7b9:	68 00 10 00 00       	push   $0x1000
    a7be:	e8 6a a7 ff ff       	call   4f2d <mem_alloc>
    a7c3:	83 c4 10             	add    $0x10,%esp
    a7c6:	a3 08 26 01 00       	mov    %eax,0x12608
		read_syn_window(window);
    a7cb:	a1 08 26 01 00       	mov    0x12608,%eax
    a7d0:	83 ec 0c             	sub    $0xc,%esp
    a7d3:	50                   	push   %eax
    a7d4:	e8 42 ff ff ff       	call   a71b <read_syn_window>
    a7d9:	83 c4 10             	add    $0x10,%esp
		init = 0;
    a7dc:	c7 05 88 f7 00 00 00 	movl   $0x0,0xf788
    a7e3:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    a7e6:	8b 45 0c             	mov    0xc(%ebp),%eax
    a7e9:	8b 04 85 8c f7 00 00 	mov    0xf78c(,%eax,4),%eax
    a7f0:	83 e8 40             	sub    $0x40,%eax
    a7f3:	25 ff 03 00 00       	and    $0x3ff,%eax
    a7f8:	89 c2                	mov    %eax,%edx
    a7fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    a7fd:	89 14 85 8c f7 00 00 	mov    %edx,0xf78c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    a804:	8b 15 00 26 01 00    	mov    0x12600,%edx
    a80a:	8b 45 0c             	mov    0xc(%ebp),%eax
    a80d:	8b 04 85 8c f7 00 00 	mov    0xf78c(,%eax,4),%eax
    a814:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a817:	c1 e1 0a             	shl    $0xa,%ecx
    a81a:	01 c8                	add    %ecx,%eax
    a81c:	c1 e0 03             	shl    $0x3,%eax
    a81f:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    a822:	bb 00 00 00 00       	mov    $0x0,%ebx
    a827:	eb 40                	jmp    a869 <SubBandSynthesis+0x116>
		sum = 0;
    a829:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    a82b:	be 00 00 00 00       	mov    $0x0,%esi
    a830:	eb 26                	jmp    a858 <SubBandSynthesis+0x105>
			sum += bandPtr[k] * (*filter)[i][k];
    a832:	89 f0                	mov    %esi,%eax
    a834:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a83b:	8b 45 08             	mov    0x8(%ebp),%eax
    a83e:	01 d0                	add    %edx,%eax
    a840:	dd 00                	fldl   (%eax)
    a842:	a1 04 26 01 00       	mov    0x12604,%eax
    a847:	89 da                	mov    %ebx,%edx
    a849:	c1 e2 05             	shl    $0x5,%edx
    a84c:	01 f2                	add    %esi,%edx
    a84e:	dd 04 d0             	fldl   (%eax,%edx,8)
    a851:	de c9                	fmulp  %st,%st(1)
    a853:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    a855:	83 c6 01             	add    $0x1,%esi
    a858:	83 fe 1f             	cmp    $0x1f,%esi
    a85b:	7e d5                	jle    a832 <SubBandSynthesis+0xdf>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    a85d:	89 d8                	mov    %ebx,%eax
    a85f:	c1 e0 03             	shl    $0x3,%eax
    a862:	01 f8                	add    %edi,%eax
    a864:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    a866:	83 c3 01             	add    $0x1,%ebx
    a869:	83 fb 3f             	cmp    $0x3f,%ebx
    a86c:	7e bb                	jle    a829 <SubBandSynthesis+0xd6>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a86e:	bf 00 00 00 00       	mov    $0x0,%edi
    a873:	e9 c7 00 00 00       	jmp    a93f <SubBandSynthesis+0x1ec>
		sum = 0;
    a878:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    a87a:	bb 00 00 00 00       	mov    $0x0,%ebx
    a87f:	eb 4c                	jmp    a8cd <SubBandSynthesis+0x17a>
			k = j + (i<<5);
    a881:	89 d8                	mov    %ebx,%eax
    a883:	c1 e0 05             	shl    $0x5,%eax
    a886:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a889:	a1 08 26 01 00       	mov    0x12608,%eax
    a88e:	89 f2                	mov    %esi,%edx
    a890:	c1 e2 03             	shl    $0x3,%edx
    a893:	01 d0                	add    %edx,%eax
    a895:	dd 00                	fldl   (%eax)
    a897:	a1 00 26 01 00       	mov    0x12600,%eax
    a89c:	8d 53 01             	lea    0x1(%ebx),%edx
    a89f:	d1 fa                	sar    %edx
    a8a1:	c1 e2 06             	shl    $0x6,%edx
    a8a4:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    a8a7:	8b 55 0c             	mov    0xc(%ebp),%edx
    a8aa:	8b 14 95 8c f7 00 00 	mov    0xf78c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a8b1:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    a8b3:	89 d1                	mov    %edx,%ecx
    a8b5:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a8bb:	8b 55 0c             	mov    0xc(%ebp),%edx
    a8be:	c1 e2 0a             	shl    $0xa,%edx
    a8c1:	01 ca                	add    %ecx,%edx
    a8c3:	dd 04 d0             	fldl   (%eax,%edx,8)
    a8c6:	de c9                	fmulp  %st,%st(1)
    a8c8:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    a8ca:	83 c3 01             	add    $0x1,%ebx
    a8cd:	83 fb 0f             	cmp    $0xf,%ebx
    a8d0:	7e af                	jle    a881 <SubBandSynthesis+0x12e>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    a8d2:	dd 05 e0 d9 00 00    	fldl   0xd9e0
    a8d8:	de c9                	fmulp  %st,%st(1)
    a8da:	d9 7d d6             	fnstcw -0x2a(%ebp)
    a8dd:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    a8e1:	b4 0c                	mov    $0xc,%ah
    a8e3:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    a8e7:	d9 6d d4             	fldcw  -0x2c(%ebp)
    a8ea:	db 5d e0             	fistpl -0x20(%ebp)
    a8ed:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    a8f0:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    a8f7:	7e 15                	jle    a90e <SubBandSynthesis+0x1bb>
    a8f9:	89 f8                	mov    %edi,%eax
    a8fb:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a8fe:	8b 45 10             	mov    0x10(%ebp),%eax
    a901:	01 d0                	add    %edx,%eax
    a903:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    a908:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a90c:	eb 2e                	jmp    a93c <SubBandSynthesis+0x1e9>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    a90e:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    a915:	7d 15                	jge    a92c <SubBandSynthesis+0x1d9>
    a917:	89 f8                	mov    %edi,%eax
    a919:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a91c:	8b 45 10             	mov    0x10(%ebp),%eax
    a91f:	01 d0                	add    %edx,%eax
    a921:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    a926:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a92a:	eb 10                	jmp    a93c <SubBandSynthesis+0x1e9>
			else                           samples[j] = foo;
    a92c:	89 f8                	mov    %edi,%eax
    a92e:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a931:	8b 45 10             	mov    0x10(%ebp),%eax
    a934:	01 d0                	add    %edx,%eax
    a936:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a939:	66 89 10             	mov    %dx,(%eax)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a93c:	83 c7 01             	add    $0x1,%edi
    a93f:	83 ff 1f             	cmp    $0x1f,%edi
    a942:	0f 8e 30 ff ff ff    	jle    a878 <SubBandSynthesis+0x125>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    a948:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    a94b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a94e:	5b                   	pop    %ebx
    a94f:	5e                   	pop    %esi
    a950:	5f                   	pop    %edi
    a951:	5d                   	pop    %ebp
    a952:	c3                   	ret    

0000a953 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    a953:	55                   	push   %ebp
    a954:	89 e5                	mov    %esp,%ebp
    a956:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    a959:	8b 45 10             	mov    0x10(%ebp),%eax
    a95c:	8b 40 08             	mov    0x8(%eax),%eax
    a95f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a962:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    a969:	eb 75                	jmp    a9e0 <out_fifo+0x8d>
    a96b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    a972:	eb 62                	jmp    a9d6 <out_fifo+0x83>
            (*psampFrames)++;
    a974:	8b 45 14             	mov    0x14(%ebp),%eax
    a977:	8b 00                	mov    (%eax),%eax
    a979:	8d 50 01             	lea    0x1(%eax),%edx
    a97c:	8b 45 14             	mov    0x14(%ebp),%eax
    a97f:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    a981:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a988:	eb 40                	jmp    a9ca <out_fifo+0x77>
                if (!(k%1600) && k) {
    a98a:	8b 0d 0c 26 01 00    	mov    0x1260c,%ecx
    a990:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    a995:	89 c8                	mov    %ecx,%eax
    a997:	f7 ea                	imul   %edx
    a999:	c1 fa 09             	sar    $0x9,%edx
    a99c:	89 c8                	mov    %ecx,%eax
    a99e:	c1 f8 1f             	sar    $0x1f,%eax
    a9a1:	29 c2                	sub    %eax,%edx
    a9a3:	89 d0                	mov    %edx,%eax
    a9a5:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    a9ab:	29 c1                	sub    %eax,%ecx
    a9ad:	89 c8                	mov    %ecx,%eax
    a9af:	85 c0                	test   %eax,%eax
    a9b1:	75 13                	jne    a9c6 <out_fifo+0x73>
    a9b3:	a1 0c 26 01 00       	mov    0x1260c,%eax
    a9b8:	85 c0                	test   %eax,%eax
    a9ba:	74 0a                	je     a9c6 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    a9bc:	c7 05 0c 26 01 00 00 	movl   $0x0,0x1260c
    a9c3:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    a9c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a9ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a9cd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a9d0:	7c b8                	jl     a98a <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a9d2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    a9d6:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    a9da:	7e 98                	jle    a974 <out_fifo+0x21>
    a9dc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    a9e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    a9e3:	3b 45 0c             	cmp    0xc(%ebp),%eax
    a9e6:	7c 83                	jl     a96b <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    a9e8:	c9                   	leave  
    a9e9:	c3                   	ret    

0000a9ea <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    a9ea:	55                   	push   %ebp
    a9eb:	89 e5                	mov    %esp,%ebp
    a9ed:	83 ec 08             	sub    $0x8,%esp
    *old_crc = getbits(bs, 16);
    a9f0:	83 ec 08             	sub    $0x8,%esp
    a9f3:	6a 10                	push   $0x10
    a9f5:	ff 75 08             	pushl  0x8(%ebp)
    a9f8:	e8 14 a8 ff ff       	call   5211 <getbits>
    a9fd:	83 c4 10             	add    $0x10,%esp
    aa00:	89 c2                	mov    %eax,%edx
    aa02:	8b 45 0c             	mov    0xc(%ebp),%eax
    aa05:	89 10                	mov    %edx,(%eax)
}
    aa07:	c9                   	leave  
    aa08:	c3                   	ret    

0000aa09 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    aa09:	55                   	push   %ebp
    aa0a:	89 e5                	mov    %esp,%ebp
    aa0c:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    aa0f:	8b 45 08             	mov    0x8(%ebp),%eax
    aa12:	8b 40 0c             	mov    0xc(%eax),%eax
    aa15:	83 c0 1e             	add    $0x1e,%eax
    aa18:	8b 14 85 80 f2 00 00 	mov    0xf280(,%eax,4),%edx
    aa1f:	89 d0                	mov    %edx,%eax
    aa21:	c1 e0 03             	shl    $0x3,%eax
    aa24:	01 d0                	add    %edx,%eax
    aa26:	c1 e0 04             	shl    $0x4,%eax
    aa29:	89 45 e8             	mov    %eax,-0x18(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
    aa2c:	db 45 e8             	fildl  -0x18(%ebp)
    aa2f:	8b 45 08             	mov    0x8(%ebp),%eax
    aa32:	8b 40 10             	mov    0x10(%eax),%eax
    aa35:	dd 04 c5 40 f3 00 00 	fldl   0xf340(,%eax,8)
    aa3c:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    aa3e:	d9 7d ee             	fnstcw -0x12(%ebp)
    aa41:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
    aa45:	b4 0c                	mov    $0xc,%ah
    aa47:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    aa4b:	d9 6d ec             	fldcw  -0x14(%ebp)
    aa4e:	db 5d fc             	fistpl -0x4(%ebp)
    aa51:	d9 6d ee             	fldcw  -0x12(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    aa54:	8b 45 08             	mov    0x8(%ebp),%eax
    aa57:	8b 40 14             	mov    0x14(%eax),%eax
    aa5a:	85 c0                	test   %eax,%eax
    aa5c:	74 04                	je     aa62 <main_data_slots+0x59>
    aa5e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    aa62:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    aa66:	8b 45 08             	mov    0x8(%ebp),%eax
    aa69:	8b 40 08             	mov    0x8(%eax),%eax
    aa6c:	85 c0                	test   %eax,%eax
    aa6e:	74 04                	je     aa74 <main_data_slots+0x6b>
		nSlots -= 2;
    aa70:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    aa74:	8b 45 10             	mov    0x10(%ebp),%eax
    aa77:	83 f8 01             	cmp    $0x1,%eax
    aa7a:	75 06                	jne    aa82 <main_data_slots+0x79>
		nSlots -= 17;
    aa7c:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    aa80:	eb 04                	jmp    aa86 <main_data_slots+0x7d>
	else
		nSlots -=32;
    aa82:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    aa86:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    aa89:	c9                   	leave  
    aa8a:	c3                   	ret    
