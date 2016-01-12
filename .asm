
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
      7c:	05 0c 37 01 00       	add    $0x1370c,%eax
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
      8e:	c7 05 20 37 01 00 00 	movl   $0x0,0x13720
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
      a6:	e8 89 4c 00 00       	call   4d34 <malloc>
      ab:	83 c4 10             	add    $0x10,%esp
      ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      b1:	83 ec 0c             	sub    $0xc,%esp
      b4:	6a 20                	push   $0x20
      b6:	e8 79 4c 00 00       	call   4d34 <malloc>
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
      d3:	e8 7e 45 00 00       	call   4656 <strcpy>
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
      fb:	8b 15 50 ff 00 00    	mov    0xff50,%edx
     101:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     104:	8d 45 d8             	lea    -0x28(%ebp),%eax
     107:	83 ec 0c             	sub    $0xc,%esp
     10a:	52                   	push   %edx
     10b:	ff 35 08 37 01 00    	pushl  0x13708
     111:	ff 35 04 37 01 00    	pushl  0x13704
     117:	ff 35 00 37 01 00    	pushl  0x13700
     11d:	50                   	push   %eax
     11e:	e8 1e 0c 00 00       	call   d41 <getPos>
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
     13e:	8b 15 4c ff 00 00    	mov    0xff4c,%edx
     144:	8b 45 f4             	mov    -0xc(%ebp),%eax
     147:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     14a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     14d:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     154:	8b 45 f4             	mov    -0xc(%ebp),%eax
     157:	a3 4c ff 00 00       	mov    %eax,0xff4c
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
     167:	a1 4c ff 00 00       	mov    0xff4c,%eax
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
     18a:	e8 64 4a 00 00       	call   4bf3 <free>
     18f:	83 c4 10             	add    $0x10,%esp
		free(temp);
     192:	83 ec 0c             	sub    $0xc,%esp
     195:	ff 75 f0             	pushl  -0x10(%ebp)
     198:	e8 56 4a 00 00       	call   4bf3 <free>
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
     1a6:	c7 05 4c ff 00 00 00 	movl   $0x0,0xff4c
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
     1be:	e8 02 45 00 00       	call   46c5 <strlen>
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
     257:	c7 05 50 ff 00 00 00 	movl   $0x0,0xff50
     25e:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     261:	83 ec 08             	sub    $0x8,%esp
     264:	6a 00                	push   $0x0
     266:	ff 75 08             	pushl  0x8(%ebp)
     269:	e8 58 46 00 00       	call   48c6 <open>
     26e:	83 c4 10             	add    $0x10,%esp
     271:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     274:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     278:	79 1a                	jns    294 <list+0x49>
		printf(2, "ls: cannot open %s\n", path);
     27a:	83 ec 04             	sub    $0x4,%esp
     27d:	ff 75 08             	pushl  0x8(%ebp)
     280:	68 40 b1 00 00       	push   $0xb140
     285:	6a 02                	push   $0x2
     287:	e8 d7 47 00 00       	call   4a63 <printf>
     28c:	83 c4 10             	add    $0x10,%esp
		return;
     28f:	e9 52 02 00 00       	jmp    4e6 <list+0x29b>
	}

	if (fstat(fd, &st) < 0) {
     294:	83 ec 08             	sub    $0x8,%esp
     297:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     29d:	50                   	push   %eax
     29e:	ff 75 e4             	pushl  -0x1c(%ebp)
     2a1:	e8 38 46 00 00       	call   48de <fstat>
     2a6:	83 c4 10             	add    $0x10,%esp
     2a9:	85 c0                	test   %eax,%eax
     2ab:	79 28                	jns    2d5 <list+0x8a>
		printf(2, "ls: cannot stat %s\n", path);
     2ad:	83 ec 04             	sub    $0x4,%esp
     2b0:	ff 75 08             	pushl  0x8(%ebp)
     2b3:	68 54 b1 00 00       	push   $0xb154
     2b8:	6a 02                	push   $0x2
     2ba:	e8 a4 47 00 00       	call   4a63 <printf>
     2bf:	83 c4 10             	add    $0x10,%esp
		close(fd);
     2c2:	83 ec 0c             	sub    $0xc,%esp
     2c5:	ff 75 e4             	pushl  -0x1c(%ebp)
     2c8:	e8 e1 45 00 00       	call   48ae <close>
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
     316:	68 68 b1 00 00       	push   $0xb168
     31b:	6a 01                	push   $0x1
     31d:	e8 41 47 00 00       	call   4a63 <printf>
     322:	83 c4 20             	add    $0x20,%esp
		break;
     325:	e9 ae 01 00 00       	jmp    4d8 <list+0x28d>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     32a:	83 ec 0c             	sub    $0xc,%esp
     32d:	ff 75 08             	pushl  0x8(%ebp)
     330:	e8 90 43 00 00       	call   46c5 <strlen>
     335:	83 c4 10             	add    $0x10,%esp
     338:	83 c0 10             	add    $0x10,%eax
     33b:	3d 00 02 00 00       	cmp    $0x200,%eax
     340:	76 17                	jbe    359 <list+0x10e>
			printf(1, "ls: path too long\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 75 b1 00 00       	push   $0xb175
     34a:	6a 01                	push   $0x1
     34c:	e8 12 47 00 00       	call   4a63 <printf>
     351:	83 c4 10             	add    $0x10,%esp
			break;
     354:	e9 7f 01 00 00       	jmp    4d8 <list+0x28d>
		}
		strcpy(buf, path);
     359:	83 ec 08             	sub    $0x8,%esp
     35c:	ff 75 08             	pushl  0x8(%ebp)
     35f:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     365:	50                   	push   %eax
     366:	e8 eb 42 00 00       	call   4656 <strcpy>
     36b:	83 c4 10             	add    $0x10,%esp
		p = buf + strlen(buf);
     36e:	83 ec 0c             	sub    $0xc,%esp
     371:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     377:	50                   	push   %eax
     378:	e8 48 43 00 00       	call   46c5 <strlen>
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
     3c1:	e8 7b 44 00 00       	call   4841 <memmove>
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
     3e3:	e8 bf 43 00 00       	call   47a7 <stat>
     3e8:	83 c4 10             	add    $0x10,%esp
     3eb:	85 c0                	test   %eax,%eax
     3ed:	79 1e                	jns    40d <list+0x1c2>
				printf(1, "ls: cannot stat %s\n", buf);
     3ef:	83 ec 04             	sub    $0x4,%esp
     3f2:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3f8:	50                   	push   %eax
     3f9:	68 54 b1 00 00       	push   $0xb154
     3fe:	6a 01                	push   $0x1
     400:	e8 5e 46 00 00       	call   4a63 <printf>
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
     43a:	8b 15 50 ff 00 00    	mov    0xff50,%edx
     440:	8d 45 d0             	lea    -0x30(%ebp),%eax
     443:	83 ec 0c             	sub    $0xc,%esp
     446:	52                   	push   %edx
     447:	ff 35 08 37 01 00    	pushl  0x13708
     44d:	ff 35 04 37 01 00    	pushl  0x13704
     453:	ff 35 00 37 01 00    	pushl  0x13700
     459:	50                   	push   %eax
     45a:	e8 e2 08 00 00       	call   d41 <getPos>
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
     4aa:	a1 50 ff 00 00       	mov    0xff50,%eax
     4af:	83 c0 01             	add    $0x1,%eax
     4b2:	a3 50 ff 00 00       	mov    %eax,0xff50
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
     4c6:	e8 d3 43 00 00       	call   489e <read>
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
     4de:	e8 cb 43 00 00       	call   48ae <close>
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
     501:	eb 69                	jmp    56c <drawItem+0x7e>
	else if (chosen == 1)
     503:	83 7d 3c 01          	cmpl   $0x1,0x3c(%ebp)
     507:	75 34                	jne    53d <drawItem+0x4f>
	{
		nameColor = 0xFFFF;
     509:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     50f:	8b 45 38             	mov    0x38(%ebp),%eax
     512:	89 c3                	mov    %eax,%ebx
     514:	8b 45 34             	mov    0x34(%ebp),%eax
     517:	89 c1                	mov    %eax,%ecx
     519:	8b 45 30             	mov    0x30(%ebp),%eax
     51c:	89 c2                	mov    %eax,%edx
     51e:	8b 45 2c             	mov    0x2c(%ebp),%eax
     521:	68 10 21 00 00       	push   $0x2110
     526:	53                   	push   %ebx
     527:	51                   	push   %ecx
     528:	52                   	push   %edx
     529:	50                   	push   %eax
     52a:	ff 75 10             	pushl  0x10(%ebp)
     52d:	ff 75 0c             	pushl  0xc(%ebp)
     530:	ff 75 08             	pushl  0x8(%ebp)
     533:	e8 1a 2a 00 00       	call   2f52 <fill_rect>
     538:	83 c4 20             	add    $0x20,%esp
     53b:	eb 2f                	jmp    56c <drawItem+0x7e>
	} else
	{
		nameColor = 0xFFFF;
     53d:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
     543:	8b 45 38             	mov    0x38(%ebp),%eax
     546:	89 c3                	mov    %eax,%ebx
     548:	8b 45 34             	mov    0x34(%ebp),%eax
     54b:	89 c1                	mov    %eax,%ecx
     54d:	8b 45 30             	mov    0x30(%ebp),%eax
     550:	89 c2                	mov    %eax,%edx
     552:	8b 45 2c             	mov    0x2c(%ebp),%eax
     555:	6a 00                	push   $0x0
     557:	53                   	push   %ebx
     558:	51                   	push   %ecx
     559:	52                   	push   %edx
     55a:	50                   	push   %eax
     55b:	ff 75 10             	pushl  0x10(%ebp)
     55e:	ff 75 0c             	pushl  0xc(%ebp)
     561:	ff 75 08             	pushl  0x8(%ebp)
     564:	e8 e9 29 00 00       	call   2f52 <fill_rect>
     569:	83 c4 20             	add    $0x20,%esp
	}
	if (style == ICON_STYLE) {
     56c:	a1 04 f5 00 00       	mov    0xf504,%eax
     571:	83 f8 01             	cmp    $0x1,%eax
     574:	0f 85 d2 00 00 00    	jne    64c <drawItem+0x15e>
		switch (st.type) {
     57a:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     57e:	98                   	cwtl   
     57f:	83 f8 01             	cmp    $0x1,%eax
     582:	74 38                	je     5bc <drawItem+0xce>
     584:	83 f8 02             	cmp    $0x2,%eax
     587:	75 65                	jne    5ee <drawItem+0x100>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     589:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     58c:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     58f:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     592:	83 c0 19             	add    $0x19,%eax
     595:	52                   	push   %edx
     596:	50                   	push   %eax
     597:	ff 35 70 f5 00 00    	pushl  0xf570
     59d:	ff 35 6c f5 00 00    	pushl  0xf56c
     5a3:	ff 35 68 f5 00 00    	pushl  0xf568
     5a9:	ff 75 10             	pushl  0x10(%ebp)
     5ac:	ff 75 0c             	pushl  0xc(%ebp)
     5af:	ff 75 08             	pushl  0x8(%ebp)
     5b2:	e8 a5 2f 00 00       	call   355c <draw_picture>
     5b7:	83 c4 20             	add    $0x20,%esp
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     5ba:	eb 32                	jmp    5ee <drawItem+0x100>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     5bc:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     5bf:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     5c2:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     5c5:	83 c0 19             	add    $0x19,%eax
     5c8:	52                   	push   %edx
     5c9:	50                   	push   %eax
     5ca:	ff 35 d8 f5 00 00    	pushl  0xf5d8
     5d0:	ff 35 d4 f5 00 00    	pushl  0xf5d4
     5d6:	ff 35 d0 f5 00 00    	pushl  0xf5d0
     5dc:	ff 75 10             	pushl  0x10(%ebp)
     5df:	ff 75 0c             	pushl  0xc(%ebp)
     5e2:	ff 75 08             	pushl  0x8(%ebp)
     5e5:	e8 72 2f 00 00       	call   355c <draw_picture>
     5ea:	83 c4 20             	add    $0x20,%esp
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     5ed:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     5ee:	83 ec 0c             	sub    $0xc,%esp
     5f1:	ff 75 14             	pushl  0x14(%ebp)
     5f4:	e8 cc 40 00 00       	call   46c5 <strlen>
     5f9:	83 c4 10             	add    $0x10,%esp
     5fc:	89 c2                	mov    %eax,%edx
     5fe:	b8 00 00 00 00       	mov    $0x0,%eax
     603:	29 d0                	sub    %edx,%eax
     605:	c1 e0 02             	shl    $0x2,%eax
     608:	83 c0 30             	add    $0x30,%eax
     60b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     60e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     612:	79 07                	jns    61b <drawItem+0x12d>
			indent = 0;
     614:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     61b:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     61e:	8d 48 46             	lea    0x46(%eax),%ecx
     621:	8b 55 2c             	mov    0x2c(%ebp),%edx
     624:	8b 45 f0             	mov    -0x10(%ebp),%eax
     627:	01 c2                	add    %eax,%edx
     629:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     62d:	83 ec 04             	sub    $0x4,%esp
     630:	51                   	push   %ecx
     631:	52                   	push   %edx
     632:	50                   	push   %eax
     633:	ff 75 14             	pushl  0x14(%ebp)
     636:	ff 75 10             	pushl  0x10(%ebp)
     639:	ff 75 0c             	pushl  0xc(%ebp)
     63c:	ff 75 08             	pushl  0x8(%ebp)
     63f:	e8 69 2e 00 00       	call   34ad <puts_str>
     644:	83 c4 20             	add    $0x20,%esp
     647:	e9 e1 00 00 00       	jmp    72d <drawItem+0x23f>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     64c:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     650:	98                   	cwtl   
     651:	83 f8 01             	cmp    $0x1,%eax
     654:	74 7b                	je     6d1 <drawItem+0x1e3>
     656:	83 f8 02             	cmp    $0x2,%eax
     659:	0f 85 a4 00 00 00    	jne    703 <drawItem+0x215>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     65f:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     662:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     665:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     668:	83 c0 08             	add    $0x8,%eax
     66b:	52                   	push   %edx
     66c:	50                   	push   %eax
     66d:	ff 35 a4 f5 00 00    	pushl  0xf5a4
     673:	ff 35 a0 f5 00 00    	pushl  0xf5a0
     679:	ff 35 9c f5 00 00    	pushl  0xf59c
     67f:	ff 75 10             	pushl  0x10(%ebp)
     682:	ff 75 0c             	pushl  0xc(%ebp)
     685:	ff 75 08             	pushl  0x8(%ebp)
     688:	e8 cf 2e 00 00       	call   355c <draw_picture>
     68d:	83 c4 20             	add    $0x20,%esp
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     690:	8b 45 28             	mov    0x28(%ebp),%eax
     693:	83 ec 0c             	sub    $0xc,%esp
     696:	50                   	push   %eax
     697:	e8 96 00 00 00       	call   732 <sizeFormat>
     69c:	83 c4 10             	add    $0x10,%esp
     69f:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     6a2:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     6a5:	8d 48 03             	lea    0x3(%eax),%ecx
     6a8:	8b 45 2c             	mov    0x2c(%ebp),%eax
     6ab:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     6b1:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     6b5:	83 ec 04             	sub    $0x4,%esp
     6b8:	51                   	push   %ecx
     6b9:	52                   	push   %edx
     6ba:	50                   	push   %eax
     6bb:	ff 75 ec             	pushl  -0x14(%ebp)
     6be:	ff 75 10             	pushl  0x10(%ebp)
     6c1:	ff 75 0c             	pushl  0xc(%ebp)
     6c4:	ff 75 08             	pushl  0x8(%ebp)
     6c7:	e8 e1 2d 00 00       	call   34ad <puts_str>
     6cc:	83 c4 20             	add    $0x20,%esp
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     6cf:	eb 32                	jmp    703 <drawItem+0x215>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6d1:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     6d4:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6d7:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     6da:	83 c0 08             	add    $0x8,%eax
     6dd:	52                   	push   %edx
     6de:	50                   	push   %eax
     6df:	ff 35 0c f6 00 00    	pushl  0xf60c
     6e5:	ff 35 08 f6 00 00    	pushl  0xf608
     6eb:	ff 35 04 f6 00 00    	pushl  0xf604
     6f1:	ff 75 10             	pushl  0x10(%ebp)
     6f4:	ff 75 0c             	pushl  0xc(%ebp)
     6f7:	ff 75 08             	pushl  0x8(%ebp)
     6fa:	e8 5d 2e 00 00       	call   355c <draw_picture>
     6ff:	83 c4 20             	add    $0x20,%esp
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     702:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     703:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     706:	8d 48 03             	lea    0x3(%eax),%ecx
     709:	8b 45 2c             	mov    0x2c(%ebp),%eax
     70c:	8d 50 28             	lea    0x28(%eax),%edx
     70f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     713:	83 ec 04             	sub    $0x4,%esp
     716:	51                   	push   %ecx
     717:	52                   	push   %edx
     718:	50                   	push   %eax
     719:	ff 75 14             	pushl  0x14(%ebp)
     71c:	ff 75 10             	pushl  0x10(%ebp)
     71f:	ff 75 0c             	pushl  0xc(%ebp)
     722:	ff 75 08             	pushl  0x8(%ebp)
     725:	e8 83 2d 00 00       	call   34ad <puts_str>
     72a:	83 c4 20             	add    $0x20,%esp
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     72d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     730:	c9                   	leave  
     731:	c3                   	ret    

00000732 <sizeFormat>:

char *sizeFormat(uint size){
     732:	55                   	push   %ebp
     733:	89 e5                	mov    %esp,%ebp
     735:	53                   	push   %ebx
     736:	83 ec 14             	sub    $0x14,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     739:	83 ec 0c             	sub    $0xc,%esp
     73c:	6a 0c                	push   $0xc
     73e:	e8 f1 45 00 00       	call   4d34 <malloc>
     743:	83 c4 10             	add    $0x10,%esp
     746:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     749:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     750:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     757:	0f 86 8b 00 00 00    	jbe    7e8 <sizeFormat+0xb6>
	{
		size = size / (0x400);
     75d:	8b 45 08             	mov    0x8(%ebp),%eax
     760:	c1 e8 0a             	shr    $0xa,%eax
     763:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     766:	8b 45 f4             	mov    -0xc(%ebp),%eax
     769:	8d 50 01             	lea    0x1(%eax),%edx
     76c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     76f:	89 c2                	mov    %eax,%edx
     771:	8b 45 f0             	mov    -0x10(%ebp),%eax
     774:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     777:	8b 4d 08             	mov    0x8(%ebp),%ecx
     77a:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     77f:	89 c8                	mov    %ecx,%eax
     781:	f7 e2                	mul    %edx
     783:	c1 ea 03             	shr    $0x3,%edx
     786:	89 d0                	mov    %edx,%eax
     788:	c1 e0 02             	shl    $0x2,%eax
     78b:	01 d0                	add    %edx,%eax
     78d:	01 c0                	add    %eax,%eax
     78f:	29 c1                	sub    %eax,%ecx
     791:	89 ca                	mov    %ecx,%edx
     793:	89 d0                	mov    %edx,%eax
     795:	83 c0 30             	add    $0x30,%eax
     798:	88 03                	mov    %al,(%ebx)
			size /= 10;
     79a:	8b 45 08             	mov    0x8(%ebp),%eax
     79d:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     7a2:	f7 e2                	mul    %edx
     7a4:	89 d0                	mov    %edx,%eax
     7a6:	c1 e8 03             	shr    $0x3,%eax
     7a9:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     7ac:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     7b0:	75 b4                	jne    766 <sizeFormat+0x34>
		result[n++] = 'K';
     7b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7b5:	8d 50 01             	lea    0x1(%eax),%edx
     7b8:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7bb:	89 c2                	mov    %eax,%edx
     7bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7c0:	01 d0                	add    %edx,%eax
     7c2:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     7c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7c8:	8d 50 01             	lea    0x1(%eax),%edx
     7cb:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7ce:	89 c2                	mov    %eax,%edx
     7d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7d3:	01 d0                	add    %edx,%eax
     7d5:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     7d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
     7db:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7de:	01 d0                	add    %edx,%eax
     7e0:	c6 00 00             	movb   $0x0,(%eax)
     7e3:	e9 a3 00 00 00       	jmp    88b <sizeFormat+0x159>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     7e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7eb:	8d 50 01             	lea    0x1(%eax),%edx
     7ee:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7f1:	89 c2                	mov    %eax,%edx
     7f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7f6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     7f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
     7fc:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     801:	89 c8                	mov    %ecx,%eax
     803:	f7 e2                	mul    %edx
     805:	c1 ea 03             	shr    $0x3,%edx
     808:	89 d0                	mov    %edx,%eax
     80a:	c1 e0 02             	shl    $0x2,%eax
     80d:	01 d0                	add    %edx,%eax
     80f:	01 c0                	add    %eax,%eax
     811:	29 c1                	sub    %eax,%ecx
     813:	89 ca                	mov    %ecx,%edx
     815:	89 d0                	mov    %edx,%eax
     817:	83 c0 30             	add    $0x30,%eax
     81a:	88 03                	mov    %al,(%ebx)
			size /= 10;
     81c:	8b 45 08             	mov    0x8(%ebp),%eax
     81f:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     824:	f7 e2                	mul    %edx
     826:	89 d0                	mov    %edx,%eax
     828:	c1 e8 03             	shr    $0x3,%eax
     82b:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     82e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     832:	75 b4                	jne    7e8 <sizeFormat+0xb6>
		result[n++] = 'b';
     834:	8b 45 f4             	mov    -0xc(%ebp),%eax
     837:	8d 50 01             	lea    0x1(%eax),%edx
     83a:	89 55 f4             	mov    %edx,-0xc(%ebp)
     83d:	89 c2                	mov    %eax,%edx
     83f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     842:	01 d0                	add    %edx,%eax
     844:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     847:	8b 45 f4             	mov    -0xc(%ebp),%eax
     84a:	8d 50 01             	lea    0x1(%eax),%edx
     84d:	89 55 f4             	mov    %edx,-0xc(%ebp)
     850:	89 c2                	mov    %eax,%edx
     852:	8b 45 f0             	mov    -0x10(%ebp),%eax
     855:	01 d0                	add    %edx,%eax
     857:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     85a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     85d:	8d 50 01             	lea    0x1(%eax),%edx
     860:	89 55 f4             	mov    %edx,-0xc(%ebp)
     863:	89 c2                	mov    %eax,%edx
     865:	8b 45 f0             	mov    -0x10(%ebp),%eax
     868:	01 d0                	add    %edx,%eax
     86a:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     86d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     870:	8d 50 01             	lea    0x1(%eax),%edx
     873:	89 55 f4             	mov    %edx,-0xc(%ebp)
     876:	89 c2                	mov    %eax,%edx
     878:	8b 45 f0             	mov    -0x10(%ebp),%eax
     87b:	01 d0                	add    %edx,%eax
     87d:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     880:	8b 55 f4             	mov    -0xc(%ebp),%edx
     883:	8b 45 f0             	mov    -0x10(%ebp),%eax
     886:	01 d0                	add    %edx,%eax
     888:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     88b:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     88e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     891:	c9                   	leave  
     892:	c3                   	ret    

00000893 <drawFinderWnd>:
		10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "cut.bmp",
		2 * BUTTON_WIDTH, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }  };

void drawFinderWnd(Context context) {
     893:	55                   	push   %ebp
     894:	89 e5                	mov    %esp,%ebp
     896:	83 ec 08             	sub    $0x8,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     899:	8b 45 0c             	mov    0xc(%ebp),%eax
     89c:	83 e8 01             	sub    $0x1,%eax
     89f:	6a 00                	push   $0x0
     8a1:	6a 00                	push   $0x0
     8a3:	50                   	push   %eax
     8a4:	6a 00                	push   $0x0
     8a6:	6a 00                	push   $0x0
     8a8:	ff 75 10             	pushl  0x10(%ebp)
     8ab:	ff 75 0c             	pushl  0xc(%ebp)
     8ae:	ff 75 08             	pushl  0x8(%ebp)
     8b1:	e8 62 2d 00 00       	call   3618 <draw_line>
     8b6:	83 c4 20             	add    $0x20,%esp
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     8b9:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     8bc:	8d 48 ff             	lea    -0x1(%eax),%ecx
     8bf:	8b 45 0c             	mov    0xc(%ebp),%eax
     8c2:	8d 50 ff             	lea    -0x1(%eax),%edx
     8c5:	8b 45 0c             	mov    0xc(%ebp),%eax
     8c8:	83 e8 01             	sub    $0x1,%eax
     8cb:	6a 00                	push   $0x0
     8cd:	51                   	push   %ecx
     8ce:	52                   	push   %edx
     8cf:	6a 00                	push   $0x0
     8d1:	50                   	push   %eax
     8d2:	ff 75 10             	pushl  0x10(%ebp)
     8d5:	ff 75 0c             	pushl  0xc(%ebp)
     8d8:	ff 75 08             	pushl  0x8(%ebp)
     8db:	e8 38 2d 00 00       	call   3618 <draw_line>
     8e0:	83 c4 20             	add    $0x20,%esp
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     8e3:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     8e6:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     8e9:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     8ec:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     8ef:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     8f2:	83 e8 01             	sub    $0x1,%eax
     8f5:	6a 00                	push   $0x0
     8f7:	51                   	push   %ecx
     8f8:	52                   	push   %edx
     8f9:	50                   	push   %eax
     8fa:	6a 00                	push   $0x0
     8fc:	ff 75 10             	pushl  0x10(%ebp)
     8ff:	ff 75 0c             	pushl  0xc(%ebp)
     902:	ff 75 08             	pushl  0x8(%ebp)
     905:	e8 0e 2d 00 00       	call   3618 <draw_line>
     90a:	83 c4 20             	add    $0x20,%esp
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     90d:	8b 45 10             	mov    0x10(%ebp),%eax
     910:	83 e8 01             	sub    $0x1,%eax
     913:	6a 00                	push   $0x0
     915:	6a 00                	push   $0x0
     917:	6a 00                	push   $0x0
     919:	50                   	push   %eax
     91a:	6a 00                	push   $0x0
     91c:	ff 75 10             	pushl  0x10(%ebp)
     91f:	ff 75 0c             	pushl  0xc(%ebp)
     922:	ff 75 08             	pushl  0x8(%ebp)
     925:	e8 ee 2c 00 00       	call   3618 <draw_line>
     92a:	83 c4 20             	add    $0x20,%esp
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     92d:	8b 45 0c             	mov    0xc(%ebp),%eax
     930:	83 e8 02             	sub    $0x2,%eax
     933:	68 18 c6 00 00       	push   $0xc618
     938:	6a 46                	push   $0x46
     93a:	50                   	push   %eax
     93b:	6a 01                	push   $0x1
     93d:	6a 01                	push   $0x1
     93f:	ff 75 10             	pushl  0x10(%ebp)
     942:	ff 75 0c             	pushl  0xc(%ebp)
     945:	ff 75 08             	pushl  0x8(%ebp)
     948:	e8 05 26 00 00       	call   2f52 <fill_rect>
     94d:	83 c4 20             	add    $0x20,%esp
			TOOLSBAR_COLOR);
	puts_str(context, currentPath, 0, 42, 3);
     950:	83 ec 04             	sub    $0x4,%esp
     953:	6a 03                	push   $0x3
     955:	6a 2a                	push   $0x2a
     957:	6a 00                	push   $0x0
     959:	68 40 37 01 00       	push   $0x13740
     95e:	ff 75 10             	pushl  0x10(%ebp)
     961:	ff 75 0c             	pushl  0xc(%ebp)
     964:	ff 75 08             	pushl  0x8(%ebp)
     967:	e8 41 2b 00 00       	call   34ad <puts_str>
     96c:	83 c4 20             	add    $0x20,%esp
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     96f:	83 ec 0c             	sub    $0xc,%esp
     972:	6a 0f                	push   $0xf
     974:	68 40 f6 00 00       	push   $0xf640
     979:	ff 75 10             	pushl  0x10(%ebp)
     97c:	ff 75 0c             	pushl  0xc(%ebp)
     97f:	ff 75 08             	pushl  0x8(%ebp)
     982:	e8 56 2f 00 00       	call   38dd <draw_iconlist>
     987:	83 c4 20             	add    $0x20,%esp
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     98a:	83 ec 04             	sub    $0x4,%esp
     98d:	6a 23                	push   $0x23
     98f:	68 a4 01 00 00       	push   $0x1a4
     994:	6a 00                	push   $0x0
     996:	68 0c 37 01 00       	push   $0x1370c
     99b:	ff 75 10             	pushl  0x10(%ebp)
     99e:	ff 75 0c             	pushl  0xc(%ebp)
     9a1:	ff 75 08             	pushl  0x8(%ebp)
     9a4:	e8 04 2b 00 00       	call   34ad <puts_str>
     9a9:	83 c4 20             	add    $0x20,%esp
				- (BUTTON_HEIGHT + 3) );


}
     9ac:	c9                   	leave  
     9ad:	c3                   	ret    

000009ae <drawFinderContent>:

void drawFinderContent(Context context) {
     9ae:	55                   	push   %ebp
     9af:	89 e5                	mov    %esp,%ebp
     9b1:	53                   	push   %ebx
     9b2:	83 ec 24             	sub    $0x24,%esp
	struct fileItem *p;
	int tempItemCounter = 0;
     9b5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     9bc:	c7 45 ec 46 00 00 00 	movl   $0x46,-0x14(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     9c3:	a1 04 f5 00 00       	mov    0xf504,%eax
     9c8:	83 f8 02             	cmp    $0x2,%eax
     9cb:	75 04                	jne    9d1 <drawFinderContent+0x23>
     9cd:	83 45 ec 1c          	addl   $0x1c,-0x14(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     9d1:	8b 45 10             	mov    0x10(%ebp),%eax
     9d4:	83 e8 48             	sub    $0x48,%eax
	int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     9d7:	89 c1                	mov    %eax,%ecx
     9d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     9dc:	83 e8 02             	sub    $0x2,%eax
     9df:	89 c2                	mov    %eax,%edx
     9e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
     9e4:	68 ff ff 00 00       	push   $0xffff
     9e9:	51                   	push   %ecx
     9ea:	52                   	push   %edx
     9eb:	50                   	push   %eax
     9ec:	6a 01                	push   $0x1
     9ee:	ff 75 10             	pushl  0x10(%ebp)
     9f1:	ff 75 0c             	pushl  0xc(%ebp)
     9f4:	ff 75 08             	pushl  0x8(%ebp)
     9f7:	e8 56 25 00 00       	call   2f52 <fill_rect>
     9fc:	83 c4 20             	add    $0x20,%esp
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     9ff:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     a02:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     a05:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     a08:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     a0b:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     a0e:	83 e8 01             	sub    $0x1,%eax
     a11:	6a 00                	push   $0x0
     a13:	51                   	push   %ecx
     a14:	52                   	push   %edx
     a15:	50                   	push   %eax
     a16:	6a 00                	push   $0x0
     a18:	ff 75 10             	pushl  0x10(%ebp)
     a1b:	ff 75 0c             	pushl  0xc(%ebp)
     a1e:	ff 75 08             	pushl  0x8(%ebp)
     a21:	e8 f2 2b 00 00       	call   3618 <draw_line>
     a26:	83 c4 20             	add    $0x20,%esp

	//printf(0, "listing complete!\n");
	//printItemList();
//	p = fileItemList;
//	q = 0;
	if (keyContent.length == 0) {
     a29:	a1 20 37 01 00       	mov    0x13720,%eax
     a2e:	85 c0                	test   %eax,%eax
     a30:	75 72                	jne    aa4 <drawFinderContent+0xf6>
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
     a32:	83 ec 08             	sub    $0x8,%esp
     a35:	68 88 b1 00 00       	push   $0xb188
     a3a:	6a 00                	push   $0x0
     a3c:	e8 22 40 00 00       	call   4a63 <printf>
     a41:	83 c4 10             	add    $0x10,%esp
//		freeFileItemList();
//		list(".");
		p = fileItemList;
     a44:	a1 4c ff 00 00       	mov    0xff4c,%eax
     a49:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while (p != 0) {
     a4c:	eb 4b                	jmp    a99 <drawFinderContent+0xeb>
			//printf(0, "draw item\n");
			drawItem(context, p->name, p->st, p->pos, p->chosen);
     a4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a51:	8b 40 28             	mov    0x28(%eax),%eax
     a54:	8b 55 f4             	mov    -0xc(%ebp),%edx
     a57:	8b 52 14             	mov    0x14(%edx),%edx
     a5a:	83 ec 08             	sub    $0x8,%esp
     a5d:	50                   	push   %eax
     a5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a61:	ff 70 24             	pushl  0x24(%eax)
     a64:	ff 70 20             	pushl  0x20(%eax)
     a67:	ff 70 1c             	pushl  0x1c(%eax)
     a6a:	ff 70 18             	pushl  0x18(%eax)
     a6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a70:	ff 70 10             	pushl  0x10(%eax)
     a73:	ff 70 0c             	pushl  0xc(%eax)
     a76:	ff 70 08             	pushl  0x8(%eax)
     a79:	ff 70 04             	pushl  0x4(%eax)
     a7c:	ff 30                	pushl  (%eax)
     a7e:	52                   	push   %edx
     a7f:	ff 75 10             	pushl  0x10(%ebp)
     a82:	ff 75 0c             	pushl  0xc(%ebp)
     a85:	ff 75 08             	pushl  0x8(%ebp)
     a88:	e8 61 fa ff ff       	call   4ee <drawItem>
     a8d:	83 c4 40             	add    $0x40,%esp
			p = p->next;
     a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a93:	8b 40 2c             	mov    0x2c(%eax),%eax
     a96:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (keyContent.length == 0) {
		printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
		while (p != 0) {
     a99:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a9d:	75 af                	jne    a4e <drawFinderContent+0xa0>
     a9f:	e9 c0 00 00 00       	jmp    b64 <drawFinderContent+0x1b6>
			drawItem(context, p->name, p->st, p->pos, p->chosen);
			p = p->next;
		}
	}
	else{
		p = fileItemList;
     aa4:	a1 4c ff 00 00       	mov    0xff4c,%eax
     aa9:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while(p != 0) {
     aac:	e9 a9 00 00 00       	jmp    b5a <drawFinderContent+0x1ac>
			printf(0, "now you are searching!\n");
     ab1:	83 ec 08             	sub    $0x8,%esp
     ab4:	68 e1 b1 00 00       	push   $0xb1e1
     ab9:	6a 00                	push   $0x0
     abb:	e8 a3 3f 00 00       	call   4a63 <printf>
     ac0:	83 c4 10             	add    $0x10,%esp
		   	if (strstr(p->name, keyContent.content)) {
     ac3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ac6:	8b 40 14             	mov    0x14(%eax),%eax
     ac9:	83 ec 08             	sub    $0x8,%esp
     acc:	68 0c 37 01 00       	push   $0x1370c
     ad1:	50                   	push   %eax
     ad2:	e8 29 f5 ff ff       	call   0 <strstr>
     ad7:	83 c4 10             	add    $0x10,%esp
     ada:	85 c0                	test   %eax,%eax
     adc:	74 73                	je     b51 <drawFinderContent+0x1a3>
				drawItem(context, p->name, p->st, getPos(context, tempItemCounter++), p->chosen);
     ade:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ae1:	8b 58 28             	mov    0x28(%eax),%ebx
     ae4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ae7:	8d 50 01             	lea    0x1(%eax),%edx
     aea:	89 55 f0             	mov    %edx,-0x10(%ebp)
     aed:	8d 55 dc             	lea    -0x24(%ebp),%edx
     af0:	83 ec 0c             	sub    $0xc,%esp
     af3:	50                   	push   %eax
     af4:	ff 75 10             	pushl  0x10(%ebp)
     af7:	ff 75 0c             	pushl  0xc(%ebp)
     afa:	ff 75 08             	pushl  0x8(%ebp)
     afd:	52                   	push   %edx
     afe:	e8 3e 02 00 00       	call   d41 <getPos>
     b03:	83 c4 1c             	add    $0x1c,%esp
     b06:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b09:	8b 50 14             	mov    0x14(%eax),%edx
     b0c:	83 ec 08             	sub    $0x8,%esp
     b0f:	53                   	push   %ebx
     b10:	ff 75 e8             	pushl  -0x18(%ebp)
     b13:	ff 75 e4             	pushl  -0x1c(%ebp)
     b16:	ff 75 e0             	pushl  -0x20(%ebp)
     b19:	ff 75 dc             	pushl  -0x24(%ebp)
     b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b1f:	ff 70 10             	pushl  0x10(%eax)
     b22:	ff 70 0c             	pushl  0xc(%eax)
     b25:	ff 70 08             	pushl  0x8(%eax)
     b28:	ff 70 04             	pushl  0x4(%eax)
     b2b:	ff 30                	pushl  (%eax)
     b2d:	52                   	push   %edx
     b2e:	ff 75 10             	pushl  0x10(%ebp)
     b31:	ff 75 0c             	pushl  0xc(%ebp)
     b34:	ff 75 08             	pushl  0x8(%ebp)
     b37:	e8 b2 f9 ff ff       	call   4ee <drawItem>
     b3c:	83 c4 40             	add    $0x40,%esp
				printf(0, "now you are searching! printing\n");
     b3f:	83 ec 08             	sub    $0x8,%esp
     b42:	68 fc b1 00 00       	push   $0xb1fc
     b47:	6a 00                	push   $0x0
     b49:	e8 15 3f 00 00       	call   4a63 <printf>
     b4e:	83 c4 10             	add    $0x10,%esp
		   	}
			p = p->next;
     b51:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b54:	8b 40 2c             	mov    0x2c(%eax),%eax
     b57:	89 45 f4             	mov    %eax,-0xc(%ebp)
			p = p->next;
		}
	}
	else{
		p = fileItemList;
		while(p != 0) {
     b5a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b5e:	0f 85 4d ff ff ff    	jne    ab1 <drawFinderContent+0x103>
			p = p->next;
			
		}
	}

	if (style == LIST_STYLE)
     b64:	a1 04 f5 00 00       	mov    0xf504,%eax
     b69:	83 f8 02             	cmp    $0x2,%eax
     b6c:	0f 85 a8 00 00 00    	jne    c1a <drawFinderContent+0x26c>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     b72:	68 14 a5 00 00       	push   $0xa514
     b77:	6a 1c                	push   $0x1c
     b79:	6a 26                	push   $0x26
     b7b:	6a 47                	push   $0x47
     b7d:	6a 01                	push   $0x1
     b7f:	ff 75 10             	pushl  0x10(%ebp)
     b82:	ff 75 0c             	pushl  0xc(%ebp)
     b85:	ff 75 08             	pushl  0x8(%ebp)
     b88:	e8 c5 23 00 00       	call   2f52 <fill_rect>
     b8d:	83 c4 20             	add    $0x20,%esp
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     b90:	68 14 a5 00 00       	push   $0xa514
     b95:	6a 1c                	push   $0x1c
     b97:	68 9f 00 00 00       	push   $0x9f
     b9c:	6a 47                	push   $0x47
     b9e:	6a 28                	push   $0x28
     ba0:	ff 75 10             	pushl  0x10(%ebp)
     ba3:	ff 75 0c             	pushl  0xc(%ebp)
     ba6:	ff 75 08             	pushl  0x8(%ebp)
     ba9:	e8 a4 23 00 00       	call   2f52 <fill_rect>
     bae:	83 c4 20             	add    $0x20,%esp
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     bb1:	8b 45 0c             	mov    0xc(%ebp),%eax
     bb4:	2d c9 00 00 00       	sub    $0xc9,%eax
     bb9:	68 14 a5 00 00       	push   $0xa514
     bbe:	6a 1c                	push   $0x1c
     bc0:	50                   	push   %eax
     bc1:	6a 47                	push   $0x47
     bc3:	68 c8 00 00 00       	push   $0xc8
     bc8:	ff 75 10             	pushl  0x10(%ebp)
     bcb:	ff 75 0c             	pushl  0xc(%ebp)
     bce:	ff 75 08             	pushl  0x8(%ebp)
     bd1:	e8 7c 23 00 00       	call   2f52 <fill_rect>
     bd6:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     bd9:	83 ec 04             	sub    $0x4,%esp
     bdc:	6a 50                	push   $0x50
     bde:	6a 2b                	push   $0x2b
     be0:	6a 00                	push   $0x0
     be2:	68 1d b2 00 00       	push   $0xb21d
     be7:	ff 75 10             	pushl  0x10(%ebp)
     bea:	ff 75 0c             	pushl  0xc(%ebp)
     bed:	ff 75 08             	pushl  0x8(%ebp)
     bf0:	e8 b8 28 00 00       	call   34ad <puts_str>
     bf5:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     bf8:	83 ec 04             	sub    $0x4,%esp
     bfb:	6a 50                	push   $0x50
     bfd:	68 cb 00 00 00       	push   $0xcb
     c02:	6a 00                	push   $0x0
     c04:	68 22 b2 00 00       	push   $0xb222
     c09:	ff 75 10             	pushl  0x10(%ebp)
     c0c:	ff 75 0c             	pushl  0xc(%ebp)
     c0f:	ff 75 08             	pushl  0x8(%ebp)
     c12:	e8 96 28 00 00       	call   34ad <puts_str>
     c17:	83 c4 20             	add    $0x20,%esp
		}
}
     c1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c1d:	c9                   	leave  
     c1e:	c3                   	ret    

00000c1f <int2str>:

char * int2str(int i)
{
     c1f:	55                   	push   %ebp
     c20:	89 e5                	mov    %esp,%ebp
     c22:	53                   	push   %ebx
     c23:	83 ec 14             	sub    $0x14,%esp
	int j;
	int n = 0;
     c26:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     c2d:	83 ec 0c             	sub    $0xc,%esp
     c30:	6a 04                	push   $0x4
     c32:	e8 fd 40 00 00       	call   4d34 <malloc>
     c37:	83 c4 10             	add    $0x10,%esp
     c3a:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     c3d:	83 ec 0c             	sub    $0xc,%esp
     c40:	6a 04                	push   $0x4
     c42:	e8 ed 40 00 00       	call   4d34 <malloc>
     c47:	83 c4 10             	add    $0x10,%esp
     c4a:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     c4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c50:	8d 50 01             	lea    0x1(%eax),%edx
     c53:	89 55 f0             	mov    %edx,-0x10(%ebp)
     c56:	89 c2                	mov    %eax,%edx
     c58:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c5b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     c5e:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c61:	ba 67 66 66 66       	mov    $0x66666667,%edx
     c66:	89 c8                	mov    %ecx,%eax
     c68:	f7 ea                	imul   %edx
     c6a:	c1 fa 02             	sar    $0x2,%edx
     c6d:	89 c8                	mov    %ecx,%eax
     c6f:	c1 f8 1f             	sar    $0x1f,%eax
     c72:	29 c2                	sub    %eax,%edx
     c74:	89 d0                	mov    %edx,%eax
     c76:	c1 e0 02             	shl    $0x2,%eax
     c79:	01 d0                	add    %edx,%eax
     c7b:	01 c0                	add    %eax,%eax
     c7d:	29 c1                	sub    %eax,%ecx
     c7f:	89 ca                	mov    %ecx,%edx
     c81:	89 d0                	mov    %edx,%eax
     c83:	83 c0 30             	add    $0x30,%eax
     c86:	88 03                	mov    %al,(%ebx)
		i /= 10;
     c88:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c8b:	ba 67 66 66 66       	mov    $0x66666667,%edx
     c90:	89 c8                	mov    %ecx,%eax
     c92:	f7 ea                	imul   %edx
     c94:	c1 fa 02             	sar    $0x2,%edx
     c97:	89 c8                	mov    %ecx,%eax
     c99:	c1 f8 1f             	sar    $0x1f,%eax
     c9c:	29 c2                	sub    %eax,%edx
     c9e:	89 d0                	mov    %edx,%eax
     ca0:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     ca3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     ca7:	75 a4                	jne    c4d <int2str+0x2e>
	result[n] = 0;
     ca9:	8b 55 f0             	mov    -0x10(%ebp),%edx
     cac:	8b 45 ec             	mov    -0x14(%ebp),%eax
     caf:	01 d0                	add    %edx,%eax
     cb1:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     cb4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     cbb:	eb 21                	jmp    cde <int2str+0xbf>
	{
		temp[j] = result[n-1-j];
     cbd:	8b 55 f4             	mov    -0xc(%ebp),%edx
     cc0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cc3:	01 c2                	add    %eax,%edx
     cc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cc8:	83 e8 01             	sub    $0x1,%eax
     ccb:	2b 45 f4             	sub    -0xc(%ebp),%eax
     cce:	89 c1                	mov    %eax,%ecx
     cd0:	8b 45 ec             	mov    -0x14(%ebp),%eax
     cd3:	01 c8                	add    %ecx,%eax
     cd5:	0f b6 00             	movzbl (%eax),%eax
     cd8:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
     cda:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     cde:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ce1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     ce4:	7c d7                	jl     cbd <int2str+0x9e>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
     ce6:	8b 55 f0             	mov    -0x10(%ebp),%edx
     ce9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cec:	01 d0                	add    %edx,%eax
     cee:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
     cf1:	83 ec 0c             	sub    $0xc,%esp
     cf4:	ff 75 ec             	pushl  -0x14(%ebp)
     cf7:	e8 f7 3e 00 00       	call   4bf3 <free>
     cfc:	83 c4 10             	add    $0x10,%esp
	return temp;
     cff:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
     d02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d05:	c9                   	leave  
     d06:	c3                   	ret    

00000d07 <printItemList>:

void printItemList() {
     d07:	55                   	push   %ebp
     d08:	89 e5                	mov    %esp,%ebp
     d0a:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p;
	p = fileItemList;
     d0d:	a1 4c ff 00 00       	mov    0xff4c,%eax
     d12:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     d15:	eb 22                	jmp    d39 <printItemList+0x32>
		printf(0, "%s\n", p->name);
     d17:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d1a:	8b 40 14             	mov    0x14(%eax),%eax
     d1d:	83 ec 04             	sub    $0x4,%esp
     d20:	50                   	push   %eax
     d21:	68 27 b2 00 00       	push   $0xb227
     d26:	6a 00                	push   $0x0
     d28:	e8 36 3d 00 00       	call   4a63 <printf>
     d2d:	83 c4 10             	add    $0x10,%esp
		p = p->next;
     d30:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d33:	8b 40 2c             	mov    0x2c(%eax),%eax
     d36:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
     d39:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d3d:	75 d8                	jne    d17 <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
     d3f:	c9                   	leave  
     d40:	c3                   	ret    

00000d41 <getPos>:

Rect getPos(Context context, int n) {
     d41:	55                   	push   %ebp
     d42:	89 e5                	mov    %esp,%ebp
     d44:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
     d47:	a1 04 f5 00 00       	mov    0xf504,%eax
     d4c:	83 f8 01             	cmp    $0x1,%eax
     d4f:	75 6e                	jne    dbf <getPos+0x7e>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     d51:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d54:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
     d59:	89 c8                	mov    %ecx,%eax
     d5b:	f7 ea                	imul   %edx
     d5d:	c1 fa 06             	sar    $0x6,%edx
     d60:	89 c8                	mov    %ecx,%eax
     d62:	c1 f8 1f             	sar    $0x1f,%eax
     d65:	29 c2                	sub    %eax,%edx
     d67:	89 d0                	mov    %edx,%eax
     d69:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
     d6c:	8b 45 18             	mov    0x18(%ebp),%eax
     d6f:	99                   	cltd   
     d70:	f7 7d f4             	idivl  -0xc(%ebp)
     d73:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
     d76:	8b 45 18             	mov    0x18(%ebp),%eax
     d79:	99                   	cltd   
     d7a:	f7 7d f4             	idivl  -0xc(%ebp)
     d7d:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
     d80:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d83:	6b c0 73             	imul   $0x73,%eax,%eax
     d86:	83 c0 5a             	add    $0x5a,%eax
     d89:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     d8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d8f:	01 c0                	add    %eax,%eax
     d91:	89 c2                	mov    %eax,%edx
     d93:	c1 e2 06             	shl    $0x6,%edx
     d96:	01 d0                	add    %edx,%eax
     d98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
     d9b:	8b 15 40 ff 00 00    	mov    0xff40,%edx
     da1:	8b 45 e8             	mov    -0x18(%ebp),%eax
     da4:	01 c2                	add    %eax,%edx
     da6:	8b 45 08             	mov    0x8(%ebp),%eax
     da9:	83 ec 0c             	sub    $0xc,%esp
     dac:	6a 5f                	push   $0x5f
     dae:	6a 64                	push   $0x64
     db0:	52                   	push   %edx
     db1:	ff 75 e4             	pushl  -0x1c(%ebp)
     db4:	50                   	push   %eax
     db5:	e8 e3 32 00 00       	call   409d <initRect>
     dba:	83 c4 1c             	add    $0x1c,%esp
     dbd:	eb 2c                	jmp    deb <getPos+0xaa>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
     dbf:	8b 4d 10             	mov    0x10(%ebp),%ecx
     dc2:	8b 55 18             	mov    0x18(%ebp),%edx
     dc5:	89 d0                	mov    %edx,%eax
     dc7:	c1 e0 05             	shl    $0x5,%eax
     dca:	29 d0                	sub    %edx,%eax
     dcc:	8d 50 62             	lea    0x62(%eax),%edx
     dcf:	a1 40 ff 00 00       	mov    0xff40,%eax
     dd4:	01 c2                	add    %eax,%edx
     dd6:	8b 45 08             	mov    0x8(%ebp),%eax
     dd9:	83 ec 0c             	sub    $0xc,%esp
     ddc:	6a 1e                	push   $0x1e
     dde:	51                   	push   %ecx
     ddf:	52                   	push   %edx
     de0:	6a 00                	push   $0x0
     de2:	50                   	push   %eax
     de3:	e8 b5 32 00 00       	call   409d <initRect>
     de8:	83 c4 1c             	add    $0x1c,%esp
				LIST_ITEM_HEIGHT);
	}
}
     deb:	8b 45 08             	mov    0x8(%ebp),%eax
     dee:	c9                   	leave  
     def:	c2 04 00             	ret    $0x4

00000df2 <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
     df2:	55                   	push   %ebp
     df3:	89 e5                	mov    %esp,%ebp
     df5:	83 ec 08             	sub    $0x8,%esp
	if (style == ICON_STYLE) {
     df8:	a1 04 f5 00 00       	mov    0xf504,%eax
     dfd:	83 f8 01             	cmp    $0x1,%eax
     e00:	75 0d                	jne    e0f <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
     e02:	8b 45 28             	mov    0x28(%ebp),%eax
     e05:	83 f8 45             	cmp    $0x45,%eax
     e08:	7f 12                	jg     e1c <addItemEvent+0x2a>
			return;
     e0a:	e9 95 00 00 00       	jmp    ea4 <addItemEvent+0xb2>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
     e0f:	8b 45 28             	mov    0x28(%ebp),%eax
     e12:	83 f8 61             	cmp    $0x61,%eax
     e15:	7f 05                	jg     e1c <addItemEvent+0x2a>
			return;
     e17:	e9 88 00 00 00       	jmp    ea4 <addItemEvent+0xb2>
	}
	switch (item.st.type) {
     e1c:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
     e20:	98                   	cwtl   
     e21:	83 f8 01             	cmp    $0x1,%eax
     e24:	74 28                	je     e4e <addItemEvent+0x5c>
     e26:	83 f8 02             	cmp    $0x2,%eax
     e29:	75 67                	jne    e92 <addItemEvent+0xa0>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     e2b:	83 ec 04             	sub    $0x4,%esp
     e2e:	68 68 24 00 00       	push   $0x2468
     e33:	6a 02                	push   $0x2
     e35:	ff 75 30             	pushl  0x30(%ebp)
     e38:	ff 75 2c             	pushl  0x2c(%ebp)
     e3b:	ff 75 28             	pushl  0x28(%ebp)
     e3e:	ff 75 24             	pushl  0x24(%ebp)
     e41:	ff 75 08             	pushl  0x8(%ebp)
     e44:	e8 36 33 00 00       	call   417f <createClickable>
     e49:	83 c4 20             	add    $0x20,%esp
		break;
     e4c:	eb 56                	jmp    ea4 <addItemEvent+0xb2>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     e4e:	83 ec 04             	sub    $0x4,%esp
     e51:	68 68 24 00 00       	push   $0x2468
     e56:	6a 02                	push   $0x2
     e58:	ff 75 30             	pushl  0x30(%ebp)
     e5b:	ff 75 2c             	pushl  0x2c(%ebp)
     e5e:	ff 75 28             	pushl  0x28(%ebp)
     e61:	ff 75 24             	pushl  0x24(%ebp)
     e64:	ff 75 08             	pushl  0x8(%ebp)
     e67:	e8 13 33 00 00       	call   417f <createClickable>
     e6c:	83 c4 20             	add    $0x20,%esp
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
     e6f:	83 ec 04             	sub    $0x4,%esp
     e72:	68 76 14 00 00       	push   $0x1476
     e77:	6a 04                	push   $0x4
     e79:	ff 75 30             	pushl  0x30(%ebp)
     e7c:	ff 75 2c             	pushl  0x2c(%ebp)
     e7f:	ff 75 28             	pushl  0x28(%ebp)
     e82:	ff 75 24             	pushl  0x24(%ebp)
     e85:	ff 75 08             	pushl  0x8(%ebp)
     e88:	e8 f2 32 00 00       	call   417f <createClickable>
     e8d:	83 c4 20             	add    $0x20,%esp
		break;
     e90:	eb 12                	jmp    ea4 <addItemEvent+0xb2>
	default:
		printf(0, "unknown file type!");
     e92:	83 ec 08             	sub    $0x8,%esp
     e95:	68 2b b2 00 00       	push   $0xb22b
     e9a:	6a 00                	push   $0x0
     e9c:	e8 c2 3b 00 00       	call   4a63 <printf>
     ea1:	83 c4 10             	add    $0x10,%esp
	}
}
     ea4:	c9                   	leave  
     ea5:	c3                   	ret    

00000ea6 <addListEvent>:

void addListEvent(ClickableManager *cm) {
     ea6:	55                   	push   %ebp
     ea7:	89 e5                	mov    %esp,%ebp
     ea9:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     eac:	a1 4c ff 00 00       	mov    0xff4c,%eax
     eb1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     eb4:	eb 43                	jmp    ef9 <addListEvent+0x53>
		temp = p;
     eb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     ebc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ebf:	8b 40 2c             	mov    0x2c(%eax),%eax
     ec2:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
     ec5:	83 ec 0c             	sub    $0xc,%esp
     ec8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ecb:	ff 70 2c             	pushl  0x2c(%eax)
     ece:	ff 70 28             	pushl  0x28(%eax)
     ed1:	ff 70 24             	pushl  0x24(%eax)
     ed4:	ff 70 20             	pushl  0x20(%eax)
     ed7:	ff 70 1c             	pushl  0x1c(%eax)
     eda:	ff 70 18             	pushl  0x18(%eax)
     edd:	ff 70 14             	pushl  0x14(%eax)
     ee0:	ff 70 10             	pushl  0x10(%eax)
     ee3:	ff 70 0c             	pushl  0xc(%eax)
     ee6:	ff 70 08             	pushl  0x8(%eax)
     ee9:	ff 70 04             	pushl  0x4(%eax)
     eec:	ff 30                	pushl  (%eax)
     eee:	ff 75 08             	pushl  0x8(%ebp)
     ef1:	e8 fc fe ff ff       	call   df2 <addItemEvent>
     ef6:	83 c4 40             	add    $0x40,%esp
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     ef9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     efd:	75 b7                	jne    eb6 <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
     eff:	c9                   	leave  
     f00:	c3                   	ret    

00000f01 <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
     f01:	55                   	push   %ebp
     f02:	89 e5                	mov    %esp,%ebp
     f04:	57                   	push   %edi
     f05:	56                   	push   %esi
     f06:	53                   	push   %ebx
     f07:	83 ec 2c             	sub    $0x2c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
     f0a:	c7 45 e0 0f 00 00 00 	movl   $0xf,-0x20(%ebp)
	for (i = 0; i < n; i++) {
     f11:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     f18:	e9 81 00 00 00       	jmp    f9e <addWndEvent+0x9d>
		createClickable(cm,
     f1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f20:	8b 1c 85 60 f9 00 00 	mov    0xf960(,%eax,4),%ebx
     f27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f2a:	6b c0 34             	imul   $0x34,%eax,%eax
     f2d:	83 c0 20             	add    $0x20,%eax
     f30:	05 40 f6 00 00       	add    $0xf640,%eax
     f35:	8b 78 10             	mov    0x10(%eax),%edi
     f38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f3b:	6b c0 34             	imul   $0x34,%eax,%eax
     f3e:	83 c0 20             	add    $0x20,%eax
     f41:	05 40 f6 00 00       	add    $0xf640,%eax
     f46:	8b 70 0c             	mov    0xc(%eax),%esi
     f49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f4c:	6b c0 34             	imul   $0x34,%eax,%eax
     f4f:	83 c0 20             	add    $0x20,%eax
     f52:	05 40 f6 00 00       	add    $0xf640,%eax
     f57:	8b 48 04             	mov    0x4(%eax),%ecx
     f5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f5d:	6b c0 34             	imul   $0x34,%eax,%eax
     f60:	83 c0 20             	add    $0x20,%eax
     f63:	05 40 f6 00 00       	add    $0xf640,%eax
     f68:	8b 10                	mov    (%eax),%edx
     f6a:	8d 45 d0             	lea    -0x30(%ebp),%eax
     f6d:	83 ec 0c             	sub    $0xc,%esp
     f70:	57                   	push   %edi
     f71:	56                   	push   %esi
     f72:	51                   	push   %ecx
     f73:	52                   	push   %edx
     f74:	50                   	push   %eax
     f75:	e8 23 31 00 00       	call   409d <initRect>
     f7a:	83 c4 1c             	add    $0x1c,%esp
     f7d:	83 ec 04             	sub    $0x4,%esp
     f80:	53                   	push   %ebx
     f81:	6a 02                	push   $0x2
     f83:	ff 75 dc             	pushl  -0x24(%ebp)
     f86:	ff 75 d8             	pushl  -0x28(%ebp)
     f89:	ff 75 d4             	pushl  -0x2c(%ebp)
     f8c:	ff 75 d0             	pushl  -0x30(%ebp)
     f8f:	ff 75 08             	pushl  0x8(%ebp)
     f92:	e8 e8 31 00 00       	call   417f <createClickable>
     f97:	83 c4 20             	add    $0x20,%esp
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
     f9a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     f9e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     fa1:	3b 45 e0             	cmp    -0x20(%ebp),%eax
     fa4:	0f 8c 73 ff ff ff    	jl     f1d <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
     faa:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fad:	5b                   	pop    %ebx
     fae:	5e                   	pop    %esi
     faf:	5f                   	pop    %edi
     fb0:	5d                   	pop    %ebp
     fb1:	c3                   	ret    

00000fb2 <getFileItem>:

struct fileItem * getFileItem(Point point) {
     fb2:	55                   	push   %ebp
     fb3:	89 e5                	mov    %esp,%ebp
     fb5:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p = fileItemList;
     fb8:	a1 4c ff 00 00       	mov    0xff4c,%eax
     fbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     fc0:	eb 32                	jmp    ff4 <getFileItem+0x42>
		if (isIn(point, p->pos)) {
     fc2:	83 ec 08             	sub    $0x8,%esp
     fc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fc8:	ff 70 24             	pushl  0x24(%eax)
     fcb:	ff 70 20             	pushl  0x20(%eax)
     fce:	ff 70 1c             	pushl  0x1c(%eax)
     fd1:	ff 70 18             	pushl  0x18(%eax)
     fd4:	ff 75 0c             	pushl  0xc(%ebp)
     fd7:	ff 75 08             	pushl  0x8(%ebp)
     fda:	e8 0f 31 00 00       	call   40ee <isIn>
     fdf:	83 c4 20             	add    $0x20,%esp
     fe2:	85 c0                	test   %eax,%eax
     fe4:	74 05                	je     feb <getFileItem+0x39>
			return p;
     fe6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fe9:	eb 14                	jmp    fff <getFileItem+0x4d>
		}
		p = p->next;
     feb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fee:	8b 40 2c             	mov    0x2c(%eax),%eax
     ff1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
     ff4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ff8:	75 c8                	jne    fc2 <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
     ffa:	b8 00 00 00 00       	mov    $0x0,%eax
}
     fff:	c9                   	leave  
    1000:	c3                   	ret    

00001001 <h_searchbox>:

void h_searchbox(Point p) {
    1001:	55                   	push   %ebp
    1002:	89 e5                	mov    %esp,%ebp
	isSearching = 1;
    1004:	c7 05 c0 2d 01 00 01 	movl   $0x1,0x12dc0
    100b:	00 00 00 
}
    100e:	5d                   	pop    %ebp
    100f:	c3                   	ret    

00001010 <scrollDown>:

void scrollDown() {
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *q = fileItemList;
    1016:	a1 4c ff 00 00       	mov    0xff4c,%eax
    101b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
    101e:	a1 04 f5 00 00       	mov    0xf504,%eax
    1023:	83 f8 01             	cmp    $0x1,%eax
    1026:	75 44                	jne    106c <scrollDown+0x5c>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
    1028:	8b 45 f4             	mov    -0xc(%ebp),%eax
    102b:	8b 40 1c             	mov    0x1c(%eax),%eax
    102e:	3d 63 01 00 00       	cmp    $0x163,%eax
    1033:	7e 79                	jle    10ae <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1035:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1038:	8b 40 1c             	mov    0x1c(%eax),%eax
    103b:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1040:	7e 0f                	jle    1051 <scrollDown+0x41>
				scrollOffset -= SCROLL_UNIT;
    1042:	a1 40 ff 00 00       	mov    0xff40,%eax
    1047:	83 e8 1e             	sub    $0x1e,%eax
    104a:	a3 40 ff 00 00       	mov    %eax,0xff40
    104f:	eb 5d                	jmp    10ae <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
    1051:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1054:	8b 40 1c             	mov    0x1c(%eax),%eax
    1057:	ba 63 01 00 00       	mov    $0x163,%edx
    105c:	29 c2                	sub    %eax,%edx
    105e:	a1 40 ff 00 00       	mov    0xff40,%eax
    1063:	01 d0                	add    %edx,%eax
    1065:	a3 40 ff 00 00       	mov    %eax,0xff40
    106a:	eb 42                	jmp    10ae <scrollDown+0x9e>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
    106c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    106f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1072:	3d a4 01 00 00       	cmp    $0x1a4,%eax
    1077:	7e 35                	jle    10ae <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1079:	8b 45 f4             	mov    -0xc(%ebp),%eax
    107c:	8b 40 1c             	mov    0x1c(%eax),%eax
    107f:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1084:	7e 0f                	jle    1095 <scrollDown+0x85>
				scrollOffset -= SCROLL_UNIT;
    1086:	a1 40 ff 00 00       	mov    0xff40,%eax
    108b:	83 e8 1e             	sub    $0x1e,%eax
    108e:	a3 40 ff 00 00       	mov    %eax,0xff40
    1093:	eb 19                	jmp    10ae <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    1095:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1098:	8b 40 1c             	mov    0x1c(%eax),%eax
    109b:	ba a4 01 00 00       	mov    $0x1a4,%edx
    10a0:	29 c2                	sub    %eax,%edx
    10a2:	a1 40 ff 00 00       	mov    0xff40,%eax
    10a7:	01 d0                	add    %edx,%eax
    10a9:	a3 40 ff 00 00       	mov    %eax,0xff40
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    10ae:	a1 40 ff 00 00       	mov    0xff40,%eax
    10b3:	83 ec 04             	sub    $0x4,%esp
    10b6:	50                   	push   %eax
    10b7:	68 40 b2 00 00       	push   $0xb240
    10bc:	6a 00                	push   $0x0
    10be:	e8 a0 39 00 00       	call   4a63 <printf>
    10c3:	83 c4 10             	add    $0x10,%esp
}
    10c6:	c9                   	leave  
    10c7:	c3                   	ret    

000010c8 <h_scrollDown>:

void h_scrollDown(Point p) {
    10c8:	55                   	push   %ebp
    10c9:	89 e5                	mov    %esp,%ebp
    10cb:	83 ec 18             	sub    $0x18,%esp
	scrollDown();
    10ce:	e8 3d ff ff ff       	call   1010 <scrollDown>
	freeFileItemList();
    10d3:	e8 89 f0 ff ff       	call   161 <freeFileItemList>
	list(".");
    10d8:	83 ec 0c             	sub    $0xc,%esp
    10db:	68 5f b2 00 00       	push   $0xb25f
    10e0:	e8 66 f1 ff ff       	call   24b <list>
    10e5:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    10e8:	83 ec 04             	sub    $0x4,%esp
    10eb:	ff 35 08 37 01 00    	pushl  0x13708
    10f1:	ff 35 04 37 01 00    	pushl  0x13704
    10f7:	ff 35 00 37 01 00    	pushl  0x13700
    10fd:	e8 ac f8 ff ff       	call   9ae <drawFinderContent>
    1102:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1105:	83 ec 04             	sub    $0x4,%esp
    1108:	ff 35 08 37 01 00    	pushl  0x13708
    110e:	ff 35 04 37 01 00    	pushl  0x13704
    1114:	ff 35 00 37 01 00    	pushl  0x13700
    111a:	e8 74 f7 ff ff       	call   893 <drawFinderWnd>
    111f:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1122:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1125:	83 ec 0c             	sub    $0xc,%esp
    1128:	68 58 02 00 00       	push   $0x258
    112d:	68 20 03 00 00       	push   $0x320
    1132:	6a 00                	push   $0x0
    1134:	6a 00                	push   $0x0
    1136:	50                   	push   %eax
    1137:	e8 61 2f 00 00       	call   409d <initRect>
    113c:	83 c4 1c             	add    $0x1c,%esp
    113f:	83 ec 0c             	sub    $0xc,%esp
    1142:	ff 75 f4             	pushl  -0xc(%ebp)
    1145:	ff 75 f0             	pushl  -0x10(%ebp)
    1148:	ff 75 ec             	pushl  -0x14(%ebp)
    114b:	ff 75 e8             	pushl  -0x18(%ebp)
    114e:	68 40 38 01 00       	push   $0x13840
    1153:	e8 0a 31 00 00       	call   4262 <deleteClickable>
    1158:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    115b:	83 ec 0c             	sub    $0xc,%esp
    115e:	68 40 38 01 00       	push   $0x13840
    1163:	e8 99 fd ff ff       	call   f01 <addWndEvent>
    1168:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    116b:	83 ec 0c             	sub    $0xc,%esp
    116e:	68 40 38 01 00       	push   $0x13840
    1173:	e8 2e fd ff ff       	call   ea6 <addListEvent>
    1178:	83 c4 10             	add    $0x10,%esp
}
    117b:	c9                   	leave  
    117c:	c3                   	ret    

0000117d <scrollUp>:

void scrollUp() {
    117d:	55                   	push   %ebp
    117e:	89 e5                	mov    %esp,%ebp
    1180:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *q = fileItemList;
    1183:	a1 4c ff 00 00       	mov    0xff4c,%eax
    1188:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
    118b:	eb 0f                	jmp    119c <scrollUp+0x1f>
	{
		p = q;
    118d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1190:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
    1193:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1196:	8b 40 2c             	mov    0x2c(%eax),%eax
    1199:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
    119c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11a0:	75 eb                	jne    118d <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	if (style == ICON_STYLE){
    11a2:	a1 04 f5 00 00       	mov    0xf504,%eax
    11a7:	83 f8 01             	cmp    $0x1,%eax
    11aa:	75 40                	jne    11ec <scrollUp+0x6f>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
    11ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11af:	8b 40 1c             	mov    0x1c(%eax),%eax
    11b2:	83 f8 45             	cmp    $0x45,%eax
    11b5:	7f 73                	jg     122a <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
    11b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11ba:	8b 40 1c             	mov    0x1c(%eax),%eax
    11bd:	83 f8 e7             	cmp    $0xffffffe7,%eax
    11c0:	7d 0f                	jge    11d1 <scrollUp+0x54>
				scrollOffset += SCROLL_UNIT;
    11c2:	a1 40 ff 00 00       	mov    0xff40,%eax
    11c7:	83 c0 1e             	add    $0x1e,%eax
    11ca:	a3 40 ff 00 00       	mov    %eax,0xff40
    11cf:	eb 59                	jmp    122a <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
    11d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11d4:	8b 40 1c             	mov    0x1c(%eax),%eax
    11d7:	ba 46 00 00 00       	mov    $0x46,%edx
    11dc:	29 c2                	sub    %eax,%edx
    11de:	a1 40 ff 00 00       	mov    0xff40,%eax
    11e3:	01 d0                	add    %edx,%eax
    11e5:	a3 40 ff 00 00       	mov    %eax,0xff40
    11ea:	eb 3e                	jmp    122a <scrollUp+0xad>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    11ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11ef:	8b 40 1c             	mov    0x1c(%eax),%eax
    11f2:	83 f8 61             	cmp    $0x61,%eax
    11f5:	7f 33                	jg     122a <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    11f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11fa:	8b 40 1c             	mov    0x1c(%eax),%eax
    11fd:	83 f8 43             	cmp    $0x43,%eax
    1200:	7f 0f                	jg     1211 <scrollUp+0x94>
				scrollOffset += SCROLL_UNIT;
    1202:	a1 40 ff 00 00       	mov    0xff40,%eax
    1207:	83 c0 1e             	add    $0x1e,%eax
    120a:	a3 40 ff 00 00       	mov    %eax,0xff40
    120f:	eb 19                	jmp    122a <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    1211:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1214:	8b 40 1c             	mov    0x1c(%eax),%eax
    1217:	ba 62 00 00 00       	mov    $0x62,%edx
    121c:	29 c2                	sub    %eax,%edx
    121e:	a1 40 ff 00 00       	mov    0xff40,%eax
    1223:	01 d0                	add    %edx,%eax
    1225:	a3 40 ff 00 00       	mov    %eax,0xff40
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    122a:	a1 40 ff 00 00       	mov    0xff40,%eax
    122f:	83 ec 04             	sub    $0x4,%esp
    1232:	50                   	push   %eax
    1233:	68 61 b2 00 00       	push   $0xb261
    1238:	6a 00                	push   $0x0
    123a:	e8 24 38 00 00       	call   4a63 <printf>
    123f:	83 c4 10             	add    $0x10,%esp
}
    1242:	c9                   	leave  
    1243:	c3                   	ret    

00001244 <h_scrollUp>:

void h_scrollUp(Point p) {
    1244:	55                   	push   %ebp
    1245:	89 e5                	mov    %esp,%ebp
    1247:	83 ec 18             	sub    $0x18,%esp
	scrollUp();
    124a:	e8 2e ff ff ff       	call   117d <scrollUp>
	freeFileItemList();
    124f:	e8 0d ef ff ff       	call   161 <freeFileItemList>
	list(".");
    1254:	83 ec 0c             	sub    $0xc,%esp
    1257:	68 5f b2 00 00       	push   $0xb25f
    125c:	e8 ea ef ff ff       	call   24b <list>
    1261:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1264:	83 ec 04             	sub    $0x4,%esp
    1267:	ff 35 08 37 01 00    	pushl  0x13708
    126d:	ff 35 04 37 01 00    	pushl  0x13704
    1273:	ff 35 00 37 01 00    	pushl  0x13700
    1279:	e8 30 f7 ff ff       	call   9ae <drawFinderContent>
    127e:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1281:	83 ec 04             	sub    $0x4,%esp
    1284:	ff 35 08 37 01 00    	pushl  0x13708
    128a:	ff 35 04 37 01 00    	pushl  0x13704
    1290:	ff 35 00 37 01 00    	pushl  0x13700
    1296:	e8 f8 f5 ff ff       	call   893 <drawFinderWnd>
    129b:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    129e:	8d 45 e8             	lea    -0x18(%ebp),%eax
    12a1:	83 ec 0c             	sub    $0xc,%esp
    12a4:	68 58 02 00 00       	push   $0x258
    12a9:	68 20 03 00 00       	push   $0x320
    12ae:	6a 00                	push   $0x0
    12b0:	6a 00                	push   $0x0
    12b2:	50                   	push   %eax
    12b3:	e8 e5 2d 00 00       	call   409d <initRect>
    12b8:	83 c4 1c             	add    $0x1c,%esp
    12bb:	83 ec 0c             	sub    $0xc,%esp
    12be:	ff 75 f4             	pushl  -0xc(%ebp)
    12c1:	ff 75 f0             	pushl  -0x10(%ebp)
    12c4:	ff 75 ec             	pushl  -0x14(%ebp)
    12c7:	ff 75 e8             	pushl  -0x18(%ebp)
    12ca:	68 40 38 01 00       	push   $0x13840
    12cf:	e8 8e 2f 00 00       	call   4262 <deleteClickable>
    12d4:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    12d7:	83 ec 0c             	sub    $0xc,%esp
    12da:	68 40 38 01 00       	push   $0x13840
    12df:	e8 1d fc ff ff       	call   f01 <addWndEvent>
    12e4:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    12e7:	83 ec 0c             	sub    $0xc,%esp
    12ea:	68 40 38 01 00       	push   $0x13840
    12ef:	e8 b2 fb ff ff       	call   ea6 <addListEvent>
    12f4:	83 c4 10             	add    $0x10,%esp
}
    12f7:	c9                   	leave  
    12f8:	c3                   	ret    

000012f9 <updatePath>:

void updatePath(char *name) {
    12f9:	55                   	push   %ebp
    12fa:	89 e5                	mov    %esp,%ebp
    12fc:	83 ec 18             	sub    $0x18,%esp
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    12ff:	83 ec 0c             	sub    $0xc,%esp
    1302:	ff 75 08             	pushl  0x8(%ebp)
    1305:	e8 bb 33 00 00       	call   46c5 <strlen>
    130a:	83 c4 10             	add    $0x10,%esp
    130d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    1310:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1314:	0f 85 90 00 00 00    	jne    13aa <updatePath+0xb1>
    131a:	8b 45 08             	mov    0x8(%ebp),%eax
    131d:	0f b6 00             	movzbl (%eax),%eax
    1320:	3c 2e                	cmp    $0x2e,%al
    1322:	0f 85 82 00 00 00    	jne    13aa <updatePath+0xb1>
    1328:	8b 45 08             	mov    0x8(%ebp),%eax
    132b:	83 c0 01             	add    $0x1,%eax
    132e:	0f b6 00             	movzbl (%eax),%eax
    1331:	3c 2e                	cmp    $0x2e,%al
    1333:	75 75                	jne    13aa <updatePath+0xb1>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1335:	83 ec 0c             	sub    $0xc,%esp
    1338:	68 40 37 01 00       	push   $0x13740
    133d:	e8 83 33 00 00       	call   46c5 <strlen>
    1342:	83 c4 10             	add    $0x10,%esp
    1345:	83 f8 01             	cmp    $0x1,%eax
    1348:	75 0b                	jne    1355 <updatePath+0x5c>
    134a:	0f b6 05 40 37 01 00 	movzbl 0x13740,%eax
    1351:	3c 2f                	cmp    $0x2f,%al
    1353:	74 53                	je     13a8 <updatePath+0xaf>
        {
            int tmpn = strlen(currentPath);
    1355:	83 ec 0c             	sub    $0xc,%esp
    1358:	68 40 37 01 00       	push   $0x13740
    135d:	e8 63 33 00 00       	call   46c5 <strlen>
    1362:	83 c4 10             	add    $0x10,%esp
    1365:	89 45 ec             	mov    %eax,-0x14(%ebp)
            currentPath[tmpn - 1] = '\0';
    1368:	8b 45 ec             	mov    -0x14(%ebp),%eax
    136b:	83 e8 01             	sub    $0x1,%eax
    136e:	c6 80 40 37 01 00 00 	movb   $0x0,0x13740(%eax)
            for (i = tmpn - 2; i > 0; i--)
    1375:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1378:	83 e8 02             	sub    $0x2,%eax
    137b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    137e:	eb 22                	jmp    13a2 <updatePath+0xa9>
            {
                if (currentPath[i] != '/')
    1380:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1383:	05 40 37 01 00       	add    $0x13740,%eax
    1388:	0f b6 00             	movzbl (%eax),%eax
    138b:	3c 2f                	cmp    $0x2f,%al
    138d:	74 0d                	je     139c <updatePath+0xa3>
                    currentPath[i] = '\0';
    138f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1392:	05 40 37 01 00       	add    $0x13740,%eax
    1397:	c6 00 00             	movb   $0x0,(%eax)
    139a:	eb 02                	jmp    139e <updatePath+0xa5>
                else
                    break;
    139c:	eb 0a                	jmp    13a8 <updatePath+0xaf>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    139e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    13a2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13a6:	7f d8                	jg     1380 <updatePath+0x87>
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    13a8:	eb 55                	jmp    13ff <updatePath+0x106>
            }
        }
    }
    else
    {
        int tmpn = strlen(currentPath);
    13aa:	83 ec 0c             	sub    $0xc,%esp
    13ad:	68 40 37 01 00       	push   $0x13740
    13b2:	e8 0e 33 00 00       	call   46c5 <strlen>
    13b7:	83 c4 10             	add    $0x10,%esp
    13ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
        strcpy(currentPath + tmpn, name);
    13bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13c0:	05 40 37 01 00       	add    $0x13740,%eax
    13c5:	83 ec 08             	sub    $0x8,%esp
    13c8:	ff 75 08             	pushl  0x8(%ebp)
    13cb:	50                   	push   %eax
    13cc:	e8 85 32 00 00       	call   4656 <strcpy>
    13d1:	83 c4 10             	add    $0x10,%esp
        tmpn = strlen(currentPath);
    13d4:	83 ec 0c             	sub    $0xc,%esp
    13d7:	68 40 37 01 00       	push   $0x13740
    13dc:	e8 e4 32 00 00       	call   46c5 <strlen>
    13e1:	83 c4 10             	add    $0x10,%esp
    13e4:	89 45 e8             	mov    %eax,-0x18(%ebp)
        currentPath[tmpn] = '/';
    13e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13ea:	05 40 37 01 00       	add    $0x13740,%eax
    13ef:	c6 00 2f             	movb   $0x2f,(%eax)
        currentPath[tmpn + 1] = '\0';
    13f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13f5:	83 c0 01             	add    $0x1,%eax
    13f8:	c6 80 40 37 01 00 00 	movb   $0x0,0x13740(%eax)
    }
}
    13ff:	c9                   	leave  
    1400:	c3                   	ret    

00001401 <enterDir>:

// Handlers
void enterDir(char *name) {
    1401:	55                   	push   %ebp
    1402:	89 e5                	mov    %esp,%ebp
    1404:	83 ec 08             	sub    $0x8,%esp
	scrollOffset = 0;
    1407:	c7 05 40 ff 00 00 00 	movl   $0x0,0xff40
    140e:	00 00 00 
	printf(0, "entering : %s\n", name);
    1411:	83 ec 04             	sub    $0x4,%esp
    1414:	ff 75 08             	pushl  0x8(%ebp)
    1417:	68 7e b2 00 00       	push   $0xb27e
    141c:	6a 00                	push   $0x0
    141e:	e8 40 36 00 00       	call   4a63 <printf>
    1423:	83 c4 10             	add    $0x10,%esp
	if (chdir(name) < 0)
    1426:	83 ec 0c             	sub    $0xc,%esp
    1429:	ff 75 08             	pushl  0x8(%ebp)
    142c:	e8 c5 34 00 00       	call   48f6 <chdir>
    1431:	83 c4 10             	add    $0x10,%esp
    1434:	85 c0                	test   %eax,%eax
    1436:	79 17                	jns    144f <enterDir+0x4e>
		printf(2, "cannot cd %s\n", name);
    1438:	83 ec 04             	sub    $0x4,%esp
    143b:	ff 75 08             	pushl  0x8(%ebp)
    143e:	68 8d b2 00 00       	push   $0xb28d
    1443:	6a 02                	push   $0x2
    1445:	e8 19 36 00 00       	call   4a63 <printf>
    144a:	83 c4 10             	add    $0x10,%esp
    144d:	eb 0e                	jmp    145d <enterDir+0x5c>
	else
		updatePath(name);
    144f:	83 ec 0c             	sub    $0xc,%esp
    1452:	ff 75 08             	pushl  0x8(%ebp)
    1455:	e8 9f fe ff ff       	call   12f9 <updatePath>
    145a:	83 c4 10             	add    $0x10,%esp
	printf(0, "currentPath: %s\n", currentPath);
    145d:	83 ec 04             	sub    $0x4,%esp
    1460:	68 40 37 01 00       	push   $0x13740
    1465:	68 9b b2 00 00       	push   $0xb29b
    146a:	6a 00                	push   $0x0
    146c:	e8 f2 35 00 00       	call   4a63 <printf>
    1471:	83 c4 10             	add    $0x10,%esp
}
    1474:	c9                   	leave  
    1475:	c3                   	ret    

00001476 <h_enterDir>:

void h_enterDir(Point p) {
    1476:	55                   	push   %ebp
    1477:	89 e5                	mov    %esp,%ebp
    1479:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    147c:	83 ec 08             	sub    $0x8,%esp
    147f:	ff 75 0c             	pushl  0xc(%ebp)
    1482:	ff 75 08             	pushl  0x8(%ebp)
    1485:	e8 28 fb ff ff       	call   fb2 <getFileItem>
    148a:	83 c4 10             	add    $0x10,%esp
    148d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    1490:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1493:	8b 40 14             	mov    0x14(%eax),%eax
    1496:	83 ec 0c             	sub    $0xc,%esp
    1499:	50                   	push   %eax
    149a:	e8 62 ff ff ff       	call   1401 <enterDir>
    149f:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    14a2:	e8 ba ec ff ff       	call   161 <freeFileItemList>
	list(".");
    14a7:	83 ec 0c             	sub    $0xc,%esp
    14aa:	68 5f b2 00 00       	push   $0xb25f
    14af:	e8 97 ed ff ff       	call   24b <list>
    14b4:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    14b7:	83 ec 04             	sub    $0x4,%esp
    14ba:	ff 35 08 37 01 00    	pushl  0x13708
    14c0:	ff 35 04 37 01 00    	pushl  0x13704
    14c6:	ff 35 00 37 01 00    	pushl  0x13700
    14cc:	e8 dd f4 ff ff       	call   9ae <drawFinderContent>
    14d1:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    14d4:	83 ec 04             	sub    $0x4,%esp
    14d7:	ff 35 08 37 01 00    	pushl  0x13708
    14dd:	ff 35 04 37 01 00    	pushl  0x13704
    14e3:	ff 35 00 37 01 00    	pushl  0x13700
    14e9:	e8 a5 f3 ff ff       	call   893 <drawFinderWnd>
    14ee:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    14f1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    14f4:	83 ec 0c             	sub    $0xc,%esp
    14f7:	68 58 02 00 00       	push   $0x258
    14fc:	68 20 03 00 00       	push   $0x320
    1501:	6a 00                	push   $0x0
    1503:	6a 00                	push   $0x0
    1505:	50                   	push   %eax
    1506:	e8 92 2b 00 00       	call   409d <initRect>
    150b:	83 c4 1c             	add    $0x1c,%esp
    150e:	83 ec 0c             	sub    $0xc,%esp
    1511:	ff 75 f0             	pushl  -0x10(%ebp)
    1514:	ff 75 ec             	pushl  -0x14(%ebp)
    1517:	ff 75 e8             	pushl  -0x18(%ebp)
    151a:	ff 75 e4             	pushl  -0x1c(%ebp)
    151d:	68 40 38 01 00       	push   $0x13840
    1522:	e8 3b 2d 00 00       	call   4262 <deleteClickable>
    1527:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    152a:	83 ec 0c             	sub    $0xc,%esp
    152d:	68 40 38 01 00       	push   $0x13840
    1532:	e8 ca f9 ff ff       	call   f01 <addWndEvent>
    1537:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    153a:	83 ec 0c             	sub    $0xc,%esp
    153d:	68 40 38 01 00       	push   $0x13840
    1542:	e8 5f f9 ff ff       	call   ea6 <addListEvent>
    1547:	83 c4 10             	add    $0x10,%esp
}
    154a:	c9                   	leave  
    154b:	c3                   	ret    

0000154c <newFile>:

void newFile(char *name) {
    154c:	55                   	push   %ebp
    154d:	89 e5                	mov    %esp,%ebp
    154f:	83 ec 18             	sub    $0x18,%esp
	int fd;
	int n = strlen(name);
    1552:	83 ec 0c             	sub    $0xc,%esp
    1555:	ff 75 08             	pushl  0x8(%ebp)
    1558:	e8 68 31 00 00       	call   46c5 <strlen>
    155d:	83 c4 10             	add    $0x10,%esp
    1560:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    1563:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    156a:	eb 70                	jmp    15dc <newFile+0x90>
	{
		n = strlen(name);
    156c:	83 ec 0c             	sub    $0xc,%esp
    156f:	ff 75 08             	pushl  0x8(%ebp)
    1572:	e8 4e 31 00 00       	call   46c5 <strlen>
    1577:	83 c4 10             	add    $0x10,%esp
    157a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    157d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1580:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1583:	75 09                	jne    158e <newFile+0x42>
		{
			counter = 1;
    1585:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    158c:	eb 1b                	jmp    15a9 <newFile+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    158e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1591:	8b 45 08             	mov    0x8(%ebp),%eax
    1594:	01 d0                	add    %edx,%eax
    1596:	83 ec 0c             	sub    $0xc,%esp
    1599:	50                   	push   %eax
    159a:	e8 55 32 00 00       	call   47f4 <atoi>
    159f:	83 c4 10             	add    $0x10,%esp
    15a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    15a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    15a9:	83 ec 0c             	sub    $0xc,%esp
    15ac:	ff 75 f4             	pushl  -0xc(%ebp)
    15af:	e8 6b f6 ff ff       	call   c1f <int2str>
    15b4:	83 c4 10             	add    $0x10,%esp
    15b7:	89 c1                	mov    %eax,%ecx
    15b9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15bc:	8b 45 08             	mov    0x8(%ebp),%eax
    15bf:	01 d0                	add    %edx,%eax
    15c1:	83 ec 08             	sub    $0x8,%esp
    15c4:	51                   	push   %ecx
    15c5:	50                   	push   %eax
    15c6:	e8 8b 30 00 00       	call   4656 <strcpy>
    15cb:	83 c4 10             	add    $0x10,%esp
		close(fd);
    15ce:	83 ec 0c             	sub    $0xc,%esp
    15d1:	ff 75 e8             	pushl  -0x18(%ebp)
    15d4:	e8 d5 32 00 00       	call   48ae <close>
    15d9:	83 c4 10             	add    $0x10,%esp
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    15dc:	83 ec 08             	sub    $0x8,%esp
    15df:	6a 00                	push   $0x0
    15e1:	ff 75 08             	pushl  0x8(%ebp)
    15e4:	e8 dd 32 00 00       	call   48c6 <open>
    15e9:	83 c4 10             	add    $0x10,%esp
    15ec:	89 45 e8             	mov    %eax,-0x18(%ebp)
    15ef:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    15f3:	0f 8f 73 ff ff ff    	jg     156c <newFile+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    15f9:	83 ec 08             	sub    $0x8,%esp
    15fc:	68 00 02 00 00       	push   $0x200
    1601:	ff 75 08             	pushl  0x8(%ebp)
    1604:	e8 bd 32 00 00       	call   48c6 <open>
    1609:	83 c4 10             	add    $0x10,%esp
    160c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    160f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1613:	79 1a                	jns    162f <newFile+0xe3>
		printf(0, "cat: cannot open %s\n", name);
    1615:	83 ec 04             	sub    $0x4,%esp
    1618:	ff 75 08             	pushl  0x8(%ebp)
    161b:	68 ac b2 00 00       	push   $0xb2ac
    1620:	6a 00                	push   $0x0
    1622:	e8 3c 34 00 00       	call   4a63 <printf>
    1627:	83 c4 10             	add    $0x10,%esp
		exit();
    162a:	e8 57 32 00 00       	call   4886 <exit>
	}
	close(fd);
    162f:	83 ec 0c             	sub    $0xc,%esp
    1632:	ff 75 e8             	pushl  -0x18(%ebp)
    1635:	e8 74 32 00 00       	call   48ae <close>
    163a:	83 c4 10             	add    $0x10,%esp
}
    163d:	c9                   	leave  
    163e:	c3                   	ret    

0000163f <h_newFile>:

void h_newFile(Point p) {
    163f:	55                   	push   %ebp
    1640:	89 e5                	mov    %esp,%ebp
    1642:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "file.txt";
    1645:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    164c:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1653:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    165a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1661:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1668:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    166f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1676:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    167d:	83 ec 0c             	sub    $0xc,%esp
    1680:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1683:	50                   	push   %eax
    1684:	e8 c3 fe ff ff       	call   154c <newFile>
    1689:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    168c:	e8 d0 ea ff ff       	call   161 <freeFileItemList>
	list(".");
    1691:	83 ec 0c             	sub    $0xc,%esp
    1694:	68 5f b2 00 00       	push   $0xb25f
    1699:	e8 ad eb ff ff       	call   24b <list>
    169e:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    16a1:	83 ec 04             	sub    $0x4,%esp
    16a4:	ff 35 08 37 01 00    	pushl  0x13708
    16aa:	ff 35 04 37 01 00    	pushl  0x13704
    16b0:	ff 35 00 37 01 00    	pushl  0x13700
    16b6:	e8 f3 f2 ff ff       	call   9ae <drawFinderContent>
    16bb:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    16be:	83 ec 04             	sub    $0x4,%esp
    16c1:	ff 35 08 37 01 00    	pushl  0x13708
    16c7:	ff 35 04 37 01 00    	pushl  0x13704
    16cd:	ff 35 00 37 01 00    	pushl  0x13700
    16d3:	e8 bb f1 ff ff       	call   893 <drawFinderWnd>
    16d8:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    16db:	8d 45 e8             	lea    -0x18(%ebp),%eax
    16de:	83 ec 0c             	sub    $0xc,%esp
    16e1:	68 58 02 00 00       	push   $0x258
    16e6:	68 20 03 00 00       	push   $0x320
    16eb:	6a 00                	push   $0x0
    16ed:	6a 00                	push   $0x0
    16ef:	50                   	push   %eax
    16f0:	e8 a8 29 00 00       	call   409d <initRect>
    16f5:	83 c4 1c             	add    $0x1c,%esp
    16f8:	83 ec 0c             	sub    $0xc,%esp
    16fb:	ff 75 f4             	pushl  -0xc(%ebp)
    16fe:	ff 75 f0             	pushl  -0x10(%ebp)
    1701:	ff 75 ec             	pushl  -0x14(%ebp)
    1704:	ff 75 e8             	pushl  -0x18(%ebp)
    1707:	68 40 38 01 00       	push   $0x13840
    170c:	e8 51 2b 00 00       	call   4262 <deleteClickable>
    1711:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1714:	83 ec 0c             	sub    $0xc,%esp
    1717:	68 40 38 01 00       	push   $0x13840
    171c:	e8 e0 f7 ff ff       	call   f01 <addWndEvent>
    1721:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1724:	83 ec 0c             	sub    $0xc,%esp
    1727:	68 40 38 01 00       	push   $0x13840
    172c:	e8 75 f7 ff ff       	call   ea6 <addListEvent>
    1731:	83 c4 10             	add    $0x10,%esp
}
    1734:	c9                   	leave  
    1735:	c3                   	ret    

00001736 <newFolder>:

void newFolder(char *name) {
    1736:	55                   	push   %ebp
    1737:	89 e5                	mov    %esp,%ebp
    1739:	83 ec 18             	sub    $0x18,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    173c:	83 ec 0c             	sub    $0xc,%esp
    173f:	ff 75 08             	pushl  0x8(%ebp)
    1742:	e8 7e 2f 00 00       	call   46c5 <strlen>
    1747:	83 c4 10             	add    $0x10,%esp
    174a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    174d:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1754:	eb 62                	jmp    17b8 <newFolder+0x82>
		n = strlen(name);
    1756:	83 ec 0c             	sub    $0xc,%esp
    1759:	ff 75 08             	pushl  0x8(%ebp)
    175c:	e8 64 2f 00 00       	call   46c5 <strlen>
    1761:	83 c4 10             	add    $0x10,%esp
    1764:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1767:	8b 45 f0             	mov    -0x10(%ebp),%eax
    176a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    176d:	75 09                	jne    1778 <newFolder+0x42>
		{
			counter = 1;
    176f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1776:	eb 1b                	jmp    1793 <newFolder+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1778:	8b 55 ec             	mov    -0x14(%ebp),%edx
    177b:	8b 45 08             	mov    0x8(%ebp),%eax
    177e:	01 d0                	add    %edx,%eax
    1780:	83 ec 0c             	sub    $0xc,%esp
    1783:	50                   	push   %eax
    1784:	e8 6b 30 00 00       	call   47f4 <atoi>
    1789:	83 c4 10             	add    $0x10,%esp
    178c:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    178f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1793:	83 ec 0c             	sub    $0xc,%esp
    1796:	ff 75 f4             	pushl  -0xc(%ebp)
    1799:	e8 81 f4 ff ff       	call   c1f <int2str>
    179e:	83 c4 10             	add    $0x10,%esp
    17a1:	89 c1                	mov    %eax,%ecx
    17a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    17a6:	8b 45 08             	mov    0x8(%ebp),%eax
    17a9:	01 d0                	add    %edx,%eax
    17ab:	83 ec 08             	sub    $0x8,%esp
    17ae:	51                   	push   %ecx
    17af:	50                   	push   %eax
    17b0:	e8 a1 2e 00 00       	call   4656 <strcpy>
    17b5:	83 c4 10             	add    $0x10,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    17b8:	83 ec 0c             	sub    $0xc,%esp
    17bb:	ff 75 08             	pushl  0x8(%ebp)
    17be:	e8 2b 31 00 00       	call   48ee <mkdir>
    17c3:	83 c4 10             	add    $0x10,%esp
    17c6:	85 c0                	test   %eax,%eax
    17c8:	78 8c                	js     1756 <newFolder+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    17ca:	c9                   	leave  
    17cb:	c3                   	ret    

000017cc <h_newFolder>:

void h_newFolder(Point p) {
    17cc:	55                   	push   %ebp
    17cd:	89 e5                	mov    %esp,%ebp
    17cf:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "newFolder";
    17d2:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    17d9:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    17e0:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    17e7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    17ee:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    17f5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    17fc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1803:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    180a:	83 ec 0c             	sub    $0xc,%esp
    180d:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1810:	50                   	push   %eax
    1811:	e8 20 ff ff ff       	call   1736 <newFolder>
    1816:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1819:	e8 43 e9 ff ff       	call   161 <freeFileItemList>
	printf(0, "new folder!\n");
    181e:	83 ec 08             	sub    $0x8,%esp
    1821:	68 c1 b2 00 00       	push   $0xb2c1
    1826:	6a 00                	push   $0x0
    1828:	e8 36 32 00 00       	call   4a63 <printf>
    182d:	83 c4 10             	add    $0x10,%esp
	list(".");
    1830:	83 ec 0c             	sub    $0xc,%esp
    1833:	68 5f b2 00 00       	push   $0xb25f
    1838:	e8 0e ea ff ff       	call   24b <list>
    183d:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1840:	e8 c2 f4 ff ff       	call   d07 <printItemList>
	drawFinderContent(context);
    1845:	83 ec 04             	sub    $0x4,%esp
    1848:	ff 35 08 37 01 00    	pushl  0x13708
    184e:	ff 35 04 37 01 00    	pushl  0x13704
    1854:	ff 35 00 37 01 00    	pushl  0x13700
    185a:	e8 4f f1 ff ff       	call   9ae <drawFinderContent>
    185f:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1862:	83 ec 04             	sub    $0x4,%esp
    1865:	ff 35 08 37 01 00    	pushl  0x13708
    186b:	ff 35 04 37 01 00    	pushl  0x13704
    1871:	ff 35 00 37 01 00    	pushl  0x13700
    1877:	e8 17 f0 ff ff       	call   893 <drawFinderWnd>
    187c:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    187f:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1882:	83 ec 0c             	sub    $0xc,%esp
    1885:	68 58 02 00 00       	push   $0x258
    188a:	68 20 03 00 00       	push   $0x320
    188f:	6a 00                	push   $0x0
    1891:	6a 00                	push   $0x0
    1893:	50                   	push   %eax
    1894:	e8 04 28 00 00       	call   409d <initRect>
    1899:	83 c4 1c             	add    $0x1c,%esp
    189c:	83 ec 0c             	sub    $0xc,%esp
    189f:	ff 75 f4             	pushl  -0xc(%ebp)
    18a2:	ff 75 f0             	pushl  -0x10(%ebp)
    18a5:	ff 75 ec             	pushl  -0x14(%ebp)
    18a8:	ff 75 e8             	pushl  -0x18(%ebp)
    18ab:	68 40 38 01 00       	push   $0x13840
    18b0:	e8 ad 29 00 00       	call   4262 <deleteClickable>
    18b5:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    18b8:	83 ec 0c             	sub    $0xc,%esp
    18bb:	68 40 38 01 00       	push   $0x13840
    18c0:	e8 3c f6 ff ff       	call   f01 <addWndEvent>
    18c5:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    18c8:	83 ec 0c             	sub    $0xc,%esp
    18cb:	68 40 38 01 00       	push   $0x13840
    18d0:	e8 d1 f5 ff ff       	call   ea6 <addListEvent>
    18d5:	83 c4 10             	add    $0x10,%esp
}
    18d8:	c9                   	leave  
    18d9:	c3                   	ret    

000018da <deleteFile>:

void deleteFile(char *name)
{
    18da:	55                   	push   %ebp
    18db:	89 e5                	mov    %esp,%ebp
    18dd:	83 ec 18             	sub    $0x18,%esp
	printf(0, "currently having sex with %s\n", name);
    18e0:	83 ec 04             	sub    $0x4,%esp
    18e3:	ff 75 08             	pushl  0x8(%ebp)
    18e6:	68 ce b2 00 00       	push   $0xb2ce
    18eb:	6a 00                	push   $0x0
    18ed:	e8 71 31 00 00       	call   4a63 <printf>
    18f2:	83 c4 10             	add    $0x10,%esp
	if(unlink(name) < 0){
    18f5:	83 ec 0c             	sub    $0xc,%esp
    18f8:	ff 75 08             	pushl  0x8(%ebp)
    18fb:	e8 d6 2f 00 00       	call   48d6 <unlink>
    1900:	83 c4 10             	add    $0x10,%esp
    1903:	85 c0                	test   %eax,%eax
    1905:	0f 89 b3 00 00 00    	jns    19be <deleteFile+0xe4>
		if (chdir(name) < 0){
    190b:	83 ec 0c             	sub    $0xc,%esp
    190e:	ff 75 08             	pushl  0x8(%ebp)
    1911:	e8 e0 2f 00 00       	call   48f6 <chdir>
    1916:	83 c4 10             	add    $0x10,%esp
    1919:	85 c0                	test   %eax,%eax
    191b:	79 1a                	jns    1937 <deleteFile+0x5d>
			printf(2, "rm: %s failed to delete\n", name);
    191d:	83 ec 04             	sub    $0x4,%esp
    1920:	ff 75 08             	pushl  0x8(%ebp)
    1923:	68 ec b2 00 00       	push   $0xb2ec
    1928:	6a 02                	push   $0x2
    192a:	e8 34 31 00 00       	call   4a63 <printf>
    192f:	83 c4 10             	add    $0x10,%esp
    1932:	e9 87 00 00 00       	jmp    19be <deleteFile+0xe4>
		}
		else{
			freeFileItemList();
    1937:	e8 25 e8 ff ff       	call   161 <freeFileItemList>
			list(".");
    193c:	83 ec 0c             	sub    $0xc,%esp
    193f:	68 5f b2 00 00       	push   $0xb25f
    1944:	e8 02 e9 ff ff       	call   24b <list>
    1949:	83 c4 10             	add    $0x10,%esp
			struct fileItem *p;
			p = fileItemList;
    194c:	a1 4c ff 00 00       	mov    0xff4c,%eax
    1951:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    1954:	eb 2f                	jmp    1985 <deleteFile+0xab>
				deleteFile(p->name);
    1956:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1959:	8b 40 14             	mov    0x14(%eax),%eax
    195c:	83 ec 0c             	sub    $0xc,%esp
    195f:	50                   	push   %eax
    1960:	e8 75 ff ff ff       	call   18da <deleteFile>
    1965:	83 c4 10             	add    $0x10,%esp
				freeFileItemList();
    1968:	e8 f4 e7 ff ff       	call   161 <freeFileItemList>
				list(".");
    196d:	83 ec 0c             	sub    $0xc,%esp
    1970:	68 5f b2 00 00       	push   $0xb25f
    1975:	e8 d1 e8 ff ff       	call   24b <list>
    197a:	83 c4 10             	add    $0x10,%esp
				p = fileItemList;
    197d:	a1 4c ff 00 00       	mov    0xff4c,%eax
    1982:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else{
			freeFileItemList();
			list(".");
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    1985:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1989:	75 cb                	jne    1956 <deleteFile+0x7c>
				deleteFile(p->name);
				freeFileItemList();
				list(".");
				p = fileItemList;
			}
			chdir("..");
    198b:	83 ec 0c             	sub    $0xc,%esp
    198e:	68 05 b3 00 00       	push   $0xb305
    1993:	e8 5e 2f 00 00       	call   48f6 <chdir>
    1998:	83 c4 10             	add    $0x10,%esp
			freeFileItemList();
    199b:	e8 c1 e7 ff ff       	call   161 <freeFileItemList>
			list(".");
    19a0:	83 ec 0c             	sub    $0xc,%esp
    19a3:	68 5f b2 00 00       	push   $0xb25f
    19a8:	e8 9e e8 ff ff       	call   24b <list>
    19ad:	83 c4 10             	add    $0x10,%esp
			unlink(name);
    19b0:	83 ec 0c             	sub    $0xc,%esp
    19b3:	ff 75 08             	pushl  0x8(%ebp)
    19b6:	e8 1b 2f 00 00       	call   48d6 <unlink>
    19bb:	83 c4 10             	add    $0x10,%esp
		}
	}
}
    19be:	c9                   	leave  
    19bf:	c3                   	ret    

000019c0 <h_deleteFile>:
void h_deleteFile(Point p) {
    19c0:	55                   	push   %ebp
    19c1:	89 e5                	mov    %esp,%ebp
    19c3:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    19c6:	a1 4c ff 00 00       	mov    0xff4c,%eax
    19cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    19ce:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    19d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    19d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    19db:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19de:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    19e1:	83 ec 08             	sub    $0x8,%esp
    19e4:	68 08 b3 00 00       	push   $0xb308
    19e9:	6a 00                	push   $0x0
    19eb:	e8 73 30 00 00       	call   4a63 <printf>
    19f0:	83 c4 10             	add    $0x10,%esp
	while (q != 0)
    19f3:	e9 90 00 00 00       	jmp    1a88 <h_deleteFile+0xc8>
	{
		printf(0, "hi2\n");
    19f8:	83 ec 08             	sub    $0x8,%esp
    19fb:	68 0d b3 00 00       	push   $0xb30d
    1a00:	6a 00                	push   $0x0
    1a02:	e8 5c 30 00 00       	call   4a63 <printf>
    1a07:	83 c4 10             	add    $0x10,%esp
		if (q->chosen)
    1a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a0d:	8b 40 28             	mov    0x28(%eax),%eax
    1a10:	85 c0                	test   %eax,%eax
    1a12:	74 6b                	je     1a7f <h_deleteFile+0xbf>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    1a14:	83 ec 0c             	sub    $0xc,%esp
    1a17:	6a 30                	push   $0x30
    1a19:	e8 16 33 00 00       	call   4d34 <malloc>
    1a1e:	83 c4 10             	add    $0x10,%esp
    1a21:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    1a24:	83 ec 0c             	sub    $0xc,%esp
    1a27:	6a 20                	push   $0x20
    1a29:	e8 06 33 00 00       	call   4d34 <malloc>
    1a2e:	83 c4 10             	add    $0x10,%esp
    1a31:	89 c2                	mov    %eax,%edx
    1a33:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a36:	89 50 14             	mov    %edx,0x14(%eax)
			strcpy(p1->name, q->name);
    1a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a3c:	8b 50 14             	mov    0x14(%eax),%edx
    1a3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a42:	8b 40 14             	mov    0x14(%eax),%eax
    1a45:	83 ec 08             	sub    $0x8,%esp
    1a48:	52                   	push   %edx
    1a49:	50                   	push   %eax
    1a4a:	e8 07 2c 00 00       	call   4656 <strcpy>
    1a4f:	83 c4 10             	add    $0x10,%esp
			if(head == 0)
    1a52:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a56:	75 0e                	jne    1a66 <h_deleteFile+0xa6>
			{
				head = p1;
    1a58:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a5b:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    1a5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a61:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1a64:	eb 0f                	jmp    1a75 <h_deleteFile+0xb5>
			} else {
				p2->next = p1;
    1a66:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a69:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1a6c:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    1a6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a72:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    1a75:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a78:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    1a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a82:	8b 40 2c             	mov    0x2c(%eax),%eax
    1a85:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    1a88:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a8c:	0f 85 66 ff ff ff    	jne    19f8 <h_deleteFile+0x38>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    1a92:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a95:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    1a98:	83 ec 08             	sub    $0x8,%esp
    1a9b:	68 14 b3 00 00       	push   $0xb314
    1aa0:	6a 00                	push   $0x0
    1aa2:	e8 bc 2f 00 00       	call   4a63 <printf>
    1aa7:	83 c4 10             	add    $0x10,%esp
	while (p1 != 0)
    1aaa:	eb 1b                	jmp    1ac7 <h_deleteFile+0x107>
	{
		deleteFile(p1->name);
    1aac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1aaf:	8b 40 14             	mov    0x14(%eax),%eax
    1ab2:	83 ec 0c             	sub    $0xc,%esp
    1ab5:	50                   	push   %eax
    1ab6:	e8 1f fe ff ff       	call   18da <deleteFile>
    1abb:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    1abe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ac1:	8b 40 2c             	mov    0x2c(%eax),%eax
    1ac4:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    1ac7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1acb:	75 df                	jne    1aac <h_deleteFile+0xec>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    1acd:	83 ec 08             	sub    $0x8,%esp
    1ad0:	68 7c b3 00 00       	push   $0xb37c
    1ad5:	6a 00                	push   $0x0
    1ad7:	e8 87 2f 00 00       	call   4a63 <printf>
    1adc:	83 c4 10             	add    $0x10,%esp
	p1 = head;
    1adf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ae2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    1ae5:	eb 48                	jmp    1b2f <h_deleteFile+0x16f>
		p2 = p1;
    1ae7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1aea:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    1aed:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1af0:	8b 40 14             	mov    0x14(%eax),%eax
    1af3:	83 ec 04             	sub    $0x4,%esp
    1af6:	50                   	push   %eax
    1af7:	68 92 b3 00 00       	push   $0xb392
    1afc:	6a 00                	push   $0x0
    1afe:	e8 60 2f 00 00       	call   4a63 <printf>
    1b03:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    1b06:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b09:	8b 40 2c             	mov    0x2c(%eax),%eax
    1b0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    1b0f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1b12:	8b 40 14             	mov    0x14(%eax),%eax
    1b15:	83 ec 0c             	sub    $0xc,%esp
    1b18:	50                   	push   %eax
    1b19:	e8 d5 30 00 00       	call   4bf3 <free>
    1b1e:	83 c4 10             	add    $0x10,%esp
		free(p2);
    1b21:	83 ec 0c             	sub    $0xc,%esp
    1b24:	ff 75 e8             	pushl  -0x18(%ebp)
    1b27:	e8 c7 30 00 00       	call   4bf3 <free>
    1b2c:	83 c4 10             	add    $0x10,%esp
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    1b2f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1b33:	75 b2                	jne    1ae7 <h_deleteFile+0x127>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    1b35:	83 ec 08             	sub    $0x8,%esp
    1b38:	68 9e b3 00 00       	push   $0xb39e
    1b3d:	6a 00                	push   $0x0
    1b3f:	e8 1f 2f 00 00       	call   4a63 <printf>
    1b44:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1b47:	e8 15 e6 ff ff       	call   161 <freeFileItemList>
	list(".");
    1b4c:	83 ec 0c             	sub    $0xc,%esp
    1b4f:	68 5f b2 00 00       	push   $0xb25f
    1b54:	e8 f2 e6 ff ff       	call   24b <list>
    1b59:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1b5c:	e8 a6 f1 ff ff       	call   d07 <printItemList>
	drawFinderContent(context);
    1b61:	83 ec 04             	sub    $0x4,%esp
    1b64:	ff 35 08 37 01 00    	pushl  0x13708
    1b6a:	ff 35 04 37 01 00    	pushl  0x13704
    1b70:	ff 35 00 37 01 00    	pushl  0x13700
    1b76:	e8 33 ee ff ff       	call   9ae <drawFinderContent>
    1b7b:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1b7e:	83 ec 04             	sub    $0x4,%esp
    1b81:	ff 35 08 37 01 00    	pushl  0x13708
    1b87:	ff 35 04 37 01 00    	pushl  0x13704
    1b8d:	ff 35 00 37 01 00    	pushl  0x13700
    1b93:	e8 fb ec ff ff       	call   893 <drawFinderWnd>
    1b98:	83 c4 10             	add    $0x10,%esp
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1b9b:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1b9e:	83 ec 0c             	sub    $0xc,%esp
    1ba1:	68 58 02 00 00       	push   $0x258
    1ba6:	68 20 03 00 00       	push   $0x320
    1bab:	6a 00                	push   $0x0
    1bad:	6a 00                	push   $0x0
    1baf:	50                   	push   %eax
    1bb0:	e8 e8 24 00 00       	call   409d <initRect>
    1bb5:	83 c4 1c             	add    $0x1c,%esp
    1bb8:	83 ec 0c             	sub    $0xc,%esp
    1bbb:	ff 75 e4             	pushl  -0x1c(%ebp)
    1bbe:	ff 75 e0             	pushl  -0x20(%ebp)
    1bc1:	ff 75 dc             	pushl  -0x24(%ebp)
    1bc4:	ff 75 d8             	pushl  -0x28(%ebp)
    1bc7:	68 40 38 01 00       	push   $0x13840
    1bcc:	e8 91 26 00 00       	call   4262 <deleteClickable>
    1bd1:	83 c4 20             	add    $0x20,%esp
		addWndEvent(&cm);
    1bd4:	83 ec 0c             	sub    $0xc,%esp
    1bd7:	68 40 38 01 00       	push   $0x13840
    1bdc:	e8 20 f3 ff ff       	call   f01 <addWndEvent>
    1be1:	83 c4 10             	add    $0x10,%esp
		addListEvent(&cm);
    1be4:	83 ec 0c             	sub    $0xc,%esp
    1be7:	68 40 38 01 00       	push   $0x13840
    1bec:	e8 b5 f2 ff ff       	call   ea6 <addListEvent>
    1bf1:	83 c4 10             	add    $0x10,%esp
}
    1bf4:	c9                   	leave  
    1bf5:	c3                   	ret    

00001bf6 <saveRename>:

void saveRename(){
    1bf6:	55                   	push   %ebp
    1bf7:	89 e5                	mov    %esp,%ebp
    1bf9:	53                   	push   %ebx
    1bfa:	81 ec 14 01 00 00    	sub    $0x114,%esp
	char tempName[MAX_NAME_LEN + 2];
	int i;
	strcpy(tempName, currentlyRenaming->name);
    1c00:	a1 48 ff 00 00       	mov    0xff48,%eax
    1c05:	8b 40 14             	mov    0x14(%eax),%eax
    1c08:	83 ec 08             	sub    $0x8,%esp
    1c0b:	50                   	push   %eax
    1c0c:	8d 85 f2 fe ff ff    	lea    -0x10e(%ebp),%eax
    1c12:	50                   	push   %eax
    1c13:	e8 3e 2a 00 00       	call   4656 <strcpy>
    1c18:	83 c4 10             	add    $0x10,%esp
	if(currentlyRenaming->st.type != T_DIR){
    1c1b:	a1 48 ff 00 00       	mov    0xff48,%eax
    1c20:	0f b7 00             	movzwl (%eax),%eax
    1c23:	66 83 f8 01          	cmp    $0x1,%ax
    1c27:	74 7d                	je     1ca6 <saveRename+0xb0>
		for(i = 0; i < strlen(tempName); i++){
    1c29:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1c30:	eb 3f                	jmp    1c71 <saveRename+0x7b>
			if(tempName[i] == '.'){
    1c32:	8d 95 f2 fe ff ff    	lea    -0x10e(%ebp),%edx
    1c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c3b:	01 d0                	add    %edx,%eax
    1c3d:	0f b6 00             	movzbl (%eax),%eax
    1c40:	3c 2e                	cmp    $0x2e,%al
    1c42:	75 29                	jne    1c6d <saveRename+0x77>
				pasteJustFile(renameFrom, tempName);
    1c44:	83 ec 08             	sub    $0x8,%esp
    1c47:	8d 85 f2 fe ff ff    	lea    -0x10e(%ebp),%eax
    1c4d:	50                   	push   %eax
    1c4e:	68 00 36 01 00       	push   $0x13600
    1c53:	e8 22 03 00 00       	call   1f7a <pasteJustFile>
    1c58:	83 c4 10             	add    $0x10,%esp
				deleteFile(renameFrom);
    1c5b:	83 ec 0c             	sub    $0xc,%esp
    1c5e:	68 00 36 01 00       	push   $0x13600
    1c63:	e8 72 fc ff ff       	call   18da <deleteFile>
    1c68:	83 c4 10             	add    $0x10,%esp
    1c6b:	eb 64                	jmp    1cd1 <saveRename+0xdb>
void saveRename(){
	char tempName[MAX_NAME_LEN + 2];
	int i;
	strcpy(tempName, currentlyRenaming->name);
	if(currentlyRenaming->st.type != T_DIR){
		for(i = 0; i < strlen(tempName); i++){
    1c6d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1c71:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    1c74:	83 ec 0c             	sub    $0xc,%esp
    1c77:	8d 85 f2 fe ff ff    	lea    -0x10e(%ebp),%eax
    1c7d:	50                   	push   %eax
    1c7e:	e8 42 2a 00 00       	call   46c5 <strlen>
    1c83:	83 c4 10             	add    $0x10,%esp
    1c86:	39 c3                	cmp    %eax,%ebx
    1c88:	72 a8                	jb     1c32 <saveRename+0x3c>
				pasteJustFile(renameFrom, tempName);
				deleteFile(renameFrom);
				return;
			}
		}
		tempName[i] = '.';
    1c8a:	8d 95 f2 fe ff ff    	lea    -0x10e(%ebp),%edx
    1c90:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c93:	01 d0                	add    %edx,%eax
    1c95:	c6 00 2e             	movb   $0x2e,(%eax)
		tempName[i + 1] = 0;
    1c98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c9b:	83 c0 01             	add    $0x1,%eax
    1c9e:	c6 84 05 f2 fe ff ff 	movb   $0x0,-0x10e(%ebp,%eax,1)
    1ca5:	00 
	}
	if(pasteJustFile(renameFrom, tempName))
    1ca6:	83 ec 08             	sub    $0x8,%esp
    1ca9:	8d 85 f2 fe ff ff    	lea    -0x10e(%ebp),%eax
    1caf:	50                   	push   %eax
    1cb0:	68 00 36 01 00       	push   $0x13600
    1cb5:	e8 c0 02 00 00       	call   1f7a <pasteJustFile>
    1cba:	83 c4 10             	add    $0x10,%esp
    1cbd:	85 c0                	test   %eax,%eax
    1cbf:	74 10                	je     1cd1 <saveRename+0xdb>
		deleteFile(renameFrom);
    1cc1:	83 ec 0c             	sub    $0xc,%esp
    1cc4:	68 00 36 01 00       	push   $0x13600
    1cc9:	e8 0c fc ff ff       	call   18da <deleteFile>
    1cce:	83 c4 10             	add    $0x10,%esp
}
    1cd1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1cd4:	c9                   	leave  
    1cd5:	c3                   	ret    

00001cd6 <unrename>:

void unrename(){
    1cd6:	55                   	push   %ebp
    1cd7:	89 e5                	mov    %esp,%ebp
    1cd9:	83 ec 18             	sub    $0x18,%esp
	printf(0, "renaming! currentlyRenaming: %s\n", currentlyRenaming->name);
    1cdc:	a1 48 ff 00 00       	mov    0xff48,%eax
    1ce1:	8b 40 14             	mov    0x14(%eax),%eax
    1ce4:	83 ec 04             	sub    $0x4,%esp
    1ce7:	50                   	push   %eax
    1ce8:	68 b0 b3 00 00       	push   $0xb3b0
    1ced:	6a 00                	push   $0x0
    1cef:	e8 6f 2d 00 00       	call   4a63 <printf>
    1cf4:	83 c4 10             	add    $0x10,%esp
	saveRename();
    1cf7:	e8 fa fe ff ff       	call   1bf6 <saveRename>
	currentlyRenaming->chosen = 1;
    1cfc:	a1 48 ff 00 00       	mov    0xff48,%eax
    1d01:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	currentlyRenaming = 0;
    1d08:	c7 05 48 ff 00 00 00 	movl   $0x0,0xff48
    1d0f:	00 00 00 
	renaming = 0;
    1d12:	c7 05 54 38 01 00 00 	movl   $0x0,0x13854
    1d19:	00 00 00 
	freeFileItemList();
    1d1c:	e8 40 e4 ff ff       	call   161 <freeFileItemList>
	list(".");
    1d21:	83 ec 0c             	sub    $0xc,%esp
    1d24:	68 5f b2 00 00       	push   $0xb25f
    1d29:	e8 1d e5 ff ff       	call   24b <list>
    1d2e:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1d31:	e8 d1 ef ff ff       	call   d07 <printItemList>
	drawFinderContent(context);
    1d36:	83 ec 04             	sub    $0x4,%esp
    1d39:	ff 35 08 37 01 00    	pushl  0x13708
    1d3f:	ff 35 04 37 01 00    	pushl  0x13704
    1d45:	ff 35 00 37 01 00    	pushl  0x13700
    1d4b:	e8 5e ec ff ff       	call   9ae <drawFinderContent>
    1d50:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1d53:	83 ec 04             	sub    $0x4,%esp
    1d56:	ff 35 08 37 01 00    	pushl  0x13708
    1d5c:	ff 35 04 37 01 00    	pushl  0x13704
    1d62:	ff 35 00 37 01 00    	pushl  0x13700
    1d68:	e8 26 eb ff ff       	call   893 <drawFinderWnd>
    1d6d:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1d70:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1d73:	83 ec 0c             	sub    $0xc,%esp
    1d76:	68 58 02 00 00       	push   $0x258
    1d7b:	68 20 03 00 00       	push   $0x320
    1d80:	6a 00                	push   $0x0
    1d82:	6a 00                	push   $0x0
    1d84:	50                   	push   %eax
    1d85:	e8 13 23 00 00       	call   409d <initRect>
    1d8a:	83 c4 1c             	add    $0x1c,%esp
    1d8d:	83 ec 0c             	sub    $0xc,%esp
    1d90:	ff 75 f4             	pushl  -0xc(%ebp)
    1d93:	ff 75 f0             	pushl  -0x10(%ebp)
    1d96:	ff 75 ec             	pushl  -0x14(%ebp)
    1d99:	ff 75 e8             	pushl  -0x18(%ebp)
    1d9c:	68 40 38 01 00       	push   $0x13840
    1da1:	e8 bc 24 00 00       	call   4262 <deleteClickable>
    1da6:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1da9:	83 ec 0c             	sub    $0xc,%esp
    1dac:	68 40 38 01 00       	push   $0x13840
    1db1:	e8 4b f1 ff ff       	call   f01 <addWndEvent>
    1db6:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1db9:	83 ec 0c             	sub    $0xc,%esp
    1dbc:	68 40 38 01 00       	push   $0x13840
    1dc1:	e8 e0 f0 ff ff       	call   ea6 <addListEvent>
    1dc6:	83 c4 10             	add    $0x10,%esp
}
    1dc9:	c9                   	leave  
    1dca:	c3                   	ret    

00001dcb <copyFile>:

void copyFile(){
    1dcb:	55                   	push   %ebp
    1dcc:	89 e5                	mov    %esp,%ebp
    1dce:	56                   	push   %esi
    1dcf:	53                   	push   %ebx
    1dd0:	83 ec 10             	sub    $0x10,%esp
	int fd;
	struct fileItem *p = fileItemList;
    1dd3:	a1 4c ff 00 00       	mov    0xff4c,%eax
    1dd8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    1ddb:	e9 07 01 00 00       	jmp    1ee7 <copyFile+0x11c>
		if (p->chosen == 1){
    1de0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1de3:	8b 40 28             	mov    0x28(%eax),%eax
    1de6:	83 f8 01             	cmp    $0x1,%eax
    1de9:	0f 85 ef 00 00 00    	jne    1ede <copyFile+0x113>
			if(lenOfWaited >= MAX_COPY_SIZE){
    1def:	a1 58 38 01 00       	mov    0x13858,%eax
    1df4:	83 f8 07             	cmp    $0x7,%eax
    1df7:	7e 1d                	jle    1e16 <copyFile+0x4b>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    1df9:	a1 58 38 01 00       	mov    0x13858,%eax
    1dfe:	83 ec 04             	sub    $0x4,%esp
    1e01:	50                   	push   %eax
    1e02:	68 d1 b3 00 00       	push   $0xb3d1
    1e07:	6a 00                	push   $0x0
    1e09:	e8 55 2c 00 00       	call   4a63 <printf>
    1e0e:	83 c4 10             	add    $0x10,%esp
    1e11:	e9 c8 00 00 00       	jmp    1ede <copyFile+0x113>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    1e16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e19:	8b 40 14             	mov    0x14(%eax),%eax
    1e1c:	83 ec 08             	sub    $0x8,%esp
    1e1f:	6a 00                	push   $0x0
    1e21:	50                   	push   %eax
    1e22:	e8 9f 2a 00 00       	call   48c6 <open>
    1e27:	83 c4 10             	add    $0x10,%esp
    1e2a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1e2d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e31:	0f 88 8e 00 00 00    	js     1ec5 <copyFile+0xfa>
					strcpy(filesWaited[lenOfWaited], currentPath);
    1e37:	a1 58 38 01 00       	mov    0x13858,%eax
    1e3c:	c1 e0 08             	shl    $0x8,%eax
    1e3f:	05 00 2e 01 00       	add    $0x12e00,%eax
    1e44:	83 ec 08             	sub    $0x8,%esp
    1e47:	68 40 37 01 00       	push   $0x13740
    1e4c:	50                   	push   %eax
    1e4d:	e8 04 28 00 00       	call   4656 <strcpy>
    1e52:	83 c4 10             	add    $0x10,%esp
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    1e55:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e58:	8b 58 14             	mov    0x14(%eax),%ebx
    1e5b:	a1 58 38 01 00       	mov    0x13858,%eax
    1e60:	c1 e0 08             	shl    $0x8,%eax
    1e63:	8d b0 00 2e 01 00    	lea    0x12e00(%eax),%esi
    1e69:	83 ec 0c             	sub    $0xc,%esp
    1e6c:	68 40 37 01 00       	push   $0x13740
    1e71:	e8 4f 28 00 00       	call   46c5 <strlen>
    1e76:	83 c4 10             	add    $0x10,%esp
    1e79:	01 f0                	add    %esi,%eax
    1e7b:	83 ec 08             	sub    $0x8,%esp
    1e7e:	53                   	push   %ebx
    1e7f:	50                   	push   %eax
    1e80:	e8 d1 27 00 00       	call   4656 <strcpy>
    1e85:	83 c4 10             	add    $0x10,%esp
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    1e88:	a1 58 38 01 00       	mov    0x13858,%eax
    1e8d:	c1 e0 08             	shl    $0x8,%eax
    1e90:	05 00 2e 01 00       	add    $0x12e00,%eax
    1e95:	83 ec 04             	sub    $0x4,%esp
    1e98:	50                   	push   %eax
    1e99:	68 ec b3 00 00       	push   $0xb3ec
    1e9e:	6a 00                	push   $0x0
    1ea0:	e8 be 2b 00 00       	call   4a63 <printf>
    1ea5:	83 c4 10             	add    $0x10,%esp
					lenOfWaited++;
    1ea8:	a1 58 38 01 00       	mov    0x13858,%eax
    1ead:	83 c0 01             	add    $0x1,%eax
    1eb0:	a3 58 38 01 00       	mov    %eax,0x13858
					close(fd);
    1eb5:	83 ec 0c             	sub    $0xc,%esp
    1eb8:	ff 75 f0             	pushl  -0x10(%ebp)
    1ebb:	e8 ee 29 00 00       	call   48ae <close>
    1ec0:	83 c4 10             	add    $0x10,%esp
    1ec3:	eb 19                	jmp    1ede <copyFile+0x113>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    1ec5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ec8:	8b 40 14             	mov    0x14(%eax),%eax
    1ecb:	83 ec 04             	sub    $0x4,%esp
    1ece:	50                   	push   %eax
    1ecf:	68 02 b4 00 00       	push   $0xb402
    1ed4:	6a 00                	push   $0x0
    1ed6:	e8 88 2b 00 00       	call   4a63 <printf>
    1edb:	83 c4 10             	add    $0x10,%esp
				}
			}
		}
		p = p->next;
    1ede:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ee1:	8b 40 2c             	mov    0x2c(%eax),%eax
    1ee4:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    1ee7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1eeb:	0f 85 ef fe ff ff    	jne    1de0 <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    1ef1:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1ef4:	5b                   	pop    %ebx
    1ef5:	5e                   	pop    %esi
    1ef6:	5d                   	pop    %ebp
    1ef7:	c3                   	ret    

00001ef8 <h_copyFile>:

void h_copyFile(Point p){
    1ef8:	55                   	push   %ebp
    1ef9:	89 e5                	mov    %esp,%ebp
    1efb:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    1efe:	c7 05 44 ff 00 00 00 	movl   $0x0,0xff44
    1f05:	00 00 00 
	lenOfWaited = 0;
    1f08:	c7 05 58 38 01 00 00 	movl   $0x0,0x13858
    1f0f:	00 00 00 
	copyFile();
    1f12:	e8 b4 fe ff ff       	call   1dcb <copyFile>
}
    1f17:	c9                   	leave  
    1f18:	c3                   	ret    

00001f19 <moveFile>:

void moveFile(){
    1f19:	55                   	push   %ebp
    1f1a:	89 e5                	mov    %esp,%ebp
    1f1c:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    1f1f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f26:	eb 1b                	jmp    1f43 <moveFile+0x2a>
		deleteFile(filesWaited[i]);
    1f28:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f2b:	c1 e0 08             	shl    $0x8,%eax
    1f2e:	05 00 2e 01 00       	add    $0x12e00,%eax
    1f33:	83 ec 0c             	sub    $0xc,%esp
    1f36:	50                   	push   %eax
    1f37:	e8 9e f9 ff ff       	call   18da <deleteFile>
    1f3c:	83 c4 10             	add    $0x10,%esp
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    1f3f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1f43:	a1 58 38 01 00       	mov    0x13858,%eax
    1f48:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1f4b:	7c db                	jl     1f28 <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    1f4d:	c7 05 58 38 01 00 00 	movl   $0x0,0x13858
    1f54:	00 00 00 
}
    1f57:	c9                   	leave  
    1f58:	c3                   	ret    

00001f59 <h_cutFile>:

void h_cutFile(Point p){
    1f59:	55                   	push   %ebp
    1f5a:	89 e5                	mov    %esp,%ebp
    1f5c:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    1f5f:	c7 05 44 ff 00 00 01 	movl   $0x1,0xff44
    1f66:	00 00 00 
	lenOfWaited = 0;
    1f69:	c7 05 58 38 01 00 00 	movl   $0x0,0x13858
    1f70:	00 00 00 
	copyFile();
    1f73:	e8 53 fe ff ff       	call   1dcb <copyFile>
}
    1f78:	c9                   	leave  
    1f79:	c3                   	ret    

00001f7a <pasteJustFile>:

int pasteJustFile(char *src, char *filename){
    1f7a:	55                   	push   %ebp
    1f7b:	89 e5                	mov    %esp,%ebp
    1f7d:	81 ec 28 02 00 00    	sub    $0x228,%esp
	int size = 0;
    1f83:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
	int file_src, file_dest;
	struct fileItem *p = fileItemList;
    1f8a:	a1 4c ff 00 00       	mov    0xff4c,%eax
    1f8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char* buff = (char*)malloc(4096 * sizeof(char));
    1f92:	83 ec 0c             	sub    $0xc,%esp
    1f95:	68 00 10 00 00       	push   $0x1000
    1f9a:	e8 95 2d 00 00       	call   4d34 <malloc>
    1f9f:	83 c4 10             	add    $0x10,%esp
    1fa2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	char tempSrc[MAX_NAME_LEN];
	char tempName[MAX_NAME_LEN];
	memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    1fa5:	83 ec 04             	sub    $0x4,%esp
    1fa8:	68 00 01 00 00       	push   $0x100
    1fad:	6a 00                	push   $0x0
    1faf:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    1fb5:	50                   	push   %eax
    1fb6:	e8 31 27 00 00       	call   46ec <memset>
    1fbb:	83 c4 10             	add    $0x10,%esp
	memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    1fbe:	83 ec 04             	sub    $0x4,%esp
    1fc1:	68 00 01 00 00       	push   $0x100
    1fc6:	6a 00                	push   $0x0
    1fc8:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    1fce:	50                   	push   %eax
    1fcf:	e8 18 27 00 00       	call   46ec <memset>
    1fd4:	83 c4 10             	add    $0x10,%esp
	memset(buff, 0, 4096);
    1fd7:	83 ec 04             	sub    $0x4,%esp
    1fda:	68 00 10 00 00       	push   $0x1000
    1fdf:	6a 00                	push   $0x0
    1fe1:	ff 75 e4             	pushl  -0x1c(%ebp)
    1fe4:	e8 03 27 00 00       	call   46ec <memset>
    1fe9:	83 c4 10             	add    $0x10,%esp
	printf(0, "sorddd copy~ %s\n", src);
    1fec:	83 ec 04             	sub    $0x4,%esp
    1fef:	ff 75 08             	pushl  0x8(%ebp)
    1ff2:	68 17 b4 00 00       	push   $0xb417
    1ff7:	6a 00                	push   $0x0
    1ff9:	e8 65 2a 00 00       	call   4a63 <printf>
    1ffe:	83 c4 10             	add    $0x10,%esp
	if(chdir(src) >= 0){
    2001:	83 ec 0c             	sub    $0xc,%esp
    2004:	ff 75 08             	pushl  0x8(%ebp)
    2007:	e8 ea 28 00 00       	call   48f6 <chdir>
    200c:	83 c4 10             	add    $0x10,%esp
    200f:	85 c0                	test   %eax,%eax
    2011:	0f 88 83 01 00 00    	js     219a <pasteJustFile+0x220>
		freeFileItemList();
    2017:	e8 45 e1 ff ff       	call   161 <freeFileItemList>
		list(".");
    201c:	83 ec 0c             	sub    $0xc,%esp
    201f:	68 5f b2 00 00       	push   $0xb25f
    2024:	e8 22 e2 ff ff       	call   24b <list>
    2029:	83 c4 10             	add    $0x10,%esp
		chdir(currentPath);
    202c:	83 ec 0c             	sub    $0xc,%esp
    202f:	68 40 37 01 00       	push   $0x13740
    2034:	e8 bd 28 00 00       	call   48f6 <chdir>
    2039:	83 c4 10             	add    $0x10,%esp
		mkdir(filename);
    203c:	83 ec 0c             	sub    $0xc,%esp
    203f:	ff 75 0c             	pushl  0xc(%ebp)
    2042:	e8 a7 28 00 00       	call   48ee <mkdir>
    2047:	83 c4 10             	add    $0x10,%esp
		updatePath(filename);
    204a:	83 ec 0c             	sub    $0xc,%esp
    204d:	ff 75 0c             	pushl  0xc(%ebp)
    2050:	e8 a4 f2 ff ff       	call   12f9 <updatePath>
    2055:	83 c4 10             	add    $0x10,%esp
		chdir(currentPath);
    2058:	83 ec 0c             	sub    $0xc,%esp
    205b:	68 40 37 01 00       	push   $0x13740
    2060:	e8 91 28 00 00       	call   48f6 <chdir>
    2065:	83 c4 10             	add    $0x10,%esp
		p = fileItemList;
    2068:	a1 4c ff 00 00       	mov    0xff4c,%eax
    206d:	89 45 ec             	mov    %eax,-0x14(%ebp)
		while(p != 0){
    2070:	e9 f6 00 00 00       	jmp    216b <pasteJustFile+0x1f1>
			strcpy(tempSrc, src);
    2075:	83 ec 08             	sub    $0x8,%esp
    2078:	ff 75 08             	pushl  0x8(%ebp)
    207b:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    2081:	50                   	push   %eax
    2082:	e8 cf 25 00 00       	call   4656 <strcpy>
    2087:	83 c4 10             	add    $0x10,%esp
			strcpy(tempName, p->name);
    208a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    208d:	8b 40 14             	mov    0x14(%eax),%eax
    2090:	83 ec 08             	sub    $0x8,%esp
    2093:	50                   	push   %eax
    2094:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    209a:	50                   	push   %eax
    209b:	e8 b6 25 00 00       	call   4656 <strcpy>
    20a0:	83 c4 10             	add    $0x10,%esp
			tempSrc[strlen(tempSrc) + 1] = 0;
    20a3:	83 ec 0c             	sub    $0xc,%esp
    20a6:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    20ac:	50                   	push   %eax
    20ad:	e8 13 26 00 00       	call   46c5 <strlen>
    20b2:	83 c4 10             	add    $0x10,%esp
    20b5:	83 c0 01             	add    $0x1,%eax
    20b8:	c6 84 05 e4 fe ff ff 	movb   $0x0,-0x11c(%ebp,%eax,1)
    20bf:	00 
			tempSrc[strlen(tempSrc)] = '/';
    20c0:	83 ec 0c             	sub    $0xc,%esp
    20c3:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    20c9:	50                   	push   %eax
    20ca:	e8 f6 25 00 00       	call   46c5 <strlen>
    20cf:	83 c4 10             	add    $0x10,%esp
    20d2:	c6 84 05 e4 fe ff ff 	movb   $0x2f,-0x11c(%ebp,%eax,1)
    20d9:	2f 
			strcpy(tempSrc+strlen(tempSrc), tempName);
    20da:	83 ec 0c             	sub    $0xc,%esp
    20dd:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    20e3:	50                   	push   %eax
    20e4:	e8 dc 25 00 00       	call   46c5 <strlen>
    20e9:	83 c4 10             	add    $0x10,%esp
    20ec:	89 c2                	mov    %eax,%edx
    20ee:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    20f4:	01 c2                	add    %eax,%edx
    20f6:	83 ec 08             	sub    $0x8,%esp
    20f9:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    20ff:	50                   	push   %eax
    2100:	52                   	push   %edx
    2101:	e8 50 25 00 00       	call   4656 <strcpy>
    2106:	83 c4 10             	add    $0x10,%esp
			if(!pasteJustFile(tempSrc, tempName)) return 0;
    2109:	83 ec 08             	sub    $0x8,%esp
    210c:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2112:	50                   	push   %eax
    2113:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    2119:	50                   	push   %eax
    211a:	e8 5b fe ff ff       	call   1f7a <pasteJustFile>
    211f:	83 c4 10             	add    $0x10,%esp
    2122:	85 c0                	test   %eax,%eax
    2124:	75 0a                	jne    2130 <pasteJustFile+0x1b6>
    2126:	b8 00 00 00 00       	mov    $0x0,%eax
    212b:	e9 a5 01 00 00       	jmp    22d5 <pasteJustFile+0x35b>
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    2130:	83 ec 04             	sub    $0x4,%esp
    2133:	68 00 01 00 00       	push   $0x100
    2138:	6a 00                	push   $0x0
    213a:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2140:	50                   	push   %eax
    2141:	e8 a6 25 00 00       	call   46ec <memset>
    2146:	83 c4 10             	add    $0x10,%esp
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    2149:	83 ec 04             	sub    $0x4,%esp
    214c:	68 00 01 00 00       	push   $0x100
    2151:	6a 00                	push   $0x0
    2153:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
    2159:	50                   	push   %eax
    215a:	e8 8d 25 00 00       	call   46ec <memset>
    215f:	83 c4 10             	add    $0x10,%esp
			p = p->next;
    2162:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2165:	8b 40 2c             	mov    0x2c(%eax),%eax
    2168:	89 45 ec             	mov    %eax,-0x14(%ebp)
		chdir(currentPath);
		mkdir(filename);
		updatePath(filename);
		chdir(currentPath);
		p = fileItemList;
		while(p != 0){
    216b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    216f:	0f 85 00 ff ff ff    	jne    2075 <pasteJustFile+0xfb>
			if(!pasteJustFile(tempSrc, tempName)) return 0;
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
			p = p->next;
		}
		chdir("..");
    2175:	83 ec 0c             	sub    $0xc,%esp
    2178:	68 05 b3 00 00       	push   $0xb305
    217d:	e8 74 27 00 00       	call   48f6 <chdir>
    2182:	83 c4 10             	add    $0x10,%esp
		updatePath("..");
    2185:	83 ec 0c             	sub    $0xc,%esp
    2188:	68 05 b3 00 00       	push   $0xb305
    218d:	e8 67 f1 ff ff       	call   12f9 <updatePath>
    2192:	83 c4 10             	add    $0x10,%esp
    2195:	e9 0c 01 00 00       	jmp    22a6 <pasteJustFile+0x32c>
	}
	else{
		file_src = open(src, O_RDONLY);
    219a:	83 ec 08             	sub    $0x8,%esp
    219d:	6a 00                	push   $0x0
    219f:	ff 75 08             	pushl  0x8(%ebp)
    21a2:	e8 1f 27 00 00       	call   48c6 <open>
    21a7:	83 c4 10             	add    $0x10,%esp
    21aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    21ad:	83 ec 08             	sub    $0x8,%esp
    21b0:	6a 00                	push   $0x0
    21b2:	ff 75 0c             	pushl  0xc(%ebp)
    21b5:	e8 0c 27 00 00       	call   48c6 <open>
    21ba:	83 c4 10             	add    $0x10,%esp
    21bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    21c0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    21c4:	78 49                	js     220f <pasteJustFile+0x295>
			printf(0, "File %s already exist\n", filename);
    21c6:	83 ec 04             	sub    $0x4,%esp
    21c9:	ff 75 0c             	pushl  0xc(%ebp)
    21cc:	68 28 b4 00 00       	push   $0xb428
    21d1:	6a 00                	push   $0x0
    21d3:	e8 8b 28 00 00       	call   4a63 <printf>
    21d8:	83 c4 10             	add    $0x10,%esp
			close(file_dest);
    21db:	83 ec 0c             	sub    $0xc,%esp
    21de:	ff 75 f0             	pushl  -0x10(%ebp)
    21e1:	e8 c8 26 00 00       	call   48ae <close>
    21e6:	83 c4 10             	add    $0x10,%esp
	        close(file_src);
    21e9:	83 ec 0c             	sub    $0xc,%esp
    21ec:	ff 75 f4             	pushl  -0xc(%ebp)
    21ef:	e8 ba 26 00 00       	call   48ae <close>
    21f4:	83 c4 10             	add    $0x10,%esp
	        free(buff);
    21f7:	83 ec 0c             	sub    $0xc,%esp
    21fa:	ff 75 e4             	pushl  -0x1c(%ebp)
    21fd:	e8 f1 29 00 00       	call   4bf3 <free>
    2202:	83 c4 10             	add    $0x10,%esp
			return 0;
    2205:	b8 00 00 00 00       	mov    $0x0,%eax
    220a:	e9 c6 00 00 00       	jmp    22d5 <pasteJustFile+0x35b>
		}
		else{
			file_dest = open(filename, O_CREATE);
    220f:	83 ec 08             	sub    $0x8,%esp
    2212:	68 00 02 00 00       	push   $0x200
    2217:	ff 75 0c             	pushl  0xc(%ebp)
    221a:	e8 a7 26 00 00       	call   48c6 <open>
    221f:	83 c4 10             	add    $0x10,%esp
    2222:	89 45 f0             	mov    %eax,-0x10(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    2225:	eb 14                	jmp    223b <pasteJustFile+0x2c1>
				write(file_dest, buff, size);
    2227:	83 ec 04             	sub    $0x4,%esp
    222a:	ff 75 e8             	pushl  -0x18(%ebp)
    222d:	ff 75 e4             	pushl  -0x1c(%ebp)
    2230:	ff 75 f0             	pushl  -0x10(%ebp)
    2233:	e8 6e 26 00 00       	call   48a6 <write>
    2238:	83 c4 10             	add    $0x10,%esp
	        free(buff);
			return 0;
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    223b:	83 ec 04             	sub    $0x4,%esp
    223e:	68 00 10 00 00       	push   $0x1000
    2243:	ff 75 e4             	pushl  -0x1c(%ebp)
    2246:	ff 75 f4             	pushl  -0xc(%ebp)
    2249:	e8 50 26 00 00       	call   489e <read>
    224e:	83 c4 10             	add    $0x10,%esp
    2251:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2254:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2258:	7f cd                	jg     2227 <pasteJustFile+0x2ad>
				write(file_dest, buff, size);
			if(size < 0)
    225a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    225e:	79 46                	jns    22a6 <pasteJustFile+0x32c>
			{
				//printf(2, "copy file error!!!\r\n");
				printf(0, "File %s error\n", filename);
    2260:	83 ec 04             	sub    $0x4,%esp
    2263:	ff 75 0c             	pushl  0xc(%ebp)
    2266:	68 3f b4 00 00       	push   $0xb43f
    226b:	6a 00                	push   $0x0
    226d:	e8 f1 27 00 00       	call   4a63 <printf>
    2272:	83 c4 10             	add    $0x10,%esp
				close(file_dest);
    2275:	83 ec 0c             	sub    $0xc,%esp
    2278:	ff 75 f0             	pushl  -0x10(%ebp)
    227b:	e8 2e 26 00 00       	call   48ae <close>
    2280:	83 c4 10             	add    $0x10,%esp
	            close(file_src);
    2283:	83 ec 0c             	sub    $0xc,%esp
    2286:	ff 75 f4             	pushl  -0xc(%ebp)
    2289:	e8 20 26 00 00       	call   48ae <close>
    228e:	83 c4 10             	add    $0x10,%esp
	            free(buff);
    2291:	83 ec 0c             	sub    $0xc,%esp
    2294:	ff 75 e4             	pushl  -0x1c(%ebp)
    2297:	e8 57 29 00 00       	call   4bf3 <free>
    229c:	83 c4 10             	add    $0x10,%esp
				return 0;
    229f:	b8 00 00 00 00       	mov    $0x0,%eax
    22a4:	eb 2f                	jmp    22d5 <pasteJustFile+0x35b>
			}
		}
	}
	close(file_dest);
    22a6:	83 ec 0c             	sub    $0xc,%esp
    22a9:	ff 75 f0             	pushl  -0x10(%ebp)
    22ac:	e8 fd 25 00 00       	call   48ae <close>
    22b1:	83 c4 10             	add    $0x10,%esp
	close(file_src);
    22b4:	83 ec 0c             	sub    $0xc,%esp
    22b7:	ff 75 f4             	pushl  -0xc(%ebp)
    22ba:	e8 ef 25 00 00       	call   48ae <close>
    22bf:	83 c4 10             	add    $0x10,%esp
	free(buff);
    22c2:	83 ec 0c             	sub    $0xc,%esp
    22c5:	ff 75 e4             	pushl  -0x1c(%ebp)
    22c8:	e8 26 29 00 00       	call   4bf3 <free>
    22cd:	83 c4 10             	add    $0x10,%esp
	return 1;
    22d0:	b8 01 00 00 00       	mov    $0x1,%eax
}
    22d5:	c9                   	leave  
    22d6:	c3                   	ret    

000022d7 <pasteFile>:

void pasteFile(){
    22d7:	55                   	push   %ebp
    22d8:	89 e5                	mov    %esp,%ebp
    22da:	83 ec 18             	sub    $0x18,%esp
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
    22dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    22e4:	e9 ab 00 00 00       	jmp    2394 <pasteFile+0xbd>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    22e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22ec:	c1 e0 08             	shl    $0x8,%eax
    22ef:	05 00 2e 01 00       	add    $0x12e00,%eax
    22f4:	50                   	push   %eax
    22f5:	ff 75 f4             	pushl  -0xc(%ebp)
    22f8:	68 4e b4 00 00       	push   $0xb44e
    22fd:	6a 00                	push   $0x0
    22ff:	e8 5f 27 00 00       	call   4a63 <printf>
    2304:	83 c4 10             	add    $0x10,%esp
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2307:	8b 45 f4             	mov    -0xc(%ebp),%eax
    230a:	c1 e0 08             	shl    $0x8,%eax
    230d:	05 00 2e 01 00       	add    $0x12e00,%eax
    2312:	83 ec 0c             	sub    $0xc,%esp
    2315:	50                   	push   %eax
    2316:	e8 aa 23 00 00       	call   46c5 <strlen>
    231b:	83 c4 10             	add    $0x10,%esp
    231e:	83 e8 01             	sub    $0x1,%eax
    2321:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2324:	eb 35                	jmp    235b <pasteFile+0x84>
        	if (*(filesWaited[i]+j) == '/'){
    2326:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2329:	c1 e0 08             	shl    $0x8,%eax
    232c:	8d 90 00 2e 01 00    	lea    0x12e00(%eax),%edx
    2332:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2335:	01 d0                	add    %edx,%eax
    2337:	0f b6 00             	movzbl (%eax),%eax
    233a:	3c 2f                	cmp    $0x2f,%al
    233c:	75 19                	jne    2357 <pasteFile+0x80>
        		filename = filesWaited[i] + j + 1;
    233e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2341:	c1 e0 08             	shl    $0x8,%eax
    2344:	8d 90 00 2e 01 00    	lea    0x12e00(%eax),%edx
    234a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    234d:	83 c0 01             	add    $0x1,%eax
    2350:	01 d0                	add    %edx,%eax
    2352:	89 45 ec             	mov    %eax,-0x14(%ebp)
        		break;
    2355:	eb 0a                	jmp    2361 <pasteFile+0x8a>
void pasteFile(){
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2357:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    235b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    235f:	79 c5                	jns    2326 <pasteFile+0x4f>
        	if (*(filesWaited[i]+j) == '/'){
        		filename = filesWaited[i] + j + 1;
        		break;
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
    2361:	ff 75 ec             	pushl  -0x14(%ebp)
    2364:	ff 75 f4             	pushl  -0xc(%ebp)
    2367:	68 6b b4 00 00       	push   $0xb46b
    236c:	6a 00                	push   $0x0
    236e:	e8 f0 26 00 00       	call   4a63 <printf>
    2373:	83 c4 10             	add    $0x10,%esp
        pasteJustFile(filesWaited[i], filename);
    2376:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2379:	c1 e0 08             	shl    $0x8,%eax
    237c:	05 00 2e 01 00       	add    $0x12e00,%eax
    2381:	83 ec 08             	sub    $0x8,%esp
    2384:	ff 75 ec             	pushl  -0x14(%ebp)
    2387:	50                   	push   %eax
    2388:	e8 ed fb ff ff       	call   1f7a <pasteJustFile>
    238d:	83 c4 10             	add    $0x10,%esp
}

void pasteFile(){
	int i,j;
	char *filename;
    for(i = 0; i < lenOfWaited; i++){
    2390:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2394:	a1 58 38 01 00       	mov    0x13858,%eax
    2399:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    239c:	0f 8c 47 ff ff ff    	jl     22e9 <pasteFile+0x12>
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
        pasteJustFile(filesWaited[i], filename);
	}
}
    23a2:	c9                   	leave  
    23a3:	c3                   	ret    

000023a4 <h_pasteFile>:

void h_pasteFile(Point p){
    23a4:	55                   	push   %ebp
    23a5:	89 e5                	mov    %esp,%ebp
    23a7:	83 ec 18             	sub    $0x18,%esp
	pasteFile();
    23aa:	e8 28 ff ff ff       	call   22d7 <pasteFile>
	if(copyOrCut == 1)
    23af:	a1 44 ff 00 00       	mov    0xff44,%eax
    23b4:	83 f8 01             	cmp    $0x1,%eax
    23b7:	75 05                	jne    23be <h_pasteFile+0x1a>
		moveFile();
    23b9:	e8 5b fb ff ff       	call   1f19 <moveFile>
    freeFileItemList();
    23be:	e8 9e dd ff ff       	call   161 <freeFileItemList>
	list(".");
    23c3:	83 ec 0c             	sub    $0xc,%esp
    23c6:	68 5f b2 00 00       	push   $0xb25f
    23cb:	e8 7b de ff ff       	call   24b <list>
    23d0:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    23d3:	83 ec 04             	sub    $0x4,%esp
    23d6:	ff 35 08 37 01 00    	pushl  0x13708
    23dc:	ff 35 04 37 01 00    	pushl  0x13704
    23e2:	ff 35 00 37 01 00    	pushl  0x13700
    23e8:	e8 c1 e5 ff ff       	call   9ae <drawFinderContent>
    23ed:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    23f0:	83 ec 04             	sub    $0x4,%esp
    23f3:	ff 35 08 37 01 00    	pushl  0x13708
    23f9:	ff 35 04 37 01 00    	pushl  0x13704
    23ff:	ff 35 00 37 01 00    	pushl  0x13700
    2405:	e8 89 e4 ff ff       	call   893 <drawFinderWnd>
    240a:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    240d:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2410:	83 ec 0c             	sub    $0xc,%esp
    2413:	68 58 02 00 00       	push   $0x258
    2418:	68 20 03 00 00       	push   $0x320
    241d:	6a 00                	push   $0x0
    241f:	6a 00                	push   $0x0
    2421:	50                   	push   %eax
    2422:	e8 76 1c 00 00       	call   409d <initRect>
    2427:	83 c4 1c             	add    $0x1c,%esp
    242a:	83 ec 0c             	sub    $0xc,%esp
    242d:	ff 75 f4             	pushl  -0xc(%ebp)
    2430:	ff 75 f0             	pushl  -0x10(%ebp)
    2433:	ff 75 ec             	pushl  -0x14(%ebp)
    2436:	ff 75 e8             	pushl  -0x18(%ebp)
    2439:	68 40 38 01 00       	push   $0x13840
    243e:	e8 1f 1e 00 00       	call   4262 <deleteClickable>
    2443:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2446:	83 ec 0c             	sub    $0xc,%esp
    2449:	68 40 38 01 00       	push   $0x13840
    244e:	e8 ae ea ff ff       	call   f01 <addWndEvent>
    2453:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2456:	83 ec 0c             	sub    $0xc,%esp
    2459:	68 40 38 01 00       	push   $0x13840
    245e:	e8 43 ea ff ff       	call   ea6 <addListEvent>
    2463:	83 c4 10             	add    $0x10,%esp
}
    2466:	c9                   	leave  
    2467:	c3                   	ret    

00002468 <h_chooseFile>:

void h_chooseFile(Point p) {
    2468:	55                   	push   %ebp
    2469:	89 e5                	mov    %esp,%ebp
    246b:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *temp = getFileItem(p);
    246e:	83 ec 08             	sub    $0x8,%esp
    2471:	ff 75 0c             	pushl  0xc(%ebp)
    2474:	ff 75 08             	pushl  0x8(%ebp)
    2477:	e8 36 eb ff ff       	call   fb2 <getFileItem>
    247c:	83 c4 10             	add    $0x10,%esp
    247f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    2482:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2485:	8b 40 28             	mov    0x28(%eax),%eax
    2488:	85 c0                	test   %eax,%eax
    248a:	74 1e                	je     24aa <h_chooseFile+0x42>
	{
		printf(0, "chooseFile!\n");
    248c:	83 ec 08             	sub    $0x8,%esp
    248f:	68 83 b4 00 00       	push   $0xb483
    2494:	6a 00                	push   $0x0
    2496:	e8 c8 25 00 00       	call   4a63 <printf>
    249b:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 0;
    249e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24a1:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    24a8:	eb 1c                	jmp    24c6 <h_chooseFile+0x5e>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    24aa:	83 ec 08             	sub    $0x8,%esp
    24ad:	68 90 b4 00 00       	push   $0xb490
    24b2:	6a 00                	push   $0x0
    24b4:	e8 aa 25 00 00       	call   4a63 <printf>
    24b9:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 1;
    24bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24bf:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    24c6:	83 ec 04             	sub    $0x4,%esp
    24c9:	ff 35 08 37 01 00    	pushl  0x13708
    24cf:	ff 35 04 37 01 00    	pushl  0x13704
    24d5:	ff 35 00 37 01 00    	pushl  0x13700
    24db:	e8 ce e4 ff ff       	call   9ae <drawFinderContent>
    24e0:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    24e3:	83 ec 04             	sub    $0x4,%esp
    24e6:	ff 35 08 37 01 00    	pushl  0x13708
    24ec:	ff 35 04 37 01 00    	pushl  0x13704
    24f2:	ff 35 00 37 01 00    	pushl  0x13700
    24f8:	e8 96 e3 ff ff       	call   893 <drawFinderWnd>
    24fd:	83 c4 10             	add    $0x10,%esp
}
    2500:	c9                   	leave  
    2501:	c3                   	ret    

00002502 <h_closeWnd>:

void h_closeWnd(Point p) {
    2502:	55                   	push   %ebp
    2503:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    2505:	c7 05 00 f5 00 00 00 	movl   $0x0,0xf500
    250c:	00 00 00 
}
    250f:	5d                   	pop    %ebp
    2510:	c3                   	ret    

00002511 <h_chvm1>:

void h_chvm1(Point p) {
    2511:	55                   	push   %ebp
    2512:	89 e5                	mov    %esp,%ebp
    2514:	83 ec 18             	sub    $0x18,%esp
	style = ICON_STYLE;
    2517:	c7 05 04 f5 00 00 01 	movl   $0x1,0xf504
    251e:	00 00 00 
	freeFileItemList();
    2521:	e8 3b dc ff ff       	call   161 <freeFileItemList>
		list(".");
    2526:	83 ec 0c             	sub    $0xc,%esp
    2529:	68 5f b2 00 00       	push   $0xb25f
    252e:	e8 18 dd ff ff       	call   24b <list>
    2533:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    2536:	83 ec 04             	sub    $0x4,%esp
    2539:	ff 35 08 37 01 00    	pushl  0x13708
    253f:	ff 35 04 37 01 00    	pushl  0x13704
    2545:	ff 35 00 37 01 00    	pushl  0x13700
    254b:	e8 5e e4 ff ff       	call   9ae <drawFinderContent>
    2550:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    2553:	83 ec 04             	sub    $0x4,%esp
    2556:	ff 35 08 37 01 00    	pushl  0x13708
    255c:	ff 35 04 37 01 00    	pushl  0x13704
    2562:	ff 35 00 37 01 00    	pushl  0x13700
    2568:	e8 26 e3 ff ff       	call   893 <drawFinderWnd>
    256d:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2570:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2573:	83 ec 0c             	sub    $0xc,%esp
    2576:	68 58 02 00 00       	push   $0x258
    257b:	68 20 03 00 00       	push   $0x320
    2580:	6a 00                	push   $0x0
    2582:	6a 00                	push   $0x0
    2584:	50                   	push   %eax
    2585:	e8 13 1b 00 00       	call   409d <initRect>
    258a:	83 c4 1c             	add    $0x1c,%esp
    258d:	83 ec 0c             	sub    $0xc,%esp
    2590:	ff 75 f4             	pushl  -0xc(%ebp)
    2593:	ff 75 f0             	pushl  -0x10(%ebp)
    2596:	ff 75 ec             	pushl  -0x14(%ebp)
    2599:	ff 75 e8             	pushl  -0x18(%ebp)
    259c:	68 40 38 01 00       	push   $0x13840
    25a1:	e8 bc 1c 00 00       	call   4262 <deleteClickable>
    25a6:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    25a9:	83 ec 0c             	sub    $0xc,%esp
    25ac:	68 40 38 01 00       	push   $0x13840
    25b1:	e8 4b e9 ff ff       	call   f01 <addWndEvent>
    25b6:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    25b9:	83 ec 0c             	sub    $0xc,%esp
    25bc:	68 40 38 01 00       	push   $0x13840
    25c1:	e8 e0 e8 ff ff       	call   ea6 <addListEvent>
    25c6:	83 c4 10             	add    $0x10,%esp
}
    25c9:	c9                   	leave  
    25ca:	c3                   	ret    

000025cb <h_chvm2>:

void h_chvm2(Point p) {
    25cb:	55                   	push   %ebp
    25cc:	89 e5                	mov    %esp,%ebp
    25ce:	83 ec 18             	sub    $0x18,%esp
	style = LIST_STYLE;
    25d1:	c7 05 04 f5 00 00 02 	movl   $0x2,0xf504
    25d8:	00 00 00 
	freeFileItemList();
    25db:	e8 81 db ff ff       	call   161 <freeFileItemList>
		list(".");
    25e0:	83 ec 0c             	sub    $0xc,%esp
    25e3:	68 5f b2 00 00       	push   $0xb25f
    25e8:	e8 5e dc ff ff       	call   24b <list>
    25ed:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    25f0:	83 ec 04             	sub    $0x4,%esp
    25f3:	ff 35 08 37 01 00    	pushl  0x13708
    25f9:	ff 35 04 37 01 00    	pushl  0x13704
    25ff:	ff 35 00 37 01 00    	pushl  0x13700
    2605:	e8 a4 e3 ff ff       	call   9ae <drawFinderContent>
    260a:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    260d:	83 ec 04             	sub    $0x4,%esp
    2610:	ff 35 08 37 01 00    	pushl  0x13708
    2616:	ff 35 04 37 01 00    	pushl  0x13704
    261c:	ff 35 00 37 01 00    	pushl  0x13700
    2622:	e8 6c e2 ff ff       	call   893 <drawFinderWnd>
    2627:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    262a:	8d 45 e8             	lea    -0x18(%ebp),%eax
    262d:	83 ec 0c             	sub    $0xc,%esp
    2630:	68 58 02 00 00       	push   $0x258
    2635:	68 20 03 00 00       	push   $0x320
    263a:	6a 00                	push   $0x0
    263c:	6a 00                	push   $0x0
    263e:	50                   	push   %eax
    263f:	e8 59 1a 00 00       	call   409d <initRect>
    2644:	83 c4 1c             	add    $0x1c,%esp
    2647:	83 ec 0c             	sub    $0xc,%esp
    264a:	ff 75 f4             	pushl  -0xc(%ebp)
    264d:	ff 75 f0             	pushl  -0x10(%ebp)
    2650:	ff 75 ec             	pushl  -0x14(%ebp)
    2653:	ff 75 e8             	pushl  -0x18(%ebp)
    2656:	68 40 38 01 00       	push   $0x13840
    265b:	e8 02 1c 00 00       	call   4262 <deleteClickable>
    2660:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    2663:	83 ec 0c             	sub    $0xc,%esp
    2666:	68 40 38 01 00       	push   $0x13840
    266b:	e8 91 e8 ff ff       	call   f01 <addWndEvent>
    2670:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    2673:	83 ec 0c             	sub    $0xc,%esp
    2676:	68 40 38 01 00       	push   $0x13840
    267b:	e8 26 e8 ff ff       	call   ea6 <addListEvent>
    2680:	83 c4 10             	add    $0x10,%esp
}
    2683:	c9                   	leave  
    2684:	c3                   	ret    

00002685 <h_goUp>:

void h_goUp(Point p) {
    2685:	55                   	push   %ebp
    2686:	89 e5                	mov    %esp,%ebp
    2688:	83 ec 18             	sub    $0x18,%esp
	enterDir("..");
    268b:	83 ec 0c             	sub    $0xc,%esp
    268e:	68 05 b3 00 00       	push   $0xb305
    2693:	e8 69 ed ff ff       	call   1401 <enterDir>
    2698:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    269b:	e8 c1 da ff ff       	call   161 <freeFileItemList>
	list(".");
    26a0:	83 ec 0c             	sub    $0xc,%esp
    26a3:	68 5f b2 00 00       	push   $0xb25f
    26a8:	e8 9e db ff ff       	call   24b <list>
    26ad:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    26b0:	83 ec 04             	sub    $0x4,%esp
    26b3:	ff 35 08 37 01 00    	pushl  0x13708
    26b9:	ff 35 04 37 01 00    	pushl  0x13704
    26bf:	ff 35 00 37 01 00    	pushl  0x13700
    26c5:	e8 e4 e2 ff ff       	call   9ae <drawFinderContent>
    26ca:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    26cd:	83 ec 04             	sub    $0x4,%esp
    26d0:	ff 35 08 37 01 00    	pushl  0x13708
    26d6:	ff 35 04 37 01 00    	pushl  0x13704
    26dc:	ff 35 00 37 01 00    	pushl  0x13700
    26e2:	e8 ac e1 ff ff       	call   893 <drawFinderWnd>
    26e7:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    26ea:	8d 45 e8             	lea    -0x18(%ebp),%eax
    26ed:	83 ec 0c             	sub    $0xc,%esp
    26f0:	68 58 02 00 00       	push   $0x258
    26f5:	68 20 03 00 00       	push   $0x320
    26fa:	6a 00                	push   $0x0
    26fc:	6a 00                	push   $0x0
    26fe:	50                   	push   %eax
    26ff:	e8 99 19 00 00       	call   409d <initRect>
    2704:	83 c4 1c             	add    $0x1c,%esp
    2707:	83 ec 0c             	sub    $0xc,%esp
    270a:	ff 75 f4             	pushl  -0xc(%ebp)
    270d:	ff 75 f0             	pushl  -0x10(%ebp)
    2710:	ff 75 ec             	pushl  -0x14(%ebp)
    2713:	ff 75 e8             	pushl  -0x18(%ebp)
    2716:	68 40 38 01 00       	push   $0x13840
    271b:	e8 42 1b 00 00       	call   4262 <deleteClickable>
    2720:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2723:	83 ec 0c             	sub    $0xc,%esp
    2726:	68 40 38 01 00       	push   $0x13840
    272b:	e8 d1 e7 ff ff       	call   f01 <addWndEvent>
    2730:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2733:	83 ec 0c             	sub    $0xc,%esp
    2736:	68 40 38 01 00       	push   $0x13840
    273b:	e8 66 e7 ff ff       	call   ea6 <addListEvent>
    2740:	83 c4 10             	add    $0x10,%esp
}
    2743:	c9                   	leave  
    2744:	c3                   	ret    

00002745 <h_empty>:

void h_empty(Point p) {
    2745:	55                   	push   %ebp
    2746:	89 e5                	mov    %esp,%ebp

}
    2748:	5d                   	pop    %ebp
    2749:	c3                   	ret    

0000274a <rename>:

void rename() {
    274a:	55                   	push   %ebp
    274b:	89 e5                	mov    %esp,%ebp
    274d:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *temp = fileItemList;
    2750:	a1 4c ff 00 00       	mov    0xff4c,%eax
    2755:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (temp != 0){
    2758:	eb 49                	jmp    27a3 <rename+0x59>
		if (temp->chosen == 1){
    275a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    275d:	8b 40 28             	mov    0x28(%eax),%eax
    2760:	83 f8 01             	cmp    $0x1,%eax
    2763:	75 35                	jne    279a <rename+0x50>
			currentlyRenaming = temp;
    2765:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2768:	a3 48 ff 00 00       	mov    %eax,0xff48
			temp->chosen = 2;
    276d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2770:	c7 40 28 02 00 00 00 	movl   $0x2,0x28(%eax)
			strcpy(renameFrom, temp->name);
    2777:	8b 45 f4             	mov    -0xc(%ebp),%eax
    277a:	8b 40 14             	mov    0x14(%eax),%eax
    277d:	83 ec 08             	sub    $0x8,%esp
    2780:	50                   	push   %eax
    2781:	68 00 36 01 00       	push   $0x13600
    2786:	e8 cb 1e 00 00       	call   4656 <strcpy>
    278b:	83 c4 10             	add    $0x10,%esp
			renaming = 1;
    278e:	c7 05 54 38 01 00 01 	movl   $0x1,0x13854
    2795:	00 00 00 
			break;
    2798:	eb 0f                	jmp    27a9 <rename+0x5f>
		}
		else
			temp = temp->next;
    279a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    279d:	8b 40 2c             	mov    0x2c(%eax),%eax
    27a0:	89 45 f4             	mov    %eax,-0xc(%ebp)

}

void rename() {
	struct fileItem *temp = fileItemList;
	while (temp != 0){
    27a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    27a7:	75 b1                	jne    275a <rename+0x10>
			break;
		}
		else
			temp = temp->next;
	}
}
    27a9:	c9                   	leave  
    27aa:	c3                   	ret    

000027ab <h_rename>:

void h_rename(Point p) {
    27ab:	55                   	push   %ebp
    27ac:	89 e5                	mov    %esp,%ebp
    27ae:	83 ec 08             	sub    $0x8,%esp
	rename();
    27b1:	e8 94 ff ff ff       	call   274a <rename>
	drawFinderContent(context);
    27b6:	83 ec 04             	sub    $0x4,%esp
    27b9:	ff 35 08 37 01 00    	pushl  0x13708
    27bf:	ff 35 04 37 01 00    	pushl  0x13704
    27c5:	ff 35 00 37 01 00    	pushl  0x13700
    27cb:	e8 de e1 ff ff       	call   9ae <drawFinderContent>
    27d0:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    27d3:	83 ec 04             	sub    $0x4,%esp
    27d6:	ff 35 08 37 01 00    	pushl  0x13708
    27dc:	ff 35 04 37 01 00    	pushl  0x13704
    27e2:	ff 35 00 37 01 00    	pushl  0x13700
    27e8:	e8 a6 e0 ff ff       	call   893 <drawFinderWnd>
    27ed:	83 c4 10             	add    $0x10,%esp
}
    27f0:	c9                   	leave  
    27f1:	c3                   	ret    

000027f2 <main>:

int main(int argc, char *argv[]) {
    27f2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    27f6:	83 e4 f0             	and    $0xfffffff0,%esp
    27f9:	ff 71 fc             	pushl  -0x4(%ecx)
    27fc:	55                   	push   %ebp
    27fd:	89 e5                	mov    %esp,%ebp
    27ff:	56                   	push   %esi
    2800:	53                   	push   %ebx
    2801:	51                   	push   %ecx
    2802:	83 ec 7c             	sub    $0x7c,%esp
	struct Msg msg;
	char key;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    2805:	83 ec 04             	sub    $0x4,%esp
    2808:	68 c2 01 00 00       	push   $0x1c2
    280d:	68 58 02 00 00       	push   $0x258
    2812:	68 00 37 01 00       	push   $0x13700
    2817:	e8 52 06 00 00       	call   2e6e <init_context>
    281c:	83 c4 10             	add    $0x10,%esp
    281f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    2822:	8d 45 88             	lea    -0x78(%ebp),%eax
    2825:	ff 35 08 37 01 00    	pushl  0x13708
    282b:	ff 35 04 37 01 00    	pushl  0x13704
    2831:	ff 35 00 37 01 00    	pushl  0x13700
    2837:	50                   	push   %eax
    2838:	e8 f4 18 00 00       	call   4131 <initClickManager>
    283d:	83 c4 0c             	add    $0xc,%esp
    2840:	8b 45 88             	mov    -0x78(%ebp),%eax
    2843:	a3 40 38 01 00       	mov    %eax,0x13840
    2848:	8b 45 8c             	mov    -0x74(%ebp),%eax
    284b:	a3 44 38 01 00       	mov    %eax,0x13844
    2850:	8b 45 90             	mov    -0x70(%ebp),%eax
    2853:	a3 48 38 01 00       	mov    %eax,0x13848
    2858:	8b 45 94             	mov    -0x6c(%ebp),%eax
    285b:	a3 4c 38 01 00       	mov    %eax,0x1384c
    2860:	8b 45 98             	mov    -0x68(%ebp),%eax
    2863:	a3 50 38 01 00       	mov    %eax,0x13850
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    2868:	83 ec 08             	sub    $0x8,%esp
    286b:	6a 0f                	push   $0xf
    286d:	68 40 f6 00 00       	push   $0xf640
    2872:	e8 21 10 00 00       	call   3898 <load_iconlist>
    2877:	83 c4 10             	add    $0x10,%esp
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    287a:	83 ec 08             	sub    $0x8,%esp
    287d:	6a 04                	push   $0x4
    287f:	68 40 f5 00 00       	push   $0xf540
    2884:	e8 0f 10 00 00       	call   3898 <load_iconlist>
    2889:	83 c4 10             	add    $0x10,%esp
	//testHandlers();
	strcpy(currentPath, "/");
    288c:	83 ec 08             	sub    $0x8,%esp
    288f:	68 9f b4 00 00       	push   $0xb49f
    2894:	68 40 37 01 00       	push   $0x13740
    2899:	e8 b8 1d 00 00       	call   4656 <strcpy>
    289e:	83 c4 10             	add    $0x10,%esp
	mkdir("userfolder");
    28a1:	83 ec 0c             	sub    $0xc,%esp
    28a4:	68 a1 b4 00 00       	push   $0xb4a1
    28a9:	e8 40 20 00 00       	call   48ee <mkdir>
    28ae:	83 c4 10             	add    $0x10,%esp
	enterDir("userfolder");
    28b1:	83 ec 0c             	sub    $0xc,%esp
    28b4:	68 a1 b4 00 00       	push   $0xb4a1
    28b9:	e8 43 eb ff ff       	call   1401 <enterDir>
    28be:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    28c1:	e8 9b d8 ff ff       	call   161 <freeFileItemList>
	list(".");
    28c6:	83 ec 0c             	sub    $0xc,%esp
    28c9:	68 5f b2 00 00       	push   $0xb25f
    28ce:	e8 78 d9 ff ff       	call   24b <list>
    28d3:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    28d6:	8d 45 d0             	lea    -0x30(%ebp),%eax
    28d9:	83 ec 0c             	sub    $0xc,%esp
    28dc:	68 58 02 00 00       	push   $0x258
    28e1:	68 20 03 00 00       	push   $0x320
    28e6:	6a 00                	push   $0x0
    28e8:	6a 00                	push   $0x0
    28ea:	50                   	push   %eax
    28eb:	e8 ad 17 00 00       	call   409d <initRect>
    28f0:	83 c4 1c             	add    $0x1c,%esp
    28f3:	83 ec 0c             	sub    $0xc,%esp
    28f6:	ff 75 dc             	pushl  -0x24(%ebp)
    28f9:	ff 75 d8             	pushl  -0x28(%ebp)
    28fc:	ff 75 d4             	pushl  -0x2c(%ebp)
    28ff:	ff 75 d0             	pushl  -0x30(%ebp)
    2902:	68 40 38 01 00       	push   $0x13840
    2907:	e8 56 19 00 00       	call   4262 <deleteClickable>
    290c:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    290f:	83 ec 0c             	sub    $0xc,%esp
    2912:	68 40 38 01 00       	push   $0x13840
    2917:	e8 e5 e5 ff ff       	call   f01 <addWndEvent>
    291c:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    291f:	83 ec 0c             	sub    $0xc,%esp
    2922:	68 40 38 01 00       	push   $0x13840
    2927:	e8 7a e5 ff ff       	call   ea6 <addListEvent>
    292c:	83 c4 10             	add    $0x10,%esp
	lenOfWaited = 0;
    292f:	c7 05 58 38 01 00 00 	movl   $0x0,0x13858
    2936:	00 00 00 
	while (isRun) {
    2939:	e9 f2 03 00 00       	jmp    2d30 <main+0x53e>
		getMsg(&msg);
    293e:	83 ec 0c             	sub    $0xc,%esp
    2941:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2944:	50                   	push   %eax
    2945:	e8 dc 1f 00 00       	call   4926 <getMsg>
    294a:	83 c4 10             	add    $0x10,%esp
		switch (msg.msg_type) {
    294d:	8b 45 b8             	mov    -0x48(%ebp),%eax
    2950:	83 f8 08             	cmp    $0x8,%eax
    2953:	0f 87 d6 03 00 00    	ja     2d2f <main+0x53d>
    2959:	8b 04 85 ac b4 00 00 	mov    0xb4ac(,%eax,4),%eax
    2960:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2962:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2965:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2968:	8d 45 b0             	lea    -0x50(%ebp),%eax
    296b:	83 ec 04             	sub    $0x4,%esp
    296e:	51                   	push   %ecx
    296f:	52                   	push   %edx
    2970:	50                   	push   %eax
    2971:	e8 00 17 00 00       	call   4076 <initPoint>
    2976:	83 c4 0c             	add    $0xc,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    2979:	a1 44 38 01 00       	mov    0x13844,%eax
    297e:	83 ec 04             	sub    $0x4,%esp
    2981:	ff 75 b4             	pushl  -0x4c(%ebp)
    2984:	ff 75 b0             	pushl  -0x50(%ebp)
    2987:	50                   	push   %eax
    2988:	e8 a7 19 00 00       	call   4334 <executeHandler>
    298d:	83 c4 10             	add    $0x10,%esp
    2990:	85 c0                	test   %eax,%eax
    2992:	74 14                	je     29a8 <main+0x1b6>
				updateWindow(winid, context.addr);
    2994:	a1 00 37 01 00       	mov    0x13700,%eax
    2999:	83 ec 08             	sub    $0x8,%esp
    299c:	50                   	push   %eax
    299d:	ff 75 e4             	pushl  -0x1c(%ebp)
    29a0:	e8 99 1f 00 00       	call   493e <updateWindow>
    29a5:	83 c4 10             	add    $0x10,%esp
			}
			break;
    29a8:	e9 83 03 00 00       	jmp    2d30 <main+0x53e>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    29ad:	83 ec 04             	sub    $0x4,%esp
    29b0:	ff 35 08 37 01 00    	pushl  0x13708
    29b6:	ff 35 04 37 01 00    	pushl  0x13704
    29bc:	ff 35 00 37 01 00    	pushl  0x13700
    29c2:	e8 e7 df ff ff       	call   9ae <drawFinderContent>
    29c7:	83 c4 10             	add    $0x10,%esp
			drawFinderWnd(context);
    29ca:	83 ec 04             	sub    $0x4,%esp
    29cd:	ff 35 08 37 01 00    	pushl  0x13708
    29d3:	ff 35 04 37 01 00    	pushl  0x13704
    29d9:	ff 35 00 37 01 00    	pushl  0x13700
    29df:	e8 af de ff ff       	call   893 <drawFinderWnd>
    29e4:	83 c4 10             	add    $0x10,%esp
			updateWindow(winid, context.addr);
    29e7:	a1 00 37 01 00       	mov    0x13700,%eax
    29ec:	83 ec 08             	sub    $0x8,%esp
    29ef:	50                   	push   %eax
    29f0:	ff 75 e4             	pushl  -0x1c(%ebp)
    29f3:	e8 46 1f 00 00       	call   493e <updateWindow>
    29f8:	83 c4 10             	add    $0x10,%esp
			break;
    29fb:	e9 30 03 00 00       	jmp    2d30 <main+0x53e>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    2a00:	8b 75 c8             	mov    -0x38(%ebp),%esi
    2a03:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
    2a06:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2a09:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2a0c:	a1 00 37 01 00       	mov    0x13700,%eax
    2a11:	83 ec 08             	sub    $0x8,%esp
    2a14:	56                   	push   %esi
    2a15:	53                   	push   %ebx
    2a16:	51                   	push   %ecx
    2a17:	52                   	push   %edx
    2a18:	50                   	push   %eax
    2a19:	ff 75 e4             	pushl  -0x1c(%ebp)
    2a1c:	e8 25 1f 00 00       	call   4946 <updatePartialWindow>
    2a21:	83 c4 20             	add    $0x20,%esp
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    2a24:	e9 07 03 00 00       	jmp    2d30 <main+0x53e>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2a29:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2a2c:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2a2f:	8d 45 80             	lea    -0x80(%ebp),%eax
    2a32:	83 ec 04             	sub    $0x4,%esp
    2a35:	51                   	push   %ecx
    2a36:	52                   	push   %edx
    2a37:	50                   	push   %eax
    2a38:	e8 39 16 00 00       	call   4076 <initPoint>
    2a3d:	83 c4 0c             	add    $0xc,%esp
    2a40:	8b 45 80             	mov    -0x80(%ebp),%eax
    2a43:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2a46:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2a49:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if(renaming == 1){
    2a4c:	a1 54 38 01 00       	mov    0x13854,%eax
    2a51:	83 f8 01             	cmp    $0x1,%eax
    2a54:	75 19                	jne    2a6f <main+0x27d>
				unrename();
    2a56:	e8 7b f2 ff ff       	call   1cd6 <unrename>
				updateWindow(winid, context.addr);
    2a5b:	a1 00 37 01 00       	mov    0x13700,%eax
    2a60:	83 ec 08             	sub    $0x8,%esp
    2a63:	50                   	push   %eax
    2a64:	ff 75 e4             	pushl  -0x1c(%ebp)
    2a67:	e8 d2 1e 00 00       	call   493e <updateWindow>
    2a6c:	83 c4 10             	add    $0x10,%esp
			}
			if (executeHandler(cm.left_click, p)) {
    2a6f:	a1 40 38 01 00       	mov    0x13840,%eax
    2a74:	83 ec 04             	sub    $0x4,%esp
    2a77:	ff 75 b4             	pushl  -0x4c(%ebp)
    2a7a:	ff 75 b0             	pushl  -0x50(%ebp)
    2a7d:	50                   	push   %eax
    2a7e:	e8 b1 18 00 00       	call   4334 <executeHandler>
    2a83:	83 c4 10             	add    $0x10,%esp
    2a86:	85 c0                	test   %eax,%eax
    2a88:	74 14                	je     2a9e <main+0x2ac>
				updateWindow(winid, context.addr);
    2a8a:	a1 00 37 01 00       	mov    0x13700,%eax
    2a8f:	83 ec 08             	sub    $0x8,%esp
    2a92:	50                   	push   %eax
    2a93:	ff 75 e4             	pushl  -0x1c(%ebp)
    2a96:	e8 a3 1e 00 00       	call   493e <updateWindow>
    2a9b:	83 c4 10             	add    $0x10,%esp
			}
			break;
    2a9e:	e9 8d 02 00 00       	jmp    2d30 <main+0x53e>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2aa3:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2aa6:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2aa9:	8d 45 80             	lea    -0x80(%ebp),%eax
    2aac:	83 ec 04             	sub    $0x4,%esp
    2aaf:	51                   	push   %ecx
    2ab0:	52                   	push   %edx
    2ab1:	50                   	push   %eax
    2ab2:	e8 bf 15 00 00       	call   4076 <initPoint>
    2ab7:	83 c4 0c             	add    $0xc,%esp
    2aba:	8b 45 80             	mov    -0x80(%ebp),%eax
    2abd:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2ac0:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2ac3:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    2ac6:	a1 48 38 01 00       	mov    0x13848,%eax
    2acb:	83 ec 04             	sub    $0x4,%esp
    2ace:	ff 75 b4             	pushl  -0x4c(%ebp)
    2ad1:	ff 75 b0             	pushl  -0x50(%ebp)
    2ad4:	50                   	push   %eax
    2ad5:	e8 5a 18 00 00       	call   4334 <executeHandler>
    2ada:	83 c4 10             	add    $0x10,%esp
    2add:	85 c0                	test   %eax,%eax
    2adf:	74 14                	je     2af5 <main+0x303>
				updateWindow(winid, context.addr);
    2ae1:	a1 00 37 01 00       	mov    0x13700,%eax
    2ae6:	83 ec 08             	sub    $0x8,%esp
    2ae9:	50                   	push   %eax
    2aea:	ff 75 e4             	pushl  -0x1c(%ebp)
    2aed:	e8 4c 1e 00 00       	call   493e <updateWindow>
    2af2:	83 c4 10             	add    $0x10,%esp
			}
			break;
    2af5:	e9 36 02 00 00       	jmp    2d30 <main+0x53e>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    2afa:	0f b6 45 bc          	movzbl -0x44(%ebp),%eax
    2afe:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    2b01:	a1 c0 2d 01 00       	mov    0x12dc0,%eax
    2b06:	85 c0                	test   %eax,%eax
    2b08:	0f 84 e1 00 00 00    	je     2bef <main+0x3fd>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    2b0e:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    2b12:	74 2a                	je     2b3e <main+0x34c>
    2b14:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    2b18:	74 24                	je     2b3e <main+0x34c>
    2b1a:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    2b1e:	7e 06                	jle    2b26 <main+0x334>
    2b20:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    2b24:	7e 18                	jle    2b3e <main+0x34c>
    2b26:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    2b2a:	7e 06                	jle    2b32 <main+0x340>
    2b2c:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    2b30:	7e 0c                	jle    2b3e <main+0x34c>
    2b32:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    2b36:	7e 41                	jle    2b79 <main+0x387>
    2b38:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    2b3c:	7f 3b                	jg     2b79 <main+0x387>
    2b3e:	a1 20 37 01 00       	mov    0x13720,%eax
    2b43:	83 f8 13             	cmp    $0x13,%eax
    2b46:	7f 31                	jg     2b79 <main+0x387>
					keyContent.content[keyContent.length++] = key;
    2b48:	a1 20 37 01 00       	mov    0x13720,%eax
    2b4d:	8d 50 01             	lea    0x1(%eax),%edx
    2b50:	89 15 20 37 01 00    	mov    %edx,0x13720
    2b56:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    2b5a:	88 90 0c 37 01 00    	mov    %dl,0x1370c(%eax)
					printf(0, "%s\n", keyContent.content);
    2b60:	83 ec 04             	sub    $0x4,%esp
    2b63:	68 0c 37 01 00       	push   $0x1370c
    2b68:	68 27 b2 00 00       	push   $0xb227
    2b6d:	6a 00                	push   $0x0
    2b6f:	e8 ef 1e 00 00       	call   4a63 <printf>
    2b74:	83 c4 10             	add    $0x10,%esp
    2b77:	eb 28                	jmp    2ba1 <main+0x3af>
				}
				else if (key == 8 && keyContent.length > 0) {
    2b79:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    2b7d:	75 22                	jne    2ba1 <main+0x3af>
    2b7f:	a1 20 37 01 00       	mov    0x13720,%eax
    2b84:	85 c0                	test   %eax,%eax
    2b86:	7e 19                	jle    2ba1 <main+0x3af>
					keyContent.content[--keyContent.length] = 0;
    2b88:	a1 20 37 01 00       	mov    0x13720,%eax
    2b8d:	83 e8 01             	sub    $0x1,%eax
    2b90:	a3 20 37 01 00       	mov    %eax,0x13720
    2b95:	a1 20 37 01 00       	mov    0x13720,%eax
    2b9a:	c6 80 0c 37 01 00 00 	movb   $0x0,0x1370c(%eax)
				}
				drawFinderContent(context);
    2ba1:	83 ec 04             	sub    $0x4,%esp
    2ba4:	ff 35 08 37 01 00    	pushl  0x13708
    2baa:	ff 35 04 37 01 00    	pushl  0x13704
    2bb0:	ff 35 00 37 01 00    	pushl  0x13700
    2bb6:	e8 f3 dd ff ff       	call   9ae <drawFinderContent>
    2bbb:	83 c4 10             	add    $0x10,%esp
				drawFinderWnd(context);
    2bbe:	83 ec 04             	sub    $0x4,%esp
    2bc1:	ff 35 08 37 01 00    	pushl  0x13708
    2bc7:	ff 35 04 37 01 00    	pushl  0x13704
    2bcd:	ff 35 00 37 01 00    	pushl  0x13700
    2bd3:	e8 bb dc ff ff       	call   893 <drawFinderWnd>
    2bd8:	83 c4 10             	add    $0x10,%esp
				updateWindow(winid, context.addr);
    2bdb:	a1 00 37 01 00       	mov    0x13700,%eax
    2be0:	83 ec 08             	sub    $0x8,%esp
    2be3:	50                   	push   %eax
    2be4:	ff 75 e4             	pushl  -0x1c(%ebp)
    2be7:	e8 52 1d 00 00       	call   493e <updateWindow>
    2bec:	83 c4 10             	add    $0x10,%esp
			}
			if (renaming) {
    2bef:	a1 54 38 01 00       	mov    0x13854,%eax
    2bf4:	85 c0                	test   %eax,%eax
    2bf6:	0f 84 31 01 00 00    	je     2d2d <main+0x53b>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (strlen(currentlyRenaming->name)<30)) {
    2bfc:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    2c00:	74 2a                	je     2c2c <main+0x43a>
    2c02:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    2c06:	74 24                	je     2c2c <main+0x43a>
    2c08:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    2c0c:	7e 06                	jle    2c14 <main+0x422>
    2c0e:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    2c12:	7e 18                	jle    2c2c <main+0x43a>
    2c14:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    2c18:	7e 06                	jle    2c20 <main+0x42e>
    2c1a:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    2c1e:	7e 0c                	jle    2c2c <main+0x43a>
    2c20:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    2c24:	7e 6a                	jle    2c90 <main+0x49e>
    2c26:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    2c2a:	7f 64                	jg     2c90 <main+0x49e>
    2c2c:	a1 48 ff 00 00       	mov    0xff48,%eax
    2c31:	8b 40 14             	mov    0x14(%eax),%eax
    2c34:	83 ec 0c             	sub    $0xc,%esp
    2c37:	50                   	push   %eax
    2c38:	e8 88 1a 00 00       	call   46c5 <strlen>
    2c3d:	83 c4 10             	add    $0x10,%esp
    2c40:	83 f8 1d             	cmp    $0x1d,%eax
    2c43:	77 4b                	ja     2c90 <main+0x49e>
					currentlyRenaming->name[strlen(currentlyRenaming->name) + 1] = 0;
    2c45:	a1 48 ff 00 00       	mov    0xff48,%eax
    2c4a:	8b 58 14             	mov    0x14(%eax),%ebx
    2c4d:	a1 48 ff 00 00       	mov    0xff48,%eax
    2c52:	8b 40 14             	mov    0x14(%eax),%eax
    2c55:	83 ec 0c             	sub    $0xc,%esp
    2c58:	50                   	push   %eax
    2c59:	e8 67 1a 00 00       	call   46c5 <strlen>
    2c5e:	83 c4 10             	add    $0x10,%esp
    2c61:	83 c0 01             	add    $0x1,%eax
    2c64:	01 d8                	add    %ebx,%eax
    2c66:	c6 00 00             	movb   $0x0,(%eax)
					currentlyRenaming->name[strlen(currentlyRenaming->name)] = key;
    2c69:	a1 48 ff 00 00       	mov    0xff48,%eax
    2c6e:	8b 58 14             	mov    0x14(%eax),%ebx
    2c71:	a1 48 ff 00 00       	mov    0xff48,%eax
    2c76:	8b 40 14             	mov    0x14(%eax),%eax
    2c79:	83 ec 0c             	sub    $0xc,%esp
    2c7c:	50                   	push   %eax
    2c7d:	e8 43 1a 00 00       	call   46c5 <strlen>
    2c82:	83 c4 10             	add    $0x10,%esp
    2c85:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    2c88:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
    2c8c:	88 02                	mov    %al,(%edx)
    2c8e:	eb 4f                	jmp    2cdf <main+0x4ed>
				}
				else if (key == 8 && (strlen(currentlyRenaming->name)>0)) {
    2c90:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    2c94:	75 3e                	jne    2cd4 <main+0x4e2>
    2c96:	a1 48 ff 00 00       	mov    0xff48,%eax
    2c9b:	8b 40 14             	mov    0x14(%eax),%eax
    2c9e:	83 ec 0c             	sub    $0xc,%esp
    2ca1:	50                   	push   %eax
    2ca2:	e8 1e 1a 00 00       	call   46c5 <strlen>
    2ca7:	83 c4 10             	add    $0x10,%esp
    2caa:	85 c0                	test   %eax,%eax
    2cac:	74 26                	je     2cd4 <main+0x4e2>
					currentlyRenaming->name[strlen(currentlyRenaming->name) - 1] = 0;
    2cae:	a1 48 ff 00 00       	mov    0xff48,%eax
    2cb3:	8b 58 14             	mov    0x14(%eax),%ebx
    2cb6:	a1 48 ff 00 00       	mov    0xff48,%eax
    2cbb:	8b 40 14             	mov    0x14(%eax),%eax
    2cbe:	83 ec 0c             	sub    $0xc,%esp
    2cc1:	50                   	push   %eax
    2cc2:	e8 fe 19 00 00       	call   46c5 <strlen>
    2cc7:	83 c4 10             	add    $0x10,%esp
    2cca:	83 e8 01             	sub    $0x1,%eax
    2ccd:	01 d8                	add    %ebx,%eax
    2ccf:	c6 00 00             	movb   $0x0,(%eax)
    2cd2:	eb 0b                	jmp    2cdf <main+0x4ed>
				} else if (key == '\n') {
    2cd4:	80 7d e3 0a          	cmpb   $0xa,-0x1d(%ebp)
    2cd8:	75 05                	jne    2cdf <main+0x4ed>
					unrename();
    2cda:	e8 f7 ef ff ff       	call   1cd6 <unrename>
				}
				drawFinderContent(context);
    2cdf:	83 ec 04             	sub    $0x4,%esp
    2ce2:	ff 35 08 37 01 00    	pushl  0x13708
    2ce8:	ff 35 04 37 01 00    	pushl  0x13704
    2cee:	ff 35 00 37 01 00    	pushl  0x13700
    2cf4:	e8 b5 dc ff ff       	call   9ae <drawFinderContent>
    2cf9:	83 c4 10             	add    $0x10,%esp
				drawFinderWnd(context);
    2cfc:	83 ec 04             	sub    $0x4,%esp
    2cff:	ff 35 08 37 01 00    	pushl  0x13708
    2d05:	ff 35 04 37 01 00    	pushl  0x13704
    2d0b:	ff 35 00 37 01 00    	pushl  0x13700
    2d11:	e8 7d db ff ff       	call   893 <drawFinderWnd>
    2d16:	83 c4 10             	add    $0x10,%esp
				updateWindow(winid, context.addr);
    2d19:	a1 00 37 01 00       	mov    0x13700,%eax
    2d1e:	83 ec 08             	sub    $0x8,%esp
    2d21:	50                   	push   %eax
    2d22:	ff 75 e4             	pushl  -0x1c(%ebp)
    2d25:	e8 14 1c 00 00       	call   493e <updateWindow>
    2d2a:	83 c4 10             	add    $0x10,%esp
			}
			break;
    2d2d:	eb 01                	jmp    2d30 <main+0x53e>
		default:
			break;
    2d2f:	90                   	nop
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    2d30:	a1 00 f5 00 00       	mov    0xf500,%eax
    2d35:	85 c0                	test   %eax,%eax
    2d37:	0f 85 01 fc ff ff    	jne    293e <main+0x14c>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    2d3d:	83 ec 08             	sub    $0x8,%esp
    2d40:	ff 75 e4             	pushl  -0x1c(%ebp)
    2d43:	68 00 37 01 00       	push   $0x13700
    2d48:	e8 95 01 00 00       	call   2ee2 <free_context>
    2d4d:	83 c4 10             	add    $0x10,%esp
	exit();
    2d50:	e8 31 1b 00 00       	call   4886 <exit>

00002d55 <testHandlers>:
}

void testHandlers() {
    2d55:	55                   	push   %ebp
    2d56:	89 e5                	mov    %esp,%ebp
    2d58:	83 ec 08             	sub    $0x8,%esp

	list(".");
    2d5b:	83 ec 0c             	sub    $0xc,%esp
    2d5e:	68 5f b2 00 00       	push   $0xb25f
    2d63:	e8 e3 d4 ff ff       	call   24b <list>
    2d68:	83 c4 10             	add    $0x10,%esp
	printf(0, "original list:\n");
    2d6b:	83 ec 08             	sub    $0x8,%esp
    2d6e:	68 d0 b4 00 00       	push   $0xb4d0
    2d73:	6a 00                	push   $0x0
    2d75:	e8 e9 1c 00 00       	call   4a63 <printf>
    2d7a:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2d7d:	e8 85 df ff ff       	call   d07 <printItemList>
	printf(0, "\n");
    2d82:	83 ec 08             	sub    $0x8,%esp
    2d85:	68 e0 b4 00 00       	push   $0xb4e0
    2d8a:	6a 00                	push   $0x0
    2d8c:	e8 d2 1c 00 00       	call   4a63 <printf>
    2d91:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a folder:\n");
    2d94:	83 ec 08             	sub    $0x8,%esp
    2d97:	68 e2 b4 00 00       	push   $0xb4e2
    2d9c:	6a 00                	push   $0x0
    2d9e:	e8 c0 1c 00 00       	call   4a63 <printf>
    2da3:	83 c4 10             	add    $0x10,%esp
	newFolder("newfolder");
    2da6:	83 ec 0c             	sub    $0xc,%esp
    2da9:	68 f1 b4 00 00       	push   $0xb4f1
    2dae:	e8 83 e9 ff ff       	call   1736 <newFolder>
    2db3:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2db6:	e8 a6 d3 ff ff       	call   161 <freeFileItemList>
	list(".");
    2dbb:	83 ec 0c             	sub    $0xc,%esp
    2dbe:	68 5f b2 00 00       	push   $0xb25f
    2dc3:	e8 83 d4 ff ff       	call   24b <list>
    2dc8:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2dcb:	e8 37 df ff ff       	call   d07 <printItemList>
	printf(0, "\n");
    2dd0:	83 ec 08             	sub    $0x8,%esp
    2dd3:	68 e0 b4 00 00       	push   $0xb4e0
    2dd8:	6a 00                	push   $0x0
    2dda:	e8 84 1c 00 00       	call   4a63 <printf>
    2ddf:	83 c4 10             	add    $0x10,%esp
	printf(0, "enter new folder:\n");
    2de2:	83 ec 08             	sub    $0x8,%esp
    2de5:	68 fb b4 00 00       	push   $0xb4fb
    2dea:	6a 00                	push   $0x0
    2dec:	e8 72 1c 00 00       	call   4a63 <printf>
    2df1:	83 c4 10             	add    $0x10,%esp
	enterDir("newfolder");
    2df4:	83 ec 0c             	sub    $0xc,%esp
    2df7:	68 f1 b4 00 00       	push   $0xb4f1
    2dfc:	e8 00 e6 ff ff       	call   1401 <enterDir>
    2e01:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2e04:	e8 58 d3 ff ff       	call   161 <freeFileItemList>
	list(".");
    2e09:	83 ec 0c             	sub    $0xc,%esp
    2e0c:	68 5f b2 00 00       	push   $0xb25f
    2e11:	e8 35 d4 ff ff       	call   24b <list>
    2e16:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2e19:	e8 e9 de ff ff       	call   d07 <printItemList>
	printf(0, "\n");
    2e1e:	83 ec 08             	sub    $0x8,%esp
    2e21:	68 e0 b4 00 00       	push   $0xb4e0
    2e26:	6a 00                	push   $0x0
    2e28:	e8 36 1c 00 00       	call   4a63 <printf>
    2e2d:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a file:\n");
    2e30:	83 ec 08             	sub    $0x8,%esp
    2e33:	68 0e b5 00 00       	push   $0xb50e
    2e38:	6a 00                	push   $0x0
    2e3a:	e8 24 1c 00 00       	call   4a63 <printf>
    2e3f:	83 c4 10             	add    $0x10,%esp
	newFile("newfile.txt");
    2e42:	83 ec 0c             	sub    $0xc,%esp
    2e45:	68 1b b5 00 00       	push   $0xb51b
    2e4a:	e8 fd e6 ff ff       	call   154c <newFile>
    2e4f:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2e52:	e8 0a d3 ff ff       	call   161 <freeFileItemList>
	list(".");
    2e57:	83 ec 0c             	sub    $0xc,%esp
    2e5a:	68 5f b2 00 00       	push   $0xb25f
    2e5f:	e8 e7 d3 ff ff       	call   24b <list>
    2e64:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2e67:	e8 9b de ff ff       	call   d07 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    2e6c:	c9                   	leave  
    2e6d:	c3                   	ret    

00002e6e <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    2e6e:	55                   	push   %ebp
    2e6f:	89 e5                	mov    %esp,%ebp
    2e71:	83 ec 08             	sub    $0x8,%esp
    context_ptr->width = width;
    2e74:	8b 45 08             	mov    0x8(%ebp),%eax
    2e77:	8b 55 0c             	mov    0xc(%ebp),%edx
    2e7a:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    2e7d:	8b 45 08             	mov    0x8(%ebp),%eax
    2e80:	8b 55 10             	mov    0x10(%ebp),%edx
    2e83:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    2e86:	8b 55 0c             	mov    0xc(%ebp),%edx
    2e89:	8b 45 10             	mov    0x10(%ebp),%eax
    2e8c:	0f af c2             	imul   %edx,%eax
    2e8f:	01 c0                	add    %eax,%eax
    2e91:	83 ec 0c             	sub    $0xc,%esp
    2e94:	50                   	push   %eax
    2e95:	e8 9a 1e 00 00       	call   4d34 <malloc>
    2e9a:	83 c4 10             	add    $0x10,%esp
    2e9d:	89 c2                	mov    %eax,%edx
    2e9f:	8b 45 08             	mov    0x8(%ebp),%eax
    2ea2:	89 10                	mov    %edx,(%eax)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    2ea4:	8b 55 0c             	mov    0xc(%ebp),%edx
    2ea7:	8b 45 10             	mov    0x10(%ebp),%eax
    2eaa:	0f af c2             	imul   %edx,%eax
    2ead:	8d 14 00             	lea    (%eax,%eax,1),%edx
    2eb0:	8b 45 08             	mov    0x8(%ebp),%eax
    2eb3:	8b 00                	mov    (%eax),%eax
    2eb5:	83 ec 04             	sub    $0x4,%esp
    2eb8:	52                   	push   %edx
    2eb9:	6a 00                	push   $0x0
    2ebb:	50                   	push   %eax
    2ebc:	e8 2b 18 00 00       	call   46ec <memset>
    2ec1:	83 c4 10             	add    $0x10,%esp
    initializeASCII();
    2ec4:	e8 73 01 00 00       	call   303c <initializeASCII>
    initializeGBK();
    2ec9:	e8 f4 02 00 00       	call   31c2 <initializeGBK>
    return createWindow(0, 0, width, height);
    2ece:	ff 75 10             	pushl  0x10(%ebp)
    2ed1:	ff 75 0c             	pushl  0xc(%ebp)
    2ed4:	6a 00                	push   $0x0
    2ed6:	6a 00                	push   $0x0
    2ed8:	e8 51 1a 00 00       	call   492e <createWindow>
    2edd:	83 c4 10             	add    $0x10,%esp
}
    2ee0:	c9                   	leave  
    2ee1:	c3                   	ret    

00002ee2 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    2ee2:	55                   	push   %ebp
    2ee3:	89 e5                	mov    %esp,%ebp
    2ee5:	83 ec 08             	sub    $0x8,%esp
    free(context_ptr->addr);
    2ee8:	8b 45 08             	mov    0x8(%ebp),%eax
    2eeb:	8b 00                	mov    (%eax),%eax
    2eed:	83 ec 0c             	sub    $0xc,%esp
    2ef0:	50                   	push   %eax
    2ef1:	e8 fd 1c 00 00       	call   4bf3 <free>
    2ef6:	83 c4 10             	add    $0x10,%esp
    freeASCII();
    2ef9:	e8 ab 02 00 00       	call   31a9 <freeASCII>
    freeGBK();
    2efe:	e8 60 03 00 00       	call   3263 <freeGBK>
    destroyWindow(winid);
    2f03:	83 ec 0c             	sub    $0xc,%esp
    2f06:	ff 75 0c             	pushl  0xc(%ebp)
    2f09:	e8 28 1a 00 00       	call   4936 <destroyWindow>
    2f0e:	83 c4 10             	add    $0x10,%esp
}
    2f11:	c9                   	leave  
    2f12:	c3                   	ret    

00002f13 <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    2f13:	55                   	push   %ebp
    2f14:	89 e5                	mov    %esp,%ebp
    2f16:	83 ec 04             	sub    $0x4,%esp
    2f19:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2f1c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    2f20:	8b 45 0c             	mov    0xc(%ebp),%eax
    2f23:	3b 45 14             	cmp    0x14(%ebp),%eax
    2f26:	77 02                	ja     2f2a <draw_point+0x17>
    return;
    2f28:	eb 26                	jmp    2f50 <draw_point+0x3d>
  if(y >= c.height)
    2f2a:	8b 45 10             	mov    0x10(%ebp),%eax
    2f2d:	3b 45 18             	cmp    0x18(%ebp),%eax
    2f30:	77 02                	ja     2f34 <draw_point+0x21>
    return;
    2f32:	eb 1c                	jmp    2f50 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    2f34:	8b 45 08             	mov    0x8(%ebp),%eax
    2f37:	8b 55 0c             	mov    0xc(%ebp),%edx
    2f3a:	89 d1                	mov    %edx,%ecx
    2f3c:	0f af 4d 18          	imul   0x18(%ebp),%ecx
    2f40:	8b 55 14             	mov    0x14(%ebp),%edx
    2f43:	01 ca                	add    %ecx,%edx
    2f45:	01 d2                	add    %edx,%edx
    2f47:	01 c2                	add    %eax,%edx
    2f49:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    2f4d:	66 89 02             	mov    %ax,(%edx)
}
    2f50:	c9                   	leave  
    2f51:	c3                   	ret    

00002f52 <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    2f52:	55                   	push   %ebp
    2f53:	89 e5                	mov    %esp,%ebp
    2f55:	83 ec 14             	sub    $0x14,%esp
    2f58:	8b 45 24             	mov    0x24(%ebp),%eax
    2f5b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    2f5f:	8b 55 14             	mov    0x14(%ebp),%edx
    2f62:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2f65:	01 d0                	add    %edx,%eax
    2f67:	8b 55 0c             	mov    0xc(%ebp),%edx
    2f6a:	39 d0                	cmp    %edx,%eax
    2f6c:	0f 47 c2             	cmova  %edx,%eax
    2f6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    2f72:	8b 55 18             	mov    0x18(%ebp),%edx
    2f75:	8b 45 20             	mov    0x20(%ebp),%eax
    2f78:	01 d0                	add    %edx,%eax
    2f7a:	8b 55 10             	mov    0x10(%ebp),%edx
    2f7d:	39 d0                	cmp    %edx,%eax
    2f7f:	0f 47 c2             	cmova  %edx,%eax
    2f82:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    2f85:	8b 45 18             	mov    0x18(%ebp),%eax
    2f88:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2f8b:	eb 36                	jmp    2fc3 <fill_rect+0x71>
	{
		for (x = bx; x < mx; x++)
    2f8d:	8b 45 14             	mov    0x14(%ebp),%eax
    2f90:	89 45 fc             	mov    %eax,-0x4(%ebp)
    2f93:	eb 22                	jmp    2fb7 <fill_rect+0x65>
		{
			draw_point(c, x, y, color);
    2f95:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    2f99:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2f9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2f9f:	51                   	push   %ecx
    2fa0:	52                   	push   %edx
    2fa1:	50                   	push   %eax
    2fa2:	ff 75 10             	pushl  0x10(%ebp)
    2fa5:	ff 75 0c             	pushl  0xc(%ebp)
    2fa8:	ff 75 08             	pushl  0x8(%ebp)
    2fab:	e8 63 ff ff ff       	call   2f13 <draw_point>
    2fb0:	83 c4 18             	add    $0x18,%esp
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    2fb3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2fb7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2fba:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2fbd:	7c d6                	jl     2f95 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    2fbf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2fc3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2fc6:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2fc9:	7c c2                	jl     2f8d <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    2fcb:	c9                   	leave  
    2fcc:	c3                   	ret    

00002fcd <printBinary>:

void printBinary(char c)
{
    2fcd:	55                   	push   %ebp
    2fce:	89 e5                	mov    %esp,%ebp
    2fd0:	83 ec 28             	sub    $0x28,%esp
    2fd3:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd6:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    2fd9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2fe0:	eb 40                	jmp    3022 <printBinary+0x55>
	{
		if(((c << i) & 0x80) != 0)
    2fe2:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    2fe6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fe9:	89 c1                	mov    %eax,%ecx
    2feb:	d3 e2                	shl    %cl,%edx
    2fed:	89 d0                	mov    %edx,%eax
    2fef:	25 80 00 00 00       	and    $0x80,%eax
    2ff4:	85 c0                	test   %eax,%eax
    2ff6:	74 14                	je     300c <printBinary+0x3f>
		{
			printf(0, "1");
    2ff8:	83 ec 08             	sub    $0x8,%esp
    2ffb:	68 27 b5 00 00       	push   $0xb527
    3000:	6a 00                	push   $0x0
    3002:	e8 5c 1a 00 00       	call   4a63 <printf>
    3007:	83 c4 10             	add    $0x10,%esp
    300a:	eb 12                	jmp    301e <printBinary+0x51>
		}
		else
		{
			printf(0, "0");
    300c:	83 ec 08             	sub    $0x8,%esp
    300f:	68 29 b5 00 00       	push   $0xb529
    3014:	6a 00                	push   $0x0
    3016:	e8 48 1a 00 00       	call   4a63 <printf>
    301b:	83 c4 10             	add    $0x10,%esp
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    301e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3022:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3026:	7e ba                	jle    2fe2 <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    3028:	83 ec 08             	sub    $0x8,%esp
    302b:	68 2b b5 00 00       	push   $0xb52b
    3030:	6a 00                	push   $0x0
    3032:	e8 2c 1a 00 00       	call   4a63 <printf>
    3037:	83 c4 10             	add    $0x10,%esp
}
    303a:	c9                   	leave  
    303b:	c3                   	ret    

0000303c <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    303c:	55                   	push   %ebp
    303d:	89 e5                	mov    %esp,%ebp
    303f:	56                   	push   %esi
    3040:	53                   	push   %ebx
    3041:	83 ec 20             	sub    $0x20,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    3044:	83 ec 08             	sub    $0x8,%esp
    3047:	68 2d b5 00 00       	push   $0xb52d
    304c:	6a 00                	push   $0x0
    304e:	e8 10 1a 00 00       	call   4a63 <printf>
    3053:	83 c4 10             	add    $0x10,%esp
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    3056:	83 ec 08             	sub    $0x8,%esp
    3059:	6a 00                	push   $0x0
    305b:	68 40 b5 00 00       	push   $0xb540
    3060:	e8 61 18 00 00       	call   48c6 <open>
    3065:	83 c4 10             	add    $0x10,%esp
    3068:	89 45 e8             	mov    %eax,-0x18(%ebp)
    306b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    306f:	79 1c                	jns    308d <initializeASCII+0x51>
	  printf(0,"cannot open %s\n", HANKAKU);
    3071:	83 ec 04             	sub    $0x4,%esp
    3074:	68 40 b5 00 00       	push   $0xb540
    3079:	68 4c b5 00 00       	push   $0xb54c
    307e:	6a 00                	push   $0x0
    3080:	e8 de 19 00 00       	call   4a63 <printf>
    3085:	83 c4 10             	add    $0x10,%esp
	  return;
    3088:	e9 15 01 00 00       	jmp    31a2 <initializeASCII+0x166>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    308d:	83 ec 0c             	sub    $0xc,%esp
    3090:	68 00 10 00 00       	push   $0x1000
    3095:	e8 9a 1c 00 00       	call   4d34 <malloc>
    309a:	83 c4 10             	add    $0x10,%esp
    309d:	a3 80 38 01 00       	mov    %eax,0x13880
	for (i = 0; i < ASCII_NUM; i++)
    30a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    30a9:	eb 12                	jmp    30bd <initializeASCII+0x81>
	{
		hankaku[i] = 0;
    30ab:	8b 15 80 38 01 00    	mov    0x13880,%edx
    30b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30b4:	01 d0                	add    %edx,%eax
    30b6:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    30b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    30bd:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    30c4:	7e e5                	jle    30ab <initializeASCII+0x6f>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    30c6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    30cd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    30d4:	e9 84 00 00 00       	jmp    315d <initializeASCII+0x121>
	{
		for (i = 0; i < n; i++){
    30d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    30e0:	eb 73                	jmp    3155 <initializeASCII+0x119>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    30e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30e5:	05 c0 38 01 00       	add    $0x138c0,%eax
    30ea:	0f b6 00             	movzbl (%eax),%eax
    30ed:	3c 2a                	cmp    $0x2a,%al
    30ef:	74 0f                	je     3100 <initializeASCII+0xc4>
    30f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30f4:	05 c0 38 01 00       	add    $0x138c0,%eax
    30f9:	0f b6 00             	movzbl (%eax),%eax
    30fc:	3c 2e                	cmp    $0x2e,%al
    30fe:	75 51                	jne    3151 <initializeASCII+0x115>
			{
				if (buf[i] == '*')
    3100:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3103:	05 c0 38 01 00       	add    $0x138c0,%eax
    3108:	0f b6 00             	movzbl (%eax),%eax
    310b:	3c 2a                	cmp    $0x2a,%al
    310d:	75 2d                	jne    313c <initializeASCII+0x100>
				{
					hankaku[y] |= (0x80 >> x);
    310f:	8b 15 80 38 01 00    	mov    0x13880,%edx
    3115:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3118:	01 c2                	add    %eax,%edx
    311a:	8b 0d 80 38 01 00    	mov    0x13880,%ecx
    3120:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3123:	01 c8                	add    %ecx,%eax
    3125:	0f b6 00             	movzbl (%eax),%eax
    3128:	89 c3                	mov    %eax,%ebx
    312a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    312d:	be 80 00 00 00       	mov    $0x80,%esi
    3132:	89 c1                	mov    %eax,%ecx
    3134:	d3 fe                	sar    %cl,%esi
    3136:	89 f0                	mov    %esi,%eax
    3138:	09 d8                	or     %ebx,%eax
    313a:	88 02                	mov    %al,(%edx)
				}
				x ++;
    313c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    3140:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    3144:	7e 0b                	jle    3151 <initializeASCII+0x115>
				{
					x = 0;
    3146:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    314d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    3151:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3155:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3158:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    315b:	7c 85                	jl     30e2 <initializeASCII+0xa6>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    315d:	83 ec 04             	sub    $0x4,%esp
    3160:	68 00 02 00 00       	push   $0x200
    3165:	68 c0 38 01 00       	push   $0x138c0
    316a:	ff 75 e8             	pushl  -0x18(%ebp)
    316d:	e8 2c 17 00 00       	call   489e <read>
    3172:	83 c4 10             	add    $0x10,%esp
    3175:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3178:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    317c:	0f 8f 57 ff ff ff    	jg     30d9 <initializeASCII+0x9d>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    3182:	83 ec 08             	sub    $0x8,%esp
    3185:	68 5c b5 00 00       	push   $0xb55c
    318a:	6a 00                	push   $0x0
    318c:	e8 d2 18 00 00       	call   4a63 <printf>
    3191:	83 c4 10             	add    $0x10,%esp
	close(fd);
    3194:	83 ec 0c             	sub    $0xc,%esp
    3197:	ff 75 e8             	pushl  -0x18(%ebp)
    319a:	e8 0f 17 00 00       	call   48ae <close>
    319f:	83 c4 10             	add    $0x10,%esp
}
    31a2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31a5:	5b                   	pop    %ebx
    31a6:	5e                   	pop    %esi
    31a7:	5d                   	pop    %ebp
    31a8:	c3                   	ret    

000031a9 <freeASCII>:

void freeASCII(){
    31a9:	55                   	push   %ebp
    31aa:	89 e5                	mov    %esp,%ebp
    31ac:	83 ec 08             	sub    $0x8,%esp
	free(hankaku);
    31af:	a1 80 38 01 00       	mov    0x13880,%eax
    31b4:	83 ec 0c             	sub    $0xc,%esp
    31b7:	50                   	push   %eax
    31b8:	e8 36 1a 00 00       	call   4bf3 <free>
    31bd:	83 c4 10             	add    $0x10,%esp
}
    31c0:	c9                   	leave  
    31c1:	c3                   	ret    

000031c2 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    31c2:	55                   	push   %ebp
    31c3:	89 e5                	mov    %esp,%ebp
    31c5:	83 ec 18             	sub    $0x18,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    31c8:	83 ec 08             	sub    $0x8,%esp
    31cb:	68 79 b5 00 00       	push   $0xb579
    31d0:	6a 00                	push   $0x0
    31d2:	e8 8c 18 00 00       	call   4a63 <printf>
    31d7:	83 c4 10             	add    $0x10,%esp
	if((fd = open(HZK16, 0)) < 0){
    31da:	83 ec 08             	sub    $0x8,%esp
    31dd:	6a 00                	push   $0x0
    31df:	68 8a b5 00 00       	push   $0xb58a
    31e4:	e8 dd 16 00 00       	call   48c6 <open>
    31e9:	83 c4 10             	add    $0x10,%esp
    31ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
    31ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    31f3:	79 19                	jns    320e <initializeGBK+0x4c>
		printf(0,"cannot open %s\n", HZK16);
    31f5:	83 ec 04             	sub    $0x4,%esp
    31f8:	68 8a b5 00 00       	push   $0xb58a
    31fd:	68 4c b5 00 00       	push   $0xb54c
    3202:	6a 00                	push   $0x0
    3204:	e8 5a 18 00 00       	call   4a63 <printf>
    3209:	83 c4 10             	add    $0x10,%esp
		return;
    320c:	eb 53                	jmp    3261 <initializeGBK+0x9f>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    320e:	83 ec 0c             	sub    $0xc,%esp
    3211:	68 78 69 00 00       	push   $0x6978
    3216:	e8 19 1b 00 00       	call   4d34 <malloc>
    321b:	83 c4 10             	add    $0x10,%esp
    321e:	a3 84 38 01 00       	mov    %eax,0x13884
	fontFile.size = read(fd, fontFile.buf, 27000);
    3223:	a1 84 38 01 00       	mov    0x13884,%eax
    3228:	83 ec 04             	sub    $0x4,%esp
    322b:	68 78 69 00 00       	push   $0x6978
    3230:	50                   	push   %eax
    3231:	ff 75 f4             	pushl  -0xc(%ebp)
    3234:	e8 65 16 00 00       	call   489e <read>
    3239:	83 c4 10             	add    $0x10,%esp
    323c:	a3 88 38 01 00       	mov    %eax,0x13888
	printf(0,"initialzing gbk complete!\n");
    3241:	83 ec 08             	sub    $0x8,%esp
    3244:	68 94 b5 00 00       	push   $0xb594
    3249:	6a 00                	push   $0x0
    324b:	e8 13 18 00 00       	call   4a63 <printf>
    3250:	83 c4 10             	add    $0x10,%esp
	close(fd);
    3253:	83 ec 0c             	sub    $0xc,%esp
    3256:	ff 75 f4             	pushl  -0xc(%ebp)
    3259:	e8 50 16 00 00       	call   48ae <close>
    325e:	83 c4 10             	add    $0x10,%esp
}
    3261:	c9                   	leave  
    3262:	c3                   	ret    

00003263 <freeGBK>:

void freeGBK(){
    3263:	55                   	push   %ebp
    3264:	89 e5                	mov    %esp,%ebp
    3266:	83 ec 08             	sub    $0x8,%esp
	free(fontFile.buf);
    3269:	a1 84 38 01 00       	mov    0x13884,%eax
    326e:	83 ec 0c             	sub    $0xc,%esp
    3271:	50                   	push   %eax
    3272:	e8 7c 19 00 00       	call   4bf3 <free>
    3277:	83 c4 10             	add    $0x10,%esp
}
    327a:	c9                   	leave  
    327b:	c3                   	ret    

0000327c <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    327c:	55                   	push   %ebp
    327d:	89 e5                	mov    %esp,%ebp
    327f:	53                   	push   %ebx
    3280:	83 ec 18             	sub    $0x18,%esp
    3283:	8b 55 14             	mov    0x14(%ebp),%edx
    3286:	8b 45 18             	mov    0x18(%ebp),%eax
    3289:	88 55 e8             	mov    %dl,-0x18(%ebp)
    328c:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    3290:	8b 45 20             	mov    0x20(%ebp),%eax
    3293:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3296:	eb 6b                	jmp    3303 <put_ascii+0x87>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    3298:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    329f:	eb 58                	jmp    32f9 <put_ascii+0x7d>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    32a1:	8b 15 80 38 01 00    	mov    0x13880,%edx
    32a7:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
    32ab:	c1 e0 04             	shl    $0x4,%eax
    32ae:	89 c1                	mov    %eax,%ecx
    32b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32b3:	2b 45 20             	sub    0x20(%ebp),%eax
    32b6:	01 c8                	add    %ecx,%eax
    32b8:	01 d0                	add    %edx,%eax
    32ba:	0f b6 00             	movzbl (%eax),%eax
    32bd:	0f b6 d0             	movzbl %al,%edx
    32c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    32c3:	89 c1                	mov    %eax,%ecx
    32c5:	d3 e2                	shl    %cl,%edx
    32c7:	89 d0                	mov    %edx,%eax
    32c9:	25 80 00 00 00       	and    $0x80,%eax
    32ce:	85 c0                	test   %eax,%eax
    32d0:	74 23                	je     32f5 <put_ascii+0x79>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    32d2:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    32d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32d9:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    32dc:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    32df:	01 d9                	add    %ebx,%ecx
    32e1:	52                   	push   %edx
    32e2:	50                   	push   %eax
    32e3:	51                   	push   %ecx
    32e4:	ff 75 10             	pushl  0x10(%ebp)
    32e7:	ff 75 0c             	pushl  0xc(%ebp)
    32ea:	ff 75 08             	pushl  0x8(%ebp)
    32ed:	e8 21 fc ff ff       	call   2f13 <draw_point>
    32f2:	83 c4 18             	add    $0x18,%esp
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    32f5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    32f9:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    32fd:	7e a2                	jle    32a1 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    32ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3303:	8b 45 20             	mov    0x20(%ebp),%eax
    3306:	83 c0 10             	add    $0x10,%eax
    3309:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    330c:	7f 8a                	jg     3298 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    330e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3311:	c9                   	leave  
    3312:	c3                   	ret    

00003313 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    3313:	55                   	push   %ebp
    3314:	89 e5                	mov    %esp,%ebp
    3316:	53                   	push   %ebx
    3317:	83 ec 18             	sub    $0x18,%esp
    331a:	8b 55 14             	mov    0x14(%ebp),%edx
    331d:	8b 45 18             	mov    0x18(%ebp),%eax
    3320:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    3324:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    3328:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    332c:	0f b6 c0             	movzbl %al,%eax
    332f:	3d a0 00 00 00       	cmp    $0xa0,%eax
    3334:	0f 8e 1e 01 00 00    	jle    3458 <put_gbk+0x145>
    333a:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    333e:	66 c1 f8 08          	sar    $0x8,%ax
    3342:	98                   	cwtl   
    3343:	0f b6 c0             	movzbl %al,%eax
    3346:	3d a0 00 00 00       	cmp    $0xa0,%eax
    334b:	0f 8e 07 01 00 00    	jle    3458 <put_gbk+0x145>
		hzk16Base = fontFile.buf;
    3351:	a1 84 38 01 00       	mov    0x13884,%eax
    3356:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    3359:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    335d:	0f b6 c0             	movzbl %al,%eax
    3360:	2d a1 00 00 00       	sub    $0xa1,%eax
    3365:	6b c0 5e             	imul   $0x5e,%eax,%eax
    3368:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    336c:	66 c1 fa 08          	sar    $0x8,%dx
    3370:	0f bf d2             	movswl %dx,%edx
    3373:	0f b6 d2             	movzbl %dl,%edx
    3376:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    337c:	01 d0                	add    %edx,%eax
    337e:	c1 e0 05             	shl    $0x5,%eax
    3381:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    3384:	8b 45 20             	mov    0x20(%ebp),%eax
    3387:	89 45 f4             	mov    %eax,-0xc(%ebp)
    338a:	e9 b8 00 00 00       	jmp    3447 <put_gbk+0x134>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    338f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3396:	eb 47                	jmp    33df <put_gbk+0xcc>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    3398:	8b 55 ec             	mov    -0x14(%ebp),%edx
    339b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    339e:	01 d0                	add    %edx,%eax
    33a0:	0f b6 00             	movzbl (%eax),%eax
    33a3:	0f b6 d0             	movzbl %al,%edx
    33a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    33a9:	89 c1                	mov    %eax,%ecx
    33ab:	d3 e2                	shl    %cl,%edx
    33ad:	89 d0                	mov    %edx,%eax
    33af:	25 80 00 00 00       	and    $0x80,%eax
    33b4:	85 c0                	test   %eax,%eax
    33b6:	74 23                	je     33db <put_gbk+0xc8>
					draw_point(c, x + tmpX, tmpY, colorNum);
    33b8:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    33bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33bf:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    33c2:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    33c5:	01 d9                	add    %ebx,%ecx
    33c7:	52                   	push   %edx
    33c8:	50                   	push   %eax
    33c9:	51                   	push   %ecx
    33ca:	ff 75 10             	pushl  0x10(%ebp)
    33cd:	ff 75 0c             	pushl  0xc(%ebp)
    33d0:	ff 75 08             	pushl  0x8(%ebp)
    33d3:	e8 3b fb ff ff       	call   2f13 <draw_point>
    33d8:	83 c4 18             	add    $0x18,%esp
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    33db:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    33df:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    33e3:	7e b3                	jle    3398 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    33e5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    33e9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    33f0:	eb 47                	jmp    3439 <put_gbk+0x126>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    33f2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    33f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    33f8:	01 d0                	add    %edx,%eax
    33fa:	0f b6 00             	movzbl (%eax),%eax
    33fd:	0f b6 d0             	movzbl %al,%edx
    3400:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3403:	89 c1                	mov    %eax,%ecx
    3405:	d3 e2                	shl    %cl,%edx
    3407:	89 d0                	mov    %edx,%eax
    3409:	25 80 00 00 00       	and    $0x80,%eax
    340e:	85 c0                	test   %eax,%eax
    3410:	74 23                	je     3435 <put_gbk+0x122>
					draw_point(c, x + tmpX, tmpY, colorNum);
    3412:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3416:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3419:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    341c:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    341f:	01 d9                	add    %ebx,%ecx
    3421:	52                   	push   %edx
    3422:	50                   	push   %eax
    3423:	51                   	push   %ecx
    3424:	ff 75 10             	pushl  0x10(%ebp)
    3427:	ff 75 0c             	pushl  0xc(%ebp)
    342a:	ff 75 08             	pushl  0x8(%ebp)
    342d:	e8 e1 fa ff ff       	call   2f13 <draw_point>
    3432:	83 c4 18             	add    $0x18,%esp
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    3435:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3439:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    343d:	7e b3                	jle    33f2 <put_gbk+0xdf>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    343f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    3443:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3447:	8b 45 20             	mov    0x20(%ebp),%eax
    344a:	83 c0 10             	add    $0x10,%eax
    344d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3450:	0f 8f 39 ff ff ff    	jg     338f <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    3456:	eb 50                	jmp    34a8 <put_gbk+0x195>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    3458:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    345c:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    3460:	0f b6 c0             	movzbl %al,%eax
    3463:	ff 75 20             	pushl  0x20(%ebp)
    3466:	ff 75 1c             	pushl  0x1c(%ebp)
    3469:	52                   	push   %edx
    346a:	50                   	push   %eax
    346b:	ff 75 10             	pushl  0x10(%ebp)
    346e:	ff 75 0c             	pushl  0xc(%ebp)
    3471:	ff 75 08             	pushl  0x8(%ebp)
    3474:	e8 03 fe ff ff       	call   327c <put_ascii>
    3479:	83 c4 1c             	add    $0x1c,%esp
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    347c:	8b 45 1c             	mov    0x1c(%ebp),%eax
    347f:	8d 48 08             	lea    0x8(%eax),%ecx
    3482:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    3486:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    348a:	66 c1 f8 08          	sar    $0x8,%ax
    348e:	0f b6 c0             	movzbl %al,%eax
    3491:	ff 75 20             	pushl  0x20(%ebp)
    3494:	51                   	push   %ecx
    3495:	52                   	push   %edx
    3496:	50                   	push   %eax
    3497:	ff 75 10             	pushl  0x10(%ebp)
    349a:	ff 75 0c             	pushl  0xc(%ebp)
    349d:	ff 75 08             	pushl  0x8(%ebp)
    34a0:	e8 d7 fd ff ff       	call   327c <put_ascii>
    34a5:	83 c4 1c             	add    $0x1c,%esp
	}
}
    34a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    34ab:	c9                   	leave  
    34ac:	c3                   	ret    

000034ad <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    34ad:	55                   	push   %ebp
    34ae:	89 e5                	mov    %esp,%ebp
    34b0:	83 ec 28             	sub    $0x28,%esp
    34b3:	8b 45 18             	mov    0x18(%ebp),%eax
    34b6:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    34ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    34c1:	83 ec 0c             	sub    $0xc,%esp
    34c4:	ff 75 14             	pushl  0x14(%ebp)
    34c7:	e8 f9 11 00 00       	call   46c5 <strlen>
    34cc:	83 c4 10             	add    $0x10,%esp
    34cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    34d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    34d9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    34dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    34df:	eb 36                	jmp    3517 <puts_str+0x6a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    34e1:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    34e5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    34e8:	8b 45 14             	mov    0x14(%ebp),%eax
    34eb:	01 c8                	add    %ecx,%eax
    34ed:	0f b6 00             	movzbl (%eax),%eax
    34f0:	0f b6 c0             	movzbl %al,%eax
    34f3:	83 ec 04             	sub    $0x4,%esp
    34f6:	ff 75 20             	pushl  0x20(%ebp)
    34f9:	ff 75 f0             	pushl  -0x10(%ebp)
    34fc:	52                   	push   %edx
    34fd:	50                   	push   %eax
    34fe:	ff 75 10             	pushl  0x10(%ebp)
    3501:	ff 75 0c             	pushl  0xc(%ebp)
    3504:	ff 75 08             	pushl  0x8(%ebp)
    3507:	e8 70 fd ff ff       	call   327c <put_ascii>
    350c:	83 c4 20             	add    $0x20,%esp
			xTmp += 8;
    350f:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    3513:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    3517:	8b 45 f4             	mov    -0xc(%ebp),%eax
    351a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    351d:	72 c2                	jb     34e1 <puts_str+0x34>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    351f:	c9                   	leave  
    3520:	c3                   	ret    

00003521 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    3521:	55                   	push   %ebp
    3522:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    3524:	8b 45 10             	mov    0x10(%ebp),%eax
    3527:	8d 50 07             	lea    0x7(%eax),%edx
    352a:	85 c0                	test   %eax,%eax
    352c:	0f 48 c2             	cmovs  %edx,%eax
    352f:	c1 f8 03             	sar    $0x3,%eax
    3532:	89 c1                	mov    %eax,%ecx
    3534:	8b 45 0c             	mov    0xc(%ebp),%eax
    3537:	8d 50 03             	lea    0x3(%eax),%edx
    353a:	85 c0                	test   %eax,%eax
    353c:	0f 48 c2             	cmovs  %edx,%eax
    353f:	c1 f8 02             	sar    $0x2,%eax
    3542:	c1 e0 05             	shl    $0x5,%eax
    3545:	01 c1                	add    %eax,%ecx
    3547:	8b 45 08             	mov    0x8(%ebp),%eax
    354a:	8d 50 07             	lea    0x7(%eax),%edx
    354d:	85 c0                	test   %eax,%eax
    354f:	0f 48 c2             	cmovs  %edx,%eax
    3552:	c1 f8 03             	sar    $0x3,%eax
    3555:	c1 e0 0b             	shl    $0xb,%eax
    3558:	01 c8                	add    %ecx,%eax
}
    355a:	5d                   	pop    %ebp
    355b:	c3                   	ret    

0000355c <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    355c:	55                   	push   %ebp
    355d:	89 e5                	mov    %esp,%ebp
    355f:	53                   	push   %ebx
    3560:	83 ec 10             	sub    $0x10,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    3563:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    356a:	e9 98 00 00 00       	jmp    3607 <draw_picture+0xab>
	{
		for (j = 0; j < pic.width; j++)
    356f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3576:	eb 7f                	jmp    35f7 <draw_picture+0x9b>
		{
			rgb = pic.data[i*pic.width+j];
    3578:	8b 55 14             	mov    0x14(%ebp),%edx
    357b:	8b 45 18             	mov    0x18(%ebp),%eax
    357e:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    3582:	89 c1                	mov    %eax,%ecx
    3584:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3587:	01 c8                	add    %ecx,%eax
    3589:	c1 e0 02             	shl    $0x2,%eax
    358c:	01 d0                	add    %edx,%eax
    358e:	8b 00                	mov    (%eax),%eax
    3590:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    3593:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    3597:	3c 01                	cmp    $0x1,%al
    3599:	75 02                	jne    359d <draw_picture+0x41>
    359b:	eb 56                	jmp    35f3 <draw_picture+0x97>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    359d:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    35a1:	0f b6 c8             	movzbl %al,%ecx
    35a4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    35a8:	0f b6 d0             	movzbl %al,%edx
    35ab:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    35af:	0f b6 c0             	movzbl %al,%eax
    35b2:	51                   	push   %ecx
    35b3:	52                   	push   %edx
    35b4:	50                   	push   %eax
    35b5:	e8 67 ff ff ff       	call   3521 <_RGB16BIT565>
    35ba:	83 c4 0c             	add    $0xc,%esp
    35bd:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    35c1:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
    35c5:	8b 55 1c             	mov    0x1c(%ebp),%edx
    35c8:	83 ea 01             	sub    $0x1,%edx
    35cb:	89 d1                	mov    %edx,%ecx
    35cd:	2b 4d f8             	sub    -0x8(%ebp),%ecx
    35d0:	8b 55 24             	mov    0x24(%ebp),%edx
    35d3:	01 ca                	add    %ecx,%edx
    35d5:	89 d3                	mov    %edx,%ebx
    35d7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    35da:	8b 55 20             	mov    0x20(%ebp),%edx
    35dd:	01 ca                	add    %ecx,%edx
    35df:	50                   	push   %eax
    35e0:	53                   	push   %ebx
    35e1:	52                   	push   %edx
    35e2:	ff 75 10             	pushl  0x10(%ebp)
    35e5:	ff 75 0c             	pushl  0xc(%ebp)
    35e8:	ff 75 08             	pushl  0x8(%ebp)
    35eb:	e8 23 f9 ff ff       	call   2f13 <draw_point>
    35f0:	83 c4 18             	add    $0x18,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    35f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    35f7:	8b 45 18             	mov    0x18(%ebp),%eax
    35fa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    35fd:	0f 8f 75 ff ff ff    	jg     3578 <draw_picture+0x1c>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    3603:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3607:	8b 45 1c             	mov    0x1c(%ebp),%eax
    360a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    360d:	0f 8f 5c ff ff ff    	jg     356f <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    3613:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3616:	c9                   	leave  
    3617:	c3                   	ret    

00003618 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    3618:	55                   	push   %ebp
    3619:	89 e5                	mov    %esp,%ebp
    361b:	83 ec 24             	sub    $0x24,%esp
    361e:	8b 45 24             	mov    0x24(%ebp),%eax
    3621:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    3625:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3628:	2b 45 14             	sub    0x14(%ebp),%eax
    362b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    362e:	8b 45 20             	mov    0x20(%ebp),%eax
    3631:	2b 45 18             	sub    0x18(%ebp),%eax
    3634:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    3637:	8b 45 14             	mov    0x14(%ebp),%eax
    363a:	c1 e0 0a             	shl    $0xa,%eax
    363d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    3640:	8b 45 18             	mov    0x18(%ebp),%eax
    3643:	c1 e0 0a             	shl    $0xa,%eax
    3646:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    3649:	8b 45 fc             	mov    -0x4(%ebp),%eax
    364c:	c1 f8 1f             	sar    $0x1f,%eax
    364f:	31 45 fc             	xor    %eax,-0x4(%ebp)
    3652:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    3655:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3658:	c1 f8 1f             	sar    $0x1f,%eax
    365b:	31 45 f8             	xor    %eax,-0x8(%ebp)
    365e:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    3661:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3664:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3667:	7c 4f                	jl     36b8 <draw_line+0xa0>
		len = dx + 1;
    3669:	8b 45 fc             	mov    -0x4(%ebp),%eax
    366c:	83 c0 01             	add    $0x1,%eax
    366f:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    3672:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3675:	3b 45 14             	cmp    0x14(%ebp),%eax
    3678:	7e 07                	jle    3681 <draw_line+0x69>
    367a:	b8 00 04 00 00       	mov    $0x400,%eax
    367f:	eb 05                	jmp    3686 <draw_line+0x6e>
    3681:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3686:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    3689:	8b 45 20             	mov    0x20(%ebp),%eax
    368c:	3b 45 18             	cmp    0x18(%ebp),%eax
    368f:	7c 12                	jl     36a3 <draw_line+0x8b>
    3691:	8b 45 20             	mov    0x20(%ebp),%eax
    3694:	2b 45 18             	sub    0x18(%ebp),%eax
    3697:	83 c0 01             	add    $0x1,%eax
    369a:	c1 e0 0a             	shl    $0xa,%eax
    369d:	99                   	cltd   
    369e:	f7 7d ec             	idivl  -0x14(%ebp)
    36a1:	eb 10                	jmp    36b3 <draw_line+0x9b>
    36a3:	8b 45 20             	mov    0x20(%ebp),%eax
    36a6:	2b 45 18             	sub    0x18(%ebp),%eax
    36a9:	83 e8 01             	sub    $0x1,%eax
    36ac:	c1 e0 0a             	shl    $0xa,%eax
    36af:	99                   	cltd   
    36b0:	f7 7d ec             	idivl  -0x14(%ebp)
    36b3:	89 45 f8             	mov    %eax,-0x8(%ebp)
    36b6:	eb 4d                	jmp    3705 <draw_line+0xed>
	}
	else {
		len = dy + 1;
    36b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    36bb:	83 c0 01             	add    $0x1,%eax
    36be:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    36c1:	8b 45 20             	mov    0x20(%ebp),%eax
    36c4:	3b 45 18             	cmp    0x18(%ebp),%eax
    36c7:	7e 07                	jle    36d0 <draw_line+0xb8>
    36c9:	b8 00 04 00 00       	mov    $0x400,%eax
    36ce:	eb 05                	jmp    36d5 <draw_line+0xbd>
    36d0:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    36d5:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    36d8:	8b 45 1c             	mov    0x1c(%ebp),%eax
    36db:	3b 45 14             	cmp    0x14(%ebp),%eax
    36de:	7c 12                	jl     36f2 <draw_line+0xda>
    36e0:	8b 45 1c             	mov    0x1c(%ebp),%eax
    36e3:	2b 45 14             	sub    0x14(%ebp),%eax
    36e6:	83 c0 01             	add    $0x1,%eax
    36e9:	c1 e0 0a             	shl    $0xa,%eax
    36ec:	99                   	cltd   
    36ed:	f7 7d ec             	idivl  -0x14(%ebp)
    36f0:	eb 10                	jmp    3702 <draw_line+0xea>
    36f2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    36f5:	2b 45 14             	sub    0x14(%ebp),%eax
    36f8:	83 e8 01             	sub    $0x1,%eax
    36fb:	c1 e0 0a             	shl    $0xa,%eax
    36fe:	99                   	cltd   
    36ff:	f7 7d ec             	idivl  -0x14(%ebp)
    3702:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    3705:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    370c:	eb 36                	jmp    3744 <draw_line+0x12c>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    370e:	0f b7 45 dc          	movzwl -0x24(%ebp),%eax
    3712:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3715:	c1 fa 0a             	sar    $0xa,%edx
    3718:	89 d1                	mov    %edx,%ecx
    371a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    371d:	c1 fa 0a             	sar    $0xa,%edx
    3720:	50                   	push   %eax
    3721:	51                   	push   %ecx
    3722:	52                   	push   %edx
    3723:	ff 75 10             	pushl  0x10(%ebp)
    3726:	ff 75 0c             	pushl  0xc(%ebp)
    3729:	ff 75 08             	pushl  0x8(%ebp)
    372c:	e8 e2 f7 ff ff       	call   2f13 <draw_point>
    3731:	83 c4 18             	add    $0x18,%esp
		y += dy;
    3734:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3737:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    373a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    373d:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    3740:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3744:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3747:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    374a:	7c c2                	jl     370e <draw_line+0xf6>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    374c:	c9                   	leave  
    374d:	c3                   	ret    

0000374e <draw_window>:

void
draw_window(Context c, char *title)
{
    374e:	55                   	push   %ebp
    374f:	89 e5                	mov    %esp,%ebp
    3751:	83 ec 18             	sub    $0x18,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    3754:	8b 45 0c             	mov    0xc(%ebp),%eax
    3757:	83 e8 01             	sub    $0x1,%eax
    375a:	6a 00                	push   $0x0
    375c:	6a 00                	push   $0x0
    375e:	50                   	push   %eax
    375f:	6a 00                	push   $0x0
    3761:	6a 00                	push   $0x0
    3763:	ff 75 10             	pushl  0x10(%ebp)
    3766:	ff 75 0c             	pushl  0xc(%ebp)
    3769:	ff 75 08             	pushl  0x8(%ebp)
    376c:	e8 a7 fe ff ff       	call   3618 <draw_line>
    3771:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    3774:	8b 45 10             	mov    0x10(%ebp),%eax
    3777:	8d 48 ff             	lea    -0x1(%eax),%ecx
    377a:	8b 45 0c             	mov    0xc(%ebp),%eax
    377d:	8d 50 ff             	lea    -0x1(%eax),%edx
    3780:	8b 45 0c             	mov    0xc(%ebp),%eax
    3783:	83 e8 01             	sub    $0x1,%eax
    3786:	6a 00                	push   $0x0
    3788:	51                   	push   %ecx
    3789:	52                   	push   %edx
    378a:	6a 00                	push   $0x0
    378c:	50                   	push   %eax
    378d:	ff 75 10             	pushl  0x10(%ebp)
    3790:	ff 75 0c             	pushl  0xc(%ebp)
    3793:	ff 75 08             	pushl  0x8(%ebp)
    3796:	e8 7d fe ff ff       	call   3618 <draw_line>
    379b:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    379e:	8b 45 10             	mov    0x10(%ebp),%eax
    37a1:	8d 48 ff             	lea    -0x1(%eax),%ecx
    37a4:	8b 45 10             	mov    0x10(%ebp),%eax
    37a7:	8d 50 ff             	lea    -0x1(%eax),%edx
    37aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    37ad:	83 e8 01             	sub    $0x1,%eax
    37b0:	6a 00                	push   $0x0
    37b2:	51                   	push   %ecx
    37b3:	6a 00                	push   $0x0
    37b5:	52                   	push   %edx
    37b6:	50                   	push   %eax
    37b7:	ff 75 10             	pushl  0x10(%ebp)
    37ba:	ff 75 0c             	pushl  0xc(%ebp)
    37bd:	ff 75 08             	pushl  0x8(%ebp)
    37c0:	e8 53 fe ff ff       	call   3618 <draw_line>
    37c5:	83 c4 20             	add    $0x20,%esp
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    37c8:	8b 45 10             	mov    0x10(%ebp),%eax
    37cb:	83 e8 01             	sub    $0x1,%eax
    37ce:	6a 00                	push   $0x0
    37d0:	6a 00                	push   $0x0
    37d2:	6a 00                	push   $0x0
    37d4:	50                   	push   %eax
    37d5:	6a 00                	push   $0x0
    37d7:	ff 75 10             	pushl  0x10(%ebp)
    37da:	ff 75 0c             	pushl  0xc(%ebp)
    37dd:	ff 75 08             	pushl  0x8(%ebp)
    37e0:	e8 33 fe ff ff       	call   3618 <draw_line>
    37e5:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    37e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    37eb:	83 e8 02             	sub    $0x2,%eax
    37ee:	68 cb 5a 00 00       	push   $0x5acb
    37f3:	6a 14                	push   $0x14
    37f5:	50                   	push   %eax
    37f6:	6a 01                	push   $0x1
    37f8:	6a 01                	push   $0x1
    37fa:	ff 75 10             	pushl  0x10(%ebp)
    37fd:	ff 75 0c             	pushl  0xc(%ebp)
    3800:	ff 75 08             	pushl  0x8(%ebp)
    3803:	e8 4a f7 ff ff       	call   2f52 <fill_rect>
    3808:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    380b:	8b 45 0c             	mov    0xc(%ebp),%eax
    380e:	83 e8 02             	sub    $0x2,%eax
    3811:	89 c2                	mov    %eax,%edx
    3813:	8b 45 10             	mov    0x10(%ebp),%eax
    3816:	83 e8 15             	sub    $0x15,%eax
    3819:	68 cb 5a 00 00       	push   $0x5acb
    381e:	6a 14                	push   $0x14
    3820:	52                   	push   %edx
    3821:	50                   	push   %eax
    3822:	6a 01                	push   $0x1
    3824:	ff 75 10             	pushl  0x10(%ebp)
    3827:	ff 75 0c             	pushl  0xc(%ebp)
    382a:	ff 75 08             	pushl  0x8(%ebp)
    382d:	e8 20 f7 ff ff       	call   2f52 <fill_rect>
    3832:	83 c4 20             	add    $0x20,%esp

  loadBitmap(&pic, "close.bmp");
    3835:	83 ec 08             	sub    $0x8,%esp
    3838:	68 af b5 00 00       	push   $0xb5af
    383d:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3840:	50                   	push   %eax
    3841:	e8 fb 00 00 00       	call   3941 <loadBitmap>
    3846:	83 c4 10             	add    $0x10,%esp
  draw_picture(c, pic, 3, 3);
    3849:	6a 03                	push   $0x3
    384b:	6a 03                	push   $0x3
    384d:	ff 75 f4             	pushl  -0xc(%ebp)
    3850:	ff 75 f0             	pushl  -0x10(%ebp)
    3853:	ff 75 ec             	pushl  -0x14(%ebp)
    3856:	ff 75 10             	pushl  0x10(%ebp)
    3859:	ff 75 0c             	pushl  0xc(%ebp)
    385c:	ff 75 08             	pushl  0x8(%ebp)
    385f:	e8 f8 fc ff ff       	call   355c <draw_picture>
    3864:	83 c4 20             	add    $0x20,%esp
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    3867:	83 ec 04             	sub    $0x4,%esp
    386a:	6a 02                	push   $0x2
    386c:	6a 19                	push   $0x19
    386e:	68 ff ff 00 00       	push   $0xffff
    3873:	ff 75 14             	pushl  0x14(%ebp)
    3876:	ff 75 10             	pushl  0x10(%ebp)
    3879:	ff 75 0c             	pushl  0xc(%ebp)
    387c:	ff 75 08             	pushl  0x8(%ebp)
    387f:	e8 29 fc ff ff       	call   34ad <puts_str>
    3884:	83 c4 20             	add    $0x20,%esp
  freepic(&pic);
    3887:	83 ec 0c             	sub    $0xc,%esp
    388a:	8d 45 ec             	lea    -0x14(%ebp),%eax
    388d:	50                   	push   %eax
    388e:	e8 cd 05 00 00       	call   3e60 <freepic>
    3893:	83 c4 10             	add    $0x10,%esp
}
    3896:	c9                   	leave  
    3897:	c3                   	ret    

00003898 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    3898:	55                   	push   %ebp
    3899:	89 e5                	mov    %esp,%ebp
    389b:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < len; i++)
    389e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    38a5:	eb 2c                	jmp    38d3 <load_iconlist+0x3b>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    38a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38aa:	6b d0 34             	imul   $0x34,%eax,%edx
    38ad:	8b 45 08             	mov    0x8(%ebp),%eax
    38b0:	01 d0                	add    %edx,%eax
    38b2:	89 c1                	mov    %eax,%ecx
    38b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38b7:	6b d0 34             	imul   $0x34,%eax,%edx
    38ba:	8b 45 08             	mov    0x8(%ebp),%eax
    38bd:	01 d0                	add    %edx,%eax
    38bf:	83 c0 28             	add    $0x28,%eax
    38c2:	83 ec 08             	sub    $0x8,%esp
    38c5:	51                   	push   %ecx
    38c6:	50                   	push   %eax
    38c7:	e8 75 00 00 00       	call   3941 <loadBitmap>
    38cc:	83 c4 10             	add    $0x10,%esp
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    38cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    38d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    38d9:	7c cc                	jl     38a7 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    38db:	c9                   	leave  
    38dc:	c3                   	ret    

000038dd <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    38dd:	55                   	push   %ebp
    38de:	89 e5                	mov    %esp,%ebp
    38e0:	53                   	push   %ebx
    38e1:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; i < len; i++)
    38e4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    38eb:	eb 47                	jmp    3934 <draw_iconlist+0x57>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    38ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
    38f0:	6b d0 34             	imul   $0x34,%eax,%edx
    38f3:	8b 45 14             	mov    0x14(%ebp),%eax
    38f6:	01 d0                	add    %edx,%eax
    38f8:	8b 48 24             	mov    0x24(%eax),%ecx
    38fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    38fe:	6b d0 34             	imul   $0x34,%eax,%edx
    3901:	8b 45 14             	mov    0x14(%ebp),%eax
    3904:	01 d0                	add    %edx,%eax
    3906:	8b 50 20             	mov    0x20(%eax),%edx
    3909:	8b 45 f8             	mov    -0x8(%ebp),%eax
    390c:	6b d8 34             	imul   $0x34,%eax,%ebx
    390f:	8b 45 14             	mov    0x14(%ebp),%eax
    3912:	01 d8                	add    %ebx,%eax
    3914:	51                   	push   %ecx
    3915:	52                   	push   %edx
    3916:	ff 70 30             	pushl  0x30(%eax)
    3919:	ff 70 2c             	pushl  0x2c(%eax)
    391c:	ff 70 28             	pushl  0x28(%eax)
    391f:	ff 75 10             	pushl  0x10(%ebp)
    3922:	ff 75 0c             	pushl  0xc(%ebp)
    3925:	ff 75 08             	pushl  0x8(%ebp)
    3928:	e8 2f fc ff ff       	call   355c <draw_picture>
    392d:	83 c4 20             	add    $0x20,%esp
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    3930:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3934:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3937:	3b 45 18             	cmp    0x18(%ebp),%eax
    393a:	7c b1                	jl     38ed <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    393c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    393f:	c9                   	leave  
    3940:	c3                   	ret    

00003941 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    3941:	55                   	push   %ebp
    3942:	89 e5                	mov    %esp,%ebp
    3944:	81 ec 88 00 00 00    	sub    $0x88,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    394a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    3951:	83 ec 08             	sub    $0x8,%esp
    3954:	6a 00                	push   $0x0
    3956:	ff 75 0c             	pushl  0xc(%ebp)
    3959:	e8 68 0f 00 00       	call   48c6 <open>
    395e:	83 c4 10             	add    $0x10,%esp
    3961:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3964:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3968:	79 1a                	jns    3984 <loadBitmap+0x43>
		printf(0, "cannot open %s\n", pic_name);
    396a:	83 ec 04             	sub    $0x4,%esp
    396d:	ff 75 0c             	pushl  0xc(%ebp)
    3970:	68 bc b5 00 00       	push   $0xb5bc
    3975:	6a 00                	push   $0x0
    3977:	e8 e7 10 00 00       	call   4a63 <printf>
    397c:	83 c4 10             	add    $0x10,%esp
		return;
    397f:	e9 ca 02 00 00       	jmp    3c4e <loadBitmap+0x30d>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    3984:	83 ec 04             	sub    $0x4,%esp
    3987:	ff 75 0c             	pushl  0xc(%ebp)
    398a:	68 cc b5 00 00       	push   $0xb5cc
    398f:	6a 00                	push   $0x0
    3991:	e8 cd 10 00 00       	call   4a63 <printf>
    3996:	83 c4 10             	add    $0x10,%esp
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    3999:	83 ec 0c             	sub    $0xc,%esp
    399c:	6a 0e                	push   $0xe
    399e:	e8 91 13 00 00       	call   4d34 <malloc>
    39a3:	83 c4 10             	add    $0x10,%esp
    39a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    39a9:	83 ec 04             	sub    $0x4,%esp
    39ac:	6a 0e                	push   $0xe
    39ae:	ff 75 e4             	pushl  -0x1c(%ebp)
    39b1:	ff 75 e8             	pushl  -0x18(%ebp)
    39b4:	e8 e5 0e 00 00       	call   489e <read>
    39b9:	83 c4 10             	add    $0x10,%esp
    39bc:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    39bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    39c2:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    39c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    39c8:	0f b7 00             	movzwl (%eax),%eax
    39cb:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    39cf:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    39d3:	66 3d 42 4d          	cmp    $0x4d42,%ax
    39d7:	74 17                	je     39f0 <loadBitmap+0xaf>
		printf(0, "file is not .bmp file!");
    39d9:	83 ec 08             	sub    $0x8,%esp
    39dc:	68 e0 b5 00 00       	push   $0xb5e0
    39e1:	6a 00                	push   $0x0
    39e3:	e8 7b 10 00 00       	call   4a63 <printf>
    39e8:	83 c4 10             	add    $0x10,%esp
		return;
    39eb:	e9 5e 02 00 00       	jmp    3c4e <loadBitmap+0x30d>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    39f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    39f3:	83 c0 02             	add    $0x2,%eax
    39f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    39f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
    39fc:	8b 00                	mov    (%eax),%eax
    39fe:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3a01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a04:	83 c0 06             	add    $0x6,%eax
    3a07:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    3a0a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3a0d:	0f b7 00             	movzwl (%eax),%eax
    3a10:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3a14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a17:	83 c0 08             	add    $0x8,%eax
    3a1a:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    3a1d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3a20:	0f b7 00             	movzwl (%eax),%eax
    3a23:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3a27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a2a:	83 c0 0a             	add    $0xa,%eax
    3a2d:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    3a30:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3a33:	8b 00                	mov    (%eax),%eax
    3a35:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    3a38:	83 ec 04             	sub    $0x4,%esp
    3a3b:	6a 28                	push   $0x28
    3a3d:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3a40:	50                   	push   %eax
    3a41:	ff 75 e8             	pushl  -0x18(%ebp)
    3a44:	e8 55 0e 00 00       	call   489e <read>
    3a49:	83 c4 10             	add    $0x10,%esp
	width = bitInfoHead.biWidth;
    3a4c:	8b 45 88             	mov    -0x78(%ebp),%eax
    3a4f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    3a52:	8b 45 8c             	mov    -0x74(%ebp),%eax
    3a55:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    3a58:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3a5b:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    3a5f:	c1 e0 02             	shl    $0x2,%eax
    3a62:	83 ec 0c             	sub    $0xc,%esp
    3a65:	50                   	push   %eax
    3a66:	ff 75 d0             	pushl  -0x30(%ebp)
    3a69:	ff 75 d4             	pushl  -0x2c(%ebp)
    3a6c:	68 f8 b5 00 00       	push   $0xb5f8
    3a71:	6a 00                	push   $0x0
    3a73:	e8 eb 0f 00 00       	call   4a63 <printf>
    3a78:	83 c4 20             	add    $0x20,%esp
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    3a7b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3a7f:	75 12                	jne    3a93 <loadBitmap+0x152>
		printf(0, "0");
    3a81:	83 ec 08             	sub    $0x8,%esp
    3a84:	68 1d b6 00 00       	push   $0xb61d
    3a89:	6a 00                	push   $0x0
    3a8b:	e8 d3 0f 00 00       	call   4a63 <printf>
    3a90:	83 c4 10             	add    $0x10,%esp
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    3a93:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3a97:	0f b7 c0             	movzwl %ax,%eax
    3a9a:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    3a9e:	83 c0 1f             	add    $0x1f,%eax
    3aa1:	8d 50 1f             	lea    0x1f(%eax),%edx
    3aa4:	85 c0                	test   %eax,%eax
    3aa6:	0f 48 c2             	cmovs  %edx,%eax
    3aa9:	c1 f8 05             	sar    $0x5,%eax
    3aac:	c1 e0 02             	shl    $0x2,%eax
    3aaf:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    3ab2:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3ab5:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3ab9:	83 ec 0c             	sub    $0xc,%esp
    3abc:	50                   	push   %eax
    3abd:	e8 72 12 00 00       	call   4d34 <malloc>
    3ac2:	83 c4 10             	add    $0x10,%esp
    3ac5:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    3ac8:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3acb:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3ace:	0f af c2             	imul   %edx,%eax
    3ad1:	83 ec 04             	sub    $0x4,%esp
    3ad4:	50                   	push   %eax
    3ad5:	6a 00                	push   $0x0
    3ad7:	ff 75 c8             	pushl  -0x38(%ebp)
    3ada:	e8 0d 0c 00 00       	call   46ec <memset>
    3adf:	83 c4 10             	add    $0x10,%esp
	long nData = height * l_width;
    3ae2:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3ae5:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3ae9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    3aec:	83 ec 04             	sub    $0x4,%esp
    3aef:	ff 75 c4             	pushl  -0x3c(%ebp)
    3af2:	ff 75 c8             	pushl  -0x38(%ebp)
    3af5:	ff 75 e8             	pushl  -0x18(%ebp)
    3af8:	e8 a1 0d 00 00       	call   489e <read>
    3afd:	83 c4 10             	add    $0x10,%esp

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    3b00:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3b03:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    3b07:	c1 e0 02             	shl    $0x2,%eax
    3b0a:	83 ec 0c             	sub    $0xc,%esp
    3b0d:	50                   	push   %eax
    3b0e:	e8 21 12 00 00       	call   4d34 <malloc>
    3b13:	83 c4 10             	add    $0x10,%esp
    3b16:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    3b19:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3b1c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b1f:	0f af c2             	imul   %edx,%eax
    3b22:	c1 e0 02             	shl    $0x2,%eax
    3b25:	83 ec 04             	sub    $0x4,%esp
    3b28:	50                   	push   %eax
    3b29:	6a 00                	push   $0x0
    3b2b:	ff 75 c0             	pushl  -0x40(%ebp)
    3b2e:	e8 b9 0b 00 00       	call   46ec <memset>
    3b33:	83 c4 10             	add    $0x10,%esp
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    3b36:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3b3a:	66 83 f8 17          	cmp    $0x17,%ax
    3b3e:	77 17                	ja     3b57 <loadBitmap+0x216>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    3b40:	83 ec 08             	sub    $0x8,%esp
    3b43:	68 20 b6 00 00       	push   $0xb620
    3b48:	6a 00                	push   $0x0
    3b4a:	e8 14 0f 00 00       	call   4a63 <printf>
    3b4f:	83 c4 10             	add    $0x10,%esp
		return;
    3b52:	e9 f7 00 00 00       	jmp    3c4e <loadBitmap+0x30d>
	} else	//位图为24位真彩色
	{
		index = 0;
    3b57:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    3b5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3b65:	e9 94 00 00 00       	jmp    3bfe <loadBitmap+0x2bd>
			for (j = 0; j < width; j++) {
    3b6a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3b71:	eb 7b                	jmp    3bee <loadBitmap+0x2ad>
				k = i * l_width + j * 3;
    3b73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b76:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3b7a:	89 c1                	mov    %eax,%ecx
    3b7c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3b7f:	89 d0                	mov    %edx,%eax
    3b81:	01 c0                	add    %eax,%eax
    3b83:	01 d0                	add    %edx,%eax
    3b85:	01 c8                	add    %ecx,%eax
    3b87:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    3b8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3b8d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3b94:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3b97:	01 c2                	add    %eax,%edx
    3b99:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3b9c:	8d 48 02             	lea    0x2(%eax),%ecx
    3b9f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3ba2:	01 c8                	add    %ecx,%eax
    3ba4:	0f b6 00             	movzbl (%eax),%eax
    3ba7:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    3baa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3bad:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3bb4:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3bb7:	01 c2                	add    %eax,%edx
    3bb9:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3bbc:	8d 48 01             	lea    0x1(%eax),%ecx
    3bbf:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3bc2:	01 c8                	add    %ecx,%eax
    3bc4:	0f b6 00             	movzbl (%eax),%eax
    3bc7:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    3bca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3bcd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3bd4:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3bd7:	01 c2                	add    %eax,%edx
    3bd9:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    3bdc:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3bdf:	01 c8                	add    %ecx,%eax
    3be1:	0f b6 00             	movzbl (%eax),%eax
    3be4:	88 02                	mov    %al,(%edx)
				index++;
    3be6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    3bea:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3bee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3bf1:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    3bf4:	0f 8c 79 ff ff ff    	jl     3b73 <loadBitmap+0x232>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    3bfa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c01:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    3c04:	0f 8c 60 ff ff ff    	jl     3b6a <loadBitmap+0x229>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    3c0a:	83 ec 0c             	sub    $0xc,%esp
    3c0d:	ff 75 e8             	pushl  -0x18(%ebp)
    3c10:	e8 99 0c 00 00       	call   48ae <close>
    3c15:	83 c4 10             	add    $0x10,%esp

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    3c18:	8b 45 08             	mov    0x8(%ebp),%eax
    3c1b:	8b 55 c0             	mov    -0x40(%ebp),%edx
    3c1e:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    3c20:	8b 45 08             	mov    0x8(%ebp),%eax
    3c23:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3c26:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    3c29:	8b 45 08             	mov    0x8(%ebp),%eax
    3c2c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3c2f:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    3c32:	83 ec 0c             	sub    $0xc,%esp
    3c35:	ff 75 c8             	pushl  -0x38(%ebp)
    3c38:	e8 b6 0f 00 00       	call   4bf3 <free>
    3c3d:	83 c4 10             	add    $0x10,%esp
	free(BmpFileHeader);
    3c40:	83 ec 0c             	sub    $0xc,%esp
    3c43:	ff 75 e4             	pushl  -0x1c(%ebp)
    3c46:	e8 a8 0f 00 00       	call   4bf3 <free>
    3c4b:	83 c4 10             	add    $0x10,%esp
	//printf("\n");
}
    3c4e:	c9                   	leave  
    3c4f:	c3                   	ret    

00003c50 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    3c50:	55                   	push   %ebp
    3c51:	89 e5                	mov    %esp,%ebp
    3c53:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图文件头:\n");
    3c56:	83 ec 08             	sub    $0x8,%esp
    3c59:	68 40 b6 00 00       	push   $0xb640
    3c5e:	6a 00                	push   $0x0
    3c60:	e8 fe 0d 00 00       	call   4a63 <printf>
    3c65:	83 c4 10             	add    $0x10,%esp
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    3c68:	8b 45 08             	mov    0x8(%ebp),%eax
    3c6b:	0f b7 00             	movzwl (%eax),%eax
    3c6e:	0f b7 c0             	movzwl %ax,%eax
    3c71:	83 ec 04             	sub    $0x4,%esp
    3c74:	50                   	push   %eax
    3c75:	68 52 b6 00 00       	push   $0xb652
    3c7a:	6a 00                	push   $0x0
    3c7c:	e8 e2 0d 00 00       	call   4a63 <printf>
    3c81:	83 c4 10             	add    $0x10,%esp
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    3c84:	8b 45 08             	mov    0x8(%ebp),%eax
    3c87:	8b 40 04             	mov    0x4(%eax),%eax
    3c8a:	83 ec 04             	sub    $0x4,%esp
    3c8d:	50                   	push   %eax
    3c8e:	68 70 b6 00 00       	push   $0xb670
    3c93:	6a 00                	push   $0x0
    3c95:	e8 c9 0d 00 00       	call   4a63 <printf>
    3c9a:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    3c9d:	8b 45 08             	mov    0x8(%ebp),%eax
    3ca0:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    3ca4:	0f b7 c0             	movzwl %ax,%eax
    3ca7:	83 ec 04             	sub    $0x4,%esp
    3caa:	50                   	push   %eax
    3cab:	68 81 b6 00 00       	push   $0xb681
    3cb0:	6a 00                	push   $0x0
    3cb2:	e8 ac 0d 00 00       	call   4a63 <printf>
    3cb7:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    3cba:	8b 45 08             	mov    0x8(%ebp),%eax
    3cbd:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    3cc1:	0f b7 c0             	movzwl %ax,%eax
    3cc4:	83 ec 04             	sub    $0x4,%esp
    3cc7:	50                   	push   %eax
    3cc8:	68 81 b6 00 00       	push   $0xb681
    3ccd:	6a 00                	push   $0x0
    3ccf:	e8 8f 0d 00 00       	call   4a63 <printf>
    3cd4:	83 c4 10             	add    $0x10,%esp
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    3cd7:	8b 45 08             	mov    0x8(%ebp),%eax
    3cda:	8b 40 0c             	mov    0xc(%eax),%eax
    3cdd:	83 ec 04             	sub    $0x4,%esp
    3ce0:	50                   	push   %eax
    3ce1:	68 90 b6 00 00       	push   $0xb690
    3ce6:	6a 00                	push   $0x0
    3ce8:	e8 76 0d 00 00       	call   4a63 <printf>
    3ced:	83 c4 10             	add    $0x10,%esp
}
    3cf0:	c9                   	leave  
    3cf1:	c3                   	ret    

00003cf2 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    3cf2:	55                   	push   %ebp
    3cf3:	89 e5                	mov    %esp,%ebp
    3cf5:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图信息头:\n");
    3cf8:	83 ec 08             	sub    $0x8,%esp
    3cfb:	68 b9 b6 00 00       	push   $0xb6b9
    3d00:	6a 00                	push   $0x0
    3d02:	e8 5c 0d 00 00       	call   4a63 <printf>
    3d07:	83 c4 10             	add    $0x10,%esp
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    3d0a:	8b 45 08             	mov    0x8(%ebp),%eax
    3d0d:	8b 00                	mov    (%eax),%eax
    3d0f:	83 ec 04             	sub    $0x4,%esp
    3d12:	50                   	push   %eax
    3d13:	68 cb b6 00 00       	push   $0xb6cb
    3d18:	6a 00                	push   $0x0
    3d1a:	e8 44 0d 00 00       	call   4a63 <printf>
    3d1f:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    3d22:	8b 45 08             	mov    0x8(%ebp),%eax
    3d25:	8b 40 04             	mov    0x4(%eax),%eax
    3d28:	83 ec 04             	sub    $0x4,%esp
    3d2b:	50                   	push   %eax
    3d2c:	68 e2 b6 00 00       	push   $0xb6e2
    3d31:	6a 00                	push   $0x0
    3d33:	e8 2b 0d 00 00       	call   4a63 <printf>
    3d38:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    3d3b:	8b 45 08             	mov    0x8(%ebp),%eax
    3d3e:	8b 40 08             	mov    0x8(%eax),%eax
    3d41:	83 ec 04             	sub    $0x4,%esp
    3d44:	50                   	push   %eax
    3d45:	68 f0 b6 00 00       	push   $0xb6f0
    3d4a:	6a 00                	push   $0x0
    3d4c:	e8 12 0d 00 00       	call   4a63 <printf>
    3d51:	83 c4 10             	add    $0x10,%esp
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    3d54:	8b 45 08             	mov    0x8(%ebp),%eax
    3d57:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    3d5b:	0f b7 c0             	movzwl %ax,%eax
    3d5e:	83 ec 04             	sub    $0x4,%esp
    3d61:	50                   	push   %eax
    3d62:	68 fe b6 00 00       	push   $0xb6fe
    3d67:	6a 00                	push   $0x0
    3d69:	e8 f5 0c 00 00       	call   4a63 <printf>
    3d6e:	83 c4 10             	add    $0x10,%esp
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    3d71:	8b 45 08             	mov    0x8(%ebp),%eax
    3d74:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    3d78:	0f b7 c0             	movzwl %ax,%eax
    3d7b:	83 ec 04             	sub    $0x4,%esp
    3d7e:	50                   	push   %eax
    3d7f:	68 14 b7 00 00       	push   $0xb714
    3d84:	6a 00                	push   $0x0
    3d86:	e8 d8 0c 00 00       	call   4a63 <printf>
    3d8b:	83 c4 10             	add    $0x10,%esp
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    3d8e:	8b 45 08             	mov    0x8(%ebp),%eax
    3d91:	8b 40 10             	mov    0x10(%eax),%eax
    3d94:	83 ec 04             	sub    $0x4,%esp
    3d97:	50                   	push   %eax
    3d98:	68 35 b7 00 00       	push   $0xb735
    3d9d:	6a 00                	push   $0x0
    3d9f:	e8 bf 0c 00 00       	call   4a63 <printf>
    3da4:	83 c4 10             	add    $0x10,%esp
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    3da7:	8b 45 08             	mov    0x8(%ebp),%eax
    3daa:	8b 40 14             	mov    0x14(%eax),%eax
    3dad:	83 ec 04             	sub    $0x4,%esp
    3db0:	50                   	push   %eax
    3db1:	68 48 b7 00 00       	push   $0xb748
    3db6:	6a 00                	push   $0x0
    3db8:	e8 a6 0c 00 00       	call   4a63 <printf>
    3dbd:	83 c4 10             	add    $0x10,%esp
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    3dc0:	8b 45 08             	mov    0x8(%ebp),%eax
    3dc3:	8b 40 18             	mov    0x18(%eax),%eax
    3dc6:	83 ec 04             	sub    $0x4,%esp
    3dc9:	50                   	push   %eax
    3dca:	68 7c b7 00 00       	push   $0xb77c
    3dcf:	6a 00                	push   $0x0
    3dd1:	e8 8d 0c 00 00       	call   4a63 <printf>
    3dd6:	83 c4 10             	add    $0x10,%esp
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    3dd9:	8b 45 08             	mov    0x8(%ebp),%eax
    3ddc:	8b 40 1c             	mov    0x1c(%eax),%eax
    3ddf:	83 ec 04             	sub    $0x4,%esp
    3de2:	50                   	push   %eax
    3de3:	68 91 b7 00 00       	push   $0xb791
    3de8:	6a 00                	push   $0x0
    3dea:	e8 74 0c 00 00       	call   4a63 <printf>
    3def:	83 c4 10             	add    $0x10,%esp
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    3df2:	8b 45 08             	mov    0x8(%ebp),%eax
    3df5:	8b 40 20             	mov    0x20(%eax),%eax
    3df8:	83 ec 04             	sub    $0x4,%esp
    3dfb:	50                   	push   %eax
    3dfc:	68 a6 b7 00 00       	push   $0xb7a6
    3e01:	6a 00                	push   $0x0
    3e03:	e8 5b 0c 00 00       	call   4a63 <printf>
    3e08:	83 c4 10             	add    $0x10,%esp
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    3e0b:	8b 45 08             	mov    0x8(%ebp),%eax
    3e0e:	8b 40 24             	mov    0x24(%eax),%eax
    3e11:	83 ec 04             	sub    $0x4,%esp
    3e14:	50                   	push   %eax
    3e15:	68 bd b7 00 00       	push   $0xb7bd
    3e1a:	6a 00                	push   $0x0
    3e1c:	e8 42 0c 00 00       	call   4a63 <printf>
    3e21:	83 c4 10             	add    $0x10,%esp
}
    3e24:	c9                   	leave  
    3e25:	c3                   	ret    

00003e26 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    3e26:	55                   	push   %ebp
    3e27:	89 e5                	mov    %esp,%ebp
    3e29:	83 ec 08             	sub    $0x8,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    3e2c:	8b 45 08             	mov    0x8(%ebp),%eax
    3e2f:	0f b6 00             	movzbl (%eax),%eax
    3e32:	0f b6 c8             	movzbl %al,%ecx
    3e35:	8b 45 08             	mov    0x8(%ebp),%eax
    3e38:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3e3c:	0f b6 d0             	movzbl %al,%edx
    3e3f:	8b 45 08             	mov    0x8(%ebp),%eax
    3e42:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3e46:	0f b6 c0             	movzbl %al,%eax
    3e49:	83 ec 0c             	sub    $0xc,%esp
    3e4c:	51                   	push   %ecx
    3e4d:	52                   	push   %edx
    3e4e:	50                   	push   %eax
    3e4f:	68 d1 b7 00 00       	push   $0xb7d1
    3e54:	6a 00                	push   $0x0
    3e56:	e8 08 0c 00 00       	call   4a63 <printf>
    3e5b:	83 c4 20             	add    $0x20,%esp
}
    3e5e:	c9                   	leave  
    3e5f:	c3                   	ret    

00003e60 <freepic>:

void freepic(PICNODE *pic) {
    3e60:	55                   	push   %ebp
    3e61:	89 e5                	mov    %esp,%ebp
    3e63:	83 ec 08             	sub    $0x8,%esp
	free(pic->data);
    3e66:	8b 45 08             	mov    0x8(%ebp),%eax
    3e69:	8b 00                	mov    (%eax),%eax
    3e6b:	83 ec 0c             	sub    $0xc,%esp
    3e6e:	50                   	push   %eax
    3e6f:	e8 7f 0d 00 00       	call   4bf3 <free>
    3e74:	83 c4 10             	add    $0x10,%esp
}
    3e77:	c9                   	leave  
    3e78:	c3                   	ret    

00003e79 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    3e79:	55                   	push   %ebp
    3e7a:	89 e5                	mov    %esp,%ebp
    3e7c:	83 ec 68             	sub    $0x68,%esp
	int W = 15;
    3e7f:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    3e86:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3e89:	83 ec 0c             	sub    $0xc,%esp
    3e8c:	ff 75 ec             	pushl  -0x14(%ebp)
    3e8f:	ff 75 ec             	pushl  -0x14(%ebp)
    3e92:	6a 00                	push   $0x0
    3e94:	6a 00                	push   $0x0
    3e96:	50                   	push   %eax
    3e97:	e8 01 02 00 00       	call   409d <initRect>
    3e9c:	83 c4 1c             	add    $0x1c,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    3e9f:	8b 45 08             	mov    0x8(%ebp),%eax
    3ea2:	8b 40 04             	mov    0x4(%eax),%eax
    3ea5:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3ea8:	89 c2                	mov    %eax,%edx
    3eaa:	8d 45 cc             	lea    -0x34(%ebp),%eax
    3ead:	83 ec 0c             	sub    $0xc,%esp
    3eb0:	ff 75 ec             	pushl  -0x14(%ebp)
    3eb3:	ff 75 ec             	pushl  -0x14(%ebp)
    3eb6:	6a 00                	push   $0x0
    3eb8:	52                   	push   %edx
    3eb9:	50                   	push   %eax
    3eba:	e8 de 01 00 00       	call   409d <initRect>
    3ebf:	83 c4 1c             	add    $0x1c,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    3ec2:	8b 45 08             	mov    0x8(%ebp),%eax
    3ec5:	8b 40 08             	mov    0x8(%eax),%eax
    3ec8:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3ecb:	89 c1                	mov    %eax,%ecx
    3ecd:	8b 45 08             	mov    0x8(%ebp),%eax
    3ed0:	8b 40 04             	mov    0x4(%eax),%eax
    3ed3:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3ed6:	89 c2                	mov    %eax,%edx
    3ed8:	8d 45 bc             	lea    -0x44(%ebp),%eax
    3edb:	83 ec 0c             	sub    $0xc,%esp
    3ede:	ff 75 ec             	pushl  -0x14(%ebp)
    3ee1:	ff 75 ec             	pushl  -0x14(%ebp)
    3ee4:	51                   	push   %ecx
    3ee5:	52                   	push   %edx
    3ee6:	50                   	push   %eax
    3ee7:	e8 b1 01 00 00       	call   409d <initRect>
    3eec:	83 c4 1c             	add    $0x1c,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    3eef:	8b 45 08             	mov    0x8(%ebp),%eax
    3ef2:	8b 40 08             	mov    0x8(%eax),%eax
    3ef5:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3ef8:	89 c2                	mov    %eax,%edx
    3efa:	8d 45 ac             	lea    -0x54(%ebp),%eax
    3efd:	83 ec 0c             	sub    $0xc,%esp
    3f00:	ff 75 ec             	pushl  -0x14(%ebp)
    3f03:	ff 75 ec             	pushl  -0x14(%ebp)
    3f06:	52                   	push   %edx
    3f07:	6a 00                	push   $0x0
    3f09:	50                   	push   %eax
    3f0a:	e8 8e 01 00 00       	call   409d <initRect>
    3f0f:	83 c4 1c             	add    $0x1c,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    3f12:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3f19:	e9 47 01 00 00       	jmp    4065 <set_icon_alpha+0x1ec>
		for (j = 0; j < pic->height; j++) {
    3f1e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3f25:	e9 28 01 00 00       	jmp    4052 <set_icon_alpha+0x1d9>
			p = initPoint(i, j);
    3f2a:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3f2d:	83 ec 04             	sub    $0x4,%esp
    3f30:	ff 75 f0             	pushl  -0x10(%ebp)
    3f33:	ff 75 f4             	pushl  -0xc(%ebp)
    3f36:	50                   	push   %eax
    3f37:	e8 3a 01 00 00       	call   4076 <initPoint>
    3f3c:	83 c4 0c             	add    $0xc,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    3f3f:	83 ec 08             	sub    $0x8,%esp
    3f42:	ff 75 e8             	pushl  -0x18(%ebp)
    3f45:	ff 75 e4             	pushl  -0x1c(%ebp)
    3f48:	ff 75 e0             	pushl  -0x20(%ebp)
    3f4b:	ff 75 dc             	pushl  -0x24(%ebp)
    3f4e:	ff 75 a8             	pushl  -0x58(%ebp)
    3f51:	ff 75 a4             	pushl  -0x5c(%ebp)
    3f54:	e8 95 01 00 00       	call   40ee <isIn>
    3f59:	83 c4 20             	add    $0x20,%esp
    3f5c:	85 c0                	test   %eax,%eax
    3f5e:	75 67                	jne    3fc7 <set_icon_alpha+0x14e>
    3f60:	83 ec 08             	sub    $0x8,%esp
    3f63:	ff 75 d8             	pushl  -0x28(%ebp)
    3f66:	ff 75 d4             	pushl  -0x2c(%ebp)
    3f69:	ff 75 d0             	pushl  -0x30(%ebp)
    3f6c:	ff 75 cc             	pushl  -0x34(%ebp)
    3f6f:	ff 75 a8             	pushl  -0x58(%ebp)
    3f72:	ff 75 a4             	pushl  -0x5c(%ebp)
    3f75:	e8 74 01 00 00       	call   40ee <isIn>
    3f7a:	83 c4 20             	add    $0x20,%esp
    3f7d:	85 c0                	test   %eax,%eax
    3f7f:	75 46                	jne    3fc7 <set_icon_alpha+0x14e>
    3f81:	83 ec 08             	sub    $0x8,%esp
    3f84:	ff 75 c8             	pushl  -0x38(%ebp)
    3f87:	ff 75 c4             	pushl  -0x3c(%ebp)
    3f8a:	ff 75 c0             	pushl  -0x40(%ebp)
    3f8d:	ff 75 bc             	pushl  -0x44(%ebp)
    3f90:	ff 75 a8             	pushl  -0x58(%ebp)
    3f93:	ff 75 a4             	pushl  -0x5c(%ebp)
    3f96:	e8 53 01 00 00       	call   40ee <isIn>
    3f9b:	83 c4 20             	add    $0x20,%esp
    3f9e:	85 c0                	test   %eax,%eax
    3fa0:	75 25                	jne    3fc7 <set_icon_alpha+0x14e>
    3fa2:	83 ec 08             	sub    $0x8,%esp
    3fa5:	ff 75 b8             	pushl  -0x48(%ebp)
    3fa8:	ff 75 b4             	pushl  -0x4c(%ebp)
    3fab:	ff 75 b0             	pushl  -0x50(%ebp)
    3fae:	ff 75 ac             	pushl  -0x54(%ebp)
    3fb1:	ff 75 a8             	pushl  -0x58(%ebp)
    3fb4:	ff 75 a4             	pushl  -0x5c(%ebp)
    3fb7:	e8 32 01 00 00       	call   40ee <isIn>
    3fbc:	83 c4 20             	add    $0x20,%esp
    3fbf:	85 c0                	test   %eax,%eax
    3fc1:	0f 84 87 00 00 00    	je     404e <set_icon_alpha+0x1d5>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    3fc7:	8b 45 08             	mov    0x8(%ebp),%eax
    3fca:	8b 10                	mov    (%eax),%edx
    3fcc:	8b 45 08             	mov    0x8(%ebp),%eax
    3fcf:	8b 40 04             	mov    0x4(%eax),%eax
    3fd2:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3fd6:	89 c1                	mov    %eax,%ecx
    3fd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fdb:	01 c8                	add    %ecx,%eax
    3fdd:	c1 e0 02             	shl    $0x2,%eax
    3fe0:	01 d0                	add    %edx,%eax
    3fe2:	0f b6 00             	movzbl (%eax),%eax
    3fe5:	3c ff                	cmp    $0xff,%al
    3fe7:	75 65                	jne    404e <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    3fe9:	8b 45 08             	mov    0x8(%ebp),%eax
    3fec:	8b 10                	mov    (%eax),%edx
    3fee:	8b 45 08             	mov    0x8(%ebp),%eax
    3ff1:	8b 40 04             	mov    0x4(%eax),%eax
    3ff4:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3ff8:	89 c1                	mov    %eax,%ecx
    3ffa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ffd:	01 c8                	add    %ecx,%eax
    3fff:	c1 e0 02             	shl    $0x2,%eax
    4002:	01 d0                	add    %edx,%eax
    4004:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4008:	3c ff                	cmp    $0xff,%al
    400a:	75 42                	jne    404e <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    400c:	8b 45 08             	mov    0x8(%ebp),%eax
    400f:	8b 10                	mov    (%eax),%edx
    4011:	8b 45 08             	mov    0x8(%ebp),%eax
    4014:	8b 40 04             	mov    0x4(%eax),%eax
    4017:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    401b:	89 c1                	mov    %eax,%ecx
    401d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4020:	01 c8                	add    %ecx,%eax
    4022:	c1 e0 02             	shl    $0x2,%eax
    4025:	01 d0                	add    %edx,%eax
    4027:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    402b:	3c ff                	cmp    $0xff,%al
    402d:	75 1f                	jne    404e <set_icon_alpha+0x1d5>
					pic->data[j * pic->width + i].rgbReserved = 1;
    402f:	8b 45 08             	mov    0x8(%ebp),%eax
    4032:	8b 10                	mov    (%eax),%edx
    4034:	8b 45 08             	mov    0x8(%ebp),%eax
    4037:	8b 40 04             	mov    0x4(%eax),%eax
    403a:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    403e:	89 c1                	mov    %eax,%ecx
    4040:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4043:	01 c8                	add    %ecx,%eax
    4045:	c1 e0 02             	shl    $0x2,%eax
    4048:	01 d0                	add    %edx,%eax
    404a:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    404e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4052:	8b 45 08             	mov    0x8(%ebp),%eax
    4055:	8b 40 08             	mov    0x8(%eax),%eax
    4058:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    405b:	0f 8f c9 fe ff ff    	jg     3f2a <set_icon_alpha+0xb1>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    4061:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4065:	8b 45 08             	mov    0x8(%ebp),%eax
    4068:	8b 40 04             	mov    0x4(%eax),%eax
    406b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    406e:	0f 8f aa fe ff ff    	jg     3f1e <set_icon_alpha+0xa5>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    4074:	c9                   	leave  
    4075:	c3                   	ret    

00004076 <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    4076:	55                   	push   %ebp
    4077:	89 e5                	mov    %esp,%ebp
    4079:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    407c:	8b 45 0c             	mov    0xc(%ebp),%eax
    407f:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    4082:	8b 45 10             	mov    0x10(%ebp),%eax
    4085:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    4088:	8b 4d 08             	mov    0x8(%ebp),%ecx
    408b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    408e:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4091:	89 01                	mov    %eax,(%ecx)
    4093:	89 51 04             	mov    %edx,0x4(%ecx)
}
    4096:	8b 45 08             	mov    0x8(%ebp),%eax
    4099:	c9                   	leave  
    409a:	c2 04 00             	ret    $0x4

0000409d <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    409d:	55                   	push   %ebp
    409e:	89 e5                	mov    %esp,%ebp
    40a0:	83 ec 18             	sub    $0x18,%esp
	Rect r;
	r.start = initPoint(x, y);
    40a3:	8d 45 e8             	lea    -0x18(%ebp),%eax
    40a6:	ff 75 10             	pushl  0x10(%ebp)
    40a9:	ff 75 0c             	pushl  0xc(%ebp)
    40ac:	50                   	push   %eax
    40ad:	e8 c4 ff ff ff       	call   4076 <initPoint>
    40b2:	83 c4 08             	add    $0x8,%esp
    40b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    40b8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    40bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    40be:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    40c1:	8b 45 14             	mov    0x14(%ebp),%eax
    40c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    40c7:	8b 45 18             	mov    0x18(%ebp),%eax
    40ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    40cd:	8b 45 08             	mov    0x8(%ebp),%eax
    40d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    40d3:	89 10                	mov    %edx,(%eax)
    40d5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    40d8:	89 50 04             	mov    %edx,0x4(%eax)
    40db:	8b 55 f8             	mov    -0x8(%ebp),%edx
    40de:	89 50 08             	mov    %edx,0x8(%eax)
    40e1:	8b 55 fc             	mov    -0x4(%ebp),%edx
    40e4:	89 50 0c             	mov    %edx,0xc(%eax)
}
    40e7:	8b 45 08             	mov    0x8(%ebp),%eax
    40ea:	c9                   	leave  
    40eb:	c2 04 00             	ret    $0x4

000040ee <isIn>:

int isIn(Point p, Rect r)
{
    40ee:	55                   	push   %ebp
    40ef:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    40f1:	8b 55 08             	mov    0x8(%ebp),%edx
    40f4:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    40f7:	39 c2                	cmp    %eax,%edx
    40f9:	7c 2f                	jl     412a <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    40fb:	8b 45 08             	mov    0x8(%ebp),%eax
    40fe:	8b 4d 10             	mov    0x10(%ebp),%ecx
    4101:	8b 55 18             	mov    0x18(%ebp),%edx
    4104:	01 ca                	add    %ecx,%edx
    4106:	39 d0                	cmp    %edx,%eax
    4108:	7d 20                	jge    412a <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    410a:	8b 55 0c             	mov    0xc(%ebp),%edx
    410d:	8b 45 14             	mov    0x14(%ebp),%eax
    4110:	39 c2                	cmp    %eax,%edx
    4112:	7c 16                	jl     412a <isIn+0x3c>
    4114:	8b 45 0c             	mov    0xc(%ebp),%eax
    4117:	8b 4d 14             	mov    0x14(%ebp),%ecx
    411a:	8b 55 1c             	mov    0x1c(%ebp),%edx
    411d:	01 ca                	add    %ecx,%edx
    411f:	39 d0                	cmp    %edx,%eax
    4121:	7d 07                	jge    412a <isIn+0x3c>
    4123:	b8 01 00 00 00       	mov    $0x1,%eax
    4128:	eb 05                	jmp    412f <isIn+0x41>
    412a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    412f:	5d                   	pop    %ebp
    4130:	c3                   	ret    

00004131 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    4131:	55                   	push   %ebp
    4132:	89 e5                	mov    %esp,%ebp
    4134:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    4137:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    413e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    4145:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    414c:	8b 45 10             	mov    0x10(%ebp),%eax
    414f:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    4152:	8b 45 14             	mov    0x14(%ebp),%eax
    4155:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    4158:	8b 45 08             	mov    0x8(%ebp),%eax
    415b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    415e:	89 10                	mov    %edx,(%eax)
    4160:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4163:	89 50 04             	mov    %edx,0x4(%eax)
    4166:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4169:	89 50 08             	mov    %edx,0x8(%eax)
    416c:	8b 55 f8             	mov    -0x8(%ebp),%edx
    416f:	89 50 0c             	mov    %edx,0xc(%eax)
    4172:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4175:	89 50 10             	mov    %edx,0x10(%eax)
}
    4178:	8b 45 08             	mov    0x8(%ebp),%eax
    417b:	c9                   	leave  
    417c:	c2 04 00             	ret    $0x4

0000417f <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    417f:	55                   	push   %ebp
    4180:	89 e5                	mov    %esp,%ebp
    4182:	83 ec 08             	sub    $0x8,%esp
	switch (MsgType)
    4185:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4188:	83 f8 03             	cmp    $0x3,%eax
    418b:	74 4f                	je     41dc <createClickable+0x5d>
    418d:	83 f8 04             	cmp    $0x4,%eax
    4190:	74 07                	je     4199 <createClickable+0x1a>
    4192:	83 f8 02             	cmp    $0x2,%eax
    4195:	74 25                	je     41bc <createClickable+0x3d>
    4197:	eb 66                	jmp    41ff <createClickable+0x80>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    4199:	8b 45 08             	mov    0x8(%ebp),%eax
    419c:	83 c0 04             	add    $0x4,%eax
    419f:	83 ec 08             	sub    $0x8,%esp
    41a2:	ff 75 20             	pushl  0x20(%ebp)
    41a5:	ff 75 18             	pushl  0x18(%ebp)
    41a8:	ff 75 14             	pushl  0x14(%ebp)
    41ab:	ff 75 10             	pushl  0x10(%ebp)
    41ae:	ff 75 0c             	pushl  0xc(%ebp)
    41b1:	50                   	push   %eax
    41b2:	e8 5d 00 00 00       	call   4214 <addClickable>
    41b7:	83 c4 20             	add    $0x20,%esp
	        break;
    41ba:	eb 56                	jmp    4212 <createClickable+0x93>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    41bc:	8b 45 08             	mov    0x8(%ebp),%eax
    41bf:	83 ec 08             	sub    $0x8,%esp
    41c2:	ff 75 20             	pushl  0x20(%ebp)
    41c5:	ff 75 18             	pushl  0x18(%ebp)
    41c8:	ff 75 14             	pushl  0x14(%ebp)
    41cb:	ff 75 10             	pushl  0x10(%ebp)
    41ce:	ff 75 0c             	pushl  0xc(%ebp)
    41d1:	50                   	push   %eax
    41d2:	e8 3d 00 00 00       	call   4214 <addClickable>
    41d7:	83 c4 20             	add    $0x20,%esp
	    	break;
    41da:	eb 36                	jmp    4212 <createClickable+0x93>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    41dc:	8b 45 08             	mov    0x8(%ebp),%eax
    41df:	83 c0 08             	add    $0x8,%eax
    41e2:	83 ec 08             	sub    $0x8,%esp
    41e5:	ff 75 20             	pushl  0x20(%ebp)
    41e8:	ff 75 18             	pushl  0x18(%ebp)
    41eb:	ff 75 14             	pushl  0x14(%ebp)
    41ee:	ff 75 10             	pushl  0x10(%ebp)
    41f1:	ff 75 0c             	pushl  0xc(%ebp)
    41f4:	50                   	push   %eax
    41f5:	e8 1a 00 00 00       	call   4214 <addClickable>
    41fa:	83 c4 20             	add    $0x20,%esp
	    	break;
    41fd:	eb 13                	jmp    4212 <createClickable+0x93>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    41ff:	83 ec 08             	sub    $0x8,%esp
    4202:	68 e0 b7 00 00       	push   $0xb7e0
    4207:	6a 00                	push   $0x0
    4209:	e8 55 08 00 00       	call   4a63 <printf>
    420e:	83 c4 10             	add    $0x10,%esp
	    	break;
    4211:	90                   	nop
	}
}
    4212:	c9                   	leave  
    4213:	c3                   	ret    

00004214 <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    4214:	55                   	push   %ebp
    4215:	89 e5                	mov    %esp,%ebp
    4217:	83 ec 18             	sub    $0x18,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    421a:	83 ec 0c             	sub    $0xc,%esp
    421d:	6a 18                	push   $0x18
    421f:	e8 10 0b 00 00       	call   4d34 <malloc>
    4224:	83 c4 10             	add    $0x10,%esp
    4227:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    422a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    422d:	8b 55 0c             	mov    0xc(%ebp),%edx
    4230:	89 10                	mov    %edx,(%eax)
    4232:	8b 55 10             	mov    0x10(%ebp),%edx
    4235:	89 50 04             	mov    %edx,0x4(%eax)
    4238:	8b 55 14             	mov    0x14(%ebp),%edx
    423b:	89 50 08             	mov    %edx,0x8(%eax)
    423e:	8b 55 18             	mov    0x18(%ebp),%edx
    4241:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    4244:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4247:	8b 55 1c             	mov    0x1c(%ebp),%edx
    424a:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    424d:	8b 45 08             	mov    0x8(%ebp),%eax
    4250:	8b 10                	mov    (%eax),%edx
    4252:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4255:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    4258:	8b 45 08             	mov    0x8(%ebp),%eax
    425b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    425e:	89 10                	mov    %edx,(%eax)
}
    4260:	c9                   	leave  
    4261:	c3                   	ret    

00004262 <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    4262:	55                   	push   %ebp
    4263:	89 e5                	mov    %esp,%ebp
    4265:	83 ec 18             	sub    $0x18,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    4268:	8b 45 08             	mov    0x8(%ebp),%eax
    426b:	8b 00                	mov    (%eax),%eax
    426d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4270:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4273:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    4276:	e9 ad 00 00 00       	jmp    4328 <deleteClickable+0xc6>
	{
		if (isIn(cur->area.start, region))
    427b:	ff 75 18             	pushl  0x18(%ebp)
    427e:	ff 75 14             	pushl  0x14(%ebp)
    4281:	ff 75 10             	pushl  0x10(%ebp)
    4284:	ff 75 0c             	pushl  0xc(%ebp)
    4287:	8b 45 f0             	mov    -0x10(%ebp),%eax
    428a:	ff 70 04             	pushl  0x4(%eax)
    428d:	ff 30                	pushl  (%eax)
    428f:	e8 5a fe ff ff       	call   40ee <isIn>
    4294:	83 c4 18             	add    $0x18,%esp
    4297:	85 c0                	test   %eax,%eax
    4299:	74 66                	je     4301 <deleteClickable+0x9f>
		{
			//如果当前指针指向头部
			if (cur == *head)
    429b:	8b 45 08             	mov    0x8(%ebp),%eax
    429e:	8b 00                	mov    (%eax),%eax
    42a0:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    42a3:	75 31                	jne    42d6 <deleteClickable+0x74>
			{
				//删除头节点
				temp = *head;
    42a5:	8b 45 08             	mov    0x8(%ebp),%eax
    42a8:	8b 00                	mov    (%eax),%eax
    42aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    42ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    42b0:	8b 50 14             	mov    0x14(%eax),%edx
    42b3:	8b 45 08             	mov    0x8(%ebp),%eax
    42b6:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    42b8:	8b 45 08             	mov    0x8(%ebp),%eax
    42bb:	8b 00                	mov    (%eax),%eax
    42bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    42c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    42c6:	83 ec 0c             	sub    $0xc,%esp
    42c9:	ff 75 ec             	pushl  -0x14(%ebp)
    42cc:	e8 22 09 00 00       	call   4bf3 <free>
    42d1:	83 c4 10             	add    $0x10,%esp
    42d4:	eb 52                	jmp    4328 <deleteClickable+0xc6>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    42d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    42d9:	8b 50 14             	mov    0x14(%eax),%edx
    42dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42df:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    42e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    42e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    42e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    42eb:	8b 40 14             	mov    0x14(%eax),%eax
    42ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    42f1:	83 ec 0c             	sub    $0xc,%esp
    42f4:	ff 75 ec             	pushl  -0x14(%ebp)
    42f7:	e8 f7 08 00 00       	call   4bf3 <free>
    42fc:	83 c4 10             	add    $0x10,%esp
    42ff:	eb 27                	jmp    4328 <deleteClickable+0xc6>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    4301:	8b 45 08             	mov    0x8(%ebp),%eax
    4304:	8b 00                	mov    (%eax),%eax
    4306:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    4309:	75 0b                	jne    4316 <deleteClickable+0xb4>
			{
				cur = cur->next;
    430b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    430e:	8b 40 14             	mov    0x14(%eax),%eax
    4311:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4314:	eb 12                	jmp    4328 <deleteClickable+0xc6>
			}
			else
			{
				cur = cur->next;
    4316:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4319:	8b 40 14             	mov    0x14(%eax),%eax
    431c:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    431f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4322:	8b 40 14             	mov    0x14(%eax),%eax
    4325:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    4328:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    432c:	0f 85 49 ff ff ff    	jne    427b <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    4332:	c9                   	leave  
    4333:	c3                   	ret    

00004334 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    4334:	55                   	push   %ebp
    4335:	89 e5                	mov    %esp,%ebp
    4337:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    433a:	8b 45 08             	mov    0x8(%ebp),%eax
    433d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    4340:	eb 58                	jmp    439a <executeHandler+0x66>
	{
		if (isIn(click, cur->area))
    4342:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4345:	ff 70 0c             	pushl  0xc(%eax)
    4348:	ff 70 08             	pushl  0x8(%eax)
    434b:	ff 70 04             	pushl  0x4(%eax)
    434e:	ff 30                	pushl  (%eax)
    4350:	ff 75 10             	pushl  0x10(%ebp)
    4353:	ff 75 0c             	pushl  0xc(%ebp)
    4356:	e8 93 fd ff ff       	call   40ee <isIn>
    435b:	83 c4 18             	add    $0x18,%esp
    435e:	85 c0                	test   %eax,%eax
    4360:	74 2f                	je     4391 <executeHandler+0x5d>
		{
			renaming = 0;
    4362:	c7 05 54 38 01 00 00 	movl   $0x0,0x13854
    4369:	00 00 00 
			isSearching = 0;
    436c:	c7 05 c0 2d 01 00 00 	movl   $0x0,0x12dc0
    4373:	00 00 00 
			cur->handler(click);
    4376:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4379:	8b 40 10             	mov    0x10(%eax),%eax
    437c:	83 ec 08             	sub    $0x8,%esp
    437f:	ff 75 10             	pushl  0x10(%ebp)
    4382:	ff 75 0c             	pushl  0xc(%ebp)
    4385:	ff d0                	call   *%eax
    4387:	83 c4 10             	add    $0x10,%esp
			return 1;
    438a:	b8 01 00 00 00       	mov    $0x1,%eax
    438f:	eb 4b                	jmp    43dc <executeHandler+0xa8>
		}
		cur = cur->next;
    4391:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4394:	8b 40 14             	mov    0x14(%eax),%eax
    4397:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    439a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    439e:	75 a2                	jne    4342 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    43a0:	c7 05 c0 2d 01 00 00 	movl   $0x0,0x12dc0
    43a7:	00 00 00 
	if (renaming == 1){
    43aa:	a1 54 38 01 00       	mov    0x13854,%eax
    43af:	83 f8 01             	cmp    $0x1,%eax
    43b2:	75 11                	jne    43c5 <executeHandler+0x91>
		renaming = 0;
    43b4:	c7 05 54 38 01 00 00 	movl   $0x0,0x13854
    43bb:	00 00 00 
		return 1;
    43be:	b8 01 00 00 00       	mov    $0x1,%eax
    43c3:	eb 17                	jmp    43dc <executeHandler+0xa8>
	}
	printf(0, "execute: none!\n");
    43c5:	83 ec 08             	sub    $0x8,%esp
    43c8:	68 0e b8 00 00       	push   $0xb80e
    43cd:	6a 00                	push   $0x0
    43cf:	e8 8f 06 00 00       	call   4a63 <printf>
    43d4:	83 c4 10             	add    $0x10,%esp
	return 0;
    43d7:	b8 00 00 00 00       	mov    $0x0,%eax
}
    43dc:	c9                   	leave  
    43dd:	c3                   	ret    

000043de <printClickable>:

void printClickable(Clickable *c)
{
    43de:	55                   	push   %ebp
    43df:	89 e5                	mov    %esp,%ebp
    43e1:	53                   	push   %ebx
    43e2:	83 ec 04             	sub    $0x4,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    43e5:	8b 45 08             	mov    0x8(%ebp),%eax
    43e8:	8b 58 0c             	mov    0xc(%eax),%ebx
    43eb:	8b 45 08             	mov    0x8(%ebp),%eax
    43ee:	8b 48 08             	mov    0x8(%eax),%ecx
    43f1:	8b 45 08             	mov    0x8(%ebp),%eax
    43f4:	8b 50 04             	mov    0x4(%eax),%edx
    43f7:	8b 45 08             	mov    0x8(%ebp),%eax
    43fa:	8b 00                	mov    (%eax),%eax
    43fc:	83 ec 08             	sub    $0x8,%esp
    43ff:	53                   	push   %ebx
    4400:	51                   	push   %ecx
    4401:	52                   	push   %edx
    4402:	50                   	push   %eax
    4403:	68 1e b8 00 00       	push   $0xb81e
    4408:	6a 00                	push   $0x0
    440a:	e8 54 06 00 00       	call   4a63 <printf>
    440f:	83 c4 20             	add    $0x20,%esp
}
    4412:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4415:	c9                   	leave  
    4416:	c3                   	ret    

00004417 <printClickableList>:

void printClickableList(Clickable *head)
{
    4417:	55                   	push   %ebp
    4418:	89 e5                	mov    %esp,%ebp
    441a:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    441d:	8b 45 08             	mov    0x8(%ebp),%eax
    4420:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    4423:	83 ec 08             	sub    $0x8,%esp
    4426:	68 30 b8 00 00       	push   $0xb830
    442b:	6a 00                	push   $0x0
    442d:	e8 31 06 00 00       	call   4a63 <printf>
    4432:	83 c4 10             	add    $0x10,%esp
	while(cur != 0)
    4435:	eb 17                	jmp    444e <printClickableList+0x37>
	{
		printClickable(cur);
    4437:	83 ec 0c             	sub    $0xc,%esp
    443a:	ff 75 f4             	pushl  -0xc(%ebp)
    443d:	e8 9c ff ff ff       	call   43de <printClickable>
    4442:	83 c4 10             	add    $0x10,%esp
		cur = cur->next;
    4445:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4448:	8b 40 14             	mov    0x14(%eax),%eax
    444b:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    444e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4452:	75 e3                	jne    4437 <printClickableList+0x20>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    4454:	83 ec 08             	sub    $0x8,%esp
    4457:	68 41 b8 00 00       	push   $0xb841
    445c:	6a 00                	push   $0x0
    445e:	e8 00 06 00 00       	call   4a63 <printf>
    4463:	83 c4 10             	add    $0x10,%esp
}
    4466:	c9                   	leave  
    4467:	c3                   	ret    

00004468 <testHanler>:

void testHanler(struct Point p)
{
    4468:	55                   	push   %ebp
    4469:	89 e5                	mov    %esp,%ebp
    446b:	83 ec 08             	sub    $0x8,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    446e:	8b 55 0c             	mov    0xc(%ebp),%edx
    4471:	8b 45 08             	mov    0x8(%ebp),%eax
    4474:	52                   	push   %edx
    4475:	50                   	push   %eax
    4476:	68 43 b8 00 00       	push   $0xb843
    447b:	6a 00                	push   $0x0
    447d:	e8 e1 05 00 00       	call   4a63 <printf>
    4482:	83 c4 10             	add    $0x10,%esp
}
    4485:	c9                   	leave  
    4486:	c3                   	ret    

00004487 <testClickable>:
void testClickable(struct Context c)
{
    4487:	55                   	push   %ebp
    4488:	89 e5                	mov    %esp,%ebp
    448a:	83 ec 78             	sub    $0x78,%esp
	ClickableManager cm = initClickManager(c);
    448d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4490:	ff 75 10             	pushl  0x10(%ebp)
    4493:	ff 75 0c             	pushl  0xc(%ebp)
    4496:	ff 75 08             	pushl  0x8(%ebp)
    4499:	50                   	push   %eax
    449a:	e8 92 fc ff ff       	call   4131 <initClickManager>
    449f:	83 c4 0c             	add    $0xc,%esp

	Rect r1 = initRect(5,5,20,20);
    44a2:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    44a5:	83 ec 04             	sub    $0x4,%esp
    44a8:	6a 14                	push   $0x14
    44aa:	6a 14                	push   $0x14
    44ac:	6a 05                	push   $0x5
    44ae:	6a 05                	push   $0x5
    44b0:	50                   	push   %eax
    44b1:	e8 e7 fb ff ff       	call   409d <initRect>
    44b6:	83 c4 14             	add    $0x14,%esp
	Rect r2 = initRect(20,20,20,20);
    44b9:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    44bc:	83 ec 04             	sub    $0x4,%esp
    44bf:	6a 14                	push   $0x14
    44c1:	6a 14                	push   $0x14
    44c3:	6a 14                	push   $0x14
    44c5:	6a 14                	push   $0x14
    44c7:	50                   	push   %eax
    44c8:	e8 d0 fb ff ff       	call   409d <initRect>
    44cd:	83 c4 14             	add    $0x14,%esp
	Rect r3 = initRect(50,50,15,15);
    44d0:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    44d3:	83 ec 04             	sub    $0x4,%esp
    44d6:	6a 0f                	push   $0xf
    44d8:	6a 0f                	push   $0xf
    44da:	6a 32                	push   $0x32
    44dc:	6a 32                	push   $0x32
    44de:	50                   	push   %eax
    44df:	e8 b9 fb ff ff       	call   409d <initRect>
    44e4:	83 c4 14             	add    $0x14,%esp
	Rect r4 = initRect(0,0,30,30);
    44e7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    44ea:	83 ec 04             	sub    $0x4,%esp
    44ed:	6a 1e                	push   $0x1e
    44ef:	6a 1e                	push   $0x1e
    44f1:	6a 00                	push   $0x0
    44f3:	6a 00                	push   $0x0
    44f5:	50                   	push   %eax
    44f6:	e8 a2 fb ff ff       	call   409d <initRect>
    44fb:	83 c4 14             	add    $0x14,%esp
	Point p1 = initPoint(23, 23);
    44fe:	8d 45 9c             	lea    -0x64(%ebp),%eax
    4501:	83 ec 04             	sub    $0x4,%esp
    4504:	6a 17                	push   $0x17
    4506:	6a 17                	push   $0x17
    4508:	50                   	push   %eax
    4509:	e8 68 fb ff ff       	call   4076 <initPoint>
    450e:	83 c4 0c             	add    $0xc,%esp
	Point p2 = initPoint(70, 70);
    4511:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4514:	83 ec 04             	sub    $0x4,%esp
    4517:	6a 46                	push   $0x46
    4519:	6a 46                	push   $0x46
    451b:	50                   	push   %eax
    451c:	e8 55 fb ff ff       	call   4076 <initPoint>
    4521:	83 c4 0c             	add    $0xc,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    4524:	83 ec 04             	sub    $0x4,%esp
    4527:	68 68 44 00 00       	push   $0x4468
    452c:	6a 02                	push   $0x2
    452e:	ff 75 e0             	pushl  -0x20(%ebp)
    4531:	ff 75 dc             	pushl  -0x24(%ebp)
    4534:	ff 75 d8             	pushl  -0x28(%ebp)
    4537:	ff 75 d4             	pushl  -0x2c(%ebp)
    453a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    453d:	50                   	push   %eax
    453e:	e8 3c fc ff ff       	call   417f <createClickable>
    4543:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    4546:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4549:	83 ec 04             	sub    $0x4,%esp
    454c:	50                   	push   %eax
    454d:	68 57 b8 00 00       	push   $0xb857
    4552:	6a 00                	push   $0x0
    4554:	e8 0a 05 00 00       	call   4a63 <printf>
    4559:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    455c:	83 ec 04             	sub    $0x4,%esp
    455f:	68 68 44 00 00       	push   $0x4468
    4564:	6a 02                	push   $0x2
    4566:	ff 75 d0             	pushl  -0x30(%ebp)
    4569:	ff 75 cc             	pushl  -0x34(%ebp)
    456c:	ff 75 c8             	pushl  -0x38(%ebp)
    456f:	ff 75 c4             	pushl  -0x3c(%ebp)
    4572:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4575:	50                   	push   %eax
    4576:	e8 04 fc ff ff       	call   417f <createClickable>
    457b:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    457e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4581:	83 ec 04             	sub    $0x4,%esp
    4584:	50                   	push   %eax
    4585:	68 57 b8 00 00       	push   $0xb857
    458a:	6a 00                	push   $0x0
    458c:	e8 d2 04 00 00       	call   4a63 <printf>
    4591:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    4594:	83 ec 04             	sub    $0x4,%esp
    4597:	68 68 44 00 00       	push   $0x4468
    459c:	6a 02                	push   $0x2
    459e:	ff 75 c0             	pushl  -0x40(%ebp)
    45a1:	ff 75 bc             	pushl  -0x44(%ebp)
    45a4:	ff 75 b8             	pushl  -0x48(%ebp)
    45a7:	ff 75 b4             	pushl  -0x4c(%ebp)
    45aa:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    45ad:	50                   	push   %eax
    45ae:	e8 cc fb ff ff       	call   417f <createClickable>
    45b3:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    45b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45b9:	83 ec 04             	sub    $0x4,%esp
    45bc:	50                   	push   %eax
    45bd:	68 57 b8 00 00       	push   $0xb857
    45c2:	6a 00                	push   $0x0
    45c4:	e8 9a 04 00 00       	call   4a63 <printf>
    45c9:	83 c4 10             	add    $0x10,%esp
	printClickableList(cm.left_click);
    45cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45cf:	83 ec 0c             	sub    $0xc,%esp
    45d2:	50                   	push   %eax
    45d3:	e8 3f fe ff ff       	call   4417 <printClickableList>
    45d8:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p1);
    45db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45de:	83 ec 04             	sub    $0x4,%esp
    45e1:	ff 75 a0             	pushl  -0x60(%ebp)
    45e4:	ff 75 9c             	pushl  -0x64(%ebp)
    45e7:	50                   	push   %eax
    45e8:	e8 47 fd ff ff       	call   4334 <executeHandler>
    45ed:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p2);
    45f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45f3:	83 ec 04             	sub    $0x4,%esp
    45f6:	ff 75 98             	pushl  -0x68(%ebp)
    45f9:	ff 75 94             	pushl  -0x6c(%ebp)
    45fc:	50                   	push   %eax
    45fd:	e8 32 fd ff ff       	call   4334 <executeHandler>
    4602:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, r4);
    4605:	83 ec 0c             	sub    $0xc,%esp
    4608:	ff 75 b0             	pushl  -0x50(%ebp)
    460b:	ff 75 ac             	pushl  -0x54(%ebp)
    460e:	ff 75 a8             	pushl  -0x58(%ebp)
    4611:	ff 75 a4             	pushl  -0x5c(%ebp)
    4614:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4617:	50                   	push   %eax
    4618:	e8 45 fc ff ff       	call   4262 <deleteClickable>
    461d:	83 c4 20             	add    $0x20,%esp
	printClickableList(cm.left_click);
    4620:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4623:	83 ec 0c             	sub    $0xc,%esp
    4626:	50                   	push   %eax
    4627:	e8 eb fd ff ff       	call   4417 <printClickableList>
    462c:	83 c4 10             	add    $0x10,%esp
}
    462f:	c9                   	leave  
    4630:	c3                   	ret    

00004631 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    4631:	55                   	push   %ebp
    4632:	89 e5                	mov    %esp,%ebp
    4634:	57                   	push   %edi
    4635:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    4636:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4639:	8b 55 10             	mov    0x10(%ebp),%edx
    463c:	8b 45 0c             	mov    0xc(%ebp),%eax
    463f:	89 cb                	mov    %ecx,%ebx
    4641:	89 df                	mov    %ebx,%edi
    4643:	89 d1                	mov    %edx,%ecx
    4645:	fc                   	cld    
    4646:	f3 aa                	rep stos %al,%es:(%edi)
    4648:	89 ca                	mov    %ecx,%edx
    464a:	89 fb                	mov    %edi,%ebx
    464c:	89 5d 08             	mov    %ebx,0x8(%ebp)
    464f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    4652:	5b                   	pop    %ebx
    4653:	5f                   	pop    %edi
    4654:	5d                   	pop    %ebp
    4655:	c3                   	ret    

00004656 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    4656:	55                   	push   %ebp
    4657:	89 e5                	mov    %esp,%ebp
    4659:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    465c:	8b 45 08             	mov    0x8(%ebp),%eax
    465f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    4662:	90                   	nop
    4663:	8b 45 08             	mov    0x8(%ebp),%eax
    4666:	8d 50 01             	lea    0x1(%eax),%edx
    4669:	89 55 08             	mov    %edx,0x8(%ebp)
    466c:	8b 55 0c             	mov    0xc(%ebp),%edx
    466f:	8d 4a 01             	lea    0x1(%edx),%ecx
    4672:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    4675:	0f b6 12             	movzbl (%edx),%edx
    4678:	88 10                	mov    %dl,(%eax)
    467a:	0f b6 00             	movzbl (%eax),%eax
    467d:	84 c0                	test   %al,%al
    467f:	75 e2                	jne    4663 <strcpy+0xd>
    ;
  return os;
    4681:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4684:	c9                   	leave  
    4685:	c3                   	ret    

00004686 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4686:	55                   	push   %ebp
    4687:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    4689:	eb 08                	jmp    4693 <strcmp+0xd>
    p++, q++;
    468b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    468f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    4693:	8b 45 08             	mov    0x8(%ebp),%eax
    4696:	0f b6 00             	movzbl (%eax),%eax
    4699:	84 c0                	test   %al,%al
    469b:	74 10                	je     46ad <strcmp+0x27>
    469d:	8b 45 08             	mov    0x8(%ebp),%eax
    46a0:	0f b6 10             	movzbl (%eax),%edx
    46a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    46a6:	0f b6 00             	movzbl (%eax),%eax
    46a9:	38 c2                	cmp    %al,%dl
    46ab:	74 de                	je     468b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    46ad:	8b 45 08             	mov    0x8(%ebp),%eax
    46b0:	0f b6 00             	movzbl (%eax),%eax
    46b3:	0f b6 d0             	movzbl %al,%edx
    46b6:	8b 45 0c             	mov    0xc(%ebp),%eax
    46b9:	0f b6 00             	movzbl (%eax),%eax
    46bc:	0f b6 c0             	movzbl %al,%eax
    46bf:	29 c2                	sub    %eax,%edx
    46c1:	89 d0                	mov    %edx,%eax
}
    46c3:	5d                   	pop    %ebp
    46c4:	c3                   	ret    

000046c5 <strlen>:

uint
strlen(char *s)
{
    46c5:	55                   	push   %ebp
    46c6:	89 e5                	mov    %esp,%ebp
    46c8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    46cb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    46d2:	eb 04                	jmp    46d8 <strlen+0x13>
    46d4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    46d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
    46db:	8b 45 08             	mov    0x8(%ebp),%eax
    46de:	01 d0                	add    %edx,%eax
    46e0:	0f b6 00             	movzbl (%eax),%eax
    46e3:	84 c0                	test   %al,%al
    46e5:	75 ed                	jne    46d4 <strlen+0xf>
    ;
  return n;
    46e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    46ea:	c9                   	leave  
    46eb:	c3                   	ret    

000046ec <memset>:

void*
memset(void *dst, int c, uint n)
{
    46ec:	55                   	push   %ebp
    46ed:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    46ef:	8b 45 10             	mov    0x10(%ebp),%eax
    46f2:	50                   	push   %eax
    46f3:	ff 75 0c             	pushl  0xc(%ebp)
    46f6:	ff 75 08             	pushl  0x8(%ebp)
    46f9:	e8 33 ff ff ff       	call   4631 <stosb>
    46fe:	83 c4 0c             	add    $0xc,%esp
  return dst;
    4701:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4704:	c9                   	leave  
    4705:	c3                   	ret    

00004706 <strchr>:

char*
strchr(const char *s, char c)
{
    4706:	55                   	push   %ebp
    4707:	89 e5                	mov    %esp,%ebp
    4709:	83 ec 04             	sub    $0x4,%esp
    470c:	8b 45 0c             	mov    0xc(%ebp),%eax
    470f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    4712:	eb 14                	jmp    4728 <strchr+0x22>
    if(*s == c)
    4714:	8b 45 08             	mov    0x8(%ebp),%eax
    4717:	0f b6 00             	movzbl (%eax),%eax
    471a:	3a 45 fc             	cmp    -0x4(%ebp),%al
    471d:	75 05                	jne    4724 <strchr+0x1e>
      return (char*)s;
    471f:	8b 45 08             	mov    0x8(%ebp),%eax
    4722:	eb 13                	jmp    4737 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    4724:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4728:	8b 45 08             	mov    0x8(%ebp),%eax
    472b:	0f b6 00             	movzbl (%eax),%eax
    472e:	84 c0                	test   %al,%al
    4730:	75 e2                	jne    4714 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    4732:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4737:	c9                   	leave  
    4738:	c3                   	ret    

00004739 <gets>:

char*
gets(char *buf, int max)
{
    4739:	55                   	push   %ebp
    473a:	89 e5                	mov    %esp,%ebp
    473c:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    473f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4746:	eb 44                	jmp    478c <gets+0x53>
    cc = read(0, &c, 1);
    4748:	83 ec 04             	sub    $0x4,%esp
    474b:	6a 01                	push   $0x1
    474d:	8d 45 ef             	lea    -0x11(%ebp),%eax
    4750:	50                   	push   %eax
    4751:	6a 00                	push   $0x0
    4753:	e8 46 01 00 00       	call   489e <read>
    4758:	83 c4 10             	add    $0x10,%esp
    475b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    475e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4762:	7f 02                	jg     4766 <gets+0x2d>
      break;
    4764:	eb 31                	jmp    4797 <gets+0x5e>
    buf[i++] = c;
    4766:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4769:	8d 50 01             	lea    0x1(%eax),%edx
    476c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    476f:	89 c2                	mov    %eax,%edx
    4771:	8b 45 08             	mov    0x8(%ebp),%eax
    4774:	01 c2                	add    %eax,%edx
    4776:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    477a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    477c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4780:	3c 0a                	cmp    $0xa,%al
    4782:	74 13                	je     4797 <gets+0x5e>
    4784:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4788:	3c 0d                	cmp    $0xd,%al
    478a:	74 0b                	je     4797 <gets+0x5e>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    478c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    478f:	83 c0 01             	add    $0x1,%eax
    4792:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4795:	7c b1                	jl     4748 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    4797:	8b 55 f4             	mov    -0xc(%ebp),%edx
    479a:	8b 45 08             	mov    0x8(%ebp),%eax
    479d:	01 d0                	add    %edx,%eax
    479f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    47a2:	8b 45 08             	mov    0x8(%ebp),%eax
}
    47a5:	c9                   	leave  
    47a6:	c3                   	ret    

000047a7 <stat>:

int
stat(char *n, struct stat *st)
{
    47a7:	55                   	push   %ebp
    47a8:	89 e5                	mov    %esp,%ebp
    47aa:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    47ad:	83 ec 08             	sub    $0x8,%esp
    47b0:	6a 00                	push   $0x0
    47b2:	ff 75 08             	pushl  0x8(%ebp)
    47b5:	e8 0c 01 00 00       	call   48c6 <open>
    47ba:	83 c4 10             	add    $0x10,%esp
    47bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    47c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    47c4:	79 07                	jns    47cd <stat+0x26>
    return -1;
    47c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    47cb:	eb 25                	jmp    47f2 <stat+0x4b>
  r = fstat(fd, st);
    47cd:	83 ec 08             	sub    $0x8,%esp
    47d0:	ff 75 0c             	pushl  0xc(%ebp)
    47d3:	ff 75 f4             	pushl  -0xc(%ebp)
    47d6:	e8 03 01 00 00       	call   48de <fstat>
    47db:	83 c4 10             	add    $0x10,%esp
    47de:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    47e1:	83 ec 0c             	sub    $0xc,%esp
    47e4:	ff 75 f4             	pushl  -0xc(%ebp)
    47e7:	e8 c2 00 00 00       	call   48ae <close>
    47ec:	83 c4 10             	add    $0x10,%esp
  return r;
    47ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    47f2:	c9                   	leave  
    47f3:	c3                   	ret    

000047f4 <atoi>:

int
atoi(const char *s)
{
    47f4:	55                   	push   %ebp
    47f5:	89 e5                	mov    %esp,%ebp
    47f7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    47fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    4801:	eb 25                	jmp    4828 <atoi+0x34>
    n = n*10 + *s++ - '0';
    4803:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4806:	89 d0                	mov    %edx,%eax
    4808:	c1 e0 02             	shl    $0x2,%eax
    480b:	01 d0                	add    %edx,%eax
    480d:	01 c0                	add    %eax,%eax
    480f:	89 c1                	mov    %eax,%ecx
    4811:	8b 45 08             	mov    0x8(%ebp),%eax
    4814:	8d 50 01             	lea    0x1(%eax),%edx
    4817:	89 55 08             	mov    %edx,0x8(%ebp)
    481a:	0f b6 00             	movzbl (%eax),%eax
    481d:	0f be c0             	movsbl %al,%eax
    4820:	01 c8                	add    %ecx,%eax
    4822:	83 e8 30             	sub    $0x30,%eax
    4825:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4828:	8b 45 08             	mov    0x8(%ebp),%eax
    482b:	0f b6 00             	movzbl (%eax),%eax
    482e:	3c 2f                	cmp    $0x2f,%al
    4830:	7e 0a                	jle    483c <atoi+0x48>
    4832:	8b 45 08             	mov    0x8(%ebp),%eax
    4835:	0f b6 00             	movzbl (%eax),%eax
    4838:	3c 39                	cmp    $0x39,%al
    483a:	7e c7                	jle    4803 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    483c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    483f:	c9                   	leave  
    4840:	c3                   	ret    

00004841 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4841:	55                   	push   %ebp
    4842:	89 e5                	mov    %esp,%ebp
    4844:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    4847:	8b 45 08             	mov    0x8(%ebp),%eax
    484a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    484d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4850:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    4853:	eb 17                	jmp    486c <memmove+0x2b>
    *dst++ = *src++;
    4855:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4858:	8d 50 01             	lea    0x1(%eax),%edx
    485b:	89 55 fc             	mov    %edx,-0x4(%ebp)
    485e:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4861:	8d 4a 01             	lea    0x1(%edx),%ecx
    4864:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    4867:	0f b6 12             	movzbl (%edx),%edx
    486a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    486c:	8b 45 10             	mov    0x10(%ebp),%eax
    486f:	8d 50 ff             	lea    -0x1(%eax),%edx
    4872:	89 55 10             	mov    %edx,0x10(%ebp)
    4875:	85 c0                	test   %eax,%eax
    4877:	7f dc                	jg     4855 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    4879:	8b 45 08             	mov    0x8(%ebp),%eax
}
    487c:	c9                   	leave  
    487d:	c3                   	ret    

0000487e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    487e:	b8 01 00 00 00       	mov    $0x1,%eax
    4883:	cd 40                	int    $0x40
    4885:	c3                   	ret    

00004886 <exit>:
SYSCALL(exit)
    4886:	b8 02 00 00 00       	mov    $0x2,%eax
    488b:	cd 40                	int    $0x40
    488d:	c3                   	ret    

0000488e <wait>:
SYSCALL(wait)
    488e:	b8 03 00 00 00       	mov    $0x3,%eax
    4893:	cd 40                	int    $0x40
    4895:	c3                   	ret    

00004896 <pipe>:
SYSCALL(pipe)
    4896:	b8 04 00 00 00       	mov    $0x4,%eax
    489b:	cd 40                	int    $0x40
    489d:	c3                   	ret    

0000489e <read>:
SYSCALL(read)
    489e:	b8 05 00 00 00       	mov    $0x5,%eax
    48a3:	cd 40                	int    $0x40
    48a5:	c3                   	ret    

000048a6 <write>:
SYSCALL(write)
    48a6:	b8 10 00 00 00       	mov    $0x10,%eax
    48ab:	cd 40                	int    $0x40
    48ad:	c3                   	ret    

000048ae <close>:
SYSCALL(close)
    48ae:	b8 15 00 00 00       	mov    $0x15,%eax
    48b3:	cd 40                	int    $0x40
    48b5:	c3                   	ret    

000048b6 <kill>:
SYSCALL(kill)
    48b6:	b8 06 00 00 00       	mov    $0x6,%eax
    48bb:	cd 40                	int    $0x40
    48bd:	c3                   	ret    

000048be <exec>:
SYSCALL(exec)
    48be:	b8 07 00 00 00       	mov    $0x7,%eax
    48c3:	cd 40                	int    $0x40
    48c5:	c3                   	ret    

000048c6 <open>:
SYSCALL(open)
    48c6:	b8 0f 00 00 00       	mov    $0xf,%eax
    48cb:	cd 40                	int    $0x40
    48cd:	c3                   	ret    

000048ce <mknod>:
SYSCALL(mknod)
    48ce:	b8 11 00 00 00       	mov    $0x11,%eax
    48d3:	cd 40                	int    $0x40
    48d5:	c3                   	ret    

000048d6 <unlink>:
SYSCALL(unlink)
    48d6:	b8 12 00 00 00       	mov    $0x12,%eax
    48db:	cd 40                	int    $0x40
    48dd:	c3                   	ret    

000048de <fstat>:
SYSCALL(fstat)
    48de:	b8 08 00 00 00       	mov    $0x8,%eax
    48e3:	cd 40                	int    $0x40
    48e5:	c3                   	ret    

000048e6 <link>:
SYSCALL(link)
    48e6:	b8 13 00 00 00       	mov    $0x13,%eax
    48eb:	cd 40                	int    $0x40
    48ed:	c3                   	ret    

000048ee <mkdir>:
SYSCALL(mkdir)
    48ee:	b8 14 00 00 00       	mov    $0x14,%eax
    48f3:	cd 40                	int    $0x40
    48f5:	c3                   	ret    

000048f6 <chdir>:
SYSCALL(chdir)
    48f6:	b8 09 00 00 00       	mov    $0x9,%eax
    48fb:	cd 40                	int    $0x40
    48fd:	c3                   	ret    

000048fe <dup>:
SYSCALL(dup)
    48fe:	b8 0a 00 00 00       	mov    $0xa,%eax
    4903:	cd 40                	int    $0x40
    4905:	c3                   	ret    

00004906 <getpid>:
SYSCALL(getpid)
    4906:	b8 0b 00 00 00       	mov    $0xb,%eax
    490b:	cd 40                	int    $0x40
    490d:	c3                   	ret    

0000490e <sbrk>:
SYSCALL(sbrk)
    490e:	b8 0c 00 00 00       	mov    $0xc,%eax
    4913:	cd 40                	int    $0x40
    4915:	c3                   	ret    

00004916 <sleep>:
SYSCALL(sleep)
    4916:	b8 0d 00 00 00       	mov    $0xd,%eax
    491b:	cd 40                	int    $0x40
    491d:	c3                   	ret    

0000491e <uptime>:
SYSCALL(uptime)
    491e:	b8 0e 00 00 00       	mov    $0xe,%eax
    4923:	cd 40                	int    $0x40
    4925:	c3                   	ret    

00004926 <getMsg>:
SYSCALL(getMsg)
    4926:	b8 16 00 00 00       	mov    $0x16,%eax
    492b:	cd 40                	int    $0x40
    492d:	c3                   	ret    

0000492e <createWindow>:
SYSCALL(createWindow)
    492e:	b8 17 00 00 00       	mov    $0x17,%eax
    4933:	cd 40                	int    $0x40
    4935:	c3                   	ret    

00004936 <destroyWindow>:
SYSCALL(destroyWindow)
    4936:	b8 18 00 00 00       	mov    $0x18,%eax
    493b:	cd 40                	int    $0x40
    493d:	c3                   	ret    

0000493e <updateWindow>:
SYSCALL(updateWindow)
    493e:	b8 19 00 00 00       	mov    $0x19,%eax
    4943:	cd 40                	int    $0x40
    4945:	c3                   	ret    

00004946 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    4946:	b8 1a 00 00 00       	mov    $0x1a,%eax
    494b:	cd 40                	int    $0x40
    494d:	c3                   	ret    

0000494e <kwrite>:
SYSCALL(kwrite)
    494e:	b8 1c 00 00 00       	mov    $0x1c,%eax
    4953:	cd 40                	int    $0x40
    4955:	c3                   	ret    

00004956 <setSampleRate>:
SYSCALL(setSampleRate)
    4956:	b8 1b 00 00 00       	mov    $0x1b,%eax
    495b:	cd 40                	int    $0x40
    495d:	c3                   	ret    

0000495e <pause>:
SYSCALL(pause)
    495e:	b8 1d 00 00 00       	mov    $0x1d,%eax
    4963:	cd 40                	int    $0x40
    4965:	c3                   	ret    

00004966 <wavdecode>:
SYSCALL(wavdecode)
    4966:	b8 1e 00 00 00       	mov    $0x1e,%eax
    496b:	cd 40                	int    $0x40
    496d:	c3                   	ret    

0000496e <beginDecode>:
SYSCALL(beginDecode)
    496e:	b8 1f 00 00 00       	mov    $0x1f,%eax
    4973:	cd 40                	int    $0x40
    4975:	c3                   	ret    

00004976 <waitForDecode>:
SYSCALL(waitForDecode)
    4976:	b8 20 00 00 00       	mov    $0x20,%eax
    497b:	cd 40                	int    $0x40
    497d:	c3                   	ret    

0000497e <endDecode>:
SYSCALL(endDecode)
    497e:	b8 21 00 00 00       	mov    $0x21,%eax
    4983:	cd 40                	int    $0x40
    4985:	c3                   	ret    

00004986 <getCoreBuf>:
    4986:	b8 22 00 00 00       	mov    $0x22,%eax
    498b:	cd 40                	int    $0x40
    498d:	c3                   	ret    

0000498e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    498e:	55                   	push   %ebp
    498f:	89 e5                	mov    %esp,%ebp
    4991:	83 ec 18             	sub    $0x18,%esp
    4994:	8b 45 0c             	mov    0xc(%ebp),%eax
    4997:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    499a:	83 ec 04             	sub    $0x4,%esp
    499d:	6a 01                	push   $0x1
    499f:	8d 45 f4             	lea    -0xc(%ebp),%eax
    49a2:	50                   	push   %eax
    49a3:	ff 75 08             	pushl  0x8(%ebp)
    49a6:	e8 fb fe ff ff       	call   48a6 <write>
    49ab:	83 c4 10             	add    $0x10,%esp
}
    49ae:	c9                   	leave  
    49af:	c3                   	ret    

000049b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    49b0:	55                   	push   %ebp
    49b1:	89 e5                	mov    %esp,%ebp
    49b3:	53                   	push   %ebx
    49b4:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    49b7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    49be:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    49c2:	74 17                	je     49db <printint+0x2b>
    49c4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    49c8:	79 11                	jns    49db <printint+0x2b>
    neg = 1;
    49ca:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    49d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    49d4:	f7 d8                	neg    %eax
    49d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    49d9:	eb 06                	jmp    49e1 <printint+0x31>
  } else {
    x = xx;
    49db:	8b 45 0c             	mov    0xc(%ebp),%eax
    49de:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    49e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    49e8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    49eb:	8d 41 01             	lea    0x1(%ecx),%eax
    49ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
    49f1:	8b 5d 10             	mov    0x10(%ebp),%ebx
    49f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    49f7:	ba 00 00 00 00       	mov    $0x0,%edx
    49fc:	f7 f3                	div    %ebx
    49fe:	89 d0                	mov    %edx,%eax
    4a00:	0f b6 80 9c f9 00 00 	movzbl 0xf99c(%eax),%eax
    4a07:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    4a0b:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4a0e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4a11:	ba 00 00 00 00       	mov    $0x0,%edx
    4a16:	f7 f3                	div    %ebx
    4a18:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4a1b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4a1f:	75 c7                	jne    49e8 <printint+0x38>
  if(neg)
    4a21:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4a25:	74 0e                	je     4a35 <printint+0x85>
    buf[i++] = '-';
    4a27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a2a:	8d 50 01             	lea    0x1(%eax),%edx
    4a2d:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4a30:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    4a35:	eb 1d                	jmp    4a54 <printint+0xa4>
    putc(fd, buf[i]);
    4a37:	8d 55 dc             	lea    -0x24(%ebp),%edx
    4a3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a3d:	01 d0                	add    %edx,%eax
    4a3f:	0f b6 00             	movzbl (%eax),%eax
    4a42:	0f be c0             	movsbl %al,%eax
    4a45:	83 ec 08             	sub    $0x8,%esp
    4a48:	50                   	push   %eax
    4a49:	ff 75 08             	pushl  0x8(%ebp)
    4a4c:	e8 3d ff ff ff       	call   498e <putc>
    4a51:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    4a54:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    4a58:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4a5c:	79 d9                	jns    4a37 <printint+0x87>
    putc(fd, buf[i]);
}
    4a5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4a61:	c9                   	leave  
    4a62:	c3                   	ret    

00004a63 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4a63:	55                   	push   %ebp
    4a64:	89 e5                	mov    %esp,%ebp
    4a66:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    4a69:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    4a70:	8d 45 0c             	lea    0xc(%ebp),%eax
    4a73:	83 c0 04             	add    $0x4,%eax
    4a76:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    4a79:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4a80:	e9 59 01 00 00       	jmp    4bde <printf+0x17b>
    c = fmt[i] & 0xff;
    4a85:	8b 55 0c             	mov    0xc(%ebp),%edx
    4a88:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a8b:	01 d0                	add    %edx,%eax
    4a8d:	0f b6 00             	movzbl (%eax),%eax
    4a90:	0f be c0             	movsbl %al,%eax
    4a93:	25 ff 00 00 00       	and    $0xff,%eax
    4a98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    4a9b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4a9f:	75 2c                	jne    4acd <printf+0x6a>
      if(c == '%'){
    4aa1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4aa5:	75 0c                	jne    4ab3 <printf+0x50>
        state = '%';
    4aa7:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    4aae:	e9 27 01 00 00       	jmp    4bda <printf+0x177>
      } else {
        putc(fd, c);
    4ab3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ab6:	0f be c0             	movsbl %al,%eax
    4ab9:	83 ec 08             	sub    $0x8,%esp
    4abc:	50                   	push   %eax
    4abd:	ff 75 08             	pushl  0x8(%ebp)
    4ac0:	e8 c9 fe ff ff       	call   498e <putc>
    4ac5:	83 c4 10             	add    $0x10,%esp
    4ac8:	e9 0d 01 00 00       	jmp    4bda <printf+0x177>
      }
    } else if(state == '%'){
    4acd:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    4ad1:	0f 85 03 01 00 00    	jne    4bda <printf+0x177>
      if(c == 'd'){
    4ad7:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    4adb:	75 1e                	jne    4afb <printf+0x98>
        printint(fd, *ap, 10, 1);
    4add:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4ae0:	8b 00                	mov    (%eax),%eax
    4ae2:	6a 01                	push   $0x1
    4ae4:	6a 0a                	push   $0xa
    4ae6:	50                   	push   %eax
    4ae7:	ff 75 08             	pushl  0x8(%ebp)
    4aea:	e8 c1 fe ff ff       	call   49b0 <printint>
    4aef:	83 c4 10             	add    $0x10,%esp
        ap++;
    4af2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4af6:	e9 d8 00 00 00       	jmp    4bd3 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    4afb:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    4aff:	74 06                	je     4b07 <printf+0xa4>
    4b01:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    4b05:	75 1e                	jne    4b25 <printf+0xc2>
        printint(fd, *ap, 16, 0);
    4b07:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4b0a:	8b 00                	mov    (%eax),%eax
    4b0c:	6a 00                	push   $0x0
    4b0e:	6a 10                	push   $0x10
    4b10:	50                   	push   %eax
    4b11:	ff 75 08             	pushl  0x8(%ebp)
    4b14:	e8 97 fe ff ff       	call   49b0 <printint>
    4b19:	83 c4 10             	add    $0x10,%esp
        ap++;
    4b1c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4b20:	e9 ae 00 00 00       	jmp    4bd3 <printf+0x170>
      } else if(c == 's'){
    4b25:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    4b29:	75 43                	jne    4b6e <printf+0x10b>
        s = (char*)*ap;
    4b2b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4b2e:	8b 00                	mov    (%eax),%eax
    4b30:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    4b33:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    4b37:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4b3b:	75 07                	jne    4b44 <printf+0xe1>
          s = "(null)";
    4b3d:	c7 45 f4 67 b8 00 00 	movl   $0xb867,-0xc(%ebp)
        while(*s != 0){
    4b44:	eb 1c                	jmp    4b62 <printf+0xff>
          putc(fd, *s);
    4b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b49:	0f b6 00             	movzbl (%eax),%eax
    4b4c:	0f be c0             	movsbl %al,%eax
    4b4f:	83 ec 08             	sub    $0x8,%esp
    4b52:	50                   	push   %eax
    4b53:	ff 75 08             	pushl  0x8(%ebp)
    4b56:	e8 33 fe ff ff       	call   498e <putc>
    4b5b:	83 c4 10             	add    $0x10,%esp
          s++;
    4b5e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4b62:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b65:	0f b6 00             	movzbl (%eax),%eax
    4b68:	84 c0                	test   %al,%al
    4b6a:	75 da                	jne    4b46 <printf+0xe3>
    4b6c:	eb 65                	jmp    4bd3 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    4b6e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    4b72:	75 1d                	jne    4b91 <printf+0x12e>
        putc(fd, *ap);
    4b74:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4b77:	8b 00                	mov    (%eax),%eax
    4b79:	0f be c0             	movsbl %al,%eax
    4b7c:	83 ec 08             	sub    $0x8,%esp
    4b7f:	50                   	push   %eax
    4b80:	ff 75 08             	pushl  0x8(%ebp)
    4b83:	e8 06 fe ff ff       	call   498e <putc>
    4b88:	83 c4 10             	add    $0x10,%esp
        ap++;
    4b8b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4b8f:	eb 42                	jmp    4bd3 <printf+0x170>
      } else if(c == '%'){
    4b91:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4b95:	75 17                	jne    4bae <printf+0x14b>
        putc(fd, c);
    4b97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b9a:	0f be c0             	movsbl %al,%eax
    4b9d:	83 ec 08             	sub    $0x8,%esp
    4ba0:	50                   	push   %eax
    4ba1:	ff 75 08             	pushl  0x8(%ebp)
    4ba4:	e8 e5 fd ff ff       	call   498e <putc>
    4ba9:	83 c4 10             	add    $0x10,%esp
    4bac:	eb 25                	jmp    4bd3 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4bae:	83 ec 08             	sub    $0x8,%esp
    4bb1:	6a 25                	push   $0x25
    4bb3:	ff 75 08             	pushl  0x8(%ebp)
    4bb6:	e8 d3 fd ff ff       	call   498e <putc>
    4bbb:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    4bbe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bc1:	0f be c0             	movsbl %al,%eax
    4bc4:	83 ec 08             	sub    $0x8,%esp
    4bc7:	50                   	push   %eax
    4bc8:	ff 75 08             	pushl  0x8(%ebp)
    4bcb:	e8 be fd ff ff       	call   498e <putc>
    4bd0:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    4bd3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4bda:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4bde:	8b 55 0c             	mov    0xc(%ebp),%edx
    4be1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4be4:	01 d0                	add    %edx,%eax
    4be6:	0f b6 00             	movzbl (%eax),%eax
    4be9:	84 c0                	test   %al,%al
    4beb:	0f 85 94 fe ff ff    	jne    4a85 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4bf1:	c9                   	leave  
    4bf2:	c3                   	ret    

00004bf3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4bf3:	55                   	push   %ebp
    4bf4:	89 e5                	mov    %esp,%ebp
    4bf6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4bf9:	8b 45 08             	mov    0x8(%ebp),%eax
    4bfc:	83 e8 08             	sub    $0x8,%eax
    4bff:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4c02:	a1 5c ff 00 00       	mov    0xff5c,%eax
    4c07:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4c0a:	eb 24                	jmp    4c30 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4c0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c0f:	8b 00                	mov    (%eax),%eax
    4c11:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4c14:	77 12                	ja     4c28 <free+0x35>
    4c16:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4c19:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4c1c:	77 24                	ja     4c42 <free+0x4f>
    4c1e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c21:	8b 00                	mov    (%eax),%eax
    4c23:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4c26:	77 1a                	ja     4c42 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4c28:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c2b:	8b 00                	mov    (%eax),%eax
    4c2d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4c30:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4c33:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4c36:	76 d4                	jbe    4c0c <free+0x19>
    4c38:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c3b:	8b 00                	mov    (%eax),%eax
    4c3d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4c40:	76 ca                	jbe    4c0c <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    4c42:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4c45:	8b 40 04             	mov    0x4(%eax),%eax
    4c48:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4c4f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4c52:	01 c2                	add    %eax,%edx
    4c54:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c57:	8b 00                	mov    (%eax),%eax
    4c59:	39 c2                	cmp    %eax,%edx
    4c5b:	75 24                	jne    4c81 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    4c5d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4c60:	8b 50 04             	mov    0x4(%eax),%edx
    4c63:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c66:	8b 00                	mov    (%eax),%eax
    4c68:	8b 40 04             	mov    0x4(%eax),%eax
    4c6b:	01 c2                	add    %eax,%edx
    4c6d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4c70:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4c73:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c76:	8b 00                	mov    (%eax),%eax
    4c78:	8b 10                	mov    (%eax),%edx
    4c7a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4c7d:	89 10                	mov    %edx,(%eax)
    4c7f:	eb 0a                	jmp    4c8b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    4c81:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c84:	8b 10                	mov    (%eax),%edx
    4c86:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4c89:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    4c8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c8e:	8b 40 04             	mov    0x4(%eax),%eax
    4c91:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4c98:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4c9b:	01 d0                	add    %edx,%eax
    4c9d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4ca0:	75 20                	jne    4cc2 <free+0xcf>
    p->s.size += bp->s.size;
    4ca2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4ca5:	8b 50 04             	mov    0x4(%eax),%edx
    4ca8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4cab:	8b 40 04             	mov    0x4(%eax),%eax
    4cae:	01 c2                	add    %eax,%edx
    4cb0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4cb3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4cb6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4cb9:	8b 10                	mov    (%eax),%edx
    4cbb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4cbe:	89 10                	mov    %edx,(%eax)
    4cc0:	eb 08                	jmp    4cca <free+0xd7>
  } else
    p->s.ptr = bp;
    4cc2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4cc5:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4cc8:	89 10                	mov    %edx,(%eax)
  freep = p;
    4cca:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4ccd:	a3 5c ff 00 00       	mov    %eax,0xff5c
}
    4cd2:	c9                   	leave  
    4cd3:	c3                   	ret    

00004cd4 <morecore>:

static Header*
morecore(uint nu)
{
    4cd4:	55                   	push   %ebp
    4cd5:	89 e5                	mov    %esp,%ebp
    4cd7:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4cda:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4ce1:	77 07                	ja     4cea <morecore+0x16>
    nu = 4096;
    4ce3:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4cea:	8b 45 08             	mov    0x8(%ebp),%eax
    4ced:	c1 e0 03             	shl    $0x3,%eax
    4cf0:	83 ec 0c             	sub    $0xc,%esp
    4cf3:	50                   	push   %eax
    4cf4:	e8 15 fc ff ff       	call   490e <sbrk>
    4cf9:	83 c4 10             	add    $0x10,%esp
    4cfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4cff:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4d03:	75 07                	jne    4d0c <morecore+0x38>
    return 0;
    4d05:	b8 00 00 00 00       	mov    $0x0,%eax
    4d0a:	eb 26                	jmp    4d32 <morecore+0x5e>
  hp = (Header*)p;
    4d0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    4d12:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d15:	8b 55 08             	mov    0x8(%ebp),%edx
    4d18:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4d1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d1e:	83 c0 08             	add    $0x8,%eax
    4d21:	83 ec 0c             	sub    $0xc,%esp
    4d24:	50                   	push   %eax
    4d25:	e8 c9 fe ff ff       	call   4bf3 <free>
    4d2a:	83 c4 10             	add    $0x10,%esp
  return freep;
    4d2d:	a1 5c ff 00 00       	mov    0xff5c,%eax
}
    4d32:	c9                   	leave  
    4d33:	c3                   	ret    

00004d34 <malloc>:

void*
malloc(uint nbytes)
{
    4d34:	55                   	push   %ebp
    4d35:	89 e5                	mov    %esp,%ebp
    4d37:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4d3a:	8b 45 08             	mov    0x8(%ebp),%eax
    4d3d:	83 c0 07             	add    $0x7,%eax
    4d40:	c1 e8 03             	shr    $0x3,%eax
    4d43:	83 c0 01             	add    $0x1,%eax
    4d46:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    4d49:	a1 5c ff 00 00       	mov    0xff5c,%eax
    4d4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4d51:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4d55:	75 23                	jne    4d7a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    4d57:	c7 45 f0 54 ff 00 00 	movl   $0xff54,-0x10(%ebp)
    4d5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d61:	a3 5c ff 00 00       	mov    %eax,0xff5c
    4d66:	a1 5c ff 00 00       	mov    0xff5c,%eax
    4d6b:	a3 54 ff 00 00       	mov    %eax,0xff54
    base.s.size = 0;
    4d70:	c7 05 58 ff 00 00 00 	movl   $0x0,0xff58
    4d77:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4d7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d7d:	8b 00                	mov    (%eax),%eax
    4d7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    4d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d85:	8b 40 04             	mov    0x4(%eax),%eax
    4d88:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4d8b:	72 4d                	jb     4dda <malloc+0xa6>
      if(p->s.size == nunits)
    4d8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d90:	8b 40 04             	mov    0x4(%eax),%eax
    4d93:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4d96:	75 0c                	jne    4da4 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    4d98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d9b:	8b 10                	mov    (%eax),%edx
    4d9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4da0:	89 10                	mov    %edx,(%eax)
    4da2:	eb 26                	jmp    4dca <malloc+0x96>
      else {
        p->s.size -= nunits;
    4da4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4da7:	8b 40 04             	mov    0x4(%eax),%eax
    4daa:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4dad:	89 c2                	mov    %eax,%edx
    4daf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4db2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    4db5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4db8:	8b 40 04             	mov    0x4(%eax),%eax
    4dbb:	c1 e0 03             	shl    $0x3,%eax
    4dbe:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    4dc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4dc4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4dc7:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    4dca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4dcd:	a3 5c ff 00 00       	mov    %eax,0xff5c
      return (void*)(p + 1);
    4dd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4dd5:	83 c0 08             	add    $0x8,%eax
    4dd8:	eb 3b                	jmp    4e15 <malloc+0xe1>
    }
    if(p == freep)
    4dda:	a1 5c ff 00 00       	mov    0xff5c,%eax
    4ddf:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4de2:	75 1e                	jne    4e02 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    4de4:	83 ec 0c             	sub    $0xc,%esp
    4de7:	ff 75 ec             	pushl  -0x14(%ebp)
    4dea:	e8 e5 fe ff ff       	call   4cd4 <morecore>
    4def:	83 c4 10             	add    $0x10,%esp
    4df2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4df5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4df9:	75 07                	jne    4e02 <malloc+0xce>
        return 0;
    4dfb:	b8 00 00 00 00       	mov    $0x0,%eax
    4e00:	eb 13                	jmp    4e15 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4e02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e05:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4e08:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e0b:	8b 00                	mov    (%eax),%eax
    4e0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4e10:	e9 6d ff ff ff       	jmp    4d82 <malloc+0x4e>
}
    4e15:	c9                   	leave  
    4e16:	c3                   	ret    

00004e17 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    4e17:	55                   	push   %ebp
    4e18:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    4e1a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4e1e:	79 07                	jns    4e27 <abs+0x10>
		return x * -1;
    4e20:	8b 45 08             	mov    0x8(%ebp),%eax
    4e23:	f7 d8                	neg    %eax
    4e25:	eb 03                	jmp    4e2a <abs+0x13>
	else
		return x;
    4e27:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4e2a:	5d                   	pop    %ebp
    4e2b:	c3                   	ret    

00004e2c <sin>:
double sin(double x)  
{  
    4e2c:	55                   	push   %ebp
    4e2d:	89 e5                	mov    %esp,%ebp
    4e2f:	83 ec 40             	sub    $0x40,%esp
    4e32:	8b 45 08             	mov    0x8(%ebp),%eax
    4e35:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4e38:	8b 45 0c             	mov    0xc(%ebp),%eax
    4e3b:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    4e3e:	dd 45 c8             	fldl   -0x38(%ebp)
    4e41:	dd 5d f8             	fstpl  -0x8(%ebp)
    4e44:	d9 e8                	fld1   
    4e46:	dd 5d f0             	fstpl  -0x10(%ebp)
    4e49:	dd 45 c8             	fldl   -0x38(%ebp)
    4e4c:	dd 5d e8             	fstpl  -0x18(%ebp)
    4e4f:	dd 45 c8             	fldl   -0x38(%ebp)
    4e52:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    4e55:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    4e5c:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    4e63:	eb 50                	jmp    4eb5 <sin+0x89>
	{  
		n = n+1;  
    4e65:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    4e69:	db 45 dc             	fildl  -0x24(%ebp)
    4e6c:	dc 4d f0             	fmull  -0x10(%ebp)
    4e6f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4e72:	83 c0 01             	add    $0x1,%eax
    4e75:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    4e78:	db 45 c4             	fildl  -0x3c(%ebp)
    4e7b:	de c9                	fmulp  %st,%st(1)
    4e7d:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    4e80:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    4e84:	dd 45 c8             	fldl   -0x38(%ebp)
    4e87:	dc 4d c8             	fmull  -0x38(%ebp)
    4e8a:	dd 45 e8             	fldl   -0x18(%ebp)
    4e8d:	de c9                	fmulp  %st,%st(1)
    4e8f:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    4e92:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    4e95:	dd 45 e8             	fldl   -0x18(%ebp)
    4e98:	dc 75 f0             	fdivl  -0x10(%ebp)
    4e9b:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    4e9e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    4ea2:	7e 08                	jle    4eac <sin+0x80>
    4ea4:	dd 45 f8             	fldl   -0x8(%ebp)
    4ea7:	dc 45 e0             	faddl  -0x20(%ebp)
    4eaa:	eb 06                	jmp    4eb2 <sin+0x86>
    4eac:	dd 45 f8             	fldl   -0x8(%ebp)
    4eaf:	dc 65 e0             	fsubl  -0x20(%ebp)
    4eb2:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    4eb5:	dd 45 e0             	fldl   -0x20(%ebp)
    4eb8:	dd 05 70 b8 00 00    	fldl   0xb870
    4ebe:	d9 c9                	fxch   %st(1)
    4ec0:	df e9                	fucomip %st(1),%st
    4ec2:	dd d8                	fstp   %st(0)
    4ec4:	77 9f                	ja     4e65 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    4ec6:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    4ec9:	c9                   	leave  
    4eca:	c3                   	ret    

00004ecb <cos>:
double cos(double x)  
{  
    4ecb:	55                   	push   %ebp
    4ecc:	89 e5                	mov    %esp,%ebp
    4ece:	83 ec 08             	sub    $0x8,%esp
    4ed1:	8b 45 08             	mov    0x8(%ebp),%eax
    4ed4:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4ed7:	8b 45 0c             	mov    0xc(%ebp),%eax
    4eda:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    4edd:	dd 05 78 b8 00 00    	fldl   0xb878
    4ee3:	dc 65 f8             	fsubl  -0x8(%ebp)
    4ee6:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4eea:	dd 1c 24             	fstpl  (%esp)
    4eed:	e8 3a ff ff ff       	call   4e2c <sin>
    4ef2:	83 c4 08             	add    $0x8,%esp
}  
    4ef5:	c9                   	leave  
    4ef6:	c3                   	ret    

00004ef7 <tan>:
double tan(double x)  
{  
    4ef7:	55                   	push   %ebp
    4ef8:	89 e5                	mov    %esp,%ebp
    4efa:	83 ec 10             	sub    $0x10,%esp
    4efd:	8b 45 08             	mov    0x8(%ebp),%eax
    4f00:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4f03:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f06:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    4f09:	ff 75 fc             	pushl  -0x4(%ebp)
    4f0c:	ff 75 f8             	pushl  -0x8(%ebp)
    4f0f:	e8 18 ff ff ff       	call   4e2c <sin>
    4f14:	83 c4 08             	add    $0x8,%esp
    4f17:	dd 5d f0             	fstpl  -0x10(%ebp)
    4f1a:	ff 75 fc             	pushl  -0x4(%ebp)
    4f1d:	ff 75 f8             	pushl  -0x8(%ebp)
    4f20:	e8 a6 ff ff ff       	call   4ecb <cos>
    4f25:	83 c4 08             	add    $0x8,%esp
    4f28:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    4f2b:	c9                   	leave  
    4f2c:	c3                   	ret    

00004f2d <pow>:

double pow(double x, double y)
{
    4f2d:	55                   	push   %ebp
    4f2e:	89 e5                	mov    %esp,%ebp
    4f30:	83 ec 38             	sub    $0x38,%esp
    4f33:	8b 45 08             	mov    0x8(%ebp),%eax
    4f36:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4f39:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f3c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4f3f:	8b 45 10             	mov    0x10(%ebp),%eax
    4f42:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4f45:	8b 45 14             	mov    0x14(%ebp),%eax
    4f48:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    4f4b:	dd 45 e0             	fldl   -0x20(%ebp)
    4f4e:	d9 ee                	fldz   
    4f50:	df e9                	fucomip %st(1),%st
    4f52:	dd d8                	fstp   %st(0)
    4f54:	7a 28                	jp     4f7e <pow+0x51>
    4f56:	dd 45 e0             	fldl   -0x20(%ebp)
    4f59:	d9 ee                	fldz   
    4f5b:	df e9                	fucomip %st(1),%st
    4f5d:	dd d8                	fstp   %st(0)
    4f5f:	75 1d                	jne    4f7e <pow+0x51>
    4f61:	dd 45 d8             	fldl   -0x28(%ebp)
    4f64:	d9 ee                	fldz   
    4f66:	df e9                	fucomip %st(1),%st
    4f68:	dd d8                	fstp   %st(0)
    4f6a:	7a 0b                	jp     4f77 <pow+0x4a>
    4f6c:	dd 45 d8             	fldl   -0x28(%ebp)
    4f6f:	d9 ee                	fldz   
    4f71:	df e9                	fucomip %st(1),%st
    4f73:	dd d8                	fstp   %st(0)
    4f75:	74 07                	je     4f7e <pow+0x51>
    4f77:	d9 ee                	fldz   
    4f79:	e9 3a 01 00 00       	jmp    50b8 <pow+0x18b>
	else if(x==0 && y==0) return 1;
    4f7e:	dd 45 e0             	fldl   -0x20(%ebp)
    4f81:	d9 ee                	fldz   
    4f83:	df e9                	fucomip %st(1),%st
    4f85:	dd d8                	fstp   %st(0)
    4f87:	7a 28                	jp     4fb1 <pow+0x84>
    4f89:	dd 45 e0             	fldl   -0x20(%ebp)
    4f8c:	d9 ee                	fldz   
    4f8e:	df e9                	fucomip %st(1),%st
    4f90:	dd d8                	fstp   %st(0)
    4f92:	75 1d                	jne    4fb1 <pow+0x84>
    4f94:	dd 45 d8             	fldl   -0x28(%ebp)
    4f97:	d9 ee                	fldz   
    4f99:	df e9                	fucomip %st(1),%st
    4f9b:	dd d8                	fstp   %st(0)
    4f9d:	7a 12                	jp     4fb1 <pow+0x84>
    4f9f:	dd 45 d8             	fldl   -0x28(%ebp)
    4fa2:	d9 ee                	fldz   
    4fa4:	df e9                	fucomip %st(1),%st
    4fa6:	dd d8                	fstp   %st(0)
    4fa8:	75 07                	jne    4fb1 <pow+0x84>
    4faa:	d9 e8                	fld1   
    4fac:	e9 07 01 00 00       	jmp    50b8 <pow+0x18b>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    4fb1:	d9 ee                	fldz   
    4fb3:	dd 45 d8             	fldl   -0x28(%ebp)
    4fb6:	d9 c9                	fxch   %st(1)
    4fb8:	df e9                	fucomip %st(1),%st
    4fba:	dd d8                	fstp   %st(0)
    4fbc:	76 23                	jbe    4fe1 <pow+0xb4>
    4fbe:	dd 45 d8             	fldl   -0x28(%ebp)
    4fc1:	d9 e0                	fchs   
    4fc3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4fc7:	dd 1c 24             	fstpl  (%esp)
    4fca:	ff 75 e4             	pushl  -0x1c(%ebp)
    4fcd:	ff 75 e0             	pushl  -0x20(%ebp)
    4fd0:	e8 58 ff ff ff       	call   4f2d <pow>
    4fd5:	83 c4 10             	add    $0x10,%esp
    4fd8:	d9 e8                	fld1   
    4fda:	de f1                	fdivp  %st,%st(1)
    4fdc:	e9 d7 00 00 00       	jmp    50b8 <pow+0x18b>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    4fe1:	d9 ee                	fldz   
    4fe3:	dd 45 e0             	fldl   -0x20(%ebp)
    4fe6:	d9 c9                	fxch   %st(1)
    4fe8:	df e9                	fucomip %st(1),%st
    4fea:	dd d8                	fstp   %st(0)
    4fec:	76 3a                	jbe    5028 <pow+0xfb>
    4fee:	dd 45 d8             	fldl   -0x28(%ebp)
    4ff1:	d9 7d d6             	fnstcw -0x2a(%ebp)
    4ff4:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4ff8:	b4 0c                	mov    $0xc,%ah
    4ffa:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    4ffe:	d9 6d d4             	fldcw  -0x2c(%ebp)
    5001:	db 5d cc             	fistpl -0x34(%ebp)
    5004:	d9 6d d6             	fldcw  -0x2a(%ebp)
    5007:	db 45 cc             	fildl  -0x34(%ebp)
    500a:	dd 45 d8             	fldl   -0x28(%ebp)
    500d:	de e1                	fsubp  %st,%st(1)
    500f:	d9 ee                	fldz   
    5011:	df e9                	fucomip %st(1),%st
    5013:	7a 0a                	jp     501f <pow+0xf2>
    5015:	d9 ee                	fldz   
    5017:	df e9                	fucomip %st(1),%st
    5019:	dd d8                	fstp   %st(0)
    501b:	74 0b                	je     5028 <pow+0xfb>
    501d:	eb 02                	jmp    5021 <pow+0xf4>
    501f:	dd d8                	fstp   %st(0)
    5021:	d9 ee                	fldz   
    5023:	e9 90 00 00 00       	jmp    50b8 <pow+0x18b>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    5028:	d9 ee                	fldz   
    502a:	dd 45 e0             	fldl   -0x20(%ebp)
    502d:	d9 c9                	fxch   %st(1)
    502f:	df e9                	fucomip %st(1),%st
    5031:	dd d8                	fstp   %st(0)
    5033:	76 5d                	jbe    5092 <pow+0x165>
    5035:	dd 45 d8             	fldl   -0x28(%ebp)
    5038:	d9 7d d6             	fnstcw -0x2a(%ebp)
    503b:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    503f:	b4 0c                	mov    $0xc,%ah
    5041:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    5045:	d9 6d d4             	fldcw  -0x2c(%ebp)
    5048:	db 5d cc             	fistpl -0x34(%ebp)
    504b:	d9 6d d6             	fldcw  -0x2a(%ebp)
    504e:	db 45 cc             	fildl  -0x34(%ebp)
    5051:	dd 45 d8             	fldl   -0x28(%ebp)
    5054:	de e1                	fsubp  %st,%st(1)
    5056:	d9 ee                	fldz   
    5058:	df e9                	fucomip %st(1),%st
    505a:	7a 34                	jp     5090 <pow+0x163>
    505c:	d9 ee                	fldz   
    505e:	df e9                	fucomip %st(1),%st
    5060:	dd d8                	fstp   %st(0)
    5062:	75 2e                	jne    5092 <pow+0x165>
	{
		double powint=1;
    5064:	d9 e8                	fld1   
    5066:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    5069:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    5070:	eb 0d                	jmp    507f <pow+0x152>
    5072:	dd 45 f0             	fldl   -0x10(%ebp)
    5075:	dc 4d e0             	fmull  -0x20(%ebp)
    5078:	dd 5d f0             	fstpl  -0x10(%ebp)
    507b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    507f:	db 45 ec             	fildl  -0x14(%ebp)
    5082:	dd 45 d8             	fldl   -0x28(%ebp)
    5085:	df e9                	fucomip %st(1),%st
    5087:	dd d8                	fstp   %st(0)
    5089:	73 e7                	jae    5072 <pow+0x145>
		return powint;
    508b:	dd 45 f0             	fldl   -0x10(%ebp)
    508e:	eb 28                	jmp    50b8 <pow+0x18b>
    5090:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    5092:	83 ec 08             	sub    $0x8,%esp
    5095:	ff 75 e4             	pushl  -0x1c(%ebp)
    5098:	ff 75 e0             	pushl  -0x20(%ebp)
    509b:	e8 49 00 00 00       	call   50e9 <ln>
    50a0:	83 c4 10             	add    $0x10,%esp
    50a3:	dc 4d d8             	fmull  -0x28(%ebp)
    50a6:	83 ec 08             	sub    $0x8,%esp
    50a9:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    50ad:	dd 1c 24             	fstpl  (%esp)
    50b0:	e8 2a 02 00 00       	call   52df <exp>
    50b5:	83 c4 10             	add    $0x10,%esp
}
    50b8:	c9                   	leave  
    50b9:	c3                   	ret    

000050ba <sqrt>:
// 求根
double sqrt(double x)
{
    50ba:	55                   	push   %ebp
    50bb:	89 e5                	mov    %esp,%ebp
    50bd:	83 ec 18             	sub    $0x18,%esp
    50c0:	8b 45 08             	mov    0x8(%ebp),%eax
    50c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    50c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    50c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    50cc:	dd 05 80 b8 00 00    	fldl   0xb880
    50d2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    50d6:	dd 1c 24             	fstpl  (%esp)
    50d9:	ff 75 f4             	pushl  -0xc(%ebp)
    50dc:	ff 75 f0             	pushl  -0x10(%ebp)
    50df:	e8 49 fe ff ff       	call   4f2d <pow>
    50e4:	83 c4 10             	add    $0x10,%esp
}
    50e7:	c9                   	leave  
    50e8:	c3                   	ret    

000050e9 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    50e9:	55                   	push   %ebp
    50ea:	89 e5                	mov    %esp,%ebp
    50ec:	83 ec 78             	sub    $0x78,%esp
    50ef:	8b 45 08             	mov    0x8(%ebp),%eax
    50f2:	89 45 90             	mov    %eax,-0x70(%ebp)
    50f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    50f8:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    50fb:	dd 45 90             	fldl   -0x70(%ebp)
    50fe:	d9 e8                	fld1   
    5100:	de e9                	fsubrp %st,%st(1)
    5102:	dd 5d c0             	fstpl  -0x40(%ebp)
    5105:	d9 ee                	fldz   
    5107:	dd 5d f0             	fstpl  -0x10(%ebp)
    510a:	d9 ee                	fldz   
    510c:	dd 5d b8             	fstpl  -0x48(%ebp)
    510f:	d9 ee                	fldz   
    5111:	dd 5d b0             	fstpl  -0x50(%ebp)
    5114:	d9 ee                	fldz   
    5116:	dd 5d e8             	fstpl  -0x18(%ebp)
    5119:	d9 e8                	fld1   
    511b:	dd 5d e0             	fstpl  -0x20(%ebp)
    511e:	d9 e8                	fld1   
    5120:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    5123:	dd 45 90             	fldl   -0x70(%ebp)
    5126:	d9 e8                	fld1   
    5128:	df e9                	fucomip %st(1),%st
    512a:	dd d8                	fstp   %st(0)
    512c:	7a 12                	jp     5140 <ln+0x57>
    512e:	dd 45 90             	fldl   -0x70(%ebp)
    5131:	d9 e8                	fld1   
    5133:	df e9                	fucomip %st(1),%st
    5135:	dd d8                	fstp   %st(0)
    5137:	75 07                	jne    5140 <ln+0x57>
    5139:	d9 ee                	fldz   
    513b:	e9 9d 01 00 00       	jmp    52dd <ln+0x1f4>
	else if(x>2) return -ln(1/x);
    5140:	dd 45 90             	fldl   -0x70(%ebp)
    5143:	dd 05 88 b8 00 00    	fldl   0xb888
    5149:	d9 c9                	fxch   %st(1)
    514b:	df e9                	fucomip %st(1),%st
    514d:	dd d8                	fstp   %st(0)
    514f:	76 1e                	jbe    516f <ln+0x86>
    5151:	d9 e8                	fld1   
    5153:	dc 75 90             	fdivl  -0x70(%ebp)
    5156:	83 ec 08             	sub    $0x8,%esp
    5159:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    515d:	dd 1c 24             	fstpl  (%esp)
    5160:	e8 84 ff ff ff       	call   50e9 <ln>
    5165:	83 c4 10             	add    $0x10,%esp
    5168:	d9 e0                	fchs   
    516a:	e9 6e 01 00 00       	jmp    52dd <ln+0x1f4>
	else if(x<.1)
    516f:	dd 05 90 b8 00 00    	fldl   0xb890
    5175:	dd 45 90             	fldl   -0x70(%ebp)
    5178:	d9 c9                	fxch   %st(1)
    517a:	df e9                	fucomip %st(1),%st
    517c:	dd d8                	fstp   %st(0)
    517e:	76 65                	jbe    51e5 <ln+0xfc>
	{
		double n=-1;
    5180:	d9 e8                	fld1   
    5182:	d9 e0                	fchs   
    5184:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    5187:	dd 45 c8             	fldl   -0x38(%ebp)
    518a:	dd 05 98 b8 00 00    	fldl   0xb898
    5190:	de e9                	fsubrp %st,%st(1)
    5192:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    5195:	83 ec 08             	sub    $0x8,%esp
    5198:	ff 75 cc             	pushl  -0x34(%ebp)
    519b:	ff 75 c8             	pushl  -0x38(%ebp)
    519e:	e8 3c 01 00 00       	call   52df <exp>
    51a3:	83 c4 10             	add    $0x10,%esp
    51a6:	dd 45 90             	fldl   -0x70(%ebp)
    51a9:	de f1                	fdivp  %st,%st(1)
    51ab:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    51ae:	dd 45 a0             	fldl   -0x60(%ebp)
    51b1:	dd 05 88 b8 00 00    	fldl   0xb888
    51b7:	d9 c9                	fxch   %st(1)
    51b9:	df e9                	fucomip %st(1),%st
    51bb:	dd d8                	fstp   %st(0)
    51bd:	77 c8                	ja     5187 <ln+0x9e>
    51bf:	d9 e8                	fld1   
    51c1:	dd 45 a0             	fldl   -0x60(%ebp)
    51c4:	d9 c9                	fxch   %st(1)
    51c6:	df e9                	fucomip %st(1),%st
    51c8:	dd d8                	fstp   %st(0)
    51ca:	77 bb                	ja     5187 <ln+0x9e>
		return ln(a)+n;
    51cc:	83 ec 08             	sub    $0x8,%esp
    51cf:	ff 75 a4             	pushl  -0x5c(%ebp)
    51d2:	ff 75 a0             	pushl  -0x60(%ebp)
    51d5:	e8 0f ff ff ff       	call   50e9 <ln>
    51da:	83 c4 10             	add    $0x10,%esp
    51dd:	dc 45 c8             	faddl  -0x38(%ebp)
    51e0:	e9 f8 00 00 00       	jmp    52dd <ln+0x1f4>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    51e5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    51ec:	d9 e8                	fld1   
    51ee:	dd 5d d8             	fstpl  -0x28(%ebp)
    51f1:	e9 b6 00 00 00       	jmp    52ac <ln+0x1c3>
	{
		ln_tmp=ln_px;
    51f6:	dd 45 e8             	fldl   -0x18(%ebp)
    51f9:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    51fc:	dd 45 d8             	fldl   -0x28(%ebp)
    51ff:	dc 4d c0             	fmull  -0x40(%ebp)
    5202:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    5205:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    5209:	75 0d                	jne    5218 <ln+0x12f>
    520b:	db 45 d4             	fildl  -0x2c(%ebp)
    520e:	dd 45 d8             	fldl   -0x28(%ebp)
    5211:	de f1                	fdivp  %st,%st(1)
    5213:	dd 5d d8             	fstpl  -0x28(%ebp)
    5216:	eb 13                	jmp    522b <ln+0x142>
		else tmp=tmp/-l;
    5218:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    521b:	f7 d8                	neg    %eax
    521d:	89 45 8c             	mov    %eax,-0x74(%ebp)
    5220:	db 45 8c             	fildl  -0x74(%ebp)
    5223:	dd 45 d8             	fldl   -0x28(%ebp)
    5226:	de f1                	fdivp  %st,%st(1)
    5228:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    522b:	dd 45 f0             	fldl   -0x10(%ebp)
    522e:	dc 45 d8             	faddl  -0x28(%ebp)
    5231:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    5234:	dd 45 d8             	fldl   -0x28(%ebp)
    5237:	d9 e0                	fchs   
    5239:	dc 4d c0             	fmull  -0x40(%ebp)
    523c:	db 45 d4             	fildl  -0x2c(%ebp)
    523f:	de c9                	fmulp  %st,%st(1)
    5241:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5244:	83 c0 01             	add    $0x1,%eax
    5247:	89 45 8c             	mov    %eax,-0x74(%ebp)
    524a:	db 45 8c             	fildl  -0x74(%ebp)
    524d:	de f9                	fdivrp %st,%st(1)
    524f:	dc 45 f0             	faddl  -0x10(%ebp)
    5252:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    5255:	dd 45 d8             	fldl   -0x28(%ebp)
    5258:	dc 4d c0             	fmull  -0x40(%ebp)
    525b:	dc 4d c0             	fmull  -0x40(%ebp)
    525e:	db 45 d4             	fildl  -0x2c(%ebp)
    5261:	de c9                	fmulp  %st,%st(1)
    5263:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5266:	83 c0 02             	add    $0x2,%eax
    5269:	89 45 8c             	mov    %eax,-0x74(%ebp)
    526c:	db 45 8c             	fildl  -0x74(%ebp)
    526f:	de f9                	fdivrp %st,%st(1)
    5271:	dc 45 b8             	faddl  -0x48(%ebp)
    5274:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    5277:	dd 45 b0             	fldl   -0x50(%ebp)
    527a:	dc 65 b8             	fsubl  -0x48(%ebp)
    527d:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    5280:	dd 45 a8             	fldl   -0x58(%ebp)
    5283:	dc 4d a8             	fmull  -0x58(%ebp)
    5286:	dd 45 b8             	fldl   -0x48(%ebp)
    5289:	d8 c0                	fadd   %st(0),%st
    528b:	dd 45 b0             	fldl   -0x50(%ebp)
    528e:	de e1                	fsubp  %st,%st(1)
    5290:	dc 45 f0             	faddl  -0x10(%ebp)
    5293:	de f9                	fdivrp %st,%st(1)
    5295:	dd 45 b0             	fldl   -0x50(%ebp)
    5298:	de e1                	fsubp  %st,%st(1)
    529a:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    529d:	db 45 d4             	fildl  -0x2c(%ebp)
    52a0:	dd 45 d8             	fldl   -0x28(%ebp)
    52a3:	de c9                	fmulp  %st,%st(1)
    52a5:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    52a8:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    52ac:	dd 45 e8             	fldl   -0x18(%ebp)
    52af:	dc 65 e0             	fsubl  -0x20(%ebp)
    52b2:	dd 05 a0 b8 00 00    	fldl   0xb8a0
    52b8:	d9 c9                	fxch   %st(1)
    52ba:	df e9                	fucomip %st(1),%st
    52bc:	dd d8                	fstp   %st(0)
    52be:	0f 87 32 ff ff ff    	ja     51f6 <ln+0x10d>
    52c4:	dd 45 e8             	fldl   -0x18(%ebp)
    52c7:	dc 65 e0             	fsubl  -0x20(%ebp)
    52ca:	dd 05 a8 b8 00 00    	fldl   0xb8a8
    52d0:	df e9                	fucomip %st(1),%st
    52d2:	dd d8                	fstp   %st(0)
    52d4:	0f 87 1c ff ff ff    	ja     51f6 <ln+0x10d>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    52da:	dd 45 e8             	fldl   -0x18(%ebp)
}
    52dd:	c9                   	leave  
    52de:	c3                   	ret    

000052df <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    52df:	55                   	push   %ebp
    52e0:	89 e5                	mov    %esp,%ebp
    52e2:	83 ec 68             	sub    $0x68,%esp
    52e5:	8b 45 08             	mov    0x8(%ebp),%eax
    52e8:	89 45 a0             	mov    %eax,-0x60(%ebp)
    52eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    52ee:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    52f1:	dd 45 a0             	fldl   -0x60(%ebp)
    52f4:	dd 5d c0             	fstpl  -0x40(%ebp)
    52f7:	d9 ee                	fldz   
    52f9:	dd 5d f0             	fstpl  -0x10(%ebp)
    52fc:	d9 ee                	fldz   
    52fe:	dd 5d b8             	fstpl  -0x48(%ebp)
    5301:	d9 ee                	fldz   
    5303:	dd 5d b0             	fstpl  -0x50(%ebp)
    5306:	d9 ee                	fldz   
    5308:	dd 5d e8             	fstpl  -0x18(%ebp)
    530b:	d9 e8                	fld1   
    530d:	dd 5d e0             	fstpl  -0x20(%ebp)
    5310:	d9 e8                	fld1   
    5312:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    5315:	dd 45 a0             	fldl   -0x60(%ebp)
    5318:	d9 ee                	fldz   
    531a:	df e9                	fucomip %st(1),%st
    531c:	dd d8                	fstp   %st(0)
    531e:	7a 12                	jp     5332 <exp+0x53>
    5320:	dd 45 a0             	fldl   -0x60(%ebp)
    5323:	d9 ee                	fldz   
    5325:	df e9                	fucomip %st(1),%st
    5327:	dd d8                	fstp   %st(0)
    5329:	75 07                	jne    5332 <exp+0x53>
    532b:	d9 e8                	fld1   
    532d:	e9 12 01 00 00       	jmp    5444 <exp+0x165>
	if(x<0) return 1/exp(-x); 
    5332:	d9 ee                	fldz   
    5334:	dd 45 a0             	fldl   -0x60(%ebp)
    5337:	d9 c9                	fxch   %st(1)
    5339:	df e9                	fucomip %st(1),%st
    533b:	dd d8                	fstp   %st(0)
    533d:	76 20                	jbe    535f <exp+0x80>
    533f:	dd 45 a0             	fldl   -0x60(%ebp)
    5342:	d9 e0                	fchs   
    5344:	83 ec 08             	sub    $0x8,%esp
    5347:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    534b:	dd 1c 24             	fstpl  (%esp)
    534e:	e8 8c ff ff ff       	call   52df <exp>
    5353:	83 c4 10             	add    $0x10,%esp
    5356:	d9 e8                	fld1   
    5358:	de f1                	fdivp  %st,%st(1)
    535a:	e9 e5 00 00 00       	jmp    5444 <exp+0x165>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    535f:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    5366:	d9 e8                	fld1   
    5368:	dd 5d d0             	fstpl  -0x30(%ebp)
    536b:	e9 92 00 00 00       	jmp    5402 <exp+0x123>
	{
		ex_tmp=ex_px;
    5370:	dd 45 e8             	fldl   -0x18(%ebp)
    5373:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    5376:	dd 45 d0             	fldl   -0x30(%ebp)
    5379:	dc 4d c0             	fmull  -0x40(%ebp)
    537c:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    537f:	db 45 cc             	fildl  -0x34(%ebp)
    5382:	dd 45 d0             	fldl   -0x30(%ebp)
    5385:	de f1                	fdivp  %st,%st(1)
    5387:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    538a:	dd 45 f0             	fldl   -0x10(%ebp)
    538d:	dc 45 d0             	faddl  -0x30(%ebp)
    5390:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    5393:	dd 45 d0             	fldl   -0x30(%ebp)
    5396:	dc 4d c0             	fmull  -0x40(%ebp)
    5399:	8b 45 cc             	mov    -0x34(%ebp),%eax
    539c:	83 c0 01             	add    $0x1,%eax
    539f:	89 45 9c             	mov    %eax,-0x64(%ebp)
    53a2:	db 45 9c             	fildl  -0x64(%ebp)
    53a5:	de f9                	fdivrp %st,%st(1)
    53a7:	dc 45 f0             	faddl  -0x10(%ebp)
    53aa:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    53ad:	dd 45 d0             	fldl   -0x30(%ebp)
    53b0:	dc 4d c0             	fmull  -0x40(%ebp)
    53b3:	dc 4d c0             	fmull  -0x40(%ebp)
    53b6:	8b 45 cc             	mov    -0x34(%ebp),%eax
    53b9:	83 c0 01             	add    $0x1,%eax
    53bc:	89 45 9c             	mov    %eax,-0x64(%ebp)
    53bf:	db 45 9c             	fildl  -0x64(%ebp)
    53c2:	de f9                	fdivrp %st,%st(1)
    53c4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    53c7:	83 c0 02             	add    $0x2,%eax
    53ca:	89 45 9c             	mov    %eax,-0x64(%ebp)
    53cd:	db 45 9c             	fildl  -0x64(%ebp)
    53d0:	de f9                	fdivrp %st,%st(1)
    53d2:	dc 45 b8             	faddl  -0x48(%ebp)
    53d5:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    53d8:	dd 45 b0             	fldl   -0x50(%ebp)
    53db:	dc 65 b8             	fsubl  -0x48(%ebp)
    53de:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    53e1:	dd 45 d8             	fldl   -0x28(%ebp)
    53e4:	dc 4d d8             	fmull  -0x28(%ebp)
    53e7:	dd 45 b8             	fldl   -0x48(%ebp)
    53ea:	d8 c0                	fadd   %st(0),%st
    53ec:	dd 45 b0             	fldl   -0x50(%ebp)
    53ef:	de e1                	fsubp  %st,%st(1)
    53f1:	dc 45 f0             	faddl  -0x10(%ebp)
    53f4:	de f9                	fdivrp %st,%st(1)
    53f6:	dd 45 b0             	fldl   -0x50(%ebp)
    53f9:	de e1                	fsubp  %st,%st(1)
    53fb:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    53fe:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    5402:	dd 45 e8             	fldl   -0x18(%ebp)
    5405:	dc 65 e0             	fsubl  -0x20(%ebp)
    5408:	dd 05 b0 b8 00 00    	fldl   0xb8b0
    540e:	d9 c9                	fxch   %st(1)
    5410:	df e9                	fucomip %st(1),%st
    5412:	dd d8                	fstp   %st(0)
    5414:	77 12                	ja     5428 <exp+0x149>
    5416:	dd 45 e8             	fldl   -0x18(%ebp)
    5419:	dc 65 e0             	fsubl  -0x20(%ebp)
    541c:	dd 05 b8 b8 00 00    	fldl   0xb8b8
    5422:	df e9                	fucomip %st(1),%st
    5424:	dd d8                	fstp   %st(0)
    5426:	76 15                	jbe    543d <exp+0x15e>
    5428:	dd 45 d8             	fldl   -0x28(%ebp)
    542b:	dd 05 b0 b8 00 00    	fldl   0xb8b0
    5431:	d9 c9                	fxch   %st(1)
    5433:	df e9                	fucomip %st(1),%st
    5435:	dd d8                	fstp   %st(0)
    5437:	0f 87 33 ff ff ff    	ja     5370 <exp+0x91>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    543d:	dd 45 e8             	fldl   -0x18(%ebp)
    5440:	d9 e8                	fld1   
    5442:	de c1                	faddp  %st,%st(1)
    5444:	c9                   	leave  
    5445:	c3                   	ret    

00005446 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    5446:	55                   	push   %ebp
    5447:	89 e5                	mov    %esp,%ebp
    5449:	83 ec 68             	sub    $0x68,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    544c:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    5450:	83 ec 08             	sub    $0x8,%esp
    5453:	ff 75 08             	pushl  0x8(%ebp)
    5456:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5459:	50                   	push   %eax
    545a:	e8 f7 f1 ff ff       	call   4656 <strcpy>
    545f:	83 c4 10             	add    $0x10,%esp
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    5462:	83 ec 08             	sub    $0x8,%esp
    5465:	6a 02                	push   $0x2
    5467:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    546a:	50                   	push   %eax
    546b:	e8 56 f4 ff ff       	call   48c6 <open>
    5470:	83 c4 10             	add    $0x10,%esp
    5473:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5476:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    547a:	75 16                	jne    5492 <OpenTableFile+0x4c>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    547c:	83 ec 04             	sub    $0x4,%esp
    547f:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5482:	50                   	push   %eax
    5483:	68 ec b8 00 00       	push   $0xb8ec
    5488:	6a 00                	push   $0x0
    548a:	e8 d4 f5 ff ff       	call   4a63 <printf>
    548f:	83 c4 10             	add    $0x10,%esp
    }
    return f;
    5492:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5495:	c9                   	leave  
    5496:	c3                   	ret    

00005497 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    5497:	55                   	push   %ebp
    5498:	89 e5                	mov    %esp,%ebp
    549a:	57                   	push   %edi
    549b:	56                   	push   %esi
    549c:	53                   	push   %ebx
    549d:	83 ec 1c             	sub    $0x1c,%esp
	layer *info = fr_ps->header;
    54a0:	8b 45 08             	mov    0x8(%ebp),%eax
    54a3:	8b 00                	mov    (%eax),%eax
    54a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    54a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54ab:	8b 78 14             	mov    0x14(%eax),%edi
    54ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54b1:	8b 70 10             	mov    0x10(%eax),%esi
    54b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54b7:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    54ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54bd:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    54c0:	85 c0                	test   %eax,%eax
    54c2:	0f 94 c0             	sete   %al
    54c5:	0f b6 c8             	movzbl %al,%ecx
    54c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54cb:	8b 50 04             	mov    0x4(%eax),%edx
    54ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54d1:	8b 00                	mov    (%eax),%eax
    54d3:	57                   	push   %edi
    54d4:	56                   	push   %esi
    54d5:	53                   	push   %ebx
    54d6:	51                   	push   %ecx
    54d7:	52                   	push   %edx
    54d8:	50                   	push   %eax
    54d9:	68 0c b9 00 00       	push   $0xb90c
    54de:	6a 00                	push   $0x0
    54e0:	e8 7e f5 ff ff       	call   4a63 <printf>
    54e5:	83 c4 20             	add    $0x20,%esp
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    54e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54eb:	8b 78 2c             	mov    0x2c(%eax),%edi
    54ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54f1:	8b 70 28             	mov    0x28(%eax),%esi
    54f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54f7:	8b 58 24             	mov    0x24(%eax),%ebx
    54fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54fd:	8b 48 20             	mov    0x20(%eax),%ecx
    5500:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5503:	8b 50 1c             	mov    0x1c(%eax),%edx
    5506:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5509:	8b 40 18             	mov    0x18(%eax),%eax
    550c:	57                   	push   %edi
    550d:	56                   	push   %esi
    550e:	53                   	push   %ebx
    550f:	51                   	push   %ecx
    5510:	52                   	push   %edx
    5511:	50                   	push   %eax
    5512:	68 4c b9 00 00       	push   $0xb94c
    5517:	6a 00                	push   $0x0
    5519:	e8 45 f5 ff ff       	call   4a63 <printf>
    551e:	83 c4 20             	add    $0x20,%esp
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    5521:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5524:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5527:	8b 0c 85 e0 fa 00 00 	mov    0xfae0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    552e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5531:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5534:	dd 04 c5 c0 fa 00 00 	fldl   0xfac0(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    553b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    553e:	8b 40 04             	mov    0x4(%eax),%eax
    5541:	8d 50 ff             	lea    -0x1(%eax),%edx
    5544:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5547:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    554a:	89 d0                	mov    %edx,%eax
    554c:	c1 e0 04             	shl    $0x4,%eax
    554f:	29 d0                	sub    %edx,%eax
    5551:	01 d8                	add    %ebx,%eax
    5553:	8b 14 85 00 fa 00 00 	mov    0xfa00(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    555a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    555d:	8b 40 04             	mov    0x4(%eax),%eax
    5560:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5563:	8b 04 85 c0 f9 00 00 	mov    0xf9c0(,%eax,4),%eax
    556a:	83 ec 04             	sub    $0x4,%esp
    556d:	51                   	push   %ecx
    556e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5572:	dd 1c 24             	fstpl  (%esp)
    5575:	52                   	push   %edx
    5576:	50                   	push   %eax
    5577:	68 74 b9 00 00       	push   $0xb974
    557c:	6a 00                	push   $0x0
    557e:	e8 e0 f4 ff ff       	call   4a63 <printf>
    5583:	83 c4 20             	add    $0x20,%esp
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    5586:	8b 45 08             	mov    0x8(%ebp),%eax
    5589:	8b 48 08             	mov    0x8(%eax),%ecx
    558c:	8b 45 08             	mov    0x8(%ebp),%eax
    558f:	8b 50 0c             	mov    0xc(%eax),%edx
    5592:	8b 45 08             	mov    0x8(%ebp),%eax
    5595:	8b 40 10             	mov    0x10(%eax),%eax
    5598:	83 ec 0c             	sub    $0xc,%esp
    559b:	51                   	push   %ecx
    559c:	52                   	push   %edx
    559d:	50                   	push   %eax
    559e:	68 a3 b9 00 00       	push   $0xb9a3
    55a3:	6a 00                	push   $0x0
    55a5:	e8 b9 f4 ff ff       	call   4a63 <printf>
    55aa:	83 c4 20             	add    $0x20,%esp
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    55ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
    55b0:	5b                   	pop    %ebx
    55b1:	5e                   	pop    %esi
    55b2:	5f                   	pop    %edi
    55b3:	5d                   	pop    %ebp
    55b4:	c3                   	ret    

000055b5 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    55b5:	55                   	push   %ebp
    55b6:	89 e5                	mov    %esp,%ebp
    55b8:	83 ec 18             	sub    $0x18,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    55bb:	83 ec 0c             	sub    $0xc,%esp
    55be:	ff 75 08             	pushl  0x8(%ebp)
    55c1:	e8 6e f7 ff ff       	call   4d34 <malloc>
    55c6:	83 c4 10             	add    $0x10,%esp
    55c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    55cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    55d0:	74 15                	je     55e7 <mem_alloc+0x32>
		memset(ptr, 0, block);
    55d2:	83 ec 04             	sub    $0x4,%esp
    55d5:	ff 75 08             	pushl  0x8(%ebp)
    55d8:	6a 00                	push   $0x0
    55da:	ff 75 f4             	pushl  -0xc(%ebp)
    55dd:	e8 0a f1 ff ff       	call   46ec <memset>
    55e2:	83 c4 10             	add    $0x10,%esp
    55e5:	eb 1a                	jmp    5601 <mem_alloc+0x4c>
	else{
		printf(0, "Unable to allocate %s\n", item);
    55e7:	83 ec 04             	sub    $0x4,%esp
    55ea:	ff 75 0c             	pushl  0xc(%ebp)
    55ed:	68 bd b9 00 00       	push   $0xb9bd
    55f2:	6a 00                	push   $0x0
    55f4:	e8 6a f4 ff ff       	call   4a63 <printf>
    55f9:	83 c4 10             	add    $0x10,%esp
		exit();
    55fc:	e8 85 f2 ff ff       	call   4886 <exit>
	}
	return ptr;
    5601:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5604:	c9                   	leave  
    5605:	c3                   	ret    

00005606 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    5606:	55                   	push   %ebp
    5607:	89 e5                	mov    %esp,%ebp
    5609:	83 ec 08             	sub    $0x8,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    560c:	8b 45 0c             	mov    0xc(%ebp),%eax
    560f:	83 ec 08             	sub    $0x8,%esp
    5612:	68 d4 b9 00 00       	push   $0xb9d4
    5617:	50                   	push   %eax
    5618:	e8 98 ff ff ff       	call   55b5 <mem_alloc>
    561d:	83 c4 10             	add    $0x10,%esp
    5620:	89 c2                	mov    %eax,%edx
    5622:	8b 45 08             	mov    0x8(%ebp),%eax
    5625:	89 50 04             	mov    %edx,0x4(%eax)
	bs->buf_size = size;
    5628:	8b 45 08             	mov    0x8(%ebp),%eax
    562b:	8b 55 0c             	mov    0xc(%ebp),%edx
    562e:	89 50 08             	mov    %edx,0x8(%eax)
}
    5631:	c9                   	leave  
    5632:	c3                   	ret    

00005633 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    5633:	55                   	push   %ebp
    5634:	89 e5                	mov    %esp,%ebp
    5636:	83 ec 08             	sub    $0x8,%esp
	free(bs->buf);
    5639:	8b 45 08             	mov    0x8(%ebp),%eax
    563c:	8b 40 04             	mov    0x4(%eax),%eax
    563f:	83 ec 0c             	sub    $0xc,%esp
    5642:	50                   	push   %eax
    5643:	e8 ab f5 ff ff       	call   4bf3 <free>
    5648:	83 c4 10             	add    $0x10,%esp
}
    564b:	c9                   	leave  
    564c:	c3                   	ret    

0000564d <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    564d:	55                   	push   %ebp
    564e:	89 e5                	mov    %esp,%ebp
    5650:	83 ec 08             	sub    $0x8,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    5653:	83 ec 08             	sub    $0x8,%esp
    5656:	6a 02                	push   $0x2
    5658:	ff 75 0c             	pushl  0xc(%ebp)
    565b:	e8 66 f2 ff ff       	call   48c6 <open>
    5660:	83 c4 10             	add    $0x10,%esp
    5663:	89 c2                	mov    %eax,%edx
    5665:	8b 45 08             	mov    0x8(%ebp),%eax
    5668:	89 10                	mov    %edx,(%eax)
    566a:	8b 45 08             	mov    0x8(%ebp),%eax
    566d:	8b 00                	mov    (%eax),%eax
    566f:	83 f8 ff             	cmp    $0xffffffff,%eax
    5672:	75 1a                	jne    568e <open_bit_stream_r+0x41>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    5674:	83 ec 04             	sub    $0x4,%esp
    5677:	ff 75 0c             	pushl  0xc(%ebp)
    567a:	68 db b9 00 00       	push   $0xb9db
    567f:	6a 00                	push   $0x0
    5681:	e8 dd f3 ff ff       	call   4a63 <printf>
    5686:	83 c4 10             	add    $0x10,%esp
		exit();
    5689:	e8 f8 f1 ff ff       	call   4886 <exit>
	}

	bs->format = BINARY;
    568e:	8b 45 08             	mov    0x8(%ebp),%eax
    5691:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    5695:	83 ec 08             	sub    $0x8,%esp
    5698:	ff 75 10             	pushl  0x10(%ebp)
    569b:	ff 75 08             	pushl  0x8(%ebp)
    569e:	e8 63 ff ff ff       	call   5606 <alloc_buffer>
    56a3:	83 c4 10             	add    $0x10,%esp
	bs->buf_byte_idx=0;
    56a6:	8b 45 08             	mov    0x8(%ebp),%eax
    56a9:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    56b0:	8b 45 08             	mov    0x8(%ebp),%eax
    56b3:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    56ba:	8b 45 08             	mov    0x8(%ebp),%eax
    56bd:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    56c4:	8b 45 08             	mov    0x8(%ebp),%eax
    56c7:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    56ce:	8b 45 08             	mov    0x8(%ebp),%eax
    56d1:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    56d8:	8b 45 08             	mov    0x8(%ebp),%eax
    56db:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    56e2:	c9                   	leave  
    56e3:	c3                   	ret    

000056e4 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    56e4:	55                   	push   %ebp
    56e5:	89 e5                	mov    %esp,%ebp
    56e7:	83 ec 08             	sub    $0x8,%esp
	close(bs->pt);
    56ea:	8b 45 08             	mov    0x8(%ebp),%eax
    56ed:	8b 00                	mov    (%eax),%eax
    56ef:	83 ec 0c             	sub    $0xc,%esp
    56f2:	50                   	push   %eax
    56f3:	e8 b6 f1 ff ff       	call   48ae <close>
    56f8:	83 c4 10             	add    $0x10,%esp
	desalloc_buffer(bs);
    56fb:	83 ec 0c             	sub    $0xc,%esp
    56fe:	ff 75 08             	pushl  0x8(%ebp)
    5701:	e8 2d ff ff ff       	call   5633 <desalloc_buffer>
    5706:	83 c4 10             	add    $0x10,%esp
}
    5709:	c9                   	leave  
    570a:	c3                   	ret    

0000570b <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    570b:	55                   	push   %ebp
    570c:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    570e:	8b 45 08             	mov    0x8(%ebp),%eax
    5711:	8b 40 20             	mov    0x20(%eax),%eax
}
    5714:	5d                   	pop    %ebp
    5715:	c3                   	ret    

00005716 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    5716:	55                   	push   %ebp
    5717:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    5719:	8b 45 08             	mov    0x8(%ebp),%eax
    571c:	8b 40 0c             	mov    0xc(%eax),%eax
}
    571f:	5d                   	pop    %ebp
    5720:	c3                   	ret    

00005721 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    5721:	55                   	push   %ebp
    5722:	89 e5                	mov    %esp,%ebp
    5724:	56                   	push   %esi
    5725:	53                   	push   %ebx
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    5726:	8b 45 08             	mov    0x8(%ebp),%eax
    5729:	8b 40 08             	mov    0x8(%eax),%eax
    572c:	8d 50 fe             	lea    -0x2(%eax),%edx
    572f:	8b 45 08             	mov    0x8(%ebp),%eax
    5732:	8b 40 10             	mov    0x10(%eax),%eax
    5735:	89 d3                	mov    %edx,%ebx
    5737:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    5739:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    573e:	eb 30                	jmp    5770 <refill_buffer+0x4f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    5740:	8b 45 08             	mov    0x8(%ebp),%eax
    5743:	8b 50 04             	mov    0x4(%eax),%edx
    5746:	89 d8                	mov    %ebx,%eax
    5748:	8d 58 ff             	lea    -0x1(%eax),%ebx
    574b:	01 c2                	add    %eax,%edx
    574d:	8b 45 08             	mov    0x8(%ebp),%eax
    5750:	8b 00                	mov    (%eax),%eax
    5752:	83 ec 04             	sub    $0x4,%esp
    5755:	6a 01                	push   $0x1
    5757:	52                   	push   %edx
    5758:	50                   	push   %eax
    5759:	e8 40 f1 ff ff       	call   489e <read>
    575e:	83 c4 10             	add    $0x10,%esp
    5761:	89 c6                	mov    %eax,%esi
		if (!n)
    5763:	85 f6                	test   %esi,%esi
    5765:	75 09                	jne    5770 <refill_buffer+0x4f>
		bs->eob= i+1;
    5767:	8d 53 01             	lea    0x1(%ebx),%edx
    576a:	8b 45 08             	mov    0x8(%ebp),%eax
    576d:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    5770:	85 db                	test   %ebx,%ebx
    5772:	78 0a                	js     577e <refill_buffer+0x5d>
    5774:	8b 45 08             	mov    0x8(%ebp),%eax
    5777:	8b 40 1c             	mov    0x1c(%eax),%eax
    577a:	85 c0                	test   %eax,%eax
    577c:	74 c2                	je     5740 <refill_buffer+0x1f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    577e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    5781:	5b                   	pop    %ebx
    5782:	5e                   	pop    %esi
    5783:	5d                   	pop    %ebp
    5784:	c3                   	ret    

00005785 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    5785:	55                   	push   %ebp
    5786:	89 e5                	mov    %esp,%ebp
    5788:	53                   	push   %ebx
    5789:	83 ec 14             	sub    $0x14,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    578c:	8b 45 08             	mov    0x8(%ebp),%eax
    578f:	8b 40 0c             	mov    0xc(%eax),%eax
    5792:	8d 50 01             	lea    0x1(%eax),%edx
    5795:	8b 45 08             	mov    0x8(%ebp),%eax
    5798:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    579b:	8b 45 08             	mov    0x8(%ebp),%eax
    579e:	8b 40 14             	mov    0x14(%eax),%eax
    57a1:	85 c0                	test   %eax,%eax
    57a3:	0f 85 a2 00 00 00    	jne    584b <get1bit+0xc6>
        bs->buf_bit_idx = 8;
    57a9:	8b 45 08             	mov    0x8(%ebp),%eax
    57ac:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    57b3:	8b 45 08             	mov    0x8(%ebp),%eax
    57b6:	8b 40 10             	mov    0x10(%eax),%eax
    57b9:	8d 50 ff             	lea    -0x1(%eax),%edx
    57bc:	8b 45 08             	mov    0x8(%ebp),%eax
    57bf:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    57c2:	8b 45 08             	mov    0x8(%ebp),%eax
    57c5:	8b 40 10             	mov    0x10(%eax),%eax
    57c8:	83 f8 03             	cmp    $0x3,%eax
    57cb:	7e 10                	jle    57dd <get1bit+0x58>
    57cd:	8b 45 08             	mov    0x8(%ebp),%eax
    57d0:	8b 50 10             	mov    0x10(%eax),%edx
    57d3:	8b 45 08             	mov    0x8(%ebp),%eax
    57d6:	8b 40 1c             	mov    0x1c(%eax),%eax
    57d9:	39 c2                	cmp    %eax,%edx
    57db:	7d 6e                	jge    584b <get1bit+0xc6>
             if (bs->eob)
    57dd:	8b 45 08             	mov    0x8(%ebp),%eax
    57e0:	8b 40 1c             	mov    0x1c(%eax),%eax
    57e3:	85 c0                	test   %eax,%eax
    57e5:	74 0c                	je     57f3 <get1bit+0x6e>
                bs->eobs = TRUE;
    57e7:	8b 45 08             	mov    0x8(%ebp),%eax
    57ea:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    57f1:	eb 58                	jmp    584b <get1bit+0xc6>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    57f3:	8b 45 08             	mov    0x8(%ebp),%eax
    57f6:	8b 58 10             	mov    0x10(%eax),%ebx
    57f9:	eb 2f                	jmp    582a <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    57fb:	8b 45 08             	mov    0x8(%ebp),%eax
    57fe:	8b 50 04             	mov    0x4(%eax),%edx
    5801:	8b 45 08             	mov    0x8(%ebp),%eax
    5804:	8b 40 08             	mov    0x8(%eax),%eax
    5807:	8d 48 ff             	lea    -0x1(%eax),%ecx
    580a:	8b 45 08             	mov    0x8(%ebp),%eax
    580d:	8b 40 10             	mov    0x10(%eax),%eax
    5810:	29 c1                	sub    %eax,%ecx
    5812:	89 c8                	mov    %ecx,%eax
    5814:	01 d8                	add    %ebx,%eax
    5816:	01 c2                	add    %eax,%edx
    5818:	8b 45 08             	mov    0x8(%ebp),%eax
    581b:	8b 40 04             	mov    0x4(%eax),%eax
    581e:	89 d9                	mov    %ebx,%ecx
    5820:	01 c8                	add    %ecx,%eax
    5822:	0f b6 00             	movzbl (%eax),%eax
    5825:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5827:	83 eb 01             	sub    $0x1,%ebx
    582a:	85 db                	test   %ebx,%ebx
    582c:	79 cd                	jns    57fb <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    582e:	83 ec 0c             	sub    $0xc,%esp
    5831:	ff 75 08             	pushl  0x8(%ebp)
    5834:	e8 e8 fe ff ff       	call   5721 <refill_buffer>
    5839:	83 c4 10             	add    $0x10,%esp
                bs->buf_byte_idx = bs->buf_size-1;
    583c:	8b 45 08             	mov    0x8(%ebp),%eax
    583f:	8b 40 08             	mov    0x8(%eax),%eax
    5842:	8d 50 ff             	lea    -0x1(%eax),%edx
    5845:	8b 45 08             	mov    0x8(%ebp),%eax
    5848:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    584b:	8b 45 08             	mov    0x8(%ebp),%eax
    584e:	8b 50 04             	mov    0x4(%eax),%edx
    5851:	8b 45 08             	mov    0x8(%ebp),%eax
    5854:	8b 40 10             	mov    0x10(%eax),%eax
    5857:	01 d0                	add    %edx,%eax
    5859:	0f b6 00             	movzbl (%eax),%eax
    585c:	0f b6 d0             	movzbl %al,%edx
    585f:	8b 45 08             	mov    0x8(%ebp),%eax
    5862:	8b 40 14             	mov    0x14(%eax),%eax
    5865:	83 e8 01             	sub    $0x1,%eax
    5868:	8b 04 85 00 fb 00 00 	mov    0xfb00(,%eax,4),%eax
    586f:	21 d0                	and    %edx,%eax
    5871:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    5874:	8b 45 08             	mov    0x8(%ebp),%eax
    5877:	8b 40 14             	mov    0x14(%eax),%eax
    587a:	83 e8 01             	sub    $0x1,%eax
    587d:	89 c1                	mov    %eax,%ecx
    587f:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    5882:	8b 45 08             	mov    0x8(%ebp),%eax
    5885:	8b 40 14             	mov    0x14(%eax),%eax
    5888:	8d 50 ff             	lea    -0x1(%eax),%edx
    588b:	8b 45 08             	mov    0x8(%ebp),%eax
    588e:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    5891:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5894:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5897:	c9                   	leave  
    5898:	c3                   	ret    

00005899 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    5899:	55                   	push   %ebp
    589a:	89 e5                	mov    %esp,%ebp
    589c:	57                   	push   %edi
    589d:	56                   	push   %esi
    589e:	53                   	push   %ebx
    589f:	83 ec 1c             	sub    $0x1c,%esp
	unsigned long val=0;
    58a2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    58a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    58ac:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    58b0:	7e 14                	jle    58c6 <getbits+0x2d>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    58b2:	83 ec 04             	sub    $0x4,%esp
    58b5:	6a 20                	push   $0x20
    58b7:	68 f4 b9 00 00       	push   $0xb9f4
    58bc:	6a 00                	push   $0x0
    58be:	e8 a0 f1 ff ff       	call   4a63 <printf>
    58c3:	83 c4 10             	add    $0x10,%esp

	bs->totbit += N;
    58c6:	8b 45 08             	mov    0x8(%ebp),%eax
    58c9:	8b 50 0c             	mov    0xc(%eax),%edx
    58cc:	8b 45 0c             	mov    0xc(%ebp),%eax
    58cf:	01 c2                	add    %eax,%edx
    58d1:	8b 45 08             	mov    0x8(%ebp),%eax
    58d4:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    58d7:	e9 0d 01 00 00       	jmp    59e9 <getbits+0x150>
		if (!bs->buf_bit_idx) {
    58dc:	8b 45 08             	mov    0x8(%ebp),%eax
    58df:	8b 40 14             	mov    0x14(%eax),%eax
    58e2:	85 c0                	test   %eax,%eax
    58e4:	0f 85 a2 00 00 00    	jne    598c <getbits+0xf3>
			bs->buf_bit_idx = 8;
    58ea:	8b 45 08             	mov    0x8(%ebp),%eax
    58ed:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    58f4:	8b 45 08             	mov    0x8(%ebp),%eax
    58f7:	8b 40 10             	mov    0x10(%eax),%eax
    58fa:	8d 50 ff             	lea    -0x1(%eax),%edx
    58fd:	8b 45 08             	mov    0x8(%ebp),%eax
    5900:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    5903:	8b 45 08             	mov    0x8(%ebp),%eax
    5906:	8b 40 10             	mov    0x10(%eax),%eax
    5909:	83 f8 03             	cmp    $0x3,%eax
    590c:	7e 10                	jle    591e <getbits+0x85>
    590e:	8b 45 08             	mov    0x8(%ebp),%eax
    5911:	8b 50 10             	mov    0x10(%eax),%edx
    5914:	8b 45 08             	mov    0x8(%ebp),%eax
    5917:	8b 40 1c             	mov    0x1c(%eax),%eax
    591a:	39 c2                	cmp    %eax,%edx
    591c:	7d 6e                	jge    598c <getbits+0xf3>
				if (bs->eob)
    591e:	8b 45 08             	mov    0x8(%ebp),%eax
    5921:	8b 40 1c             	mov    0x1c(%eax),%eax
    5924:	85 c0                	test   %eax,%eax
    5926:	74 0c                	je     5934 <getbits+0x9b>
					bs->eobs = TRUE;
    5928:	8b 45 08             	mov    0x8(%ebp),%eax
    592b:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5932:	eb 58                	jmp    598c <getbits+0xf3>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    5934:	8b 45 08             	mov    0x8(%ebp),%eax
    5937:	8b 70 10             	mov    0x10(%eax),%esi
    593a:	eb 2f                	jmp    596b <getbits+0xd2>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    593c:	8b 45 08             	mov    0x8(%ebp),%eax
    593f:	8b 50 04             	mov    0x4(%eax),%edx
    5942:	8b 45 08             	mov    0x8(%ebp),%eax
    5945:	8b 40 08             	mov    0x8(%eax),%eax
    5948:	8d 48 ff             	lea    -0x1(%eax),%ecx
    594b:	8b 45 08             	mov    0x8(%ebp),%eax
    594e:	8b 40 10             	mov    0x10(%eax),%eax
    5951:	29 c1                	sub    %eax,%ecx
    5953:	89 c8                	mov    %ecx,%eax
    5955:	01 f0                	add    %esi,%eax
    5957:	01 c2                	add    %eax,%edx
    5959:	8b 45 08             	mov    0x8(%ebp),%eax
    595c:	8b 40 04             	mov    0x4(%eax),%eax
    595f:	89 f1                	mov    %esi,%ecx
    5961:	01 c8                	add    %ecx,%eax
    5963:	0f b6 00             	movzbl (%eax),%eax
    5966:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    5968:	83 ee 01             	sub    $0x1,%esi
    596b:	85 f6                	test   %esi,%esi
    596d:	79 cd                	jns    593c <getbits+0xa3>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    596f:	83 ec 0c             	sub    $0xc,%esp
    5972:	ff 75 08             	pushl  0x8(%ebp)
    5975:	e8 a7 fd ff ff       	call   5721 <refill_buffer>
    597a:	83 c4 10             	add    $0x10,%esp
					bs->buf_byte_idx = bs->buf_size-1;
    597d:	8b 45 08             	mov    0x8(%ebp),%eax
    5980:	8b 40 08             	mov    0x8(%eax),%eax
    5983:	8d 50 ff             	lea    -0x1(%eax),%edx
    5986:	8b 45 08             	mov    0x8(%ebp),%eax
    5989:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    598c:	8b 45 08             	mov    0x8(%ebp),%eax
    598f:	8b 40 14             	mov    0x14(%eax),%eax
    5992:	39 d8                	cmp    %ebx,%eax
    5994:	0f 4f c3             	cmovg  %ebx,%eax
    5997:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    5999:	8b 45 08             	mov    0x8(%ebp),%eax
    599c:	8b 50 04             	mov    0x4(%eax),%edx
    599f:	8b 45 08             	mov    0x8(%ebp),%eax
    59a2:	8b 40 10             	mov    0x10(%eax),%eax
    59a5:	01 d0                	add    %edx,%eax
    59a7:	0f b6 00             	movzbl (%eax),%eax
    59aa:	0f b6 d0             	movzbl %al,%edx
    59ad:	8b 45 08             	mov    0x8(%ebp),%eax
    59b0:	8b 40 14             	mov    0x14(%eax),%eax
    59b3:	8b 04 85 20 fb 00 00 	mov    0xfb20(,%eax,4),%eax
    59ba:	89 d7                	mov    %edx,%edi
    59bc:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    59be:	8b 45 08             	mov    0x8(%ebp),%eax
    59c1:	8b 40 14             	mov    0x14(%eax),%eax
    59c4:	29 f0                	sub    %esi,%eax
    59c6:	89 c1                	mov    %eax,%ecx
    59c8:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    59ca:	89 d8                	mov    %ebx,%eax
    59cc:	29 f0                	sub    %esi,%eax
    59ce:	89 c1                	mov    %eax,%ecx
    59d0:	d3 e7                	shl    %cl,%edi
    59d2:	89 f8                	mov    %edi,%eax
    59d4:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    59d7:	8b 45 08             	mov    0x8(%ebp),%eax
    59da:	8b 40 14             	mov    0x14(%eax),%eax
    59dd:	29 f0                	sub    %esi,%eax
    59df:	89 c2                	mov    %eax,%edx
    59e1:	8b 45 08             	mov    0x8(%ebp),%eax
    59e4:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    59e7:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    59e9:	85 db                	test   %ebx,%ebx
    59eb:	0f 8f eb fe ff ff    	jg     58dc <getbits+0x43>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    59f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    59f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    59f7:	5b                   	pop    %ebx
    59f8:	5e                   	pop    %esi
    59f9:	5f                   	pop    %edi
    59fa:	5d                   	pop    %ebp
    59fb:	c3                   	ret    

000059fc <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    59fc:	55                   	push   %ebp
    59fd:	89 e5                	mov    %esp,%ebp
    59ff:	83 ec 28             	sub    $0x28,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    5a02:	db 45 10             	fildl  0x10(%ebp)
    5a05:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5a09:	dd 1c 24             	fstpl  (%esp)
    5a0c:	dd 05 60 ba 00 00    	fldl   0xba60
    5a12:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    5a16:	dd 1c 24             	fstpl  (%esp)
    5a19:	e8 0f f5 ff ff       	call   4f2d <pow>
    5a1e:	83 c4 10             	add    $0x10,%esp
    5a21:	d9 7d e6             	fnstcw -0x1a(%ebp)
    5a24:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    5a28:	b4 0c                	mov    $0xc,%ah
    5a2a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    5a2e:	d9 6d e4             	fldcw  -0x1c(%ebp)
    5a31:	db 5d e0             	fistpl -0x20(%ebp)
    5a34:	d9 6d e6             	fldcw  -0x1a(%ebp)
    5a37:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5a3a:	83 e8 01             	sub    $0x1,%eax
    5a3d:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    5a40:	83 ec 0c             	sub    $0xc,%esp
    5a43:	ff 75 08             	pushl  0x8(%ebp)
    5a46:	e8 cb fc ff ff       	call   5716 <sstell>
    5a4b:	83 c4 10             	add    $0x10,%esp
    5a4e:	83 e0 07             	and    $0x7,%eax
    5a51:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    5a54:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5a58:	74 17                	je     5a71 <seek_sync+0x75>
		getbits(bs, (int)(ALIGNING-aligning));
    5a5a:	b8 08 00 00 00       	mov    $0x8,%eax
    5a5f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5a62:	83 ec 08             	sub    $0x8,%esp
    5a65:	50                   	push   %eax
    5a66:	ff 75 08             	pushl  0x8(%ebp)
    5a69:	e8 2b fe ff ff       	call   5899 <getbits>
    5a6e:	83 c4 10             	add    $0x10,%esp

	val = getbits(bs, N);
    5a71:	83 ec 08             	sub    $0x8,%esp
    5a74:	ff 75 10             	pushl  0x10(%ebp)
    5a77:	ff 75 08             	pushl  0x8(%ebp)
    5a7a:	e8 1a fe ff ff       	call   5899 <getbits>
    5a7f:	83 c4 10             	add    $0x10,%esp
    5a82:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    5a85:	eb 17                	jmp    5a9e <seek_sync+0xa2>
		val <<= ALIGNING;
    5a87:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    5a8b:	83 ec 08             	sub    $0x8,%esp
    5a8e:	6a 08                	push   $0x8
    5a90:	ff 75 08             	pushl  0x8(%ebp)
    5a93:	e8 01 fe ff ff       	call   5899 <getbits>
    5a98:	83 c4 10             	add    $0x10,%esp
    5a9b:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    5a9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5aa1:	23 45 f4             	and    -0xc(%ebp),%eax
    5aa4:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5aa7:	74 12                	je     5abb <seek_sync+0xbf>
    5aa9:	83 ec 0c             	sub    $0xc,%esp
    5aac:	ff 75 08             	pushl  0x8(%ebp)
    5aaf:	e8 57 fc ff ff       	call   570b <end_bs>
    5ab4:	83 c4 10             	add    $0x10,%esp
    5ab7:	85 c0                	test   %eax,%eax
    5ab9:	74 cc                	je     5a87 <seek_sync+0x8b>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    5abb:	83 ec 0c             	sub    $0xc,%esp
    5abe:	ff 75 08             	pushl  0x8(%ebp)
    5ac1:	e8 45 fc ff ff       	call   570b <end_bs>
    5ac6:	83 c4 10             	add    $0x10,%esp
    5ac9:	85 c0                	test   %eax,%eax
    5acb:	74 07                	je     5ad4 <seek_sync+0xd8>
		return(0);
    5acd:	b8 00 00 00 00       	mov    $0x0,%eax
    5ad2:	eb 05                	jmp    5ad9 <seek_sync+0xdd>
	else
		return(1);
    5ad4:	b8 01 00 00 00       	mov    $0x1,%eax
}
    5ad9:	c9                   	leave  
    5ada:	c3                   	ret    

00005adb <js_bound>:

int js_bound(int lay, int m_ext)
{
    5adb:	55                   	push   %ebp
    5adc:	89 e5                	mov    %esp,%ebp
    5ade:	83 ec 08             	sub    $0x8,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    5ae1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5ae5:	7e 12                	jle    5af9 <js_bound+0x1e>
    5ae7:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    5aeb:	7f 0c                	jg     5af9 <js_bound+0x1e>
    5aed:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5af1:	78 06                	js     5af9 <js_bound+0x1e>
    5af3:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    5af7:	7e 1a                	jle    5b13 <js_bound+0x38>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    5af9:	ff 75 0c             	pushl  0xc(%ebp)
    5afc:	ff 75 08             	pushl  0x8(%ebp)
    5aff:	68 28 ba 00 00       	push   $0xba28
    5b04:	6a 00                	push   $0x0
    5b06:	e8 58 ef ff ff       	call   4a63 <printf>
    5b0b:	83 c4 10             	add    $0x10,%esp
        exit();
    5b0e:	e8 73 ed ff ff       	call   4886 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    5b13:	8b 45 08             	mov    0x8(%ebp),%eax
    5b16:	83 e8 01             	sub    $0x1,%eax
    5b19:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    5b20:	8b 45 0c             	mov    0xc(%ebp),%eax
    5b23:	01 d0                	add    %edx,%eax
    5b25:	8b 04 85 60 fb 00 00 	mov    0xfb60(,%eax,4),%eax
}
    5b2c:	c9                   	leave  
    5b2d:	c3                   	ret    

00005b2e <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    5b2e:	55                   	push   %ebp
    5b2f:	89 e5                	mov    %esp,%ebp
    5b31:	83 ec 18             	sub    $0x18,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    5b34:	8b 45 08             	mov    0x8(%ebp),%eax
    5b37:	8b 00                	mov    (%eax),%eax
    5b39:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    5b3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b3f:	8b 50 1c             	mov    0x1c(%eax),%edx
    5b42:	8b 45 08             	mov    0x8(%ebp),%eax
    5b45:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    5b48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b4b:	8b 40 1c             	mov    0x1c(%eax),%eax
    5b4e:	83 f8 03             	cmp    $0x3,%eax
    5b51:	75 07                	jne    5b5a <hdr_to_frps+0x2c>
    5b53:	ba 01 00 00 00       	mov    $0x1,%edx
    5b58:	eb 05                	jmp    5b5f <hdr_to_frps+0x31>
    5b5a:	ba 02 00 00 00       	mov    $0x2,%edx
    5b5f:	8b 45 08             	mov    0x8(%ebp),%eax
    5b62:	89 50 08             	mov    %edx,0x8(%eax)
	fr_ps->sblimit = SBLIMIT;
    5b65:	8b 45 08             	mov    0x8(%ebp),%eax
    5b68:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    5b6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b72:	8b 40 1c             	mov    0x1c(%eax),%eax
    5b75:	83 f8 01             	cmp    $0x1,%eax
    5b78:	75 23                	jne    5b9d <hdr_to_frps+0x6f>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    5b7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b7d:	8b 50 20             	mov    0x20(%eax),%edx
    5b80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b83:	8b 40 04             	mov    0x4(%eax),%eax
    5b86:	83 ec 08             	sub    $0x8,%esp
    5b89:	52                   	push   %edx
    5b8a:	50                   	push   %eax
    5b8b:	e8 4b ff ff ff       	call   5adb <js_bound>
    5b90:	83 c4 10             	add    $0x10,%esp
    5b93:	89 c2                	mov    %eax,%edx
    5b95:	8b 45 08             	mov    0x8(%ebp),%eax
    5b98:	89 50 0c             	mov    %edx,0xc(%eax)
    5b9b:	eb 0c                	jmp    5ba9 <hdr_to_frps+0x7b>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    5b9d:	8b 45 08             	mov    0x8(%ebp),%eax
    5ba0:	8b 50 10             	mov    0x10(%eax),%edx
    5ba3:	8b 45 08             	mov    0x8(%ebp),%eax
    5ba6:	89 50 0c             	mov    %edx,0xc(%eax)
}
    5ba9:	c9                   	leave  
    5baa:	c3                   	ret    

00005bab <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    5bab:	55                   	push   %ebp
    5bac:	89 e5                	mov    %esp,%ebp
    5bae:	83 ec 08             	sub    $0x8,%esp
	if (N != 8) {
    5bb1:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    5bb5:	74 17                	je     5bce <hputbuf+0x23>
		printf(0,"Not Supported yet!!\n");
    5bb7:	83 ec 08             	sub    $0x8,%esp
    5bba:	68 4b ba 00 00       	push   $0xba4b
    5bbf:	6a 00                	push   $0x0
    5bc1:	e8 9d ee ff ff       	call   4a63 <printf>
    5bc6:	83 c4 10             	add    $0x10,%esp
		exit();
    5bc9:	e8 b8 ec ff ff       	call   4886 <exit>
	}
	getCoreBuf(1, val);
    5bce:	83 ec 08             	sub    $0x8,%esp
    5bd1:	ff 75 08             	pushl  0x8(%ebp)
    5bd4:	6a 01                	push   $0x1
    5bd6:	e8 ab ed ff ff       	call   4986 <getCoreBuf>
    5bdb:	83 c4 10             	add    $0x10,%esp
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    5bde:	c9                   	leave  
    5bdf:	c3                   	ret    

00005be0 <hsstell>:

unsigned long hsstell()
{
    5be0:	55                   	push   %ebp
    5be1:	89 e5                	mov    %esp,%ebp
    5be3:	83 ec 08             	sub    $0x8,%esp
	return getCoreBuf(2, 0);
    5be6:	83 ec 08             	sub    $0x8,%esp
    5be9:	6a 00                	push   $0x0
    5beb:	6a 02                	push   $0x2
    5bed:	e8 94 ed ff ff       	call   4986 <getCoreBuf>
    5bf2:	83 c4 10             	add    $0x10,%esp
//	return(totbit);
}
    5bf5:	c9                   	leave  
    5bf6:	c3                   	ret    

00005bf7 <hgetbits>:

unsigned long hgetbits(int N)
{
    5bf7:	55                   	push   %ebp
    5bf8:	89 e5                	mov    %esp,%ebp
    5bfa:	83 ec 08             	sub    $0x8,%esp

	return getCoreBuf(3, N);
    5bfd:	83 ec 08             	sub    $0x8,%esp
    5c00:	ff 75 08             	pushl  0x8(%ebp)
    5c03:	6a 03                	push   $0x3
    5c05:	e8 7c ed ff ff       	call   4986 <getCoreBuf>
    5c0a:	83 c4 10             	add    $0x10,%esp
}
    5c0d:	c9                   	leave  
    5c0e:	c3                   	ret    

00005c0f <hget1bit>:


unsigned int hget1bit()
{
    5c0f:	55                   	push   %ebp
    5c10:	89 e5                	mov    %esp,%ebp
    5c12:	83 ec 08             	sub    $0x8,%esp
	return(hgetbits(1));
    5c15:	83 ec 0c             	sub    $0xc,%esp
    5c18:	6a 01                	push   $0x1
    5c1a:	e8 d8 ff ff ff       	call   5bf7 <hgetbits>
    5c1f:	83 c4 10             	add    $0x10,%esp
}
    5c22:	c9                   	leave  
    5c23:	c3                   	ret    

00005c24 <rewindNbits>:


void rewindNbits(int N)
{
    5c24:	55                   	push   %ebp
    5c25:	89 e5                	mov    %esp,%ebp
    5c27:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(4, N);
    5c2a:	83 ec 08             	sub    $0x8,%esp
    5c2d:	ff 75 08             	pushl  0x8(%ebp)
    5c30:	6a 04                	push   $0x4
    5c32:	e8 4f ed ff ff       	call   4986 <getCoreBuf>
    5c37:	83 c4 10             	add    $0x10,%esp
}
    5c3a:	c9                   	leave  
    5c3b:	c3                   	ret    

00005c3c <rewindNbytes>:


void rewindNbytes(int N)
{
    5c3c:	55                   	push   %ebp
    5c3d:	89 e5                	mov    %esp,%ebp
    5c3f:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(5, N);
    5c42:	83 ec 08             	sub    $0x8,%esp
    5c45:	ff 75 08             	pushl  0x8(%ebp)
    5c48:	6a 05                	push   $0x5
    5c4a:	e8 37 ed ff ff       	call   4986 <getCoreBuf>
    5c4f:	83 c4 10             	add    $0x10,%esp
}
    5c52:	c9                   	leave  
    5c53:	c3                   	ret    

00005c54 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    5c54:	55                   	push   %ebp
    5c55:	89 e5                	mov    %esp,%ebp
    5c57:	57                   	push   %edi
    5c58:	56                   	push   %esi
    5c59:	53                   	push   %ebx
    5c5a:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    5c60:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    5c64:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    5c68:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    5c6c:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    5c70:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    5c74:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    5c78:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    5c7c:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    5c80:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    5c84:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    5c88:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    5c8c:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    5c90:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    5c94:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5c98:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    5c9c:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    5ca0:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    5ca4:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    5ca8:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    5cac:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    5cb0:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    5cb4:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    5cb8:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    5cbc:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    5cc0:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    5cc4:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    5cc8:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    5ccc:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    5cd0:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    5cd4:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    5cd8:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    5cdc:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    5ce0:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    5ce4:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    5ce8:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    5cec:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    5cf0:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    5cf4:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    5cf8:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    5cfc:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    5d00:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    5d04:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    5d08:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    5d0c:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    5d10:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    5d14:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    5d18:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    5d1c:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5d20:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    5d24:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    5d28:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    5d2c:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    5d30:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    5d34:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    5d38:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    5d3c:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    5d40:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    5d44:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    5d48:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    5d4c:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    5d50:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    5d54:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    5d58:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    5d5c:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    5d60:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    5d64:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    5d68:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    5d6c:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    5d70:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    5d74:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    5d78:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    5d7c:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    5d80:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    5d84:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    5d88:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    5d8c:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    5d90:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    5d94:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    5d98:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    5d9c:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    5da0:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    5da4:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    5da8:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    5daf:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    5db6:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    5dbd:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    5dc4:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    5dcb:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    5dd2:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    5dd9:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    5de0:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    5de7:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    5dee:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    5df5:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    5dfc:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    5e03:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    5e0a:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    5e11:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    5e18:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    5e1f:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    5e26:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    5e2d:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    5e34:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    5e3b:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    5e42:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    5e49:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    5e50:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    5e57:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    5e5e:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    5e65:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    5e6c:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    5e70:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    5e74:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    5e78:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    5e7c:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    5e80:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    5e84:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    5e88:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    5e8c:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    5e90:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    5e94:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    5e98:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    5e9c:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    5ea0:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    5ea4:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    5ea8:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    5eac:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    5eb0:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    5eb4:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    5eb8:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    5ebc:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    5ec0:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    5ec4:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    5ec8:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    5ecc:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    5ed0:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    5ed4:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    5ed8:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    5edc:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    5ee0:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    5ee4:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    5ee8:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    5eec:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    5ef0:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    5ef4:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    5efb:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    5f02:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    5f09:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    5f10:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    5f17:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    5f1e:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    5f25:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    5f2c:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    5f33:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    5f3a:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    5f41:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    5f48:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    5f4f:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    5f56:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    5f5d:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    5f64:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    5f6b:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    5f72:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    5f79:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    5f80:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    5f87:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    5f8e:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    5f95:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    5f9c:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    5fa3:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    5faa:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    5fb1:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    5fb8:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    5fbf:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    5fc6:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    5fcd:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    5fd4:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    5fdb:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    5fe2:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    5fe9:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    5ff0:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    5ff7:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    5ffe:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    6005:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    600c:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    6013:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    601a:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    6021:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    6028:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    602f:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    6036:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    603d:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    6044:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    604b:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    6052:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    6059:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    6060:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    6067:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    606e:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    6075:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    607c:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    6083:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    608a:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    6091:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    6098:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    609f:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    60a6:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    60ac:	ba 80 ba 00 00       	mov    $0xba80,%edx
    60b1:	b9 23 00 00 00       	mov    $0x23,%ecx
    60b6:	89 c7                	mov    %eax,%edi
    60b8:	89 d6                	mov    %edx,%esi
    60ba:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    60bc:	89 f2                	mov    %esi,%edx
    60be:	89 f8                	mov    %edi,%eax
    60c0:	0f b7 0a             	movzwl (%edx),%ecx
    60c3:	66 89 08             	mov    %cx,(%eax)
    60c6:	8d 40 02             	lea    0x2(%eax),%eax
    60c9:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    60cc:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    60d2:	bb 40 bb 00 00       	mov    $0xbb40,%ebx
    60d7:	ba 8e 00 00 00       	mov    $0x8e,%edx
    60dc:	8b 0b                	mov    (%ebx),%ecx
    60de:	89 08                	mov    %ecx,(%eax)
    60e0:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    60e4:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    60e8:	8d 78 04             	lea    0x4(%eax),%edi
    60eb:	83 e7 fc             	and    $0xfffffffc,%edi
    60ee:	29 f8                	sub    %edi,%eax
    60f0:	29 c3                	sub    %eax,%ebx
    60f2:	01 c2                	add    %eax,%edx
    60f4:	83 e2 fc             	and    $0xfffffffc,%edx
    60f7:	89 d0                	mov    %edx,%eax
    60f9:	c1 e8 02             	shr    $0x2,%eax
    60fc:	89 de                	mov    %ebx,%esi
    60fe:	89 c1                	mov    %eax,%ecx
    6100:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    6102:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    6108:	ba 00 bc 00 00       	mov    $0xbc00,%edx
    610d:	b9 23 00 00 00       	mov    $0x23,%ecx
    6112:	89 c7                	mov    %eax,%edi
    6114:	89 d6                	mov    %edx,%esi
    6116:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6118:	89 f2                	mov    %esi,%edx
    611a:	89 f8                	mov    %edi,%eax
    611c:	0f b7 0a             	movzwl (%edx),%ecx
    611f:	66 89 08             	mov    %cx,(%eax)
    6122:	8d 40 02             	lea    0x2(%eax),%eax
    6125:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    6128:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    612e:	bb c0 bc 00 00       	mov    $0xbcc0,%ebx
    6133:	ba fe 00 00 00       	mov    $0xfe,%edx
    6138:	8b 0b                	mov    (%ebx),%ecx
    613a:	89 08                	mov    %ecx,(%eax)
    613c:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    6140:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    6144:	8d 78 04             	lea    0x4(%eax),%edi
    6147:	83 e7 fc             	and    $0xfffffffc,%edi
    614a:	29 f8                	sub    %edi,%eax
    614c:	29 c3                	sub    %eax,%ebx
    614e:	01 c2                	add    %eax,%edx
    6150:	83 e2 fc             	and    $0xfffffffc,%edx
    6153:	89 d0                	mov    %edx,%eax
    6155:	c1 e8 02             	shr    $0x2,%eax
    6158:	89 de                	mov    %ebx,%esi
    615a:	89 c1                	mov    %eax,%ecx
    615c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    615e:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    6164:	ba c0 bd 00 00       	mov    $0xbdc0,%edx
    6169:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    616e:	89 c7                	mov    %eax,%edi
    6170:	89 d6                	mov    %edx,%esi
    6172:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6174:	89 f2                	mov    %esi,%edx
    6176:	89 f8                	mov    %edi,%eax
    6178:	0f b7 0a             	movzwl (%edx),%ecx
    617b:	66 89 08             	mov    %cx,(%eax)
    617e:	8d 40 02             	lea    0x2(%eax),%eax
    6181:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    6184:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    618a:	bb c0 be 00 00       	mov    $0xbec0,%ebx
    618f:	ba fe 00 00 00       	mov    $0xfe,%edx
    6194:	8b 0b                	mov    (%ebx),%ecx
    6196:	89 08                	mov    %ecx,(%eax)
    6198:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    619c:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    61a0:	8d 78 04             	lea    0x4(%eax),%edi
    61a3:	83 e7 fc             	and    $0xfffffffc,%edi
    61a6:	29 f8                	sub    %edi,%eax
    61a8:	29 c3                	sub    %eax,%ebx
    61aa:	01 c2                	add    %eax,%edx
    61ac:	83 e2 fc             	and    $0xfffffffc,%edx
    61af:	89 d0                	mov    %edx,%eax
    61b1:	c1 e8 02             	shr    $0x2,%eax
    61b4:	89 de                	mov    %ebx,%esi
    61b6:	89 c1                	mov    %eax,%ecx
    61b8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    61ba:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    61c0:	ba c0 bf 00 00       	mov    $0xbfc0,%edx
    61c5:	b9 ff 00 00 00       	mov    $0xff,%ecx
    61ca:	89 c7                	mov    %eax,%edi
    61cc:	89 d6                	mov    %edx,%esi
    61ce:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    61d0:	89 f2                	mov    %esi,%edx
    61d2:	89 f8                	mov    %edi,%eax
    61d4:	0f b7 0a             	movzwl (%edx),%ecx
    61d7:	66 89 08             	mov    %cx,(%eax)
    61da:	8d 40 02             	lea    0x2(%eax),%eax
    61dd:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    61e0:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    61e6:	bb c0 c3 00 00       	mov    $0xc3c0,%ebx
    61eb:	ba fe 03 00 00       	mov    $0x3fe,%edx
    61f0:	8b 0b                	mov    (%ebx),%ecx
    61f2:	89 08                	mov    %ecx,(%eax)
    61f4:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    61f8:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    61fc:	8d 78 04             	lea    0x4(%eax),%edi
    61ff:	83 e7 fc             	and    $0xfffffffc,%edi
    6202:	29 f8                	sub    %edi,%eax
    6204:	29 c3                	sub    %eax,%ebx
    6206:	01 c2                	add    %eax,%edx
    6208:	83 e2 fc             	and    $0xfffffffc,%edx
    620b:	89 d0                	mov    %edx,%eax
    620d:	c1 e8 02             	shr    $0x2,%eax
    6210:	89 de                	mov    %ebx,%esi
    6212:	89 c1                	mov    %eax,%ecx
    6214:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    6216:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    621c:	ba c0 c7 00 00       	mov    $0xc7c0,%edx
    6221:	b9 ff 00 00 00       	mov    $0xff,%ecx
    6226:	89 c7                	mov    %eax,%edi
    6228:	89 d6                	mov    %edx,%esi
    622a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    622c:	89 f2                	mov    %esi,%edx
    622e:	89 f8                	mov    %edi,%eax
    6230:	0f b7 0a             	movzwl (%edx),%ecx
    6233:	66 89 08             	mov    %cx,(%eax)
    6236:	8d 40 02             	lea    0x2(%eax),%eax
    6239:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    623c:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6242:	bb c0 cb 00 00       	mov    $0xcbc0,%ebx
    6247:	ba 00 01 00 00       	mov    $0x100,%edx
    624c:	89 c7                	mov    %eax,%edi
    624e:	89 de                	mov    %ebx,%esi
    6250:	89 d1                	mov    %edx,%ecx
    6252:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    6254:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    625b:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    6262:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    6269:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    6270:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    6277:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    627e:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    6285:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    628c:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    6293:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    629a:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    62a1:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    62a8:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    62af:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    62b6:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    62bd:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    62c4:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    62cb:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    62d2:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    62d9:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    62e0:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    62e7:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    62ee:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    62f5:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    62fc:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    6303:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    630a:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    6311:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    6318:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    631f:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    6326:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    632d:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    6334:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    633b:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    6342:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    6349:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    6350:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    6357:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    635e:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    6365:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    636c:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    6373:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    637a:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    6381:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    6388:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    638f:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    6396:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    639d:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    63a4:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    63ab:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    63b2:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    63b9:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    63c0:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    63c7:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    63ce:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    63d5:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    63dc:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    63e3:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    63ea:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    63f1:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    63f8:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    63ff:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    6406:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    640d:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    6414:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    641b:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    6422:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    6429:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    6430:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    6437:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    643e:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    6445:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    644c:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    6453:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    645a:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    6461:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    6468:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    646f:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    6476:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    647d:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    6484:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    648b:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    6492:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    6499:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    64a0:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    64a7:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    64ae:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    64b5:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    64bc:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    64c3:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    64ca:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    64d1:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    64d8:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    64df:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    64e6:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    64ed:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    64f4:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    64fb:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    6502:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    6509:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    6510:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    6517:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    651e:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    6525:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    652c:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    6533:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    653a:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    6541:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    6548:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    654f:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    6556:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    655d:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    6564:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    656b:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    6572:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    6579:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    6580:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    6587:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    658e:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    6595:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    659c:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    65a3:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    65aa:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    65b1:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    65b8:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    65bf:	30 00 
    65c1:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    65c8:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    65cf:	00 00 00 
    65d2:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    65d9:	00 00 00 
    65dc:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    65e3:	00 00 00 
    65e6:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    65ed:	00 00 00 
    65f0:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    65f7:	ff ff ff 
    65fa:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    6601:	00 00 00 
    6604:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    660b:	00 00 00 
    660e:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    6615:	00 00 00 
    6618:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    661f:	00 00 00 
    6622:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    6629:	31 00 
    662b:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    6632:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    6639:	00 00 00 
    663c:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    6643:	00 00 00 
    6646:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    664d:	00 00 00 
    6650:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    6657:	00 00 00 
    665a:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    6661:	ff ff ff 
    6664:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    666b:	00 00 00 
    666e:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    6675:	00 00 00 
    6678:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    667b:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    6681:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    6688:	00 00 00 
    668b:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    6692:	32 00 
    6694:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    669b:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    66a2:	00 00 00 
    66a5:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    66ac:	00 00 00 
    66af:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    66b6:	00 00 00 
    66b9:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    66c0:	00 00 00 
    66c3:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    66ca:	ff ff ff 
    66cd:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    66d4:	00 00 00 
    66d7:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    66de:	00 00 00 
    66e1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    66e4:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    66ea:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    66f1:	00 00 00 
    66f4:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    66fb:	33 00 
    66fd:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    6704:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    670b:	00 00 00 
    670e:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    6715:	00 00 00 
    6718:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    671f:	00 00 00 
    6722:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    6729:	00 00 00 
    672c:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    6733:	ff ff ff 
    6736:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    673d:	00 00 00 
    6740:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    6747:	00 00 00 
    674a:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    674d:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    6753:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    675a:	00 00 00 
    675d:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    6764:	34 00 
    6766:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    676d:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    6774:	00 00 00 
    6777:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    677e:	00 00 00 
    6781:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    6788:	00 00 00 
    678b:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    6792:	00 00 00 
    6795:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    679c:	ff ff ff 
    679f:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    67a6:	00 00 00 
    67a9:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    67b0:	00 00 00 
    67b3:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    67ba:	00 00 00 
    67bd:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    67c4:	00 00 00 
    67c7:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    67ce:	35 00 
    67d0:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    67d7:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    67de:	00 00 00 
    67e1:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    67e8:	00 00 00 
    67eb:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    67f2:	00 00 00 
    67f5:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    67fc:	00 00 00 
    67ff:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    6806:	ff ff ff 
    6809:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    6810:	00 00 00 
    6813:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    681a:	00 00 00 
    681d:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    6823:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    6829:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    6830:	00 00 00 
    6833:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    683a:	36 00 
    683c:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    6843:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    684a:	00 00 00 
    684d:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    6854:	00 00 00 
    6857:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    685e:	00 00 00 
    6861:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    6868:	00 00 00 
    686b:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    6872:	ff ff ff 
    6875:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    687c:	00 00 00 
    687f:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    6886:	00 00 00 
    6889:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    688f:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    6895:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    689c:	00 00 00 
    689f:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    68a6:	37 00 
    68a8:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    68af:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    68b6:	00 00 00 
    68b9:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    68c0:	00 00 00 
    68c3:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    68ca:	00 00 00 
    68cd:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    68d4:	00 00 00 
    68d7:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    68de:	ff ff ff 
    68e1:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    68e8:	00 00 00 
    68eb:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    68f2:	00 00 00 
    68f5:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    68fb:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    6901:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    6908:	00 00 00 
    690b:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    6912:	38 00 
    6914:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    691b:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    6922:	00 00 00 
    6925:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    692c:	00 00 00 
    692f:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    6936:	00 00 00 
    6939:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    6940:	00 00 00 
    6943:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    694a:	ff ff ff 
    694d:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    6954:	00 00 00 
    6957:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    695e:	00 00 00 
    6961:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    6967:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    696d:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    6974:	00 00 00 
    6977:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    697e:	39 00 
    6980:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    6987:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    698e:	00 00 00 
    6991:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    6998:	00 00 00 
    699b:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    69a2:	00 00 00 
    69a5:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    69ac:	00 00 00 
    69af:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    69b6:	ff ff ff 
    69b9:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    69c0:	00 00 00 
    69c3:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    69ca:	00 00 00 
    69cd:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    69d3:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    69d9:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    69e0:	00 00 00 
    69e3:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    69ea:	31 30 
    69ec:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    69f3:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    69fa:	00 00 00 
    69fd:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    6a04:	00 00 00 
    6a07:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    6a0e:	00 00 00 
    6a11:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    6a18:	00 00 00 
    6a1b:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    6a22:	ff ff ff 
    6a25:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    6a2c:	00 00 00 
    6a2f:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    6a36:	00 00 00 
    6a39:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    6a3f:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    6a45:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    6a4c:	00 00 00 
    6a4f:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    6a56:	31 31 
    6a58:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    6a5f:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    6a66:	00 00 00 
    6a69:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    6a70:	00 00 00 
    6a73:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    6a7a:	00 00 00 
    6a7d:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    6a84:	00 00 00 
    6a87:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    6a8e:	ff ff ff 
    6a91:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    6a98:	00 00 00 
    6a9b:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    6aa2:	00 00 00 
    6aa5:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    6aab:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    6ab1:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    6ab8:	00 00 00 
    6abb:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    6ac2:	31 32 
    6ac4:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    6acb:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    6ad2:	00 00 00 
    6ad5:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    6adc:	00 00 00 
    6adf:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    6ae6:	00 00 00 
    6ae9:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    6af0:	00 00 00 
    6af3:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    6afa:	ff ff ff 
    6afd:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    6b04:	00 00 00 
    6b07:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    6b0e:	00 00 00 
    6b11:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    6b17:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    6b1d:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    6b24:	00 00 00 
    6b27:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    6b2e:	31 33 
    6b30:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    6b37:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    6b3e:	00 00 00 
    6b41:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    6b48:	00 00 00 
    6b4b:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    6b52:	00 00 00 
    6b55:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    6b5c:	00 00 00 
    6b5f:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    6b66:	ff ff ff 
    6b69:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    6b70:	00 00 00 
    6b73:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    6b7a:	00 00 00 
    6b7d:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    6b83:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    6b89:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    6b90:	01 00 00 
    6b93:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    6b9a:	31 34 
    6b9c:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    6ba3:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    6baa:	00 00 00 
    6bad:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    6bb4:	00 00 00 
    6bb7:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    6bbe:	00 00 00 
    6bc1:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    6bc8:	00 00 00 
    6bcb:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    6bd2:	ff ff ff 
    6bd5:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    6bdc:	00 00 00 
    6bdf:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    6be6:	00 00 00 
    6be9:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    6bf0:	00 00 00 
    6bf3:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    6bfa:	00 00 00 
    6bfd:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    6c04:	31 35 
    6c06:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    6c0d:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    6c14:	00 00 00 
    6c17:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    6c1e:	00 00 00 
    6c21:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    6c28:	00 00 00 
    6c2b:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    6c32:	00 00 00 
    6c35:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    6c3c:	ff ff ff 
    6c3f:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    6c46:	00 00 00 
    6c49:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    6c50:	00 00 00 
    6c53:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    6c59:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    6c5f:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    6c66:	01 00 00 
    6c69:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    6c70:	31 36 
    6c72:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    6c79:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    6c80:	00 00 00 
    6c83:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    6c8a:	00 00 00 
    6c8d:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    6c94:	00 00 00 
    6c97:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    6c9e:	00 00 00 
    6ca1:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    6ca8:	ff ff ff 
    6cab:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    6cb2:	00 00 00 
    6cb5:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    6cbc:	00 00 00 
    6cbf:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6cc5:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    6ccb:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    6cd2:	01 00 00 
    6cd5:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    6cdc:	31 37 
    6cde:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    6ce5:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    6cec:	00 00 00 
    6cef:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    6cf6:	00 00 00 
    6cf9:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    6d00:	00 00 00 
    6d03:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    6d0a:	00 00 00 
    6d0d:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    6d14:	00 00 00 
    6d17:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    6d1e:	00 00 00 
    6d21:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    6d28:	00 00 00 
    6d2b:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6d31:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    6d37:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    6d3e:	01 00 00 
    6d41:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    6d48:	31 38 
    6d4a:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    6d51:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    6d58:	00 00 00 
    6d5b:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    6d62:	00 00 00 
    6d65:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    6d6c:	00 00 00 
    6d6f:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    6d76:	00 00 00 
    6d79:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    6d80:	00 00 00 
    6d83:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    6d8a:	00 00 00 
    6d8d:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    6d94:	00 00 00 
    6d97:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6d9d:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    6da3:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    6daa:	01 00 00 
    6dad:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    6db4:	31 39 
    6db6:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    6dbd:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    6dc4:	00 00 00 
    6dc7:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    6dce:	00 00 00 
    6dd1:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    6dd8:	00 00 00 
    6ddb:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    6de2:	00 00 00 
    6de5:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    6dec:	00 00 00 
    6def:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    6df6:	00 00 00 
    6df9:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    6e00:	00 00 00 
    6e03:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6e09:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    6e0f:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    6e16:	01 00 00 
    6e19:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    6e20:	32 30 
    6e22:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    6e29:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    6e30:	00 00 00 
    6e33:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    6e3a:	00 00 00 
    6e3d:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    6e44:	00 00 00 
    6e47:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    6e4e:	00 00 00 
    6e51:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    6e58:	00 00 00 
    6e5b:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    6e62:	00 00 00 
    6e65:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    6e6c:	00 00 00 
    6e6f:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6e75:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    6e7b:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    6e82:	01 00 00 
    6e85:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    6e8c:	32 31 
    6e8e:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    6e95:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    6e9c:	00 00 00 
    6e9f:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    6ea6:	00 00 00 
    6ea9:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    6eb0:	00 00 00 
    6eb3:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    6eba:	00 00 00 
    6ebd:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    6ec4:	00 00 00 
    6ec7:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    6ece:	00 00 00 
    6ed1:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    6ed8:	00 00 00 
    6edb:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6ee1:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    6ee7:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    6eee:	01 00 00 
    6ef1:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    6ef8:	32 32 
    6efa:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    6f01:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    6f08:	00 00 00 
    6f0b:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    6f12:	00 00 00 
    6f15:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    6f1c:	00 00 00 
    6f1f:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    6f26:	03 00 00 
    6f29:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    6f30:	00 00 00 
    6f33:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    6f3a:	00 00 00 
    6f3d:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    6f44:	00 00 00 
    6f47:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6f4d:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    6f53:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    6f5a:	01 00 00 
    6f5d:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    6f64:	32 33 
    6f66:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    6f6d:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    6f74:	00 00 00 
    6f77:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    6f7e:	00 00 00 
    6f81:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    6f88:	00 00 00 
    6f8b:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    6f92:	1f 00 00 
    6f95:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    6f9c:	00 00 00 
    6f9f:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    6fa6:	00 00 00 
    6fa9:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    6fb0:	00 00 00 
    6fb3:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6fb9:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    6fbf:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    6fc6:	01 00 00 
    6fc9:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    6fd0:	32 34 
    6fd2:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    6fd9:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    6fe0:	00 00 00 
    6fe3:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    6fea:	00 00 00 
    6fed:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    6ff4:	00 00 00 
    6ff7:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    6ffe:	00 00 00 
    7001:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    7008:	ff ff ff 
    700b:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    7012:	00 00 00 
    7015:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    701c:	00 00 00 
    701f:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7025:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    702b:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    7032:	02 00 00 
    7035:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    703c:	32 35 
    703e:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    7045:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    704c:	00 00 00 
    704f:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    7056:	00 00 00 
    7059:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    7060:	00 00 00 
    7063:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    706a:	00 00 00 
    706d:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    7074:	00 00 00 
    7077:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    707e:	00 00 00 
    7081:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    7088:	00 00 00 
    708b:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7091:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    7097:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    709e:	02 00 00 
    70a1:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    70a8:	32 36 
    70aa:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    70b1:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    70b8:	00 00 00 
    70bb:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    70c2:	00 00 00 
    70c5:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    70cc:	00 00 00 
    70cf:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    70d6:	00 00 00 
    70d9:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    70e0:	00 00 00 
    70e3:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    70ea:	00 00 00 
    70ed:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    70f4:	00 00 00 
    70f7:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    70fd:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    7103:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    710a:	02 00 00 
    710d:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    7114:	32 37 
    7116:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    711d:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    7124:	00 00 00 
    7127:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    712e:	00 00 00 
    7131:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    7138:	00 00 00 
    713b:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    7142:	00 00 00 
    7145:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    714c:	00 00 00 
    714f:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    7156:	00 00 00 
    7159:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    7160:	00 00 00 
    7163:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7169:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    716f:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    7176:	02 00 00 
    7179:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    7180:	32 38 
    7182:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    7189:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    7190:	00 00 00 
    7193:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    719a:	00 00 00 
    719d:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    71a4:	00 00 00 
    71a7:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    71ae:	00 00 00 
    71b1:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    71b8:	00 00 00 
    71bb:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    71c2:	00 00 00 
    71c5:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    71cc:	00 00 00 
    71cf:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    71d5:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    71db:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    71e2:	02 00 00 
    71e5:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    71ec:	32 39 
    71ee:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    71f5:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    71fc:	00 00 00 
    71ff:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    7206:	00 00 00 
    7209:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    7210:	00 00 00 
    7213:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    721a:	01 00 00 
    721d:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    7224:	00 00 00 
    7227:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    722e:	00 00 00 
    7231:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    7238:	00 00 00 
    723b:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7241:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    7247:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    724e:	02 00 00 
    7251:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    7258:	33 30 
    725a:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    7261:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    7268:	00 00 00 
    726b:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    7272:	00 00 00 
    7275:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    727c:	00 00 00 
    727f:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    7286:	07 00 00 
    7289:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    7290:	00 00 00 
    7293:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    729a:	00 00 00 
    729d:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    72a4:	00 00 00 
    72a7:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    72ad:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    72b3:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    72ba:	02 00 00 
    72bd:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    72c4:	33 31 
    72c6:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    72cd:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    72d4:	00 00 00 
    72d7:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    72de:	00 00 00 
    72e1:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    72e8:	00 00 00 
    72eb:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    72f2:	1f 00 00 
    72f5:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    72fc:	00 00 00 
    72ff:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    7306:	00 00 00 
    7309:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    7310:	00 00 00 
    7313:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    7319:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    731f:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    7326:	02 00 00 
    7329:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    7330:	33 32 
    7332:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    7339:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    7340:	00 00 00 
    7343:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    734a:	00 00 00 
    734d:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    7354:	00 00 00 
    7357:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    735e:	00 00 00 
    7361:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    7368:	ff ff ff 
    736b:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    7372:	00 00 00 
    7375:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    737c:	00 00 00 
    737f:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    7385:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    738b:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    7392:	00 00 00 
    7395:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    739c:	33 33 
    739e:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    73a5:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    73ac:	00 00 00 
    73af:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    73b6:	00 00 00 
    73b9:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    73c0:	00 00 00 
    73c3:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    73ca:	00 00 00 
    73cd:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    73d4:	ff ff ff 
    73d7:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    73de:	00 00 00 
    73e1:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    73e8:	00 00 00 
    73eb:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    73f1:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    73f7:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    73fe:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    7401:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    7407:	5b                   	pop    %ebx
    7408:	5e                   	pop    %esi
    7409:	5f                   	pop    %edi
    740a:	5d                   	pop    %ebp
    740b:	c3                   	ret    

0000740c <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    740c:	55                   	push   %ebp
    740d:	89 e5                	mov    %esp,%ebp
    740f:	83 ec 18             	sub    $0x18,%esp
  HUFFBITS level;
  int point = 0;
    7412:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    7419:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    7420:	a1 90 fb 00 00       	mov    0xfb90,%eax
    7425:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    7428:	8b 45 08             	mov    0x8(%ebp),%eax
    742b:	8b 40 20             	mov    0x20(%eax),%eax
    742e:	85 c0                	test   %eax,%eax
    7430:	75 0a                	jne    743c <huffman_decoder+0x30>
    7432:	b8 02 00 00 00       	mov    $0x2,%eax
    7437:	e9 15 03 00 00       	jmp    7751 <huffman_decoder+0x345>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    743c:	8b 45 08             	mov    0x8(%ebp),%eax
    743f:	8b 40 24             	mov    0x24(%eax),%eax
    7442:	85 c0                	test   %eax,%eax
    7444:	75 1d                	jne    7463 <huffman_decoder+0x57>
  {  *x = *y = 0;
    7446:	8b 45 10             	mov    0x10(%ebp),%eax
    7449:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    744f:	8b 45 10             	mov    0x10(%ebp),%eax
    7452:	8b 10                	mov    (%eax),%edx
    7454:	8b 45 0c             	mov    0xc(%ebp),%eax
    7457:	89 10                	mov    %edx,(%eax)
     return 0;
    7459:	b8 00 00 00 00       	mov    $0x0,%eax
    745e:	e9 ee 02 00 00       	jmp    7751 <huffman_decoder+0x345>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    7463:	8b 45 08             	mov    0x8(%ebp),%eax
    7466:	8b 40 20             	mov    0x20(%eax),%eax
    7469:	8b 55 f0             	mov    -0x10(%ebp),%edx
    746c:	01 d2                	add    %edx,%edx
    746e:	01 d0                	add    %edx,%eax
    7470:	0f b6 00             	movzbl (%eax),%eax
    7473:	84 c0                	test   %al,%al
    7475:	75 46                	jne    74bd <huffman_decoder+0xb1>
      *x = h->val[point][1] >> 4;
    7477:	8b 45 08             	mov    0x8(%ebp),%eax
    747a:	8b 40 20             	mov    0x20(%eax),%eax
    747d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7480:	01 d2                	add    %edx,%edx
    7482:	01 d0                	add    %edx,%eax
    7484:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7488:	c0 e8 04             	shr    $0x4,%al
    748b:	0f b6 d0             	movzbl %al,%edx
    748e:	8b 45 0c             	mov    0xc(%ebp),%eax
    7491:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    7493:	8b 45 08             	mov    0x8(%ebp),%eax
    7496:	8b 40 20             	mov    0x20(%eax),%eax
    7499:	8b 55 f0             	mov    -0x10(%ebp),%edx
    749c:	01 d2                	add    %edx,%edx
    749e:	01 d0                	add    %edx,%eax
    74a0:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    74a4:	0f b6 c0             	movzbl %al,%eax
    74a7:	83 e0 0f             	and    $0xf,%eax
    74aa:	89 c2                	mov    %eax,%edx
    74ac:	8b 45 10             	mov    0x10(%ebp),%eax
    74af:	89 10                	mov    %edx,(%eax)

      error = 0;
    74b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    74b8:	e9 af 00 00 00       	jmp    756c <huffman_decoder+0x160>
    } 
    if (hget1bit()) {
    74bd:	e8 4d e7 ff ff       	call   5c0f <hget1bit>
    74c2:	85 c0                	test   %eax,%eax
    74c4:	74 47                	je     750d <huffman_decoder+0x101>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    74c6:	eb 17                	jmp    74df <huffman_decoder+0xd3>
    74c8:	8b 45 08             	mov    0x8(%ebp),%eax
    74cb:	8b 40 20             	mov    0x20(%eax),%eax
    74ce:	8b 55 f0             	mov    -0x10(%ebp),%edx
    74d1:	01 d2                	add    %edx,%edx
    74d3:	01 d0                	add    %edx,%eax
    74d5:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    74d9:	0f b6 c0             	movzbl %al,%eax
    74dc:	01 45 f0             	add    %eax,-0x10(%ebp)
    74df:	8b 45 08             	mov    0x8(%ebp),%eax
    74e2:	8b 40 20             	mov    0x20(%eax),%eax
    74e5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    74e8:	01 d2                	add    %edx,%edx
    74ea:	01 d0                	add    %edx,%eax
    74ec:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    74f0:	3c f9                	cmp    $0xf9,%al
    74f2:	77 d4                	ja     74c8 <huffman_decoder+0xbc>
      point += h->val[point][1];
    74f4:	8b 45 08             	mov    0x8(%ebp),%eax
    74f7:	8b 40 20             	mov    0x20(%eax),%eax
    74fa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    74fd:	01 d2                	add    %edx,%edx
    74ff:	01 d0                	add    %edx,%eax
    7501:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7505:	0f b6 c0             	movzbl %al,%eax
    7508:	01 45 f0             	add    %eax,-0x10(%ebp)
    750b:	eb 42                	jmp    754f <huffman_decoder+0x143>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    750d:	eb 16                	jmp    7525 <huffman_decoder+0x119>
    750f:	8b 45 08             	mov    0x8(%ebp),%eax
    7512:	8b 40 20             	mov    0x20(%eax),%eax
    7515:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7518:	01 d2                	add    %edx,%edx
    751a:	01 d0                	add    %edx,%eax
    751c:	0f b6 00             	movzbl (%eax),%eax
    751f:	0f b6 c0             	movzbl %al,%eax
    7522:	01 45 f0             	add    %eax,-0x10(%ebp)
    7525:	8b 45 08             	mov    0x8(%ebp),%eax
    7528:	8b 40 20             	mov    0x20(%eax),%eax
    752b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    752e:	01 d2                	add    %edx,%edx
    7530:	01 d0                	add    %edx,%eax
    7532:	0f b6 00             	movzbl (%eax),%eax
    7535:	3c f9                	cmp    $0xf9,%al
    7537:	77 d6                	ja     750f <huffman_decoder+0x103>
      point += h->val[point][0];
    7539:	8b 45 08             	mov    0x8(%ebp),%eax
    753c:	8b 40 20             	mov    0x20(%eax),%eax
    753f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7542:	01 d2                	add    %edx,%edx
    7544:	01 d0                	add    %edx,%eax
    7546:	0f b6 00             	movzbl (%eax),%eax
    7549:	0f b6 c0             	movzbl %al,%eax
    754c:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    754f:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    7552:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7556:	0f 85 07 ff ff ff    	jne    7463 <huffman_decoder+0x57>
    755c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    755f:	a1 e4 3a 01 00       	mov    0x13ae4,%eax
    7564:	39 c2                	cmp    %eax,%edx
    7566:	0f 82 f7 fe ff ff    	jb     7463 <huffman_decoder+0x57>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    756c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    7570:	74 24                	je     7596 <huffman_decoder+0x18a>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    7572:	8b 45 08             	mov    0x8(%ebp),%eax
    7575:	8b 40 04             	mov    0x4(%eax),%eax
    7578:	83 e8 01             	sub    $0x1,%eax
    757b:	01 c0                	add    %eax,%eax
    757d:	89 c2                	mov    %eax,%edx
    757f:	8b 45 0c             	mov    0xc(%ebp),%eax
    7582:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    7584:	8b 45 08             	mov    0x8(%ebp),%eax
    7587:	8b 40 08             	mov    0x8(%eax),%eax
    758a:	83 e8 01             	sub    $0x1,%eax
    758d:	01 c0                	add    %eax,%eax
    758f:	89 c2                	mov    %eax,%edx
    7591:	8b 45 10             	mov    0x10(%ebp),%eax
    7594:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    7596:	8b 45 08             	mov    0x8(%ebp),%eax
    7599:	0f b6 00             	movzbl (%eax),%eax
    759c:	3c 33                	cmp    $0x33,%al
    759e:	0f 85 ec 00 00 00    	jne    7690 <huffman_decoder+0x284>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    75a4:	8b 45 08             	mov    0x8(%ebp),%eax
    75a7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    75ab:	3c 32                	cmp    $0x32,%al
    75ad:	74 0f                	je     75be <huffman_decoder+0x1b2>
    75af:	8b 45 08             	mov    0x8(%ebp),%eax
    75b2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    75b6:	3c 33                	cmp    $0x33,%al
    75b8:	0f 85 d2 00 00 00    	jne    7690 <huffman_decoder+0x284>
     *v = (*y>>3) & 1;
    75be:	8b 45 10             	mov    0x10(%ebp),%eax
    75c1:	8b 00                	mov    (%eax),%eax
    75c3:	c1 f8 03             	sar    $0x3,%eax
    75c6:	83 e0 01             	and    $0x1,%eax
    75c9:	89 c2                	mov    %eax,%edx
    75cb:	8b 45 14             	mov    0x14(%ebp),%eax
    75ce:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    75d0:	8b 45 10             	mov    0x10(%ebp),%eax
    75d3:	8b 00                	mov    (%eax),%eax
    75d5:	c1 f8 02             	sar    $0x2,%eax
    75d8:	83 e0 01             	and    $0x1,%eax
    75db:	89 c2                	mov    %eax,%edx
    75dd:	8b 45 18             	mov    0x18(%ebp),%eax
    75e0:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    75e2:	8b 45 10             	mov    0x10(%ebp),%eax
    75e5:	8b 00                	mov    (%eax),%eax
    75e7:	d1 f8                	sar    %eax
    75e9:	83 e0 01             	and    $0x1,%eax
    75ec:	89 c2                	mov    %eax,%edx
    75ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    75f1:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    75f3:	8b 45 10             	mov    0x10(%ebp),%eax
    75f6:	8b 00                	mov    (%eax),%eax
    75f8:	83 e0 01             	and    $0x1,%eax
    75fb:	89 c2                	mov    %eax,%edx
    75fd:	8b 45 10             	mov    0x10(%ebp),%eax
    7600:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    7602:	8b 45 14             	mov    0x14(%ebp),%eax
    7605:	8b 00                	mov    (%eax),%eax
    7607:	85 c0                	test   %eax,%eax
    7609:	74 18                	je     7623 <huffman_decoder+0x217>
        if (hget1bit() == 1) *v = -*v;
    760b:	e8 ff e5 ff ff       	call   5c0f <hget1bit>
    7610:	83 f8 01             	cmp    $0x1,%eax
    7613:	75 0e                	jne    7623 <huffman_decoder+0x217>
    7615:	8b 45 14             	mov    0x14(%ebp),%eax
    7618:	8b 00                	mov    (%eax),%eax
    761a:	f7 d8                	neg    %eax
    761c:	89 c2                	mov    %eax,%edx
    761e:	8b 45 14             	mov    0x14(%ebp),%eax
    7621:	89 10                	mov    %edx,(%eax)
     if (*w)
    7623:	8b 45 18             	mov    0x18(%ebp),%eax
    7626:	8b 00                	mov    (%eax),%eax
    7628:	85 c0                	test   %eax,%eax
    762a:	74 18                	je     7644 <huffman_decoder+0x238>
        if (hget1bit() == 1) *w = -*w;
    762c:	e8 de e5 ff ff       	call   5c0f <hget1bit>
    7631:	83 f8 01             	cmp    $0x1,%eax
    7634:	75 0e                	jne    7644 <huffman_decoder+0x238>
    7636:	8b 45 18             	mov    0x18(%ebp),%eax
    7639:	8b 00                	mov    (%eax),%eax
    763b:	f7 d8                	neg    %eax
    763d:	89 c2                	mov    %eax,%edx
    763f:	8b 45 18             	mov    0x18(%ebp),%eax
    7642:	89 10                	mov    %edx,(%eax)
     if (*x)
    7644:	8b 45 0c             	mov    0xc(%ebp),%eax
    7647:	8b 00                	mov    (%eax),%eax
    7649:	85 c0                	test   %eax,%eax
    764b:	74 18                	je     7665 <huffman_decoder+0x259>
        if (hget1bit() == 1) *x = -*x;
    764d:	e8 bd e5 ff ff       	call   5c0f <hget1bit>
    7652:	83 f8 01             	cmp    $0x1,%eax
    7655:	75 0e                	jne    7665 <huffman_decoder+0x259>
    7657:	8b 45 0c             	mov    0xc(%ebp),%eax
    765a:	8b 00                	mov    (%eax),%eax
    765c:	f7 d8                	neg    %eax
    765e:	89 c2                	mov    %eax,%edx
    7660:	8b 45 0c             	mov    0xc(%ebp),%eax
    7663:	89 10                	mov    %edx,(%eax)
     if (*y)
    7665:	8b 45 10             	mov    0x10(%ebp),%eax
    7668:	8b 00                	mov    (%eax),%eax
    766a:	85 c0                	test   %eax,%eax
    766c:	74 1d                	je     768b <huffman_decoder+0x27f>
        if (hget1bit() == 1) *y = -*y;
    766e:	e8 9c e5 ff ff       	call   5c0f <hget1bit>
    7673:	83 f8 01             	cmp    $0x1,%eax
    7676:	75 13                	jne    768b <huffman_decoder+0x27f>
    7678:	8b 45 10             	mov    0x10(%ebp),%eax
    767b:	8b 00                	mov    (%eax),%eax
    767d:	f7 d8                	neg    %eax
    767f:	89 c2                	mov    %eax,%edx
    7681:	8b 45 10             	mov    0x10(%ebp),%eax
    7684:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    7686:	e9 c3 00 00 00       	jmp    774e <huffman_decoder+0x342>
    768b:	e9 be 00 00 00       	jmp    774e <huffman_decoder+0x342>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    7690:	8b 45 08             	mov    0x8(%ebp),%eax
    7693:	8b 40 0c             	mov    0xc(%eax),%eax
    7696:	85 c0                	test   %eax,%eax
    7698:	74 34                	je     76ce <huffman_decoder+0x2c2>
       if ((h->xlen-1) == *x) 
    769a:	8b 45 08             	mov    0x8(%ebp),%eax
    769d:	8b 40 04             	mov    0x4(%eax),%eax
    76a0:	8d 50 ff             	lea    -0x1(%eax),%edx
    76a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    76a6:	8b 00                	mov    (%eax),%eax
    76a8:	39 c2                	cmp    %eax,%edx
    76aa:	75 22                	jne    76ce <huffman_decoder+0x2c2>
         *x += hgetbits(h->linbits);
    76ac:	8b 45 08             	mov    0x8(%ebp),%eax
    76af:	8b 40 0c             	mov    0xc(%eax),%eax
    76b2:	83 ec 0c             	sub    $0xc,%esp
    76b5:	50                   	push   %eax
    76b6:	e8 3c e5 ff ff       	call   5bf7 <hgetbits>
    76bb:	83 c4 10             	add    $0x10,%esp
    76be:	89 c2                	mov    %eax,%edx
    76c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    76c3:	8b 00                	mov    (%eax),%eax
    76c5:	01 d0                	add    %edx,%eax
    76c7:	89 c2                	mov    %eax,%edx
    76c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    76cc:	89 10                	mov    %edx,(%eax)
     if (*x)
    76ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    76d1:	8b 00                	mov    (%eax),%eax
    76d3:	85 c0                	test   %eax,%eax
    76d5:	74 18                	je     76ef <huffman_decoder+0x2e3>
        if (hget1bit() == 1) *x = -*x;
    76d7:	e8 33 e5 ff ff       	call   5c0f <hget1bit>
    76dc:	83 f8 01             	cmp    $0x1,%eax
    76df:	75 0e                	jne    76ef <huffman_decoder+0x2e3>
    76e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    76e4:	8b 00                	mov    (%eax),%eax
    76e6:	f7 d8                	neg    %eax
    76e8:	89 c2                	mov    %eax,%edx
    76ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    76ed:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    76ef:	8b 45 08             	mov    0x8(%ebp),%eax
    76f2:	8b 40 0c             	mov    0xc(%eax),%eax
    76f5:	85 c0                	test   %eax,%eax
    76f7:	74 34                	je     772d <huffman_decoder+0x321>
       if ((h->ylen-1) == *y)
    76f9:	8b 45 08             	mov    0x8(%ebp),%eax
    76fc:	8b 40 08             	mov    0x8(%eax),%eax
    76ff:	8d 50 ff             	lea    -0x1(%eax),%edx
    7702:	8b 45 10             	mov    0x10(%ebp),%eax
    7705:	8b 00                	mov    (%eax),%eax
    7707:	39 c2                	cmp    %eax,%edx
    7709:	75 22                	jne    772d <huffman_decoder+0x321>
         *y += hgetbits(h->linbits);
    770b:	8b 45 08             	mov    0x8(%ebp),%eax
    770e:	8b 40 0c             	mov    0xc(%eax),%eax
    7711:	83 ec 0c             	sub    $0xc,%esp
    7714:	50                   	push   %eax
    7715:	e8 dd e4 ff ff       	call   5bf7 <hgetbits>
    771a:	83 c4 10             	add    $0x10,%esp
    771d:	89 c2                	mov    %eax,%edx
    771f:	8b 45 10             	mov    0x10(%ebp),%eax
    7722:	8b 00                	mov    (%eax),%eax
    7724:	01 d0                	add    %edx,%eax
    7726:	89 c2                	mov    %eax,%edx
    7728:	8b 45 10             	mov    0x10(%ebp),%eax
    772b:	89 10                	mov    %edx,(%eax)
     if (*y)
    772d:	8b 45 10             	mov    0x10(%ebp),%eax
    7730:	8b 00                	mov    (%eax),%eax
    7732:	85 c0                	test   %eax,%eax
    7734:	74 18                	je     774e <huffman_decoder+0x342>
        if (hget1bit() == 1) *y = -*y;
    7736:	e8 d4 e4 ff ff       	call   5c0f <hget1bit>
    773b:	83 f8 01             	cmp    $0x1,%eax
    773e:	75 0e                	jne    774e <huffman_decoder+0x342>
    7740:	8b 45 10             	mov    0x10(%ebp),%eax
    7743:	8b 00                	mov    (%eax),%eax
    7745:	f7 d8                	neg    %eax
    7747:	89 c2                	mov    %eax,%edx
    7749:	8b 45 10             	mov    0x10(%ebp),%eax
    774c:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    774e:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    7751:	c9                   	leave  
    7752:	c3                   	ret    

00007753 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    7753:	55                   	push   %ebp
    7754:	89 e5                	mov    %esp,%ebp
    7756:	83 ec 18             	sub    $0x18,%esp
    layer *hdr = fr_ps->header;
    7759:	8b 45 0c             	mov    0xc(%ebp),%eax
    775c:	8b 00                	mov    (%eax),%eax
    775e:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    7761:	83 ec 0c             	sub    $0xc,%esp
    7764:	ff 75 08             	pushl  0x8(%ebp)
    7767:	e8 19 e0 ff ff       	call   5785 <get1bit>
    776c:	83 c4 10             	add    $0x10,%esp
    776f:	89 c2                	mov    %eax,%edx
    7771:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7774:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    7776:	83 ec 08             	sub    $0x8,%esp
    7779:	6a 02                	push   $0x2
    777b:	ff 75 08             	pushl  0x8(%ebp)
    777e:	e8 16 e1 ff ff       	call   5899 <getbits>
    7783:	83 c4 10             	add    $0x10,%esp
    7786:	ba 04 00 00 00       	mov    $0x4,%edx
    778b:	29 c2                	sub    %eax,%edx
    778d:	89 d0                	mov    %edx,%eax
    778f:	89 c2                	mov    %eax,%edx
    7791:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7794:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    7797:	83 ec 0c             	sub    $0xc,%esp
    779a:	ff 75 08             	pushl  0x8(%ebp)
    779d:	e8 e3 df ff ff       	call   5785 <get1bit>
    77a2:	83 c4 10             	add    $0x10,%esp
    77a5:	85 c0                	test   %eax,%eax
    77a7:	0f 94 c0             	sete   %al
    77aa:	0f b6 d0             	movzbl %al,%edx
    77ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    77b0:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    77b3:	83 ec 08             	sub    $0x8,%esp
    77b6:	6a 04                	push   $0x4
    77b8:	ff 75 08             	pushl  0x8(%ebp)
    77bb:	e8 d9 e0 ff ff       	call   5899 <getbits>
    77c0:	83 c4 10             	add    $0x10,%esp
    77c3:	89 c2                	mov    %eax,%edx
    77c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    77c8:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    77cb:	83 ec 08             	sub    $0x8,%esp
    77ce:	6a 02                	push   $0x2
    77d0:	ff 75 08             	pushl  0x8(%ebp)
    77d3:	e8 c1 e0 ff ff       	call   5899 <getbits>
    77d8:	83 c4 10             	add    $0x10,%esp
    77db:	89 c2                	mov    %eax,%edx
    77dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    77e0:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    77e3:	83 ec 0c             	sub    $0xc,%esp
    77e6:	ff 75 08             	pushl  0x8(%ebp)
    77e9:	e8 97 df ff ff       	call   5785 <get1bit>
    77ee:	83 c4 10             	add    $0x10,%esp
    77f1:	89 c2                	mov    %eax,%edx
    77f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    77f6:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    77f9:	83 ec 0c             	sub    $0xc,%esp
    77fc:	ff 75 08             	pushl  0x8(%ebp)
    77ff:	e8 81 df ff ff       	call   5785 <get1bit>
    7804:	83 c4 10             	add    $0x10,%esp
    7807:	89 c2                	mov    %eax,%edx
    7809:	8b 45 f4             	mov    -0xc(%ebp),%eax
    780c:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    780f:	83 ec 08             	sub    $0x8,%esp
    7812:	6a 02                	push   $0x2
    7814:	ff 75 08             	pushl  0x8(%ebp)
    7817:	e8 7d e0 ff ff       	call   5899 <getbits>
    781c:	83 c4 10             	add    $0x10,%esp
    781f:	89 c2                	mov    %eax,%edx
    7821:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7824:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    7827:	83 ec 08             	sub    $0x8,%esp
    782a:	6a 02                	push   $0x2
    782c:	ff 75 08             	pushl  0x8(%ebp)
    782f:	e8 65 e0 ff ff       	call   5899 <getbits>
    7834:	83 c4 10             	add    $0x10,%esp
    7837:	89 c2                	mov    %eax,%edx
    7839:	8b 45 f4             	mov    -0xc(%ebp),%eax
    783c:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    783f:	83 ec 0c             	sub    $0xc,%esp
    7842:	ff 75 08             	pushl  0x8(%ebp)
    7845:	e8 3b df ff ff       	call   5785 <get1bit>
    784a:	83 c4 10             	add    $0x10,%esp
    784d:	89 c2                	mov    %eax,%edx
    784f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7852:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    7855:	83 ec 0c             	sub    $0xc,%esp
    7858:	ff 75 08             	pushl  0x8(%ebp)
    785b:	e8 25 df ff ff       	call   5785 <get1bit>
    7860:	83 c4 10             	add    $0x10,%esp
    7863:	89 c2                	mov    %eax,%edx
    7865:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7868:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    786b:	83 ec 08             	sub    $0x8,%esp
    786e:	6a 02                	push   $0x2
    7870:	ff 75 08             	pushl  0x8(%ebp)
    7873:	e8 21 e0 ff ff       	call   5899 <getbits>
    7878:	83 c4 10             	add    $0x10,%esp
    787b:	89 c2                	mov    %eax,%edx
    787d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7880:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    7883:	c9                   	leave  
    7884:	c3                   	ret    

00007885 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    7885:	55                   	push   %ebp
    7886:	89 e5                	mov    %esp,%ebp
    7888:	56                   	push   %esi
    7889:	53                   	push   %ebx
    788a:	83 ec 10             	sub    $0x10,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    788d:	8b 45 10             	mov    0x10(%ebp),%eax
    7890:	8b 40 08             	mov    0x8(%eax),%eax
    7893:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    7896:	83 ec 08             	sub    $0x8,%esp
    7899:	6a 09                	push   $0x9
    789b:	ff 75 08             	pushl  0x8(%ebp)
    789e:	e8 f6 df ff ff       	call   5899 <getbits>
    78a3:	83 c4 10             	add    $0x10,%esp
    78a6:	89 c2                	mov    %eax,%edx
    78a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    78ab:	89 10                	mov    %edx,(%eax)
	if (stereo == 1)
    78ad:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    78b1:	75 1a                	jne    78cd <III_get_side_info+0x48>
		si->private_bits = getbits(bs,5);
    78b3:	83 ec 08             	sub    $0x8,%esp
    78b6:	6a 05                	push   $0x5
    78b8:	ff 75 08             	pushl  0x8(%ebp)
    78bb:	e8 d9 df ff ff       	call   5899 <getbits>
    78c0:	83 c4 10             	add    $0x10,%esp
    78c3:	89 c2                	mov    %eax,%edx
    78c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    78c8:	89 50 04             	mov    %edx,0x4(%eax)
    78cb:	eb 18                	jmp    78e5 <III_get_side_info+0x60>
	else
		si->private_bits = getbits(bs,3);
    78cd:	83 ec 08             	sub    $0x8,%esp
    78d0:	6a 03                	push   $0x3
    78d2:	ff 75 08             	pushl  0x8(%ebp)
    78d5:	e8 bf df ff ff       	call   5899 <getbits>
    78da:	83 c4 10             	add    $0x10,%esp
    78dd:	89 c2                	mov    %eax,%edx
    78df:	8b 45 0c             	mov    0xc(%ebp),%eax
    78e2:	89 50 04             	mov    %edx,0x4(%eax)

	for (ch=0; ch<stereo; ch++)
    78e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    78ec:	eb 40                	jmp    792e <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    78ee:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    78f5:	eb 2d                	jmp    7924 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    78f7:	83 ec 0c             	sub    $0xc,%esp
    78fa:	ff 75 08             	pushl  0x8(%ebp)
    78fd:	e8 83 de ff ff       	call   5785 <get1bit>
    7902:	83 c4 10             	add    $0x10,%esp
    7905:	89 c3                	mov    %eax,%ebx
    7907:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    790a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    790d:	89 d0                	mov    %edx,%eax
    790f:	c1 e0 02             	shl    $0x2,%eax
    7912:	01 d0                	add    %edx,%eax
    7914:	c1 e0 03             	shl    $0x3,%eax
    7917:	8b 55 ec             	mov    -0x14(%ebp),%edx
    791a:	01 d0                	add    %edx,%eax
    791c:	89 5c 81 08          	mov    %ebx,0x8(%ecx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    7920:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7924:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    7928:	7e cd                	jle    78f7 <III_get_side_info+0x72>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    792a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    792e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7931:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7934:	7c b8                	jl     78ee <III_get_side_info+0x69>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    7936:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    793d:	e9 cb 05 00 00       	jmp    7f0d <III_get_side_info+0x688>
		for (ch=0; ch<stereo; ch++) {
    7942:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7949:	e9 af 05 00 00       	jmp    7efd <III_get_side_info+0x678>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    794e:	83 ec 08             	sub    $0x8,%esp
    7951:	6a 0c                	push   $0xc
    7953:	ff 75 08             	pushl  0x8(%ebp)
    7956:	e8 3e df ff ff       	call   5899 <getbits>
    795b:	83 c4 10             	add    $0x10,%esp
    795e:	89 c6                	mov    %eax,%esi
    7960:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7963:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7966:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7969:	89 c2                	mov    %eax,%edx
    796b:	c1 e2 03             	shl    $0x3,%edx
    796e:	01 c2                	add    %eax,%edx
    7970:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7977:	89 c2                	mov    %eax,%edx
    7979:	89 c8                	mov    %ecx,%eax
    797b:	c1 e0 02             	shl    $0x2,%eax
    797e:	01 c8                	add    %ecx,%eax
    7980:	c1 e0 05             	shl    $0x5,%eax
    7983:	01 d0                	add    %edx,%eax
    7985:	01 d8                	add    %ebx,%eax
    7987:	83 c0 10             	add    $0x10,%eax
    798a:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    798d:	83 ec 08             	sub    $0x8,%esp
    7990:	6a 09                	push   $0x9
    7992:	ff 75 08             	pushl  0x8(%ebp)
    7995:	e8 ff de ff ff       	call   5899 <getbits>
    799a:	83 c4 10             	add    $0x10,%esp
    799d:	89 c6                	mov    %eax,%esi
    799f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    79a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    79a5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    79a8:	89 c2                	mov    %eax,%edx
    79aa:	c1 e2 03             	shl    $0x3,%edx
    79ad:	01 c2                	add    %eax,%edx
    79af:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    79b6:	89 c2                	mov    %eax,%edx
    79b8:	89 c8                	mov    %ecx,%eax
    79ba:	c1 e0 02             	shl    $0x2,%eax
    79bd:	01 c8                	add    %ecx,%eax
    79bf:	c1 e0 05             	shl    $0x5,%eax
    79c2:	01 d0                	add    %edx,%eax
    79c4:	01 d8                	add    %ebx,%eax
    79c6:	83 c0 10             	add    $0x10,%eax
    79c9:	89 70 0c             	mov    %esi,0xc(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    79cc:	83 ec 08             	sub    $0x8,%esp
    79cf:	6a 08                	push   $0x8
    79d1:	ff 75 08             	pushl  0x8(%ebp)
    79d4:	e8 c0 de ff ff       	call   5899 <getbits>
    79d9:	83 c4 10             	add    $0x10,%esp
    79dc:	89 c6                	mov    %eax,%esi
    79de:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    79e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    79e4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    79e7:	89 c2                	mov    %eax,%edx
    79e9:	c1 e2 03             	shl    $0x3,%edx
    79ec:	01 c2                	add    %eax,%edx
    79ee:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    79f5:	89 c2                	mov    %eax,%edx
    79f7:	89 c8                	mov    %ecx,%eax
    79f9:	c1 e0 02             	shl    $0x2,%eax
    79fc:	01 c8                	add    %ecx,%eax
    79fe:	c1 e0 05             	shl    $0x5,%eax
    7a01:	01 d0                	add    %edx,%eax
    7a03:	01 d8                	add    %ebx,%eax
    7a05:	83 c0 10             	add    $0x10,%eax
    7a08:	89 70 10             	mov    %esi,0x10(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    7a0b:	83 ec 08             	sub    $0x8,%esp
    7a0e:	6a 04                	push   $0x4
    7a10:	ff 75 08             	pushl  0x8(%ebp)
    7a13:	e8 81 de ff ff       	call   5899 <getbits>
    7a18:	83 c4 10             	add    $0x10,%esp
    7a1b:	89 c6                	mov    %eax,%esi
    7a1d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7a20:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a23:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7a26:	89 c2                	mov    %eax,%edx
    7a28:	c1 e2 03             	shl    $0x3,%edx
    7a2b:	01 c2                	add    %eax,%edx
    7a2d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a34:	89 c2                	mov    %eax,%edx
    7a36:	89 c8                	mov    %ecx,%eax
    7a38:	c1 e0 02             	shl    $0x2,%eax
    7a3b:	01 c8                	add    %ecx,%eax
    7a3d:	c1 e0 05             	shl    $0x5,%eax
    7a40:	01 d0                	add    %edx,%eax
    7a42:	01 d8                	add    %ebx,%eax
    7a44:	83 c0 10             	add    $0x10,%eax
    7a47:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    7a4a:	83 ec 0c             	sub    $0xc,%esp
    7a4d:	ff 75 08             	pushl  0x8(%ebp)
    7a50:	e8 30 dd ff ff       	call   5785 <get1bit>
    7a55:	83 c4 10             	add    $0x10,%esp
    7a58:	89 c6                	mov    %eax,%esi
    7a5a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7a5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a60:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7a63:	89 c2                	mov    %eax,%edx
    7a65:	c1 e2 03             	shl    $0x3,%edx
    7a68:	01 c2                	add    %eax,%edx
    7a6a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a71:	89 c2                	mov    %eax,%edx
    7a73:	89 c8                	mov    %ecx,%eax
    7a75:	c1 e0 02             	shl    $0x2,%eax
    7a78:	01 c8                	add    %ecx,%eax
    7a7a:	c1 e0 05             	shl    $0x5,%eax
    7a7d:	01 d0                	add    %edx,%eax
    7a7f:	01 d8                	add    %ebx,%eax
    7a81:	83 c0 20             	add    $0x20,%eax
    7a84:	89 70 08             	mov    %esi,0x8(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    7a87:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7a8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a8d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7a90:	89 c2                	mov    %eax,%edx
    7a92:	c1 e2 03             	shl    $0x3,%edx
    7a95:	01 c2                	add    %eax,%edx
    7a97:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a9e:	89 c2                	mov    %eax,%edx
    7aa0:	89 c8                	mov    %ecx,%eax
    7aa2:	c1 e0 02             	shl    $0x2,%eax
    7aa5:	01 c8                	add    %ecx,%eax
    7aa7:	c1 e0 05             	shl    $0x5,%eax
    7aaa:	01 d0                	add    %edx,%eax
    7aac:	01 d8                	add    %ebx,%eax
    7aae:	83 c0 20             	add    $0x20,%eax
    7ab1:	8b 40 08             	mov    0x8(%eax),%eax
    7ab4:	85 c0                	test   %eax,%eax
    7ab6:	0f 84 85 02 00 00    	je     7d41 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    7abc:	83 ec 08             	sub    $0x8,%esp
    7abf:	6a 02                	push   $0x2
    7ac1:	ff 75 08             	pushl  0x8(%ebp)
    7ac4:	e8 d0 dd ff ff       	call   5899 <getbits>
    7ac9:	83 c4 10             	add    $0x10,%esp
    7acc:	89 c6                	mov    %eax,%esi
    7ace:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7ad1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ad4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7ad7:	89 c2                	mov    %eax,%edx
    7ad9:	c1 e2 03             	shl    $0x3,%edx
    7adc:	01 c2                	add    %eax,%edx
    7ade:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ae5:	89 c2                	mov    %eax,%edx
    7ae7:	89 c8                	mov    %ecx,%eax
    7ae9:	c1 e0 02             	shl    $0x2,%eax
    7aec:	01 c8                	add    %ecx,%eax
    7aee:	c1 e0 05             	shl    $0x5,%eax
    7af1:	01 d0                	add    %edx,%eax
    7af3:	01 d8                	add    %ebx,%eax
    7af5:	83 c0 20             	add    $0x20,%eax
    7af8:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    7afb:	83 ec 0c             	sub    $0xc,%esp
    7afe:	ff 75 08             	pushl  0x8(%ebp)
    7b01:	e8 7f dc ff ff       	call   5785 <get1bit>
    7b06:	83 c4 10             	add    $0x10,%esp
    7b09:	89 c6                	mov    %eax,%esi
    7b0b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7b0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b11:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7b14:	89 c2                	mov    %eax,%edx
    7b16:	c1 e2 03             	shl    $0x3,%edx
    7b19:	01 c2                	add    %eax,%edx
    7b1b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7b22:	89 c2                	mov    %eax,%edx
    7b24:	89 c8                	mov    %ecx,%eax
    7b26:	c1 e0 02             	shl    $0x2,%eax
    7b29:	01 c8                	add    %ecx,%eax
    7b2b:	c1 e0 05             	shl    $0x5,%eax
    7b2e:	01 d0                	add    %edx,%eax
    7b30:	01 d8                	add    %ebx,%eax
    7b32:	83 c0 20             	add    $0x20,%eax
    7b35:	89 70 10             	mov    %esi,0x10(%eax)
				for (i=0; i<2; i++)
    7b38:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7b3f:	eb 43                	jmp    7b84 <III_get_side_info+0x2ff>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    7b41:	83 ec 08             	sub    $0x8,%esp
    7b44:	6a 05                	push   $0x5
    7b46:	ff 75 08             	pushl  0x8(%ebp)
    7b49:	e8 4b dd ff ff       	call   5899 <getbits>
    7b4e:	83 c4 10             	add    $0x10,%esp
    7b51:	89 c6                	mov    %eax,%esi
    7b53:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7b56:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b59:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7b5c:	89 c2                	mov    %eax,%edx
    7b5e:	c1 e2 03             	shl    $0x3,%edx
    7b61:	01 c2                	add    %eax,%edx
    7b63:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7b66:	89 c2                	mov    %eax,%edx
    7b68:	89 c8                	mov    %ecx,%eax
    7b6a:	c1 e0 02             	shl    $0x2,%eax
    7b6d:	01 c8                	add    %ecx,%eax
    7b6f:	c1 e0 03             	shl    $0x3,%eax
    7b72:	01 c2                	add    %eax,%edx
    7b74:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7b77:	01 d0                	add    %edx,%eax
    7b79:	83 c0 08             	add    $0x8,%eax
    7b7c:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    7b80:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7b84:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    7b88:	7e b7                	jle    7b41 <III_get_side_info+0x2bc>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    7b8a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7b91:	eb 43                	jmp    7bd6 <III_get_side_info+0x351>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    7b93:	83 ec 08             	sub    $0x8,%esp
    7b96:	6a 03                	push   $0x3
    7b98:	ff 75 08             	pushl  0x8(%ebp)
    7b9b:	e8 f9 dc ff ff       	call   5899 <getbits>
    7ba0:	83 c4 10             	add    $0x10,%esp
    7ba3:	89 c6                	mov    %eax,%esi
    7ba5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7ba8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7bab:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7bae:	89 c2                	mov    %eax,%edx
    7bb0:	c1 e2 03             	shl    $0x3,%edx
    7bb3:	01 c2                	add    %eax,%edx
    7bb5:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7bb8:	89 c2                	mov    %eax,%edx
    7bba:	89 c8                	mov    %ecx,%eax
    7bbc:	c1 e0 02             	shl    $0x2,%eax
    7bbf:	01 c8                	add    %ecx,%eax
    7bc1:	c1 e0 03             	shl    $0x3,%eax
    7bc4:	01 c2                	add    %eax,%edx
    7bc6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7bc9:	01 d0                	add    %edx,%eax
    7bcb:	83 c0 0c             	add    $0xc,%eax
    7bce:	89 74 83 10          	mov    %esi,0x10(%ebx,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    7bd2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7bd6:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7bda:	7e b7                	jle    7b93 <III_get_side_info+0x30e>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    7bdc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7bdf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7be2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7be5:	89 c2                	mov    %eax,%edx
    7be7:	c1 e2 03             	shl    $0x3,%edx
    7bea:	01 c2                	add    %eax,%edx
    7bec:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7bf3:	89 c2                	mov    %eax,%edx
    7bf5:	89 c8                	mov    %ecx,%eax
    7bf7:	c1 e0 02             	shl    $0x2,%eax
    7bfa:	01 c8                	add    %ecx,%eax
    7bfc:	c1 e0 05             	shl    $0x5,%eax
    7bff:	01 d0                	add    %edx,%eax
    7c01:	01 d8                	add    %ebx,%eax
    7c03:	83 c0 20             	add    $0x20,%eax
    7c06:	8b 40 0c             	mov    0xc(%eax),%eax
    7c09:	85 c0                	test   %eax,%eax
    7c0b:	75 05                	jne    7c12 <III_get_side_info+0x38d>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    7c0d:	e8 74 cc ff ff       	call   4886 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    7c12:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7c15:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c18:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7c1b:	89 c2                	mov    %eax,%edx
    7c1d:	c1 e2 03             	shl    $0x3,%edx
    7c20:	01 c2                	add    %eax,%edx
    7c22:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c29:	89 c2                	mov    %eax,%edx
    7c2b:	89 c8                	mov    %ecx,%eax
    7c2d:	c1 e0 02             	shl    $0x2,%eax
    7c30:	01 c8                	add    %ecx,%eax
    7c32:	c1 e0 05             	shl    $0x5,%eax
    7c35:	01 d0                	add    %edx,%eax
    7c37:	01 d8                	add    %ebx,%eax
    7c39:	83 c0 20             	add    $0x20,%eax
    7c3c:	8b 40 0c             	mov    0xc(%eax),%eax
    7c3f:	83 f8 02             	cmp    $0x2,%eax
    7c42:	75 64                	jne    7ca8 <III_get_side_info+0x423>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    7c44:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7c47:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c4a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7c4d:	89 c2                	mov    %eax,%edx
    7c4f:	c1 e2 03             	shl    $0x3,%edx
    7c52:	01 c2                	add    %eax,%edx
    7c54:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c5b:	89 c2                	mov    %eax,%edx
    7c5d:	89 c8                	mov    %ecx,%eax
    7c5f:	c1 e0 02             	shl    $0x2,%eax
    7c62:	01 c8                	add    %ecx,%eax
    7c64:	c1 e0 05             	shl    $0x5,%eax
    7c67:	01 d0                	add    %edx,%eax
    7c69:	01 d8                	add    %ebx,%eax
    7c6b:	83 c0 20             	add    $0x20,%eax
    7c6e:	8b 40 10             	mov    0x10(%eax),%eax
    7c71:	85 c0                	test   %eax,%eax
    7c73:	75 33                	jne    7ca8 <III_get_side_info+0x423>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    7c75:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7c78:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c7b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7c7e:	89 c2                	mov    %eax,%edx
    7c80:	c1 e2 03             	shl    $0x3,%edx
    7c83:	01 c2                	add    %eax,%edx
    7c85:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c8c:	89 c2                	mov    %eax,%edx
    7c8e:	89 c8                	mov    %ecx,%eax
    7c90:	c1 e0 02             	shl    $0x2,%eax
    7c93:	01 c8                	add    %ecx,%eax
    7c95:	c1 e0 05             	shl    $0x5,%eax
    7c98:	01 d0                	add    %edx,%eax
    7c9a:	01 d8                	add    %ebx,%eax
    7c9c:	83 c0 40             	add    $0x40,%eax
    7c9f:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
    7ca6:	eb 31                	jmp    7cd9 <III_get_side_info+0x454>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    7ca8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7cab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7cae:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7cb1:	89 c2                	mov    %eax,%edx
    7cb3:	c1 e2 03             	shl    $0x3,%edx
    7cb6:	01 c2                	add    %eax,%edx
    7cb8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7cbf:	89 c2                	mov    %eax,%edx
    7cc1:	89 c8                	mov    %ecx,%eax
    7cc3:	c1 e0 02             	shl    $0x2,%eax
    7cc6:	01 c8                	add    %ecx,%eax
    7cc8:	c1 e0 05             	shl    $0x5,%eax
    7ccb:	01 d0                	add    %edx,%eax
    7ccd:	01 d8                	add    %ebx,%eax
    7ccf:	83 c0 40             	add    $0x40,%eax
    7cd2:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    7cd9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7cdc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7cdf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7ce2:	89 c2                	mov    %eax,%edx
    7ce4:	c1 e2 03             	shl    $0x3,%edx
    7ce7:	01 c2                	add    %eax,%edx
    7ce9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7cf0:	89 c2                	mov    %eax,%edx
    7cf2:	89 c8                	mov    %ecx,%eax
    7cf4:	c1 e0 02             	shl    $0x2,%eax
    7cf7:	01 c8                	add    %ecx,%eax
    7cf9:	c1 e0 05             	shl    $0x5,%eax
    7cfc:	01 d0                	add    %edx,%eax
    7cfe:	01 d8                	add    %ebx,%eax
    7d00:	83 c0 40             	add    $0x40,%eax
    7d03:	8b 40 0c             	mov    0xc(%eax),%eax
    7d06:	ba 14 00 00 00       	mov    $0x14,%edx
    7d0b:	89 d3                	mov    %edx,%ebx
    7d0d:	29 c3                	sub    %eax,%ebx
    7d0f:	8b 75 0c             	mov    0xc(%ebp),%esi
    7d12:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d15:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7d18:	89 c2                	mov    %eax,%edx
    7d1a:	c1 e2 03             	shl    $0x3,%edx
    7d1d:	01 c2                	add    %eax,%edx
    7d1f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d26:	89 c2                	mov    %eax,%edx
    7d28:	89 c8                	mov    %ecx,%eax
    7d2a:	c1 e0 02             	shl    $0x2,%eax
    7d2d:	01 c8                	add    %ecx,%eax
    7d2f:	c1 e0 05             	shl    $0x5,%eax
    7d32:	01 d0                	add    %edx,%eax
    7d34:	01 f0                	add    %esi,%eax
    7d36:	83 c0 40             	add    $0x40,%eax
    7d39:	89 58 10             	mov    %ebx,0x10(%eax)
    7d3c:	e9 01 01 00 00       	jmp    7e42 <III_get_side_info+0x5bd>
			}
			else {
				for (i=0; i<3; i++)
    7d41:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7d48:	eb 43                	jmp    7d8d <III_get_side_info+0x508>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    7d4a:	83 ec 08             	sub    $0x8,%esp
    7d4d:	6a 05                	push   $0x5
    7d4f:	ff 75 08             	pushl  0x8(%ebp)
    7d52:	e8 42 db ff ff       	call   5899 <getbits>
    7d57:	83 c4 10             	add    $0x10,%esp
    7d5a:	89 c6                	mov    %eax,%esi
    7d5c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7d5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d62:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7d65:	89 c2                	mov    %eax,%edx
    7d67:	c1 e2 03             	shl    $0x3,%edx
    7d6a:	01 c2                	add    %eax,%edx
    7d6c:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7d6f:	89 c2                	mov    %eax,%edx
    7d71:	89 c8                	mov    %ecx,%eax
    7d73:	c1 e0 02             	shl    $0x2,%eax
    7d76:	01 c8                	add    %ecx,%eax
    7d78:	c1 e0 03             	shl    $0x3,%eax
    7d7b:	01 c2                	add    %eax,%edx
    7d7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7d80:	01 d0                	add    %edx,%eax
    7d82:	83 c0 08             	add    $0x8,%eax
    7d85:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    7d89:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7d8d:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7d91:	7e b7                	jle    7d4a <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    7d93:	83 ec 08             	sub    $0x8,%esp
    7d96:	6a 04                	push   $0x4
    7d98:	ff 75 08             	pushl  0x8(%ebp)
    7d9b:	e8 f9 da ff ff       	call   5899 <getbits>
    7da0:	83 c4 10             	add    $0x10,%esp
    7da3:	89 c6                	mov    %eax,%esi
    7da5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7da8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7dab:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7dae:	89 c2                	mov    %eax,%edx
    7db0:	c1 e2 03             	shl    $0x3,%edx
    7db3:	01 c2                	add    %eax,%edx
    7db5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7dbc:	89 c2                	mov    %eax,%edx
    7dbe:	89 c8                	mov    %ecx,%eax
    7dc0:	c1 e0 02             	shl    $0x2,%eax
    7dc3:	01 c8                	add    %ecx,%eax
    7dc5:	c1 e0 05             	shl    $0x5,%eax
    7dc8:	01 d0                	add    %edx,%eax
    7dca:	01 d8                	add    %ebx,%eax
    7dcc:	83 c0 40             	add    $0x40,%eax
    7dcf:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    7dd2:	83 ec 08             	sub    $0x8,%esp
    7dd5:	6a 03                	push   $0x3
    7dd7:	ff 75 08             	pushl  0x8(%ebp)
    7dda:	e8 ba da ff ff       	call   5899 <getbits>
    7ddf:	83 c4 10             	add    $0x10,%esp
    7de2:	89 c6                	mov    %eax,%esi
    7de4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7de7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7dea:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7ded:	89 c2                	mov    %eax,%edx
    7def:	c1 e2 03             	shl    $0x3,%edx
    7df2:	01 c2                	add    %eax,%edx
    7df4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7dfb:	89 c2                	mov    %eax,%edx
    7dfd:	89 c8                	mov    %ecx,%eax
    7dff:	c1 e0 02             	shl    $0x2,%eax
    7e02:	01 c8                	add    %ecx,%eax
    7e04:	c1 e0 05             	shl    $0x5,%eax
    7e07:	01 d0                	add    %edx,%eax
    7e09:	01 d8                	add    %ebx,%eax
    7e0b:	83 c0 40             	add    $0x40,%eax
    7e0e:	89 70 10             	mov    %esi,0x10(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    7e11:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e14:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e17:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7e1a:	89 c2                	mov    %eax,%edx
    7e1c:	c1 e2 03             	shl    $0x3,%edx
    7e1f:	01 c2                	add    %eax,%edx
    7e21:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7e28:	89 c2                	mov    %eax,%edx
    7e2a:	89 c8                	mov    %ecx,%eax
    7e2c:	c1 e0 02             	shl    $0x2,%eax
    7e2f:	01 c8                	add    %ecx,%eax
    7e31:	c1 e0 05             	shl    $0x5,%eax
    7e34:	01 d0                	add    %edx,%eax
    7e36:	01 d8                	add    %ebx,%eax
    7e38:	83 c0 20             	add    $0x20,%eax
    7e3b:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    7e42:	83 ec 0c             	sub    $0xc,%esp
    7e45:	ff 75 08             	pushl  0x8(%ebp)
    7e48:	e8 38 d9 ff ff       	call   5785 <get1bit>
    7e4d:	83 c4 10             	add    $0x10,%esp
    7e50:	89 c6                	mov    %eax,%esi
    7e52:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e55:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e58:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7e5b:	89 c2                	mov    %eax,%edx
    7e5d:	c1 e2 03             	shl    $0x3,%edx
    7e60:	01 c2                	add    %eax,%edx
    7e62:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7e69:	89 c2                	mov    %eax,%edx
    7e6b:	89 c8                	mov    %ecx,%eax
    7e6d:	c1 e0 02             	shl    $0x2,%eax
    7e70:	01 c8                	add    %ecx,%eax
    7e72:	c1 e0 05             	shl    $0x5,%eax
    7e75:	01 d0                	add    %edx,%eax
    7e77:	01 d8                	add    %ebx,%eax
    7e79:	83 c0 40             	add    $0x40,%eax
    7e7c:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    7e7f:	83 ec 0c             	sub    $0xc,%esp
    7e82:	ff 75 08             	pushl  0x8(%ebp)
    7e85:	e8 fb d8 ff ff       	call   5785 <get1bit>
    7e8a:	83 c4 10             	add    $0x10,%esp
    7e8d:	89 c6                	mov    %eax,%esi
    7e8f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
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
    7eb4:	01 d8                	add    %ebx,%eax
    7eb6:	83 c0 50             	add    $0x50,%eax
    7eb9:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    7ebc:	83 ec 0c             	sub    $0xc,%esp
    7ebf:	ff 75 08             	pushl  0x8(%ebp)
    7ec2:	e8 be d8 ff ff       	call   5785 <get1bit>
    7ec7:	83 c4 10             	add    $0x10,%esp
    7eca:	89 c6                	mov    %eax,%esi
    7ecc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7ecf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ed2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7ed5:	89 c2                	mov    %eax,%edx
    7ed7:	c1 e2 03             	shl    $0x3,%edx
    7eda:	01 c2                	add    %eax,%edx
    7edc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ee3:	89 c2                	mov    %eax,%edx
    7ee5:	89 c8                	mov    %ecx,%eax
    7ee7:	c1 e0 02             	shl    $0x2,%eax
    7eea:	01 c8                	add    %ecx,%eax
    7eec:	c1 e0 05             	shl    $0x5,%eax
    7eef:	01 d0                	add    %edx,%eax
    7ef1:	01 d8                	add    %ebx,%eax
    7ef3:	83 c0 50             	add    $0x50,%eax
    7ef6:	89 70 0c             	mov    %esi,0xc(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    7ef9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7efd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f00:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7f03:	0f 8c 45 fa ff ff    	jl     794e <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    7f09:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7f0d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7f11:	0f 8e 2b fa ff ff    	jle    7942 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    7f17:	8d 65 f8             	lea    -0x8(%ebp),%esp
    7f1a:	5b                   	pop    %ebx
    7f1b:	5e                   	pop    %esi
    7f1c:	5d                   	pop    %ebp
    7f1d:	c3                   	ret    

00007f1e <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    7f1e:	55                   	push   %ebp
    7f1f:	89 e5                	mov    %esp,%ebp
    7f21:	56                   	push   %esi
    7f22:	53                   	push   %ebx
    7f23:	83 ec 10             	sub    $0x10,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    7f26:	8b 45 10             	mov    0x10(%ebp),%eax
    7f29:	89 c2                	mov    %eax,%edx
    7f2b:	c1 e2 03             	shl    $0x3,%edx
    7f2e:	01 c2                	add    %eax,%edx
    7f30:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7f37:	89 c2                	mov    %eax,%edx
    7f39:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7f3c:	89 c8                	mov    %ecx,%eax
    7f3e:	c1 e0 02             	shl    $0x2,%eax
    7f41:	01 c8                	add    %ecx,%eax
    7f43:	c1 e0 05             	shl    $0x5,%eax
    7f46:	01 d0                	add    %edx,%eax
    7f48:	8d 50 10             	lea    0x10(%eax),%edx
    7f4b:	8b 45 0c             	mov    0xc(%ebp),%eax
    7f4e:	01 d0                	add    %edx,%eax
    7f50:	83 c0 08             	add    $0x8,%eax
    7f53:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    7f56:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7f59:	8b 40 10             	mov    0x10(%eax),%eax
    7f5c:	85 c0                	test   %eax,%eax
    7f5e:	0f 84 93 02 00 00    	je     81f7 <III_get_scale_factors+0x2d9>
    7f64:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7f67:	8b 40 14             	mov    0x14(%eax),%eax
    7f6a:	83 f8 02             	cmp    $0x2,%eax
    7f6d:	0f 85 84 02 00 00    	jne    81f7 <III_get_scale_factors+0x2d9>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7f73:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7f76:	8b 40 18             	mov    0x18(%eax),%eax
    7f79:	85 c0                	test   %eax,%eax
    7f7b:	0f 84 7c 01 00 00    	je     80fd <III_get_scale_factors+0x1df>
			for (sfb = 0; sfb < 8; sfb++)
    7f81:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7f88:	eb 3b                	jmp    7fc5 <III_get_scale_factors+0xa7>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    7f8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7f8d:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    7f90:	8b 04 85 00 fc 00 00 	mov    0xfc00(,%eax,4),%eax
    7f97:	83 ec 0c             	sub    $0xc,%esp
    7f9a:	50                   	push   %eax
    7f9b:	e8 57 dc ff ff       	call   5bf7 <hgetbits>
    7fa0:	83 c4 10             	add    $0x10,%esp
    7fa3:	89 c3                	mov    %eax,%ebx
    7fa5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7fa8:	8b 45 14             	mov    0x14(%ebp),%eax
    7fab:	89 c2                	mov    %eax,%edx
    7fad:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7fb0:	89 c2                	mov    %eax,%edx
    7fb2:	89 d0                	mov    %edx,%eax
    7fb4:	c1 e0 05             	shl    $0x5,%eax
    7fb7:	29 d0                	sub    %edx,%eax
    7fb9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7fbc:	01 d0                	add    %edx,%eax
    7fbe:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    7fc1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7fc5:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7fc9:	7e bf                	jle    7f8a <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    7fcb:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    7fd2:	eb 60                	jmp    8034 <III_get_scale_factors+0x116>
				for (window=0; window<3; window++)
    7fd4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7fdb:	eb 4d                	jmp    802a <III_get_scale_factors+0x10c>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    7fdd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7fe0:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7fe3:	8b 04 85 00 fc 00 00 	mov    0xfc00(,%eax,4),%eax
    7fea:	83 ec 0c             	sub    $0xc,%esp
    7fed:	50                   	push   %eax
    7fee:	e8 04 dc ff ff       	call   5bf7 <hgetbits>
    7ff3:	83 c4 10             	add    $0x10,%esp
    7ff6:	89 c6                	mov    %eax,%esi
    7ff8:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7ffb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7ffe:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8001:	89 d0                	mov    %edx,%eax
    8003:	01 c0                	add    %eax,%eax
    8005:	01 d0                	add    %edx,%eax
    8007:	c1 e0 02             	shl    $0x2,%eax
    800a:	01 d0                	add    %edx,%eax
    800c:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    800f:	89 d1                	mov    %edx,%ecx
    8011:	89 ca                	mov    %ecx,%edx
    8013:	c1 e2 05             	shl    $0x5,%edx
    8016:	29 ca                	sub    %ecx,%edx
    8018:	01 c2                	add    %eax,%edx
    801a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    801d:	01 d0                	add    %edx,%eax
    801f:	83 c0 14             	add    $0x14,%eax
    8022:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    8026:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    802a:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    802e:	7e ad                	jle    7fdd <III_get_scale_factors+0xbf>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    8030:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8034:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    8038:	7e 9a                	jle    7fd4 <III_get_scale_factors+0xb6>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    803a:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    8041:	eb 63                	jmp    80a6 <III_get_scale_factors+0x188>
				for (window=0; window<3; window++)
    8043:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    804a:	eb 50                	jmp    809c <III_get_scale_factors+0x17e>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    804c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    804f:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    8052:	83 c0 10             	add    $0x10,%eax
    8055:	8b 04 85 00 fc 00 00 	mov    0xfc00(,%eax,4),%eax
    805c:	83 ec 0c             	sub    $0xc,%esp
    805f:	50                   	push   %eax
    8060:	e8 92 db ff ff       	call   5bf7 <hgetbits>
    8065:	83 c4 10             	add    $0x10,%esp
    8068:	89 c6                	mov    %eax,%esi
    806a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    806d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8070:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8073:	89 d0                	mov    %edx,%eax
    8075:	01 c0                	add    %eax,%eax
    8077:	01 d0                	add    %edx,%eax
    8079:	c1 e0 02             	shl    $0x2,%eax
    807c:	01 d0                	add    %edx,%eax
    807e:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    8081:	89 d1                	mov    %edx,%ecx
    8083:	89 ca                	mov    %ecx,%edx
    8085:	c1 e2 05             	shl    $0x5,%edx
    8088:	29 ca                	sub    %ecx,%edx
    808a:	01 c2                	add    %eax,%edx
    808c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    808f:	01 d0                	add    %edx,%eax
    8091:	83 c0 14             	add    $0x14,%eax
    8094:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    8098:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    809c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    80a0:	7e aa                	jle    804c <III_get_scale_factors+0x12e>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    80a2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    80a6:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    80aa:	7e 97                	jle    8043 <III_get_scale_factors+0x125>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    80ac:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    80b3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    80ba:	eb 36                	jmp    80f2 <III_get_scale_factors+0x1d4>
				(*scalefac)[ch].s[window][sfb] = 0;
    80bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
    80bf:	8b 55 ec             	mov    -0x14(%ebp),%edx
    80c2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    80c5:	89 d0                	mov    %edx,%eax
    80c7:	01 c0                	add    %eax,%eax
    80c9:	01 d0                	add    %edx,%eax
    80cb:	c1 e0 02             	shl    $0x2,%eax
    80ce:	01 d0                	add    %edx,%eax
    80d0:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    80d3:	89 d1                	mov    %edx,%ecx
    80d5:	89 ca                	mov    %ecx,%edx
    80d7:	c1 e2 05             	shl    $0x5,%edx
    80da:	29 ca                	sub    %ecx,%edx
    80dc:	01 c2                	add    %eax,%edx
    80de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    80e1:	01 d0                	add    %edx,%eax
    80e3:	83 c0 14             	add    $0x14,%eax
    80e6:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    80ed:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    80ee:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    80f2:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    80f6:	7e c4                	jle    80bc <III_get_scale_factors+0x19e>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    80f8:	e9 bf 01 00 00       	jmp    82bc <III_get_scale_factors+0x39e>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    80fd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8104:	e9 93 00 00 00       	jmp    819c <III_get_scale_factors+0x27e>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    8109:	8b 45 f0             	mov    -0x10(%ebp),%eax
    810c:	83 c0 04             	add    $0x4,%eax
    810f:	8b 04 85 c4 fb 00 00 	mov    0xfbc4(,%eax,4),%eax
    8116:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8119:	eb 68                	jmp    8183 <III_get_scale_factors+0x265>
					for (window=0; window<3; window++)
    811b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8122:	eb 55                	jmp    8179 <III_get_scale_factors+0x25b>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    8124:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8127:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    812a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    812d:	c1 e2 04             	shl    $0x4,%edx
    8130:	01 d0                	add    %edx,%eax
    8132:	8b 04 85 00 fc 00 00 	mov    0xfc00(,%eax,4),%eax
    8139:	83 ec 0c             	sub    $0xc,%esp
    813c:	50                   	push   %eax
    813d:	e8 b5 da ff ff       	call   5bf7 <hgetbits>
    8142:	83 c4 10             	add    $0x10,%esp
    8145:	89 c6                	mov    %eax,%esi
    8147:	8b 5d 08             	mov    0x8(%ebp),%ebx
    814a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    814d:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8150:	89 d0                	mov    %edx,%eax
    8152:	01 c0                	add    %eax,%eax
    8154:	01 d0                	add    %edx,%eax
    8156:	c1 e0 02             	shl    $0x2,%eax
    8159:	01 d0                	add    %edx,%eax
    815b:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    815e:	89 d1                	mov    %edx,%ecx
    8160:	89 ca                	mov    %ecx,%edx
    8162:	c1 e2 05             	shl    $0x5,%edx
    8165:	29 ca                	sub    %ecx,%edx
    8167:	01 c2                	add    %eax,%edx
    8169:	8b 45 f4             	mov    -0xc(%ebp),%eax
    816c:	01 d0                	add    %edx,%eax
    816e:	83 c0 14             	add    $0x14,%eax
    8171:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    8175:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8179:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    817d:	7e a5                	jle    8124 <III_get_scale_factors+0x206>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    817f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8183:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8186:	83 c0 01             	add    $0x1,%eax
    8189:	83 c0 04             	add    $0x4,%eax
    818c:	8b 04 85 c4 fb 00 00 	mov    0xfbc4(,%eax,4),%eax
    8193:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    8196:	7f 83                	jg     811b <III_get_scale_factors+0x1fd>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    8198:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    819c:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    81a0:	0f 8e 63 ff ff ff    	jle    8109 <III_get_scale_factors+0x1eb>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    81a6:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    81ad:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    81b4:	eb 36                	jmp    81ec <III_get_scale_factors+0x2ce>
					(*scalefac)[ch].s[window][sfb] = 0;
    81b6:	8b 5d 08             	mov    0x8(%ebp),%ebx
    81b9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    81bc:	8b 4d 14             	mov    0x14(%ebp),%ecx
    81bf:	89 d0                	mov    %edx,%eax
    81c1:	01 c0                	add    %eax,%eax
    81c3:	01 d0                	add    %edx,%eax
    81c5:	c1 e0 02             	shl    $0x2,%eax
    81c8:	01 d0                	add    %edx,%eax
    81ca:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    81cd:	89 d1                	mov    %edx,%ecx
    81cf:	89 ca                	mov    %ecx,%edx
    81d1:	c1 e2 05             	shl    $0x5,%edx
    81d4:	29 ca                	sub    %ecx,%edx
    81d6:	01 c2                	add    %eax,%edx
    81d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81db:	01 d0                	add    %edx,%eax
    81dd:	83 c0 14             	add    $0x14,%eax
    81e0:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    81e7:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    81e8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    81ec:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    81f0:	7e c4                	jle    81b6 <III_get_scale_factors+0x298>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    81f2:	e9 c5 00 00 00       	jmp    82bc <III_get_scale_factors+0x39e>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    81f7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    81fe:	e9 92 00 00 00       	jmp    8295 <III_get_scale_factors+0x377>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    8203:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8206:	8b 55 14             	mov    0x14(%ebp),%edx
    8209:	89 d0                	mov    %edx,%eax
    820b:	c1 e0 02             	shl    $0x2,%eax
    820e:	01 d0                	add    %edx,%eax
    8210:	c1 e0 03             	shl    $0x3,%eax
    8213:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8216:	01 d0                	add    %edx,%eax
    8218:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    821c:	85 c0                	test   %eax,%eax
    821e:	74 06                	je     8226 <III_get_scale_factors+0x308>
    8220:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    8224:	75 6b                	jne    8291 <III_get_scale_factors+0x373>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    8226:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8229:	8b 04 85 c0 fb 00 00 	mov    0xfbc0(,%eax,4),%eax
    8230:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8233:	eb 4a                	jmp    827f <III_get_scale_factors+0x361>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    8235:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8239:	0f 9f c0             	setg   %al
    823c:	0f b6 d0             	movzbl %al,%edx
    823f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8242:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    8245:	c1 e2 04             	shl    $0x4,%edx
    8248:	01 d0                	add    %edx,%eax
    824a:	8b 04 85 00 fc 00 00 	mov    0xfc00(,%eax,4),%eax
    8251:	83 ec 0c             	sub    $0xc,%esp
    8254:	50                   	push   %eax
    8255:	e8 9d d9 ff ff       	call   5bf7 <hgetbits>
    825a:	83 c4 10             	add    $0x10,%esp
    825d:	89 c3                	mov    %eax,%ebx
    825f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8262:	8b 45 14             	mov    0x14(%ebp),%eax
    8265:	89 c2                	mov    %eax,%edx
    8267:	8d 04 12             	lea    (%edx,%edx,1),%eax
    826a:	89 c2                	mov    %eax,%edx
    826c:	89 d0                	mov    %edx,%eax
    826e:	c1 e0 05             	shl    $0x5,%eax
    8271:	29 d0                	sub    %edx,%eax
    8273:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8276:	01 d0                	add    %edx,%eax
    8278:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    827b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    827f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8282:	83 c0 01             	add    $0x1,%eax
    8285:	8b 04 85 c0 fb 00 00 	mov    0xfbc0(,%eax,4),%eax
    828c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    828f:	7f a4                	jg     8235 <III_get_scale_factors+0x317>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    8291:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8295:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    8299:	0f 8e 64 ff ff ff    	jle    8203 <III_get_scale_factors+0x2e5>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    829f:	8b 55 08             	mov    0x8(%ebp),%edx
    82a2:	8b 45 14             	mov    0x14(%ebp),%eax
    82a5:	c1 e0 03             	shl    $0x3,%eax
    82a8:	89 c1                	mov    %eax,%ecx
    82aa:	c1 e1 05             	shl    $0x5,%ecx
    82ad:	29 c1                	sub    %eax,%ecx
    82af:	89 c8                	mov    %ecx,%eax
    82b1:	83 c0 58             	add    $0x58,%eax
    82b4:	01 d0                	add    %edx,%eax
    82b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    82bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
    82bf:	5b                   	pop    %ebx
    82c0:	5e                   	pop    %esi
    82c1:	5d                   	pop    %ebp
    82c2:	c3                   	ret    

000082c3 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    82c3:	55                   	push   %ebp
    82c4:	89 e5                	mov    %esp,%ebp
    82c6:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    82c9:	a1 80 ff 00 00       	mov    0xff80,%eax
    82ce:	85 c0                	test   %eax,%eax
    82d0:	74 02                	je     82d4 <initialize_huffman+0x11>
    82d2:	eb 0f                	jmp    82e3 <initialize_huffman+0x20>
	read_decoder_table();
    82d4:	e8 7b d9 ff ff       	call   5c54 <read_decoder_table>
	huffman_initialized = TRUE;
    82d9:	c7 05 80 ff 00 00 01 	movl   $0x1,0xff80
    82e0:	00 00 00 
}
    82e3:	c9                   	leave  
    82e4:	c3                   	ret    

000082e5 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    82e5:	55                   	push   %ebp
    82e6:	89 e5                	mov    %esp,%ebp
    82e8:	57                   	push   %edi
    82e9:	56                   	push   %esi
    82ea:	53                   	push   %ebx
    82eb:	83 ec 2c             	sub    $0x2c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    82ee:	e8 d0 ff ff ff       	call   82c3 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    82f3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    82f6:	8b 45 14             	mov    0x14(%ebp),%eax
    82f9:	8b 4d 10             	mov    0x10(%ebp),%ecx
    82fc:	89 c2                	mov    %eax,%edx
    82fe:	c1 e2 03             	shl    $0x3,%edx
    8301:	01 c2                	add    %eax,%edx
    8303:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    830a:	89 c2                	mov    %eax,%edx
    830c:	89 c8                	mov    %ecx,%eax
    830e:	c1 e0 02             	shl    $0x2,%eax
    8311:	01 c8                	add    %ecx,%eax
    8313:	c1 e0 05             	shl    $0x5,%eax
    8316:	01 d0                	add    %edx,%eax
    8318:	01 d8                	add    %ebx,%eax
    831a:	83 c0 20             	add    $0x20,%eax
    831d:	8b 40 08             	mov    0x8(%eax),%eax
    8320:	85 c0                	test   %eax,%eax
    8322:	74 45                	je     8369 <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    8324:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8327:	8b 45 14             	mov    0x14(%ebp),%eax
    832a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    832d:	89 c2                	mov    %eax,%edx
    832f:	c1 e2 03             	shl    $0x3,%edx
    8332:	01 c2                	add    %eax,%edx
    8334:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    833b:	89 c2                	mov    %eax,%edx
    833d:	89 c8                	mov    %ecx,%eax
    833f:	c1 e0 02             	shl    $0x2,%eax
    8342:	01 c8                	add    %ecx,%eax
    8344:	c1 e0 05             	shl    $0x5,%eax
    8347:	01 d0                	add    %edx,%eax
    8349:	01 d8                	add    %ebx,%eax
    834b:	83 c0 20             	add    $0x20,%eax
    834e:	8b 40 0c             	mov    0xc(%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    8351:	83 f8 02             	cmp    $0x2,%eax
    8354:	75 13                	jne    8369 <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    8356:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    835d:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    8364:	e9 cf 00 00 00       	jmp    8438 <III_hufman_decode+0x153>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8369:	8b 45 1c             	mov    0x1c(%ebp),%eax
    836c:	8b 00                	mov    (%eax),%eax
    836e:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    8371:	8b 75 0c             	mov    0xc(%ebp),%esi
    8374:	8b 45 14             	mov    0x14(%ebp),%eax
    8377:	8b 5d 10             	mov    0x10(%ebp),%ebx
    837a:	89 c2                	mov    %eax,%edx
    837c:	c1 e2 03             	shl    $0x3,%edx
    837f:	01 c2                	add    %eax,%edx
    8381:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8388:	89 c2                	mov    %eax,%edx
    838a:	89 d8                	mov    %ebx,%eax
    838c:	c1 e0 02             	shl    $0x2,%eax
    838f:	01 d8                	add    %ebx,%eax
    8391:	c1 e0 05             	shl    $0x5,%eax
    8394:	01 d0                	add    %edx,%eax
    8396:	01 f0                	add    %esi,%eax
    8398:	83 c0 40             	add    $0x40,%eax
    839b:	8b 40 0c             	mov    0xc(%eax),%eax
    839e:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    83a1:	89 c8                	mov    %ecx,%eax
    83a3:	c1 e0 03             	shl    $0x3,%eax
    83a6:	01 c8                	add    %ecx,%eax
    83a8:	c1 e0 02             	shl    $0x2,%eax
    83ab:	01 c8                	add    %ecx,%eax
    83ad:	01 d0                	add    %edx,%eax
    83af:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    83b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    83b9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    83bc:	8b 00                	mov    (%eax),%eax
    83be:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    83c1:	8b 75 0c             	mov    0xc(%ebp),%esi
    83c4:	8b 45 14             	mov    0x14(%ebp),%eax
    83c7:	8b 5d 10             	mov    0x10(%ebp),%ebx
    83ca:	89 c2                	mov    %eax,%edx
    83cc:	c1 e2 03             	shl    $0x3,%edx
    83cf:	01 c2                	add    %eax,%edx
    83d1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    83d8:	89 c2                	mov    %eax,%edx
    83da:	89 d8                	mov    %ebx,%eax
    83dc:	c1 e0 02             	shl    $0x2,%eax
    83df:	01 d8                	add    %ebx,%eax
    83e1:	c1 e0 05             	shl    $0x5,%eax
    83e4:	01 d0                	add    %edx,%eax
    83e6:	01 f0                	add    %esi,%eax
    83e8:	83 c0 40             	add    $0x40,%eax
    83eb:	8b 70 0c             	mov    0xc(%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    83ee:	8b 7d 0c             	mov    0xc(%ebp),%edi
    83f1:	8b 45 14             	mov    0x14(%ebp),%eax
    83f4:	8b 5d 10             	mov    0x10(%ebp),%ebx
    83f7:	89 c2                	mov    %eax,%edx
    83f9:	c1 e2 03             	shl    $0x3,%edx
    83fc:	01 c2                	add    %eax,%edx
    83fe:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8405:	89 c2                	mov    %eax,%edx
    8407:	89 d8                	mov    %ebx,%eax
    8409:	c1 e0 02             	shl    $0x2,%eax
    840c:	01 d8                	add    %ebx,%eax
    840e:	c1 e0 05             	shl    $0x5,%eax
    8411:	01 d0                	add    %edx,%eax
    8413:	01 f8                	add    %edi,%eax
    8415:	83 c0 40             	add    $0x40,%eax
    8418:	8b 40 10             	mov    0x10(%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    841b:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    841d:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8420:	89 c8                	mov    %ecx,%eax
    8422:	c1 e0 03             	shl    $0x3,%eax
    8425:	01 c8                	add    %ecx,%eax
    8427:	c1 e0 02             	shl    $0x2,%eax
    842a:	01 c8                	add    %ecx,%eax
    842c:	01 d0                	add    %edx,%eax
    842e:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    8435:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    8438:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    843f:	e9 a6 01 00 00       	jmp    85ea <III_hufman_decode+0x305>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    8444:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8447:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    844a:	7d 44                	jge    8490 <III_hufman_decode+0x1ab>
    844c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    844f:	8b 45 14             	mov    0x14(%ebp),%eax
    8452:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8455:	89 c2                	mov    %eax,%edx
    8457:	c1 e2 03             	shl    $0x3,%edx
    845a:	01 c2                	add    %eax,%edx
    845c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8463:	89 c2                	mov    %eax,%edx
    8465:	89 c8                	mov    %ecx,%eax
    8467:	c1 e0 02             	shl    $0x2,%eax
    846a:	01 c8                	add    %ecx,%eax
    846c:	c1 e0 05             	shl    $0x5,%eax
    846f:	01 d0                	add    %edx,%eax
    8471:	01 d8                	add    %ebx,%eax
    8473:	83 c0 20             	add    $0x20,%eax
    8476:	8b 50 14             	mov    0x14(%eax),%edx
    8479:	89 d0                	mov    %edx,%eax
    847b:	c1 e0 02             	shl    $0x2,%eax
    847e:	01 d0                	add    %edx,%eax
    8480:	c1 e0 03             	shl    $0x3,%eax
    8483:	05 c0 3a 01 00       	add    $0x13ac0,%eax
    8488:	89 45 e0             	mov    %eax,-0x20(%ebp)
    848b:	e9 88 00 00 00       	jmp    8518 <III_hufman_decode+0x233>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    8490:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8493:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    8496:	7d 41                	jge    84d9 <III_hufman_decode+0x1f4>
    8498:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    849b:	8b 45 14             	mov    0x14(%ebp),%eax
    849e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    84a1:	89 c2                	mov    %eax,%edx
    84a3:	c1 e2 03             	shl    $0x3,%edx
    84a6:	01 c2                	add    %eax,%edx
    84a8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    84af:	89 c2                	mov    %eax,%edx
    84b1:	89 c8                	mov    %ecx,%eax
    84b3:	c1 e0 02             	shl    $0x2,%eax
    84b6:	01 c8                	add    %ecx,%eax
    84b8:	c1 e0 05             	shl    $0x5,%eax
    84bb:	01 d0                	add    %edx,%eax
    84bd:	01 d8                	add    %ebx,%eax
    84bf:	83 c0 24             	add    $0x24,%eax
    84c2:	8b 50 14             	mov    0x14(%eax),%edx
    84c5:	89 d0                	mov    %edx,%eax
    84c7:	c1 e0 02             	shl    $0x2,%eax
    84ca:	01 d0                	add    %edx,%eax
    84cc:	c1 e0 03             	shl    $0x3,%eax
    84cf:	05 c0 3a 01 00       	add    $0x13ac0,%eax
    84d4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    84d7:	eb 3f                	jmp    8518 <III_hufman_decode+0x233>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    84d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    84dc:	8b 45 14             	mov    0x14(%ebp),%eax
    84df:	8b 4d 10             	mov    0x10(%ebp),%ecx
    84e2:	89 c2                	mov    %eax,%edx
    84e4:	c1 e2 03             	shl    $0x3,%edx
    84e7:	01 c2                	add    %eax,%edx
    84e9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    84f0:	89 c2                	mov    %eax,%edx
    84f2:	89 c8                	mov    %ecx,%eax
    84f4:	c1 e0 02             	shl    $0x2,%eax
    84f7:	01 c8                	add    %ecx,%eax
    84f9:	c1 e0 05             	shl    $0x5,%eax
    84fc:	01 d0                	add    %edx,%eax
    84fe:	01 d8                	add    %ebx,%eax
    8500:	83 c0 28             	add    $0x28,%eax
    8503:	8b 50 14             	mov    0x14(%eax),%edx
    8506:	89 d0                	mov    %edx,%eax
    8508:	c1 e0 02             	shl    $0x2,%eax
    850b:	01 d0                	add    %edx,%eax
    850d:	c1 e0 03             	shl    $0x3,%eax
    8510:	05 c0 3a 01 00       	add    $0x13ac0,%eax
    8515:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    8518:	83 ec 0c             	sub    $0xc,%esp
    851b:	8d 45 c8             	lea    -0x38(%ebp),%eax
    851e:	50                   	push   %eax
    851f:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8522:	50                   	push   %eax
    8523:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8526:	50                   	push   %eax
    8527:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    852a:	50                   	push   %eax
    852b:	ff 75 e0             	pushl  -0x20(%ebp)
    852e:	e8 d9 ee ff ff       	call   740c <huffman_decoder>
    8533:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = x;
    8536:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8539:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    853e:	89 c8                	mov    %ecx,%eax
    8540:	f7 ea                	imul   %edx
    8542:	c1 fa 02             	sar    $0x2,%edx
    8545:	89 c8                	mov    %ecx,%eax
    8547:	c1 f8 1f             	sar    $0x1f,%eax
    854a:	29 c2                	sub    %eax,%edx
    854c:	89 d0                	mov    %edx,%eax
    854e:	89 c2                	mov    %eax,%edx
    8550:	89 d0                	mov    %edx,%eax
    8552:	c1 e0 03             	shl    $0x3,%eax
    8555:	01 d0                	add    %edx,%eax
    8557:	c1 e0 03             	shl    $0x3,%eax
    855a:	89 c2                	mov    %eax,%edx
    855c:	8b 45 08             	mov    0x8(%ebp),%eax
    855f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8562:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8565:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    856a:	89 c8                	mov    %ecx,%eax
    856c:	f7 ea                	imul   %edx
    856e:	c1 fa 02             	sar    $0x2,%edx
    8571:	89 c8                	mov    %ecx,%eax
    8573:	c1 f8 1f             	sar    $0x1f,%eax
    8576:	29 c2                	sub    %eax,%edx
    8578:	89 d0                	mov    %edx,%eax
    857a:	c1 e0 03             	shl    $0x3,%eax
    857d:	01 d0                	add    %edx,%eax
    857f:	01 c0                	add    %eax,%eax
    8581:	29 c1                	sub    %eax,%ecx
    8583:	89 ca                	mov    %ecx,%edx
    8585:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8588:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    858b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    858e:	8d 48 01             	lea    0x1(%eax),%ecx
    8591:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8596:	89 c8                	mov    %ecx,%eax
    8598:	f7 ea                	imul   %edx
    859a:	c1 fa 02             	sar    $0x2,%edx
    859d:	89 c8                	mov    %ecx,%eax
    859f:	c1 f8 1f             	sar    $0x1f,%eax
    85a2:	29 c2                	sub    %eax,%edx
    85a4:	89 d0                	mov    %edx,%eax
    85a6:	89 c2                	mov    %eax,%edx
    85a8:	89 d0                	mov    %edx,%eax
    85aa:	c1 e0 03             	shl    $0x3,%eax
    85ad:	01 d0                	add    %edx,%eax
    85af:	c1 e0 03             	shl    $0x3,%eax
    85b2:	89 c2                	mov    %eax,%edx
    85b4:	8b 45 08             	mov    0x8(%ebp),%eax
    85b7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    85ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    85bd:	8d 48 01             	lea    0x1(%eax),%ecx
    85c0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    85c5:	89 c8                	mov    %ecx,%eax
    85c7:	f7 ea                	imul   %edx
    85c9:	c1 fa 02             	sar    $0x2,%edx
    85cc:	89 c8                	mov    %ecx,%eax
    85ce:	c1 f8 1f             	sar    $0x1f,%eax
    85d1:	29 c2                	sub    %eax,%edx
    85d3:	89 d0                	mov    %edx,%eax
    85d5:	c1 e0 03             	shl    $0x3,%eax
    85d8:	01 d0                	add    %edx,%eax
    85da:	01 c0                	add    %eax,%eax
    85dc:	29 c1                	sub    %eax,%ecx
    85de:	89 ca                	mov    %ecx,%edx
    85e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    85e3:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    85e6:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    85ea:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    85ed:	8b 75 0c             	mov    0xc(%ebp),%esi
    85f0:	8b 45 14             	mov    0x14(%ebp),%eax
    85f3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    85f6:	89 c2                	mov    %eax,%edx
    85f8:	c1 e2 03             	shl    $0x3,%edx
    85fb:	01 c2                	add    %eax,%edx
    85fd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8604:	89 c2                	mov    %eax,%edx
    8606:	89 c8                	mov    %ecx,%eax
    8608:	c1 e0 02             	shl    $0x2,%eax
    860b:	01 c8                	add    %ecx,%eax
    860d:	c1 e0 05             	shl    $0x5,%eax
    8610:	01 d0                	add    %edx,%eax
    8612:	01 f0                	add    %esi,%eax
    8614:	83 c0 10             	add    $0x10,%eax
    8617:	8b 40 0c             	mov    0xc(%eax),%eax
    861a:	01 c0                	add    %eax,%eax
    861c:	39 c3                	cmp    %eax,%ebx
    861e:	0f 82 20 fe ff ff    	jb     8444 <III_hufman_decode+0x15f>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    8624:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8627:	8b 45 14             	mov    0x14(%ebp),%eax
    862a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    862d:	89 c2                	mov    %eax,%edx
    862f:	c1 e2 03             	shl    $0x3,%edx
    8632:	01 c2                	add    %eax,%edx
    8634:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    863b:	89 c2                	mov    %eax,%edx
    863d:	89 c8                	mov    %ecx,%eax
    863f:	c1 e0 02             	shl    $0x2,%eax
    8642:	01 c8                	add    %ecx,%eax
    8644:	c1 e0 05             	shl    $0x5,%eax
    8647:	01 d0                	add    %edx,%eax
    8649:	01 d8                	add    %ebx,%eax
    864b:	83 c0 50             	add    $0x50,%eax
    864e:	8b 40 0c             	mov    0xc(%eax),%eax
    8651:	8d 50 20             	lea    0x20(%eax),%edx
    8654:	89 d0                	mov    %edx,%eax
    8656:	c1 e0 02             	shl    $0x2,%eax
    8659:	01 d0                	add    %edx,%eax
    865b:	c1 e0 03             	shl    $0x3,%eax
    865e:	05 c0 3a 01 00       	add    $0x13ac0,%eax
    8663:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    8666:	e9 88 01 00 00       	jmp    87f3 <III_hufman_decode+0x50e>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    866b:	83 ec 0c             	sub    $0xc,%esp
    866e:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8671:	50                   	push   %eax
    8672:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8675:	50                   	push   %eax
    8676:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8679:	50                   	push   %eax
    867a:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    867d:	50                   	push   %eax
    867e:	ff 75 e0             	pushl  -0x20(%ebp)
    8681:	e8 86 ed ff ff       	call   740c <huffman_decoder>
    8686:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = v;
    8689:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    868c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8691:	89 c8                	mov    %ecx,%eax
    8693:	f7 ea                	imul   %edx
    8695:	c1 fa 02             	sar    $0x2,%edx
    8698:	89 c8                	mov    %ecx,%eax
    869a:	c1 f8 1f             	sar    $0x1f,%eax
    869d:	29 c2                	sub    %eax,%edx
    869f:	89 d0                	mov    %edx,%eax
    86a1:	89 c2                	mov    %eax,%edx
    86a3:	89 d0                	mov    %edx,%eax
    86a5:	c1 e0 03             	shl    $0x3,%eax
    86a8:	01 d0                	add    %edx,%eax
    86aa:	c1 e0 03             	shl    $0x3,%eax
    86ad:	89 c2                	mov    %eax,%edx
    86af:	8b 45 08             	mov    0x8(%ebp),%eax
    86b2:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    86b5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    86b8:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    86bd:	89 c8                	mov    %ecx,%eax
    86bf:	f7 ea                	imul   %edx
    86c1:	c1 fa 02             	sar    $0x2,%edx
    86c4:	89 c8                	mov    %ecx,%eax
    86c6:	c1 f8 1f             	sar    $0x1f,%eax
    86c9:	29 c2                	sub    %eax,%edx
    86cb:	89 d0                	mov    %edx,%eax
    86cd:	c1 e0 03             	shl    $0x3,%eax
    86d0:	01 d0                	add    %edx,%eax
    86d2:	01 c0                	add    %eax,%eax
    86d4:	29 c1                	sub    %eax,%ecx
    86d6:	89 ca                	mov    %ecx,%edx
    86d8:	8b 45 cc             	mov    -0x34(%ebp),%eax
    86db:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    86de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    86e1:	8d 48 01             	lea    0x1(%eax),%ecx
    86e4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    86e9:	89 c8                	mov    %ecx,%eax
    86eb:	f7 ea                	imul   %edx
    86ed:	c1 fa 02             	sar    $0x2,%edx
    86f0:	89 c8                	mov    %ecx,%eax
    86f2:	c1 f8 1f             	sar    $0x1f,%eax
    86f5:	29 c2                	sub    %eax,%edx
    86f7:	89 d0                	mov    %edx,%eax
    86f9:	89 c2                	mov    %eax,%edx
    86fb:	89 d0                	mov    %edx,%eax
    86fd:	c1 e0 03             	shl    $0x3,%eax
    8700:	01 d0                	add    %edx,%eax
    8702:	c1 e0 03             	shl    $0x3,%eax
    8705:	89 c2                	mov    %eax,%edx
    8707:	8b 45 08             	mov    0x8(%ebp),%eax
    870a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    870d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8710:	8d 48 01             	lea    0x1(%eax),%ecx
    8713:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8718:	89 c8                	mov    %ecx,%eax
    871a:	f7 ea                	imul   %edx
    871c:	c1 fa 02             	sar    $0x2,%edx
    871f:	89 c8                	mov    %ecx,%eax
    8721:	c1 f8 1f             	sar    $0x1f,%eax
    8724:	29 c2                	sub    %eax,%edx
    8726:	89 d0                	mov    %edx,%eax
    8728:	c1 e0 03             	shl    $0x3,%eax
    872b:	01 d0                	add    %edx,%eax
    872d:	01 c0                	add    %eax,%eax
    872f:	29 c1                	sub    %eax,%ecx
    8731:	89 ca                	mov    %ecx,%edx
    8733:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8736:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    8739:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    873c:	8d 48 02             	lea    0x2(%eax),%ecx
    873f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8744:	89 c8                	mov    %ecx,%eax
    8746:	f7 ea                	imul   %edx
    8748:	c1 fa 02             	sar    $0x2,%edx
    874b:	89 c8                	mov    %ecx,%eax
    874d:	c1 f8 1f             	sar    $0x1f,%eax
    8750:	29 c2                	sub    %eax,%edx
    8752:	89 d0                	mov    %edx,%eax
    8754:	89 c2                	mov    %eax,%edx
    8756:	89 d0                	mov    %edx,%eax
    8758:	c1 e0 03             	shl    $0x3,%eax
    875b:	01 d0                	add    %edx,%eax
    875d:	c1 e0 03             	shl    $0x3,%eax
    8760:	89 c2                	mov    %eax,%edx
    8762:	8b 45 08             	mov    0x8(%ebp),%eax
    8765:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8768:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    876b:	8d 48 02             	lea    0x2(%eax),%ecx
    876e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8773:	89 c8                	mov    %ecx,%eax
    8775:	f7 ea                	imul   %edx
    8777:	c1 fa 02             	sar    $0x2,%edx
    877a:	89 c8                	mov    %ecx,%eax
    877c:	c1 f8 1f             	sar    $0x1f,%eax
    877f:	29 c2                	sub    %eax,%edx
    8781:	89 d0                	mov    %edx,%eax
    8783:	c1 e0 03             	shl    $0x3,%eax
    8786:	01 d0                	add    %edx,%eax
    8788:	01 c0                	add    %eax,%eax
    878a:	29 c1                	sub    %eax,%ecx
    878c:	89 ca                	mov    %ecx,%edx
    878e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8791:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    8794:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8797:	8d 48 03             	lea    0x3(%eax),%ecx
    879a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    879f:	89 c8                	mov    %ecx,%eax
    87a1:	f7 ea                	imul   %edx
    87a3:	c1 fa 02             	sar    $0x2,%edx
    87a6:	89 c8                	mov    %ecx,%eax
    87a8:	c1 f8 1f             	sar    $0x1f,%eax
    87ab:	29 c2                	sub    %eax,%edx
    87ad:	89 d0                	mov    %edx,%eax
    87af:	89 c2                	mov    %eax,%edx
    87b1:	89 d0                	mov    %edx,%eax
    87b3:	c1 e0 03             	shl    $0x3,%eax
    87b6:	01 d0                	add    %edx,%eax
    87b8:	c1 e0 03             	shl    $0x3,%eax
    87bb:	89 c2                	mov    %eax,%edx
    87bd:	8b 45 08             	mov    0x8(%ebp),%eax
    87c0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    87c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    87c6:	8d 48 03             	lea    0x3(%eax),%ecx
    87c9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    87ce:	89 c8                	mov    %ecx,%eax
    87d0:	f7 ea                	imul   %edx
    87d2:	c1 fa 02             	sar    $0x2,%edx
    87d5:	89 c8                	mov    %ecx,%eax
    87d7:	c1 f8 1f             	sar    $0x1f,%eax
    87da:	29 c2                	sub    %eax,%edx
    87dc:	89 d0                	mov    %edx,%eax
    87de:	c1 e0 03             	shl    $0x3,%eax
    87e1:	01 d0                	add    %edx,%eax
    87e3:	01 c0                	add    %eax,%eax
    87e5:	29 c1                	sub    %eax,%ecx
    87e7:	89 ca                	mov    %ecx,%edx
    87e9:	8b 45 d0             	mov    -0x30(%ebp),%eax
    87ec:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    87ef:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    87f3:	e8 e8 d3 ff ff       	call   5be0 <hsstell>
    87f8:	89 c6                	mov    %eax,%esi
    87fa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    87fd:	8b 45 14             	mov    0x14(%ebp),%eax
    8800:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8803:	89 c2                	mov    %eax,%edx
    8805:	c1 e2 03             	shl    $0x3,%edx
    8808:	01 c2                	add    %eax,%edx
    880a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8811:	89 c2                	mov    %eax,%edx
    8813:	89 c8                	mov    %ecx,%eax
    8815:	c1 e0 02             	shl    $0x2,%eax
    8818:	01 c8                	add    %ecx,%eax
    881a:	c1 e0 05             	shl    $0x5,%eax
    881d:	01 d0                	add    %edx,%eax
    881f:	01 d8                	add    %ebx,%eax
    8821:	83 c0 10             	add    $0x10,%eax
    8824:	8b 50 08             	mov    0x8(%eax),%edx
    8827:	8b 45 18             	mov    0x18(%ebp),%eax
    882a:	01 d0                	add    %edx,%eax
    882c:	39 c6                	cmp    %eax,%esi
    882e:	73 0d                	jae    883d <III_hufman_decode+0x558>
    8830:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8837:	0f 8e 2e fe ff ff    	jle    866b <III_hufman_decode+0x386>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    883d:	e8 9e d3 ff ff       	call   5be0 <hsstell>
    8842:	89 c6                	mov    %eax,%esi
    8844:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8847:	8b 45 14             	mov    0x14(%ebp),%eax
    884a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    884d:	89 c2                	mov    %eax,%edx
    884f:	c1 e2 03             	shl    $0x3,%edx
    8852:	01 c2                	add    %eax,%edx
    8854:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    885b:	89 c2                	mov    %eax,%edx
    885d:	89 c8                	mov    %ecx,%eax
    885f:	c1 e0 02             	shl    $0x2,%eax
    8862:	01 c8                	add    %ecx,%eax
    8864:	c1 e0 05             	shl    $0x5,%eax
    8867:	01 d0                	add    %edx,%eax
    8869:	01 d8                	add    %ebx,%eax
    886b:	83 c0 10             	add    $0x10,%eax
    886e:	8b 50 08             	mov    0x8(%eax),%edx
    8871:	8b 45 18             	mov    0x18(%ebp),%eax
    8874:	01 d0                	add    %edx,%eax
    8876:	39 c6                	cmp    %eax,%esi
    8878:	76 4f                	jbe    88c9 <III_hufman_decode+0x5e4>
   {  i -=4;
    887a:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    887e:	e8 5d d3 ff ff       	call   5be0 <hsstell>
    8883:	89 c2                	mov    %eax,%edx
    8885:	8b 45 18             	mov    0x18(%ebp),%eax
    8888:	89 d6                	mov    %edx,%esi
    888a:	29 c6                	sub    %eax,%esi
    888c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    888f:	8b 45 14             	mov    0x14(%ebp),%eax
    8892:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8895:	89 c2                	mov    %eax,%edx
    8897:	c1 e2 03             	shl    $0x3,%edx
    889a:	01 c2                	add    %eax,%edx
    889c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    88a3:	89 c2                	mov    %eax,%edx
    88a5:	89 c8                	mov    %ecx,%eax
    88a7:	c1 e0 02             	shl    $0x2,%eax
    88aa:	01 c8                	add    %ecx,%eax
    88ac:	c1 e0 05             	shl    $0x5,%eax
    88af:	01 d0                	add    %edx,%eax
    88b1:	01 d8                	add    %ebx,%eax
    88b3:	83 c0 10             	add    $0x10,%eax
    88b6:	8b 40 08             	mov    0x8(%eax),%eax
    88b9:	29 c6                	sub    %eax,%esi
    88bb:	89 f0                	mov    %esi,%eax
    88bd:	83 ec 0c             	sub    $0xc,%esp
    88c0:	50                   	push   %eax
    88c1:	e8 5e d3 ff ff       	call   5c24 <rewindNbits>
    88c6:	83 c4 10             	add    $0x10,%esp
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    88c9:	e8 12 d3 ff ff       	call   5be0 <hsstell>
    88ce:	89 c6                	mov    %eax,%esi
    88d0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    88d3:	8b 45 14             	mov    0x14(%ebp),%eax
    88d6:	8b 4d 10             	mov    0x10(%ebp),%ecx
    88d9:	89 c2                	mov    %eax,%edx
    88db:	c1 e2 03             	shl    $0x3,%edx
    88de:	01 c2                	add    %eax,%edx
    88e0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    88e7:	89 c2                	mov    %eax,%edx
    88e9:	89 c8                	mov    %ecx,%eax
    88eb:	c1 e0 02             	shl    $0x2,%eax
    88ee:	01 c8                	add    %ecx,%eax
    88f0:	c1 e0 05             	shl    $0x5,%eax
    88f3:	01 d0                	add    %edx,%eax
    88f5:	01 d8                	add    %ebx,%eax
    88f7:	83 c0 10             	add    $0x10,%eax
    88fa:	8b 50 08             	mov    0x8(%eax),%edx
    88fd:	8b 45 18             	mov    0x18(%ebp),%eax
    8900:	01 d0                	add    %edx,%eax
    8902:	39 c6                	cmp    %eax,%esi
    8904:	73 48                	jae    894e <III_hufman_decode+0x669>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    8906:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8909:	8b 45 14             	mov    0x14(%ebp),%eax
    890c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    890f:	89 c2                	mov    %eax,%edx
    8911:	c1 e2 03             	shl    $0x3,%edx
    8914:	01 c2                	add    %eax,%edx
    8916:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    891d:	89 c2                	mov    %eax,%edx
    891f:	89 c8                	mov    %ecx,%eax
    8921:	c1 e0 02             	shl    $0x2,%eax
    8924:	01 c8                	add    %ecx,%eax
    8926:	c1 e0 05             	shl    $0x5,%eax
    8929:	01 d0                	add    %edx,%eax
    892b:	01 d8                	add    %ebx,%eax
    892d:	83 c0 10             	add    $0x10,%eax
    8930:	8b 50 08             	mov    0x8(%eax),%edx
    8933:	8b 45 18             	mov    0x18(%ebp),%eax
    8936:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8939:	e8 a2 d2 ff ff       	call   5be0 <hsstell>
    893e:	29 c3                	sub    %eax,%ebx
    8940:	89 d8                	mov    %ebx,%eax
    8942:	83 ec 0c             	sub    $0xc,%esp
    8945:	50                   	push   %eax
    8946:	e8 ac d2 ff ff       	call   5bf7 <hgetbits>
    894b:	83 c4 10             	add    $0x10,%esp

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    894e:	eb 5a                	jmp    89aa <III_hufman_decode+0x6c5>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    8950:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8953:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8958:	89 c8                	mov    %ecx,%eax
    895a:	f7 ea                	imul   %edx
    895c:	c1 fa 02             	sar    $0x2,%edx
    895f:	89 c8                	mov    %ecx,%eax
    8961:	c1 f8 1f             	sar    $0x1f,%eax
    8964:	29 c2                	sub    %eax,%edx
    8966:	89 d0                	mov    %edx,%eax
    8968:	89 c2                	mov    %eax,%edx
    896a:	89 d0                	mov    %edx,%eax
    896c:	c1 e0 03             	shl    $0x3,%eax
    896f:	01 d0                	add    %edx,%eax
    8971:	c1 e0 03             	shl    $0x3,%eax
    8974:	89 c2                	mov    %eax,%edx
    8976:	8b 45 08             	mov    0x8(%ebp),%eax
    8979:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    897c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    897f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8984:	89 c8                	mov    %ecx,%eax
    8986:	f7 ea                	imul   %edx
    8988:	c1 fa 02             	sar    $0x2,%edx
    898b:	89 c8                	mov    %ecx,%eax
    898d:	c1 f8 1f             	sar    $0x1f,%eax
    8990:	29 c2                	sub    %eax,%edx
    8992:	89 d0                	mov    %edx,%eax
    8994:	c1 e0 03             	shl    $0x3,%eax
    8997:	01 d0                	add    %edx,%eax
    8999:	01 c0                	add    %eax,%eax
    899b:	29 c1                	sub    %eax,%ecx
    899d:	89 ca                	mov    %ecx,%edx
    899f:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    89a6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    89aa:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    89b1:	7e 9d                	jle    8950 <III_hufman_decode+0x66b>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    89b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    89b6:	5b                   	pop    %ebx
    89b7:	5e                   	pop    %esi
    89b8:	5f                   	pop    %edi
    89b9:	5d                   	pop    %ebp
    89ba:	c3                   	ret    

000089bb <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    89bb:	55                   	push   %ebp
    89bc:	89 e5                	mov    %esp,%ebp
    89be:	53                   	push   %ebx
    89bf:	83 ec 34             	sub    $0x34,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    89c2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    89c9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    89cc:	8b 00                	mov    (%eax),%eax
    89ce:	8b 40 10             	mov    0x10(%eax),%eax
    89d1:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    89d4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    89db:	8b 45 14             	mov    0x14(%ebp),%eax
    89de:	8b 40 10             	mov    0x10(%eax),%eax
    89e1:	85 c0                	test   %eax,%eax
    89e3:	74 6a                	je     8a4f <III_dequantize_sample+0x94>
    89e5:	8b 45 14             	mov    0x14(%ebp),%eax
    89e8:	8b 40 14             	mov    0x14(%eax),%eax
    89eb:	83 f8 02             	cmp    $0x2,%eax
    89ee:	75 5f                	jne    8a4f <III_dequantize_sample+0x94>
		if (gr_info->mixed_block_flag)
    89f0:	8b 45 14             	mov    0x14(%ebp),%eax
    89f3:	8b 40 18             	mov    0x18(%eax),%eax
    89f6:	85 c0                	test   %eax,%eax
    89f8:	74 18                	je     8a12 <III_dequantize_sample+0x57>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    89fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
    89fd:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a03:	83 c0 04             	add    $0x4,%eax
    8a06:	05 80 fc 00 00       	add    $0xfc80,%eax
    8a0b:	8b 00                	mov    (%eax),%eax
    8a0d:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    8a10:	eb 53                	jmp    8a65 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    8a12:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8a15:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a1b:	83 c0 54             	add    $0x54,%eax
    8a1e:	05 80 fc 00 00       	add    $0xfc80,%eax
    8a23:	8b 50 0c             	mov    0xc(%eax),%edx
    8a26:	89 d0                	mov    %edx,%eax
    8a28:	01 c0                	add    %eax,%eax
    8a2a:	01 d0                	add    %edx,%eax
    8a2c:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    8a2f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8a32:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a38:	83 c0 54             	add    $0x54,%eax
    8a3b:	05 80 fc 00 00       	add    $0xfc80,%eax
    8a40:	8b 40 0c             	mov    0xc(%eax),%eax
    8a43:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    8a46:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    8a4d:	eb 16                	jmp    8a65 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    8a4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8a52:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a58:	83 c0 04             	add    $0x4,%eax
    8a5b:	05 80 fc 00 00       	add    $0xfc80,%eax
    8a60:	8b 00                	mov    (%eax),%eax
    8a62:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    8a65:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8a6c:	e9 8a 06 00 00       	jmp    90fb <III_dequantize_sample+0x740>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    8a71:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8a78:	e9 70 06 00 00       	jmp    90ed <III_dequantize_sample+0x732>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    8a7d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a80:	89 d0                	mov    %edx,%eax
    8a82:	c1 e0 03             	shl    $0x3,%eax
    8a85:	01 d0                	add    %edx,%eax
    8a87:	01 c0                	add    %eax,%eax
    8a89:	89 c2                	mov    %eax,%edx
    8a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a8e:	01 d0                	add    %edx,%eax
    8a90:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8a93:	0f 85 a7 02 00 00    	jne    8d40 <III_dequantize_sample+0x385>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8a99:	8b 45 14             	mov    0x14(%ebp),%eax
    8a9c:	8b 40 10             	mov    0x10(%eax),%eax
    8a9f:	85 c0                	test   %eax,%eax
    8aa1:	0f 84 74 02 00 00    	je     8d1b <III_dequantize_sample+0x360>
    8aa7:	8b 45 14             	mov    0x14(%ebp),%eax
    8aaa:	8b 40 14             	mov    0x14(%eax),%eax
    8aad:	83 f8 02             	cmp    $0x2,%eax
    8ab0:	0f 85 65 02 00 00    	jne    8d1b <III_dequantize_sample+0x360>
					if (gr_info->mixed_block_flag) {
    8ab6:	8b 45 14             	mov    0x14(%ebp),%eax
    8ab9:	8b 40 18             	mov    0x18(%eax),%eax
    8abc:	85 c0                	test   %eax,%eax
    8abe:	0f 84 b8 01 00 00    	je     8c7c <III_dequantize_sample+0x2c1>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    8ac4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8ac7:	89 d0                	mov    %edx,%eax
    8ac9:	c1 e0 03             	shl    $0x3,%eax
    8acc:	01 d0                	add    %edx,%eax
    8ace:	01 c0                	add    %eax,%eax
    8ad0:	89 c2                	mov    %eax,%edx
    8ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ad5:	01 c2                	add    %eax,%edx
    8ad7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8ada:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8ae0:	83 c0 20             	add    $0x20,%eax
    8ae3:	05 80 fc 00 00       	add    $0xfc80,%eax
    8ae8:	8b 00                	mov    (%eax),%eax
    8aea:	39 c2                	cmp    %eax,%edx
    8aec:	0f 85 96 00 00 00    	jne    8b88 <III_dequantize_sample+0x1cd>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    8af2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8af5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8afb:	83 c0 60             	add    $0x60,%eax
    8afe:	05 80 fc 00 00       	add    $0xfc80,%eax
    8b03:	8b 50 0c             	mov    0xc(%eax),%edx
    8b06:	89 d0                	mov    %edx,%eax
    8b08:	01 c0                	add    %eax,%eax
    8b0a:	01 d0                	add    %edx,%eax
    8b0c:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    8b0f:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8b16:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8b19:	8d 48 01             	lea    0x1(%eax),%ecx
    8b1c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8b1f:	89 d0                	mov    %edx,%eax
    8b21:	c1 e0 03             	shl    $0x3,%eax
    8b24:	01 d0                	add    %edx,%eax
    8b26:	c1 e0 02             	shl    $0x2,%eax
    8b29:	01 d0                	add    %edx,%eax
    8b2b:	01 c8                	add    %ecx,%eax
    8b2d:	83 c0 14             	add    $0x14,%eax
    8b30:	8b 0c 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    8b37:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8b3a:	89 d0                	mov    %edx,%eax
    8b3c:	c1 e0 03             	shl    $0x3,%eax
    8b3f:	01 d0                	add    %edx,%eax
    8b41:	c1 e0 02             	shl    $0x2,%eax
    8b44:	01 d0                	add    %edx,%eax
    8b46:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8b49:	01 d0                	add    %edx,%eax
    8b4b:	83 c0 14             	add    $0x14,%eax
    8b4e:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8b55:	29 c1                	sub    %eax,%ecx
    8b57:	89 c8                	mov    %ecx,%eax
    8b59:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8b5c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8b5f:	89 d0                	mov    %edx,%eax
    8b61:	c1 e0 03             	shl    $0x3,%eax
    8b64:	01 d0                	add    %edx,%eax
    8b66:	c1 e0 02             	shl    $0x2,%eax
    8b69:	01 d0                	add    %edx,%eax
    8b6b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8b6e:	01 d0                	add    %edx,%eax
    8b70:	83 c0 14             	add    $0x14,%eax
    8b73:	8b 14 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%edx
    8b7a:	89 d0                	mov    %edx,%eax
    8b7c:	01 c0                	add    %eax,%eax
    8b7e:	01 d0                	add    %edx,%eax
    8b80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8b83:	e9 91 01 00 00       	jmp    8d19 <III_dequantize_sample+0x35e>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    8b88:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8b8b:	89 d0                	mov    %edx,%eax
    8b8d:	c1 e0 03             	shl    $0x3,%eax
    8b90:	01 d0                	add    %edx,%eax
    8b92:	01 c0                	add    %eax,%eax
    8b94:	89 c2                	mov    %eax,%edx
    8b96:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8b99:	01 c2                	add    %eax,%edx
    8b9b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8b9e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8ba4:	83 c0 20             	add    $0x20,%eax
    8ba7:	05 80 fc 00 00       	add    $0xfc80,%eax
    8bac:	8b 00                	mov    (%eax),%eax
    8bae:	39 c2                	cmp    %eax,%edx
    8bb0:	7d 2a                	jge    8bdc <III_dequantize_sample+0x221>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    8bb2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8bb6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8bb9:	8d 48 01             	lea    0x1(%eax),%ecx
    8bbc:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8bbf:	89 d0                	mov    %edx,%eax
    8bc1:	c1 e0 03             	shl    $0x3,%eax
    8bc4:	01 d0                	add    %edx,%eax
    8bc6:	c1 e0 02             	shl    $0x2,%eax
    8bc9:	01 d0                	add    %edx,%eax
    8bcb:	01 c8                	add    %ecx,%eax
    8bcd:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    8bd4:	89 45 e8             	mov    %eax,-0x18(%ebp)
    8bd7:	e9 3d 01 00 00       	jmp    8d19 <III_dequantize_sample+0x35e>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8bdc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8be0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8be3:	8d 48 01             	lea    0x1(%eax),%ecx
    8be6:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8be9:	89 d0                	mov    %edx,%eax
    8beb:	c1 e0 03             	shl    $0x3,%eax
    8bee:	01 d0                	add    %edx,%eax
    8bf0:	c1 e0 02             	shl    $0x2,%eax
    8bf3:	01 d0                	add    %edx,%eax
    8bf5:	01 c8                	add    %ecx,%eax
    8bf7:	83 c0 14             	add    $0x14,%eax
    8bfa:	8b 14 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%edx
    8c01:	89 d0                	mov    %edx,%eax
    8c03:	01 c0                	add    %eax,%eax
    8c05:	01 d0                	add    %edx,%eax
    8c07:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8c0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8c0d:	8d 48 01             	lea    0x1(%eax),%ecx
    8c10:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8c13:	89 d0                	mov    %edx,%eax
    8c15:	c1 e0 03             	shl    $0x3,%eax
    8c18:	01 d0                	add    %edx,%eax
    8c1a:	c1 e0 02             	shl    $0x2,%eax
    8c1d:	01 d0                	add    %edx,%eax
    8c1f:	01 c8                	add    %ecx,%eax
    8c21:	83 c0 14             	add    $0x14,%eax
    8c24:	8b 0c 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    8c2b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8c2e:	89 d0                	mov    %edx,%eax
    8c30:	c1 e0 03             	shl    $0x3,%eax
    8c33:	01 d0                	add    %edx,%eax
    8c35:	c1 e0 02             	shl    $0x2,%eax
    8c38:	01 d0                	add    %edx,%eax
    8c3a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8c3d:	01 d0                	add    %edx,%eax
    8c3f:	83 c0 14             	add    $0x14,%eax
    8c42:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8c49:	29 c1                	sub    %eax,%ecx
    8c4b:	89 c8                	mov    %ecx,%eax
    8c4d:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8c50:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8c53:	89 d0                	mov    %edx,%eax
    8c55:	c1 e0 03             	shl    $0x3,%eax
    8c58:	01 d0                	add    %edx,%eax
    8c5a:	c1 e0 02             	shl    $0x2,%eax
    8c5d:	01 d0                	add    %edx,%eax
    8c5f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8c62:	01 d0                	add    %edx,%eax
    8c64:	83 c0 14             	add    $0x14,%eax
    8c67:	8b 14 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%edx
    8c6e:	89 d0                	mov    %edx,%eax
    8c70:	01 c0                	add    %eax,%eax
    8c72:	01 d0                	add    %edx,%eax
    8c74:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8c77:	e9 c4 00 00 00       	jmp    8d40 <III_dequantize_sample+0x385>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8c7c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8c80:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8c83:	8d 48 01             	lea    0x1(%eax),%ecx
    8c86:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8c89:	89 d0                	mov    %edx,%eax
    8c8b:	c1 e0 03             	shl    $0x3,%eax
    8c8e:	01 d0                	add    %edx,%eax
    8c90:	c1 e0 02             	shl    $0x2,%eax
    8c93:	01 d0                	add    %edx,%eax
    8c95:	01 c8                	add    %ecx,%eax
    8c97:	83 c0 14             	add    $0x14,%eax
    8c9a:	8b 14 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%edx
    8ca1:	89 d0                	mov    %edx,%eax
    8ca3:	01 c0                	add    %eax,%eax
    8ca5:	01 d0                	add    %edx,%eax
    8ca7:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8caa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8cad:	8d 48 01             	lea    0x1(%eax),%ecx
    8cb0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8cb3:	89 d0                	mov    %edx,%eax
    8cb5:	c1 e0 03             	shl    $0x3,%eax
    8cb8:	01 d0                	add    %edx,%eax
    8cba:	c1 e0 02             	shl    $0x2,%eax
    8cbd:	01 d0                	add    %edx,%eax
    8cbf:	01 c8                	add    %ecx,%eax
    8cc1:	83 c0 14             	add    $0x14,%eax
    8cc4:	8b 0c 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    8ccb:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8cce:	89 d0                	mov    %edx,%eax
    8cd0:	c1 e0 03             	shl    $0x3,%eax
    8cd3:	01 d0                	add    %edx,%eax
    8cd5:	c1 e0 02             	shl    $0x2,%eax
    8cd8:	01 d0                	add    %edx,%eax
    8cda:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8cdd:	01 d0                	add    %edx,%eax
    8cdf:	83 c0 14             	add    $0x14,%eax
    8ce2:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8ce9:	29 c1                	sub    %eax,%ecx
    8ceb:	89 c8                	mov    %ecx,%eax
    8ced:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8cf0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8cf3:	89 d0                	mov    %edx,%eax
    8cf5:	c1 e0 03             	shl    $0x3,%eax
    8cf8:	01 d0                	add    %edx,%eax
    8cfa:	c1 e0 02             	shl    $0x2,%eax
    8cfd:	01 d0                	add    %edx,%eax
    8cff:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8d02:	01 d0                	add    %edx,%eax
    8d04:	83 c0 14             	add    $0x14,%eax
    8d07:	8b 14 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%edx
    8d0e:	89 d0                	mov    %edx,%eax
    8d10:	01 c0                	add    %eax,%eax
    8d12:	01 d0                	add    %edx,%eax
    8d14:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8d17:	eb 27                	jmp    8d40 <III_dequantize_sample+0x385>
    8d19:	eb 25                	jmp    8d40 <III_dequantize_sample+0x385>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    8d1b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8d1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8d22:	8d 48 01             	lea    0x1(%eax),%ecx
    8d25:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8d28:	89 d0                	mov    %edx,%eax
    8d2a:	c1 e0 03             	shl    $0x3,%eax
    8d2d:	01 d0                	add    %edx,%eax
    8d2f:	c1 e0 02             	shl    $0x2,%eax
    8d32:	01 d0                	add    %edx,%eax
    8d34:	01 c8                	add    %ecx,%eax
    8d36:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    8d3d:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    8d40:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8d43:	89 d0                	mov    %edx,%eax
    8d45:	c1 e0 03             	shl    $0x3,%eax
    8d48:	01 d0                	add    %edx,%eax
    8d4a:	c1 e0 04             	shl    $0x4,%eax
    8d4d:	89 c2                	mov    %eax,%edx
    8d4f:	8b 45 0c             	mov    0xc(%ebp),%eax
    8d52:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8d55:	8b 45 14             	mov    0x14(%ebp),%eax
    8d58:	8b 40 08             	mov    0x8(%eax),%eax
    8d5b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8d5e:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8d65:	df 6d c8             	fildll -0x38(%ebp)
    8d68:	dd 5d d0             	fstpl  -0x30(%ebp)
    8d6b:	dd 45 d0             	fldl   -0x30(%ebp)
    8d6e:	dd 05 10 e0 00 00    	fldl   0xe010
    8d74:	de e9                	fsubrp %st,%st(1)
    8d76:	dd 05 18 e0 00 00    	fldl   0xe018
    8d7c:	de c9                	fmulp  %st,%st(1)
    8d7e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8d82:	dd 1c 24             	fstpl  (%esp)
    8d85:	dd 05 20 e0 00 00    	fldl   0xe020
    8d8b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8d8f:	dd 1c 24             	fstpl  (%esp)
    8d92:	e8 96 c1 ff ff       	call   4f2d <pow>
    8d97:	83 c4 10             	add    $0x10,%esp
    8d9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d9d:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8da0:	8b 45 14             	mov    0x14(%ebp),%eax
    8da3:	8b 40 10             	mov    0x10(%eax),%eax
    8da6:	85 c0                	test   %eax,%eax
    8da8:	0f 84 9c 01 00 00    	je     8f4a <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8dae:	8b 45 14             	mov    0x14(%ebp),%eax
    8db1:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8db4:	83 f8 02             	cmp    $0x2,%eax
    8db7:	75 0a                	jne    8dc3 <III_dequantize_sample+0x408>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8db9:	8b 45 14             	mov    0x14(%ebp),%eax
    8dbc:	8b 40 18             	mov    0x18(%eax),%eax
    8dbf:	85 c0                	test   %eax,%eax
    8dc1:	74 27                	je     8dea <III_dequantize_sample+0x42f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8dc3:	8b 45 14             	mov    0x14(%ebp),%eax
    8dc6:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8dc9:	83 f8 02             	cmp    $0x2,%eax
    8dcc:	0f 85 78 01 00 00    	jne    8f4a <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8dd2:	8b 45 14             	mov    0x14(%ebp),%eax
    8dd5:	8b 40 18             	mov    0x18(%eax),%eax
    8dd8:	85 c0                	test   %eax,%eax
    8dda:	0f 84 6a 01 00 00    	je     8f4a <III_dequantize_sample+0x58f>
    8de0:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8de4:	0f 8e 60 01 00 00    	jle    8f4a <III_dequantize_sample+0x58f>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    8dea:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8ded:	89 d0                	mov    %edx,%eax
    8def:	c1 e0 03             	shl    $0x3,%eax
    8df2:	01 d0                	add    %edx,%eax
    8df4:	01 c0                	add    %eax,%eax
    8df6:	89 c2                	mov    %eax,%edx
    8df8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8dfb:	01 d0                	add    %edx,%eax
    8dfd:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8e00:	99                   	cltd   
    8e01:	f7 7d e0             	idivl  -0x20(%ebp)
    8e04:	89 c2                	mov    %eax,%edx
    8e06:	8b 45 14             	mov    0x14(%ebp),%eax
    8e09:	83 c2 08             	add    $0x8,%edx
    8e0c:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    8e10:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8e13:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8e1a:	df 6d c8             	fildll -0x38(%ebp)
    8e1d:	dd 5d d0             	fstpl  -0x30(%ebp)
    8e20:	dd 45 d0             	fldl   -0x30(%ebp)
    8e23:	dd 05 28 e0 00 00    	fldl   0xe028
    8e29:	de c9                	fmulp  %st,%st(1)
    8e2b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8e2f:	dd 1c 24             	fstpl  (%esp)
    8e32:	dd 05 20 e0 00 00    	fldl   0xe020
    8e38:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8e3c:	dd 1c 24             	fstpl  (%esp)
    8e3f:	e8 e9 c0 ff ff       	call   4f2d <pow>
    8e44:	83 c4 10             	add    $0x10,%esp
    8e47:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8e4a:	89 d0                	mov    %edx,%eax
    8e4c:	c1 e0 03             	shl    $0x3,%eax
    8e4f:	01 d0                	add    %edx,%eax
    8e51:	c1 e0 04             	shl    $0x4,%eax
    8e54:	89 c2                	mov    %eax,%edx
    8e56:	8b 45 0c             	mov    0xc(%ebp),%eax
    8e59:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8e5c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8e5f:	89 d0                	mov    %edx,%eax
    8e61:	c1 e0 03             	shl    $0x3,%eax
    8e64:	01 d0                	add    %edx,%eax
    8e66:	c1 e0 04             	shl    $0x4,%eax
    8e69:	89 c2                	mov    %eax,%edx
    8e6b:	8b 45 0c             	mov    0xc(%ebp),%eax
    8e6e:	01 c2                	add    %eax,%edx
    8e70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e73:	dd 04 c2             	fldl   (%edx,%eax,8)
    8e76:	de c9                	fmulp  %st,%st(1)
    8e78:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e7b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    8e7e:	8b 45 14             	mov    0x14(%ebp),%eax
    8e81:	8b 40 40             	mov    0x40(%eax),%eax
    8e84:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8e87:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8e8e:	df 6d c8             	fildll -0x38(%ebp)
    8e91:	dd 5d d0             	fstpl  -0x30(%ebp)
    8e94:	dd 45 d0             	fldl   -0x30(%ebp)
    8e97:	d9 e8                	fld1   
    8e99:	de c1                	faddp  %st,%st(1)
    8e9b:	dd 05 30 e0 00 00    	fldl   0xe030
    8ea1:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    8ea3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8ea6:	89 d0                	mov    %edx,%eax
    8ea8:	c1 e0 03             	shl    $0x3,%eax
    8eab:	01 d0                	add    %edx,%eax
    8ead:	01 c0                	add    %eax,%eax
    8eaf:	89 c2                	mov    %eax,%edx
    8eb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8eb4:	01 d0                	add    %edx,%eax
    8eb6:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8eb9:	99                   	cltd   
    8eba:	f7 7d e0             	idivl  -0x20(%ebp)
    8ebd:	89 c2                	mov    %eax,%edx
    8ebf:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8ec2:	8b 4d 18             	mov    0x18(%ebp),%ecx
    8ec5:	89 d0                	mov    %edx,%eax
    8ec7:	01 c0                	add    %eax,%eax
    8ec9:	01 d0                	add    %edx,%eax
    8ecb:	c1 e0 02             	shl    $0x2,%eax
    8ece:	01 d0                	add    %edx,%eax
    8ed0:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    8ed3:	89 d1                	mov    %edx,%ecx
    8ed5:	89 ca                	mov    %ecx,%edx
    8ed7:	c1 e2 05             	shl    $0x5,%edx
    8eda:	29 ca                	sub    %ecx,%edx
    8edc:	01 c2                	add    %eax,%edx
    8ede:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8ee1:	01 d0                	add    %edx,%eax
    8ee3:	83 c0 14             	add    $0x14,%eax
    8ee6:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    8eea:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8eed:	db 45 c8             	fildl  -0x38(%ebp)
    8ef0:	de c9                	fmulp  %st,%st(1)
    8ef2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8ef6:	dd 1c 24             	fstpl  (%esp)
    8ef9:	dd 05 20 e0 00 00    	fldl   0xe020
    8eff:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8f03:	dd 1c 24             	fstpl  (%esp)
    8f06:	e8 22 c0 ff ff       	call   4f2d <pow>
    8f0b:	83 c4 10             	add    $0x10,%esp
    8f0e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8f11:	89 d0                	mov    %edx,%eax
    8f13:	c1 e0 03             	shl    $0x3,%eax
    8f16:	01 d0                	add    %edx,%eax
    8f18:	c1 e0 04             	shl    $0x4,%eax
    8f1b:	89 c2                	mov    %eax,%edx
    8f1d:	8b 45 0c             	mov    0xc(%ebp),%eax
    8f20:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8f23:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8f26:	89 d0                	mov    %edx,%eax
    8f28:	c1 e0 03             	shl    $0x3,%eax
    8f2b:	01 d0                	add    %edx,%eax
    8f2d:	c1 e0 04             	shl    $0x4,%eax
    8f30:	89 c2                	mov    %eax,%edx
    8f32:	8b 45 0c             	mov    0xc(%ebp),%eax
    8f35:	01 c2                	add    %eax,%edx
    8f37:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8f3a:	dd 04 c2             	fldl   (%edx,%eax,8)
    8f3d:	de c9                	fmulp  %st,%st(1)
    8f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8f42:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    8f45:	e9 c0 00 00 00       	jmp    900a <III_dequantize_sample+0x64f>
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    8f4a:	8b 45 14             	mov    0x14(%ebp),%eax
    8f4d:	8b 40 40             	mov    0x40(%eax),%eax
    8f50:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8f53:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8f5a:	df 6d c8             	fildll -0x38(%ebp)
    8f5d:	dd 5d d0             	fstpl  -0x30(%ebp)
    8f60:	dd 45 d0             	fldl   -0x30(%ebp)
    8f63:	d9 e8                	fld1   
    8f65:	de c1                	faddp  %st,%st(1)
    8f67:	dd 05 30 e0 00 00    	fldl   0xe030
    8f6d:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    8f6f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8f72:	8b 45 18             	mov    0x18(%ebp),%eax
    8f75:	89 c2                	mov    %eax,%edx
    8f77:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8f7a:	89 c2                	mov    %eax,%edx
    8f7c:	89 d0                	mov    %edx,%eax
    8f7e:	c1 e0 05             	shl    $0x5,%eax
    8f81:	29 d0                	sub    %edx,%eax
    8f83:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8f86:	01 d0                	add    %edx,%eax
    8f88:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    8f8b:	89 c1                	mov    %eax,%ecx
    8f8d:	8b 45 14             	mov    0x14(%ebp),%eax
    8f90:	8b 50 3c             	mov    0x3c(%eax),%edx
    8f93:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8f96:	8b 04 85 40 fe 00 00 	mov    0xfe40(,%eax,4),%eax
    8f9d:	0f af c2             	imul   %edx,%eax
    8fa0:	01 c8                	add    %ecx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    8fa2:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8fa5:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8fac:	df 6d c8             	fildll -0x38(%ebp)
    8faf:	dd 5d d0             	fstpl  -0x30(%ebp)
    8fb2:	dd 45 d0             	fldl   -0x30(%ebp)
    8fb5:	de c9                	fmulp  %st,%st(1)
    8fb7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8fbb:	dd 1c 24             	fstpl  (%esp)
    8fbe:	dd 05 20 e0 00 00    	fldl   0xe020
    8fc4:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8fc8:	dd 1c 24             	fstpl  (%esp)
    8fcb:	e8 5d bf ff ff       	call   4f2d <pow>
    8fd0:	83 c4 10             	add    $0x10,%esp
    8fd3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8fd6:	89 d0                	mov    %edx,%eax
    8fd8:	c1 e0 03             	shl    $0x3,%eax
    8fdb:	01 d0                	add    %edx,%eax
    8fdd:	c1 e0 04             	shl    $0x4,%eax
    8fe0:	89 c2                	mov    %eax,%edx
    8fe2:	8b 45 0c             	mov    0xc(%ebp),%eax
    8fe5:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8fe8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8feb:	89 d0                	mov    %edx,%eax
    8fed:	c1 e0 03             	shl    $0x3,%eax
    8ff0:	01 d0                	add    %edx,%eax
    8ff2:	c1 e0 04             	shl    $0x4,%eax
    8ff5:	89 c2                	mov    %eax,%edx
    8ff7:	8b 45 0c             	mov    0xc(%ebp),%eax
    8ffa:	01 c2                	add    %eax,%edx
    8ffc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8fff:	dd 04 c2             	fldl   (%edx,%eax,8)
    9002:	de c9                	fmulp  %st,%st(1)
    9004:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9007:	dd 1c c1             	fstpl  (%ecx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    900a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    900d:	89 d0                	mov    %edx,%eax
    900f:	c1 e0 03             	shl    $0x3,%eax
    9012:	01 d0                	add    %edx,%eax
    9014:	c1 e0 03             	shl    $0x3,%eax
    9017:	89 c2                	mov    %eax,%edx
    9019:	8b 45 08             	mov    0x8(%ebp),%eax
    901c:	01 c2                	add    %eax,%edx
    901e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9021:	8b 04 82             	mov    (%edx,%eax,4),%eax
    9024:	c1 e8 1f             	shr    $0x1f,%eax
    9027:	0f b6 c0             	movzbl %al,%eax
    902a:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    902d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9030:	89 d0                	mov    %edx,%eax
    9032:	c1 e0 03             	shl    $0x3,%eax
    9035:	01 d0                	add    %edx,%eax
    9037:	c1 e0 03             	shl    $0x3,%eax
    903a:	89 c2                	mov    %eax,%edx
    903c:	8b 45 08             	mov    0x8(%ebp),%eax
    903f:	01 c2                	add    %eax,%edx
    9041:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9044:	8b 04 82             	mov    (%edx,%eax,4),%eax
    9047:	83 ec 0c             	sub    $0xc,%esp
    904a:	50                   	push   %eax
    904b:	e8 c7 bd ff ff       	call   4e17 <abs>
    9050:	83 c4 10             	add    $0x10,%esp
    9053:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9056:	db 45 c8             	fildl  -0x38(%ebp)
    9059:	dd 05 38 e0 00 00    	fldl   0xe038
    905f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9063:	dd 1c 24             	fstpl  (%esp)
    9066:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    906a:	dd 1c 24             	fstpl  (%esp)
    906d:	e8 bb be ff ff       	call   4f2d <pow>
    9072:	83 c4 10             	add    $0x10,%esp
    9075:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9078:	89 d0                	mov    %edx,%eax
    907a:	c1 e0 03             	shl    $0x3,%eax
    907d:	01 d0                	add    %edx,%eax
    907f:	c1 e0 04             	shl    $0x4,%eax
    9082:	89 c2                	mov    %eax,%edx
    9084:	8b 45 0c             	mov    0xc(%ebp),%eax
    9087:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    908a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    908d:	89 d0                	mov    %edx,%eax
    908f:	c1 e0 03             	shl    $0x3,%eax
    9092:	01 d0                	add    %edx,%eax
    9094:	c1 e0 04             	shl    $0x4,%eax
    9097:	89 c2                	mov    %eax,%edx
    9099:	8b 45 0c             	mov    0xc(%ebp),%eax
    909c:	01 c2                	add    %eax,%edx
    909e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90a1:	dd 04 c2             	fldl   (%edx,%eax,8)
    90a4:	de c9                	fmulp  %st,%st(1)
    90a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90a9:	dd 1c c1             	fstpl  (%ecx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    90ac:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    90b0:	74 37                	je     90e9 <III_dequantize_sample+0x72e>
    90b2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    90b5:	89 d0                	mov    %edx,%eax
    90b7:	c1 e0 03             	shl    $0x3,%eax
    90ba:	01 d0                	add    %edx,%eax
    90bc:	c1 e0 04             	shl    $0x4,%eax
    90bf:	89 c2                	mov    %eax,%edx
    90c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    90c4:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    90c7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    90ca:	89 d0                	mov    %edx,%eax
    90cc:	c1 e0 03             	shl    $0x3,%eax
    90cf:	01 d0                	add    %edx,%eax
    90d1:	c1 e0 04             	shl    $0x4,%eax
    90d4:	89 c2                	mov    %eax,%edx
    90d6:	8b 45 0c             	mov    0xc(%ebp),%eax
    90d9:	01 c2                	add    %eax,%edx
    90db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90de:	dd 04 c2             	fldl   (%edx,%eax,8)
    90e1:	d9 e0                	fchs   
    90e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90e6:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    90e9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    90ed:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    90f1:	0f 8e 86 f9 ff ff    	jle    8a7d <III_dequantize_sample+0xc2>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    90f7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    90fb:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    90ff:	0f 8e 6c f9 ff ff    	jle    8a71 <III_dequantize_sample+0xb6>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    9105:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    9108:	c9                   	leave  
    9109:	c3                   	ret    

0000910a <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    910a:	55                   	push   %ebp
    910b:	89 e5                	mov    %esp,%ebp
    910d:	57                   	push   %edi
    910e:	56                   	push   %esi
    910f:	53                   	push   %ebx
    9110:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    9113:	8b 45 14             	mov    0x14(%ebp),%eax
    9116:	8b 00                	mov    (%eax),%eax
    9118:	8b 40 10             	mov    0x10(%eax),%eax
    911b:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    911e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9125:	eb 33                	jmp    915a <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    9127:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    912e:	eb 20                	jmp    9150 <III_reorder+0x46>
         ro[sb][ss] = 0;
    9130:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9133:	89 d0                	mov    %edx,%eax
    9135:	c1 e0 03             	shl    $0x3,%eax
    9138:	01 d0                	add    %edx,%eax
    913a:	c1 e0 04             	shl    $0x4,%eax
    913d:	89 c2                	mov    %eax,%edx
    913f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9142:	01 c2                	add    %eax,%edx
    9144:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9147:	d9 ee                	fldz   
    9149:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    914c:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9150:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9154:	7e da                	jle    9130 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    9156:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    915a:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    915e:	7e c7                	jle    9127 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    9160:	8b 45 10             	mov    0x10(%ebp),%eax
    9163:	8b 40 10             	mov    0x10(%eax),%eax
    9166:	85 c0                	test   %eax,%eax
    9168:	0f 84 b8 03 00 00    	je     9526 <III_reorder+0x41c>
    916e:	8b 45 10             	mov    0x10(%ebp),%eax
    9171:	8b 40 14             	mov    0x14(%eax),%eax
    9174:	83 f8 02             	cmp    $0x2,%eax
    9177:	0f 85 a9 03 00 00    	jne    9526 <III_reorder+0x41c>
      if (gr_info->mixed_block_flag) {
    917d:	8b 45 10             	mov    0x10(%ebp),%eax
    9180:	8b 40 18             	mov    0x18(%eax),%eax
    9183:	85 c0                	test   %eax,%eax
    9185:	0f 84 06 02 00 00    	je     9391 <III_reorder+0x287>
         for (sb=0 ; sb < 2 ; sb++)
    918b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9192:	eb 4c                	jmp    91e0 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    9194:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    919b:	eb 39                	jmp    91d6 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    919d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    91a0:	89 d0                	mov    %edx,%eax
    91a2:	c1 e0 03             	shl    $0x3,%eax
    91a5:	01 d0                	add    %edx,%eax
    91a7:	c1 e0 04             	shl    $0x4,%eax
    91aa:	89 c2                	mov    %eax,%edx
    91ac:	8b 45 0c             	mov    0xc(%ebp),%eax
    91af:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    91b2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    91b5:	89 d0                	mov    %edx,%eax
    91b7:	c1 e0 03             	shl    $0x3,%eax
    91ba:	01 d0                	add    %edx,%eax
    91bc:	c1 e0 04             	shl    $0x4,%eax
    91bf:	89 c2                	mov    %eax,%edx
    91c1:	8b 45 08             	mov    0x8(%ebp),%eax
    91c4:	01 c2                	add    %eax,%edx
    91c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    91c9:	dd 04 c2             	fldl   (%edx,%eax,8)
    91cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    91cf:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    91d2:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    91d6:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    91da:	7e c1                	jle    919d <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    91dc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    91e0:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    91e4:	7e ae                	jle    9194 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    91e6:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    91ed:	8b 45 d0             	mov    -0x30(%ebp),%eax
    91f0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    91f6:	83 c0 5c             	add    $0x5c,%eax
    91f9:	05 80 fc 00 00       	add    $0xfc80,%eax
    91fe:	8b 40 0c             	mov    0xc(%eax),%eax
    9201:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    9204:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9207:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    920d:	83 c0 60             	add    $0x60,%eax
    9210:	05 80 fc 00 00       	add    $0xfc80,%eax
    9215:	8b 40 0c             	mov    0xc(%eax),%eax
    9218:	2b 45 e8             	sub    -0x18(%ebp),%eax
    921b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    921e:	e9 5f 01 00 00       	jmp    9382 <III_reorder+0x278>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9223:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    922a:	e9 fd 00 00 00       	jmp    932c <III_reorder+0x222>
                  for(freq=0;freq<sfb_lines;freq++) {
    922f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    9236:	e9 e1 00 00 00       	jmp    931c <III_reorder+0x212>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    923b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    923e:	89 d0                	mov    %edx,%eax
    9240:	01 c0                	add    %eax,%eax
    9242:	01 c2                	add    %eax,%edx
    9244:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9247:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    924b:	01 c2                	add    %eax,%edx
    924d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9250:	01 d0                	add    %edx,%eax
    9252:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    9255:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9258:	89 d0                	mov    %edx,%eax
    925a:	01 c0                	add    %eax,%eax
    925c:	01 c2                	add    %eax,%edx
    925e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9261:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9264:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    9267:	89 d0                	mov    %edx,%eax
    9269:	01 c0                	add    %eax,%eax
    926b:	01 d0                	add    %edx,%eax
    926d:	01 c8                	add    %ecx,%eax
    926f:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9272:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    9275:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    927a:	89 c8                	mov    %ecx,%eax
    927c:	f7 ea                	imul   %edx
    927e:	c1 fa 02             	sar    $0x2,%edx
    9281:	89 c8                	mov    %ecx,%eax
    9283:	c1 f8 1f             	sar    $0x1f,%eax
    9286:	29 c2                	sub    %eax,%edx
    9288:	89 d0                	mov    %edx,%eax
    928a:	89 c2                	mov    %eax,%edx
    928c:	89 d0                	mov    %edx,%eax
    928e:	c1 e0 03             	shl    $0x3,%eax
    9291:	01 d0                	add    %edx,%eax
    9293:	c1 e0 04             	shl    $0x4,%eax
    9296:	89 c2                	mov    %eax,%edx
    9298:	8b 45 0c             	mov    0xc(%ebp),%eax
    929b:	8d 34 02             	lea    (%edx,%eax,1),%esi
    929e:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    92a1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    92a6:	89 d8                	mov    %ebx,%eax
    92a8:	f7 ea                	imul   %edx
    92aa:	c1 fa 02             	sar    $0x2,%edx
    92ad:	89 d8                	mov    %ebx,%eax
    92af:	c1 f8 1f             	sar    $0x1f,%eax
    92b2:	89 d1                	mov    %edx,%ecx
    92b4:	29 c1                	sub    %eax,%ecx
    92b6:	89 c8                	mov    %ecx,%eax
    92b8:	c1 e0 03             	shl    $0x3,%eax
    92bb:	01 c8                	add    %ecx,%eax
    92bd:	01 c0                	add    %eax,%eax
    92bf:	29 c3                	sub    %eax,%ebx
    92c1:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    92c3:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    92c6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    92cb:	89 d8                	mov    %ebx,%eax
    92cd:	f7 ea                	imul   %edx
    92cf:	c1 fa 02             	sar    $0x2,%edx
    92d2:	89 d8                	mov    %ebx,%eax
    92d4:	c1 f8 1f             	sar    $0x1f,%eax
    92d7:	29 c2                	sub    %eax,%edx
    92d9:	89 d0                	mov    %edx,%eax
    92db:	89 c2                	mov    %eax,%edx
    92dd:	89 d0                	mov    %edx,%eax
    92df:	c1 e0 03             	shl    $0x3,%eax
    92e2:	01 d0                	add    %edx,%eax
    92e4:	c1 e0 04             	shl    $0x4,%eax
    92e7:	89 c2                	mov    %eax,%edx
    92e9:	8b 45 08             	mov    0x8(%ebp),%eax
    92ec:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    92ef:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    92f2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    92f7:	89 d8                	mov    %ebx,%eax
    92f9:	f7 ea                	imul   %edx
    92fb:	c1 fa 02             	sar    $0x2,%edx
    92fe:	89 d8                	mov    %ebx,%eax
    9300:	c1 f8 1f             	sar    $0x1f,%eax
    9303:	29 c2                	sub    %eax,%edx
    9305:	89 d0                	mov    %edx,%eax
    9307:	c1 e0 03             	shl    $0x3,%eax
    930a:	01 d0                	add    %edx,%eax
    930c:	01 c0                	add    %eax,%eax
    930e:	29 c3                	sub    %eax,%ebx
    9310:	89 da                	mov    %ebx,%edx
    9312:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9315:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9318:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    931c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    931f:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9322:	0f 8c 13 ff ff ff    	jl     923b <III_reorder+0x131>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9328:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    932c:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9330:	0f 8e f9 fe ff ff    	jle    922f <III_reorder+0x125>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    9336:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    933a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    933d:	89 d0                	mov    %edx,%eax
    933f:	c1 e0 03             	shl    $0x3,%eax
    9342:	01 d0                	add    %edx,%eax
    9344:	c1 e0 02             	shl    $0x2,%eax
    9347:	01 d0                	add    %edx,%eax
    9349:	8b 55 ec             	mov    -0x14(%ebp),%edx
    934c:	01 d0                	add    %edx,%eax
    934e:	83 c0 14             	add    $0x14,%eax
    9351:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
    9358:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    935b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    935e:	8d 48 01             	lea    0x1(%eax),%ecx
    9361:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9364:	89 d0                	mov    %edx,%eax
    9366:	c1 e0 03             	shl    $0x3,%eax
    9369:	01 d0                	add    %edx,%eax
    936b:	c1 e0 02             	shl    $0x2,%eax
    936e:	01 d0                	add    %edx,%eax
    9370:	01 c8                	add    %ecx,%eax
    9372:	83 c0 14             	add    $0x14,%eax
    9375:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
    937c:	2b 45 e8             	sub    -0x18(%ebp),%eax
    937f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    9382:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    9386:	0f 8e 97 fe ff ff    	jle    9223 <III_reorder+0x119>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    938c:	e9 f0 01 00 00       	jmp    9581 <III_reorder+0x477>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    9391:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9398:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    939f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    93a2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    93a8:	83 c0 54             	add    $0x54,%eax
    93ab:	05 80 fc 00 00       	add    $0xfc80,%eax
    93b0:	8b 40 0c             	mov    0xc(%eax),%eax
    93b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    93b6:	e9 5f 01 00 00       	jmp    951a <III_reorder+0x410>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    93bb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    93c2:	e9 fd 00 00 00       	jmp    94c4 <III_reorder+0x3ba>
                  for(freq=0;freq<sfb_lines;freq++) {
    93c7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    93ce:	e9 e1 00 00 00       	jmp    94b4 <III_reorder+0x3aa>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    93d3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    93d6:	89 d0                	mov    %edx,%eax
    93d8:	01 c0                	add    %eax,%eax
    93da:	01 c2                	add    %eax,%edx
    93dc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    93df:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    93e3:	01 c2                	add    %eax,%edx
    93e5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    93e8:	01 d0                	add    %edx,%eax
    93ea:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    93ed:	8b 55 e8             	mov    -0x18(%ebp),%edx
    93f0:	89 d0                	mov    %edx,%eax
    93f2:	01 c0                	add    %eax,%eax
    93f4:	01 c2                	add    %eax,%edx
    93f6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    93f9:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    93fc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    93ff:	89 d0                	mov    %edx,%eax
    9401:	01 c0                	add    %eax,%eax
    9403:	01 d0                	add    %edx,%eax
    9405:	01 c8                	add    %ecx,%eax
    9407:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    940a:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    940d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9412:	89 c8                	mov    %ecx,%eax
    9414:	f7 ea                	imul   %edx
    9416:	c1 fa 02             	sar    $0x2,%edx
    9419:	89 c8                	mov    %ecx,%eax
    941b:	c1 f8 1f             	sar    $0x1f,%eax
    941e:	29 c2                	sub    %eax,%edx
    9420:	89 d0                	mov    %edx,%eax
    9422:	89 c2                	mov    %eax,%edx
    9424:	89 d0                	mov    %edx,%eax
    9426:	c1 e0 03             	shl    $0x3,%eax
    9429:	01 d0                	add    %edx,%eax
    942b:	c1 e0 04             	shl    $0x4,%eax
    942e:	89 c2                	mov    %eax,%edx
    9430:	8b 45 0c             	mov    0xc(%ebp),%eax
    9433:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9436:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    9439:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    943e:	89 d8                	mov    %ebx,%eax
    9440:	f7 ea                	imul   %edx
    9442:	c1 fa 02             	sar    $0x2,%edx
    9445:	89 d8                	mov    %ebx,%eax
    9447:	c1 f8 1f             	sar    $0x1f,%eax
    944a:	89 d1                	mov    %edx,%ecx
    944c:	29 c1                	sub    %eax,%ecx
    944e:	89 c8                	mov    %ecx,%eax
    9450:	c1 e0 03             	shl    $0x3,%eax
    9453:	01 c8                	add    %ecx,%eax
    9455:	01 c0                	add    %eax,%eax
    9457:	29 c3                	sub    %eax,%ebx
    9459:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    945b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    945e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9463:	89 d8                	mov    %ebx,%eax
    9465:	f7 ea                	imul   %edx
    9467:	c1 fa 02             	sar    $0x2,%edx
    946a:	89 d8                	mov    %ebx,%eax
    946c:	c1 f8 1f             	sar    $0x1f,%eax
    946f:	29 c2                	sub    %eax,%edx
    9471:	89 d0                	mov    %edx,%eax
    9473:	89 c2                	mov    %eax,%edx
    9475:	89 d0                	mov    %edx,%eax
    9477:	c1 e0 03             	shl    $0x3,%eax
    947a:	01 d0                	add    %edx,%eax
    947c:	c1 e0 04             	shl    $0x4,%eax
    947f:	89 c2                	mov    %eax,%edx
    9481:	8b 45 08             	mov    0x8(%ebp),%eax
    9484:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9487:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    948a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    948f:	89 d8                	mov    %ebx,%eax
    9491:	f7 ea                	imul   %edx
    9493:	c1 fa 02             	sar    $0x2,%edx
    9496:	89 d8                	mov    %ebx,%eax
    9498:	c1 f8 1f             	sar    $0x1f,%eax
    949b:	29 c2                	sub    %eax,%edx
    949d:	89 d0                	mov    %edx,%eax
    949f:	c1 e0 03             	shl    $0x3,%eax
    94a2:	01 d0                	add    %edx,%eax
    94a4:	01 c0                	add    %eax,%eax
    94a6:	29 c3                	sub    %eax,%ebx
    94a8:	89 da                	mov    %ebx,%edx
    94aa:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    94ad:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    94b0:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    94b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    94b7:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    94ba:	0f 8c 13 ff ff ff    	jl     93d3 <III_reorder+0x2c9>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    94c0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    94c4:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    94c8:	0f 8e f9 fe ff ff    	jle    93c7 <III_reorder+0x2bd>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    94ce:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    94d2:	8b 55 d0             	mov    -0x30(%ebp),%edx
    94d5:	89 d0                	mov    %edx,%eax
    94d7:	c1 e0 03             	shl    $0x3,%eax
    94da:	01 d0                	add    %edx,%eax
    94dc:	c1 e0 02             	shl    $0x2,%eax
    94df:	01 d0                	add    %edx,%eax
    94e1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    94e4:	01 d0                	add    %edx,%eax
    94e6:	83 c0 14             	add    $0x14,%eax
    94e9:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
    94f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    94f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    94f6:	8d 48 01             	lea    0x1(%eax),%ecx
    94f9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    94fc:	89 d0                	mov    %edx,%eax
    94fe:	c1 e0 03             	shl    $0x3,%eax
    9501:	01 d0                	add    %edx,%eax
    9503:	c1 e0 02             	shl    $0x2,%eax
    9506:	01 d0                	add    %edx,%eax
    9508:	01 c8                	add    %ecx,%eax
    950a:	83 c0 14             	add    $0x14,%eax
    950d:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
    9514:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9517:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    951a:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    951e:	0f 8e 97 fe ff ff    	jle    93bb <III_reorder+0x2b1>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9524:	eb 5b                	jmp    9581 <III_reorder+0x477>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9526:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    952d:	eb 4c                	jmp    957b <III_reorder+0x471>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    952f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9536:	eb 39                	jmp    9571 <III_reorder+0x467>
            ro[sb][ss] = xr[sb][ss];
    9538:	8b 55 e0             	mov    -0x20(%ebp),%edx
    953b:	89 d0                	mov    %edx,%eax
    953d:	c1 e0 03             	shl    $0x3,%eax
    9540:	01 d0                	add    %edx,%eax
    9542:	c1 e0 04             	shl    $0x4,%eax
    9545:	89 c2                	mov    %eax,%edx
    9547:	8b 45 0c             	mov    0xc(%ebp),%eax
    954a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    954d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9550:	89 d0                	mov    %edx,%eax
    9552:	c1 e0 03             	shl    $0x3,%eax
    9555:	01 d0                	add    %edx,%eax
    9557:	c1 e0 04             	shl    $0x4,%eax
    955a:	89 c2                	mov    %eax,%edx
    955c:	8b 45 08             	mov    0x8(%ebp),%eax
    955f:	01 c2                	add    %eax,%edx
    9561:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9564:	dd 04 c2             	fldl   (%edx,%eax,8)
    9567:	8b 45 dc             	mov    -0x24(%ebp),%eax
    956a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    956d:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    9571:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    9575:	7e c1                	jle    9538 <III_reorder+0x42e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9577:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    957b:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    957f:	7e ae                	jle    952f <III_reorder+0x425>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    9581:	83 c4 34             	add    $0x34,%esp
    9584:	5b                   	pop    %ebx
    9585:	5e                   	pop    %esi
    9586:	5f                   	pop    %edi
    9587:	5d                   	pop    %ebp
    9588:	c3                   	ret    

00009589 <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9589:	55                   	push   %ebp
    958a:	89 e5                	mov    %esp,%ebp
    958c:	56                   	push   %esi
    958d:	53                   	push   %ebx
    958e:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    9594:	8b 45 18             	mov    0x18(%ebp),%eax
    9597:	8b 00                	mov    (%eax),%eax
    9599:	8b 40 10             	mov    0x10(%eax),%eax
    959c:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    959f:	8b 45 18             	mov    0x18(%ebp),%eax
    95a2:	8b 40 08             	mov    0x8(%eax),%eax
    95a5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    95a8:	8b 45 18             	mov    0x18(%ebp),%eax
    95ab:	8b 00                	mov    (%eax),%eax
    95ad:	8b 40 1c             	mov    0x1c(%eax),%eax
    95b0:	83 f8 01             	cmp    $0x1,%eax
    95b3:	75 16                	jne    95cb <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    95b5:	8b 45 18             	mov    0x18(%ebp),%eax
    95b8:	8b 00                	mov    (%eax),%eax
    95ba:	8b 40 20             	mov    0x20(%eax),%eax
    95bd:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    95c0:	85 c0                	test   %eax,%eax
    95c2:	74 07                	je     95cb <III_stereo+0x42>
    95c4:	b8 01 00 00 00       	mov    $0x1,%eax
    95c9:	eb 05                	jmp    95d0 <III_stereo+0x47>
    95cb:	b8 00 00 00 00       	mov    $0x0,%eax
    95d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    95d3:	8b 45 18             	mov    0x18(%ebp),%eax
    95d6:	8b 00                	mov    (%eax),%eax
    95d8:	8b 40 1c             	mov    0x1c(%eax),%eax
    95db:	83 f8 01             	cmp    $0x1,%eax
    95de:	75 16                	jne    95f6 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    95e0:	8b 45 18             	mov    0x18(%ebp),%eax
    95e3:	8b 00                	mov    (%eax),%eax
    95e5:	8b 40 20             	mov    0x20(%eax),%eax
    95e8:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    95eb:	85 c0                	test   %eax,%eax
    95ed:	74 07                	je     95f6 <III_stereo+0x6d>
    95ef:	b8 01 00 00 00       	mov    $0x1,%eax
    95f4:	eb 05                	jmp    95fb <III_stereo+0x72>
    95f6:	b8 00 00 00 00       	mov    $0x0,%eax
    95fb:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    95fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9605:	eb 12                	jmp    9619 <III_stereo+0x90>
      is_pos[i] = 7;
    9607:	8b 45 f0             	mov    -0x10(%ebp),%eax
    960a:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    9611:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9615:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9619:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    9620:	7e e5                	jle    9607 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    9622:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9626:	0f 85 65 0a 00 00    	jne    a091 <III_stereo+0xb08>
    962c:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9630:	0f 84 5b 0a 00 00    	je     a091 <III_stereo+0xb08>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    9636:	8b 45 14             	mov    0x14(%ebp),%eax
    9639:	8b 40 10             	mov    0x10(%eax),%eax
    963c:	85 c0                	test   %eax,%eax
    963e:	0f 84 4d 08 00 00    	je     9e91 <III_stereo+0x908>
    9644:	8b 45 14             	mov    0x14(%ebp),%eax
    9647:	8b 40 14             	mov    0x14(%eax),%eax
    964a:	83 f8 02             	cmp    $0x2,%eax
    964d:	0f 85 3e 08 00 00    	jne    9e91 <III_stereo+0x908>
      {  if( gr_info->mixed_block_flag )
    9653:	8b 45 14             	mov    0x14(%ebp),%eax
    9656:	8b 40 18             	mov    0x18(%eax),%eax
    9659:	85 c0                	test   %eax,%eax
    965b:	0f 84 f1 04 00 00    	je     9b52 <III_stereo+0x5c9>
         {  int max_sfb = 0;
    9661:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    9668:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    966f:	e9 32 03 00 00       	jmp    99a6 <III_stereo+0x41d>
            {  int sfbcnt;
               sfbcnt = 2;
    9674:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    967b:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9682:	e9 0f 01 00 00       	jmp    9796 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9687:	8b 45 f4             	mov    -0xc(%ebp),%eax
    968a:	8d 48 01             	lea    0x1(%eax),%ecx
    968d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9690:	89 d0                	mov    %edx,%eax
    9692:	c1 e0 03             	shl    $0x3,%eax
    9695:	01 d0                	add    %edx,%eax
    9697:	c1 e0 02             	shl    $0x2,%eax
    969a:	01 d0                	add    %edx,%eax
    969c:	01 c8                	add    %ecx,%eax
    969e:	83 c0 14             	add    $0x14,%eax
    96a1:	8b 0c 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%ecx
    96a8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    96ab:	89 d0                	mov    %edx,%eax
    96ad:	c1 e0 03             	shl    $0x3,%eax
    96b0:	01 d0                	add    %edx,%eax
    96b2:	c1 e0 02             	shl    $0x2,%eax
    96b5:	01 d0                	add    %edx,%eax
    96b7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    96ba:	01 d0                	add    %edx,%eax
    96bc:	83 c0 14             	add    $0x14,%eax
    96bf:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
    96c6:	29 c1                	sub    %eax,%ecx
    96c8:	89 c8                	mov    %ecx,%eax
    96ca:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    96cd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    96d0:	89 d0                	mov    %edx,%eax
    96d2:	c1 e0 03             	shl    $0x3,%eax
    96d5:	01 d0                	add    %edx,%eax
    96d7:	c1 e0 02             	shl    $0x2,%eax
    96da:	01 d0                	add    %edx,%eax
    96dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    96df:	01 d0                	add    %edx,%eax
    96e1:	83 c0 14             	add    $0x14,%eax
    96e4:	8b 14 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%edx
    96eb:	89 d0                	mov    %edx,%eax
    96ed:	01 c0                	add    %eax,%eax
    96ef:	01 c2                	add    %eax,%edx
    96f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    96f4:	83 c0 01             	add    $0x1,%eax
    96f7:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    96fb:	01 d0                	add    %edx,%eax
    96fd:	83 e8 01             	sub    $0x1,%eax
    9700:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9703:	e9 80 00 00 00       	jmp    9788 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9708:	8b 45 08             	mov    0x8(%ebp),%eax
    970b:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9711:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9714:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9719:	89 c8                	mov    %ecx,%eax
    971b:	f7 ea                	imul   %edx
    971d:	c1 fa 02             	sar    $0x2,%edx
    9720:	89 c8                	mov    %ecx,%eax
    9722:	c1 f8 1f             	sar    $0x1f,%eax
    9725:	89 d3                	mov    %edx,%ebx
    9727:	29 c3                	sub    %eax,%ebx
    9729:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    972c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9731:	89 c8                	mov    %ecx,%eax
    9733:	f7 ea                	imul   %edx
    9735:	c1 fa 02             	sar    $0x2,%edx
    9738:	89 c8                	mov    %ecx,%eax
    973a:	c1 f8 1f             	sar    $0x1f,%eax
    973d:	29 c2                	sub    %eax,%edx
    973f:	89 d0                	mov    %edx,%eax
    9741:	c1 e0 03             	shl    $0x3,%eax
    9744:	01 d0                	add    %edx,%eax
    9746:	01 c0                	add    %eax,%eax
    9748:	29 c1                	sub    %eax,%ecx
    974a:	89 ca                	mov    %ecx,%edx
    974c:	89 d8                	mov    %ebx,%eax
    974e:	c1 e0 03             	shl    $0x3,%eax
    9751:	01 d8                	add    %ebx,%eax
    9753:	01 c0                	add    %eax,%eax
    9755:	01 d0                	add    %edx,%eax
    9757:	dd 04 c6             	fldl   (%esi,%eax,8)
    975a:	d9 ee                	fldz   
    975c:	df e9                	fucomip %st(1),%st
    975e:	7a 0a                	jp     976a <III_stereo+0x1e1>
    9760:	d9 ee                	fldz   
    9762:	df e9                	fucomip %st(1),%st
    9764:	dd d8                	fstp   %st(0)
    9766:	74 18                	je     9780 <III_stereo+0x1f7>
    9768:	eb 02                	jmp    976c <III_stereo+0x1e3>
    976a:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    976c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    976f:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    9772:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9779:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    9780:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    9784:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    9788:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    978c:	0f 8f 76 ff ff ff    	jg     9708 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    9792:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    9796:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    979a:	0f 8f e7 fe ff ff    	jg     9687 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    97a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    97a3:	83 c0 01             	add    $0x1,%eax
    97a6:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    97a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97ac:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    97af:	7e 06                	jle    97b7 <III_stereo+0x22e>
                  max_sfb = sfb;
    97b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97b4:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    97b7:	e9 fa 00 00 00       	jmp    98b6 <III_stereo+0x32d>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    97bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97bf:	8d 48 01             	lea    0x1(%eax),%ecx
    97c2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    97c5:	89 d0                	mov    %edx,%eax
    97c7:	c1 e0 03             	shl    $0x3,%eax
    97ca:	01 d0                	add    %edx,%eax
    97cc:	c1 e0 02             	shl    $0x2,%eax
    97cf:	01 d0                	add    %edx,%eax
    97d1:	01 c8                	add    %ecx,%eax
    97d3:	83 c0 14             	add    $0x14,%eax
    97d6:	8b 0c 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%ecx
    97dd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    97e0:	89 d0                	mov    %edx,%eax
    97e2:	c1 e0 03             	shl    $0x3,%eax
    97e5:	01 d0                	add    %edx,%eax
    97e7:	c1 e0 02             	shl    $0x2,%eax
    97ea:	01 d0                	add    %edx,%eax
    97ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
    97ef:	01 d0                	add    %edx,%eax
    97f1:	83 c0 14             	add    $0x14,%eax
    97f4:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
    97fb:	29 c1                	sub    %eax,%ecx
    97fd:	89 c8                	mov    %ecx,%eax
    97ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9802:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9805:	89 d0                	mov    %edx,%eax
    9807:	c1 e0 03             	shl    $0x3,%eax
    980a:	01 d0                	add    %edx,%eax
    980c:	c1 e0 02             	shl    $0x2,%eax
    980f:	01 d0                	add    %edx,%eax
    9811:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9814:	01 d0                	add    %edx,%eax
    9816:	83 c0 14             	add    $0x14,%eax
    9819:	8b 14 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%edx
    9820:	89 d0                	mov    %edx,%eax
    9822:	01 c0                	add    %eax,%eax
    9824:	01 c2                	add    %eax,%edx
    9826:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9829:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    982d:	01 d0                	add    %edx,%eax
    982f:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9832:	eb 78                	jmp    98ac <III_stereo+0x323>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9834:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9837:	8b 55 ec             	mov    -0x14(%ebp),%edx
    983a:	89 d0                	mov    %edx,%eax
    983c:	01 c0                	add    %eax,%eax
    983e:	01 d0                	add    %edx,%eax
    9840:	c1 e0 02             	shl    $0x2,%eax
    9843:	01 d0                	add    %edx,%eax
    9845:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9848:	01 d0                	add    %edx,%eax
    984a:	83 c0 52             	add    $0x52,%eax
    984d:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    9851:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9854:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    985b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    985e:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9865:	83 f8 07             	cmp    $0x7,%eax
    9868:	74 3a                	je     98a4 <III_stereo+0x31b>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    986a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    986d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9874:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    987a:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9880:	dd 05 40 e0 00 00    	fldl   0xe040
    9886:	de c9                	fmulp  %st,%st(1)
    9888:	83 ec 08             	sub    $0x8,%esp
    988b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    988f:	dd 1c 24             	fstpl  (%esp)
    9892:	e8 60 b6 ff ff       	call   4ef7 <tan>
    9897:	83 c4 10             	add    $0x10,%esp
    989a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    989d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    98a4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    98a8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    98ac:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    98b0:	7f 82                	jg     9834 <III_stereo+0x2ab>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    98b2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    98b6:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    98ba:	0f 8e fc fe ff ff    	jle    97bc <III_stereo+0x233>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    98c0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    98c3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    98c9:	83 c0 7c             	add    $0x7c,%eax
    98cc:	05 80 fc 00 00       	add    $0xfc80,%eax
    98d1:	8b 50 0c             	mov    0xc(%eax),%edx
    98d4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    98d7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    98dd:	83 c0 78             	add    $0x78,%eax
    98e0:	05 80 fc 00 00       	add    $0xfc80,%eax
    98e5:	8b 40 0c             	mov    0xc(%eax),%eax
    98e8:	29 c2                	sub    %eax,%edx
    98ea:	89 d0                	mov    %edx,%eax
    98ec:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    98ef:	8b 45 c8             	mov    -0x38(%ebp),%eax
    98f2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    98f8:	83 c0 78             	add    $0x78,%eax
    98fb:	05 80 fc 00 00       	add    $0xfc80,%eax
    9900:	8b 50 0c             	mov    0xc(%eax),%edx
    9903:	89 d0                	mov    %edx,%eax
    9905:	01 c0                	add    %eax,%eax
    9907:	01 c2                	add    %eax,%edx
    9909:	8b 45 ec             	mov    -0x14(%ebp),%eax
    990c:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9910:	01 d0                	add    %edx,%eax
    9912:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9915:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9918:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    991e:	83 e8 80             	sub    $0xffffff80,%eax
    9921:	05 80 fc 00 00       	add    $0xfc80,%eax
    9926:	8b 50 0c             	mov    0xc(%eax),%edx
    9929:	8b 45 c8             	mov    -0x38(%ebp),%eax
    992c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9932:	83 c0 7c             	add    $0x7c,%eax
    9935:	05 80 fc 00 00       	add    $0xfc80,%eax
    993a:	8b 40 0c             	mov    0xc(%eax),%eax
    993d:	29 c2                	sub    %eax,%edx
    993f:	89 d0                	mov    %edx,%eax
    9941:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9944:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9947:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    994d:	83 c0 7c             	add    $0x7c,%eax
    9950:	05 80 fc 00 00       	add    $0xfc80,%eax
    9955:	8b 50 0c             	mov    0xc(%eax),%edx
    9958:	89 d0                	mov    %edx,%eax
    995a:	01 c0                	add    %eax,%eax
    995c:	01 c2                	add    %eax,%edx
    995e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9961:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9965:	01 d0                	add    %edx,%eax
    9967:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    996a:	eb 30                	jmp    999c <III_stereo+0x413>
               {  is_pos[i] = is_pos[sfb];
    996c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    996f:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9976:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9979:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    9980:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9983:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    998a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    998d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    9994:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    9998:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    999c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    99a0:	7f ca                	jg     996c <III_stereo+0x3e3>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    99a2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    99a6:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    99aa:	0f 8e c4 fc ff ff    	jle    9674 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    99b0:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    99b4:	0f 8f 93 01 00 00    	jg     9b4d <III_stereo+0x5c4>
             {  i = 2;
    99ba:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    99c1:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    99c8:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    99cf:	eb 63                	jmp    9a34 <III_stereo+0x4ab>
                {  if ( xr[1][i][ss] != 0.0 )
    99d1:	8b 45 08             	mov    0x8(%ebp),%eax
    99d4:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    99da:	8b 55 f0             	mov    -0x10(%ebp),%edx
    99dd:	89 d0                	mov    %edx,%eax
    99df:	c1 e0 03             	shl    $0x3,%eax
    99e2:	01 d0                	add    %edx,%eax
    99e4:	01 c0                	add    %eax,%eax
    99e6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    99e9:	01 d0                	add    %edx,%eax
    99eb:	dd 04 c1             	fldl   (%ecx,%eax,8)
    99ee:	d9 ee                	fldz   
    99f0:	df e9                	fucomip %st(1),%st
    99f2:	7a 0a                	jp     99fe <III_stereo+0x475>
    99f4:	d9 ee                	fldz   
    99f6:	df e9                	fucomip %st(1),%st
    99f8:	dd d8                	fstp   %st(0)
    99fa:	74 23                	je     9a1f <III_stereo+0x496>
    99fc:	eb 02                	jmp    9a00 <III_stereo+0x477>
    99fe:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    9a00:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9a03:	89 d0                	mov    %edx,%eax
    9a05:	c1 e0 03             	shl    $0x3,%eax
    9a08:	01 d0                	add    %edx,%eax
    9a0a:	01 c0                	add    %eax,%eax
    9a0c:	89 c2                	mov    %eax,%edx
    9a0e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9a11:	01 d0                	add    %edx,%eax
    9a13:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    9a16:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9a1d:	eb 15                	jmp    9a34 <III_stereo+0x4ab>
                   } else
                   {  ss--;
    9a1f:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    9a23:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9a27:	79 0b                	jns    9a34 <III_stereo+0x4ab>
                      {  i--;
    9a29:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    9a2d:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    9a34:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9a38:	79 97                	jns    99d1 <III_stereo+0x448>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    9a3a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    9a41:	eb 04                	jmp    9a47 <III_stereo+0x4be>
                   i++;
    9a43:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    9a47:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9a4a:	89 d0                	mov    %edx,%eax
    9a4c:	c1 e0 03             	shl    $0x3,%eax
    9a4f:	01 d0                	add    %edx,%eax
    9a51:	c1 e0 02             	shl    $0x2,%eax
    9a54:	01 d0                	add    %edx,%eax
    9a56:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9a59:	01 d0                	add    %edx,%eax
    9a5b:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    9a62:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9a65:	7e dc                	jle    9a43 <III_stereo+0x4ba>
                   i++;
                sfb = i;
    9a67:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9a6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    9a6d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9a70:	89 d0                	mov    %edx,%eax
    9a72:	c1 e0 03             	shl    $0x3,%eax
    9a75:	01 d0                	add    %edx,%eax
    9a77:	c1 e0 02             	shl    $0x2,%eax
    9a7a:	01 d0                	add    %edx,%eax
    9a7c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9a7f:	01 d0                	add    %edx,%eax
    9a81:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    9a88:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    9a8b:	e9 b3 00 00 00       	jmp    9b43 <III_stereo+0x5ba>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    9a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a93:	8d 48 01             	lea    0x1(%eax),%ecx
    9a96:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9a99:	89 d0                	mov    %edx,%eax
    9a9b:	c1 e0 03             	shl    $0x3,%eax
    9a9e:	01 d0                	add    %edx,%eax
    9aa0:	c1 e0 02             	shl    $0x2,%eax
    9aa3:	01 d0                	add    %edx,%eax
    9aa5:	01 c8                	add    %ecx,%eax
    9aa7:	8b 0c 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%ecx
    9aae:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9ab1:	89 d0                	mov    %edx,%eax
    9ab3:	c1 e0 03             	shl    $0x3,%eax
    9ab6:	01 d0                	add    %edx,%eax
    9ab8:	c1 e0 02             	shl    $0x2,%eax
    9abb:	01 d0                	add    %edx,%eax
    9abd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9ac0:	01 d0                	add    %edx,%eax
    9ac2:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    9ac9:	29 c1                	sub    %eax,%ecx
    9acb:	89 c8                	mov    %ecx,%eax
    9acd:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    9ad0:	eb 67                	jmp    9b39 <III_stereo+0x5b0>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    9ad2:	8b 45 10             	mov    0x10(%ebp),%eax
    9ad5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9ad8:	83 c2 3e             	add    $0x3e,%edx
    9adb:	8b 14 90             	mov    (%eax,%edx,4),%edx
    9ade:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ae1:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    9ae8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9aeb:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9af2:	83 f8 07             	cmp    $0x7,%eax
    9af5:	74 3a                	je     9b31 <III_stereo+0x5a8>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9af7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9afa:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9b01:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9b07:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9b0d:	dd 05 40 e0 00 00    	fldl   0xe040
    9b13:	de c9                	fmulp  %st,%st(1)
    9b15:	83 ec 08             	sub    $0x8,%esp
    9b18:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9b1c:	dd 1c 24             	fstpl  (%esp)
    9b1f:	e8 d3 b3 ff ff       	call   4ef7 <tan>
    9b24:	83 c4 10             	add    $0x10,%esp
    9b27:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9b2a:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    9b31:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    9b35:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9b39:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9b3d:	7f 93                	jg     9ad2 <III_stereo+0x549>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    9b3f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9b43:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    9b47:	0f 8e 43 ff ff ff    	jle    9a90 <III_stereo+0x507>
    9b4d:	e9 3a 03 00 00       	jmp    9e8c <III_stereo+0x903>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    9b52:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9b59:	e9 24 03 00 00       	jmp    9e82 <III_stereo+0x8f9>
            {  int sfbcnt;
               sfbcnt = -1;
    9b5e:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    9b65:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9b6c:	e9 0f 01 00 00       	jmp    9c80 <III_stereo+0x6f7>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9b71:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b74:	8d 48 01             	lea    0x1(%eax),%ecx
    9b77:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9b7a:	89 d0                	mov    %edx,%eax
    9b7c:	c1 e0 03             	shl    $0x3,%eax
    9b7f:	01 d0                	add    %edx,%eax
    9b81:	c1 e0 02             	shl    $0x2,%eax
    9b84:	01 d0                	add    %edx,%eax
    9b86:	01 c8                	add    %ecx,%eax
    9b88:	83 c0 14             	add    $0x14,%eax
    9b8b:	8b 0c 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%ecx
    9b92:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9b95:	89 d0                	mov    %edx,%eax
    9b97:	c1 e0 03             	shl    $0x3,%eax
    9b9a:	01 d0                	add    %edx,%eax
    9b9c:	c1 e0 02             	shl    $0x2,%eax
    9b9f:	01 d0                	add    %edx,%eax
    9ba1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9ba4:	01 d0                	add    %edx,%eax
    9ba6:	83 c0 14             	add    $0x14,%eax
    9ba9:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
    9bb0:	29 c1                	sub    %eax,%ecx
    9bb2:	89 c8                	mov    %ecx,%eax
    9bb4:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9bb7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9bba:	89 d0                	mov    %edx,%eax
    9bbc:	c1 e0 03             	shl    $0x3,%eax
    9bbf:	01 d0                	add    %edx,%eax
    9bc1:	c1 e0 02             	shl    $0x2,%eax
    9bc4:	01 d0                	add    %edx,%eax
    9bc6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9bc9:	01 d0                	add    %edx,%eax
    9bcb:	83 c0 14             	add    $0x14,%eax
    9bce:	8b 14 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%edx
    9bd5:	89 d0                	mov    %edx,%eax
    9bd7:	01 c0                	add    %eax,%eax
    9bd9:	01 c2                	add    %eax,%edx
    9bdb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9bde:	83 c0 01             	add    $0x1,%eax
    9be1:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    9be5:	01 d0                	add    %edx,%eax
    9be7:	83 e8 01             	sub    $0x1,%eax
    9bea:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9bed:	e9 80 00 00 00       	jmp    9c72 <III_stereo+0x6e9>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9bf2:	8b 45 08             	mov    0x8(%ebp),%eax
    9bf5:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9bfb:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9bfe:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9c03:	89 c8                	mov    %ecx,%eax
    9c05:	f7 ea                	imul   %edx
    9c07:	c1 fa 02             	sar    $0x2,%edx
    9c0a:	89 c8                	mov    %ecx,%eax
    9c0c:	c1 f8 1f             	sar    $0x1f,%eax
    9c0f:	89 d3                	mov    %edx,%ebx
    9c11:	29 c3                	sub    %eax,%ebx
    9c13:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9c16:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9c1b:	89 c8                	mov    %ecx,%eax
    9c1d:	f7 ea                	imul   %edx
    9c1f:	c1 fa 02             	sar    $0x2,%edx
    9c22:	89 c8                	mov    %ecx,%eax
    9c24:	c1 f8 1f             	sar    $0x1f,%eax
    9c27:	29 c2                	sub    %eax,%edx
    9c29:	89 d0                	mov    %edx,%eax
    9c2b:	c1 e0 03             	shl    $0x3,%eax
    9c2e:	01 d0                	add    %edx,%eax
    9c30:	01 c0                	add    %eax,%eax
    9c32:	29 c1                	sub    %eax,%ecx
    9c34:	89 ca                	mov    %ecx,%edx
    9c36:	89 d8                	mov    %ebx,%eax
    9c38:	c1 e0 03             	shl    $0x3,%eax
    9c3b:	01 d8                	add    %ebx,%eax
    9c3d:	01 c0                	add    %eax,%eax
    9c3f:	01 d0                	add    %edx,%eax
    9c41:	dd 04 c6             	fldl   (%esi,%eax,8)
    9c44:	d9 ee                	fldz   
    9c46:	df e9                	fucomip %st(1),%st
    9c48:	7a 0a                	jp     9c54 <III_stereo+0x6cb>
    9c4a:	d9 ee                	fldz   
    9c4c:	df e9                	fucomip %st(1),%st
    9c4e:	dd d8                	fstp   %st(0)
    9c50:	74 18                	je     9c6a <III_stereo+0x6e1>
    9c52:	eb 02                	jmp    9c56 <III_stereo+0x6cd>
    9c54:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    9c56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c59:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    9c5c:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9c63:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    9c6a:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    9c6e:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    9c72:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    9c76:	0f 8f 76 ff ff ff    	jg     9bf2 <III_stereo+0x669>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    9c7c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    9c80:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    9c84:	0f 89 e7 fe ff ff    	jns    9b71 <III_stereo+0x5e8>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    9c8a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9c8d:	83 c0 01             	add    $0x1,%eax
    9c90:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    9c93:	e9 fa 00 00 00       	jmp    9d92 <III_stereo+0x809>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9c98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c9b:	8d 48 01             	lea    0x1(%eax),%ecx
    9c9e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9ca1:	89 d0                	mov    %edx,%eax
    9ca3:	c1 e0 03             	shl    $0x3,%eax
    9ca6:	01 d0                	add    %edx,%eax
    9ca8:	c1 e0 02             	shl    $0x2,%eax
    9cab:	01 d0                	add    %edx,%eax
    9cad:	01 c8                	add    %ecx,%eax
    9caf:	83 c0 14             	add    $0x14,%eax
    9cb2:	8b 0c 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%ecx
    9cb9:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9cbc:	89 d0                	mov    %edx,%eax
    9cbe:	c1 e0 03             	shl    $0x3,%eax
    9cc1:	01 d0                	add    %edx,%eax
    9cc3:	c1 e0 02             	shl    $0x2,%eax
    9cc6:	01 d0                	add    %edx,%eax
    9cc8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9ccb:	01 d0                	add    %edx,%eax
    9ccd:	83 c0 14             	add    $0x14,%eax
    9cd0:	8b 04 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%eax
    9cd7:	29 c1                	sub    %eax,%ecx
    9cd9:	89 c8                	mov    %ecx,%eax
    9cdb:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9cde:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9ce1:	89 d0                	mov    %edx,%eax
    9ce3:	c1 e0 03             	shl    $0x3,%eax
    9ce6:	01 d0                	add    %edx,%eax
    9ce8:	c1 e0 02             	shl    $0x2,%eax
    9ceb:	01 d0                	add    %edx,%eax
    9ced:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9cf0:	01 d0                	add    %edx,%eax
    9cf2:	83 c0 14             	add    $0x14,%eax
    9cf5:	8b 14 85 8c fc 00 00 	mov    0xfc8c(,%eax,4),%edx
    9cfc:	89 d0                	mov    %edx,%eax
    9cfe:	01 c0                	add    %eax,%eax
    9d00:	01 c2                	add    %eax,%edx
    9d02:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d05:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9d09:	01 d0                	add    %edx,%eax
    9d0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9d0e:	eb 78                	jmp    9d88 <III_stereo+0x7ff>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9d10:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9d13:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9d16:	89 d0                	mov    %edx,%eax
    9d18:	01 c0                	add    %eax,%eax
    9d1a:	01 d0                	add    %edx,%eax
    9d1c:	c1 e0 02             	shl    $0x2,%eax
    9d1f:	01 d0                	add    %edx,%eax
    9d21:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9d24:	01 d0                	add    %edx,%eax
    9d26:	83 c0 52             	add    $0x52,%eax
    9d29:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    9d2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d30:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    9d37:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d3a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9d41:	83 f8 07             	cmp    $0x7,%eax
    9d44:	74 3a                	je     9d80 <III_stereo+0x7f7>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9d46:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d49:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9d50:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9d56:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9d5c:	dd 05 40 e0 00 00    	fldl   0xe040
    9d62:	de c9                	fmulp  %st,%st(1)
    9d64:	83 ec 08             	sub    $0x8,%esp
    9d67:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9d6b:	dd 1c 24             	fstpl  (%esp)
    9d6e:	e8 84 b1 ff ff       	call   4ef7 <tan>
    9d73:	83 c4 10             	add    $0x10,%esp
    9d76:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d79:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    9d80:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    9d84:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9d88:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9d8c:	7f 82                	jg     9d10 <III_stereo+0x787>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    9d8e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    9d92:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9d96:	0f 8e fc fe ff ff    	jle    9c98 <III_stereo+0x70f>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    9d9c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9d9f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9da5:	83 c0 7c             	add    $0x7c,%eax
    9da8:	05 80 fc 00 00       	add    $0xfc80,%eax
    9dad:	8b 50 0c             	mov    0xc(%eax),%edx
    9db0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9db3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9db9:	83 c0 78             	add    $0x78,%eax
    9dbc:	05 80 fc 00 00       	add    $0xfc80,%eax
    9dc1:	8b 40 0c             	mov    0xc(%eax),%eax
    9dc4:	29 c2                	sub    %eax,%edx
    9dc6:	89 d0                	mov    %edx,%eax
    9dc8:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9dcb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9dce:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9dd4:	83 c0 78             	add    $0x78,%eax
    9dd7:	05 80 fc 00 00       	add    $0xfc80,%eax
    9ddc:	8b 50 0c             	mov    0xc(%eax),%edx
    9ddf:	89 d0                	mov    %edx,%eax
    9de1:	01 c0                	add    %eax,%eax
    9de3:	01 c2                	add    %eax,%edx
    9de5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9de8:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9dec:	01 d0                	add    %edx,%eax
    9dee:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9df1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9df4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9dfa:	83 e8 80             	sub    $0xffffff80,%eax
    9dfd:	05 80 fc 00 00       	add    $0xfc80,%eax
    9e02:	8b 50 0c             	mov    0xc(%eax),%edx
    9e05:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9e08:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9e0e:	83 c0 7c             	add    $0x7c,%eax
    9e11:	05 80 fc 00 00       	add    $0xfc80,%eax
    9e16:	8b 40 0c             	mov    0xc(%eax),%eax
    9e19:	29 c2                	sub    %eax,%edx
    9e1b:	89 d0                	mov    %edx,%eax
    9e1d:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9e20:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9e23:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9e29:	83 c0 7c             	add    $0x7c,%eax
    9e2c:	05 80 fc 00 00       	add    $0xfc80,%eax
    9e31:	8b 50 0c             	mov    0xc(%eax),%edx
    9e34:	89 d0                	mov    %edx,%eax
    9e36:	01 c0                	add    %eax,%eax
    9e38:	01 c2                	add    %eax,%edx
    9e3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e3d:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9e41:	01 d0                	add    %edx,%eax
    9e43:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    9e46:	eb 30                	jmp    9e78 <III_stereo+0x8ef>
               {  is_pos[i] = is_pos[sfb];
    9e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e4b:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9e52:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e55:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    9e5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e5f:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9e66:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e69:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    9e70:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    9e74:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9e78:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9e7c:	7f ca                	jg     9e48 <III_stereo+0x8bf>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    9e7e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9e82:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9e86:	0f 8e d2 fc ff ff    	jle    9b5e <III_stereo+0x5d5>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    9e8c:	e9 00 02 00 00       	jmp    a091 <III_stereo+0xb08>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    9e91:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    9e98:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    9e9f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    9ea6:	eb 63                	jmp    9f0b <III_stereo+0x982>
         {  if ( xr[1][i][ss] != 0.0 )
    9ea8:	8b 45 08             	mov    0x8(%ebp),%eax
    9eab:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9eb1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9eb4:	89 d0                	mov    %edx,%eax
    9eb6:	c1 e0 03             	shl    $0x3,%eax
    9eb9:	01 d0                	add    %edx,%eax
    9ebb:	01 c0                	add    %eax,%eax
    9ebd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ec0:	01 d0                	add    %edx,%eax
    9ec2:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9ec5:	d9 ee                	fldz   
    9ec7:	df e9                	fucomip %st(1),%st
    9ec9:	7a 0a                	jp     9ed5 <III_stereo+0x94c>
    9ecb:	d9 ee                	fldz   
    9ecd:	df e9                	fucomip %st(1),%st
    9ecf:	dd d8                	fstp   %st(0)
    9ed1:	74 23                	je     9ef6 <III_stereo+0x96d>
    9ed3:	eb 02                	jmp    9ed7 <III_stereo+0x94e>
    9ed5:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    9ed7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9eda:	89 d0                	mov    %edx,%eax
    9edc:	c1 e0 03             	shl    $0x3,%eax
    9edf:	01 d0                	add    %edx,%eax
    9ee1:	01 c0                	add    %eax,%eax
    9ee3:	89 c2                	mov    %eax,%edx
    9ee5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9ee8:	01 d0                	add    %edx,%eax
    9eea:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    9eed:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9ef4:	eb 15                	jmp    9f0b <III_stereo+0x982>
            } else
            {  ss--;
    9ef6:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    9efa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9efe:	79 0b                	jns    9f0b <III_stereo+0x982>
               {  i--;
    9f00:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    9f04:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    9f0b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9f0f:	79 97                	jns    9ea8 <III_stereo+0x91f>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    9f11:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9f18:	eb 04                	jmp    9f1e <III_stereo+0x995>
            i++;
    9f1a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9f1e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9f21:	89 d0                	mov    %edx,%eax
    9f23:	c1 e0 03             	shl    $0x3,%eax
    9f26:	01 d0                	add    %edx,%eax
    9f28:	c1 e0 02             	shl    $0x2,%eax
    9f2b:	01 d0                	add    %edx,%eax
    9f2d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9f30:	01 d0                	add    %edx,%eax
    9f32:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    9f39:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9f3c:	7e dc                	jle    9f1a <III_stereo+0x991>
            i++;
         sfb = i;
    9f3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f41:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    9f44:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9f47:	89 d0                	mov    %edx,%eax
    9f49:	c1 e0 03             	shl    $0x3,%eax
    9f4c:	01 d0                	add    %edx,%eax
    9f4e:	c1 e0 02             	shl    $0x2,%eax
    9f51:	01 d0                	add    %edx,%eax
    9f53:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9f56:	01 d0                	add    %edx,%eax
    9f58:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    9f5f:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    9f62:	e9 b3 00 00 00       	jmp    a01a <III_stereo+0xa91>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    9f67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f6a:	8d 48 01             	lea    0x1(%eax),%ecx
    9f6d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9f70:	89 d0                	mov    %edx,%eax
    9f72:	c1 e0 03             	shl    $0x3,%eax
    9f75:	01 d0                	add    %edx,%eax
    9f77:	c1 e0 02             	shl    $0x2,%eax
    9f7a:	01 d0                	add    %edx,%eax
    9f7c:	01 c8                	add    %ecx,%eax
    9f7e:	8b 0c 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%ecx
    9f85:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9f88:	89 d0                	mov    %edx,%eax
    9f8a:	c1 e0 03             	shl    $0x3,%eax
    9f8d:	01 d0                	add    %edx,%eax
    9f8f:	c1 e0 02             	shl    $0x2,%eax
    9f92:	01 d0                	add    %edx,%eax
    9f94:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9f97:	01 d0                	add    %edx,%eax
    9f99:	8b 04 85 80 fc 00 00 	mov    0xfc80(,%eax,4),%eax
    9fa0:	29 c1                	sub    %eax,%ecx
    9fa2:	89 c8                	mov    %ecx,%eax
    9fa4:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    9fa7:	eb 67                	jmp    a010 <III_stereo+0xa87>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    9fa9:	8b 45 10             	mov    0x10(%ebp),%eax
    9fac:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9faf:	83 c2 3e             	add    $0x3e,%edx
    9fb2:	8b 14 90             	mov    (%eax,%edx,4),%edx
    9fb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9fb8:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    9fbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9fc2:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9fc9:	83 f8 07             	cmp    $0x7,%eax
    9fcc:	74 3a                	je     a008 <III_stereo+0xa7f>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9fce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9fd1:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9fd8:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9fde:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9fe4:	dd 05 40 e0 00 00    	fldl   0xe040
    9fea:	de c9                	fmulp  %st,%st(1)
    9fec:	83 ec 08             	sub    $0x8,%esp
    9fef:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9ff3:	dd 1c 24             	fstpl  (%esp)
    9ff6:	e8 fc ae ff ff       	call   4ef7 <tan>
    9ffb:	83 c4 10             	add    $0x10,%esp
    9ffe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a001:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    a008:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    a00c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a010:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a014:	7f 93                	jg     9fa9 <III_stereo+0xa20>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    a016:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a01a:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    a01e:	0f 8e 43 ff ff ff    	jle    9f67 <III_stereo+0x9de>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    a024:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a027:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a02d:	83 c0 50             	add    $0x50,%eax
    a030:	05 80 fc 00 00       	add    $0xfc80,%eax
    a035:	8b 00                	mov    (%eax),%eax
    a037:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a03a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    a03d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a043:	83 c0 54             	add    $0x54,%eax
    a046:	05 80 fc 00 00       	add    $0xfc80,%eax
    a04b:	8b 00                	mov    (%eax),%eax
    a04d:	ba 40 02 00 00       	mov    $0x240,%edx
    a052:	29 c2                	sub    %eax,%edx
    a054:	89 d0                	mov    %edx,%eax
    a056:	89 45 e8             	mov    %eax,-0x18(%ebp)
    a059:	eb 30                	jmp    a08b <III_stereo+0xb02>
         {  is_pos[i] = is_pos[sfb];
    a05b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a05e:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    a065:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a068:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    a06f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a072:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a079:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a07c:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    a083:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    a087:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    a08b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    a08f:	7f ca                	jg     a05b <III_stereo+0xad2>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a091:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a098:	eb 55                	jmp    a0ef <III_stereo+0xb66>
      for(sb=0;sb<SBLIMIT;sb++)
    a09a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a0a1:	eb 42                	jmp    a0e5 <III_stereo+0xb5c>
         for(ss=0;ss<SSLIMIT;ss++)
    a0a3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a0aa:	eb 2f                	jmp    a0db <III_stereo+0xb52>
            lr[ch][sb][ss] = 0;
    a0ac:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a0af:	89 d0                	mov    %edx,%eax
    a0b1:	c1 e0 03             	shl    $0x3,%eax
    a0b4:	01 d0                	add    %edx,%eax
    a0b6:	c1 e0 09             	shl    $0x9,%eax
    a0b9:	89 c2                	mov    %eax,%edx
    a0bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    a0be:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a0c1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a0c4:	89 d0                	mov    %edx,%eax
    a0c6:	c1 e0 03             	shl    $0x3,%eax
    a0c9:	01 d0                	add    %edx,%eax
    a0cb:	01 c0                	add    %eax,%eax
    a0cd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a0d0:	01 d0                	add    %edx,%eax
    a0d2:	d9 ee                	fldz   
    a0d4:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a0d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a0db:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a0df:	7e cb                	jle    a0ac <III_stereo+0xb23>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    a0e1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a0e5:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a0e9:	7e b8                	jle    a0a3 <III_stereo+0xb1a>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    a0eb:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a0ef:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    a0f3:	7e a5                	jle    a09a <III_stereo+0xb11>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    a0f5:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    a0f9:	0f 85 3b 02 00 00    	jne    a33a <III_stereo+0xdb1>
      for(sb=0;sb<SBLIMIT;sb++)
    a0ff:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a106:	e9 23 02 00 00       	jmp    a32e <III_stereo+0xda5>
         for(ss=0;ss<SSLIMIT;ss++) {
    a10b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a112:	e9 09 02 00 00       	jmp    a320 <III_stereo+0xd97>
            i = (sb*18)+ss;
    a117:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a11a:	89 d0                	mov    %edx,%eax
    a11c:	c1 e0 03             	shl    $0x3,%eax
    a11f:	01 d0                	add    %edx,%eax
    a121:	01 c0                	add    %eax,%eax
    a123:	89 c2                	mov    %eax,%edx
    a125:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a128:	01 d0                	add    %edx,%eax
    a12a:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    a12d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a130:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    a137:	83 f8 07             	cmp    $0x7,%eax
    a13a:	0f 85 2c 01 00 00    	jne    a26c <III_stereo+0xce3>
               if ( ms_stereo ) {
    a140:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    a144:	0f 84 b5 00 00 00    	je     a1ff <III_stereo+0xc76>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    a14a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a14d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a150:	89 d0                	mov    %edx,%eax
    a152:	c1 e0 03             	shl    $0x3,%eax
    a155:	01 d0                	add    %edx,%eax
    a157:	01 c0                	add    %eax,%eax
    a159:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a15c:	01 d0                	add    %edx,%eax
    a15e:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a161:	8b 45 08             	mov    0x8(%ebp),%eax
    a164:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a16a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a16d:	89 d0                	mov    %edx,%eax
    a16f:	c1 e0 03             	shl    $0x3,%eax
    a172:	01 d0                	add    %edx,%eax
    a174:	01 c0                	add    %eax,%eax
    a176:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a179:	01 d0                	add    %edx,%eax
    a17b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a17e:	de c1                	faddp  %st,%st(1)
    a180:	dd 05 48 e0 00 00    	fldl   0xe048
    a186:	de f9                	fdivrp %st,%st(1)
    a188:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a18b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a18e:	89 d0                	mov    %edx,%eax
    a190:	c1 e0 03             	shl    $0x3,%eax
    a193:	01 d0                	add    %edx,%eax
    a195:	01 c0                	add    %eax,%eax
    a197:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a19a:	01 d0                	add    %edx,%eax
    a19c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    a19f:	8b 45 0c             	mov    0xc(%ebp),%eax
    a1a2:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a1a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a1ab:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a1ae:	89 d0                	mov    %edx,%eax
    a1b0:	c1 e0 03             	shl    $0x3,%eax
    a1b3:	01 d0                	add    %edx,%eax
    a1b5:	01 c0                	add    %eax,%eax
    a1b7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a1ba:	01 d0                	add    %edx,%eax
    a1bc:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a1bf:	8b 45 08             	mov    0x8(%ebp),%eax
    a1c2:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a1c8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a1cb:	89 d0                	mov    %edx,%eax
    a1cd:	c1 e0 03             	shl    $0x3,%eax
    a1d0:	01 d0                	add    %edx,%eax
    a1d2:	01 c0                	add    %eax,%eax
    a1d4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a1d7:	01 d0                	add    %edx,%eax
    a1d9:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a1dc:	de e9                	fsubrp %st,%st(1)
    a1de:	dd 05 48 e0 00 00    	fldl   0xe048
    a1e4:	de f9                	fdivrp %st,%st(1)
    a1e6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a1e9:	89 d0                	mov    %edx,%eax
    a1eb:	c1 e0 03             	shl    $0x3,%eax
    a1ee:	01 d0                	add    %edx,%eax
    a1f0:	01 c0                	add    %eax,%eax
    a1f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a1f5:	01 d0                	add    %edx,%eax
    a1f7:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    a1fa:	e9 1d 01 00 00       	jmp    a31c <III_stereo+0xd93>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    a1ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a202:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a205:	89 d0                	mov    %edx,%eax
    a207:	c1 e0 03             	shl    $0x3,%eax
    a20a:	01 d0                	add    %edx,%eax
    a20c:	01 c0                	add    %eax,%eax
    a20e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a211:	01 d0                	add    %edx,%eax
    a213:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a216:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a219:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a21c:	89 d0                	mov    %edx,%eax
    a21e:	c1 e0 03             	shl    $0x3,%eax
    a221:	01 d0                	add    %edx,%eax
    a223:	01 c0                	add    %eax,%eax
    a225:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a228:	01 d0                	add    %edx,%eax
    a22a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    a22d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a230:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    a236:	8b 45 08             	mov    0x8(%ebp),%eax
    a239:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a23f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a242:	89 d0                	mov    %edx,%eax
    a244:	c1 e0 03             	shl    $0x3,%eax
    a247:	01 d0                	add    %edx,%eax
    a249:	01 c0                	add    %eax,%eax
    a24b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a24e:	01 d0                	add    %edx,%eax
    a250:	dd 04 c3             	fldl   (%ebx,%eax,8)
    a253:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a256:	89 d0                	mov    %edx,%eax
    a258:	c1 e0 03             	shl    $0x3,%eax
    a25b:	01 d0                	add    %edx,%eax
    a25d:	01 c0                	add    %eax,%eax
    a25f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a262:	01 d0                	add    %edx,%eax
    a264:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    a267:	e9 b0 00 00 00       	jmp    a31c <III_stereo+0xd93>
               }
            }
            else if (i_stereo ) {
    a26c:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    a270:	0f 84 94 00 00 00    	je     a30a <III_stereo+0xd81>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    a276:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a279:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a27c:	89 d0                	mov    %edx,%eax
    a27e:	c1 e0 03             	shl    $0x3,%eax
    a281:	01 d0                	add    %edx,%eax
    a283:	01 c0                	add    %eax,%eax
    a285:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a288:	01 d0                	add    %edx,%eax
    a28a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a28d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a290:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a297:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a29a:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a2a1:	d9 e8                	fld1   
    a2a3:	de c1                	faddp  %st,%st(1)
    a2a5:	de f9                	fdivrp %st,%st(1)
    a2a7:	de c9                	fmulp  %st,%st(1)
    a2a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a2ac:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a2af:	89 d0                	mov    %edx,%eax
    a2b1:	c1 e0 03             	shl    $0x3,%eax
    a2b4:	01 d0                	add    %edx,%eax
    a2b6:	01 c0                	add    %eax,%eax
    a2b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a2bb:	01 d0                	add    %edx,%eax
    a2bd:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    a2c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    a2c3:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    a2c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a2cc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a2cf:	89 d0                	mov    %edx,%eax
    a2d1:	c1 e0 03             	shl    $0x3,%eax
    a2d4:	01 d0                	add    %edx,%eax
    a2d6:	01 c0                	add    %eax,%eax
    a2d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a2db:	01 d0                	add    %edx,%eax
    a2dd:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2e3:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    a2ea:	d9 e8                	fld1   
    a2ec:	de c1                	faddp  %st,%st(1)
    a2ee:	d9 e8                	fld1   
    a2f0:	de f1                	fdivp  %st,%st(1)
    a2f2:	de c9                	fmulp  %st,%st(1)
    a2f4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a2f7:	89 d0                	mov    %edx,%eax
    a2f9:	c1 e0 03             	shl    $0x3,%eax
    a2fc:	01 d0                	add    %edx,%eax
    a2fe:	01 c0                	add    %eax,%eax
    a300:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a303:	01 d0                	add    %edx,%eax
    a305:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    a308:	eb 12                	jmp    a31c <III_stereo+0xd93>
            }
            else {
               printf(0,"Error in streo processing\n");
    a30a:	83 ec 08             	sub    $0x8,%esp
    a30d:	68 c0 cf 00 00       	push   $0xcfc0
    a312:	6a 00                	push   $0x0
    a314:	e8 4a a7 ff ff       	call   4a63 <printf>
    a319:	83 c4 10             	add    $0x10,%esp
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    a31c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a320:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a324:	0f 8e ed fd ff ff    	jle    a117 <III_stereo+0xb8e>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    a32a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a32e:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a332:	0f 8e d3 fd ff ff    	jle    a10b <III_stereo+0xb82>
    a338:	eb 54                	jmp    a38e <III_stereo+0xe05>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    a33a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a341:	eb 45                	jmp    a388 <III_stereo+0xdff>
         for(ss=0;ss<SSLIMIT;ss++)
    a343:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a34a:	eb 32                	jmp    a37e <III_stereo+0xdf5>
            lr[0][sb][ss] = xr[0][sb][ss];
    a34c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a34f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a352:	89 d0                	mov    %edx,%eax
    a354:	c1 e0 03             	shl    $0x3,%eax
    a357:	01 d0                	add    %edx,%eax
    a359:	01 c0                	add    %eax,%eax
    a35b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a35e:	01 d0                	add    %edx,%eax
    a360:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a363:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a366:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a369:	89 d0                	mov    %edx,%eax
    a36b:	c1 e0 03             	shl    $0x3,%eax
    a36e:	01 d0                	add    %edx,%eax
    a370:	01 c0                	add    %eax,%eax
    a372:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a375:	01 d0                	add    %edx,%eax
    a377:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a37a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a37e:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a382:	7e c8                	jle    a34c <III_stereo+0xdc3>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    a384:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a388:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a38c:	7e b5                	jle    a343 <III_stereo+0xdba>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    a38e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    a391:	5b                   	pop    %ebx
    a392:	5e                   	pop    %esi
    a393:	5d                   	pop    %ebp
    a394:	c3                   	ret    

0000a395 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    a395:	55                   	push   %ebp
    a396:	89 e5                	mov    %esp,%ebp
    a398:	83 ec 38             	sub    $0x38,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    a39b:	a1 00 ff 00 00       	mov    0xff00,%eax
    a3a0:	85 c0                	test   %eax,%eax
    a3a2:	74 72                	je     a416 <III_antialias+0x81>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    a3a4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a3ab:	eb 59                	jmp    a406 <III_antialias+0x71>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    a3ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a3b0:	dd 04 c5 c0 fe 00 00 	fldl   0xfec0(,%eax,8)
    a3b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a3ba:	dd 04 c5 c0 fe 00 00 	fldl   0xfec0(,%eax,8)
    a3c1:	de c9                	fmulp  %st,%st(1)
    a3c3:	d9 e8                	fld1   
    a3c5:	de c1                	faddp  %st,%st(1)
    a3c7:	83 ec 08             	sub    $0x8,%esp
    a3ca:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a3ce:	dd 1c 24             	fstpl  (%esp)
    a3d1:	e8 e4 ac ff ff       	call   50ba <sqrt>
    a3d6:	83 c4 10             	add    $0x10,%esp
    a3d9:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    a3dc:	d9 e8                	fld1   
    a3de:	dc 75 e0             	fdivl  -0x20(%ebp)
    a3e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a3e4:	dd 1c c5 c0 ff 00 00 	fstpl  0xffc0(,%eax,8)
         ca[i] = Ci[i]/sq;
    a3eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a3ee:	dd 04 c5 c0 fe 00 00 	fldl   0xfec0(,%eax,8)
    a3f5:	dc 75 e0             	fdivl  -0x20(%ebp)
    a3f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a3fb:	dd 1c c5 00 00 01 00 	fstpl  0x10000(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    a402:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a406:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    a40a:	7e a1                	jle    a3ad <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    a40c:	c7 05 00 ff 00 00 00 	movl   $0x0,0xff00
    a413:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    a416:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a41d:	eb 4c                	jmp    a46b <III_antialias+0xd6>
       for(ss=0;ss<SSLIMIT;ss++)
    a41f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a426:	eb 39                	jmp    a461 <III_antialias+0xcc>
          hybridIn[sb][ss] = xr[sb][ss];
    a428:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a42b:	89 d0                	mov    %edx,%eax
    a42d:	c1 e0 03             	shl    $0x3,%eax
    a430:	01 d0                	add    %edx,%eax
    a432:	c1 e0 04             	shl    $0x4,%eax
    a435:	89 c2                	mov    %eax,%edx
    a437:	8b 45 0c             	mov    0xc(%ebp),%eax
    a43a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a43d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a440:	89 d0                	mov    %edx,%eax
    a442:	c1 e0 03             	shl    $0x3,%eax
    a445:	01 d0                	add    %edx,%eax
    a447:	c1 e0 04             	shl    $0x4,%eax
    a44a:	89 c2                	mov    %eax,%edx
    a44c:	8b 45 08             	mov    0x8(%ebp),%eax
    a44f:	01 c2                	add    %eax,%edx
    a451:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a454:	dd 04 c2             	fldl   (%edx,%eax,8)
    a457:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a45a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    a45d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a461:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a465:	7e c1                	jle    a428 <III_antialias+0x93>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    a467:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a46b:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    a46f:	7e ae                	jle    a41f <III_antialias+0x8a>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    a471:	8b 45 10             	mov    0x10(%ebp),%eax
    a474:	8b 40 10             	mov    0x10(%eax),%eax
    a477:	85 c0                	test   %eax,%eax
    a479:	74 1a                	je     a495 <III_antialias+0x100>
    a47b:	8b 45 10             	mov    0x10(%ebp),%eax
    a47e:	8b 40 14             	mov    0x14(%eax),%eax
    a481:	83 f8 02             	cmp    $0x2,%eax
    a484:	75 0f                	jne    a495 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    a486:	8b 45 10             	mov    0x10(%ebp),%eax
    a489:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    a48c:	85 c0                	test   %eax,%eax
    a48e:	75 05                	jne    a495 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    a490:	e9 1c 01 00 00       	jmp    a5b1 <III_antialias+0x21c>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a495:	8b 45 10             	mov    0x10(%ebp),%eax
    a498:	8b 40 10             	mov    0x10(%eax),%eax
    a49b:	85 c0                	test   %eax,%eax
    a49d:	74 1e                	je     a4bd <III_antialias+0x128>
    a49f:	8b 45 10             	mov    0x10(%ebp),%eax
    a4a2:	8b 40 18             	mov    0x18(%eax),%eax
    a4a5:	85 c0                	test   %eax,%eax
    a4a7:	74 14                	je     a4bd <III_antialias+0x128>
     (gr_info->block_type == 2))
    a4a9:	8b 45 10             	mov    0x10(%ebp),%eax
    a4ac:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a4af:	83 f8 02             	cmp    $0x2,%eax
    a4b2:	75 09                	jne    a4bd <III_antialias+0x128>
     (gr_info->block_type == 2))
      sblim = 1;
    a4b4:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    a4bb:	eb 07                	jmp    a4c4 <III_antialias+0x12f>
   else
      sblim = SBLIMIT-1;
    a4bd:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    a4c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a4cb:	e9 d5 00 00 00       	jmp    a5a5 <III_antialias+0x210>
      for(ss=0;ss<8;ss++) {
    a4d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a4d7:	e9 bb 00 00 00       	jmp    a597 <III_antialias+0x202>
         bu = xr[sb][17-ss];
    a4dc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a4df:	89 d0                	mov    %edx,%eax
    a4e1:	c1 e0 03             	shl    $0x3,%eax
    a4e4:	01 d0                	add    %edx,%eax
    a4e6:	c1 e0 04             	shl    $0x4,%eax
    a4e9:	89 c2                	mov    %eax,%edx
    a4eb:	8b 45 08             	mov    0x8(%ebp),%eax
    a4ee:	01 c2                	add    %eax,%edx
    a4f0:	b8 11 00 00 00       	mov    $0x11,%eax
    a4f5:	2b 45 f4             	sub    -0xc(%ebp),%eax
    a4f8:	dd 04 c2             	fldl   (%edx,%eax,8)
    a4fb:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    a4fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a501:	8d 50 01             	lea    0x1(%eax),%edx
    a504:	89 d0                	mov    %edx,%eax
    a506:	c1 e0 03             	shl    $0x3,%eax
    a509:	01 d0                	add    %edx,%eax
    a50b:	c1 e0 04             	shl    $0x4,%eax
    a50e:	89 c2                	mov    %eax,%edx
    a510:	8b 45 08             	mov    0x8(%ebp),%eax
    a513:	01 c2                	add    %eax,%edx
    a515:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a518:	dd 04 c2             	fldl   (%edx,%eax,8)
    a51b:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    a51e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a521:	89 d0                	mov    %edx,%eax
    a523:	c1 e0 03             	shl    $0x3,%eax
    a526:	01 d0                	add    %edx,%eax
    a528:	c1 e0 04             	shl    $0x4,%eax
    a52b:	89 c2                	mov    %eax,%edx
    a52d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a530:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a533:	b8 11 00 00 00       	mov    $0x11,%eax
    a538:	2b 45 f4             	sub    -0xc(%ebp),%eax
    a53b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a53e:	dd 04 d5 c0 ff 00 00 	fldl   0xffc0(,%edx,8)
    a545:	dc 4d d8             	fmull  -0x28(%ebp)
    a548:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a54b:	dd 04 d5 00 00 01 00 	fldl   0x10000(,%edx,8)
    a552:	dc 4d d0             	fmull  -0x30(%ebp)
    a555:	de e9                	fsubrp %st,%st(1)
    a557:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    a55a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a55d:	8d 50 01             	lea    0x1(%eax),%edx
    a560:	89 d0                	mov    %edx,%eax
    a562:	c1 e0 03             	shl    $0x3,%eax
    a565:	01 d0                	add    %edx,%eax
    a567:	c1 e0 04             	shl    $0x4,%eax
    a56a:	89 c2                	mov    %eax,%edx
    a56c:	8b 45 0c             	mov    0xc(%ebp),%eax
    a56f:	01 c2                	add    %eax,%edx
    a571:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a574:	dd 04 c5 c0 ff 00 00 	fldl   0xffc0(,%eax,8)
    a57b:	dc 4d d0             	fmull  -0x30(%ebp)
    a57e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a581:	dd 04 c5 00 00 01 00 	fldl   0x10000(,%eax,8)
    a588:	dc 4d d8             	fmull  -0x28(%ebp)
    a58b:	de c1                	faddp  %st,%st(1)
    a58d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a590:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    a593:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a597:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    a59b:	0f 8e 3b ff ff ff    	jle    a4dc <III_antialias+0x147>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    a5a1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a5a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a5a8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    a5ab:	0f 8c 1f ff ff ff    	jl     a4d0 <III_antialias+0x13b>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    a5b1:	c9                   	leave  
    a5b2:	c3                   	ret    

0000a5b3 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    a5b3:	55                   	push   %ebp
    a5b4:	89 e5                	mov    %esp,%ebp
    a5b6:	81 ec 98 00 00 00    	sub    $0x98,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    a5bc:	a1 40 00 01 00       	mov    0x10040,%eax
    a5c1:	85 c0                	test   %eax,%eax
    a5c3:	0f 85 9f 02 00 00    	jne    a868 <inv_mdct+0x2b5>

    /* type 0 */
      for(i=0;i<36;i++)
    a5c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a5d0:	eb 33                	jmp    a605 <inv_mdct+0x52>
         win[0][i] = sin( PI/36 *(i+0.5) );
    a5d2:	db 45 f4             	fildl  -0xc(%ebp)
    a5d5:	dd 05 50 e0 00 00    	fldl   0xe050
    a5db:	de c1                	faddp  %st,%st(1)
    a5dd:	dd 05 58 e0 00 00    	fldl   0xe058
    a5e3:	de c9                	fmulp  %st,%st(1)
    a5e5:	83 ec 08             	sub    $0x8,%esp
    a5e8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a5ec:	dd 1c 24             	fstpl  (%esp)
    a5ef:	e8 38 a8 ff ff       	call   4e2c <sin>
    a5f4:	83 c4 10             	add    $0x10,%esp
    a5f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a5fa:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    a601:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a605:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a609:	7e c7                	jle    a5d2 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    a60b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a612:	eb 36                	jmp    a64a <inv_mdct+0x97>
         win[1][i] = sin( PI/36 *(i+0.5) );
    a614:	db 45 f4             	fildl  -0xc(%ebp)
    a617:	dd 05 50 e0 00 00    	fldl   0xe050
    a61d:	de c1                	faddp  %st,%st(1)
    a61f:	dd 05 58 e0 00 00    	fldl   0xe058
    a625:	de c9                	fmulp  %st,%st(1)
    a627:	83 ec 08             	sub    $0x8,%esp
    a62a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a62e:	dd 1c 24             	fstpl  (%esp)
    a631:	e8 f6 a7 ff ff       	call   4e2c <sin>
    a636:	83 c4 10             	add    $0x10,%esp
    a639:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a63c:	83 c0 24             	add    $0x24,%eax
    a63f:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    a646:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a64a:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a64e:	7e c4                	jle    a614 <inv_mdct+0x61>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    a650:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    a657:	eb 13                	jmp    a66c <inv_mdct+0xb9>
         win[1][i] = 1.0;
    a659:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a65c:	83 c0 24             	add    $0x24,%eax
    a65f:	d9 e8                	fld1   
    a661:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    a668:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a66c:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    a670:	7e e7                	jle    a659 <inv_mdct+0xa6>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    a672:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    a679:	eb 3e                	jmp    a6b9 <inv_mdct+0x106>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    a67b:	db 45 f4             	fildl  -0xc(%ebp)
    a67e:	dd 05 50 e0 00 00    	fldl   0xe050
    a684:	de c1                	faddp  %st,%st(1)
    a686:	dd 05 60 e0 00 00    	fldl   0xe060
    a68c:	de e9                	fsubrp %st,%st(1)
    a68e:	dd 05 40 e0 00 00    	fldl   0xe040
    a694:	de c9                	fmulp  %st,%st(1)
    a696:	83 ec 08             	sub    $0x8,%esp
    a699:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a69d:	dd 1c 24             	fstpl  (%esp)
    a6a0:	e8 87 a7 ff ff       	call   4e2c <sin>
    a6a5:	83 c4 10             	add    $0x10,%esp
    a6a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a6ab:	83 c0 24             	add    $0x24,%eax
    a6ae:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    a6b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a6b9:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    a6bd:	7e bc                	jle    a67b <inv_mdct+0xc8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a6bf:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    a6c6:	eb 13                	jmp    a6db <inv_mdct+0x128>
         win[1][i] = 0.0;
    a6c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a6cb:	83 c0 24             	add    $0x24,%eax
    a6ce:	d9 ee                	fldz   
    a6d0:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a6d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a6db:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a6df:	7e e7                	jle    a6c8 <inv_mdct+0x115>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a6e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a6e8:	eb 13                	jmp    a6fd <inv_mdct+0x14a>
         win[3][i] = 0.0;
    a6ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a6ed:	83 c0 6c             	add    $0x6c,%eax
    a6f0:	d9 ee                	fldz   
    a6f2:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a6f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a6fd:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    a701:	7e e7                	jle    a6ea <inv_mdct+0x137>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a703:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    a70a:	eb 3e                	jmp    a74a <inv_mdct+0x197>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    a70c:	db 45 f4             	fildl  -0xc(%ebp)
    a70f:	dd 05 50 e0 00 00    	fldl   0xe050
    a715:	de c1                	faddp  %st,%st(1)
    a717:	dd 05 68 e0 00 00    	fldl   0xe068
    a71d:	de e9                	fsubrp %st,%st(1)
    a71f:	dd 05 40 e0 00 00    	fldl   0xe040
    a725:	de c9                	fmulp  %st,%st(1)
    a727:	83 ec 08             	sub    $0x8,%esp
    a72a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a72e:	dd 1c 24             	fstpl  (%esp)
    a731:	e8 f6 a6 ff ff       	call   4e2c <sin>
    a736:	83 c4 10             	add    $0x10,%esp
    a739:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a73c:	83 c0 6c             	add    $0x6c,%eax
    a73f:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a746:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a74a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a74e:	7e bc                	jle    a70c <inv_mdct+0x159>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a750:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a757:	eb 13                	jmp    a76c <inv_mdct+0x1b9>
         win[3][i] =1.0;
    a759:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a75c:	83 c0 6c             	add    $0x6c,%eax
    a75f:	d9 e8                	fld1   
    a761:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a768:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a76c:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a770:	7e e7                	jle    a759 <inv_mdct+0x1a6>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a772:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    a779:	eb 36                	jmp    a7b1 <inv_mdct+0x1fe>
         win[3][i] = sin( PI/36*(i+0.5) );
    a77b:	db 45 f4             	fildl  -0xc(%ebp)
    a77e:	dd 05 50 e0 00 00    	fldl   0xe050
    a784:	de c1                	faddp  %st,%st(1)
    a786:	dd 05 58 e0 00 00    	fldl   0xe058
    a78c:	de c9                	fmulp  %st,%st(1)
    a78e:	83 ec 08             	sub    $0x8,%esp
    a791:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a795:	dd 1c 24             	fstpl  (%esp)
    a798:	e8 8f a6 ff ff       	call   4e2c <sin>
    a79d:	83 c4 10             	add    $0x10,%esp
    a7a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a7a3:	83 c0 6c             	add    $0x6c,%eax
    a7a6:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a7ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a7b1:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a7b5:	7e c4                	jle    a77b <inv_mdct+0x1c8>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a7b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a7be:	eb 36                	jmp    a7f6 <inv_mdct+0x243>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    a7c0:	db 45 f4             	fildl  -0xc(%ebp)
    a7c3:	dd 05 50 e0 00 00    	fldl   0xe050
    a7c9:	de c1                	faddp  %st,%st(1)
    a7cb:	dd 05 40 e0 00 00    	fldl   0xe040
    a7d1:	de c9                	fmulp  %st,%st(1)
    a7d3:	83 ec 08             	sub    $0x8,%esp
    a7d6:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a7da:	dd 1c 24             	fstpl  (%esp)
    a7dd:	e8 4a a6 ff ff       	call   4e2c <sin>
    a7e2:	83 c4 10             	add    $0x10,%esp
    a7e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a7e8:	83 c0 48             	add    $0x48,%eax
    a7eb:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a7f2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a7f6:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a7fa:	7e c4                	jle    a7c0 <inv_mdct+0x20d>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a7fc:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a803:	eb 13                	jmp    a818 <inv_mdct+0x265>
         win[2][i] = 0.0 ;
    a805:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a808:	83 c0 48             	add    $0x48,%eax
    a80b:	d9 ee                	fldz   
    a80d:	dd 1c c5 80 00 01 00 	fstpl  0x10080(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a814:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a818:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a81c:	7e e7                	jle    a805 <inv_mdct+0x252>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a81e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a825:	eb 2b                	jmp    a852 <inv_mdct+0x29f>
         COS[i] = cos(PI/(2*36) * i);
    a827:	db 45 f4             	fildl  -0xc(%ebp)
    a82a:	dd 05 70 e0 00 00    	fldl   0xe070
    a830:	de c9                	fmulp  %st,%st(1)
    a832:	83 ec 08             	sub    $0x8,%esp
    a835:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a839:	dd 1c 24             	fstpl  (%esp)
    a83c:	e8 8a a6 ff ff       	call   4ecb <cos>
    a841:	83 c4 10             	add    $0x10,%esp
    a844:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a847:	dd 1c c5 00 05 01 00 	fstpl  0x10500(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a84e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a852:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    a859:	7e cc                	jle    a827 <inv_mdct+0x274>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    a85b:	a1 40 00 01 00       	mov    0x10040,%eax
    a860:	83 c0 01             	add    $0x1,%eax
    a863:	a3 40 00 01 00       	mov    %eax,0x10040
    }

    for(i=0;i<36;i++)
    a868:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a86f:	eb 17                	jmp    a888 <inv_mdct+0x2d5>
       out[i]=0;
    a871:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a874:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a87b:	8b 45 0c             	mov    0xc(%ebp),%eax
    a87e:	01 d0                	add    %edx,%eax
    a880:	d9 ee                	fldz   
    a882:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    a884:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a888:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a88c:	7e e3                	jle    a871 <inv_mdct+0x2be>
       out[i]=0;

    if(block_type == 2){
    a88e:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    a892:	0f 85 8f 01 00 00    	jne    aa27 <inv_mdct+0x474>
       N=12;
    a898:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    a89f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a8a6:	e9 6d 01 00 00       	jmp    aa18 <inv_mdct+0x465>
          for(p= 0;p<N;p++){
    a8ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a8b2:	e9 e9 00 00 00       	jmp    a9a0 <inv_mdct+0x3ed>
             sum = 0.0;
    a8b7:	d9 ee                	fldz   
    a8b9:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    a8bc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a8c3:	e9 99 00 00 00       	jmp    a961 <inv_mdct+0x3ae>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    a8c8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a8cb:	89 d0                	mov    %edx,%eax
    a8cd:	01 c0                	add    %eax,%eax
    a8cf:	01 c2                	add    %eax,%edx
    a8d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a8d4:	01 d0                	add    %edx,%eax
    a8d6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a8dd:	8b 45 08             	mov    0x8(%ebp),%eax
    a8e0:	01 d0                	add    %edx,%eax
    a8e2:	dd 00                	fldl   (%eax)
    a8e4:	dd 9d 70 ff ff ff    	fstpl  -0x90(%ebp)
    a8ea:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a8ed:	01 c0                	add    %eax,%eax
    a8ef:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    a8f5:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    a8fb:	dd 05 78 e0 00 00    	fldl   0xe078
    a901:	de f1                	fdivp  %st,%st(1)
    a903:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a906:	01 c0                	add    %eax,%eax
    a908:	8d 50 01             	lea    0x1(%eax),%edx
    a90b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a90e:	89 c1                	mov    %eax,%ecx
    a910:	c1 e9 1f             	shr    $0x1f,%ecx
    a913:	01 c8                	add    %ecx,%eax
    a915:	d1 f8                	sar    %eax
    a917:	01 d0                	add    %edx,%eax
    a919:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    a91f:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    a925:	de c9                	fmulp  %st,%st(1)
    a927:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a92a:	01 c0                	add    %eax,%eax
    a92c:	83 c0 01             	add    $0x1,%eax
    a92f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    a935:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    a93b:	de c9                	fmulp  %st,%st(1)
    a93d:	83 ec 08             	sub    $0x8,%esp
    a940:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a944:	dd 1c 24             	fstpl  (%esp)
    a947:	e8 7f a5 ff ff       	call   4ecb <cos>
    a94c:	83 c4 10             	add    $0x10,%esp
    a94f:	dc 8d 70 ff ff ff    	fmull  -0x90(%ebp)
    a955:	dd 45 e0             	fldl   -0x20(%ebp)
    a958:	de c1                	faddp  %st,%st(1)
    a95a:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    a95d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a961:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a964:	89 c2                	mov    %eax,%edx
    a966:	c1 ea 1f             	shr    $0x1f,%edx
    a969:	01 d0                	add    %edx,%eax
    a96b:	d1 f8                	sar    %eax
    a96d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a970:	0f 8f 52 ff ff ff    	jg     a8c8 <inv_mdct+0x315>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    a976:	8b 55 10             	mov    0x10(%ebp),%edx
    a979:	89 d0                	mov    %edx,%eax
    a97b:	c1 e0 03             	shl    $0x3,%eax
    a97e:	01 d0                	add    %edx,%eax
    a980:	c1 e0 02             	shl    $0x2,%eax
    a983:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a986:	01 d0                	add    %edx,%eax
    a988:	dd 04 c5 80 00 01 00 	fldl   0x10080(,%eax,8)
    a98f:	dc 4d e0             	fmull  -0x20(%ebp)
    a992:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a995:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    a99c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a9a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a9a3:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a9a6:	0f 8c 0b ff ff ff    	jl     a8b7 <inv_mdct+0x304>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a9ac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a9b3:	eb 57                	jmp    aa0c <inv_mdct+0x459>
             out[6*i+p+6] += tmp[p];
    a9b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a9b8:	89 d0                	mov    %edx,%eax
    a9ba:	01 c0                	add    %eax,%eax
    a9bc:	01 d0                	add    %edx,%eax
    a9be:	01 c0                	add    %eax,%eax
    a9c0:	89 c2                	mov    %eax,%edx
    a9c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a9c5:	01 d0                	add    %edx,%eax
    a9c7:	83 c0 06             	add    $0x6,%eax
    a9ca:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a9d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    a9d4:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a9d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a9da:	89 d0                	mov    %edx,%eax
    a9dc:	01 c0                	add    %eax,%eax
    a9de:	01 d0                	add    %edx,%eax
    a9e0:	01 c0                	add    %eax,%eax
    a9e2:	89 c2                	mov    %eax,%edx
    a9e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a9e7:	01 d0                	add    %edx,%eax
    a9e9:	83 c0 06             	add    $0x6,%eax
    a9ec:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a9f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    a9f6:	01 d0                	add    %edx,%eax
    a9f8:	dd 00                	fldl   (%eax)
    a9fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a9fd:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    aa04:	de c1                	faddp  %st,%st(1)
    aa06:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    aa08:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    aa0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aa0f:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    aa12:	7c a1                	jl     a9b5 <inv_mdct+0x402>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    aa14:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    aa18:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    aa1c:	0f 8e 89 fe ff ff    	jle    a8ab <inv_mdct+0x2f8>
    aa22:	e9 da 00 00 00       	jmp    ab01 <inv_mdct+0x54e>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    aa27:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    aa2e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    aa35:	e9 bb 00 00 00       	jmp    aaf5 <inv_mdct+0x542>
         sum = 0.0;
    aa3a:	d9 ee                	fldz   
    aa3c:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    aa3f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    aa46:	eb 6a                	jmp    aab2 <inv_mdct+0x4ff>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    aa48:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa4b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    aa52:	8b 45 08             	mov    0x8(%ebp),%eax
    aa55:	01 d0                	add    %edx,%eax
    aa57:	dd 00                	fldl   (%eax)
    aa59:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aa5c:	01 c0                	add    %eax,%eax
    aa5e:	8d 50 01             	lea    0x1(%eax),%edx
    aa61:	8b 45 dc             	mov    -0x24(%ebp),%eax
    aa64:	89 c1                	mov    %eax,%ecx
    aa66:	c1 e9 1f             	shr    $0x1f,%ecx
    aa69:	01 c8                	add    %ecx,%eax
    aa6b:	d1 f8                	sar    %eax
    aa6d:	01 c2                	add    %eax,%edx
    aa6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa72:	01 c0                	add    %eax,%eax
    aa74:	83 c0 01             	add    $0x1,%eax
    aa77:	89 d1                	mov    %edx,%ecx
    aa79:	0f af c8             	imul   %eax,%ecx
    aa7c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    aa81:	89 c8                	mov    %ecx,%eax
    aa83:	f7 ea                	imul   %edx
    aa85:	c1 fa 05             	sar    $0x5,%edx
    aa88:	89 c8                	mov    %ecx,%eax
    aa8a:	c1 f8 1f             	sar    $0x1f,%eax
    aa8d:	29 c2                	sub    %eax,%edx
    aa8f:	89 d0                	mov    %edx,%eax
    aa91:	c1 e0 03             	shl    $0x3,%eax
    aa94:	01 d0                	add    %edx,%eax
    aa96:	c1 e0 04             	shl    $0x4,%eax
    aa99:	29 c1                	sub    %eax,%ecx
    aa9b:	89 ca                	mov    %ecx,%edx
    aa9d:	dd 04 d5 00 05 01 00 	fldl   0x10500(,%edx,8)
    aaa4:	de c9                	fmulp  %st,%st(1)
    aaa6:	dd 45 e0             	fldl   -0x20(%ebp)
    aaa9:	de c1                	faddp  %st,%st(1)
    aaab:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    aaae:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    aab2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    aab5:	89 c2                	mov    %eax,%edx
    aab7:	c1 ea 1f             	shr    $0x1f,%edx
    aaba:	01 d0                	add    %edx,%eax
    aabc:	d1 f8                	sar    %eax
    aabe:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    aac1:	7f 85                	jg     aa48 <inv_mdct+0x495>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    aac3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aac6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    aacd:	8b 45 0c             	mov    0xc(%ebp),%eax
    aad0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    aad3:	8b 55 10             	mov    0x10(%ebp),%edx
    aad6:	89 d0                	mov    %edx,%eax
    aad8:	c1 e0 03             	shl    $0x3,%eax
    aadb:	01 d0                	add    %edx,%eax
    aadd:	c1 e0 02             	shl    $0x2,%eax
    aae0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    aae3:	01 d0                	add    %edx,%eax
    aae5:	dd 04 c5 80 00 01 00 	fldl   0x10080(,%eax,8)
    aaec:	dc 4d e0             	fmull  -0x20(%ebp)
    aaef:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    aaf1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    aaf5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aaf8:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    aafb:	0f 8c 39 ff ff ff    	jl     aa3a <inv_mdct+0x487>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    ab01:	c9                   	leave  
    ab02:	c3                   	ret    

0000ab03 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    ab03:	55                   	push   %ebp
    ab04:	89 e5                	mov    %esp,%ebp
    ab06:	53                   	push   %ebx
    ab07:	81 ec 44 01 00 00    	sub    $0x144,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    ab0d:	a1 04 ff 00 00       	mov    0xff04,%eax
    ab12:	85 c0                	test   %eax,%eax
    ab14:	74 6f                	je     ab85 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    ab16:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    ab1d:	eb 56                	jmp    ab75 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    ab1f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    ab26:	eb 43                	jmp    ab6b <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    ab28:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    ab2f:	eb 30                	jmp    ab61 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    ab31:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ab34:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    ab37:	89 c2                	mov    %eax,%edx
    ab39:	c1 e2 03             	shl    $0x3,%edx
    ab3c:	01 c2                	add    %eax,%edx
    ab3e:	8d 04 12             	lea    (%edx,%edx,1),%eax
    ab41:	89 c2                	mov    %eax,%edx
    ab43:	89 c8                	mov    %ecx,%eax
    ab45:	c1 e0 03             	shl    $0x3,%eax
    ab48:	01 c8                	add    %ecx,%eax
    ab4a:	c1 e0 06             	shl    $0x6,%eax
    ab4d:	01 c2                	add    %eax,%edx
    ab4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    ab52:	01 d0                	add    %edx,%eax
    ab54:	d9 ee                	fldz   
    ab56:	dd 1c c5 80 09 01 00 	fstpl  0x10980(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    ab5d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    ab61:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    ab65:	7e ca                	jle    ab31 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    ab67:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    ab6b:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    ab6f:	7e b7                	jle    ab28 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    ab71:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    ab75:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    ab79:	7e a4                	jle    ab1f <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    ab7b:	c7 05 04 ff 00 00 00 	movl   $0x0,0xff04
    ab82:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    ab85:	8b 45 18             	mov    0x18(%ebp),%eax
    ab88:	8b 40 10             	mov    0x10(%eax),%eax
    ab8b:	85 c0                	test   %eax,%eax
    ab8d:	74 10                	je     ab9f <III_hybrid+0x9c>
    ab8f:	8b 45 18             	mov    0x18(%ebp),%eax
    ab92:	8b 40 18             	mov    0x18(%eax),%eax
    ab95:	85 c0                	test   %eax,%eax
    ab97:	74 06                	je     ab9f <III_hybrid+0x9c>
    ab99:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    ab9d:	7e 08                	jle    aba7 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    ab9f:	8b 45 18             	mov    0x18(%ebp),%eax
    aba2:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    aba5:	eb 05                	jmp    abac <III_hybrid+0xa9>
    aba7:	b8 00 00 00 00       	mov    $0x0,%eax
    abac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    abaf:	83 ec 04             	sub    $0x4,%esp
    abb2:	ff 75 e4             	pushl  -0x1c(%ebp)
    abb5:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    abbb:	50                   	push   %eax
    abbc:	ff 75 08             	pushl  0x8(%ebp)
    abbf:	e8 ef f9 ff ff       	call   a5b3 <inv_mdct>
    abc4:	83 c4 10             	add    $0x10,%esp

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    abc7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    abce:	e9 83 00 00 00       	jmp    ac56 <III_hybrid+0x153>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    abd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    abd6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    abdd:	8b 45 0c             	mov    0xc(%ebp),%eax
    abe0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    abe3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    abe6:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    abed:	8b 45 10             	mov    0x10(%ebp),%eax
    abf0:	8b 4d 14             	mov    0x14(%ebp),%ecx
    abf3:	89 c2                	mov    %eax,%edx
    abf5:	c1 e2 03             	shl    $0x3,%edx
    abf8:	01 c2                	add    %eax,%edx
    abfa:	8d 04 12             	lea    (%edx,%edx,1),%eax
    abfd:	89 c2                	mov    %eax,%edx
    abff:	89 c8                	mov    %ecx,%eax
    ac01:	c1 e0 03             	shl    $0x3,%eax
    ac04:	01 c8                	add    %ecx,%eax
    ac06:	c1 e0 06             	shl    $0x6,%eax
    ac09:	01 c2                	add    %eax,%edx
    ac0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac0e:	01 d0                	add    %edx,%eax
    ac10:	dd 04 c5 80 09 01 00 	fldl   0x10980(,%eax,8)
    ac17:	de c1                	faddp  %st,%st(1)
    ac19:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    ac1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac1e:	83 c0 12             	add    $0x12,%eax
    ac21:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    ac28:	8b 45 10             	mov    0x10(%ebp),%eax
    ac2b:	8b 4d 14             	mov    0x14(%ebp),%ecx
    ac2e:	89 c2                	mov    %eax,%edx
    ac30:	c1 e2 03             	shl    $0x3,%edx
    ac33:	01 c2                	add    %eax,%edx
    ac35:	8d 04 12             	lea    (%edx,%edx,1),%eax
    ac38:	89 c2                	mov    %eax,%edx
    ac3a:	89 c8                	mov    %ecx,%eax
    ac3c:	c1 e0 03             	shl    $0x3,%eax
    ac3f:	01 c8                	add    %ecx,%eax
    ac41:	c1 e0 06             	shl    $0x6,%eax
    ac44:	01 c2                	add    %eax,%edx
    ac46:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac49:	01 d0                	add    %edx,%eax
    ac4b:	dd 1c c5 80 09 01 00 	fstpl  0x10980(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    ac52:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ac56:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    ac5a:	0f 8e 73 ff ff ff    	jle    abd3 <III_hybrid+0xd0>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    ac60:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    ac63:	c9                   	leave  
    ac64:	c3                   	ret    

0000ac65 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    ac65:	55                   	push   %ebp
    ac66:	89 e5                	mov    %esp,%ebp
    ac68:	57                   	push   %edi
    ac69:	56                   	push   %esi
    ac6a:	53                   	push   %ebx
    ac6b:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    ac6e:	be 00 00 00 00       	mov    $0x0,%esi
    ac73:	e9 1a 01 00 00       	jmp    ad92 <create_syn_filter+0x12d>
		for (k=0; k<32; k++) {
    ac78:	bb 00 00 00 00       	mov    $0x0,%ebx
    ac7d:	e9 04 01 00 00       	jmp    ad86 <create_syn_filter+0x121>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    ac82:	89 f0                	mov    %esi,%eax
    ac84:	c1 e0 08             	shl    $0x8,%eax
    ac87:	89 c2                	mov    %eax,%edx
    ac89:	8b 45 08             	mov    0x8(%ebp),%eax
    ac8c:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    ac8f:	89 75 dc             	mov    %esi,-0x24(%ebp)
    ac92:	db 45 dc             	fildl  -0x24(%ebp)
    ac95:	dd 05 80 e0 00 00    	fldl   0xe080
    ac9b:	de c9                	fmulp  %st,%st(1)
    ac9d:	dd 05 88 e0 00 00    	fldl   0xe088
    aca3:	de c1                	faddp  %st,%st(1)
    aca5:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    aca8:	83 c0 01             	add    $0x1,%eax
    acab:	89 45 dc             	mov    %eax,-0x24(%ebp)
    acae:	db 45 dc             	fildl  -0x24(%ebp)
    acb1:	de c9                	fmulp  %st,%st(1)
    acb3:	83 ec 08             	sub    $0x8,%esp
    acb6:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    acba:	dd 1c 24             	fstpl  (%esp)
    acbd:	e8 09 a2 ff ff       	call   4ecb <cos>
    acc2:	83 c4 10             	add    $0x10,%esp
    acc5:	dd 05 90 e0 00 00    	fldl   0xe090
    accb:	de c9                	fmulp  %st,%st(1)
    accd:	dd 1c df             	fstpl  (%edi,%ebx,8)
    acd0:	dd 04 df             	fldl   (%edi,%ebx,8)
    acd3:	d9 ee                	fldz   
    acd5:	d9 c9                	fxch   %st(1)
    acd7:	df e9                	fucomip %st(1),%st
    acd9:	dd d8                	fstp   %st(0)
    acdb:	72 41                	jb     ad1e <create_syn_filter+0xb9>
				filter[i][k] = (int)(filter[i][k]+0.5);
    acdd:	89 f0                	mov    %esi,%eax
    acdf:	c1 e0 08             	shl    $0x8,%eax
    ace2:	89 c2                	mov    %eax,%edx
    ace4:	8b 45 08             	mov    0x8(%ebp),%eax
    ace7:	01 c2                	add    %eax,%edx
    ace9:	89 f0                	mov    %esi,%eax
    aceb:	c1 e0 08             	shl    $0x8,%eax
    acee:	89 c1                	mov    %eax,%ecx
    acf0:	8b 45 08             	mov    0x8(%ebp),%eax
    acf3:	01 c8                	add    %ecx,%eax
    acf5:	dd 04 d8             	fldl   (%eax,%ebx,8)
    acf8:	dd 05 50 e0 00 00    	fldl   0xe050
    acfe:	de c1                	faddp  %st,%st(1)
    ad00:	d9 7d e6             	fnstcw -0x1a(%ebp)
    ad03:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    ad07:	b4 0c                	mov    $0xc,%ah
    ad09:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    ad0d:	d9 6d e4             	fldcw  -0x1c(%ebp)
    ad10:	db 5d dc             	fistpl -0x24(%ebp)
    ad13:	d9 6d e6             	fldcw  -0x1a(%ebp)
    ad16:	db 45 dc             	fildl  -0x24(%ebp)
    ad19:	dd 1c da             	fstpl  (%edx,%ebx,8)
    ad1c:	eb 3f                	jmp    ad5d <create_syn_filter+0xf8>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    ad1e:	89 f0                	mov    %esi,%eax
    ad20:	c1 e0 08             	shl    $0x8,%eax
    ad23:	89 c2                	mov    %eax,%edx
    ad25:	8b 45 08             	mov    0x8(%ebp),%eax
    ad28:	01 c2                	add    %eax,%edx
    ad2a:	89 f0                	mov    %esi,%eax
    ad2c:	c1 e0 08             	shl    $0x8,%eax
    ad2f:	89 c1                	mov    %eax,%ecx
    ad31:	8b 45 08             	mov    0x8(%ebp),%eax
    ad34:	01 c8                	add    %ecx,%eax
    ad36:	dd 04 d8             	fldl   (%eax,%ebx,8)
    ad39:	dd 05 50 e0 00 00    	fldl   0xe050
    ad3f:	de e9                	fsubrp %st,%st(1)
    ad41:	d9 7d e6             	fnstcw -0x1a(%ebp)
    ad44:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    ad48:	b4 0c                	mov    $0xc,%ah
    ad4a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    ad4e:	d9 6d e4             	fldcw  -0x1c(%ebp)
    ad51:	db 5d dc             	fistpl -0x24(%ebp)
    ad54:	d9 6d e6             	fldcw  -0x1a(%ebp)
    ad57:	db 45 dc             	fildl  -0x24(%ebp)
    ad5a:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    ad5d:	89 f0                	mov    %esi,%eax
    ad5f:	c1 e0 08             	shl    $0x8,%eax
    ad62:	89 c2                	mov    %eax,%edx
    ad64:	8b 45 08             	mov    0x8(%ebp),%eax
    ad67:	01 d0                	add    %edx,%eax
    ad69:	89 f2                	mov    %esi,%edx
    ad6b:	89 d1                	mov    %edx,%ecx
    ad6d:	c1 e1 08             	shl    $0x8,%ecx
    ad70:	8b 55 08             	mov    0x8(%ebp),%edx
    ad73:	01 ca                	add    %ecx,%edx
    ad75:	dd 04 da             	fldl   (%edx,%ebx,8)
    ad78:	dd 05 98 e0 00 00    	fldl   0xe098
    ad7e:	de c9                	fmulp  %st,%st(1)
    ad80:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    ad83:	83 c3 01             	add    $0x1,%ebx
    ad86:	83 fb 1f             	cmp    $0x1f,%ebx
    ad89:	0f 8e f3 fe ff ff    	jle    ac82 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    ad8f:	83 c6 01             	add    $0x1,%esi
    ad92:	83 fe 3f             	cmp    $0x3f,%esi
    ad95:	0f 8e dd fe ff ff    	jle    ac78 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    ad9b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    ad9e:	5b                   	pop    %ebx
    ad9f:	5e                   	pop    %esi
    ada0:	5f                   	pop    %edi
    ada1:	5d                   	pop    %ebp
    ada2:	c3                   	ret    

0000ada3 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    ada3:	55                   	push   %ebp
    ada4:	89 e5                	mov    %esp,%ebp
    ada6:	57                   	push   %edi
    ada7:	56                   	push   %esi
    ada8:	53                   	push   %ebx
    ada9:	81 ec 04 10 00 00    	sub    $0x1004,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    adaf:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    adb5:	bb 00 d0 00 00       	mov    $0xd000,%ebx
    adba:	ba 00 04 00 00       	mov    $0x400,%edx
    adbf:	89 c7                	mov    %eax,%edi
    adc1:	89 de                	mov    %ebx,%esi
    adc3:	89 d1                	mov    %edx,%ecx
    adc5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    adc7:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    adcd:	89 45 08             	mov    %eax,0x8(%ebp)
}
    add0:	81 c4 04 10 00 00    	add    $0x1004,%esp
    add6:	5b                   	pop    %ebx
    add7:	5e                   	pop    %esi
    add8:	5f                   	pop    %edi
    add9:	5d                   	pop    %ebp
    adda:	c3                   	ret    

0000addb <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    addb:	55                   	push   %ebp
    addc:	89 e5                	mov    %esp,%ebp
    adde:	57                   	push   %edi
    addf:	56                   	push   %esi
    ade0:	53                   	push   %ebx
    ade1:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    ade4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    adeb:	a1 08 ff 00 00       	mov    0xff08,%eax
    adf0:	85 c0                	test   %eax,%eax
    adf2:	74 7a                	je     ae6e <SubBandSynthesis+0x93>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    adf4:	83 ec 08             	sub    $0x8,%esp
    adf7:	68 00 e0 00 00       	push   $0xe000
    adfc:	68 00 40 00 00       	push   $0x4000
    ae01:	e8 af a7 ff ff       	call   55b5 <mem_alloc>
    ae06:	83 c4 10             	add    $0x10,%esp
    ae09:	a3 80 2d 01 00       	mov    %eax,0x12d80
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    ae0e:	83 ec 08             	sub    $0x8,%esp
    ae11:	68 03 e0 00 00       	push   $0xe003
    ae16:	68 00 40 00 00       	push   $0x4000
    ae1b:	e8 95 a7 ff ff       	call   55b5 <mem_alloc>
    ae20:	83 c4 10             	add    $0x10,%esp
    ae23:	a3 84 2d 01 00       	mov    %eax,0x12d84
		create_syn_filter(*filter);
    ae28:	a1 84 2d 01 00       	mov    0x12d84,%eax
    ae2d:	83 ec 0c             	sub    $0xc,%esp
    ae30:	50                   	push   %eax
    ae31:	e8 2f fe ff ff       	call   ac65 <create_syn_filter>
    ae36:	83 c4 10             	add    $0x10,%esp
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    ae39:	83 ec 08             	sub    $0x8,%esp
    ae3c:	68 06 e0 00 00       	push   $0xe006
    ae41:	68 00 10 00 00       	push   $0x1000
    ae46:	e8 6a a7 ff ff       	call   55b5 <mem_alloc>
    ae4b:	83 c4 10             	add    $0x10,%esp
    ae4e:	a3 88 2d 01 00       	mov    %eax,0x12d88
		read_syn_window(window);
    ae53:	a1 88 2d 01 00       	mov    0x12d88,%eax
    ae58:	83 ec 0c             	sub    $0xc,%esp
    ae5b:	50                   	push   %eax
    ae5c:	e8 42 ff ff ff       	call   ada3 <read_syn_window>
    ae61:	83 c4 10             	add    $0x10,%esp
		init = 0;
    ae64:	c7 05 08 ff 00 00 00 	movl   $0x0,0xff08
    ae6b:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    ae6e:	8b 45 0c             	mov    0xc(%ebp),%eax
    ae71:	8b 04 85 0c ff 00 00 	mov    0xff0c(,%eax,4),%eax
    ae78:	83 e8 40             	sub    $0x40,%eax
    ae7b:	25 ff 03 00 00       	and    $0x3ff,%eax
    ae80:	89 c2                	mov    %eax,%edx
    ae82:	8b 45 0c             	mov    0xc(%ebp),%eax
    ae85:	89 14 85 0c ff 00 00 	mov    %edx,0xff0c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    ae8c:	8b 15 80 2d 01 00    	mov    0x12d80,%edx
    ae92:	8b 45 0c             	mov    0xc(%ebp),%eax
    ae95:	8b 04 85 0c ff 00 00 	mov    0xff0c(,%eax,4),%eax
    ae9c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    ae9f:	c1 e1 0a             	shl    $0xa,%ecx
    aea2:	01 c8                	add    %ecx,%eax
    aea4:	c1 e0 03             	shl    $0x3,%eax
    aea7:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    aeaa:	bb 00 00 00 00       	mov    $0x0,%ebx
    aeaf:	eb 40                	jmp    aef1 <SubBandSynthesis+0x116>
		sum = 0;
    aeb1:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    aeb3:	be 00 00 00 00       	mov    $0x0,%esi
    aeb8:	eb 26                	jmp    aee0 <SubBandSynthesis+0x105>
			sum += bandPtr[k] * (*filter)[i][k];
    aeba:	89 f0                	mov    %esi,%eax
    aebc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    aec3:	8b 45 08             	mov    0x8(%ebp),%eax
    aec6:	01 d0                	add    %edx,%eax
    aec8:	dd 00                	fldl   (%eax)
    aeca:	a1 84 2d 01 00       	mov    0x12d84,%eax
    aecf:	89 da                	mov    %ebx,%edx
    aed1:	c1 e2 05             	shl    $0x5,%edx
    aed4:	01 f2                	add    %esi,%edx
    aed6:	dd 04 d0             	fldl   (%eax,%edx,8)
    aed9:	de c9                	fmulp  %st,%st(1)
    aedb:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    aedd:	83 c6 01             	add    $0x1,%esi
    aee0:	83 fe 1f             	cmp    $0x1f,%esi
    aee3:	7e d5                	jle    aeba <SubBandSynthesis+0xdf>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    aee5:	89 d8                	mov    %ebx,%eax
    aee7:	c1 e0 03             	shl    $0x3,%eax
    aeea:	01 f8                	add    %edi,%eax
    aeec:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    aeee:	83 c3 01             	add    $0x1,%ebx
    aef1:	83 fb 3f             	cmp    $0x3f,%ebx
    aef4:	7e bb                	jle    aeb1 <SubBandSynthesis+0xd6>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    aef6:	bf 00 00 00 00       	mov    $0x0,%edi
    aefb:	e9 c7 00 00 00       	jmp    afc7 <SubBandSynthesis+0x1ec>
		sum = 0;
    af00:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    af02:	bb 00 00 00 00       	mov    $0x0,%ebx
    af07:	eb 4c                	jmp    af55 <SubBandSynthesis+0x17a>
			k = j + (i<<5);
    af09:	89 d8                	mov    %ebx,%eax
    af0b:	c1 e0 05             	shl    $0x5,%eax
    af0e:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    af11:	a1 88 2d 01 00       	mov    0x12d88,%eax
    af16:	89 f2                	mov    %esi,%edx
    af18:	c1 e2 03             	shl    $0x3,%edx
    af1b:	01 d0                	add    %edx,%eax
    af1d:	dd 00                	fldl   (%eax)
    af1f:	a1 80 2d 01 00       	mov    0x12d80,%eax
    af24:	8d 53 01             	lea    0x1(%ebx),%edx
    af27:	d1 fa                	sar    %edx
    af29:	c1 e2 06             	shl    $0x6,%edx
    af2c:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    af2f:	8b 55 0c             	mov    0xc(%ebp),%edx
    af32:	8b 14 95 0c ff 00 00 	mov    0xff0c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    af39:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    af3b:	89 d1                	mov    %edx,%ecx
    af3d:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    af43:	8b 55 0c             	mov    0xc(%ebp),%edx
    af46:	c1 e2 0a             	shl    $0xa,%edx
    af49:	01 ca                	add    %ecx,%edx
    af4b:	dd 04 d0             	fldl   (%eax,%edx,8)
    af4e:	de c9                	fmulp  %st,%st(1)
    af50:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    af52:	83 c3 01             	add    $0x1,%ebx
    af55:	83 fb 0f             	cmp    $0xf,%ebx
    af58:	7e af                	jle    af09 <SubBandSynthesis+0x12e>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    af5a:	dd 05 a0 e0 00 00    	fldl   0xe0a0
    af60:	de c9                	fmulp  %st,%st(1)
    af62:	d9 7d d6             	fnstcw -0x2a(%ebp)
    af65:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    af69:	b4 0c                	mov    $0xc,%ah
    af6b:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    af6f:	d9 6d d4             	fldcw  -0x2c(%ebp)
    af72:	db 5d e0             	fistpl -0x20(%ebp)
    af75:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    af78:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    af7f:	7e 15                	jle    af96 <SubBandSynthesis+0x1bb>
    af81:	89 f8                	mov    %edi,%eax
    af83:	8d 14 00             	lea    (%eax,%eax,1),%edx
    af86:	8b 45 10             	mov    0x10(%ebp),%eax
    af89:	01 d0                	add    %edx,%eax
    af8b:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    af90:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    af94:	eb 2e                	jmp    afc4 <SubBandSynthesis+0x1e9>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    af96:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    af9d:	7d 15                	jge    afb4 <SubBandSynthesis+0x1d9>
    af9f:	89 f8                	mov    %edi,%eax
    afa1:	8d 14 00             	lea    (%eax,%eax,1),%edx
    afa4:	8b 45 10             	mov    0x10(%ebp),%eax
    afa7:	01 d0                	add    %edx,%eax
    afa9:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    afae:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    afb2:	eb 10                	jmp    afc4 <SubBandSynthesis+0x1e9>
			else                           samples[j] = foo;
    afb4:	89 f8                	mov    %edi,%eax
    afb6:	8d 14 00             	lea    (%eax,%eax,1),%edx
    afb9:	8b 45 10             	mov    0x10(%ebp),%eax
    afbc:	01 d0                	add    %edx,%eax
    afbe:	8b 55 e0             	mov    -0x20(%ebp),%edx
    afc1:	66 89 10             	mov    %dx,(%eax)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    afc4:	83 c7 01             	add    $0x1,%edi
    afc7:	83 ff 1f             	cmp    $0x1f,%edi
    afca:	0f 8e 30 ff ff ff    	jle    af00 <SubBandSynthesis+0x125>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    afd0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    afd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    afd6:	5b                   	pop    %ebx
    afd7:	5e                   	pop    %esi
    afd8:	5f                   	pop    %edi
    afd9:	5d                   	pop    %ebp
    afda:	c3                   	ret    

0000afdb <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    afdb:	55                   	push   %ebp
    afdc:	89 e5                	mov    %esp,%ebp
    afde:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    afe1:	8b 45 10             	mov    0x10(%ebp),%eax
    afe4:	8b 40 08             	mov    0x8(%eax),%eax
    afe7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    afea:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    aff1:	eb 75                	jmp    b068 <out_fifo+0x8d>
    aff3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    affa:	eb 62                	jmp    b05e <out_fifo+0x83>
            (*psampFrames)++;
    affc:	8b 45 14             	mov    0x14(%ebp),%eax
    afff:	8b 00                	mov    (%eax),%eax
    b001:	8d 50 01             	lea    0x1(%eax),%edx
    b004:	8b 45 14             	mov    0x14(%ebp),%eax
    b007:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    b009:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b010:	eb 40                	jmp    b052 <out_fifo+0x77>
                if (!(k%1600) && k) {
    b012:	8b 0d 8c 2d 01 00    	mov    0x12d8c,%ecx
    b018:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    b01d:	89 c8                	mov    %ecx,%eax
    b01f:	f7 ea                	imul   %edx
    b021:	c1 fa 09             	sar    $0x9,%edx
    b024:	89 c8                	mov    %ecx,%eax
    b026:	c1 f8 1f             	sar    $0x1f,%eax
    b029:	29 c2                	sub    %eax,%edx
    b02b:	89 d0                	mov    %edx,%eax
    b02d:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    b033:	29 c1                	sub    %eax,%ecx
    b035:	89 c8                	mov    %ecx,%eax
    b037:	85 c0                	test   %eax,%eax
    b039:	75 13                	jne    b04e <out_fifo+0x73>
    b03b:	a1 8c 2d 01 00       	mov    0x12d8c,%eax
    b040:	85 c0                	test   %eax,%eax
    b042:	74 0a                	je     b04e <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    b044:	c7 05 8c 2d 01 00 00 	movl   $0x0,0x12d8c
    b04b:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    b04e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b052:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b055:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    b058:	7c b8                	jl     b012 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    b05a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    b05e:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    b062:	7e 98                	jle    affc <out_fifo+0x21>
    b064:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    b068:	8b 45 fc             	mov    -0x4(%ebp),%eax
    b06b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    b06e:	7c 83                	jl     aff3 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    b070:	c9                   	leave  
    b071:	c3                   	ret    

0000b072 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    b072:	55                   	push   %ebp
    b073:	89 e5                	mov    %esp,%ebp
    b075:	83 ec 08             	sub    $0x8,%esp
    *old_crc = getbits(bs, 16);
    b078:	83 ec 08             	sub    $0x8,%esp
    b07b:	6a 10                	push   $0x10
    b07d:	ff 75 08             	pushl  0x8(%ebp)
    b080:	e8 14 a8 ff ff       	call   5899 <getbits>
    b085:	83 c4 10             	add    $0x10,%esp
    b088:	89 c2                	mov    %eax,%edx
    b08a:	8b 45 0c             	mov    0xc(%ebp),%eax
    b08d:	89 10                	mov    %edx,(%eax)
}
    b08f:	c9                   	leave  
    b090:	c3                   	ret    

0000b091 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    b091:	55                   	push   %ebp
    b092:	89 e5                	mov    %esp,%ebp
    b094:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b097:	8b 45 08             	mov    0x8(%ebp),%eax
    b09a:	8b 40 0c             	mov    0xc(%eax),%eax
    b09d:	83 c0 1e             	add    $0x1e,%eax
    b0a0:	8b 14 85 00 fa 00 00 	mov    0xfa00(,%eax,4),%edx
    b0a7:	89 d0                	mov    %edx,%eax
    b0a9:	c1 e0 03             	shl    $0x3,%eax
    b0ac:	01 d0                	add    %edx,%eax
    b0ae:	c1 e0 04             	shl    $0x4,%eax
    b0b1:	89 45 e8             	mov    %eax,-0x18(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
    b0b4:	db 45 e8             	fildl  -0x18(%ebp)
    b0b7:	8b 45 08             	mov    0x8(%ebp),%eax
    b0ba:	8b 40 10             	mov    0x10(%eax),%eax
    b0bd:	dd 04 c5 c0 fa 00 00 	fldl   0xfac0(,%eax,8)
    b0c4:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    b0c6:	d9 7d ee             	fnstcw -0x12(%ebp)
    b0c9:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
    b0cd:	b4 0c                	mov    $0xc,%ah
    b0cf:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    b0d3:	d9 6d ec             	fldcw  -0x14(%ebp)
    b0d6:	db 5d fc             	fistpl -0x4(%ebp)
    b0d9:	d9 6d ee             	fldcw  -0x12(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    b0dc:	8b 45 08             	mov    0x8(%ebp),%eax
    b0df:	8b 40 14             	mov    0x14(%eax),%eax
    b0e2:	85 c0                	test   %eax,%eax
    b0e4:	74 04                	je     b0ea <main_data_slots+0x59>
    b0e6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    b0ea:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    b0ee:	8b 45 08             	mov    0x8(%ebp),%eax
    b0f1:	8b 40 08             	mov    0x8(%eax),%eax
    b0f4:	85 c0                	test   %eax,%eax
    b0f6:	74 04                	je     b0fc <main_data_slots+0x6b>
		nSlots -= 2;
    b0f8:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    b0fc:	8b 45 10             	mov    0x10(%ebp),%eax
    b0ff:	83 f8 01             	cmp    $0x1,%eax
    b102:	75 06                	jne    b10a <main_data_slots+0x79>
		nSlots -= 17;
    b104:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    b108:	eb 04                	jmp    b10e <main_data_slots+0x7d>
	else
		nSlots -=32;
    b10a:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    b10e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    b111:	c9                   	leave  
    b112:	c3                   	ret    
